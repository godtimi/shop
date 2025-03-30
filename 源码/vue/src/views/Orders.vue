<template>
  <div>
    <!--        搜索框-->
    <div style="padding: 10px 0;margin-bottom: 35px">
      <el-input style="width: 200px " placeholder="请输入名称" suffix-icon="el-icon-search" class="ml-5"
                v-model="name"></el-input>
      <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
      <el-button class="ml-5" type="warning" @click="reset">重置</el-button>
    </div>

    <!--    <div style="margin: 10px 0">-->
    <!--      <el-popconfirm-->
    <!--          class="ml-5"-->
    <!--          confirm-button-text='确定'-->
    <!--          cancel-button-text='我再想想'-->
    <!--          title="您确定取消这些订单吗？"-->
    <!--          @confirm="delBatch"-->
    <!--      >-->
    <!--        <el-button type="danger" slot="reference">批量取消<i class="el-icon-remove-outline"></i></el-button>-->
    <!--      </el-popconfirm>-->

    <!--    </div>-->


    <template>
      <el-tabs v-model="activeName" type="card" @tab-click="handleClick">
        <el-tab-pane v-for="i in stateList" :key="i.id" :label="i.name">

          <div v-if="i.name!=='审核'">
            <el-table :data="tableData" border stripe @selection-change="handleSelectionChange">
              <el-table-column type="selection" width="55"></el-table-column>
              <el-table-column prop="id" label="ID">
              </el-table-column>
              <el-table-column prop="name" label="名称">
              </el-table-column>
              <el-table-column prop="no" label="订单编号">
              </el-table-column>
              <el-table-column prop="allPrice" label="总价格">
              </el-table-column>
              <el-table-column label="状态">
                <template slot-scope="scope">
                  <el-tag>{{ scope.row.stateName }}</el-tag>
                </template>
              </el-table-column>
              <el-table-column label="下单时间">
                <template slot-scope="scope">
                  {{ scope.row.createTime | formatDate }}
                </template>
              </el-table-column>
              <el-table-column prop="payTime" label="付款时间">
              </el-table-column>
              <el-table-column prop="username" label="用户账号">
              </el-table-column>
              <el-table-column label="查看商品">
                <template slot-scope="scope">
                  <el-button type="primary" @click="viewProduct(scope.row.id)">查看</el-button>
                </template>
              </el-table-column>
              <el-table-column prop="nickname" label="用户昵称">
              </el-table-column>

              <el-table-column label="操作" width="280" align="center">
                <template slot-scope="scop">
                  <div style="margin: 5px ;padding-left: 3px" v-if="scop.row.stateName === '待发货'">
                    <el-button type="danger" plain style="width: 91px;" @click="deliverGoods(scop)">已发货 <i
                        class="el-icon-bank-card"></i>
                    </el-button>
                  </div>
                  <el-button v-if="scop.row.stateName !== '已完成'" type="success" @click="handelEdit(scop.row)">编辑<i
                      class="el-icon-edit"></i></el-button>
                  <template>
                    <el-popconfirm
                        class="ml-5"
                        confirm-button-text='确定'
                        cancel-button-text='我再想想'
                        title="您确定取消吗？"
                        @confirm="del(scop.row.id)"
                    >

                      <el-button type="danger" slot="reference"
                                 v-if="scop.row.stateName !== '已完成' && scop.row.stateName !== '已取消' ">取消订单<i
                          class="el-icon-remove-outline"></i>
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
          </div>

          <div v-else>

            <el-table size="medium" :data="examineTableData" border stripe @selection-change="handleSelectionChange">
              <el-table-column type="selection" width="55"></el-table-column>
              <el-table-column prop="id" label="ID">
              </el-table-column>
              <el-table-column prop="userName" label="用户帐号">
              </el-table-column>
              <el-table-column prop="orderNo" label="订单编号">
              </el-table-column>
              <el-table-column prop="itemStatus" label="订单状态">
              </el-table-column>
              <el-table-column prop="operation" label="操作">
              </el-table-column>
              <el-table-column prop="reason" label="原因">
              </el-table-column>
              <el-table-column label="审核状态">
                <template slot-scope="scope">

                  <el-tag type="success" v-if="scope.row.passno==='审核通过'">{{ scope.row.passno }}</el-tag>

                  <el-tag type="danger" v-if="scope.row.passno === '审核不通过'">{{ scope.row.passno }}</el-tag>
                </template>
              </el-table-column>

              <el-table-column label="操作" width="280" align="center">
                <template slot-scope="scop">
                  <el-button type="success" @click="changeState(scop.row, '审核通过')"
                             :disabled="scop.row.passno !== '待审核'">审核通过
                  </el-button>
                  <el-button type="danger" @click="changeState(scop.row, '审核不通过')"
                             :disabled="scop.row.passno !== '待审核'">审核不通过
                  </el-button>
                </template>
              </el-table-column>

            </el-table>

            <div style="padding: 10px 0">
              <el-pagination
                  @size-change="handleSChange"
                  @current-change="handleCChange"
                  :current-page="pageN"
                  :page-sizes="[2, 5, 10, 20]"
                  :page-size="pageS"
                  layout="total, sizes, prev, pager, next, jumper"
                  :total="tota">
              </el-pagination>
            </div>

          </div>
        </el-tab-pane>

      </el-tabs>
    </template>

    <!--弹窗-->
    <el-dialog title="订单信息" :visible.sync="dialogFormVisible" width="30%">
      <el-form label-width="80px" size="small">
        <el-form-item label="名称">
          <el-input v-model="form.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="订单编号">
          <el-input v-model="form.no" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="总价格">
          <el-input v-model="form.allPrice" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="状态">
          <el-select clearable v-model="form.stateName" placeholder="请选择订单状态" style="width: 100%">
            <el-option v-for="item in stateList" :key="item.id" :label="item.name" :value="item.name">
            </el-option>
          </el-select>
        </el-form-item>


        <el-form-item label="下单时间">
          <el-date-picker
              style="width: 100%"
              v-model="form.createTime"
              type="datetime"
              value-format='yyyy-MM-dd HH:mm:ss'
              placeholder="选择日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="支付时间">
          <el-input v-model="form.payTime" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>


    <el-dialog title="商品信息" :visible.sync="dialogFormVisible1" width="70%">
      <el-table :data="productList" border stripe>
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
        <el-table-column prop="description" label="描述">
        </el-table-column>
        <el-table-column prop="unit" label="单位">
        </el-table-column>
        <el-table-column prop="store" label="sku库存">
        </el-table-column>
        <el-table-column label="数量" width="200">
          <template v-slot="scope">
            <el-input-number size="mini" v-model="scope.row.num" :min="1" :max="100" label="数量"
                             @change="changeNum(scope.row)"></el-input-number>
          </template>
        </el-table-column>
        <el-table-column label="上架时间">
          <template slot-scope="scope">
            {{ scope.row.createTime | formatDate }}
          </template>
        </el-table-column>

        <el-table-column label="操作" width="280" align="center"
        >
          <template slot-scope="scop">
            <template>
              <el-popconfirm
                  class="ml-5"
                  confirm-button-text='确定'
                  cancel-button-text='我再想想'
                  title="您确定移除吗？"
                  @confirm="dell(scop.row.id)"
              >
                <el-button type="danger" slot="reference"
                >
                  移除<i class="el-icon-remove-outline"></i>
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
  name: "Orders",
  data() {
    return {
      stateList: [],
      stateName: "全部",
      activeName: '0',
      productList: [],
      dialogFormVisible1: false,
      //默认展开的数组
      expends: [],
      //有的权限
      checks: [],
      menuData: [],
      name: "",
      tota: 0,
      pageN: 1,
      pageS: 5,
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
      examineTableData: [],
      multipleSelection: [],
      orderId: 0,
      ordersProduct: {},
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
    handleSChange(pageSize) {
      this.pageS = pageSize
      this.load()
    },
    handleCChange(pageNum) {
      this.pageN = pageNum
      this.load()
    },
    //审核操作
    changeState(row, state) {
      this.form = row
      row.passno = state
      this.request.post("/examine/inspect", this.form).then(res => {
        if (res.code === '200') {
          this.$message.success("审核成功")
          this.load()
        } else {
          this.$message.error("审核失败")
        }
      })

    },
    //发货
    deliverGoods(scop) {
      this.request.post("/orders/deliverGoods", scop.row).then(res => {
        if (res.code === '200') {
          this.$message.success("发货成功")
          this.load()
        } else {
          this.$message.error("发货失败")
        }
      })
    },
    handleClick(tab) {
      this.pageNum = 1
      this.pageSize = 5
      this.stateName = tab.label
      this.$store.commit("setStateName", this.stateName)
      console.log(this.$store.state.stateName)
      this.load()
    },
    dell(id) {
      this.ordersProduct = {}
      this.ordersProduct.productId = id
      this.ordersProduct.orderId = this.orderId
      this.request.post("/orders-product/del", this.ordersProduct).then(res => {
        if (res.code === '200') {
          this.$message.success("删除成功")
          this.request.get("/orders/getProductById/" + this.orderId).then(res => {
            this.productList = res.data
          })
          this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    changeNum(row) {
      this.ordersProduct = {}
      this.ordersProduct.productId = row.id
      this.ordersProduct.orderId = this.orderId
      this.ordersProduct.num = row.num
      this.request.post("/orders-product", this.ordersProduct).then(res => {
        if (res.code === '200') {
          this.$message.success("更新成功")
          this.load()
        } else {
          this.$message.error("更新成功失败")
        }
      })
    },
    viewProduct(orderId) {
      this.orderId = orderId
      this.request.get("/orders/getProductById/" + orderId).then(res => {
        this.dialogFormVisible1 = true
        if (res.code === '200') {
          this.productList = res.data
        } else {
          this.$message.error("操作失败")
        }
      })
    },
    handleSelectionChange(val) {
      this.multipleSelection = val
    },
    //取消订单 更改状态
    del(id) {
      this.request.post("/orders/cancel/" + id).then(res => {
        if (res.code === '200') {
          this.$message.success("取消成功")
          this.load()
        } else {
          this.$message.error("取消失败")
        }
      })
    },
    delBatch() {
      let ids = this.multipleSelection.map(v => v.id) //[{}，{}，{}] => [1,2,3] 对象数组变纯id数组
      this.request.post("/orders/del/batch", ids).then(res => {
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
      this.request.post("/orders", this.form).then(res => {
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
      this.request.get("/orders/page", {
        params: {
          stateName: this.stateName,
          name: this.name,
          pageNum: this.pageNum,
          pageSize: this.pageSize,
        }
      }).then(res => {
        this.tableData = res.data.records
        this.total = res.data.total
      })

      this.request.get("/state").then(res => {
        this.stateList = res.data
      })


      //审核数据
      this.request.get("/examine/page", {
        params: {
          pageNum: this.pageN,
          pageSize: this.pageS,
        }
      }).then(res => {
        this.examineTableData = res.data.records
        this.tota = res.data.total
      })

    }
  }
}
</script>


<style scoped>

</style>
