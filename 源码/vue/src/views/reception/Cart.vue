<template>
  <div class="cart-page">
    <div class="cart-container">
      <h2 class="page-title">购物车</h2>
      
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

      <!-- 购物车列表 -->
      <div class="cart-list-container">
        <el-table 
          :data="tableData" 
          size="medium" 
          @selection-change="handleSelectionChange"
          :row-class-name="tableRowClassName"
          class="custom-table"
          :header-cell-style="{background:'#f8f9fa',color:'#606266',fontWeight:'500'}"
          :cell-style="{padding:'12px 0'}"
        >
          <el-table-column 
            type="selection" 
            width="55"
            :selectable="checkSelectable">
          </el-table-column>

          <el-table-column prop="productId" label="商品图片" width="150">
            <template v-slot="scope">
              <div class="product-image-container">
                <el-image 
                  :src="scope.row.productUrl"
                  :preview-src-list="[scope.row.productUrl]"
                  class="product-image">
                </el-image>
              </div>
            </template>
          </el-table-column>

          <el-table-column label="商品名称" min-width="200">
            <template slot-scope="scope">
              <div class="product-info">
                <el-tooltip v-if="scope.row.num > scope.row.store" effect="dark" content="商品库存不足" placement="top-start">
                  <div class="product-name text-overflow">{{ scope.row.productName }}</div>
                </el-tooltip>
                <div v-else class="product-name text-overflow">{{ scope.row.productName }}</div>
              </div>
            </template>
          </el-table-column>
          
          <el-table-column label="单价" width="120">
            <template slot-scope="scope">
              <span class="price-text">￥{{ scope.row.productPrice }}</span>
            </template>
          </el-table-column>
          
          <el-table-column prop="num" label="数量" width="180">
            <template v-slot="scope">
              <el-input-number 
                v-model="scope.row.num" 
                :min="1" 
                :max="100" 
                size="small"
                class="quantity-control"
                @change="changeNum(scope.row)">
              </el-input-number>
            </template>
          </el-table-column>
          
          <el-table-column label="小计" width="120">
            <template slot-scope="scope">
              <span class="subtotal-text">￥{{ (scope.row.productPrice * scope.row.num).toFixed(2) }}</span>
            </template>
          </el-table-column>
          
          <el-table-column label="操作" width="100" align="center">
            <template slot-scope="scop">
              <el-popconfirm
                class="ml-5"
                confirm-button-text='确定'
                cancel-button-text='取消'
                title="确定要从购物车中移除该商品吗？"
                @confirm="del(scop.row.id)"
              >
                <el-button type="danger" size="mini" plain slot="reference">
                  <i class="el-icon-delete"></i> 删除
                </el-button>
              </el-popconfirm>
            </template>
          </el-table-column>
        </el-table>
        
        <!-- 分页 -->
        <div class="pagination-container">
          <el-pagination
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            :current-page="pageNum"
            :page-sizes="[5, 10, 20, 50]"
            :page-size="pageSize"
            layout="total, prev, pager, next"
            :total="total"
            background>
          </el-pagination>
        </div>
      </div>

      <!-- 结算区域 -->
      <div class="checkout-section">
        <div class="checkout-info">
          <div class="checkout-label">已选商品 <span class="selected-count">{{ multipleSelection.length }}</span> 件</div>
          <div class="checkout-total">
            <span class="total-label">总计：</span>
            <span class="total-price">￥{{ allPrice }}</span>
          </div>
        </div>
        <el-button 
          class="checkout-btn" 
          :disabled="!multipleSelection.length"
          @click="settleAccount" 
          size="medium">
          <i class="el-icon-shopping-cart-full"></i> 去结算
        </el-button>
      </div>

      <!-- 猜你喜欢 -->
      <div class="recommend-section">
        <h3 class="section-title">猜你喜欢</h3>
        <Lovely/>
      </div>
    </div>
  </div>
</template>

<script>
import Lovely from "@/views/reception/Lovely";

