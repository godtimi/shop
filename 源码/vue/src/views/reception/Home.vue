<template>
  <div class="home-container">
    <!-- 顶部轮播区域 -->
    <div class="banner-section">
      <div class="banner-container">
        <!-- 左侧分类菜单 -->
        <div class="menu-section">
          <MenuBanner/>
        </div>
        <!-- 中间轮播图 -->
        <div class="carousel-section">
          <el-carousel height="458px" :interval="3000" arrow="always" indicator-position="outside">
            <el-carousel-item v-for="item in imgs" :key="item" class="carousel-item">
              <el-image :src="item" fit="cover" class="carousel-image"></el-image>
            </el-carousel-item>
          </el-carousel>
        </div>
        <!-- 右侧通知区域 -->
        <div class="notice-section">
          <Notice/>
        </div>
      </div>
    </div>

    <!-- 没有商品时显示的空状态 -->
    <div v-if="!loading" class="empty-container">
      <div class="farm-fresh-content">
        <div class="farm-image">
          <svg viewBox="0 0 220 180" xmlns="http://www.w3.org/2000/svg" class="farm-svg">
            <!-- 太阳 -->
            <circle cx="160" cy="40" r="25" fill="#ffdf5a" />
            <circle cx="160" cy="40" r="18" fill="#ffe980" />
            
            <!-- 田地和植物 -->
            <rect x="10" y="120" width="200" height="40" fill="#8BC34A" rx="4" />
            <rect x="10" y="110" width="200" height="15" fill="#9CCC65" rx="2" />
            
            <!-- 蔬菜植物 -->
            <path d="M40,110 C40,90 20,85 30,70 C40,55 60,65 60,80 C60,95 40,90 40,110" fill="#66BB6A" />
            <path d="M120,110 C120,90 100,85 110,70 C120,55 140,65 140,80 C140,95 120,90 120,110" fill="#66BB6A" />
            <path d="M70,110 C70,85 90,80 80,60 C70,40 50,50 50,70 C50,90 70,85 70,110" fill="#66BB6A" />
            <path d="M160,110 C160,85 180,80 170,60 C160,40 140,50 140,70 C140,90 160,85 160,110" fill="#66BB6A" />
            
            <!-- 水果 -->
            <circle cx="30" cy="70" r="8" fill="#F44336" />
            <circle cx="50" cy="60" r="7" fill="#E91E63" />
            <circle cx="150" cy="60" r="7" fill="#FF9800" />
            <circle cx="170" cy="70" r="8" fill="#FFC107" />
            
            <!-- 篮子 -->
            <path d="M80,130 L140,130 L130,160 L90,160 Z" fill="#795548" />
            <path d="M95,130 Q100,110 125,130" fill="none" stroke="#5D4037" stroke-width="3" />
          </svg>
        </div>
        
        <h2 class="farm-title">新鲜农产品，直达您家</h2>
        <p class="farm-message">品质保障，绿色健康，让您享受大自然的馈赠</p>
        
        <div class="farm-categories">
          <div class="category-tag">
            <i class="el-icon-apple"></i> 时令水果
          </div>
          <div class="category-tag">
            <i class="el-icon-food"></i> 新鲜蔬菜
          </div>
          <div class="category-tag">
            <i class="el-icon-dessert"></i> 肉禽水产
          </div>
          <div class="category-tag">
            <i class="el-icon-sugar"></i> 有机食品
          </div>
        </div>
        
        <div class="farm-benefits">
          <div class="benefit-item">
            <div class="benefit-icon">
              <i class="el-icon-truck"></i>
            </div>
            <div class="benefit-text">
              <h3>次日达</h3>
              <p>下单后最快24小时送达</p>
            </div>
          </div>
          
          <div class="benefit-item">
            <div class="benefit-icon">
              <i class="el-icon-shopping-bag-1"></i>
            </div>
            <div class="benefit-text">
              <h3>源头直采</h3>
              <p>优质农场直接采购</p>
            </div>
          </div>
          
          <div class="benefit-item">
            <div class="benefit-icon">
              <i class="el-icon-medal"></i>
            </div>
            <div class="benefit-text">
              <h3>品质保障</h3>
              <p>严格质检，放心食用</p>
            </div>
          </div>
        </div>
        
        <div class="farm-actions">
          <el-button type="success" @click="load" class="explore-btn">
            <i class="el-icon-shopping-cart-2"></i> 开始购物
          </el-button>
          <el-button type="primary" @click="$router.push('/reception/display')" class="browse-btn">
            <i class="el-icon-view"></i> 浏览更多
          </el-button>
        </div>
      </div>
    </div>

    <!-- 有商品时显示的内容 -->
    <div v-if="loading" class="content-container">
      <!-- 今日推荐 -->
      <div class="recommendation-section">
        <Recommendation/>
      </div>

      <!-- 商品列表 -->
      <div class="products-section">
        <h2 class="section-title">热卖商品</h2>
        <div class="products-grid">
          <div v-for="item in tableData" :key="item.id" class="product-item" @click="viewProduct(item.id)">
            <el-card class="product-card" shadow="hover">
              <div class="product-image-container">
                <img :src="item.url" class="product-image">
                <div class="product-overlay">
                  <span class="view-details">查看详情</span>
                </div>
              </div>
              <div class="product-info">
                <h3 class="product-name">{{ item.name }}</h3>
                <p class="product-description">{{ item.description }}</p>
                <div class="product-price">
                  <span class="price-symbol">￥</span>{{ item.sellPrice }}
                </div>
              </div>
            </el-card>
          </div>
        </div>

        <!-- 分页 -->
        <div class="pagination-container">
          <el-pagination
              @size-change="handleSizeChange"
              @current-change="handleCurrentChange"
              :current-page="pageNum"
              :page-sizes="[8, 12, 16, 24]"
              :page-size="pageSize"
              layout="total, sizes, prev, pager, next, jumper"
              :total="total"
              background>
          </el-pagination>
        </div>
      </div>

      <!-- 返回顶部按钮 -->
      <el-backtop :bottom="100" :right="100">
        <div class="backtop-inner">
          <i class="el-icon-caret-top"></i>
        </div>
      </el-backtop>
    </div>
  </div>
