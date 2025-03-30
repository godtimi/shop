<template>
  <div>
    <!--        搜索框-->
    <div style="padding: 10px 0">
      <el-input style="width: 200px " placeholder="请输入名称" suffix-icon="el-icon-search" class="ml-5"
                v-model="username"></el-input>
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
      <el-table-column prop="id" label="ID" width="140">
      </el-table-column>
      <el-table-column prop="name" label="直播间名字">
      </el-table-column>
      <el-table-column prop="info" label="直播间标题">
      </el-table-column>
      <el-table-column prop="liveUrl" label="推流地址">
      </el-table-column>
      <el-table-column label="直播间封面">
        <template slot-scope="scope">
          <img :src="scope.row.url" alt="" style="height: 100px"/>
        </template>
      </el-table-column>
      <el-table-column label="小黄车商品">
        <template slot-scope="scop">
          <div>
            <el-button @click="viewProduct(scop.row) " style="margin-bottom: 5px">查看<i
                class="el-icon-edit"></i>
            </el-button>
          </div>
          <el-button type="success" plain @click="addProduct(scop.row)">上架<i
              class="el-icon-edit"></i>
          </el-button>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="200" align="center">
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
    <el-dialog title="直播信息" :visible.sync="dialogFormVisible" width="30%">
      <el-form label-width="80px" size="small">
        <el-form-item label="直播间名字" label-width="200">
          <el-input style="width: 300px" v-model="form.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="直播间标题" label-width="200">
          <el-input style="width: 300px" v-model="form.info" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item style="padding-left: 15px" label="推流地址" label-width="250">
          <el-input style="width: 300px" v-model="form.liveUrl" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="直播间封面" label-width="200">
          <el-upload action="http://localhost:9090/file/upload"
                     :show-file-list="false" accept="xlsx"
                     style="display: inline-block" class="mr-5"
                     :on-success="handleFileUploadSuccess">
            <el-button type="primary" class="ml-5">上传封面<i class="el-icon-top"></i></el-button>
          </el-upload>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>


    <el-dialog title="商品信息" :visible.sync="dialogFormVisible1" width="30%">
      <el-form label-width="80px" size="small">
        <el-form-item label="商品id" label-width="200">
          <el-input style="width: 300px" v-model="form.productId" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible1 = false">取 消</el-button>
        <el-button type="primary" @click="save1">确 定</el-button>
      </div>
    </el-dialog>

    <!--商品信息查看弹窗-->
    <el-dialog title="商品信息" :visible.sync="dialogFormVisible2" width="70%">
      <el-table :data="productList" border stripe @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55"></el-table-column>
        <el-table-column prop="id" label="ID">
        </el-table-column>
        <el-table-column prop="name" label="商品名称">
        </el-table-column>
        <el-table-column label="商品图片">
          <template slot-scope="scope">
            <img :src="scope.row.url" alt="" style="height: 100px"/>
          </template>
        </el-table-column>
        <el-table-column prop="sellPrice" label="￥价格(元)">
        </el-table-column>
        <el-table-column label="操作" width="200" align="center">
          <template slot-scope="scop">
            <template>
              <el-popconfirm
                  class="ml-5"
                  confirm-button-text='确定'
                  cancel-button-text='我再想想'
                  title="您确定下架吗？"
                  @confirm="del2(scop.row)"
              >
                <el-button type="danger" slot="reference">下架<i class="el-icon-remove-outline"></i>
                </el-button>
              </el-popconfirm>
            </template>
          </template>
        </el-table-column>

      </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="cancel">确 定</el-button>
      </div>
    </el-dialog>


  </div>
</template>

<script>
export default {
  name: "User",
  data() {
    return {
      username: "",
      email: "",
      address: "",
      total: 0,
      pageNum: 1,
      pageSize: 5,
      tableData: [],
      collapseBtnClass: 'el-icon-s-fold',
      isCollapse: false,
      sideWidth: 200,
      logoText: true,
      dialogFormVisible: false,
      dialogFormVisible1: false,
      dialogFormVisible2: false,
      form: {},
      multipleSelection: [],
      roles: [],
      productList: {}
    }
  },
  //页面创建就执行这个函数
  created() {
    //请求分页查询数据
    this.load()
  },
  methods: {
    del2(row) {
      console.log(row)
      this.request.delete("/live-product/" + row.id).then(res => {
        if (res.code === '200') {
          this.$message.success("删除成功")
          this.load()
          this.dialogFormVisible2 = false
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    cancel() {
      this.dialogFormVisible2 = false
    },
    save1() {
      this.request.post("/live-product", this.form).then(res => {
        if (res.code === '200') {
          this.$message.success("上架成功")
          this.load()
          this.dialogFormVisible1 = false
          this.form = {}
        } else {
          this.$message.error("上架失败")
        }
      })
    },
    viewProduct(row) {
      console.log(row)
      this.request.get("/live-product/" + row.id).then(res => {
        this.productList = res.data
        console.log(this.productList)
        this.dialogFormVisible2 = true
      })
    },
    addProduct(row) {
      console.log(row)
      this.form.liveId = row.id
      this.dialogFormVisible1 = true
    },
    handleFileUploadSuccess(res) {
      this.form.url = res
      this.$message.success("上传成功")
    },
    handleSelectionChange(val) {
      this.multipleSelection = val
    },
    del(id) {
      this.request.delete("/live/" + id).then(res => {
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
      this.request.post("/live/del/batch", ids).then(res => {
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
      this.request.post("/live", this.form).then(res => {
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
      this.username = ""
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
      this.request.get("/live/page", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          name: this.username,
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
