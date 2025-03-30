<template>
  <div>
    <div style="margin: 0 auto; width: 68%;min-width:1358px; max-width:1358px ">
      <div>
        <div style="margin-bottom: 30px; font-size: 20px; color: #666"> 全部直播</div>

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
              height: 200px; width: 250px; margin-left: 43px;" class="box-card">

                <div style="width: 100%;height: 135px;overflow: hidden;">
                  <img :src="item.url" style="width: 100%;height: 100%">
                </div>

                <div style="margin-left: 5px;margin-top: 5px">
                  <div>
                    {{ item.info }}
                  </div>

                  <div style="display: inline-block;margin-left: 10px">
                    <img :src="item.userUrl" alt=""
                         style="width: 25px;border-radius: 50%;position: relative;top: 7px;right: 5px">
                    <span style="color: #999999;font-size: 14px">{{ item.name }}</span>
                  </div>


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
  name: "Lives",
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
      this.$router.push('/reception/live?id=' + id)
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
    //封装请求数据的方法
    load() {
      if (!this.user.id) {
        this.$message.warning("请登录后操作")
        return
      }
      this.request.get("/live", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          name: this.name,
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


.box-card {
  background-color: #fff;
  border-radius: 4px;
  box-shadow: 0 2px 2px rgba(10, 16, 20, .24), 0 0 2px rgba(10, 16, 20, .33);
  box-sizing: border-box;
  position: relative;
}
</style>
