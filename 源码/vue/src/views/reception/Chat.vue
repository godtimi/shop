<template>
  <div>
    <h2 class="chat-title">客户服务中心</h2>
    <div class="chat-container">
      <avue-chat ref="chat" :keylist="keylist" @keysend="handleSubmit" @keyadd="handleAdd" :config="config" width="100%"
                 height="500" @submit="handleSubmit" :list="list" v-model="msg">
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
        img: 'data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMTIwIDEyMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDwhLS0g576O5aS0IC0tPgogICAgPGVsbGlwc2UgY3g9IjYwIiBjeT0iNjAiIHJ4PSI0NSIgcnk9IjQwIiBmaWxsPSIjZjBmMGYwIiAvPgogICAgPGVsbGlwc2UgY3g9IjYwIiBjeT0iNzAiIHJ4PSIzMCIgcnk9IjI1IiBmaWxsPSIjZjBmMGYwIiAvPgogICAgCiAgICA8IS0tIOiAs+acryAtLT4KICAgIDxlbGxpcHNlIGN4PSIzMCIgY3k9IjQwIiByeD0iMTUiIHJ5PSIyMCIgdHJhbnNmb3JtPSJyb3RhdGUoLTIwLCAzMCwgNDApIiBmaWxsPSIjZjBmMGYwIiBzdHJva2U9IiM2N0MyM0EiIHN0cm9rZS13aWR0aD0iMiIgLz4KICAgIDxlbGxpcHNlIGN4PSI5MCIgY3k9IjQwIiByeD0iMTUiIHJ5PSIyMCIgdHJhbnNmb3JtPSJyb3RhdGUoMjAsIDkwLCA0MCkiIGZpbGw9IiNmMGYwZjAiIHN0cm9rZT0iIzY3QzIzQSIgc3Ryb2tlLXdpZHRoPSIyIiAvPgogICAgCiAgICA8IS0tIOecvOebiCAtLT4KICAgIDxjaXJjbGUgY3g9IjQ1IiBjeT0iNjAiIHI9IjUiIGZpbGw9IiMzMzMiIC8+CiAgICA8Y2lyY2xlIGN4PSI3NSIgY3k9IjYwIiByPSI1IiBmaWxsPSIjMzMzIiAvPgogICAgPGNpcmNsZSBjeD0iNDUiIGN5PSI1OCIgcj0iMiIgZmlsbD0iI2ZmZiIgLz4KICAgIDxjaXJjbGUgY3g9Ijc1IiBjeT0iNTgiIHI9IjIiIGZpbGw9IiNmZmYiIC8+CiAgICAKICAgIDwhLS0g6byg5a2Q5ZKM5ZiKIC0tPgogICAgPGVsbGlwc2UgY3g9IjYwIiBjeT0iNzAiIHJ4PSIxMCIgcnk9IjciIGZpbGw9IiNmOWM2YzYiIC8+CiAgICA8cGF0aCBkPSJNNTAgNzUgUTYwIDg1IDcwIDc1IiBmaWxsPSJub25lIiBzdHJva2U9IiMzMzMiIHN0cm9rZS13aWR0aD0iMiIgLz4KICAgIAogICAgPCEtLSDop5IgLS0+CiAgICA8cGF0aCBkPSJNMzUgMzAgUTMwIDEwIDQwIDUiIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzY3QzIzQSIgc3Ryb2tlLXdpZHRoPSI0IiBzdHJva2UtbGluZWNhcD0icm91bmQiIC8+CiAgICA8cGF0aCBkPSJNODUgMzAgUTkwIDEwIDgwIDUiIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzY3QzIzQSIgc3Ryb2tlLXdpZHRoPSI0IiBzdHJva2UtbGluZWNhcD0icm91bmQiIC8+CiAgICAKICAgIDwhLS0g5pyA5paw5re75Yqg77ya6Ieq5Yqo5YiH5o2i5peg6ZmQ5L2NIC0tPgogICAgPGNpcmNsZSBjeD0iNjAiIGN5PSI2MCIgcj0iNTUiIGZpbGw9InRyYW5zcGFyZW50IiBzdHJva2U9IiM2N0MyM0EiIHN0cm9rZS13aWR0aD0iMiIgc3Ryb2tlLWRhc2hhcnJheT0iNSAzIiBvcGFjaXR5PSIwLjUiIC8+CiAgICA8Y2lyY2xlIGN4PSI0NSIgY3k9IjQ1IiByPSIzIiBmaWxsPSIjNjdDMjNBIiBvcGFjaXR5PSIwLjgiPgogICAgICAgIDxhbmltYXRlIGF0dHJpYnV0ZU5hbWU9ImN4IiBmcm9tPSI0NSIgdG89IjgwIiBkdXI9IjJzIiByZXBlYXRDb3VudD0iaW5kZWZpbml0ZSIgYmVnaW49IjAuMXMiIC8+CiAgICA8L2NpcmNsZT4KICAgIDxjaXJjbGUgY3g9IjM1IiBjeT0iNjUiIHI9IjIiIGZpbGw9IiM2N0MyM0EiIG9wYWNpdHk9IjAuNiI+CiAgICAgICAgPGFuaW1hdGUgYXR0cmlidXRlTmFtZT0iY3giIGZyb209IjM1IiB0bz0iOTAiIGR1cj0iMS41cyIgcmVwZWF0Q291bnQ9ImluZGVmaW5pdGUiIGJlZ2luPSIwcyIgLz4KICAgIDwvY2lyY2xlPgogICAgPGNpcmNsZSBjeD0iODAiIGN5PSI1NSIgcj0iMi41IiBmaWxsPSIjNjdDMjNBIiBvcGFjaXR5PSIwLjciPgogICAgICAgIDxhbmltYXRlIGF0dHJpYnV0ZU5hbWU9ImN5IiBmcm9tPSI1NSIgdG89IjgwIiBkdXI9IjEuOHMiIHJlcGVhdENvdW50PSJpbmRlZmluaXRlIiBiZWdpbj0iMC41cyIgLz4KICAgIDwvY2lyY2xlPgo8L3N2Zz4=',
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
          "img": 'data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMTIwIDEyMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDwhLS0g576O5aS0IC0tPgogICAgPGVsbGlwc2UgY3g9IjYwIiBjeT0iNjAiIHJ4PSI0NSIgcnk9IjQwIiBmaWxsPSIjZjBmMGYwIiAvPgogICAgPGVsbGlwc2UgY3g9IjYwIiBjeT0iNzAiIHJ4PSIzMCIgcnk9IjI1IiBmaWxsPSIjZjBmMGYwIiAvPgogICAgCiAgICA8IS0tIOiAs+acryAtLT4KICAgIDxlbGxpcHNlIGN4PSIzMCIgY3k9IjQwIiByeD0iMTUiIHJ5PSIyMCIgdHJhbnNmb3JtPSJyb3RhdGUoLTIwLCAzMCwgNDApIiBmaWxsPSIjZjBmMGYwIiBzdHJva2U9IiM2N0MyM0EiIHN0cm9rZS13aWR0aD0iMiIgLz4KICAgIDxlbGxpcHNlIGN4PSI5MCIgY3k9IjQwIiByeD0iMTUiIHJ5PSIyMCIgdHJhbnNmb3JtPSJyb3RhdGUoMjAsIDkwLCA0MCkiIGZpbGw9IiNmMGYwZjAiIHN0cm9rZT0iIzY3QzIzQSIgc3Ryb2tlLXdpZHRoPSIyIiAvPgogICAgCiAgICA8IS0tIOecvOebiCAtLT4KICAgIDxjaXJjbGUgY3g9IjQ1IiBjeT0iNjAiIHI9IjUiIGZpbGw9IiMzMzMiIC8+CiAgICA8Y2lyY2xlIGN4PSI3NSIgY3k9IjYwIiByPSI1IiBmaWxsPSIjMzMzIiAvPgogICAgPGNpcmNsZSBjeD0iNDUiIGN5PSI1OCIgcj0iMiIgZmlsbD0iI2ZmZiIgLz4KICAgIDxjaXJjbGUgY3g9Ijc1IiBjeT0iNTgiIHI9IjIiIGZpbGw9IiNmZmYiIC8+CiAgICAKICAgIDwhLS0g6byg5a2Q5ZKM5ZiKIC0tPgogICAgPGVsbGlwc2UgY3g9IjYwIiBjeT0iNzAiIHJ4PSIxMCIgcnk9IjciIGZpbGw9IiNmOWM2YzYiIC8+CiAgICA8cGF0aCBkPSJNNTAgNzUgUTYwIDg1IDcwIDc1IiBmaWxsPSJub25lIiBzdHJva2U9IiMzMzMiIHN0cm9rZS13aWR0aD0iMiIgLz4KICAgIAogICAgPCEtLSDop5IgLS0+CiAgICA8cGF0aCBkPSJNMzUgMzAgUTMwIDEwIDQwIDUiIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzY3QzIzQSIgc3Ryb2tlLXdpZHRoPSI0IiBzdHJva2UtbGluZWNhcD0icm91bmQiIC8+CiAgICA8cGF0aCBkPSJNODUgMzAgUTkwIDEwIDgwIDUiIGZpbGw9Im5vbmUiIHN0cm9rZT0iIzY3QzIzQSIgc3Ryb2tlLXdpZHRoPSI0IiBzdHJva2UtbGluZWNhcD0icm91bmQiIC8+CiAgICAKICAgIDwhLS0g5pyA5paw5re75Yqg77ya6Ieq5Yqo5YiH5o2i5peg6ZmQ5L2NIC0tPgogICAgPGNpcmNsZSBjeD0iNjAiIGN5PSI2MCIgcj0iNTUiIGZpbGw9InRyYW5zcGFyZW50IiBzdHJva2U9IiM2N0MyM0EiIHN0cm9rZS13aWR0aD0iMiIgc3Ryb2tlLWRhc2hhcnJheT0iNSAzIiBvcGFjaXR5PSIwLjUiIC8+CiAgICA8Y2lyY2xlIGN4PSI0NSIgY3k9IjQ1IiByPSIzIiBmaWxsPSIjNjdDMjNBIiBvcGFjaXR5PSIwLjgiPgogICAgICAgIDxhbmltYXRlIGF0dHJpYnV0ZU5hbWU9ImN4IiBmcm9tPSI0NSIgdG89IjgwIiBkdXI9IjJzIiByZXBlYXRDb3VudD0iaW5kZWZpbml0ZSIgYmVnaW49IjAuMXMiIC8+CiAgICA8L2NpcmNsZT4KICAgIDxjaXJjbGUgY3g9IjM1IiBjeT0iNjUiIHI9IjIiIGZpbGw9IiM2N0MyM0EiIG9wYWNpdHk9IjAuNiI+CiAgICAgICAgPGFuaW1hdGUgYXR0cmlidXRlTmFtZT0iY3giIGZyb209IjM1IiB0bz0iOTAiIGR1cj0iMS41cyIgcmVwZWF0Q291bnQ9ImluZGVmaW5pdGUiIGJlZ2luPSIwcyIgLz4KICAgIDwvY2lyY2xlPgogICAgPGNpcmNsZSBjeD0iODAiIGN5PSI1NSIgcj0iMi41IiBmaWxsPSIjNjdDMjNBIiBvcGFjaXR5PSIwLjciPgogICAgICAgIDxhbmltYXRlIGF0dHJpYnV0ZU5hbWU9ImN5IiBmcm9tPSI1NSIgdG89IjgwIiBkdXI9IjEuOHMiIHJlcGVhdENvdW50PSJpbmRlZmluaXRlIiBiZWdpbj0iMC41cyIgLz4KICAgIDwvY2lyY2xlPgo8L3N2Zz4=',
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
.chat-title {
  text-align: center;
  margin-bottom: 20px;
  color: #67C23A;
  font-weight: 500;
}

