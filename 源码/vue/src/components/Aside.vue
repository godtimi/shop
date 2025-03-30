<template>
  <el-menu :default-openeds="[opens]"
           style="min-height: 100% ;overflow-x: hidden"
           text-color="#ffffff"
           active-text-color="#ffffff"
           :collapse-transition="false"
           :collapse="isCollapse"
           background-color="#67C23A"
           router
  >
    <div class="logo-container">
      <div class="sheep-logo" v-show="!isCollapse">
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
      <img v-show="isCollapse" src="../assets/logo.png" alt="" class="collapsed-logo">
      <div class="logo-text" v-show="logoText">
        <span class="logo-text-main">羊羊生鲜</span>
        <span class="logo-text-sub">后台管理</span>
      </div>
    </div>

    <div v-for="item in menus" :key="item.id">
      <!--      有路径  一级   无 二级菜单-->
      <div v-if="item.path">
        <el-menu-item :index="item.path" class="menu-item">
          <i :class="item.icon" class="menu-icon"></i>
          <span slot="title">{{ item.name }}</span>
        </el-menu-item>
      </div>

      <div v-else>
        <el-submenu :index="item.id+''" class="menu-submenu">
          <!--          一级-->
          <template slot="title">
            <i :class="item.icon" class="menu-icon"></i>
            <span slot="title" v-show="logoText">{{ item.name }}</span>
          </template>
          <div v-for="subItem in item.children" :key="subItem.id">
            <!--          一级下面的二级-->
            <el-menu-item :index="subItem.path" class="menu-sub-item">
              <i :class="subItem.icon" class="menu-sub-icon"></i>
              <span slot="title">{{ subItem.name }}</span>
            </el-menu-item>
          </div>
        </el-submenu>
      </div>
    </div>

    <!--    <el-menu-item index="/home">-->
    <!--      <i class="el-icon-house" v-show="true"></i>-->
    <!--      <span slot="title">主页</span>-->
    <!--    </el-menu-item>-->

    <!--    <el-submenu index="2">-->
    <!--      <template slot="title">-->
    <!--        <i class="el-icon-menu"></i>-->
    <!--        <span slot="title">系统管理</span>-->
    <!--      </template>-->

    <!--      <el-menu-item index="/user">-->
    <!--        <i class="el-icon-s-custom"></i>-->
    <!--        <span slot="title">用户管理</span>-->
    <!--      </el-menu-item>-->

    <!--      <el-menu-item index="/file">-->
    <!--        <i class="el-icon-document"></i>-->
    <!--        <span slot="title">文件管理</span>-->
    <!--      </el-menu-item>-->
    <!--      <el-menu-item index="/role">-->
    <!--        <i class="el-icon-document"></i>-->
    <!--        <span slot="title">角色管理</span>-->
    <!--      </el-menu-item>-->
    <!--      <el-menu-item index="/menu">-->
    <!--        <i class="el-icon-document"></i>-->
    <!--        <span slot="title">菜单管理</span>-->
    <!--      </el-menu-item>-->
    <!--    </el-submenu>-->

  </el-menu>
</template>

<script>
export default {
  name: "Aside",
  props: {
    isCollapse: Boolean,
    logoText: Boolean,
  },
  data() {
    return {
      opens: localStorage.getItem("menus") ? JSON.parse(localStorage.getItem("menus")).map(v => v.id + '') : [],
      menus: localStorage.getItem("menus") ? JSON.parse(localStorage.getItem("menus")) : []
    }
  },
  methods: {}
}
</script>

<style scoped>
.logo-container {
  height: 64px;
  padding: 10px 0;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: #529b2e;
  overflow: hidden;
  transition: all 0.3s;
  position: relative;
  box-shadow: 0 1px 4px rgba(0, 0, 0, 0.2);
}

.sheep-logo {
  width: 40px;
  height: 40px;
  margin-right: 8px;
}

.logo-svg {
  width: 100%;
  height: 100%;
  filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));
  transition: transform 0.3s ease;
}

.collapsed-logo {
  width: 32px;
  height: 32px;
  filter: brightness(1.5);
  transition: all 0.3s;
}

.logo-text {
  display: flex;
  flex-direction: column;
  line-height: 1.2;
}

.logo-text-main {
  color: #ffffff;
  font-size: 18px;
  font-weight: bold;
  text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
}

.logo-text-sub {
  color: #ffffff;
  font-size: 12px;
  opacity: 0.8;
}

.menu-item {
  transition: all 0.3s;
  border-left: 3px solid transparent;
  margin: 4px 0;
  position: relative;
  overflow: hidden;
}

.menu-item:hover {
  background-color: #85ce61 !important;
  color: #fff;
}

.menu-item.is-active {
  background-color: #529b2e !important;
  border-left: 3px solid #ffffff;
}

.menu-icon {
  margin-right: 8px;
  font-size: 18px;
  width: 24px;
  text-align: center;
  transition: all 0.3s;
}

.menu-submenu >>> .el-submenu__title {
  transition: all 0.3s;
  margin: 4px 0;
  position: relative;
  overflow: hidden;
}

.menu-submenu >>> .el-submenu__title:hover {
  background-color: #85ce61 !important;
}

.menu-sub-item {
  transition: all 0.3s;
  padding-left: 50px !important;
  background-color: #5daf34 !important;
  margin: 4px 0;
  border-radius: 0 4px 4px 0;
  position: relative;
  overflow: hidden;
}

.menu-sub-item:hover {
  background-color: #85ce61 !important;
}

.menu-sub-item.is-active {
  background-color: #529b2e !important;
  border-left: 3px solid #ffffff;
}

.menu-sub-icon {
  margin-right: 5px;
  width: 22px;
  text-align: center;
  transition: all 0.3s;
}

/* 菜单折叠动画效果 */
.el-menu--collapse .el-menu-item, 
.el-menu--collapse .el-submenu__title {
  text-align: center;
}

/* 菜单图标悬停效果 */
.menu-item:hover .menu-icon,
.menu-submenu:hover .menu-icon,
.menu-sub-item:hover .menu-sub-icon {
  color: #ffffff;
  transform: scale(1.1);
}
</style>