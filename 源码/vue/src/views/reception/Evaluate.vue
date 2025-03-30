<template>
  <div>
    <el-card class="box-card">

      <el-tabs v-model="activeName" @tab-click="handleClick" size="medium ">
        <el-tab-pane label="商品介绍" name="1" style="margin: 0 auto">
          <el-card>
            <div style="margin-bottom: 20px;padding: 20px 0 15px">
              <ul style="font-size: 12px;color: #666666;margin: 0 auto">

                <li v-if="product.name">
                  <span>  商品名称：</span> {{ product.name }}
                </li>

                <li v-if="params.productId">
                  <span>  商品编号：</span> {{ params.productId }}
                </li>

                <li v-if="params.productAddress">
                  <span>  商品产地：</span> {{ params.productAddress }}
                </li>

                <li v-if="params.brand">
                  <span>  品牌：</span> {{ params.brand }}
                </li>

                <li v-if="params.factoryName">
                  <span>  生产厂名：</span> {{ params.factoryName }}
                </li>

                <li v-if="params.factorAddress">
                  <span>  生产厂址：</span> {{ params.factorAddress }}
                </li>

                <li v-if="params.stroageMethod">
                  <span>  存储方式：</span> {{ params.stroageMethod }}
                </li>

                <li v-if="params.eatMethod">
                  <span>  食用方法：</span> {{ params.eatMethod }}
                </li>
              </ul>
            </div>


            <div style="text-align: center">
              <mavon-editor
                  style="width: 962px;z-index: 500;"
                  class="md"
                  :value="content"
                  :subfield="false"
                  :defaultOpen="'preview'"
                  :toolbars-flag="false"
                  :editable="false"
                  :scroll-style="true"
                  :ishljs="true"
              />
            </div>


          </el-card>
        </el-tab-pane>

        <el-tab-pane label="规格与包装" name="2">
          <el-card>
            <div style="margin-bottom: 20px;padding: 20px 0 15px">
              <ul style="font-size: 12px;color: #666666;margin: 0 auto">

                <div style="margin-bottom: 50px">
                  <div style="float: left; ">
                    主体
                  </div>
                  <div>
                    <div style=" margin:12px 5px; padding: 0 10px 0 130px;">
                      <template v-if="params.productPeriod">
                        <div style="display: inline-block;width: 100px"> 保质期：</div>
                        <span> {{ params.productPeriod }} </span>
                      </template>
                    </div>
                    <div style=" margin: 12px 5px; padding: 0 10px 0 130px;">
                      <template v-if="params.productPeriod">
                        <div style="display: inline-block; width: 100px"> 规格重量：</div>
                        <span>  {{ params.weight }} </span>kg
                      </template>
                    </div>
                    <div style=" margin: 12px 5px; padding: 0 10px 0 130px;">
                      <template v-if="params.productPeriod">
                        <div style="display: inline-block; width: 100px"> 存储方式：</div>
                        <span>  {{ params.stroageMethod }} </span>
                      </template>
                    </div>
                  </div>
                </div>

                <div style="overflow: hidden" v-if="params.packagingMethod">
                  <div style="display: inline-block; width: 100px"> 包装方式：</div>
                  <span>  {{ params.packagingMethod }} </span>
                </div>

              </ul>


            </div>

          </el-card>
        </el-tab-pane>

        <el-tab-pane label="商品评价" name="3">
          <Comments/>
        </el-tab-pane>

      </el-tabs>
    </el-card>
  </div>
</template>

<script>
import Comments from "@/views/reception/Comments";

export default {
  name: "Evaluate",
  components: {Comments},
  data() {
    return {

      product: {},
      params: {},
      content: '',
      activeName: '1',
      productId: this.$store.state.productId
    };
  },
  methods: {
    handleClick(tab, event) {
      // console.log(tab, event);
    }
  },
  created() {
    this.request.get("/product-params/" + this.productId).then(res => {
      this.params = res.data
      console.log(this.params)
    })

    this.request.get("/evaluate/" + this.productId).then(res => {
      if (res.code === '200') {
        this.content = res.data.content
      } else {
        this.$message.error("查询数据失败")
      }
    })

    this.request.get("/product/" + this.productId).then(res => {
      this.product = res.data
    })
  }
}
</script>

<style scoped>
.box-card {
  background-color: #fff;
  border-radius: 4px;
  box-shadow: 0 2px 2px rgba(10, 16, 20, .24), 0 0 2px rgba(10, 16, 20, .33);
  box-sizing: border-box;
  transition: box-shadow .5s;
  margin: 24px 8px;
  padding-bottom: 48px;
  position: relative;
}


::v-deep img {
  width: 100%;
}

ul li {
  display: inline-block;
}

li {
  width: 300px;
  margin: 3px 5px;
  padding: 0 0 0 130px;
}
</style>