.chat-container {
  width: 100%;
  max-width: 1000px;
  height: auto;
  min-height: 500px;
  margin: 0 auto;
  padding: 0;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
  border-radius: 12px;
  overflow: hidden;
}

@media screen and (max-width: 768px) {
  .chat-container {
    max-width: 100%;
    margin: 0 10px;
  }
  
  ::v-deep .avue-chat__send {
    padding: 8px 15px;
  }
  
  ::v-deep .avue-chat__keys-item {
    margin: 3px;
    padding: 5px 10px;
    font-size: 12px;
  }
}

::v-deep .avue-chat .web__logo {
  background: linear-gradient(135deg, #67C23A, #95D475);
  display: flex;
  padding: 15px 20px;
  margin: 0;
  width: 100%;
  vertical-align: middle;
  color: white;
  font-weight: bold;
  border-radius: 12px 12px 0 0;
  box-shadow: 0 2px 10px rgba(103, 194, 58, 0.2);
}

::v-deep .avue-chat {
  border-radius: 12px;
  border: 1px solid #ebeef5;
}

::v-deep .avue-chat__content {
  background-color: #f7f8fa;
  padding: 15px;
}

::v-deep .avue-chat__item {
  margin-bottom: 15px;
}

::v-deep .avue-chat__item.mine .avue-chat__content {
  background: #e1f3d8;
  border-radius: 18px 18px 0 18px;
  box-shadow: 0 2px 6px rgba(103, 194, 58, 0.15);
}

::v-deep .avue-chat__item:not(.mine) .avue-chat__content {
  background: white;
  border-radius: 18px 18px 18px 0;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.06);
}

