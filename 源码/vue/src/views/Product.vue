<template>
  <div>
    <!--        搜索框-->
    <div style="padding: 10px 0">
      <el-input style="width: 200px " placeholder="请输入名称" suffix-icon="el-icon-search" class="ml-5" v-model="name">
      </el-input>
      <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
      <el-button class="ml-5" type="warning" @click="reset">重置</el-button>
    </div>

    <div style="margin: 10px 0">
      <el-popconfirm class="ml-5" confirm-button-text='确定' cancel-button-text='我再想想' title="您确定批量删除这些数据吗？"
                     @confirm="delBatch">
        <el-button type="danger" slot="reference">批量删除<i class="el-icon-remove-outline"></i></el-button>
      </el-popconfirm>

    </div>
    <!--    主表-->
    <el-table :data="tableData" border stripe @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column prop="id" label="ID">
      </el-table-column>
      <el-table-column prop="name" label="商品名称">
      </el-table-column>
      <el-table-column label="商品主图">
        <template slot-scope="scope">
          <img :src="scope.row.url" alt="" style="height: 100px"/>
        </template>
      </el-table-column>
      <el-table-column label="商品信息">
        <template slot-scope="scop">
          <div>
            <el-button @click="viewProductInfo(scop.row) " style="margin-bottom: 5px">查看<i
                class="el-icon-edit"></i>
            </el-button>
          </div>
          <el-button type="success" plain @click="handelEdit(scop.row)">编辑<i
              class="el-icon-edit"></i>
          </el-button>
        </template>
      </el-table-column>
      <el-table-column label="商品参数">
        <template slot-scope="scop">
          <div>
            <el-button @click="viewProductParams(scop.row) " style="margin-bottom: 5px">查看<i
                class="el-icon-edit"></i>
            </el-button>
          </div>
          <el-button type="success" plain @click="handelEditProductParams(scop.row)">编辑<i
              class="el-icon-edit"></i>
          </el-button>
        </template>
      </el-table-column>

      <el-table-column label="商品图片">
        <template slot-scope="scop">
          <div>
            <el-button @click="viewProductImg(scop.row) " style="margin-bottom: 5px">查看<i
                class="el-icon-edit"></i>
            </el-button>
          </div>

          <!--          <el-upload action="http://localhost:9090/file/upload" :show-file-list="false" accept="xlsx"-->
          <!--                     style="display: inline-block" class="mr-5" :on-success="handleImgUploadSuccess">-->
          <!--            <el-button type="primary" class="ml-5" @click="uploadImg(scop.row)">上传<i class="el-icon-top"></i>-->
          <!--            </el-button>-->
          <!--          </el-upload>-->

        </template>
      </el-table-column>

      <el-table-column label="商品介绍">
        <template slot-scope="scop">
          <div>
            <el-button @click="viewEvaluate(scop.row) " style="margin-bottom: 5px">查看<i
                class="el-icon-edit"></i>
            </el-button>
          </div>
          <el-button type="success" plain @click="handelEditEvaluate(scop.row) ">编辑<i
              class="el-icon-edit"></i>
          </el-button>
        </template>
      </el-table-column>

      <el-table-column label="上架">
        <template slot-scope="scope">
          <el-switch v-model="scope.row.putOnTheShelf" active-color="#13ce66" inactive-color="#ccc"
                     @change="changePutOnTheShelf(scope)"></el-switch>
        </template>
      </el-table-column>

      <el-table-column label="是否每日推荐">
        <template slot-scope="scope">
          <el-switch v-model="scope.row.isDaily" active-color="#13ce66" inactive-color="#ccc"
                     @change="changeEveryday(scope)"></el-switch>
        </template>
      </el-table-column>

      <el-table-column label="操作" width="280" align="center">
        <template slot-scope="scop">
          <template>
            <el-popconfirm class="ml-5" confirm-button-text='确定' cancel-button-text='我再想想' title="您确定删除吗？"
                           @confirm="del(scop.row.id)">
              <el-button type="danger" slot="reference">删除<i class="el-icon-remove-outline"></i>
              </el-button>
            </el-popconfirm>
          </template>
        </template>
      </el-table-column>

    </el-table>
    <!--        分页查询-->
    <div style="padding: 10px 0">
      <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange" :current-page="pageNum"
                     :page-sizes="[2, 5, 10, 20]" :page-size="pageSize" layout="total, sizes, prev, pager, next, jumper"
                     :total="total">
      </el-pagination>
    </div>
    <!--商品信息编辑弹窗-->
    <el-dialog title="商品信息" :visible.sync="dialogFormVisible" width="30%">
      <el-form label-width="80px" size="small">
        <el-form-item label="商品名称">
          <el-input type="textarea" v-model="form.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="价格">
          <el-input v-model="form.sellPrice" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="描述信息">
          <el-input v-model="form.description" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="单位">
          <el-input v-model="form.unit" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="sku库存">
          <el-input v-model="form.store" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="销量">
          <el-input v-model="form.soldNum" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="商品种类">
          <el-select clearable v-model="form.classificationName" placeholder="请选择商品种类" style="width: 100%">
            <el-option v-for="item in classifications" :key="item.id" :label="item.name" :value="item.name">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="上架时间">
          <el-date-picker style="width: 100%" v-model="form.createTime" type="date" placeholder="选择日期">
          </el-date-picker>
        </el-form-item>

        <el-upload action="http://localhost:9090/file/upload" :show-file-list="false" accept="xlsx"
                   style="display: inline-block" class="mr-5" :on-success="handleFileUploadSuccess">
          <el-button type="primary" class="ml-5">商品图片<i class="el-icon-top"></i></el-button>
        </el-upload>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="save">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!--商品信息查看弹窗-->
    <el-dialog title="商品信息" :visible.sync="dialogFormVisible1" width="70%">
      <el-table :data="productInfo" border stripe @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55"></el-table-column>
        <el-table-column prop="id" label="ID">
        </el-table-column>
        <el-table-column prop="name" label="商品名称">
        </el-table-column>
        <el-table-column label="商品图片">
          <template slot-scope="scope">
            <img :src="scope.row.url" alt="" style="height: 100px"/>
          </template>
        </el-table-column>
        <el-table-column prop="sellPrice" label="￥价格(元)">
        </el-table-column>
        <el-table-column prop="description" label="描述">
        </el-table-column>
        <el-table-column prop="unit" label="单位">
        </el-table-column>
        <el-table-column prop="store" label="sku库存">
        </el-table-column>
        <el-table-column prop="soldNum" label="销量">
        </el-table-column>
        <el-table-column prop="classificationName" label="商品种类">
        </el-table-column>
        <el-table-column prop="city" label="发货地点">
        </el-table-column>
        <el-table-column label="上架时间">
          <template slot-scope="scope">
            {{ scope.row.createTime | formatDate }}
          </template>
        </el-table-column>

      </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="cancel">确 定</el-button>
      </div>
    </el-dialog>

    <!--商品参数查看弹窗-->
    <el-dialog title="商品参数" :visible.sync="dialogFormVisible2" width="70%">
      <el-table :data="ProductParamsList" border stripe>
        <el-table-column prop="id" label="ID">
        </el-table-column>
        <el-table-column prop="productAddress" label="产地">
        </el-table-column>
        <el-table-column prop="productPeriod" label="保质期">
        </el-table-column>
        <el-table-column prop="brand" label="品牌名">
        </el-table-column>
        <el-table-column prop="weight" label="规格重量">
        </el-table-column>
        <el-table-column prop="factoryName" label="生产厂名">
        </el-table-column>
        <el-table-column prop="factorAddress" label="生产厂址">
        </el-table-column>
        <el-table-column prop="packagingMethod" label="包装方式">
        </el-table-column>
        <el-table-column prop="stroageMethod" label="存储方式">
        </el-table-column>
        <el-table-column prop="eatMethod" label="食用方法">
        </el-table-column>
      </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="cancel">确 定</el-button>
      </div>
    </el-dialog>

    <!--商品参数编辑弹窗-->
    <el-dialog title="商品参数" :visible.sync="dialogFormVisible3" width="30%">
      <el-form label-width="80px" size="small">
        <el-form-item label="产地">
          <el-input v-model="form1.productAddress" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="保质期">
          <el-input v-model="form1.productPeriod" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="品牌名">
          <el-input v-model="form1.brand" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="规格重量">
          <el-input v-model="form1.weight" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="生产厂名">
          <el-input v-model="form1.factoryName" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="生产厂址">
          <el-input v-model="form1.factorAddress" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="包装方式">
          <el-input v-model="form1.packagingMethod" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="存储方式">
          <el-input v-model="form1.stroageMethod" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="食用方法">
          <el-input v-model="form1.eatMethod" autocomplete="off"></el-input>
        </el-form-item>

      </el-form>


      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="save1">确 定</el-button>
      </div>
    </el-dialog>


    <!--商品图片查看弹窗-->
    <el-dialog title="商品图片" :visible.sync="dialogFormVisible4" width="40%">
      <el-table :data="imgList" border stripe>
        <el-table-column prop="id" label="ID" width="100px">
        </el-table-column>
        <el-table-column label="图片">
          <template slot-scope="scope">
            <div style="width: 100px;height: 100px">
              <img v-if="scope.row.url" :src="scope.row.url" class="avatar">
            </div>
          </template>
        </el-table-column>

        <el-table-column label="操作" align="center">
          <template slot-scope="scop">
            <el-upload action="http://localhost:9090/file/upload" :show-file-list="true" accept="xlsx"
                       style="display: inline-block" class="mr-5" :on-success="handleProductSuccess">
              <el-button type="primary" class="ml-5" @click="changeImg(scop.row)">商品图片<i class="el-icon-top"></i>
              </el-button>
            </el-upload>
          </template>
        </el-table-column>

      </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="saveImg">确 定</el-button>
      </div>
    </el-dialog>


    <!--商品介绍查看弹窗-->
    <el-dialog title="商品介绍" :visible.sync="dialogFormVisible5" width="50%">
      <el-card>
        <mavon-editor
            class="md"
            :value="content"
            :subfield="false"
            :defaultOpen="'preview'"
            :toolbars-flag="false"
            :editable="false"
            :scroll-style="true"
            :ishljs="true"
        />

      </el-card>
    </el-dialog>


    <!--        商品介绍编辑弹窗-->


    <el-dialog title="商品介绍" :visible.sync="dialogFormVisible6" width="70%">
      <el-form label-width="80px" size="small">
        <!--          可以了哈，这里的html部分不需要加上this 哈-->
        <mavon-editor v-if=" form3 && form3.content " v-model="form3.content" :ishljs="true" ref="md"
                      @imgAdd="imgAdd"/>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="save6">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>


  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Product",
  data() {
    return {
      content1: '',
      content: '',
      imgUrl: "",
      imgList: [],
      img: '',
      productId: 0,
      product: {},
      value1: '',
      //默认展开的数组
      expends: [],
      //有的权限
      checks: [],
      menuData: [],
      name: "",
      total: 0,
      pageNum: 1,
      pageSize: 5,
      ProductParamsList: [],
      tableData: [],
      productInfo: [],
      collapseBtnClass: 'el-icon-s-fold',
      isCollapse: false,
      sideWidth: 200,
      logoText: true,
      dialogFormVisible: false,
      dialogFormVisible1: false,
      dialogFormVisible2: false,
      dialogFormVisible3: false,
      dialogFormVisible4: false,
      menuDiaVisible: false,
      dialogFormVisible5: false,
      dialogFormVisible6: false,
      form: {},
      form1: {},
      ImgForm: {},
      form3: {},
      multipleSelection: [],
      props: {
        label: "name"
      },
      classifications: [],
    }
  },

  //页面创建就执行这个函数
  created() {
    //请求分页查询数据
    this.load()
  },
  methods: {
    save6() {
      console.log(this.form3)
      this.request.post("/evaluate", this.form3).then(res => {
        if (res.code === '200') {
          this.dialogFormVisible6 = false
        } else {
          this.$message.error("添加失败")
        }
      })
    },
    imgAdd(pos, $file) {
      let $vm = this.$refs.md
      // 第一步.将图片上传到服务器.
      const formdata = new FormData();
      formdata.append('file', $file);
      axios({
        url: 'http://localhost:9090/file/upload',
        method: 'post',
        data: formdata,
        headers: {'Content-Type': 'multipart/form-data'},
      }).then((res) => {
        // 第二步.将返回的url替换到文本原位置![...](0) -> ![...](url)
        // $vm.$img2Url 详情见本页末尾
        $vm.$img2Url(pos, res.data);
      })
    },
    //商品介绍编辑
    handelEditEvaluate(row) {
      this.form3 = {}
      this.request.get("/evaluate/" + row.id).then(res => {
        // console.log(res)
        if (res.code === '200') {
          if (res.data !== null) {
            this.form3 = res.data
          }
          this.dialogFormVisible6 = true
        } else {
          this.$message.error("数据请求失败")
        }
        // console.log(this.form3)
      })
    },
    //查看商品介绍
    viewEvaluate(row) {
      this.content = ''
      this.request.get("/evaluate/" + row.id).then(res => {
        if (res.code === '200') {
          if (res.data !== null) {
            this.content = res.data.content
          }
        } else {
          this.$message.error("数据请求失败")
        }
      })
      this.dialogFormVisible5 = true
    },
    uploadImg(row) {
      this.productId = row.id
    },
    handleImgUploadSuccess(res) {
      this.ImgForm.url = res
      this.ImgForm.productId = this.productId
      this.request.post("/product-img", this.ImgForm).then(res => {
        if (res.code === '200') {
          this.$message.success("上传成功")
          this.dialogFormVisible4 = false
          this.load()
        } else {
          this.$message.error("上传失败")
        }
      })
    },
    saveImg() {
      this.ImgForm.url = this.imgUrl
      this.request.post("/product-img", this.ImgForm).then(res => {
        if (res.code === '200') {
          this.$message.success("保存成功")
          this.dialogFormVisible4 = false
          this.load()
        } else {
          this.$message.error("保存失败")
        }
      })
    },
    changeImg(row) {
      this.ImgForm = row

    },
    handleProductSuccess(res) {
      this.imgUrl = res
    },

    //查看商品图片与修改  请求数据
    viewProductImg(row) {
      this.imgList = []
      this.request.get("/product-img/" + row.id).then(res => {
        this.imgList = res.data
      })
      this.dialogFormVisible4 = true
    },
    //查看商品参数
    viewProductParams(row) {
      this.ProductParamsList = []
      this.dialogFormVisible2 = true
      this.request.get("/product-params/" + row.id).then(res => {
        if (res.data !== null) {
          this.ProductParamsList.push(res.data)
        }
      })
    },
    //编辑商品参数
    handelEditProductParams(row) {
      this.form1 = {}
      this.request.get("/product-params/" + row.id).then(res => {
        if (res.data !== null) {
          this.form1 = res.data;
        }
      })
      this.form1.productId = row.id
      this.dialogFormVisible3 = true
    },
    save1() {
      this.request.post("/product-params", this.form1).then(res => {
        if (res.code === '200') {
          this.$message.success("保存成功")
          this.dialogFormVisible3 = false
          this.load()
        } else {
          this.$message.error("保存失败")
        }
      })
    },
    //查看商品信息
    viewProductInfo(scope) {
      this.productInfo = []
      this.productInfo.push(scope)
      console.log(this.productInfo)
      this.dialogFormVisible1 = true
    },
    //是否每日推荐
    changeEveryday(scope) {
      this.form = scope.row
      this.request.post("/product", this.form).then(res => {
        if (res.code === '200') {
          this.$message.success("更新成功")
          this.load()
        } else {
          this.$message.error("更新失败")
        }
      })
    },
    changePutOnTheShelf(scope) {
      this.form = scope.row
      this.request.post("/product", this.form).then(res => {
        if (res.code === '200') {
          this.$message.success("更新成功")
          this.load()
        } else {
          this.$message.error("更新失败")
        }
      })
    },
    cancel() {
      this.dialogFormVisible = false
      this.dialogFormVisible1 = false
      this.dialogFormVisible2 = false
      this.dialogFormVisible6 = false
      this.load()
    },
    handleFileUploadSuccess(res) {
      this.img = res
    },
    handleSelectionChange(val) {
      this.multipleSelection = val
    },
    del(id) {
      this.request.delete("/product/" + id).then(res => {
        if (res.code === '200') {
          this.$message.success("删除成功")
          this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    handAdd() {
      this.dialogFormVisible = true;
      this.form = {};
    },
    delBatch() {
      let ids = this.multipleSelection.map(v => v.id) //[{}，{}，{}] => [1,2,3] 对象数组变纯id数组
      this.request.post("/product/del/batch", ids).then(res => {
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
      if (this.img !== "") {
        this.form.url = this.img
      }
      this.request.post("/product", this.form).then(res => {
        console.log(this.form)
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
    //点击收缩按钮触发
    collapse() {
      this.isCollapse = !this.isCollapse
      if (this.isCollapse) { //收缩
        this.sideWidth = 64;
        this.collapseBtnClass = 'el-icon-s-unfold';
        this.logoText = false;
      } else { //展开
        this.sideWidth = 200;
        this.collapseBtnClass = 'el-icon-s-fold';
        this.logoText = true;
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
      handleExcelImportSuccess() {
      this.$message.success("文件导入成功")
      this.load()
    },

    //封装请求数据的方法
      load() {
          if (this.name) {
              this.pageNum = 1;
          }

          this.request.get("/product/page", {
              params: {
                  name: this.name,
                  pageNum: this.pageNum,
                  pageSize: this.pageSize,
              }
          }).then(res => {
              this.tableData = res.data.records;
              this.total = res.data.total;
          });

          this.request.get("/classification").then(res => {
              this.classifications = res.data;
          });
      }

  }
}
</script>


<style scoped>
.avatar-uploader {
  text-align: center;
  padding-bottom: 10px;
}

.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}

.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}

.avatar {
  width: 100px;
  height: 100px;
  display: block;
}
</style>
