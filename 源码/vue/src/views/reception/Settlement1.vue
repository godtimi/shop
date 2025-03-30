<template>
  <div style="margin-bottom: 300px">
    <div style="min-width:950px; max-width:950px;margin: 0 auto;">

      <div style="font-size: 25px; color: #797979">
        订单结算页
      </div>

      <div style="border: 1px solid #edd491; margin-top: 30px">
        <i style="color: #c4b05b;margin-left: 10px" class="el-icon-lollipop"></i>
        <span style="margin-left: 10px;color: #999999">温馨提示：请确认相关商品信息后提交订单。</span>
      </div>

      <div style="font-size: 20px;color: #666666;margin-top: 30px">
        填写并核对订单信息
      </div>

      <div>
        <div style="margin-top: 35px;font-weight: 600">
          收货人信息
        </div>

        <div style="margin-top: 10px">
          <el-select clearable v-model="addressId" @change="findId" placeholder="请选择收货地址"
                     style="width: 250px">
            <el-option v-for="item in addressList" :label="item.info" :key="item.id" :value="item.id">

              <span style="color: #666666"> {{ item.info }} </span>
              <span style="color: #666666;margin-left: 20px"> {{ item.username }} </span>
              <span style="color: #666666;margin-left: 20px">
            {{ item.phone }} </span>
              <span style="color: #666666;margin-left: 20px"> {{ item.address }} </span>
            </el-option>

          </el-select>
          <span style="margin-left: 250px;color: #666666"> {{ address.username }} </span>
          <span style="color: #666666;margin-left: 20px">
            {{ address.phone }} </span>
          <span style="color: #666666;margin-left: 20px"> {{ address.address }} </span>
        </div>

      </div>

      <div>
        <div style="font-weight: 600;margin-top: 35px">
          支付方式
        </div>
        <div style="margin-top: 10px">
          <el-radio v-model="radio1" label="2" border>在线支付</el-radio>
        </div>
      </div>

      <div>
        <div style="font-weight: 600;margin-top: 35px">
          送货清单
        </div>
        <div>
          <div style="color: #666666;font-size: 15px">
            配送方式
          </div>
          <div style="margin-top: 10px">
            <el-radio v-model="radio1" label="2" border>快递配送</el-radio>
          </div>
        </div>
      </div>

      <div>
        <div>
          <ul style="list-style-type:none;">
            <el-card class="box-card" style="margin-top: 30px">
              <li
                  style="width: 100% ;height: 100px; margin-right: 20px;margin-bottom: 50px">
                <div @click="viewProduct(item.id)" style="margin-left: 55px">

                  <div>
                    <div style="display: flex">
                      <div style="width: 100px;height: 100px; ">
                        <img :src="tableData.url" style="width: 100px;height: 100px;">
                      </div>

                      <div style="padding-left: 10px">
                        <div class="item">
                          {{ tableData.name }}
                        </div>
                        <div style="padding:  5px 0; color: orangered;">
                          <span style="font-size: 14px">￥</span>{{ tableData.sellPrice }}
                        </div>
                        <div style="padding:  5px 0; color: #666666">
                          <span style="font-size: 14px">不支持7天无理由退货</span>
                        </div>
                      </div>
                      <div style="width: 200px;margin-left: 100px;line-height: 100px;color: #666666">
                        数量 X {{ form.num }}
                      </div>
                      <div style="width: 200px;margin-left: 100px;line-height: 100px;color: #666666">
                        有货
                      </div>
                    </div>
                  </div>
                </div>
              </li>
            </el-card>
          </ul>
        </div>


      </div>

      <div style="margin-top:70px">
        <div>
          <div style="text-align: right;margin: 10px 0">
            <span style="color: #666666">总商品金额：</span>￥{{ form.allPrice }}
          </div>
          <div style="text-align: right">
            <span style="color: #666666">运费：</span>￥0.00
          </div>
        </div>
      </div>


      <div style="margin-top:50px">
        <div>
          <div style="text-align: right;margin: 10px 0">
            应付总额： <span style="font-size: 20px;color: orangered">￥{{ form.allPrice }} </span>
          </div>
          <div style="text-align: right;color: #999999">
            寄送至：{{ address.address }} 收货人：{{ address.username }} {{ address.phone }}
          </div>
        </div>
      </div>


      <el-button @click="buy" size="medium"
                 style="background: orangered;color: white; float: right;margin-top: 50px;width: 150px">
        提交订单
      </el-button>
    </div>
  </div>
