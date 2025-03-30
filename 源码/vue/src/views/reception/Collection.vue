<template>
  <div>
    <div style="margin: 0 auto; width: 68%;min-width:1358px; max-width:1358px;padding-top: 30px">
      <div>
        <div style="margin-bottom: 30px; font-size: 20px; color: #666"> 我的收藏</div>

        <!--        搜索框-->
        <div style="padding: 10px 0;margin-bottom: 30px">
          <el-input style="width: 400px " size="medium" placeholder="请输入名称" class="ml-5"
                    v-model="name"></el-input>
          <el-button class="ml-5" type="primary" @click="load" size="medium"><i class="el-icon-search"></i>搜索
          </el-button>
        </div>

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

      </div>


    </div>
  </div>
</template>

<script>
export default {
  name: "Crat",
  data() {
    return {
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
      username: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")).username : "",
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
    viewProduct(id) {
      this.$router.push('/reception/detail?id=' + id)
      this.form.pid = id
      if (this.user.id) {
        this.request.post("/user-visit-log", this.form).then(res => {
        })
      }
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
      console.log(pageNum)
      this.pageNum = pageNum
      this.load()
    },
    handleExcelImportSuccess() {
      this.$message.success("文件导入成功")
      this.load()
    },
    //封装请求数据的方法
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
        console.log(res)
        this.tableData = res.data
      })
    }
  }
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
