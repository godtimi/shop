<template>
  <div style="margin-bottom: 200px">
    <div style="color:#434343;margin-bottom: 40px">
      猜你喜欢
    </div>

    <div style="margin: 10px auto;width: 1048px;">

      <div>

        <ul style="list-style-type:none;margin-left: 18px">
          <li v-for="(item, index) in tableData" v-if="index < 5" style="width: 200px;height: 251px; ">
            <div @click="viewProduct(item.id)">
              <el-card class="box-card" style="cursor: pointer;
                                    padding-bottom: 10px; overflow: hidden;
                                    height: 251px; width: 163px; margin: 0 auto
              ">
                <div style="width: 100%;height: 160px;overflow: hidden;">
                  <img :src="item.url" style="width: 100%;height: 100%">
                </div>

                <div class="item">
                  {{ item.name }}
                </div>
                <div class="item1">
                  {{ item.description }}
                </div>
                <div style="padding: 5px 0; color: orangered;font-size: 15px;">
                  <span style="font-size: 13px">￥</span>{{ item.sellPrice }}
                </div>
              </el-card>
            </div>
          </li>
        </ul>
      </div>
    </div>

  </div>
</template>


<script>

export default {
  name: "Lovely",
  data() {
    return {
      tableData: [],
      name: "",
      total: 0,
      pageNum: 1,
      pageSize: 8,
      city: localStorage.getItem("location"),
    }
  },
  methods: {
    viewProduct(id) {
      this.$router.push('/reception/detail?id=' + id)
      this.form.pid = id
      this.request.post("/user-visit-log", this.form).then(res => {

      })
    },
    load() {
      this.request.get("/product/lovely/" + this.city).then(res => {
        this.tableData = res.data
      })
    },
  },
  created() {
    this.load()
  }
}
</script>

<style scoped>
ul li {
  display: inline-block;
}

/deep/ .el-card__body, .el-main {
  padding: 0px;
}

.item {
  padding: 6px 0;
  font-size: 9px;
  color: #666;
  /* 限定范围 */
  width: 163px;
  height: 39px;
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
  padding: 2px 0;
  color: #666;
  font-size: 8px;
  /* 限定范围 */
  width: 163px;
  height: 19px;
  /* 1.溢出隐藏 */
  overflow: hidden;
  /* 2.用省略号来代替超出文本 */
  text-overflow: ellipsis;
  /* 3.设置盒子属性为-webkit-box  必须的 */
  display: -webkit-box;
  /* 4.-webkit-line-clamp 设置为2，表示超出2行的部分显示省略号，如果设置为3，那么就是超出3行部分显示省略号 */
  -webkit-line-clamp: 1;
  /* 5.字面意思：单词破坏：破坏英文单词的整体性，在英文单词还没有在一行完全展示时就换行  即一个单词可能会被分成两行展示 */
  word-break: break-all;
  /* 6.盒子实现多行显示的必要条件，文字是垂直展示，即文字是多行展示的情况下使用 */
  -webkit-box-orient: vertical;
}

.box-card {
  background-color: #fff;
  border-radius: 4px;
  box-shadow: 0 2px 2px rgba(10, 16, 20, .24), 0 0 2px rgba(10, 16, 20, .33);
  box-sizing: border-box;
  position: relative;
}

/* 直接将元素转为行内块元素*/
</style>