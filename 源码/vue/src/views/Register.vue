<template>
    <div class="main">
      <div
          style="margin: 100px auto; background-color: rgba(255,255,255,0.7); width: 350px; height: 400px; padding: 20px; border-radius: 10px">
        <div style="margin: 20px 0; text-align: center; font-size: 24px"><b>注册</b></div>
        <el-form :model="user" :rules="rules" ref="userForm">

          <el-form-item prop="username">
            <el-input placeholder="请输入帐号" size="medium" style="margin: 5px 0" prefix-icon="el-icon-user"
                      v-model="user.username"></el-input>
          </el-form-item>

          <el-form-item prop="password">
            <el-input placeholder="请输入密码" size="medium" style="margin: 5px 0" prefix-icon="el-icon-lock" show-password
                      v-model="user.password"></el-input>
          </el-form-item>

          <el-form-item prop="confirmPassword">
            <el-input placeholder="请确认密码" size="medium" style="margin: 5px 0" prefix-icon="el-icon-lock" show-password
                      v-model="user.confirmPassword"></el-input>
          </el-form-item>

          <el-form-item style="margin: 10px 0; text-align: right">
            <el-button type="primary" size="small" autocomplete="off" @click="register">注册</el-button>
            <el-button type="warning" size="small" autocomplete="off" @click="$router.push('/login')">返回登录</el-button>
          </el-form-item>

        </el-form>
      </div>
    </div>
</template>

<script>
export default {
  name: "Register",
  data() {
    return {
      user: {},
      rules: {
        username: [
          //  trigger: 'blur'失焦触发校验
          {required: true, message: '请输入用户名', trigger: 'blur'},
          {min: 2, max: 10, message: '长度在 2 到 5 个字符', trigger: 'blur'}
        ],
        password: [
          {required: true, message: '请输入密码', trigger: 'blur'},
          {min: 1, max: 20, message: '长度在 1 到 20 个字符', trigger: 'blur'}
        ],
        confirmPassword: [
          {required: true, message: '请输入确认密码', trigger: 'blur'},
          {min: 1, max: 20, message: '长度在 1 到 20 个字符', trigger: 'blur'}
        ],
      }
    }
  },
  methods: {
    register() {
      this.$refs['userForm'].validate((valid) => {
        if (valid) {  // 表单校验合法
          if (this.user.password !== this.user.confirmPassword) {
            this.$message.error("两次输入的密码不一样")
              returun;
          }
          this.request.post("/user/register", this.user).then(res => {
            if (res.code === '200') {
              this.$message.success("注册成功")
              this.$router.push('/login')
            } else {
              this.$message.error(res.msg)
            }
          })
        }
      });
    }
  }
}
</script>

<style>
.wrapper {
  height: 100vh;
  background-image: linear-gradient(to bottom right, #FC466B, #3F5EFB);
  /*超出部分隐藏*/
  overflow: hidden;
}

.header {
  height: 100px;
  width: 100%;
}

.main {
  background: url("../assets/login.jpg") no-repeat center center;
  height: 100vh;
  width: 100%;
  /*把背景图片放大到适合元素容器的尺寸，图片比例不变*/
  background-size: cover;
  /*position: absolute;*/
  /*left: 0;*/
  /*top: 0;*/
  overflow: hidden;
}

.foot {
  height: 100px;
  width: 100%;
}
</style>
