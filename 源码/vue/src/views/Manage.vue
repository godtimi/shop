<template>
  <el-container class="manage-container">
    <el-aside :width="sideWidth+'px'" class="aside-container">
      <!--     导航栏-->
      <Aside :isCollapse="isCollapse" :logoText="logoText"/>
    </el-aside>

    <el-container class="main-container">
      <el-header class="header-wrapper">
        <Header :collapseBtnClass="collapseBtnClass" :collapse="collapse" :user="user"/>
      </el-header>

      <el-main class="main-content">
        <!--        表示当前页面的子路由会在router-view里面展示-->
        <router-view @refreshUser="getUser"/>
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
import Aside from "@/components/Aside";
import Header from "@/components/Header";

export default {
  name: 'Manage',
  components: {Aside, Header},
  data() {
    return {
      collapseBtnClass: 'el-icon-s-fold',
      isCollapse: false,
      sideWidth: 200,
      logoText: true,
      user: {},
    }
  },
  created() {
    this.getUser()
  },
  methods: {
    //点击收缩按钮触发
    collapse() {
      this.isCollapse = !this.isCollapse
      if (this.isCollapse) { //收缩
        this.sideWidth = 64;
        this.collapseBtnClass = 'el-icon-s-unfold';
        this.logoText = false;
      } else { //展开
        this.sideWidth = 200;
        this.collapseBtnClass = 'el-icon-s-fold';
        this.logoText = true;
      }
    },
    //获取用户最新数据
    getUser() {
      let username = localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")).username : ""
      //从后台获取数据
      this.request.get("/user/personify/" + username).then(res => {
        //重新赋值
        this.user = res.data
      })
    }
  }
}
</script>

<style scoped>
.manage-container {
  min-height: 100vh;
  background-color: #f5f7fa;
}

.aside-container {
  background-color: #67C23A;
  box-shadow: 2px 0 8px rgba(0, 0, 0, 0.15);
  transition: width 0.3s;
  z-index: 999;
  overflow: hidden;
}

.main-container {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

.header-wrapper {
  padding: 0;
  box-shadow: 0 1px 4px rgba(0, 0, 0, 0.1);
  z-index: 998;
}

.main-content {
  padding: 20px;
  background-color: #f5f7fa;
}

/* 全局样式优化 */
:deep(.el-table) {
  border-radius: 4px;
  overflow: hidden;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.05);
}

:deep(.el-card) {
  border-radius: 4px;
  overflow: hidden;
  border: none;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.05);
  margin-bottom: 20px;
}

:deep(.el-card__header) {
  background-color: #f8f9fa;
  padding: 15px 20px;
  font-weight: bold;
  color: #303133;
  border-bottom: 1px solid #ebeef5;
}

:deep(.el-pagination) {
  padding: 15px 0;
  text-align: right;
}

:deep(.el-button--primary) {
  background-color: #67C23A;
  border-color: #67C23A;
}

:deep(.el-button--primary:hover) {
  background-color: #85ce61;
  border-color: #85ce61;
}

:deep(.el-button--success) {
  background-color: #85ce61;
  border-color: #85ce61;
}

:deep(.el-button--success:hover) {
  background-color: #95d475;
  border-color: #95d475;
}
</style>
