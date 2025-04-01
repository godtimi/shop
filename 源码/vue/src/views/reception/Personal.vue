<template>
  <div class="personal-page">
    <div class="personal-container">
      <h2 class="page-title">个人资料</h2>
      
      <el-card class="profile-card">
        <div class="profile-form-wrapper">
          <!-- 头像上传区 -->
          <div class="avatar-section">
            <el-upload
              class="avatar-uploader"
              action="http://localhost:9090/file/upload"
              :show-file-list="false"
              :on-success="handleAvatarSuccess">
              <div class="avatar-container">
                <img v-if="form.avatarUrl" :src="form.avatarUrl" class="avatar">
                <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                <div class="avatar-hover-text">
                  <i class="el-icon-camera"></i>
                  <span>更换头像</span>
                </div>
              </div>
            </el-upload>
            <div class="avatar-tip">点击更换头像</div>
          </div>
          
          <!-- 个人信息表单 -->
          <el-form label-width="80px" size="medium" class="profile-form">
            <el-form-item label="用户名">
              <el-input 
                v-model="form.username" 
                disabled 
                autocomplete="off"
                prefix-icon="el-icon-user">
              </el-input>
            </el-form-item>
            <el-form-item label="昵称">
              <el-input 
                v-model="form.nickname" 
                autocomplete="off"
                prefix-icon="el-icon-edit">
              </el-input>
            </el-form-item>
            <el-form-item label="邮箱">
              <el-input 
                v-model="form.email" 
                autocomplete="off"
                prefix-icon="el-icon-message">
              </el-input>
            </el-form-item>
            <el-form-item label="电话">
              <el-input 
                v-model="form.phone" 
                autocomplete="off"
                prefix-icon="el-icon-phone">
              </el-input>
            </el-form-item>
            <el-form-item label="地址">
              <el-input 
                type="textarea" 
                v-model="form.address" 
                autocomplete="off"
                rows="3">
              </el-input>
            </el-form-item>
            <el-form-item class="form-buttons">
              <el-button @click="reten" plain>返回</el-button>
              <el-button type="primary" @click="save" class="save-btn">保存修改</el-button>
            </el-form-item>
          </el-form>
        </div>
      </el-card>
    </div>
  </div>
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
        if (res.code === '200') {
          this.$message.success("修改成功")
          //触发父级方法
          this.$emit("refreshUser")
        } else {
          this.$message.error("保存失败")
        }
      })
    },
    reten() {
      this.$router.push('/reception/home')
    }
  }
}
</script>

<style scoped>
.personal-page {
  padding: 20px 0;
  background-color: #f5f7fa;
  min-height: calc(100vh - 200px);
}

.personal-container {
  width: 90%;
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
}

.page-title {
  font-size: 24px;
  color: #333;
  margin-bottom: 30px;
  font-weight: 500;
  position: relative;
  padding-left: 15px;
  border-left: 4px solid #67C23A;
}

.profile-card {
  border-radius: 8px;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
  margin-bottom: 30px;
}

.profile-form-wrapper {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 20px;
}

.avatar-section {
  text-align: center;
  margin-bottom: 30px;
}

.avatar-container {
  position: relative;
  width: 150px;
  height: 150px;
  border-radius: 50%;
  margin: 0 auto;
  overflow: hidden;
  border: 4px solid #fff;
  box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
  cursor: pointer;
  transition: all 0.3s;
}

.avatar-container:hover .avatar-hover-text {
  opacity: 1;
}

.avatar-hover-text {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  color: white;
  opacity: 0;
  transition: opacity 0.3s;
}

.avatar-hover-text i {
  font-size: 24px;
  margin-bottom: 5px;
}

.avatar-tip {
  margin-top: 10px;
  color: #909399;
  font-size: 14px;
}

.avatar {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}

.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 150px;
  height: 150px;
  line-height: 150px;
  text-align: center;
  border-radius: 50%;
  background-color: #f7f7f7;
}

.profile-form {
  width: 100%;
  max-width: 500px;
}

.profile-form >>> .el-form-item__label {
  font-weight: 500;
  color: #606266;
}

.profile-form >>> .el-input__inner {
  border-radius: 4px;
  border: 1px solid #dcdfe6;
  transition: all 0.3s;
}

.profile-form >>> .el-input__inner:focus {
  border-color: #67C23A;
  box-shadow: 0 0 0 2px rgba(103, 194, 58, 0.2);
}

.profile-form >>> .el-textarea__inner {
  border-radius: 4px;
  transition: all 0.3s;
}

.profile-form >>> .el-textarea__inner:focus {
  border-color: #67C23A;
  box-shadow: 0 0 0 2px rgba(103, 194, 58, 0.2);
}

.form-buttons {
  margin-top: 20px;
  text-align: right;
}

.save-btn {
  background: linear-gradient(135deg, #67C23A, #95D475);
  border: none;
  padding: 10px 20px;
  transition: all 0.3s;
}

.save-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(103, 194, 58, 0.3);
}

@media screen and (max-width: 768px) {
  .personal-container {
    width: 95%;
    padding: 15px 10px;
  }
  
  .profile-form {
    max-width: 100%;
  }
  
  .form-buttons {
    display: flex;
    flex-direction: column;
    align-items: stretch;
  }
  
  .form-buttons .el-button {
    margin-left: 0 !important;
    margin-bottom: 10px;
  }
}
</style>