</template>

<script>
import MenuBanner from "@/views/reception/MenuBanner";
import Recommendation from "@/views/reception/Recommendation";
import Notice from "@/views/reception/Notice";

export default {
  name: "Home",
  components: {MenuBanner, Recommendation, Notice},
  data() {
    return {
      loading: false,
      form: {},
      imgs: [],
      tableData: [],
      name: "",
      total: 0,
      pageNum: 1,
      pageSize: 12,
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
    }
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
    load() {
      if (localStorage.getItem("location")) {
        this.request.get("/product/pages", {
          params: {
            city: localStorage.getItem("location"),
            name: this.name,
            pageNum: this.pageNum,
            pageSize: this.pageSize,
          }
        }).then(res => {
          this.tableData = res.data.records
          if (Object.keys(this.tableData).length) {
            this.loading = true
          }
          this.total = res.data.total
        })
      }
    },
    handleSizeChange(pageSize) {
      console.log(pageSize)
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(pageNum) {
      console.log(pageNum)
      this.pageNum = pageNum
      this.load()
    },
  },
  created() {
    this.load() //获取后台的商品数据
    //轮播图查询
    this.request.get("rotation/list").then(res => {
      this.imgs = res.data.map(v => v.url)
      console.log(this.imgs)
    })
  }
}
</script>


<style scoped>
.home-container {
  padding-bottom: 50px;
}

/* 顶部轮播区域 */
.banner-section {
  padding-top: 40px;
}

.banner-container {
  display: flex;
  height: 458px;
  max-width: 1358px;
  margin: 0 auto;
}

.menu-section {
  width: 235px;
  margin-right: 10px;
}

.carousel-section {
  flex: 1;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}

.carousel-item {
  height: 100%;
}

.carousel-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.notice-section {
  width: 235px;
  margin-left: 10px;
}

/* 空状态 */
.empty-container {
  padding: 80px 0;
  text-align: center;
  background-color: #f9f9f9;
  background-image: linear-gradient(120deg, #f0f9eb 0%, #f9f9f9 100%);
  border-radius: 12px;
  margin: 20px auto;
  max-width: 1200px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.05);
}

.farm-fresh-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 30px;
}

.farm-image {
  width: 280px;
  height: 220px;
  margin-bottom: 20px;
}

.farm-svg {
  width: 100%;
  height: 100%;
  filter: drop-shadow(0 4px 6px rgba(0, 0, 0, 0.1));
}

.farm-title {
  font-size: 28px;
  color: #67C23A;
  margin-bottom: 10px;
  font-weight: 600;
  text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
}