</template>

<script>
export default {
  name: "Settlement",
  data() {
    return {
      radio1: '2',
      tableData: {},
      form: {},
      addressList: {},
      addressId: '',
      address: {},
    }
  },
  created() {
    this.load()
  },
  mounted() {
  },
  methods: {
    buy() {
      this.form.receivingId = this.addressId
      console.log(this.form)

      this.request.post('/orders/buy', this.form).then(res => {
        if (res.code === '200') {
          this.$message.success("结算成功")
          this.$router.push("/reception/orders")
        } else {
          this.$message.error("结算失败")
        }
      })
      // this.load()
      this.$router.push("/reception/orders")
      // this.request.post('/orders', this.form).then(res => {
      //   if (res.code === '200') {
      //     this.$message.success("结算成功")
      //     this.$router.push("/reception/orders")
      //   } else {
      //     this.$message.error("结算失败")
      //   }
      // })
    },
    findId() {
      this.request.get("/receiving/" + this.addressId).then(res => {
        if (res.code === '200') {
          this.address = res.data
          // console.log(this.address)
        } else {
          this.$message.error("请求数据失败")
        }
      })
    },
    load() {
      this.form = JSON.parse(sessionStorage.getItem('data'))
      this.tableData = this.form.goods
      this.request.get("/receiving").then(res => {
        if (res.code === '200') {
          this.addressList = res.data
          this.addressId = this.addressList[0].id
          this.address = this.addressList[0]
          console.log(this.addressList[0].id)
        } else {
          this.$message.error("请求数据失败")
        }
      })

    }
  }
}
</script>

<style scoped>
.box-card {
  background-color: #fff;
  border-radius: 4px;
  box-shadow: 0 2px 2px rgba(10, 16, 20, .10), 0 0 2px rgba(10, 16, 20, .33);
  box-sizing: border-box;
  position: relative;
}


.item {
  padding: 5px 0;
  font-size: 12px;
  color: #666;
  /* 限定范围 */
  width: 66px;
  height: 40px;
  /* 1.溢出隐藏 */
  overflow: hidden;
  /* 2.用省略号来代替超出文本 */
  text-overflow: ellipsis;
  /* 3.设置盒子属性为-webkit-box  必须的 */
  display: -webkit-box;
  /* 4.-webkit-line-clamp 设置为2，表示超出2行的部分显示省略号，如果设置为3，那么就是超出3行部分显示省略号 */
  -webkit-line-clamp: 2;
  /* 5.字面意思：单词破坏：破坏英文单词的整体性，在英文单词还没有在一行完全展示时就换行  即一个单词可能会被分成两行展示 */
  word-break: break-all;
  /* 6.盒子实现多行显示的必要条件，文字是垂直展示，即文字是多行展示的情况下使用 */
  -webkit-box-orient: vertical;
}

.item1 {
  padding: 6px 0;
  font-size: 16px;
  color: #666;
  /* 限定范围 */
  width: 220px;
  height: 50px;
  /* 1.溢出隐藏 */
  overflow: hidden;
  /* 2.用省略号来代替超出文本 */
  text-overflow: ellipsis;
  /* 3.设置盒子属性为-webkit-box  必须的 */
  display: -webkit-box;
  /* 4.-webkit-line-clamp 设置为2，表示超出2行的部分显示省略号，如果设置为3，那么就是超出3行部分显示省略号 */
  -webkit-line-clamp: 2;
  /* 5.字面意思：单词破坏：破坏英文单词的整体性，在英文单词还没有在一行完全展示时就换行  即一个单词可能会被分成两行展示 */
  word-break: break-all;
  /* 6.盒子实现多行显示的必要条件，文字是垂直展示，即文字是多行展示的情况下使用 */
  -webkit-box-orient: vertical;
}

/* 直接将元素转为行内块元素*/
</style>