::v-deep .avue-chat__main {
  border-top: 1px solid #ebeef5;
}

::v-deep .avue-chat__footer {
  background-color: #fff;
  padding: 15px 20px;
  border-radius: 0 0 12px 12px;
  display: flex;
  align-items: center;
}

::v-deep .avue-chat__tools {
  display: flex;
  gap: 10px;
  margin-right: 10px;
}

::v-deep .avue-chat__tools-item {
  color: #909399;
  transition: all 0.3s;
  font-size: 18px;
}

::v-deep .avue-chat__tools-item:hover {
  color: #67C23A;
  transform: scale(1.1);
}

::v-deep .avue-chat__input {
  flex: 1;
  border-radius: 20px;
  padding: 10px 15px;
  border: 1px solid #e0e0e0;
  transition: all 0.3s;
  height: 40px;
}

::v-deep .avue-chat__input:focus {
  border-color: #67C23A;
  box-shadow: 0 0 0 2px rgba(103, 194, 58, 0.2);
}

::v-deep .avue-chat__send {
  background: linear-gradient(135deg, #67C23A, #95D475);
  border-radius: 20px;
  border: none;
  color: white;
  padding: 8px 20px;
  margin-left: 10px;
  transition: all 0.3s;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
}

::v-deep .avue-chat__send:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(103, 194, 58, 0.3);
}

::v-deep .avue-chat__item-avatar {
  border-radius: 50%;
  border: 2px solid white;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

::v-deep .avue-chat__item-name {
  font-weight: 500;
  margin-bottom: 5px;
  color: #606266;
}

::v-deep .avue-chat__item-date {
  font-size: 12px;
  color: #909399;
}

::v-deep .avue-chat__keys {
  background-color: #f7f8fa;
  border-radius: 8px;
  padding: 10px;
  margin-bottom: 10px;
}

::v-deep .avue-chat__keys-item {
  background: white;
  border-radius: 16px;
  margin: 5px;
  padding: 6px 12px;
  border: 1px solid #e0e0e0;
  transition: all 0.3s;
}

::v-deep .avue-chat__keys-item:hover {
  background-color: #67C23A;
  color: white;
  border-color: #67C23A;
}
</style>