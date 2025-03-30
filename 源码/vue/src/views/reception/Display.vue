<template>
  <div style="width: 100%">
    <!--商品渲染-->
    <div style="margin: 10px auto;width: 60%;min-width:900px; max-width:900px ">
      <div style="margin: 20px auto;min-width:1358px; max-width:1358px " lazy>
        <ul>
          <li v-for="item in tableData" :key="item.id" style="margin-bottom: 10px">
            <div @click="viewProduct(item.id)">
              <el-card style="cursor: pointer;padding-bottom: 10px;border-radius: 10px; overflow: hidden;
              height: 330px; width: 220px; margin-left: 43px;" class="box-card">
                <div style="width: 100%;height: 220px;overflow: hidden;">
                  <img :src="item.url" style="width: 100%;height: 100%">
                </div>
                <div class="item">
                  {{ item.name }}
                </div>
                <div class="item1">
                  {{ item.description }}
                </div>
                <div style="padding: 5px 0; color: orangered;font-size: 15px;">
                  <span style="font-size: 14px">￥</span>{{ item.sellPrice }}
                </div>
              </el-card>
            </div>
          </li>
        </ul>


        <!--        分页查询-->
        <div style="padding: 10px 0">
          <el-pagination
              @size-change="handleSizeChange"
              @current-change="handleCurrentChange"
              :current-page="pageNum"
              :page-sizes="[2, 5, 10, 20]"
              :page-size="pageSize"
              layout="total,  prev, pager, next"
              :total="total">
          </el-pagination>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Display",
  data() {
    return {
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
      tableData: [],
      name: this.$store.state.name,
      total: 0,
      pageNum: 1,
      pageSize: 8,
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
      this.request.get("/product/pages", {
        params: {
          city: localStorage.getItem("location"),
          name: this.$store.state.name,
          pageNum: this.pageNum,
          pageSize: this.pageSize,
        }
      }).then(res => {
        // console.log(res)
        this.tableData = res.data.records
        this.total = res.data.total
      })
    },
    handleSizeChange(pageSize) {
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(pageNum) {
      this.pageNum = pageNum
      this.load()
    },
  },
  created() {
    if (this.$store.state.name === "") {
      this.$router.push("/reception/home")
    } else {
      this.load()
    }
  },
}
</script>

<style scoped>

/deep/ .el-card__body, .el-main {
  padding: 0px;
}

ul li {
  display: inline-block;
}


.item {
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

.item1 {
  color: #666;
  font-size: 14px;
  /* 限定范围 */
  width: 220px;
  height: 20px;
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
</style>