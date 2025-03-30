<template>
  <div>
    <!--        搜索框-->
    <div style="padding: 10px 0">
      <el-input style="width: 200px " placeholder="请输入名称" suffix-icon="el-icon-search" class="ml-5"
                v-model="name"></el-input>
      <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
      <el-button class="ml-5" type="warning" @click="reset">重置</el-button>
    </div>

    <div style="margin: 10px 0">
      <el-button type="primary" @click="handAdd">新增<i class="el-icon-circle-plus-outline"></i></el-button>
      <el-popconfirm
          class="ml-5"
          confirm-button-text='确定'
          cancel-button-text='我再想想'
          title="您确定批量删除这些数据吗？"
          @confirm="delBatch"
      >
        <el-button type="danger" slot="reference">批量删除<i class="el-icon-remove-outline"></i></el-button>
      </el-popconfirm>

    </div>

    <el-table :data="tableData" border stripe @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column prop="id" label="ID">
      </el-table-column>
      <el-table-column prop="label" label="标签">
      </el-table-column>
      <el-table-column prop="title" label="标题">
      </el-table-column>

      <el-table-column label="内容">
        <template slot-scope="scope">
          <el-button plain @click="views(scope)">查看</el-button>
        </template>
      </el-table-column>

      <el-table-column label="状态">
        <template slot-scope="scope">
          <el-switch v-model="scope.row.enable" active-color="#13ce66" inactive-color="#ccc"
                     @change="changeEnable(scope)"></el-switch>
        </template>
      </el-table-column>


      <el-table-column label="创建时间">
        <template slot-scope="scope">
          {{ scope.row.createTime | formatDate }}
        </template>
      </el-table-column>


      <el-table-column label="操作" width="280" align="center">
        <template slot-scope="scop">
          <el-button type="success" @click="handelEdit(scop.row)">编辑<i class="el-icon-edit"></i></el-button>
          <template>
            <el-popconfirm
                class="ml-5"
                confirm-button-text='确定'
                cancel-button-text='我再想想'
                title="您确定删除吗？"
                @confirm="del(scop.row.id)"
            >
              <el-button type="danger" slot="reference">删除<i class="el-icon-remove-outline"></i>
              </el-button>
            </el-popconfirm>
          </template>
        </template>
      </el-table-column>

    </el-table>
    <!--        分页查询-->
    <div style="padding: 10px 0">
      <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="pageNum"
          :page-sizes="[2, 5, 10, 20]"
          :page-size="pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total">
      </el-pagination>
    </div>
    <!--弹窗-->
    <el-dialog title="文章信息" :visible.sync="dialogFormVisible" width="65%">
      <el-form label-width="80px" size="small">
        <el-form-item label="标签">
          <el-input v-model="form.label" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="标题">
          <el-input v-model="form.title" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="内容">

          <mavon-editor v-model="form.content" :ishljs="true" ref="md"
                        @imgAdd="imgAdd"/>

        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>


    <el-dialog title="内容" :visible.sync="dialogFormVisible1" width="65%">
      <el-form label-width="80px" size="small" v-if="this.content">
        <el-form-item label="内容">
          <mavon-editor v-model="content" :ishljs="true" ref="md"
                        @imgAdd="imgAdd"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible1 = false">返回</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Article",
  data() {
    return {
      content: '',
      name: "",
      total: 0,
      pageNum: 1,
      pageSize: 5,
      mag: "hello word!",
      tableData: [],
      collapseBtnClass: 'el-icon-s-fold',
      isCollapse: false,
      sideWidth: 200,
      logoText: true,
      dialogFormVisible: false,
      dialogFormVisible1: false,
      menuDiaVisible: false,
      form: {},
      multipleSelection: [],
      props: {
        label: "name"
      },
      roleId: 0,
      roleFlag: ''
    }
  },

  //页面创建就执行这个函数
  created() {
    //请求分页查询数据
    this.load()
  },
  methods: {
    views(scope) {
      this.request.get("/article/" + scope.row.id).then(res => {
        if (res.code === '200') {
          this.content = res.data.content
        } else {
          this.$message.error("请求数据失败")
        }
      })
      this.dialogFormVisible1 = true
    },
    imgAdd(pos, $file) {
      let $vm = this.$refs.md
      // 第一步.将图片上传到服务器.
      const formdata = new FormData();
      formdata.append('file', $file);
      axios({
        url: 'http://localhost:9090/file/upload',
        method: 'post',
        data: formdata,
        headers: {'Content-Type': 'multipart/form-data'},
      }).then((res) => {
        // 第二步.将返回的url替换到文本原位置![...](0) -> ![...](url)
        // $vm.$img2Url 详情见本页末尾
        $vm.$img2Url(pos, res.data);
      })
    },
    saveArticle() {
      this.request.post("/article", this.form).then(res => {
        if (res.code === '200') {
          this.$message.success("保存成功")
          this.dialogFormVisible = false
          this.load()
        } else {
          this.$message.error("保存失败")
        }
      })
    },
    changeEnable(scope) {
      this.form = JSON.parse(JSON.stringify(scope.row))
      this.request.post("/article", this.form).then(res => {

        if (res.code === '200') {
          this.$message.success("修改成功")
          this.load()
        } else {
          this.$message.error("启用失败")
        }
      })
    },
    handleSelectionChange(val) {
      this.multipleSelection = val
    },
    del(id) {
      this.request.delete("/article/" + id).then(res => {
        if (res.code === '200') {
          this.$message.success("删除成功")
          this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    delBatch() {
      let ids = this.multipleSelection.map(v => v.id) //[{}，{}，{}] => [1,2,3] 对象数组变纯id数组
      this.request.post("/article/del/batch", ids).then(res => {
        if (res.code === '200') {
          this.$message.success("批量删除成功")
          this.load()
        } else {
          this.$message.error("批量删除失败")
        }
      })
    },
    handelEdit(row) {
      this.form = row
      this.dialogFormVisible = true
    },
    save() {
      this.request.post("/article", this.form).then(res => {
        if (res.code === '200') {
          this.$message.success("保存成功")
          this.dialogFormVisible = false
          this.load()
        } else {
          this.$message.error("保存失败")
        }
      })
    },
    handAdd() {
      this.dialogFormVisible = true;
      this.form = {};
    },
    reset() {
      this.name = ""
      this.load()
    },
    handleSizeChange(pageSize) {
      console.log(pageSize)
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(pageNum) {
      console.log(pageNum)
      this.pageNum = pageNum
      this.load()
    },
    //封装请求数据的方法
    load() {
      this.request.get("/article/page", {
        params: {
          name: this.name,
          pageNum: this.pageNum,
          pageSize: this.pageSize,
        }
      }).then(res => {
        this.tableData = res.data.records
        console.log(this.tableData)
        this.total = res.data.total
      })
    }
  }
}
</script>


<style scoped>

</style>
