<template>
  <div style=" height: 458px ;min-width:900px; max-width:900px;margin: 0 auto">

    <div style="margin: 10px 0">
      <el-button type="primary" @click="handAdd" plain>新增<i class="el-icon-circle-plus-outline"></i></el-button>
    </div>

    <el-table :data="tableData" border stripe>
      <el-table-column prop="username" label="收货人姓名">
      </el-table-column>
      <el-table-column prop="phone" label="电话">
      </el-table-column>
      <el-table-column prop="address" label="地址">
      </el-table-column>
      <el-table-column prop="info" label="备注">
      </el-table-column>
      <el-table-column label="操作" width="200" align="center">
        <template slot-scope="scop">
          <el-button type="success" @click="handelEdit(scop.row)" plain>编辑<i class="el-icon-edit"></i></el-button>

          <template>
            <el-popconfirm
                class="ml-5"
                confirm-button-text='确定'
                cancel-button-text='我再想想'
                title="您确定删除吗？"
                @confirm="del(scop.row.id)"
            >
              <el-button type="danger" slot="reference" plain>删除<i class="el-icon-remove-outline"></i>
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
    <el-dialog title="用户信息" :visible.sync="dialogFormVisible" width="34%">
      <el-form label-width="100px" size="small">
        <el-form-item label="收货人姓名">
          <el-input v-model="form.username" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="电话">
          <el-input v-model="form.phone" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="地址">
          <el-input type="textarea" v-model="form.address" autocomplete="off" :rows="4"></el-input>
        </el-form-item>
        <el-form-item label="备注">
          <el-input v-model="form.info" autocomplete="off" :rows="4"></el-input>
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
  name: "Address",
  data() {
    return {
      username: "",
      email: "",
      address: "",
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
      multipleSelection: [],
      roles: []
    }
  },
  //页面创建就执行这个函数
  created() {
    //请求分页查询数据
    this.load()
  },
  methods: {
    del(id) {
      this.request.delete("/receiving/" + id).then(res => {
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
      this.request.post("/receiving/del/batch", ids).then(res => {
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
      this.request.post("/receiving", this.form).then(res => {
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
      this.request.get("/receiving/page", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
        }
      }).then(res => {
        this.tableData = res.data.records
        this.total = res.data.total
      })
    }
  }
}
</script>


<style scoped>

</style>