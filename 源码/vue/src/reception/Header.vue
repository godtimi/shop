<template>
  <div class="header-wrapper">
    <div class="header-container">
      <!-- 系统名称 -->
      <div class="brand-container">
        <div class="brand-name">
          <div class="sheep-logo">
            <svg viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg" class="brand-svg">
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
          <span class="brand-text">羊羊生鲜</span>
        </div>
      </div>
      
      <!-- 菜单 -->
      <div class="menu-container">
        <Aside></Aside>
      </div>

      <!-- 位置信息 -->
      <div class="location-container" v-if="Object.keys(this.user).length">
        <i class="el-icon-location-information location-icon"></i>
        <span v-if="this.location" class="location-text">当前位置: {{ this.location }}</span>
        <span v-else class="location-loading">正在获取当前位置...</span>
      </div>

      <!-- 用户信息 -->
      <div class="user-container">
        <div v-if="!user.username" class="login-buttons">
          <el-button type="primary" size="small" round @click="$router.push('/login')">登录</el-button>
          <el-button type="warning" size="small" round @click="$router.push('/register')">注册</el-button>
        </div>

        <div v-else class="user-profile">
          <el-dropdown trigger="click">
            <div class="user-dropdown-link">
              <div class="avatar-container">
                <img :src="user.avatarUrl" alt="" class="user-avatar">
              </div>
              <span class="username">{{ user.nickname }}</span>
              <i class="el-icon-arrow-down"></i>
            </div>

            <el-dropdown-menu slot="dropdown" class="user-dropdown-menu">
              <el-dropdown-item class="dropdown-item">
                <span @click="personalinfo"><i class="el-icon-user"></i> 个人信息</span>
              </el-dropdown-item>

              <el-dropdown-item class="dropdown-item">
                <span @click="Address"><i class="el-icon-location"></i> 收货地址</span>
              </el-dropdown-item>

              <el-dropdown-item class="dropdown-item">
                <span @click="passWord"><i class="el-icon-lock"></i> 修改密码</span>
              </el-dropdown-item>

              <el-dropdown-item class="dropdown-item">
                <span @click="logout"><i class="el-icon-switch-button"></i> 退出</span>
              </el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </div>
      </div>
    </div>
    
    <!-- 搜索框 -->
    
  </div>
</template>

<script>
import Aside from "@/reception/Aside";
import myBMap from "@/bmp";

export default {
  inject: ['reload'],
  name: "Header",
  props: {
    user: Object
  },
  components: {Aside},
  data() {
    return {
      name: "",
      showFixedSearch: true,
      location: localStorage.getItem("location")
    }
  },
  methods: {
    Address() {
      this.$router.push("/reception/address")
    },
    passWord() {
      this.$router.push("/reception/password")
    },
    getCity() {
      if (!localStorage.getItem("location")) {
        myBMap.init().then(BMap => {
          const geolocation = new BMap.Geolocation()
          geolocation.getCurrentPosition((position) => {
            let city = position.address.city;             //获取城市信息
            let province = position.address.province;     //获取省份信息
            localStorage.setItem("location", city)
            this.reload()
          }, (e) => {
            console.log(e)
            console.log('定位失败')
          }, {provider: 'baidu'})
        })
      }
    },
    display() {
      this.$store.commit("search", this.name)
      if (this.name === "") {
        this.$router.push("/reception/home")
      } else {
        this.$router.push("/reception/home")
        this.$router.push("/reception/display")
      }
    },
    logout() {
      this.$store.commit("logout")
      this.$message.success("退出成功")
    },
    personalinfo() {
      this.$router.push("/reception/personal")
    },
  },
  mounted() {
    this.$nextTick(() => {
      setInterval(this.getCity, 5000);
    })
  }
}
</script>

<style scoped>
.header-wrapper {
  width: 100%;
  border-bottom: 1px solid #eee;
  z-index: 999;
  position: fixed;
  margin-bottom: 15px;
  padding: 10px 0;
  background-color: white;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
}

.header-container {
  display: flex;
  height: 60px;
  line-height: 60px;
  margin-bottom: 10px;
  width: 95%;
  max-width: 1358px;
  margin: 0 auto;
}

.brand-container {
  width: 300px;
  display: flex;
  align-items: center;
}

.brand-name {
  font-size: 22px;
  font-weight: bold;
  color: #67C23A;
  display: flex;
  align-items: center;
}

.sheep-logo {
  width: 50px;
  height: 50px;
  margin-right: 10px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.brand-svg {
  width: 100%;
  height: 100%;
  filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));
  transition: transform 0.3s ease;
}

.brand-svg:hover {
  transform: scale(1.1);
}

.brand-text {
  font-size: 22px;
  font-weight: bold;
  background: linear-gradient(to right, #67C23A, #85ce61);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

.brand-logo {
  width: 36px;
  height: 36px;
  margin-right: 8px;
}

.menu-container {
  flex: 1;
}

.location-container {
  display: flex;
  align-items: center;
  width: 200px;
  color: #666;
  font-size: 14px;
  padding-right: 20px;
}

.location-icon {
  color: #67C23A;
  margin-right: 5px;
  font-size: 16px;
}

.location-text {
  color: #606266;
}

.location-loading {
  color: #909399;
  font-style: italic;
}

.user-container {
  width: 220px;
  text-align: right;
}

.login-buttons {
  text-align: right;
  padding-right: 20px;
}

.login-buttons .el-button {
  margin-left: 10px;
}

.user-profile {
  display: flex;
  align-items: center;
  justify-content: flex-end;
}

.user-dropdown-link {
  display: flex;
  align-items: center;
  cursor: pointer;
  padding: 0 10px;
  border-radius: 20px;
  transition: background-color 0.3s;
}

.user-dropdown-link:hover {
  background-color: #f5f7fa;
}

.avatar-container {
  margin-right: 8px;
}

.user-avatar {
  width: 36px;
  height: 36px;
  border-radius: 50%;
  border: 2px solid #fff;
  box-shadow: 0 0 4px rgba(0, 0, 0, 0.2);
  object-fit: cover;
}

.username {
  font-size: 14px;
  color: #606266;
  margin-right: 5px;
}

.user-dropdown-menu {
  width: 130px;
  border-radius: 4px;
  overflow: hidden;
}

.dropdown-item {
  padding: 10px 15px;
}

.dropdown-item i {
  margin-right: 8px;
  color: #909399;
}

.dropdown-item:hover i {
  color: #67C23A;
}

.dropdown-item span {
  display: flex;
  align-items: center;
  width: 100%;
  cursor: pointer;
  font-size: 14px;
}

.search-container {
  width: 500px;
  margin: 10px auto;
  display: flex;
  align-items: center;
}

.search-input {
  border-radius: 20px 0 0 20px !important;
}

.search-input >>> .el-input__inner {
  border-radius: 20px 0 0 20px;
  border-right: none;
  height: 40px;
}

.search-button {
  border-radius: 0 20px 20px 0;
  height: 40px;
  background: linear-gradient(135deg, #67C23A, #95D475);
  border: none;
}
</style>
