<template>
  <div class="password-wrapper">
    <div class="background-animation"></div>
    <div class="main">
      <div class="password-container">
        <div class="password-box">
          <div class="password-header">
            <div class="password-logo">
              <svg viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg" class="logo-svg">
                <!-- 羊头 -->
                <ellipse cx="60" cy="60" rx="45" ry="40" fill="#f0f0f0" />
                <ellipse cx="60" cy="70" rx="30" ry="25" fill="#f0f0f0" />
                
                <!-- 耳朵 -->
                <ellipse cx="30" cy="40" rx="15" ry="20" transform="rotate(-20, 30, 40)" fill="#f0f0f0" stroke="#67C23A" stroke-width="2" />
                <ellipse cx="90" cy="40" rx="15" ry="20" transform="rotate(20, 90, 40)" fill="#f0f0f0" stroke="#67C23A" stroke-width="2" />
                
                <!-- 眼睛 -->
                <circle cx="45" cy="60" r="5" fill="#333" />
                <circle cx="75" cy="60" r="5" fill="#333" />
                <circle cx="45" cy="58" r="2" fill="#fff" />
                <circle cx="75" cy="58" r="2" fill="#fff" />
                
                <!-- 鼻子和嘴 -->
                <ellipse cx="60" cy="70" rx="10" ry="7" fill="#f9c6c6" />
                <path d="M50 75 Q60 85 70 75" fill="none" stroke="#333" stroke-width="2" />
                
                <!-- 角 -->
                <path d="M35 30 Q30 10 40 5" fill="none" stroke="#67C23A" stroke-width="4" stroke-linecap="round" />
                <path d="M85 30 Q90 10 80 5" fill="none" stroke="#67C23A" stroke-width="4" stroke-linecap="round" />
              </svg>
            </div>
            <div class="password-title">修改密码</div>
            <div class="password-subtitle">为了您的账户安全，请定期更新密码</div>
          </div>

          <el-form :model="form" :rules="rules" ref="pass" class="password-form">
            <el-form-item prop="password">
              <el-input 
                size="medium" 
                class="password-input" 
                prefix-icon="el-icon-key"
                v-model="form.password" 
                placeholder="原密码" 
                show-password>
              </el-input>
            </el-form-item>
            <el-form-item prop="newPassword">
              <el-input 
                size="medium" 
                class="password-input" 
                prefix-icon="el-icon-lock"
                v-model="form.newPassword" 
                placeholder="新密码" 
                show-password>
              </el-input>
            </el-form-item>
            <el-form-item prop="confirmPassword">
              <el-input 
                size="medium" 
                class="password-input" 
                prefix-icon="el-icon-check"
                v-model="form.confirmPassword" 
                placeholder="确认新密码" 
                show-password>
              </el-input>
            </el-form-item>
            <el-form-item class="password-actions">
              <el-button 
                type="primary" 
                size="medium" 
                class="confirm-button" 
                @click="save">
                确认修改
              </el-button>
              <el-button 
                size="medium" 
                class="cancel-button" 
                @click="$router.go(-1)">
                返回
              </el-button>
            </el-form-item>
          </el-form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Password",
  data() {
    return {
      form: {},
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
      rules: {
        password: [
          {required: true, message: '请输入原密码', trigger: 'blur'},
          {min: 3, message: '长度不少于3位', trigger: 'blur'}
        ],
        newPassword: [
          {required: true, message: '请输入新密码', trigger: 'blur'},
          {min: 3, message: '长度不少于3位', trigger: 'blur'}
        ],
        confirmPassword: [
          {required: true, message: '请输入确认密码', trigger: 'blur'},
          {min: 3, message: '长度不少于3位', trigger: 'blur'}
        ],
      }
    }
  },
  created() {
    this.form.username = this.user.username
  },
  methods: {
    save() {
      this.$refs.pass.validate((valid) => {
        if (valid) {
          if (this.form.newPassword !== this.form.confirmPassword) {
            this.$message.error("两次输入的新密码不相同")
            return false
          }
          this.request.post("/user/password", this.form).then(res => {
            if (res.code === '200') {
              this.$message.success("修改密码成功，请重新登录")
              this.$store.commit("logout")
            } else {
              this.$message.error(res.msg)
            }
          })
        }
      })
    },
  }
}
</script>

