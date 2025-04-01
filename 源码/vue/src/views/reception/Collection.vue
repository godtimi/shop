<template>
  <div class="collection-page">
    <div class="collection-container">
      <h2 class="page-title">我的收藏</h2>

      <!-- 搜索框 -->
      <div class="search-box">
        <el-input 
          size="medium" 
          placeholder="搜索商品" 
          prefix-icon="el-icon-search"
          class="search-input" 
          v-model="name">
        </el-input>
        <el-button class="search-btn" type="primary" @click="load" size="medium">
          搜索
        </el-button>
      </div>

      <!-- 空状态提示 -->
      <div v-if="tableData.length === 0" class="empty-state">
        <i class="el-icon-star-off empty-icon"></i>
        <p class="empty-text">暂无收藏商品</p>
        <el-button type="primary" @click="$router.push('/reception/home')" class="browse-btn">
          浏览商品
        </el-button>
      </div>

      <!-- 商品卡片列表 -->
      <div v-else class="product-grid">
        <div 
          v-for="item in tableData" 
          :key="item.id" 
          class="product-card-wrapper"
          @click="viewProduct(item.id)"
        >
          <div class="product-card">
            <div class="product-image-container">
              <img :src="item.url" class="product-image">
              <div class="product-actions">
                <el-button 
                  type="danger" 
                  icon="el-icon-delete" 
                  circle 
                  size="mini"
                  class="action-btn"
                  title="取消收藏"
                  @click.stop="cancelCollection(item.id)">
                </el-button>
                <el-button 
                  type="primary" 
                  icon="el-icon-shopping-cart-2" 
                  circle 
                  size="mini"
                  class="action-btn"
                  title="加入购物车"
                  @click.stop="addToCart(item)">
                </el-button>
              </div>
            </div>
            <div class="product-info">
              <h3 class="product-name">{{ item.name }}</h3>
              <p class="product-description">{{ item.description }}</p>
              <div class="product-price">
                <span class="price-symbol">￥</span>{{ item.sellPrice }}
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 分页 -->
      <div class="pagination-container" v-if="tableData.length > 0">
        <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="pageNum"
          :page-sizes="[8, 16, 24, 32]"
          :page-size="pageSize"
          layout="total, sizes, prev, pager, next"
          :total="total"
          background>
        </el-pagination>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Collection",
  data() {
    return {
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
      username: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")).username : "",
      allPrice: 0,
      expends: [],
      checks: [],
      menuData: [],
      name: "",
      total: 0,
      pageNum: 1,
      pageSize: 8,
      tableData: [],
      collapseBtnClass: 'el-icon-s-fold',
      isCollapse: false,
      sideWidth: 200,
      logoText: true,
      dialogFormVisible: false,
      menuDiaVisible: false,
      form: {},
      multipleSelection: [],
      props: {
        label: "name"
      },
    }
  },

  created() {
    this.load()
  },

  methods: {
    viewProduct(id) {
      this.$router.push('/reception/detail?id=' + id)
      this.form.pid = id
      if (this.user.id) {
        this.request.post("/user-visit-log", this.form).then(res => {
        })
      }
    },
    
    // 取消收藏
    cancelCollection(id) {
      if (!this.user.id) {
        this.$message.warning("请登录后操作")
        return
      }
      this.request.delete("/collection/" + id + "/" + this.user.username).then(res => {
        if (res.code === '200') {
          this.$message.success("取消收藏成功")
          this.load()
        } else {
          this.$message.error("取消收藏失败")
        }
      })
    },
    
    // 添加到购物车
    addToCart(item) {
      if (!this.user.id) {
        this.$message.warning("请登录后操作")
        return
      }
      
      const cartItem = {
        productId: item.id
      }
      
      this.request.post('/cart', cartItem).then(res => {
        if (res.code === '200') {
          this.$message.success("添加购物车成功")
        } else {
          this.$message.error("添加购物车失败")
        }
      })
    },
    
    reset() {
      this.name = ""
      this.load()
    },
    
    handleSizeChange(pageSize) {
      this.pageSize = pageSize
      this.load()
    },
    
    handleCurrentChange(pageNum) {
      this.pageNum = pageNum
      this.load()
    },
    
    load() {
      if (!this.user.id) {
        this.$message.warning("请登录后操作")
        return
      }
      this.request.get("/collection/pageReception", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          productName: this.name,
          username: this.username
        }
      }).then(res => {
        this.tableData = res.data.records || res.data
        this.total = res.data.total || res.data.length
      })
    }
  }
}
</script>

