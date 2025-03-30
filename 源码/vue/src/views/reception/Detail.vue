<template>
  <div style="width: 100%;">
    <div style="width: 1090px;margin: 0 auto;padding: 10px; ">
      <div>

        <div style="display: flex">

          <el-card shadow="always" class="box-card">
            <div>

              <div style="position: relative;">

                <div v-if="flag5" style="width: 350px; height: 350px">
                  <div style="width: 50px;height: 50px; position: absolute; z-index: 1000;
                padding-left: 320px;cursor: pointer; color: #AAAAAA">
                    <i class="el-icon-close" @click="videos"></i>
                  </div>
                  <div>
                    <Video style="width: 350px;height: 350px"/>
                  </div>
                </div>

                <div v-else>
                  <div style="width: 50px;height: 50px; position: absolute; z-index: 100;
                padding-left: 150px;line-height: 370px;cursor: pointer;" @click="videos" v-if="this.goods.video">
                    <img src="../../assets/img/play.png" alt="" style="width: 50px;height: 50px;
                    "/>
                  </div>
                  <div style="width: 350px; height: 350px">
                    <el-image v-if="this.url" :src="this.url" :preview-src-list="[this.url]" alt=""
                              style="width: 100%; height: 100%;"></el-image>
                  </div>
                </div>
              </div>
              <div style="margin-top: 20px;padding-left: 10px">
                <ul style="list-style-type:none;">

                  <li style="width: 54px;height: 54px;margin: 5px">

                    <el-image v-if="goods.url && this.flag === true" :src="goods.url" :preview-src-list="[goods.url]"
                              alt=""
                              :style="box1" style="width: 54px;height: 54px" @mouseover="mouseOver"
                    >
                    </el-image>
                    <el-image v-if="goods.url && this.flag ===false" :src="goods.url" :preview-src-list="[goods.url]"
                              alt=""
                              :style="box" style="width: 54px;height: 54px" @mouseover="mouseOver"
                    >
                    </el-image>
                  </li>

                  <li style="width: 54px;height: 54px;margin: 5px" v-if="urlList[0]">
                    <el-image v-if="urlList[0].url && this.flag1 === true" :src="urlList[0].url"
                              :preview-src-list="[urlList[0].url]" alt=""
                              :style="box1" @mouseover="mouseOver1">
                    </el-image>

                    <el-image v-if="urlList[0].url && this.flag1 ===false" :src="urlList[0].url"
                              :preview-src-list="[urlList[0].url]"
                              alt=""
                              :style="box" style="width: 54px;height: 54px" @mouseover="mouseOver1"
                    >
                    </el-image>
                  </li>

                  <li style="width: 54px;height: 54px;margin: 5px" v-if="urlList[1]">
                    <el-image v-if="urlList[1].url && this.flag2 === true" :src="urlList[1].url"
                              :preview-src-list="[urlList[1].url]" alt=""
                              :style="box1" @mouseover="mouseOver2">
                    </el-image>

                    <el-image v-if="urlList[1].url && this.flag2 ===false" :src="urlList[1].url"
                              :preview-src-list="[urlList[1].url]"
                              alt=""
                              :style="box" style="width: 54px;height: 54px" @mouseover="mouseOver2">
                    </el-image>
                  </li>

                  <li style="width: 54px;height: 54px;margin: 5px" v-if="urlList[2]">
                    <el-image v-if="urlList[2].url && this.flag3 === true" :src="urlList[2].url"
                              :preview-src-list="[urlList[2].url]" alt=""
                              :style="box1" @mouseover="mouseOver3">
                    </el-image>

                    <el-image v-if="urlList[2].url && this.flag3 ===false" :src="urlList[2].url"
                              :preview-src-list="[urlList[2].url]"
                              alt=""
                              :style="box" style="width: 54px;height: 54px" @mouseover="mouseOver3"
                    >
                    </el-image>
                  </li>

                  <li style="width: 54px;height: 54px;margin: 5px" v-if="urlList[3]">
                    <el-image v-if="urlList[3].url && this.flag4 === true" :src="urlList[3].url"
                              :preview-src-list="[urlList[3].url]" alt=""
                              :style="box1" @mouseover="mouseOver4">
                    </el-image>

                    <el-image v-if="urlList[3].url && this.flag4 ===false" :src="urlList[3].url"
                              :preview-src-list="[urlList[3].url]"
                              alt=""
                              :style="box" style="width: 54px;height: 54px" @mouseover="mouseOver4"
                    >
                    </el-image>
                  </li>


                </ul>

              </div>


              <div v-if="view" style="width: 70px;margin-top: 20px" @click="cancelCollection">
                收藏<i style="font-size: 20px;color: #FF8F1C;" class="el-icon-star-on"></i>
              </div>
              <div v-if="!view" style="width: 55px;margin-top: 20px
              " @click="collection1">
                收藏 <i class="el-icon-star-off"></i>
              </div>

            </div>
          </el-card>

          <el-card shadow="always" class="box-card">
            <div style="width: 600px; float: right; padding-left: 50px">

              <div style="padding: 10px;color: #666">
                <h3> {{ goods.name }}</h3>
              </div>

              <div style="padding: 10px;color: #666;font-size: 13px">
                {{ goods.description }}
              </div>

              <div style="padding: 10px;color: orangered;font-size: 13px">
                价格 ￥ {{ goods.sellPrice }}
              </div>


              <div style="padding: 10px;color: #666;font-size: 13px">
                库存 {{ goods.store }} 件
              </div>

              <div style="padding: 10px;font-size: 13px">
                <el-input-number v-model="form.num" :min="1" :max="this.max" label="数量"></el-input-number>
                <!--              <span style="margin-left: 10px">{{ goods.unit }}</span>-->
              </div>

              <div style="padding: 10px;color: orangered;font-size: 14px;margin-top: 40px">
                <el-button style="background-color: orangered;color: white" @click="buy">
                  <i class="el-icon-money"></i>直接购买
                </el-button>
                <el-button style="background-color: orangered;color: white" @click="addCart">
                  <i class="el-icon-shopping-cart-2"></i> 加入购物车
                </el-button>
              </div>

            </div>
          </el-card>
        </div>
      </div>

      <Evaluate/>
    </div>
  </div>
