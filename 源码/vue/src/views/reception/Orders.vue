<template>
  <div style="margin-bottom: 200px;padding-top: 30px">
    <div style="width: 68%; margin: 0 auto">

      <div style="margin-bottom: 66px; font-size: 20px; color: #666">我的订单</div>

      <!--        搜索框-->
      <div style="padding: 10px 0">
        <el-input size="medium" clearable style="width: 200px " placeholder="请输入名称" suffix-icon="el-icon-search"
                  class="ml-5"
                  v-model="name"></el-input>
        <el-button class="ml-5" type="primary" @click="load" size="medium">搜索</el-button>
      </div>


      <template>
        <el-tabs v-model="activeName" @tab-click="handleClick">

          <el-tab-pane v-for="i in states" :key="i.id" :label="i.name">

            <div v-if="i.name!=='审核'">
              <el-table size="medium" :data="tableData" border stripe @selection-change="handleSelectionChange">
                <el-table-column type="selection" width="55"></el-table-column>
                <el-table-column prop="id" label="ID">
                </el-table-column>
                <el-table-column prop="name" label="名称">
                </el-table-column>
                <el-table-column prop="no" label="订单编号">
                </el-table-column>
                <el-table-column prop="allPrice" label="总价格">
                </el-table-column>
                <el-table-column label="收货人">
                  <!--                  <template slot-scope="scope">-->
                  <!--                    <el-tag>{{ scope.row.fullName }}</el-tag>-->

                  <template slot-scope="scope">
                    <el-tooltip placement="top">
                      <div slot="content">
                        {{ scope.row.fullName }}<br/>
                        {{ scope.row.address }}<br/>
                        {{ scope.row.phone }}
                      </div>
                      <span>{{ scope.row.fullName }}</span>
                    </el-tooltip>
                  </template>
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
                <el-table-column label="查看商品" align="center">
                  <template slot-scope="scope">
                    <el-button type="primary" @click="viewProduct(scope.row)">查看</el-button>
                  </template>
                </el-table-column>

                <el-table-column label="操作" width="280" align="center">
                  <template slot-scope="scop">
                    <div style="margin: 5px ;padding-left: 3px" v-if="scop.row.stateName === '待付款'">
                      <el-button type="danger" plain style="width: 91px;" @click="payment(scop)">付款 <i
                          class="el-icon-bank-card"></i>
                      </el-button>
                    </div>
                    <div style="margin: 5px" v-if="scop.row.stateName === '待评价'">
                      <div style="margin-bottom: 5px">
                        <el-button type="danger" plain style="width: 88px" @click="refund(scop.row)">申请退款</el-button>
                      </div>
                      <!--                      <el-button plain style="width: 88px" @click="toEvaluate(scop.row)">去评价</el-button>-->
                    </div>
                    <div style="margin: 5px" v-if="scop.row.stateName === '待收货'">
                      <el-button plain type="warning" style="width: 88px" @click="deliverGoods(scop)">确认收货</el-button>
                    </div>
                    <div v-if="scop.row.stateName === '已完成'" style="margin-bottom: 5px">
                      <el-button type="danger" plain style="width: 88px" @click="refund(scop.row)">申请退款</el-button>
                    </div>
                    <div
                        v-if="scop.row.stateName !== '已完成' && scop.row.stateName !== '待评价' && scop.row.stateName !== '已取消' ">
                      <el-button slot="reference" plain @click="cancel(scop.row)">取消订单<i
                          class="el-icon-remove-outline"></i>
                      </el-button>
                    </div>
                    <div v-if="scop.row.stateName === '已完成' || scop.row.stateName === '已取消' ">
                      <template>
                        <el-popconfirm
                            class="ml-5"
                            confirm-button-text='确定'
                            cancel-button-text='我再想想'
                            title="您确定删除吗？"
                            @confirm="del(scop.row.id)"
                        >
                          <el-button slot="reference" type="danger" plain>删除订单<i class="el-icon-remove-outline"></i>
                          </el-button>
                        </el-popconfirm>
                      </template>
                    </div>
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
            </div>

            <div v-else>
              <div style="padding-left: 55px">
                <el-table size="medium" :data="examineTableData" border stripe
                >
                  <el-table-column prop="id" label="ID" width="80px">
                  </el-table-column>
                  <el-table-column prop="orderNo" label="订单编号">
                  </el-table-column>
                  <el-table-column prop="itemStatus" label="订单状态" width="100px">
                  </el-table-column>
                  <el-table-column prop="operation" label="操作" width="100px">
                  </el-table-column>
                  <el-table-column prop="reason" label="原因">
                  </el-table-column>
                  <el-table-column label="审核状态">
                    <template slot-scope="scope">
                      <el-tag type="warning" v-if="scope.row.passno==='待审核'">{{ scope.row.passno }}</el-tag>
                      <el-tag type="success" v-if="scope.row.passno==='审核通过'">{{ scope.row.passno }}</el-tag>

                      <el-tag type="danger" v-if="scope.row.passno === '审核不通过'">{{ scope.row.passno }}</el-tag>
                    </template>
                  </el-table-column>
                </el-table>
              </div>

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


      <el-dialog title="商品信息" :visible.sync="dialogFormVisible1" width="65%">
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
          <el-table-column prop="num" label="数量">
          </el-table-column>
          <el-table-column label="上架时间">
            <template slot-scope="scope">
              {{ scope.row.createTime | formatDate }}
            </template>
          </el-table-column>

          <el-table-column label="操作" width="280" align="center" v-if="orderStateName==='待评价'">
            <template slot-scope="scop">
              <el-button plain style="width: 88px" @click="toEvaluate(scop.row)">去评价</el-button>
            </template>
          </el-table-column>

        </el-table>
      </el-dialog>

      <!--      取消订单-->
      <el-dialog title="选择取消原因" :visible.sync="dialogFormVisible2" width="50%">
        <div>
          <el-radio-group v-model="radio1" size="medium" @change="changeRadio()">
            <el-radio-button v-for="item in reasonList" :key="item.name" :label="item.value"
            ></el-radio-button>
          </el-radio-group>
        </div>
        <div style="margin-top: 50px;width: 100%; text-align: center">
          <el-button size="medium" @click="thinkAgain">再想想</el-button>
          <el-button type="primary" size="medium" :disabled="disabled" @click="Submit">提交</el-button>
        </div>
      </el-dialog>


      <!--      申请退款-->
      <el-dialog title="申请退款原因" :visible.sync="dialogFormVisible3" width="50%">
        <div>
          <el-input type="textarea"
                    :autosize="{ minRows: 5, maxRows: 10}"
                    placeholder="请输入申请退款理由"
                    v-model="textarea1">
          </el-input>
        </div>
        <div style="margin-top: 50px;width: 100%; text-align: center">
          <el-button size="medium" @click="thinkAgain">再想想</el-button>
          <el-button type="primary" size="medium" @click="Submit1">提交
          </el-button>
        </div>
      </el-dialog>


    </div>

  </div>
