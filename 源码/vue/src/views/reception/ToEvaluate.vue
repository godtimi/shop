<template>
  <div>
    <el-card class="box-card" style="min-width:950px; max-width:950px;margin: 0 auto">
      <div style="min-width:900px; max-width:900px;margin: 0 auto">
        <div>
          <div style="display: flex;margin-left: 50px">
            <div>
              <div style="width: 160px;height: 160px">
                <el-image v-if="goods.url" :src="goods.url" :preview-src-list="[goods.url]" alt=""
                          style="width: 160px;height: 160px"/>
              </div>
              <div style="font-size: 14px">
                <span style="color: #36c;cursor: pointer">
                  {{ goods.name }}
                </span>
                <div>
                  <span style="color: #999">
                    {{ goods.description }}
                  </span>
                </div>
              </div>
            </div>
            <div style="width: 561px;margin-left: 70px
            ">
              <el-input
                  type="textarea"
                  :rows="7"
                  placeholder="亲，写点评论吧，你的评价对其他卖家有很大的帮助的。"
                  v-model="textarea">
              </el-input>
            </div>
          </div>
        </div>

      </div>
      <el-button type="primary" style="margin-left: 430px;margin-top: 100px" @click="comment">发表评论</el-button>
    </el-card>
  </div>
</template>

<script>
export default {
  name: "ToEvaluate",
  data() {
    return {
      commentForm: {},
      textarea: '',
      //获取id
      id: this.$route.query.id,
      goods: {},
      orderId: this.$store.state.orderId ? this.$store.state.orderId : 0
    }
  },
  created() {
    this.load()
  },
  methods: {
    comment() {
      if (this.textarea) {
        this.commentForm.content = this.textarea
      } else {
        this.$message.error("评论内容不能为空")
      }
      this.commentForm.productId = this.id
      this.commentForm.orderId = this.orderId
      this.request.post("/comment", this.commentForm).then(res => {
        if (res.code === '200') {
          this.$message.success("评论成功")
          this.commentForm = {}  //初始化 评论对象内容
          this.$router.push('/reception/orders')
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    load() {
      console.log(this.orderId)
      this.request.get("/product/" + this.id).then(res => {
        this.goods = res.data
        console.log(res.data)
      })

    },
  }
}
</script>

<style scoped>
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
</style>