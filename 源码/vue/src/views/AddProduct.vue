<template>
  <div>
    <div style="width: 800px;margin: 0 auto">
      <div style="margin-bottom: 60px;padding-left: 50px">
        <el-steps :active="active" finish-status="success">
          <el-step title="商品信息"></el-step>
          <el-step title="商品参数"></el-step>
          <el-step title="商品图片与视频"></el-step>
          <el-step title="商品介绍"></el-step>
        </el-steps>
      </div>
      <div style="margin: 0 auto;padding-right: 100px;width: 800px;">
        <!--        商品信息-->
        <el-form label-width="150px" :model="form" size="small" v-if="this.active === 0" :rules="rules"
                 ref="form">
          <el-form-item label="价格" prop="sellPrice">
            <el-input v-model="form.sellPrice" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="单位" prop="unit">
            <el-input v-model="form.unit" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="上架">
            <el-switch v-model="form.putOnTheShelf" active-color="#13ce66" inactive-color="#ccc"
            >
            </el-switch>
          </el-form-item>
          <el-form-item label="每日推荐">
            <el-switch v-model="form.isDaily" active-color="#13ce66" inactive-color="#ccc"
            >
            </el-switch>
          </el-form-item>
          <el-form-item label="sku库存" prop="store">
            <el-input v-model="form.store" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="商品名称" prop="name">
            <el-input v-model="form.name" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="发货地点" prop="city">
            <el-input v-model="form.city" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="描述信息" prop="description">
            <el-input v-model="form.description" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="商品种类" prop="classificationName">
            <el-select clearable v-model="form.classificationName" placeholder="请选择商品种类" style="width: 100%">
              <el-option v-for="item in classifications" :key="item.id" :label="item.name" :value="item.name">
              </el-option>
            </el-select>
          </el-form-item>
          <div style="padding-left: 350px">
            <el-upload action="http://localhost:9090/file/upload" :show-file-list="true"
                       list-type="picture"
                       accept="xlsx"
                       style="display: inline-block" class="mr-5" :on-success="handleFileUploadSuccess">
              <el-button type="primary" class="ml-5">商品主图片<i class="el-icon-top"></i></el-button>
            </el-upload>
          </div>
        </el-form>
        <!--        商品参数-->
        <el-form label-width="150px" size="small" :model="form1" ref="form1" v-if="this.active === 1" :rules="rules">
          <el-form-item label="产地" prop="productAddress" key="productAddress">
            <el-input v-model="form1.productAddress" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="保质期" prop="productPeriod" key="productPeriod">
            <el-input v-model="form1.productPeriod" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="品牌名" prop="brand" key="brand">
            <el-input v-model="form1.brand" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="生产厂名" prop="factoryName" key="factoryName">
            <el-input v-model="form1.factoryName" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="生产厂址" prop="factorAddress" key="factorAddress">
            <el-input v-model="form1.factorAddress" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="包装方式" prop="packagingMethod" key="packagingMethod">
            <el-input v-model="form1.packagingMethod" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="存储方式" prop="stroageMethod" key="stroageMethod">
            <el-input v-model="form1.stroageMethod" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="食用方法" prop="eatMethod" key="eatMethod">
            <el-input v-model="form1.eatMethod" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="规格重量（kg）" prop="weight" key="weight">
            <el-input v-model="form1.weight" autocomplete="off"></el-input>
          </el-form-item>
        </el-form>

        <!--        商品图片-->
        <div v-if="this.active === 2" style="padding-left: 88px">
          <el-upload
              class="upload-demo"
              action="http://localhost:9090/file/upload"
              :file-list="fileList"
              :on-remove="handleRemove"
              :on-success="handleImgUploadSuccess"
              list-type="picture">
            <el-button size="small" type="primary">点击上传</el-button>
          </el-upload>

          <el-upload
              class="upload-demo"
              action="http://localhost:9090/file/upload"
              :on-success="handlemp4UploadSuccess">
            <el-button size="small" type="primary" style="margin-top: 200px">点击上传商品视频</el-button>
          </el-upload>

        </div>


        <!--    商品介绍-->
        <el-form label-width="150px" size="small" v-if="this.active === 3">
          <el-form-item label="商品介绍">
            <mavon-editor v-model="evaluate.content" :ishljs="true" ref="md" @imgAdd="imgAdd"/>
          </el-form-item>
        </el-form>

      </div>


      <div style="float: right" v-if="this.active===0">
        <el-button type="primary" style="margin-top: 12px;" @click="next">下一步，填写商品参数</el-button>
      </div>

      <div style="float: right" v-if="this.active===1">
        <el-button style="margin-top: 12px;" @click="upper">上一步，填写商品信息</el-button>
        <el-button type="primary" style="margin-top: 12px;" @click="next1">下一步，上传商品图片</el-button>
      </div>

      <div style="float: right" v-if="this.active===2">
        <el-button style="margin-top: 12px;" @click="upper">上一步，填写商品参数</el-button>
        <el-button type="primary" style="margin-top: 12px;" @click="next2">下一步，填写商品介绍</el-button>
      </div>

      <div style="float: right" v-if="this.active===3">
        <el-button style="margin-top: 12px;" @click="upper">上一步，填写商品介绍</el-button>
        <el-button type="primary" style="margin-top: 12px;" @click="complete">完成</el-button>
      </div>


    </div>
    <el-dialog title="提示" :visible.sync="dialogFormVisible" width="30%" :before-close="handleClose">

      <!--      <el-button style="margin-top: 12px;" @click="next">取消</el-button>-->
      <span>是否提交表单</span>
      <span slot="footer" class="dialog-footer">
        <el-button @click="cancel">取 消</el-button>
        <el-button type="primary" @click="determine">确 定</el-button>
      </span>
    </el-dialog>

  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "AddProduct",
  data() {
    var checkSellPrice = (rules, value, callback) => {
      let reg = /^[+-]?(0|([1-9]\d*))(\.\d+)?$/g;
      if (!value) {
        return callback(new Error('价格不能为空'));
      }
      if (!reg.test(value)) {
        callback(new Error('请输入数字值'));
      } else {
        callback();
      }
    };
    var checkStore = (rules, value, callback) => {
      if (!value) {
        return callback(new Error('库存不能为空'));
      }
      if (!Number.isInteger(+value)) {
        callback(new Error('请输入数字值'));
      } else {
        callback();
      }
    };
    var checkWeight = (rules, value, callback) => {
      let reg = /^[+-]?(0|([1-9]\d*))(\.\d+)?$/g;
      if (!value) {
        return callback(new Error('规格重量不能为空'));
      }
      if (!reg.test(value)) {
        callback(new Error('请输入数字值'));
      } else {
        callback();
      }
    };
    return {

      rules: {
        sellPrice: [
          {validator: checkSellPrice, rigger: 'blur'},
        ],
        unit: [
          {required: true, message: '请输入单位', trigger: 'blur'},
        ],
        name: [
          {required: true, message: '请输入商品名称', trigger: 'blur'},
        ],
        city: [
          {required: true, message: '请输入发货地址', trigger: 'blur'},
        ],
        store: [
          {validator: checkStore, trigger: 'blur'},
        ],
        description: [
          {required: true, message: '请输入描述信息', trigger: 'blur'},
        ],
        classificationName: [
          {required: true, message: '请选择商品种类', trigger: 'change'}
        ],
        productAddress: [
          {required: true, message: '请输入产地', trigger: 'blur'},
        ],
        productPeriod: [
          {required: true, message: '请输入商品保质期', trigger: 'blur'},
        ],
        weight: [
          {validator: checkWeight, trigger: 'blur'},
        ],
        brand: [
          {required: true, message: '请输入规格重量', trigger: 'blur'},
        ],
        factoryName: [
          {required: true, message: '请输入生产厂名', trigger: 'blur'},
        ],
        factorAddress: [
          {required: true, message: '请输入生产厂址', trigger: 'blur'},
        ],
        packagingMethod: [
          {required: true, message: '请输入包装方式', trigger: 'blur'},
        ],
        stroageMethod: [
          {required: true, message: '请输入存储方式', trigger: 'blur'},
        ],
        eatMethod: [
          {required: true, message: '请输入食用方法', trigger: 'blur'},
        ],
      },
      fileList: [],
      active: 0,
      img: '',
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
      tableData: [],
      collapseBtnClass: 'el-icon-s-fold',
      isCollapse: false,
      sideWidth: 200,
      logoText: true,
      dialogFormVisible: false,
      menuDiaVisible: false,
      evaluate: {},
      form: {},
      form1: {},
      urlList: [],
      multipleSelection: [],
      props: {
        label: "name"
      },
      classifications: []
    }
  },

  //页面创建就执行这个函数
  created() {
    this.load()
  },
  methods: {
    handlemp4UploadSuccess(res) {
      this.form.video = res
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
    handleClose(done) {
      this.$confirm('确认关闭？')
          .then(_ => {
            done();
          })
          .catch(_ => {
          });
    },
    //文件上传
    handleImgUploadSuccess(response, file, fileList) {
      this.urlList = []
      for (let i = 0; i < fileList.length; i++) {
        this.urlList.push(fileList[i].response)
      }
      console.log(this.urlList)
    },
    handleRemove(file, fileList) {
      this.urlList = []
      for (let i = 0; i < fileList.length; i++) {
        this.urlList.push(fileList[i].response)
      }
      console.log(this.urlList)
    },

    determine() {
      this.active = 4
      //表一
      if (this.img !== "") {
        this.form.url = this.img
      }
      this.request.post("/product", this.form).then(res => {
        if (res.code === '200') {
          //表二
          this.form1.productId = res.data
          this.request.post("/product-params", this.form1).then(res => {
            if (res.code === '200') {
            } else {
              this.$message.error("添加失败")
            }
          })
          this.evaluate.productId = res.data
          //表三
          this.request.post("/evaluate", this.evaluate).then(res => {
            if (res.code === '200') {
            } else {
              this.$message.error("添加失败")
            }
          })
          //表四
          this.request.post("/product-img/" + res.data, this.urlList).then(res => {
            if (res.code === '200') {
              this.$message.success("添加成功")
              this.dialogFormVisible = false
              this.evaluate = {}
              this.form = {}
              this.form1 = {}
              this.active = 0
              this.load()
            } else {
              this.dialogFormVisible = false
              this.$message.error("添加失败")
            }
          })
        } else {
          this.$message.error("添加失败")
        }
      })

    },
    //上一步
    upper() {
      if (this.active-- <= 0) this.active = 0;
    },
    //下一步
    next() {
      this.$refs['form'].validate((valid) => {
        if (valid) {
          if (this.active++ >= 3) this.active = 3;
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    //下一步1
    next1() {
      this.$refs['form1'].validate((valid) => {
        if (valid) {
          if (this.active++ >= 3) this.active = 3;
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    next2() {
      if (this.active++ >= 3) this.active = 3;
    },
    //完成
    complete() {
      this.dialogFormVisible = true
    },
    cancel() {
      this.dialogFormVisible = false
      this.active = 3
    },
    handleFileUploadSuccess(res) {
      this.img = res
    },
    //封装请求数据的方法
    load() {
      this.request.get("/classification").then(res => {
        this.classifications = res.data
      })
    }
  }
}
</script>


<style scoped>
</style>