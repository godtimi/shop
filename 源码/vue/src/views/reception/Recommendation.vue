<template>
  <div>
    <div style="line-height: 32px;font-size: 24px;color: #333;font-weight: 700; margin-bottom: 30px">
      每日推荐 <i class="el-icon-arrow-down"></i>
    </div>

    <div>
      <div style="display: flex;">

        <div style="width: 200px">

          <div @click="viewProduct(from.id)" style="padding-left: 20px">
            <el-card style="cursor: pointer;
                                    padding-bottom: 10px; overflow: hidden;
                                    height: 251px; width: 163px; margin: 0 auto " class="box-card">
              <div style="width: 100%;height: 160px;overflow: hidden;">
                <img :src="from.url" style="width: 100%;height: 100%">
              </div>

              <div class="item1">
                {{ from.name }}
              </div>
              <div style="padding: 5px 0; color: orangered;font-size: 15px;">
                <span style="font-size: 13px">￥</span>{{ from.sellPrice }}
              </div>

            </el-card>
          </div>
        </div>

        <div style="flex: 1;">
          <ul style="list-style-type:none;">
            <li v-for="(item, index) in tableData" v-if="index < 11 && index!==0"
                style="width: 200px;height: 100px; margin-right: 20px;margin-bottom: 50px">
              <div @click="viewProduct(item.id)" style="margin-left: 55px">

                <el-card style="cursor: pointer;
                                    padding-bottom: 10px; overflow: hidden;
                                    height: 100px; width: 200px;" class="box-card">
                  <div style="display: flex">
                    <div style="width: 100px;height: 100px;overflow: hidden; ">
                      <img :src="item.url" style="width: 100%;height: 100%">
                    </div>

                    <div style="flex: 1;padding-left: 10px">
                      <div class="item">
                        {{ item.name }}
                      </div>
                      <div style="padding:  5px 0; color: orangered;">
                        <span style="font-size: 14px">￥</span>{{ item.sellPrice }}
                      </div>
                    </div>

                  </div>

                </el-card>
              </div>
            </li>

          </ul>
        </div>

      </div>


    </div>

  </div>
</template>

<script>

export default {
  name: "Lovely",
  data() {
    return {
      city: localStorage.getItem("location"),
      tableData: [],
      name: "",
      total: 0,
      pageNum: 1,
      pageSize: 8,
      from: {},
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
    }
  },
  methods: {
    viewProduct(id) {
      this.$router.push('/reception/detail?id=' + id)
      if (this.user.id) {
        this.form.pid = id
        this.request.post("/user-visit-log", this.form).then(res => {

        })
      }
    },
    load() {
      if (this.city) {
        this.request.get("/product/recommend/" + this.city).then(res => {
          this.tableData = res.data
          this.from = this.tableData[0]
          console.log(res.data)
        })
      }
    },
  },
  created() {
    this.load()
  }
}
</script>

<style scoped>

.box-card {
  background-color: #fff;
  border-radius: 4px;
  box-shadow: 0 2px 2px rgba(10, 16, 20, .10), 0 0 2px rgba(10, 16, 20, .33);
  box-sizing: border-box;
  position: relative;
}

ul li {
  display: inline-block;
}

.item {
  padding: 5px 0;
  font-size: 12px;
  color: #666;
  /* 限定范围 */
  width: 66px;
  height: 40px;
  /* 1.溢出隐藏 */
  overflow: hidden;
  /* 2.用省略号来代替超出文本 */
  text-overflow: ellipsis;
  /* 3.设置盒子属性为-webkit-box  必须的 */
  display: -webkit-box;
  /* 4.-webkit-line-clamp 设置为2，表示超出2行的部分显示省略号，如果设置为3，那么就是超出3行部分显示省略号 */
  -webkit-line-clamp: 2;
  /* 5.字面意思：单词破坏：破坏英文单词的整体性，在英文单词还没有在一行完全展示时就换行  即一个单词可能会被分成两行展示 */
  word-break: break-all;
  /* 6.盒子实现多行显示的必要条件，文字是垂直展示，即文字是多行展示的情况下使用 */
  -webkit-box-orient: vertical;
}

.item1 {
  padding: 6px 0;
  font-size: 16px;
  color: #666;
  /* 限定范围 */
  width: 220px;
  height: 50px;
  /* 1.溢出隐藏 */
  overflow: hidden;
  /* 2.用省略号来代替超出文本 */
  text-overflow: ellipsis;
  /* 3.设置盒子属性为-webkit-box  必须的 */
  display: -webkit-box;
  /* 4.-webkit-line-clamp 设置为2，表示超出2行的部分显示省略号，如果设置为3，那么就是超出3行部分显示省略号 */
  -webkit-line-clamp: 2;
  /* 5.字面意思：单词破坏：破坏英文单词的整体性，在英文单词还没有在一行完全展示时就换行  即一个单词可能会被分成两行展示 */
  word-break: break-all;
  /* 6.盒子实现多行显示的必要条件，文字是垂直展示，即文字是多行展示的情况下使用 */
  -webkit-box-orient: vertical;
}

/* 直接将元素转为行内块元素*/
</style>