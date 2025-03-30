<template>
  <div class="nav-menu-container">
    <el-menu :default-active="activeIndex" class="nav-menu" mode="horizontal" router background-color="transparent" text-color="#606266" active-text-color="#67C23A">
      <el-menu-item index="/reception/home" class="nav-item">
        <i class="el-icon-s-home"></i> 首页
      </el-menu-item>

      <el-menu-item index="/reception/cart" class="nav-item">
        <i class="el-icon-shopping-cart-2"></i> 购物车
      </el-menu-item>

      <el-menu-item index="/reception/collection" class="nav-item">
        <i class="el-icon-star-off"></i> 收藏
      </el-menu-item>

      <el-menu-item index="/reception/orders" class="nav-item">
        <i class="el-icon-s-order"></i> 我的订单
      </el-menu-item>

      <el-menu-item index="/reception/chat" class="nav-item">
        <i class="el-icon-chat-line-round"></i> 联系客服
      </el-menu-item>
    </el-menu>
  </div>
</template>

<script>
export default {
  name: "Aside",
  data() {
    return {
      activeIndex: this.$route.path
    };
  },
  watch: {
    $route(to) {
      this.activeIndex = to.path;
    }
  }
}
</script>

<style scoped>
.nav-menu-container {
  width: 100%;
}

.nav-menu {
  border-bottom: none !important;
  display: flex;
  justify-content: center;
}

.nav-item {
  height: 60px;
  line-height: 60px;
  margin: 0 5px;
  font-size: 15px;
  position: relative;
}

.nav-item i {
  margin-right: 5px;
  font-size: 16px;
}

.nav-item:hover {
  color: #67C23A;
}

/* 激活状态下的样式 */
.el-menu-item.is-active {
  font-weight: bold;
  background-color: transparent !important;
}

.el-menu-item.is-active::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
  width: 30px;
  height: 3px;
  background-color: #67C23A;
  border-radius: 3px;
}

/* 修复鼠标悬停效果 */
.el-menu--horizontal > .el-menu-item:not(.is-disabled):hover {
  background-color: rgba(103, 194, 58, 0.1) !important;
}
</style>