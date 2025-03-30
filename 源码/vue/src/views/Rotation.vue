<template>
  <div>


    <div style="margin: 10px 0">
      <el-upload action="http://localhost:9090/file/upload"
                 :show-file-list="false" accept="xlsx"
                 style="display: inline-block" class="mr-5"
                 :on-success="handleFileUploadSuccess">
        <el-button type="primary" class="ml-5">上传轮播图<i class="el-icon-top"></i></el-button>
      </el-upload>
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

      <el-table-column label="预览">
        <template slot-scope="scope">
          <img :src="scope.row.url" alt="" style="height: 100px"/>
        </template>
      </el-table-column>

      <el-table-column label="启用">
        <template slot-scope="scope">
          <el-switch v-model="scope.row.enable" active-color="#13ce66" inactive-color="#ccc"
                     @change="changeEnable(scope)"></el-switch>
        </template>
      </el-table-column>

      <el-table-column label="操作" width="200" align="center">
        <template slot-scope="scop">
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
    <!--    分页查询-->
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
  </div>
</template>

<script>
export default {
  name: "Rotation",
  data() {
    return {
      tableData: [],
      multipleSelection: [],
      rotation: {},
      total: 0,
      pageNum: 1,
      pageSize: 5,
      name: ""
    }
  },
  created() {
    this.load()
  },
  methods: {
    changeEnable(scope) {
      this.rotation = scope.row
      this.request.post("/rotation", this.rotation).then(res => {
        if (res.code === '200') {
          this.$message.success("更新成功")
          this.load()
        } else {
          this.$message.error("更新失败")
        }
      })
    },
    download(scope) {
      window.open(scope.row.url)
    },
    handleSelectionChange(val) {
      this.multipleSelection = val
    },
    del(id) {
      this.request.delete("/rotation/" + id).then(res => {
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
      this.request.post("/rotation/del/batch", ids).then(res => {
        if (res.code === '200') {
          this.$message.success("批量删除成功")
          this.load()
        } else {
          this.$message.error("批量删除失败")
        }
      })
    },
    reset() {
      this.name = ""
      this.load()
    },
    //点击收缩按钮触发
    handleSizeChange(pageSize) {
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(pageNum) {
      this.pageNum = pageNum
      this.load()
    },
    handleFileUploadSuccess(res) {
      this.rotation.url = res
      this.request.post("/rotation", this.rotation).then(res => {
        if (res.code === '200') {
          this.$message.success("上传成功")
          this.load()
        } else {
          this.$message.error("上传失败")
        }
      })
    },
    //封装请求数据的方法
    load() {
      this.request.get("/rotation/page", {
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