</template>

<script>
import Evaluate from "@/views/reception/Evaluate";
import Video from "@/views/reception/Video";

export default {
  name: "Detail",
  components: {
    Evaluate, Video
  },
  data() {
    return {
      flag5: false,
      urlList: [],
      box: "",
      box1: "width: 100%;height: 54px;border: 2px solid #e53e41",
      max: 100,
      view: "",
      url: "",
      flag: true,
      flag1: false,
      flag2: false,
      flag3: false,
      flag4: false,
      //获取id
      id: this.$route.query.id,
      goods: {},
      order: {},
      form: {
        num: 1
      },
      Collection: {
        productId: this.$route.query.id
      },
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}
    }
  },
  created() {
    this.load()
  },
  methods: {
    //直接购买
    buy() {

      if (this.goods.store < this.form.num) {
        this.$message.warning("当前商品库存不足")
        return
      }

      this.order.productId = this.goods.id
      this.order.name = this.goods.name
      this.order.allPrice = this.goods.sellPrice * this.form.num
      this.order.allPrice = this.order.allPrice.toFixed(2)
      this.order.num = this.form.num
      this.order.goods = this.goods
      sessionStorage.setItem('data', JSON.stringify(this.order));
      this.$router.push("/reception/settlement1")
      // this.request.post('/orders/buy', this.order).then(res => {
      //   const url = 'http://localhost:9090/alipay/pay?subject=' + this.order.name + '&traceNo=' + res.data + '&totalAmount=' + this.order.allPrice
      //   window.open(url)
      // })
      // this.load()

    },
    videos() {
      this.flag5 = !this.flag5
      console.log(this.flag5)
    },
    //鼠标移入
    mouseOver() {
      this.url = this.goods.url
      this.flag = true
      this.flag1 = false
      this.flag2 = false
      this.flag3 = false
      this.flag4 = false
      this.flag5 = false
    },
    mouseOver1() {
      this.url = this.urlList[0].url
      this.flag = false
      this.flag1 = true
      this.flag2 = false
      this.flag3 = false
      this.flag4 = false
    },
    mouseOver2() {
      this.url = this.urlList[1].url
      this.flag = false
      this.flag1 = false
      this.flag2 = true
      this.flag3 = false
      this.flag4 = false
    },
    mouseOver3() {
      this.url = this.urlList[2].url
      this.flag = false
      this.flag1 = false
      this.flag2 = false
      this.flag3 = true
      this.flag4 = false
    },
    mouseOver4() {
      this.url = this.urlList[3].url
      this.flag = false
      this.flag1 = false
      this.flag2 = false
      this.flag3 = false
      this.flag4 = true
    },
    // 移出
    mouseLeave() {
      this.box = ""
    },
    //收藏
    collection1() {
      if (!this.user.id) {
        this.$message.warning("请登录后操作")
        return
      }
      this.request.post('/collection', this.Collection).then(res => {
        if (res.code === '200') {
          this.$message.success("收藏成功")
          this.load()
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    //取消收藏
    cancelCollection() {
      if (!this.user.id) {
        this.$message.warning("请登录后操作")
        return
      }
      this.request.delete("/collection/" + this.id + "/" + this.user.username).then(res => {
        if (res.code === '200') {
          this.$message.success("取消收藏成功")
          this.load()
        } else {
          this.$message.error("取消收藏失败")
        }
      })
    },
    addCart() {
      if (!this.user.id) {
        this.$message.warning("请登录后操作")
        return
      }
      this.form.productId = this.goods.id
      this.request.post('/cart', this.form).then(res => {
        if (res.code === '200') {
          this.$message.success("添加购物车成功")
          this.load()
        } else {
          this.$message.error("添加购物车失败")
        }
      })
    },
    load() {

      //传当前商品id
      this.$store.commit("setProductId", this.id)

      this.request.get("/product/" + this.id).then(res => {
        this.goods = res.data
        console.log(res.data)
        this.url = this.goods.url
        if (this.goods.store < 100) {
          this.max = this.goods.store
        }
      })
      if (this.user.id) {
        this.request.get("/collection/" + this.id + "/" + this.user.username).then(res => {
          this.view = res.data
        })
      }
      this.request.get("/product-img/" + this.id).then(res => {
        this.urlList = res.data
      })


    }
  }
}
</script>

<style scoped>

ul li {
  display: inline-block;
}

.box-card {
  background-color: #fff;
  border-radius: 4px;
  box-shadow: 0 2px 2px rgba(10, 16, 20, .24), 0 0 2px rgba(10, 16, 20, .33);
  box-sizing: border-box;
  transition: box-shadow .5s;
  margin: 24px 8px;
  padding-bottom: 48px;
  position: relative;
}

/deep/ .shadow img {
  position: static !important;
  height: auto !important;
}
</style>