<style>
.password-wrapper {
  height: 100vh;
  width: 100%;
  position: relative;
  overflow: hidden;
  background: linear-gradient(135deg, #f5f7fa 0%, #e4e8ec 100%);
}

.background-animation {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(135deg, #67C23A 0%, #95D475 100%);
  z-index: 1;
  opacity: 0.8;
}

.background-animation::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: 
      radial-gradient(circle at 15% 50%, rgba(255, 255, 255, 0.2) 0%, transparent 20%),
      radial-gradient(circle at 85% 30%, rgba(255, 255, 255, 0.2) 0%, transparent 20%);
  z-index: 2;
}

.background-animation::after {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: 
      linear-gradient(45deg, transparent 60%, rgba(255, 255, 255, 0.1) 70%, transparent 80%);
  animation: wave 15s infinite linear;
  z-index: 3;
}

@keyframes wave {
  0% {
      background-position: 0% 0%;
  }
  100% {
      background-position: 100% 100%;
  }
}

.main {
  position: relative;
  height: 100vh;
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 10;
}

.password-container {
  position: relative;
  perspective: 1000px;
}

.password-box {
  background-color: rgba(255, 255, 255, 0.95);
  width: 420px;
  padding: 40px;
  border-radius: 16px;
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2), 0 5px 15px rgba(0, 0, 0, 0.05);
  animation: fadeIn 0.8s ease-in-out, float 6s infinite ease-in-out;
  backdrop-filter: blur(10px);
  border: 1px solid rgba(255, 255, 255, 0.2);
  transform-style: preserve-3d;
}

@keyframes float {
  0% {
    transform: translateY(0px);
  }
  50% {
    transform: translateY(-10px);
  }
  100% {
    transform: translateY(0px);
  }
}

.password-header {
  text-align: center;
  margin-bottom: 30px;
}

.password-logo {
  width: 80px;
  height: 80px;
  margin: 0 auto 15px;
}

.logo-svg {
  width: 100%;
  height: 100%;
  filter: drop-shadow(0 2px 5px rgba(0, 0, 0, 0.2));
}

.password-title {
  font-size: 28px;
  font-weight: bold;
  margin-bottom: 5px;
  background: linear-gradient(to right, #67C23A, #95D475);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

.password-subtitle {
  font-size: 14px;
  color: #909399;
  margin-bottom: 20px;
}

.password-form {
  margin-top: 20px;
}

.password-input {
  margin: 15px 0;
}

.password-input >>> .el-input__inner {
  height: 50px;
  border-radius: 10px;
  border: 1px solid rgba(103, 194, 58, 0.2);
  background-color: rgba(255, 255, 255, 0.8);
  transition: all 0.3s;
  padding-left: 45px;
}

.password-input >>> .el-input__prefix {
  left: 15px;
  color: #67C23A;
}

.password-input >>> .el-input__inner:focus {
  border-color: #67C23A;
  box-shadow: 0 0 0 2px rgba(103, 194, 58, 0.2);
  background-color: rgba(255, 255, 255, 1);
}

.password-actions {
  margin: 30px 0 10px 0;
  text-align: center;
}

.confirm-button {
  width: 120px;
  height: 48px;
  border-radius: 10px;
  background-image: linear-gradient(135deg, #67C23A 0%, #95D475 100%);
  border: none;
  font-size: 16px;
  font-weight: 500;
  transition: all 0.3s;
  margin-right: 15px;
}

.confirm-button:hover {
  transform: translateY(-2px) scale(1.02);
  box-shadow: 0 5px 15px rgba(103, 194, 58, 0.4);
}

.cancel-button {
  width: 120px;
  height: 48px;
  border-radius: 10px;
  background-image: linear-gradient(135deg, #e0c3fc 0%, #8ec5fc 100%);
  border: none;
  font-size: 16px;
  font-weight: 500;
  transition: all 0.3s;
  color: white;
}

.cancel-button:hover {
  transform: translateY(-2px) scale(1.02);
  box-shadow: 0 5px 15px rgba(142, 197, 252, 0.4);
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(20px) rotateX(10deg);
  }
  to {
    opacity: 1;
    transform: translateY(0) rotateX(0);
  }
}

/* 适配移动设备 */
@media screen and (max-width: 480px) {
  .password-box {
    width: 90%;
    max-width: 360px;
    padding: 30px 20px;
  }
  
  .confirm-button, .cancel-button {
    width: 100px;
  }
}
</style>
