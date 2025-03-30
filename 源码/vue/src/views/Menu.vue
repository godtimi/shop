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

    <el-table :data="tableData" border stripe row-key="id" default-expand-all @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column prop="id" label="ID">
      </el-table-column>
      <el-table-column prop="name" label="名称">
      </el-table-column>
      <el-table-column prop="path" label="路径">
      </el-table-column>
      <el-table-column prop="pagePath" label="页面路径">
      </el-table-column>
      <el-table-column label="图标">
        <template slot-scope="scope">
          <i :class="scope.row.icon" style="font-size: 18px;align-content: center"></i>
        </template>
      </el-table-column>
      <el-table-column prop="description" label="描述">
      </el-table-column>
      <el-table-column label="操作" width="280" align="center">
        <template slot-scope="scop">
          <el-button type="primary" @click="handleAdd(scop.row.id)" v-if="!scop.row.pid && !scop.row.path">新增子菜单<i
              class="el-icon-plus"></i></el-button>
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
    <!--弹窗1-->
    <el-dialog title="菜单信息" :visible.sync="dialogFormVisible" width="30%">
      <el-form label-width="80px" size="small">
        <el-form-item label="名称">
          <el-input v-model="form.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="路径">
          <el-input v-model="form.path" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="页面路径">
          <el-input v-model="form.pagePath" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="图标">
          <el-select clearable v-model="form.icon" placeholder="请选择" style="width: 100%">
            <el-option v-for="item in option" :key="item.name" :label="item.name" :value="item.value">
              <i :class="item.value"></i> {{ item.name }}
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="描述信息">
          <el-input v-model="form.description" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
export default {
  name: "Menu",
  data() {
    return {
      option: [],
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
      form: {},
      multipleSelection: []
    }
  },
  //页面创建就执行这个函数
  created() {
    //请求分页查询数据
    this.load()
  },
  methods: {
    handleSelectionChange(val) {
      this.multipleSelection = val
    },
    del(id) {
      this.request.delete("/menu/" + id).then(res => {
        if (res.code === '200') {
          this.$message.success("删除成功")
          this.$store.commit("logout")
          // this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    delBatch() {
      let ids = this.multipleSelection.map(v => v.id) //[{}，{}，{}] => [1,2,3] 对象数组变纯id数组
      this.request.post("/menu/del/batch", ids).then(res => {
        if (res.code === '200') {
          this.$message.success("批量删除成功")
          // this.$store.commit("logout")
          // this.load()
        } else {
          this.$message.error("批量删除失败")
        }
      })
    },
    handelEdit(row) {
      this.form = row
      this.dialogFormVisible = true
      //请求图标数据
      this.request.get("/dict/icons").then(res => {
        this.option = res.data
      })

    },
    save() {
      this.request.post("/menu", this.form).then(res => {
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
      this.request.get("/dict/icons").then(res => {
        this.option = res.data
      })
    },
    handleAdd(pid) {
      this.dialogFormVisible = true;
      this.form = {};
      if (pid) {
        this.form.pid = pid
      }
      this.request.get("/dict/icons").then(res => {
        this.option = res.data
      })
    },
    reset() {
      this.name = ""
      this.load()
    },
    //点击收缩按钮触发
    collapse() {
      this.isCollapse = !this.isCollapse
      if (this.isCollapse) { //收缩
        this.sideWidth = 64;
        this.collapseBtnClass = 'el-icon-s-unfold';
        this.logoText = false;
      } else { //展开
        this.sideWidth = 200;
        this.collapseBtnClass = 'el-icon-s-fold';
        this.logoText = true;
      }
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
    handleExcelImportSuccess() {
      this.$message.success("文件导入成功")
      this.load()
    },
    //封装请求数据的方法
    load() {
      this.request.get("/menu", {
        params: {
          name: this.name,
        }
      }).then(res => {
        this.tableData = res.data
      })
    }
  }
}
</script>


<style scoped>
</style>