</template>

<script>
export default {
  name: "Orders",
  data() {
    return {
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
      //当前状态
      itemStatus: "",
      //用户申请内容
      operation: "",
      textarea1: '',
      states: {},
      examine: {},
      orderId: "",
      disabled1: true,
      disabled: true,
      reasonList: {},
      radio1: '',
      orderStateName: '',
      stateName: this.$store.state.stateName,
      activeName: this.$store.state.activeName,
      productList: [],
      dialogFormVisible3: false,
      dialogFormVisible2: false,
      dialogFormVisible1: false,
      //默认展开的数组
      expends: [],
      //有的权限
      checks: [],
      menuData: [],
      name: "",
      total: 0,
      tota: 0,
      pageN: 1,
      pageS: 5,
      pageNum: 1,
      pageSize: 5,
      mag: "hello word!",
      examineTableData: [],
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
    //请求分页查询数据F
    this.load()
  },
  mounted() {
    this.$store.commit("setStateName", "全部")
    this.$store.commit("setActiveName", "0")
  },
  methods: {
    //去评价
    toEvaluate(row) {
      this.$router.push('/reception/toEvaluate?id=' + row.id)
    },
    //申请退款
    refund(row) {
      this.dialogFormVisible3 = true
      this.orderId = row.id
      this.operation = "申请退款"
      this.itemStatus = row.stateName
    },
    //提交审核
    Submit() {
      this.examine.orderId = this.orderId
      this.examine.reason = this.radio1
      this.examine.operation = this.operation
      this.examine.itemStatus = this.itemStatus
      console.log(this.examine)
      this.request.post("/orders/examine", this.examine).then(res => {
        if (res.code === '200') {
          this.$message.success("提交成功")
          this.dialogFormVisible2 = false
          this.load()
        } else {
          this.$message.error("提交失败")
        }
      })
    },
    //提交审核
    Submit1() {
      this.examine.orderId = this.orderId
      this.examine.reason = this.textarea1
      this.examine.operation = this.operation
      this.examine.itemStatus = this.itemStatus
      console.log(this.examine)
      this.request.post("/orders/examine", this.examine).then(res => {
        if (res.code === '200') {
          this.$message.success("提交成功")
          this.dialogFormVisible3 = false
          this.load()
        } else {
          this.$message.error("提交失败")
        }
      })
    },
    //再想想
    thinkAgain() {
      this.dialogFormVisible3 = false
      this.dialogFormVisible2 = false
      this.radio1 = ''
      this.textarea1 = ''
    },
    //控制按钮是否禁用
    changeRadio() {
      if (this.radio1 !== "") {
        this.disabled = false
      }
    },
    //取消订单
    cancel(row) {
      this.dialogFormVisible2 = true
      this.orderId = row.id
      this.operation = "取消订单"
      this.itemStatus = row.stateName
    },
    //确认收货
    deliverGoods(scop) {
      this.request.post("/orders/deliverGoods", scop.row).then(res => {
        if (res.code === '200') {
          this.$message.success("收货成功")
          this.load()
        } else {
          this.$message.error("确认收货失败")
        }
      })
    },
    //付款
    payment(scop) {
      this.request.post('/orders/payment', scop.row).then(res => {
        if (res.code === '200') {
          this.$message.success("支付成功")
          this.load()
        } else {
          this.$message.error("支付失败")
          this.load()
        }
      })
      // const url = 'http://localhost:9090/alipay/pay?subject=' + scop.row.name + '&traceNo=' + scop.row.no + '&totalAmount=' + scop.row.allPrice
      // window.open(url)

    },

    handleClick(tab) {
      this.stateName = tab.label
      this.pageNum = 1
      this.pageSize = 5
      this.load()
    },
    viewProduct(row) {
      this.orderStateName = row.stateName
      this.$store.commit("setOrderId", row.id)
      this.request.get("/orders/getProductById/" + row.id).then(res => {
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
    del(id) {
      this.request.delete("/orders/" + id).then(res => {
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
    handleSChange(pageSize) {
      this.pageS = pageSize
      this.load()
    },
    handleCChange(pageNum) {
      this.pageN = pageNum
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
      if (!this.user.id) {
        this.$message.warning("请登录后操作")
        return
      }
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
        this.states = res.data
      })


      this.request.get("/dict/reason").then(res => {
        if (res.code === '200') {
          this.reasonList = res.data
        } else {
          this.$message.error("请求数据失败")
        }
      })
      // 审核数据
      this.request.get("/examine/page", {
        params: {
          pageNum: this.pageN,
          pageSize: this.pageS,
        }
      }).then(res => {
        this.examineTableData = res.data.records
        console.log(this.examineTableData)
        this.tota = res.data.total
      })
    }
  }
}
</script>


<style scoped>

</style>
