<template>
  <div>
    <div style="height: 560px;width:900px; margin: 0 auto; ;padding-top: 30px">
      <avue-chat ref="chat" :keylist="keylist" @keysend="handleSubmit" @keyadd="handleAdd" :config="config" width="800"
                 height="560" @submit="handleSubmit" :list="list" v-model="msg">
      </avue-chat>
    </div>
  </div>
</template>

<script>
export default {
  name: "Chat",
  data() {
    return {
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
      i: 1,
      config: {
        img: 'http://localhost:9090/file/dfd0df1ad6f14f768e7458d3a5832ad3.png',
        name: '下单自助机器人',
        dept: ''
      },
      keylist: [
        '如何联系客服？',
        '如何申请退款？',
        '质量问题',
      ],
      msg: '',
      list: [
        {
          "date": "",
          "text": {
            "text": 'Hi，我是下单自助机器人，有什么可以帮助你的?'
          },
          "mine": false,
          "img": 'http://localhost:9090/file/dfd0df1ad6f14f768e7458d3a5832ad3.png',
          "name": "下单自助机器人"
        },
        // {
        //   "date": "2019-07-17 23:25:15",
        //   "text": {
        //     "text": "你说啥我听不懂啊"
        //   },
        //   "mine": true,
        //   "img": "http://localhost:9090/file/e0ec8d751c4a459cb232487515a17ab6.jpg",
        //   "name": "云集汇通自助客服"
        // }
      ]
    }
  },
  mounted() {
    // this.handleSubmit('如何贷款')
  },
  methods: {
    handleAdd(msg) {
      this.keylist.push(msg);
      this.$message.success('快捷回复语添加成功')
    },
    handleSubmit(msg) {
      console.log(this.user.avatarUrl)
      this.msg = msg || this.msg
      this.$refs.chat.pushMsg({
        mine: true,
        text: this.msg,
      });
      this.list[this.i].img = this.user.avatarUrl
      this.i = this.i + 2
      this.$refs.chat.rootSendMsg(this.getMsg(this.msg));
      this.msg = '';
    },
	
    //智能题库
    getMsg(msg) {
      if (msg === '你好') {
        return {
          text: 'Hi，我是下单自助机器人，有什么可以帮助你的?',
          list: [
            {
              text: "质量问题",
              ask: '质量问题'
            },
            {
              text: "如何联系客服？",
              ask: '联系客服'
            },
            {
              text: "如何申请退款？",
              ask: '申请退款'
            },
            {
              text: "如何搜索商品？",
              ask: '搜索商品'
            },
          ]
        };
      } else if (msg .includes('申请退款')) {
        return '亲，若您需要申请退款，操作如下：\n' +
            '\n' +
            '1、交易成功前，您可以登录商城-【我的订单】找到对应订单，点击【申请退款】。交易成功后，您可在72小时内登陆商城【我的订单】-【已完成】找到对应订单，点击【申请退款】。\n' +
            '\n' +
            '2、若上述操作不能解决您的问题，请您联系商城管理人员：QQ：88888888。'
      } else if (msg === '质量问题') {
        return '商品送达72小时内，发现腐烂/变质/等情况，商城24小时内响应审核退款。'
      } else if (msg === '搜索商品') {
        return '亲，搜索商品的路径：在搜索方框中填上您要购买的宝贝，点击【搜索】，选择喜欢的商品，确认无误之后，点击【立即购买】或加入购物车合并下单哦~'
      } else if (msg === '如何联系客服？') {
        return '亲，本商城客服电话88888888~'
      }
          // else if (msg === '如何联系客服？') {
          //   return '亲，搜索商品的路径：在搜索方框中填上您要购买的宝贝，点击【搜索】，选择喜欢的商品，确认无误之后，点击【立即购买】或加入购物车合并下单哦~'
      // }
      else if (msg === '如何申请退款？') {
        return '亲，若您需要申请退款，操作如下：\n' +
            '\n' +
            '1、交易成功前，您可以登录商城-【我的订单】找到对应订单，点击【申请退款】。交易成功后，您可在72小时内登陆商城【我的订单】-【已完成】找到对应订单，点击【申请退款】。\n' +
            '\n' +
            '2、若上述操作不能解决您的问题，请您联系商城管理人员：QQ：XXXXX。'
      } else if (msg.includes('客服')) {
        return '亲，搜索商品的路径：在搜索方框中填上您要购买的宝贝，点击【搜索】，选择喜欢的商品，确认无误之后，点击【立即购买】或加入购物车合并下单哦~'
      }
      // else if (msg === '如何联系淘宝客服？') {
      //   return '亲，搜索商品的路径：在搜索方框中填上您要购买的宝贝，点击【搜索】，选择喜欢的商品，确认无误之后，点击【立即购买】或加入购物车合并下单哦~'
      // } else if (msg === '如何联系淘宝客服？') {
      //   return '亲，搜索商品的路径：在搜索方框中填上您要购买的宝贝，点击【搜索】，选择喜欢的商品，确认无误之后，点击【立即购买】或加入购物车合并下单哦~'
      // } else if (msg === '如何联系淘宝客服？') {
      //   return '亲，搜索商品的路径：在搜索方框中填上您要购买的宝贝，点击【搜索】，选择喜欢的商品，确认无误之后，点击【立即购买】或加入购物车合并下单哦~'
      // }
      return {
        text: '亲，不太明白您的意思，请再描述一下问题，我会为您排忧解难哒~'
      }
    },
  }
}
</script>

<style scoped>

/deep/ .avue-chat .web__logo {
  background-color: #409eff;
  display: flex;
  padding: 15px 12px;
  margin: 0 0;
  width: 800px;
  vertical-align: middle;
}
</style>