<template>
  <div>
    <div class="header-container">
      <div class="header-left">
        <span :class="collapseBtnClass" class="collapse-btn" @click="collapse"></span>

        <el-breadcrumb separator="/" class="breadcrumb">
          <el-breadcrumb-item
              :to="{ path: item.path }"
              v-for="item in breadList"
              :key="item.path">
            {{ item.meta.title }}
          </el-breadcrumb-item>
        </el-breadcrumb>
      </div>

      <div class="header-right">
        <div class="time-display">
          <i class="el-icon-time"></i>
          <span>{{ currentDate }}</span>
        </div>
        
        <el-dropdown class="user-dropdown">
          <div class="user-info">
            <div class="avatar-container">
              <img :src="user.avatarUrl" alt="" class="user-avatar">
            </div>
            <span class="username">{{ user.nickname }}</span> 
            <i class="el-icon-arrow-down"></i>
          </div>

          <el-dropdown-menu slot="dropdown" class="user-dropdown-menu">
            <el-dropdown-item class="dropdown-item">
              <span @click="passWord"><i class="el-icon-lock"></i> 修改密码</span>
            </el-dropdown-item>

            <el-dropdown-item class="dropdown-item">
              <span @click="personalinfo"><i class="el-icon-user"></i> 个人信息</span>
            </el-dropdown-item>
            
            <el-dropdown-item class="dropdown-item">
              <span @click="logout"><i class="el-icon-switch-button"></i> 退出系统</span>
            </el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Header",
  props: {
    collapseBtnClass: String,
    collapse: Function,
    user: Object
  },
  data() {
    return {
      currentDate: ''
    }
  },
  computed: {
    breadList() {
      return this.$route.matched
    }
  },
  methods: {
    logout() {
      this.$store.commit("logout")
      this.$message.success("退出成功")
    },
    personalinfo() {
      this.$router.push("/person")
    },
    passWord() {
      this.$router.push("/password")
    },
    updateTime() {
      const now = new Date();
      const year = now.getFullYear();
      const month = String(now.getMonth() + 1).padStart(2, '0');
      const day = String(now.getDate()).padStart(2, '0');
      const hours = String(now.getHours()).padStart(2, '0');
      const minutes = String(now.getMinutes()).padStart(2, '0');
      const seconds = String(now.getSeconds()).padStart(2, '0');
      this.currentDate = `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
    }
  },
  mounted() {
    this.updateTime();
    setInterval(this.updateTime, 1000);
  }
}
</script>

<style scoped>
.header-container {
  height: 60px;
  line-height: 60px;
  display: flex;
  justify-content: space-between;
  padding: 0 15px;
  box-shadow: 0 1px 4px rgba(0, 21, 41, 0.08);
  background: linear-gradient(to right, #67C23A, #85ce61);
}

.header-left {
  display: flex;
  align-items: center;
  flex: 1;
}

.collapse-btn {
  cursor: pointer;
  font-size: 20px;
  padding: 0 10px;
  color: #fff;
  transition: all 0.3s;
}

.collapse-btn:hover {
  transform: scale(1.1);
  color: #fff;
}

.breadcrumb {
  display: inline-block;
  margin-left: 15px;
  font-size: 14px;
}

.breadcrumb >>> .el-breadcrumb__inner {
  color: rgba(255, 255, 255, 0.9) !important;
  font-weight: normal !important;
}

.breadcrumb >>> .el-breadcrumb__item:last-child .el-breadcrumb__inner {
  color: #fff !important;
  font-weight: bold !important;
}

.breadcrumb >>> .el-breadcrumb__separator {
  color: rgba(255, 255, 255, 0.7) !important;
}

.header-right {
  display: flex;
  align-items: center;
}

.time-display {
  margin-right: 20px;
  color: #fff;
  font-size: 14px;
  display: flex;
  align-items: center;
}

.time-display i {
  margin-right: 5px;
  font-size: 16px;
}

.user-dropdown {
  cursor: pointer;
  padding: 0 10px;
  height: 60px;
  display: flex;
  align-items: center;
  position: relative;
}

.user-info {
  display: flex;
  align-items: center;
  padding: 0 10px;
  height: 60px;
  transition: background-color 0.3s;
  color: #fff;
}

.user-info:hover {
  background-color: rgba(255, 255, 255, 0.1);
}

.avatar-container {
  margin-right: 8px;
}

.user-avatar {
  width: 36px;
  height: 36px;
  border-radius: 50%;
  object-fit: cover;
  border: 2px solid rgba(255, 255, 255, 0.6);
  box-shadow: 0 0 4px rgba(0, 0, 0, 0.1);
  transition: all 0.3s;
}

.user-avatar:hover {
  border-color: #fff;
  transform: scale(1.05);
}

.username {
  font-size: 14px;
  color: #fff;
  margin-right: 5px;
}

.user-dropdown-menu {
  width: 130px;
  margin-top: 5px;
  border-radius: 4px;
  overflow: hidden;
}

.dropdown-item {
  display: flex;
  align-items: center;
  font-size: 14px;
  padding: 10px 15px;
  transition: all 0.3s;
}

.dropdown-item:hover {
  background-color: #f8f8f8;
  color: #67C23A;
}

.dropdown-item i {
  margin-right: 8px;
  font-size: 16px;
  color: #909399;
  transition: all 0.3s;
}

.dropdown-item:hover i {
  color: #67C23A;
}

.dropdown-item span {
  display: flex;
  align-items: center;
  width: 100%;
  cursor: pointer;
}
</style>