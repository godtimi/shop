<template>
  <div>
    <!--        搜索框-->
    <div style="padding: 10px 0">
      <el-input style="width: 200px " placeholder="请输入名称" suffix-icon="el-icon-search" class="ml-5"
                v-model="name"></el-input>
      <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
      <el-button class="ml-5" type="warning" @click="reset">重置</el-button>
    </div>

    <div style="margin: 10px 0">
      <el-button type="primary" @click="handAdd">新增<i class="el-icon-circle-plus-outline"></i></el-button>
      <el-popconfirm
          class="ml-5"
          confirm-button-text='确定'
          cancel-button-text='我再想想'
          title="您确定批量删除这些数据吗？"
          @confirm="delBatch"
      >
        <el-button type="danger" slot="reference">批量删除<i class="el-icon-remove-outline"></i></el-button>
      </el-popconfirm>

    </div>

    <el-table :data="tableData" border stripe @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column prop="id" label="ID">
      </el-table-column>
      <el-table-column prop="name" label="名称">
      </el-table-column>
      <el-table-column prop="description" label="描述">
      </el-table-column>

      <el-table-column label="操作" width="280" align="center">
        <template slot-scope="scop">
          <el-button type="info" slot="reference" @click="selectMenu(scop.row)">分配菜单<i class="el-icon-menu"></i>
          </el-button>
          <el-button type="success" @click="handelEdit(scop.row)">编辑<i class="el-icon-edit"></i></el-button>
          <template>
            <el-popconfirm
                class="ml-5"
                confirm-button-text='确定'
                cancel-button-text='我再想想'
                title="您确定删除吗？"
                @confirm="del(scop.row.id)"
            >
              <el-button type="danger" slot="reference">删除<i class="el-icon-remove-outline"></i>
              </el-button>
            </el-popconfirm>
          </template>
        </template>
      </el-table-column>

    </el-table>
    <!--        分页查询-->
    <div style="padding: 10px 0">
      <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="pageNum"
          :page-sizes="[2, 5, 10, 20]"
          :page-size="pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total">
      </el-pagination>
    </div>
    <!--弹窗-->
    <el-dialog title="角色信息" :visible.sync="dialogFormVisible" width="30%">
      <el-form label-width="80px" size="small">
        <el-form-item label="名称">
          <el-input v-model="form.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="描述信息">
          <el-input v-model="form.description" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>

    <!--弹窗2 分配菜单-->
    <el-dialog title="菜单分配" :visible.sync="menuDiaVisible" width="30%">
      <el-form label-width="80px" size="small">
        <el-tree
            :props="props"
            :data="menuData"
            show-checkbox
            node-key="id"
            ref="tree"
            :default-expanded-keys="expends"
            :default-checked-keys="checks">
             <span class="custom-tree-node" slot-scope="{ node, data }">
             <span><i :class="data.icon"> </i> {{ data.name }}</span>
             </span>

        </el-tree>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="saveRoleMenu">确 定</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
export default {
  name: "Role",
  data() {
    return {
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
      roleId: 0,
      roleFlag: ''
    }
  },

  //页面创建就执行这个函数
  created() {
    //请求分页查询数据
    this.load()
  },
  methods: {
    saveRoleMenu() {
      this.request.post("/role/roleMenu/" + this.roleId, this.$refs.tree.getCheckedKeys()).then(res => {
        if (res.code === '200') {
          this.$message.success("绑定成功")
          this.menuDiaVisible = false
          //操作员是管理员的话 重新登录
          if (this.roleFlag === "ROLE_ADMIN") {
            this.$store.commit("logout")
          }
        } else {
          this.$message.error(res.msg)
        }
      })
      // console.log(this.$refs.tree.getCheckedKeys());   获取选择的id
    },
    //分配菜单
    selectMenu(role) {
      this.menuDiaVisible = true;
      this.roleFlag = role.flag
      //请求菜单数据
      this.request.get("/menu").then(res => {
        this.menuData = res.data
        //把后台返回的数据处理成 id数组
        // this.menuData.map(v => v.id)
        this.expends = this.menuData.map(v => v.id)
        // this.checks
        this.roleId = role.id
      })

      this.request.get("/role/roleMenu/" + role.id).then(res => {
        this.checks = res.data
      })

      this.request.get("/menu/ids").then(r => {
        const ids = r.data
        ids.forEach(id => {
          //可能会报错
          if (!this.checks.includes(id)) {
            //处理未来元素
            this.$nextTick(() => {
              this.$refs.tree.setChecked(id, false)
            })


          }
        })

      })


    },
    handleSelectionChange(val) {
      this.multipleSelection = val
    },
    del(id) {
      this.request.delete("/role/" + id).then(res => {
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
      this.request.post("/role/del/batch", ids).then(res => {
        if (res.code === '200') {
          this.$message.success("批量删除成功")
          this.load()
        } else {
          this.$message.error("批量删除失败")
        }
      })
    },
    handelEdit(row) {
      this.form = row
      this.dialogFormVisible = true
    },
    save() {
      this.request.post("/role", this.form).then(res => {
        if (res.code === '200') {
          this.$message.success("保存成功")
          this.dialogFormVisible = false
          this.load()
        } else {
          this.$message.error("保存失败")
        }
      })
    },
    handAdd() {
      this.dialogFormVisible = true;
      this.form = {};
    },
    reset() {
      this.name = ""
      this.load()
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
    handleExcelImportSuccess() {
      this.$message.success("文件导入成功")
      this.load()
    },
    //封装请求数据的方法
    load() {
      this.request.get("/role/page", {
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

</style>
