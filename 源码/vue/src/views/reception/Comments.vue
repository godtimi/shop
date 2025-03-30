<template>
  <div style="margin: 30px 0">
    <div style="margin: 10px 0">
      <div style="border-bottom: 1px solid orangered; padding: 10px 0; font-size: 20px">
        商品评价
      </div>
      <!--      <div style="padding: 10px 0">-->
      <!--        <el-input type="textarea" v-model="commentForm.content">-->
      <!--        </el-input>-->
      <!--      </div>-->
      <!--      <div class="pd-10" style="text-align: right">-->
      <!--        <el-button type="primary" size="small" @click="save">-->
      <!--          评论-->
      <!--        </el-button>-->
      <!--      </div>-->
      <!--评论列表-->
      <div>

        <div v-for="item in comments" :key="item.id"
             style="border-bottom: 1px solid #ccc;padding: 10px 0;">
          <div style="display: flex">
            <!--          头像-->
            <div style="width: 100px;text-align: center;padding-top: 13px">
              <el-image :src="item.avatarUrl" style="width: 50px;height: 50px;border-radius: 50%">
              </el-image>
            </div>
            <!--          内容-->
            <div style="flex: 1;font-size: 14px;padding: 10px 0; line-height: 25px">
              <b> {{ item.nickname }}：</b>
              <span>
              {{ item.content }}
            </span>
              <!--            时间 回复 删除-->
              <div style="display: flex;margin-top: 5px">
                <div style="width: 200px">
                  <i class="el-icon-time">
                  </i>
                  <span style="margin-left: 5px"> {{ item.time }} </span>
                </div>

                <div style="text-align: right;flex: 1">
                  <el-button style="margin-left: 5px" type="text" @click="handleReply(item.id)">
                    回复
                  </el-button>

                  <el-button type="text" style="color: red" @click="del(item.id)" v-if="user.id === item.userId">
                    删除
                  </el-button>
                </div>

              </div>
            </div>
          </div>
          <!--            回复列表-->
          <div v-if="item.children.length" style="padding-left: 100px;">

            <div v-for="subItem in item.children" :key="subItem.id" style=" padding: 5px 50px">
              <!--              头像-->
              <div style="display: flex">
                <div style="width: 100px;text-align: center;padding-top: 13px">
                  <el-image :src="subItem.avatarUrl" style="width: 50px;height: 50px;border-radius: 50%">
                  </el-image>
                </div>

                <div style="flex: 1;font-size: 14px;padding: 10px 0; line-height: 25px">
                  <div v-if="subItem.ancestorsId!==subItem.pid">
                    <div>
                      <b>{{ subItem.nickname }}</b>
                    </div>
                    <div>
                      回复<b style="color: #409EFF">{{ subItem.puserName }}：</b>
                      <span>
                   {{ subItem.content }}
                  </span>
                    </div>
                  </div>

                  <div v-else>
                    <div>
                      <b>{{ subItem.nickname }}</b>
                    </div>
                    <div>
                      <span>
                         {{ subItem.content }}
                      </span>
                    </div>
                  </div>
                  <!--            时间 回复 删除-->
                  <div style="display: flex;margin-top: 5px">
                    <div style="width: 200px">
                      <i class="el-icon-time">
                      </i>
                      <span style="margin-left: 5px"> {{ subItem.time }} </span>
                    </div>

                    <div style="text-align: right;flex: 1">
                      <el-button style="margin-left: 5px" type="text" @click="handleReply(subItem.id)">
                        回复
                      </el-button>

                      <el-button type="text" style="color: red" @click="del(subItem.id)"
                                 v-if="user.id === subItem.userId">
                        删除
                      </el-button>
                    </div>

                  </div>
                </div>
              </div>

            </div>


          </div>


        </div>


      </div>

      <el-dialog title="回复" :visible.sync="dialogFormVisible" width="50%">
        <el-form label-width="80px" size="small">
          <el-form-item label="回复内容">
            <el-input v-model="commentForm.contentReply" type="textarea"></el-input>
          </el-form-item>
        </el-form>

        <div slot="footer" class="dialog-footer">
          <el-button type="primary" @click="save" size="small">确 定</el-button>
          <el-button @click="cancel" size="small">取 消</el-button>
        </div>
      </el-dialog>


    </div>
  </div>
</template>

<script>
export default {
  name: "Comments",
  data() {
    return {
      dialogFormVisible: false,
      commentForm: {},
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
      productId: this.$store.state.productId,
      comments: [],
    };
  },
  methods: {
    cancel() {
      this.commentForm = {}
      this.dialogFormVisible = false
    },
    handleReply(pid) {
      if (!this.user.id) {
        this.$message.warning("请登录后操作")
        return
      }
      this.commentForm = {
        pid: pid
      }
      this.dialogFormVisible = true
    },
    load() {
      if (this.productId !== null && this.productId !== 0) {
        this.request.get("/comment/tree/" + this.productId).then(res => {
          console.log(res.data)
          this.comments = res.data
        })
      }
    },
    save() {
      if (!this.user.id) {
        this.$message.warning("请登录后操作")
        return
      }
      if (this.commentForm.contentReply) {
        this.commentForm.content = this.commentForm.contentReply
      }
      this.commentForm.productId = this.productId
      this.request.post("/comment", this.commentForm).then(res => {
        if (res.code === '200') {
          this.$message.success("评论成功")
          this.commentForm = {}  //初始化 评论对象内容
          this.dialogFormVisible = false
          this.load()
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    del(id) {
      this.request.delete("/comment/" + id).then(res => {
        if (res.code === '200') {
          this.$message.success("删除成功")
          this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    },
  },
  created() {
    this.load()
  }
}
</script>

<style scoped>

</style>