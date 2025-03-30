<template>
  <div>
    <el-card class="box-card" style="width:235px;height: 457.99px;padding: 10px">

      <div style="height: 200px;">
        <!--已登录-->
        <div v-if="!this.flag">
          <div style="display: flex;margin-top: 50px;margin-left: 10px">
            <div style="width: 60px;height: 60px;">
              <el-image :src="user.avatarUrl" style="border-radius: 50%;"></el-image>
            </div>

            <div style="margin-left: 40px; flex: 1;height: 60px;padding-top: 10px">
              <div>
                Hi!<br>
                <span style="width: 93px;font-size: 16px;white-space: nowrap; font-weight: 530">
                {{ user.nickname }}</span>
              </div>
            </div>
          </div>
          <div style="display: flex;margin-left: 3px;margin-top: 30px">
            <div style="width: 40px;margin-right: 6px; cursor: pointer" @click="$router.push('/reception/cart')">
              <div style="text-align: center;font-size: 9px;color: #F40">
                {{ a }}
              </div>
              <div style="font-size: 9px">
                购物车
              </div>
            </div>
            <div style="width: 40px;margin-right: 6px; cursor: pointer" @click="viewOrdersb">
              <div style="text-align: center;font-size: 9px;color: #F40">
                {{ b }}
              </div>
              <div style="font-size: 9px">
                待发货
              </div>
            </div>
            <div style="width: 40px;margin-right: 6px; cursor: pointer" @click="viewOrdersc">
              <div style="text-align: center;font-size: 9px;color: #F40">
                {{ c }}
              </div>
              <div style="font-size: 9px">
                待收货
              </div>
            </div>
            <div style="width: 40px;margin-right: 6px; cursor: pointer" @click="viewOrdersd">
              <div style="text-align: center;font-size: 9px;color: #F40">
                {{ d }}
              </div>
              <div style="font-size: 9px">
                待付款
              </div>
            </div>
            <div style="width: 40px;margin-right: 6px; cursor: pointer" @click="viewOrderse">
              <div style="text-align: center;font-size: 9px;color: #F40">
                {{ e }}
              </div>
              <div style="font-size: 9px">
                待评价
              </div>
            </div>
          </div>
        </div>
        <!--未登录-->
        <div style="margin-top: 50px" v-else>
          <div style="width: 60px;height: 60px;margin: 0 auto">
            <img src="../../assets/img/暂无头像.jpg" style="border-radius: 50%;width: 60px;height: 60px;">
            <!--            <el-image :src=" user.avatarUrl" style="border-radius: 50%;"></el-image>-->
          </div>
          <div style="text-align: center;margin-top: 10px">
            Hi 欢迎逛农产品销售系统
          </div>
          <div style="display: flex; margin: 40px auto;">
            <el-button type="primary" round style="margin-left: 35px" @click="$router.push('/login')">登录
            </el-button>
            <el-button type="warning" round style="margin-left: 30px" @click="$router.push('/register') ">注册
            </el-button>
          </div>
        </div>

      </div>


      <div style="margin-left: 8px">
        <div style="font-size: 15px;color: #333; font-weight:1000; margin-bottom: 10px">
          平台快报
        </div>

        <div style="display: flex; cursor: pointer;margin-top: 8px" v-for="item in articles" :key="item.id"
             @click="viewArticle(item.id)">
          <div style="width: 40px">
            <el-tag type="danger">{{ item.label }}</el-tag>
          </div>

          <div style="flex: 1;margin-left: 8px" class="item">
            {{ item.title }}
          </div>


        </div>

      </div>


      <!--      <div>今日上新</div>-->

    </el-card>
  </div>
</template>

<script>
export default {
  name: "Notice",
  data() {
    return {
      a: 0,
      b: 0,
      c: 0,
      d: 0,
      e: 0,
      flag: true,
      articles: {},
      user: this.$store.state.user ? this.$store.state.user : {}
    }
  },
  methods: {
    viewOrdersb() {
      this.$router.push('/reception/orders')
      this.$store.commit("setStateName", "待发货")
      this.$store.commit("setActiveName", "2")
    },
    viewOrdersc() {
      this.$router.push('/reception/orders')
      this.$store.commit("setStateName", "待收货")
      this.$store.commit("setActiveName", "3")
    },
    viewOrdersd() {
      this.$router.push('/reception/orders')
      this.$store.commit("setStateName", "待付款")
      this.$store.commit("setActiveName", "1")
    },
    viewOrderse() {
      this.$router.push('/reception/orders')
      this.$store.commit("setStateName", "待评价")
      this.$store.commit("setActiveName", "4")
    },
    viewArticle(id) {
      this.$router.push('/reception/article?id=' + id)
    },
  },
  created() {

    if (Object.keys(this.user).length) {
      //已登录
      this.flag = false
      this.request.get("/cart").then(res => {
        if (res.code === '200') {
          this.a = Object.keys(res.data).length
        } else {
          this.$message.error("获取数据失败")
        }
      })

      this.request.get("/orders/stateName/" + "待发货").then(res => {
        if (res.code === '200') {
          this.b = res.data
        } else {
          this.$message.error("获取数据失败")
        }
      })

      this.request.get("/orders/stateName/" + "待收货").then(res => {
        if (res.code === '200') {
          this.c = res.data
        } else {
          this.$message.error("获取数据失败")
        }
      })

      this.request.get("/orders/stateName/" + "待付款").then(res => {
        if (res.code === '200') {
          this.d = res.data
        } else {
          this.$message.error("获取数据失败")
        }
      })

      this.request.get("/orders/stateName/" + "待评价").then(res => {
        if (res.code === '200') {
          this.e = res.data
        } else {
          this.$message.error("获取数据失败")
        }
      })
    } else {
      //未登录
      this.flag = true
    }


    this.request.get("/article").then(res => {
      if (res.code === '200') {
        console.log(res)
        this.articles = res.data
      } else {
        this.$message.error("获取数据失败")
      }
    })
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
  font-size: 14px;
  color: #666;
  /* 限定范围 */
  width: 66px;
  height: 22px;
  /* 1.溢出隐藏 */
  overflow: hidden;
  /* 2.用省略号来代替超出文本 */
  text-overflow: ellipsis;
  /* 3.设置盒子属性为-webkit-box  必须的 */
  display: -webkit-box;
  /* 4.-webkit-line-clamp 设置为2，表示超出2行的部分显示省略号，如果设置为3，那么就是超出3行部分显示省略号 */
  -webkit-line-clamp: 1;
  /* 5.字面意思：单词破坏：破坏英文单词的整体性，在英文单词还没有在一行完全展示时就换行  即一个单词可能会被分成两行展示 */
  word-break: break-all;
  /* 6.盒子实现多行显示的必要条件，文字是垂直展示，即文字是多行展示的情况下使用 */
  -webkit-box-orient: vertical;
}
</style>
