<template>
  <div id="app">
    <router-view v-if="isRouterAlive"></router-view>
  </div>
</template>
<script>
export default {
  name: 'App',
  provide() {    //父组件中通过provide来提供变量，在子组件中通过inject来注入变量。
    return {
      reload: this.reload
    }
  },
  data() {
    return {
      isRouterAlive: true                    //控制视图是否显示的变量
    }
  },
  methods: {
    reload() {
      this.isRouterAlive = false;            //先关闭，
      this.$nextTick(function () {
        this.isRouterAlive = true;         //再打开
      })
    }
  },
}
</script>

<style>
/* 全局变量 */
:root {
  --primary-color: #1890ff;
  --success-color: #67c23a;
  --warning-color: #e6a23c;
  --danger-color: #f56c6c;
  --info-color: #909399;
  --text-color: #303133;
  --text-color-secondary: #606266;
  --border-color: #dcdfe6;
  --background-color: #f5f7fa;
}

/* 全局样式 */
body {
  margin: 0;
  padding: 0;
  font-family: "Helvetica Neue", Helvetica, "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", "微软雅黑", Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: var(--text-color);
  background-color: var(--background-color);
}

/* 滚动条样式 */
::-webkit-scrollbar {
  width: 8px;
  height: 8px;
}

::-webkit-scrollbar-track {
  background: #f1f1f1;
  border-radius: 4px;
}

::-webkit-scrollbar-thumb {
  background: #c1c1c1;
  border-radius: 4px;
}

::-webkit-scrollbar-thumb:hover {
  background: #a8a8a8;
}

/* 卡片样式优化 */
.el-card {
  border-radius: 8px;
  overflow: hidden;
  transition: all 0.3s;
  border: none;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.05);
}

.el-card:hover {
  box-shadow: 0 4px 20px 0 rgba(0, 0, 0, 0.08);
  transform: translateY(-2px);
}

/* 按钮样式优化 */
.el-button {
  border-radius: 4px;
  font-weight: 500;
}

.el-button--primary {
  background-color: var(--primary-color);
}

.el-button--success {
  background-color: var(--success-color);
}

.el-button--warning {
  background-color: var(--warning-color);
}

.el-button--danger {
  background-color: var(--danger-color);
}

/* 表格样式优化 */
.el-table {
  border-radius: 8px;
  overflow: hidden;
}

.el-table th {
  background-color: #f5f7fa !important;
  color: var(--text-color-secondary);
  font-weight: 600;
}

/* 输入框样式优化 */
.el-input__inner {
  border-radius: 4px;
}

/* 统一过渡动画 */
.fade-enter-active, .fade-leave-active {
  transition: opacity 0.3s;
}
.fade-enter, .fade-leave-to {
  opacity: 0;
}

/* 改进的布局间距 */
.el-main {
  padding: 20px !important;
}

.el-form-item {
  margin-bottom: 20px;
}
</style>
