<template>
  <el-card style="width: 500px;padding: 20px;">
    <el-form label-width="80px" size="small">

      <el-upload
          class="avatar-uploader"
          action="http://localhost:9090/file/upload"
          :show-file-list="false"
          :on-success="handleAvatarSuccess">
        <img v-if="form.avatarUrl" :src="form.avatarUrl" class="avatar">
        <i v-else class="el-icon-plus avatar-uploader-icon"></i>
      </el-upload>

      <el-form-item label="用户名">
        <el-input v-model="form.username" disabled autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="昵称">
        <el-input v-model="form.nickname" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="邮箱">
        <el-input v-model="form.email" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="电话">
        <el-input v-model="form.phone" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="地址">
        <el-input type="textarea" v-model="form.address" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button @click="reten">返回</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </el-form-item>
    </el-form>
  </el-card>
</template>

<script>
export default {
  name: "Person",
  data() {
    return {
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
      form: {}
    }
  },
  created() {
    this.request.get("/user/personify/" + this.user.username).then(res => {
      if (res.code === '200') {
        this.form = res.data;
      }
    })
  },
  methods: {
    handleAvatarSuccess(res) {
      this.form.avatarUrl = res
    },
    save() {
      this.request.post("/user", this.form).then(res => {
        console.log(res)
        if (res.code === '200') {
          this.$message.success("修改成功")
          //触发父级方法
          this.$emit("refreshUser")
          // //更新浏览器缓存
          // this.getUser().then(res => {
          //   res.token = JSON.parse(localStorage.getItem("user")).token
          //   localStorage.setItem("user", JSON.stringify(res))
          // })
        } else {
          this.$message.error("保存失败")
        }
      })
    },
    reten() {
      this.$router.push('/home')
    }
  }
}
</script>

<style scoped>
.avatar-uploader {
  text-align: center;
  padding-bottom: 10px;
}

.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}

.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}

.avatar {
  width: 158px;
  height: 138px;
  display: block;
}
</style>