.farm-message {
  font-size: 16px;
  color: #606266;
  margin-bottom: 30px;
}

.farm-categories {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 15px;
  margin-bottom: 30px;
  max-width: 600px;
}

.category-tag {
  padding: 10px 20px;
  border-radius: 20px;
  background-color: #f0f9eb;
  color: #67C23A;
  font-size: 14px;
  font-weight: 500;
  transition: all 0.3s;
  box-shadow: 0 2px 6px rgba(103, 194, 58, 0.1);
}

.category-tag:hover {
  transform: translateY(-2px);
  background-color: #67C23A;
  color: white;
}

.category-tag i {
  margin-right: 5px;
  font-size: 16px;
}

.farm-benefits {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 40px;
  margin: 10px 0 40px;
  max-width: 800px;
}

.benefit-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 150px;
  transition: all 0.3s;
}

.benefit-item:hover {
  transform: translateY(-5px);
}

.benefit-icon {
  width: 60px;
  height: 60px;
  border-radius: 50%;
  background-color: #67C23A;
  display: flex;
  justify-content: center;
  align-items: center;
  margin-bottom: 15px;
  box-shadow: 0 4px 10px rgba(103, 194, 58, 0.2);
}

.benefit-icon i {
  font-size: 24px;
  color: white;
}

.benefit-text {
  text-align: center;
}

.benefit-text h3 {
  font-size: 18px;
  font-weight: 600;
  color: #303133;
  margin-bottom: 8px;
}

.benefit-text p {
  font-size: 14px;
  color: #909399;
}

.farm-actions {
  display: flex;
  gap: 20px;
  margin-top: 20px;
}

.explore-btn, .browse-btn {
  padding: 12px 25px;
  font-size: 16px;
  border-radius: 25px;
  transition: all 0.3s ease;
}

.explore-btn {
  background-image: linear-gradient(to right, #67C23A, #95D475);
  border: none;
}

.browse-btn {
  background-image: linear-gradient(to right, #409EFF, #79bbff);
  border: none;
}

.explore-btn:hover, .browse-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
}

/* 内容区域 */
.content-container {
  max-width: 1358px;
  margin: 0 auto;
}

/* 推荐区域 */
.recommendation-section {
  margin: 30px 0;
}

/* 商品列表 */
.products-section {
  margin: 30px 0;
}

.section-title {
  font-size: 24px;
  font-weight: 600;
  color: #303133;
  margin-bottom: 20px;
  padding-left: 15px;
  border-left: 4px solid #67C23A;
}

.products-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 25px;
  margin-bottom: 30px;
}

.product-item {
  transition: all 0.3s;
}

.product-card {
  height: 100%;
  border-radius: 12px;
  overflow: hidden;
  transition: all 0.3s;
  cursor: pointer;
}

.product-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
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
  transition: transform 0.6s;
}

.product-card:hover .product-image {
  transform: scale(1.05);
}

.product-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.3);
  display: flex;
  justify-content: center;
  align-items: center;
  opacity: 0;
  transition: opacity 0.3s;
}

.product-card:hover .product-overlay {
  opacity: 1;
}

.view-details {
  background-color: rgba(255, 255, 255, 0.9);
  color: #67C23A;
  padding: 8px 16px;
  border-radius: 20px;
  font-size: 14px;
  font-weight: 500;
}

.product-info {
  padding: 15px;
}

.product-name {
  font-size: 16px;
  font-weight: 500;
  color: #303133;
  margin: 0 0 8px 0;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
  text-overflow: ellipsis;
  word-break: break-all;
  height: 40px;
}

.product-description {
  font-size: 14px;
  color: #909399;
  margin: 0 0 15px 0;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.product-price {
  font-size: 18px;
  font-weight: 600;
  color: #ff6700;
}

.price-symbol {
  font-size: 14px;
  font-weight: normal;
  margin-right: 2px;
}

/* 分页 */
.pagination-container {
  margin-top: 40px;
  text-align: center;
}

/* 返回顶部按钮 */
.backtop-inner {
  height: 100%;
  width: 100%;
  background-color: #67C23A;
  box-shadow: 0 0 6px rgba(0, 0, 0, 0.12);
  text-align: center;
  line-height: 40px;
  color: #fff;
  border-radius: 50%;
}

.backtop-inner i {
  font-size: 18px;
  line-height: 40px;
}
</style>