export default {
  name: "Cart",
  components: {Lovely},
  data() {
    return {
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
      allPrice: 0,
      //默认展开的数组
      expends: [],
      //有的权限
      checks: [],
      menuData: [],
      name: "",
      total: 0,
      pageNum: 1,
      pageSize: 5,
      mag: "hello word!",
      tableData: [],
      collapseBtnClass: 'el-icon-s-fold',
      isCollapse: false,
      sideWidth: 200,
      logoText: true,
      dialogFormVisible: false,
      menuDiaVisible: false,
      form: {},
      flag: false,
      multipleSelection: [],
      props: {
        label: "name"
      },
    }
  },

  //页面创建就执行这个函数
  created() {
    //请求分页查询数据
    this.load()
  },
  methods: {
    tableRowClassName({row, rowIndex}) {
      if (row.num > row.store) {
        this.flag = true
        return 'warning-row';
      }
    },
    checkSelectable(row) {
      return row.num <= row.store
    },
    settleAccount() {
      if (!this.multipleSelection.length || !this.multipleSelection.length) {
        this.$message.error("请选择要结算的商品")
        return
      }
      let data = {
        name: this.multipleSelection[0].productName,
        allPrice: this.allPrice,
        carts: this.multipleSelection
      }
      this.$store.commit("setData", data)
      sessionStorage.setItem('data', JSON.stringify(data));
      this.$router.push("/reception/settlement")
    },
    changeNum(row) {
      this.allPrice = 0
      this.request.post("/cart/num/" + row.id + "/" + row.num).then(res => {
      })
      //计算总价格
      this.multipleSelection.forEach(item => {
        this.allPrice += item.productPrice * item.num
      })
      this.allPrice = this.allPrice.toFixed(2)
    },
    handleSelectionChange(val) {
      //初始化
      this.allPrice = 0

      this.multipleSelection = val
      //进行计算操作
      if (val && val.length) {
        val.forEach(item => {
          this.allPrice += item.productPrice * item.num
        })
        this.allPrice = this.allPrice.toFixed(2)
      }
    },
    del(id) {
      this.request.delete("/cart/" + id).then(res => {
        if (res.code === '200') {
          this.$message.success("删除成功")
          this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    delBatch() {
      let ids = this.multipleSelection.map(v => v.id) //[{}，{}，{}] => [1,2,3] 对象数组变纯id数组
      this.request.post("/cart/del/batch", ids).then(res => {
        if (res.code === '200') {
          this.$message.success("批量删除成功")
          this.load()
        } else {
          this.$message.error("批量删除失败")
        }
      })
    },
    save() {
      this.request.post("/cart", this.form).then(res => {
        if (res.code === '200') {
          this.$message.success("保存成功")
          this.dialogFormVisible = false
          this.load()
        } else {
          this.$message.error("保存失败")
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
    //封装请求数据的方法
    load() {
      if (!this.user.id) {
        this.$message.warning("请登录后操作")
        return
      }
      this.request.get("/cart/page", {
        params: {
          name: this.name,
          pageNum: this.pageNum,
          pageSize: this.pageSize,
        }
      }).then(res => {
        this.tableData = res.data.records
        this.total = res.data.total
      })
    }
  }
}
</script>

<style scoped>
.cart-page {
  padding: 20px 0;
  background-color: #f5f7fa;
  min-height: calc(100vh - 200px);
}

.cart-container {
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

.cart-list-container {
  margin-bottom: 20px;
}

.custom-table {
  margin-bottom: 20px;
  border-radius: 6px;
  overflow: hidden;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
}

.product-image-container {
  width: 80px;
  height: 80px;
  margin: 0 auto;
  display: flex;
  align-items: center;
  justify-content: center;
}

.product-image {
  width: 80px;
  height: 80px;
  object-fit: cover;
  border-radius: 4px;
  transition: transform 0.3s;
}

.product-image:hover {
  transform: scale(1.05);
}

.product-info {
  padding: 5px 0;
}

.product-name {
  font-size: 14px;
  margin-bottom: 5px;
  color: #303133;
}

.text-overflow {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.price-text {
  color: #f56c6c;
  font-weight: 500;
}

.subtotal-text {
  color: #f56c6c;
  font-weight: 600;
  font-size: 15px;
}

.quantity-control {
  width: 120px;
}

.pagination-container {
  text-align: center;
  padding: 15px 0;
}

.checkout-section {
  display: flex;
  justify-content: flex-end;
  align-items: center;
  padding: 15px 20px;
  background-color: #f8f9fa;
  border-radius: 6px;
  margin-bottom: 30px;
}

.checkout-info {
  margin-right: 20px;
}

.checkout-label {
  font-size: 14px;
  color: #606266;
  margin-bottom: 5px;
}

.selected-count {
  color: #f56c6c;
  font-weight: 600;
}

.checkout-total {
  font-size: 16px;
}

.total-label {
  color: #303133;
}

.total-price {
  color: #f56c6c;
  font-size: 20px;
  font-weight: 600;
}

.checkout-btn {
  background: linear-gradient(135deg, #ff7034, #ff4500);
  color: white;
  border: none;
  padding: 10px 25px;
  border-radius: 4px;
  transition: all 0.3s;
}

.checkout-btn:hover:not(:disabled) {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(255, 69, 0, 0.3);
}

.checkout-btn:disabled {
  background: #f0f0f0;
  color: #bbb;
}

.recommend-section {
  margin-top: 30px;
}

.section-title {
  font-size: 18px;
  color: #303133;
  margin-bottom: 20px;
  font-weight: 500;
  position: relative;
  padding-left: 12px;
  border-left: 3px solid #67C23A;
}

/* 覆盖Element UI的一些样式 */
.el-table .warning-row {
  background: #fef0f0;
}

.el-table .success-row {
  background: #f0f9eb;
}

@media screen and (max-width: 768px) {
  .cart-container {
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
  
  .checkout-section {
    flex-direction: column;
    align-items: stretch;
  }
  
  .checkout-info {
    margin-right: 0;
    margin-bottom: 15px;
    display: flex;
    justify-content: space-between;
  }
  
  .checkout-btn {
    width: 100%;
  }
}
</style>