<style scoped>
.collection-page {
  padding: 20px 0;
  background-color: #f5f7fa;
  min-height: calc(100vh - 200px);
}

.collection-container {
  width: 90%;
  max-width: 1200px;
  margin: 0 auto;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.05);
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

.search-box {
  padding: 15px;
  background-color: #f8f9fa;
  border-radius: 6px;
  margin-bottom: 20px;
  display: flex;
  align-items: center;
}

.search-input {
  width: 300px;
}

.search-input >>> .el-input__inner {
  border-radius: 4px;
  border: 1px solid #dcdfe6;
}

.search-btn {
  margin-left: 15px;
  background: linear-gradient(135deg, #67C23A, #95D475);
  border: none;
  border-radius: 4px;
  transition: all 0.3s;
}

.search-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(103, 194, 58, 0.3);
}

/* 空状态样式 */
.empty-state {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 60px 0;
  color: #909399;
}

.empty-icon {
  font-size: 60px;
  color: #dcdfe6;
  margin-bottom: 20px;
}

.empty-text {
  font-size: 16px;
  margin-bottom: 20px;
}

.browse-btn {
  background: linear-gradient(135deg, #67C23A, #95D475);
  border: none;
  border-radius: 4px;
  transition: all 0.3s;
}

.browse-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(103, 194, 58, 0.3);
}

/* 商品卡片网格 */
.product-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
  gap: 20px;
  margin-bottom: 30px;
}

.product-card-wrapper {
  cursor: pointer;
}

.product-card {
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.05);
  transition: all 0.3s;
  height: 100%;
  display: flex;
  flex-direction: column;
}

.product-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
}

.product-image-container {
  position: relative;
  width: 100%;
  height: 220px;
  overflow: hidden;
}

.product-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.5s;
}

.product-card:hover .product-image {
  transform: scale(1.05);
}

.product-actions {
  position: absolute;
  bottom: 10px;
  right: 10px;
  display: flex;
  gap: 8px;
  opacity: 0;
  transition: opacity 0.3s;
}

.product-card:hover .product-actions {
  opacity: 1;
}

.action-btn {
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
}

.product-info {
  padding: 15px;
  flex-grow: 1;
  display: flex;
  flex-direction: column;
}

.product-name {
  font-size: 16px;
  color: #303133;
  margin: 0 0 8px 0;
  line-height: 1.4;
  height: 44px;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  word-break: break-all;
}

.product-description {
  font-size: 14px;
  color: #909399;
  margin: 0 0 10px 0;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.product-price {
  margin-top: auto;
  color: #f56c6c;
  font-size: 18px;
  font-weight: 600;
}

.price-symbol {
  font-size: 14px;
  margin-right: 2px;
}

.pagination-container {
  text-align: center;
  padding: 20px 0;
}

@media screen and (max-width: 768px) {
  .collection-container {
    width: 95%;
    padding: 15px 10px;
  }
  
  .search-box {
    flex-direction: column;
    align-items: flex-start;
  }
  
  .search-input {
    width: 100% !important;
    margin-bottom: 10px;
  }
  
  .search-btn {
    width: 100%;
    margin-left: 0;
  }
  
  .product-grid {
    grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
    gap: 15px;
  }
  
  .product-image-container {
    height: 150px;
  }
  
  .product-name {
    font-size: 14px;
    height: 40px;
  }
  
  .product-description {
    font-size: 12px;
  }
  
  .product-price {
    font-size: 16px;
  }
}
</style>
