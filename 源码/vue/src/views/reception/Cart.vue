<template>
  <div>

    <div style="margin: 0 auto; width: 1048px;padding-top: 30px">
      <div>
        <!--        搜索框-->
        <div style="padding: 10px 0">
          <el-input style="width: 400px " size="medium" placeholder="请输入名称" class="ml-5"
                    v-model="name"></el-input>
          <el-button class="ml-5" type="primary" @click="load" size="medium"><i class="el-icon-search"></i>搜索
          </el-button>
        </div>


        <el-table :data="tableData" size="medium" @selection-change="handleSelectionChange"
                  :row-class-name="tableRowClassName">


          <el-table-column type="selection" width="55"
                           :selectable="checkSelectable"></el-table-column>

          <el-table-column prop="productId" label="商品图片" width="230px">
            <template v-slot="scope">
              <el-image style="width: 100px;height: 100px" :src="scope.row.productUrl"
                        :preview-src-list="[scope.row.productUrl]"></el-image>
            </template>
          </el-table-column>

          <el-table-column label="商品">
            <template slot-scope="scope">
              <el-tooltip v-if="scope.row.num > scope.row.store" effect="dark" content="商品库存不足" placement="top-start">
                <span>{{ scope.row.productName }}</span>
              </el-tooltip>
              <span v-else>{{ scope.row.productName }}</span>
            </template>
          </el-table-column>
          <el-table-column label="价格">
            <template slot-scope="scope">
              <span style="color: orangered">{{ scope.row.productPrice }}</span>
            </template>
          </el-table-column>
          <el-table-column prop="num" label="商品数量" width="200px">
            <template v-slot="scope">
              <el-input-number v-model="scope.row.num" :min="1" :max="100" label="数量"
                               @change="changeNum(scope.row)"></el-input-number>
            </template>
          </el-table-column>
          <el-table-column label="添加时间" width="160px">
            <template slot-scope="scope">
              {{ scope.row.createTime | formatDate }}
            </template>
          </el-table-column>


          <el-table-column label="操作" align="center">
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
        <!--        分页查询-->
        <div style="padding: 10px 0">
          <el-pagination
              @size-change="handleSizeChange"
              @current-change="handleCurrentChange"
              :current-page="pageNum"
              :page-sizes="[2, 5, 10, 20]"
              :page-size="pageSize"
              layout="total, prev, pager, next"
              :total="total">
          </el-pagination>
        </div>


        <div style="margin: 10px 0;text-align: right">
          <div style="margin-bottom:15px">
            当前已选商品总价 <span style="color: orangered;padding: 10px 0;">￥{{ allPrice }}</span>
          </div>

          <el-button style="color: white;background-color: orangered" @click="settleAccount" size="medium"> 结算
          </el-button>
        </div>

      </div>


      <div>
        <Lovely/>
      </div>

    </div>
  </div>
</template>

<script>

import Lovely from "@/views/reception/Lovely";

export default {
  name: "Crat",
  components: {Lovely},
  data() {
    return {
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
      allPrice: 0,
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
      flag: false,
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
    tableRowClassName({row, rowIndex}) {
      if (row.num > row.store) {
        this.flag = true
        return 'warning-row';
      }
    },
    checkSelectable(row) {
      return row.num <= row.store
    },
    settleAccount() {
      if (!this.multipleSelection.length || !this.multipleSelection.length) {
        this.$message.error("请选择要结算的商品")
        return
      }
      let data = {
        name: this.multipleSelection[0].productName,
        allPrice: this.allPrice,
        carts: this.multipleSelection
      }
      this.$store.commit("setData", data)
      sessionStorage.setItem('data', JSON.stringify(data));
      // console.log(data)
      // console.log(this.$store.state.data)
      this.$router.push("/reception/settlement")
      // this.request.post('/orders', data).then(res => {
      //   if (res.code === '200') {
      //     this.$message.success("结算成功")
      //     this.load()
      //   } else {
      //     this.$message.error("结算失败")
      //   }
      // })
    },
    changeNum(row) {
      this.allPrice = 0
      this.request.post("/cart/num/" + row.id + "/" + row.num).then(res => {
      })
      //计算总价格
      this.multipleSelection.forEach(item => {
        this.allPrice += item.productPrice * item.num
      })
      this.allPrice = this.allPrice.toFixed(2)
    },
    handleSelectionChange(val) {
      //初始化
      this.allPrice = 0

      this.multipleSelection = val
      // console.log(multipleSelection.store)
      //进行计算操作
      if (val && val.length) {
        val.forEach(item => {
          this.allPrice += item.productPrice * item.num
        })
        this.allPrice = this.allPrice.toFixed(2)
      }
    },
    del(id) {
      this.request.delete("/cart/" + id).then(res => {
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
      this.request.post("/cart/del/batch", ids).then(res => {
        if (res.code === '200') {
          this.$message.success("批量删除成功")
          this.load()
        } else {
          this.$message.error("批量删除失败")
        }
      })
    },
    save() {
      this.request.post("/cart", this.form).then(res => {
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
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(pageNum) {
      this.pageNum = pageNum
      this.load()
    },
    //封装请求数据的方法
    load() {
      if (!this.user.id) {
        this.$message.warning("请登录后操作")
        return
      }
      this.request.get("/cart/page", {
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


<style>
.el-table .warning-row {
  background: #fae8e8;
}

.el-table .success-row {
  background: #f0f9eb;
}

</style>
