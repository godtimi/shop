<template>
  <div>
    <!--        搜索框-->
    <div style="padding: 10px 0">
      <el-input style="width: 200px " placeholder="请输入名称" suffix-icon="el-icon-search" class="ml-5"
                v-model="name"></el-input>
      <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
      <el-button class="ml-5" type="warning" @click="reset">重置</el-button>
    </div>

    <el-table :data="tableData" border stripe style="padding-left: 55px">
      <el-table-column label="ID" type="index" width="400px">
      </el-table-column>
      <el-table-column prop="username" label="用户帐号">
      </el-table-column>
      <el-table-column label="收藏商品">
        <template slot-scope="scope">
          <el-button type="primary" @click="viewCollection(scope.row)">查看</el-button>
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
    <el-dialog title="商品信息" :visible.sync="dialogFormVisible" width="70%">
      <el-table :data="productList" border stripe style="padding-left: 55px">
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
        <el-table-column prop="description" label="描述">
        </el-table-column>
        <el-table-column prop="unit" label="单位">
        </el-table-column>
        <el-table-column prop="store" label="sku库存">
        </el-table-column>
        <el-table-column label="上架时间">
          <template slot-scope="scope">
            {{ scope.row.createTime | formatDate }}
          </template>
        </el-table-column>

        <el-table-column label="操作" width="280" align="center">
          <template slot-scope="scop">
            <template>
              <el-popconfirm
                  class="ml-5"
                  confirm-button-text='确定'
                  cancel-button-text='我再想想'
                  title="您确定移除吗？"
                  @confirm="dell(scop.row)"
              >
                <el-button type="danger" slot="reference">移除<i class="el-icon-remove-outline"></i>
                </el-button>
              </el-popconfirm>
            </template>
          </template>
        </el-table-column>
      </el-table>
    </el-dialog>

  </div>
</template>

<script>
export default {
  name: "Collection",
  data() {
    return {
      view: "",
      username: "",
      img: '',
      productList: [],
      product: {},
      value1: '',
      //默认展开的数组
      expends: [],
      //有的权限
      checks: [],
      menuData: [],
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
      menuDiaVisible: false,
      form: {},
      multipleSelection: [],
      props: {
        label: "name"
      },
    }
  },

  //页面创建就执行这个函数
  created() {
    //请求分页查询数据
    this.load()
  },
  methods: {
    dell(row) {
      this.request.delete("/collection/" + row.id + "/" + this.username).then(res => {
        if (res.code === '200') {
          this.$message.success("移除成功")
          this.request.get("/collection/" + this.username).then(res => {
            console.log(res)
            this.productList = res.data
          })
        } else {
          this.$message.error("移除失败")
        }
      })


    },
    viewCollection(row) {
      this.username = row.username
      this.dialogFormVisible = true
      this.request.get("/collection/" + row.username).then(res => {
        if (res.code === '200') {
          this.productList = res.data
        } else {
          this.$message.error("操作失败")
        }
      })
    },
    cancel() {
      this.dialogFormVisible = false
      this.load()
    },
    handAdd() {
      this.dialogFormVisible = true;
      this.form = {};
    },
    delBatch() {
      let ids = this.multipleSelection.map(v => v.id) //[{}，{}，{}] => [1,2,3] 对象数组变纯id数组
      this.request.post("/collection/del/batch", ids).then(res => {
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
      if (this.img !== "") {
        this.form.url = this.img
      }
      this.request.post("/collection", this.form).then(res => {
        if (res.code === '200') {
          this.$message.success("保存成功")
          this.dialogFormVisible = false
          this.load()
        } else {
          this.$message.error("保存失败")
        }
      })
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
      this.request.get("/collection/page", {
        params: {
          name: this.name,
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
