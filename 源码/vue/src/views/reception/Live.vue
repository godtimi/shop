<template>
  <div class="a">
    <div style="margin: 0 auto; width: 1048px;padding-top: 300px">

      <div style="display: flex;margin-left: 10px;background: #FFFFFF;width: 100%;">
        <img :src="live.userUrl" alt=""
             style="width: 70px;border-radius: 50%;position: relative;right: 5px;margin-left: 20px">
        <div style="width: 200px;margin-top: 5px;margin-left: 10px">
          <span style="font-size: 24px">{{ live.info }}</span>
          <div style="margin-top: 5px;margin-left: 10px">
            <span style="color: #999999;font-size: 14px"> {{ live.name }}</span>
          </div>
        </div>
      </div>
      <div style="width: 1048px;margin-left: 10px;
      height: 618px;">
        <video
            id="videoLive"
            crossOrigin="anonymous"
            controls
            autoPlay
            width="100%"
            height="100%"
            style="object-fit: fill"
        ></video>
      </div>
      <div style="background: #FFFFFF;margin-left: 10px;width: 1048px;">
        <ul style="padding-left: 250px;padding-top: 10px">
          <li v-for="item in productList" :key="item.id">
            <div style="cursor: pointer;
              padding-bottom: 10px; overflow: hidden;
              " class="box-card">
              <div style="display: flex">
                <div style="width: 100px;height: 100px;overflow: hidden; ">
                  <img :src="item.url" style="width: 100%;height: 100%">
                </div>

                <div style="flex: 1;padding-left: 10px">
                  <div class="item" style="margin-top: 5px">
                    {{ item.name }}
                  </div>
                  <div style="padding:  5px 0; color: orangered;margin-top: 35px">
                    <span style="font-size: 18px">￥</span>{{ item.sellPrice }}
                    <el-button style="margin-left: 250px;background: orangered;color: #FFFFFF"
                               @click="viewProduct(item.productId
)">去抢购
                    </el-button>
                  </div>
                </div>
              </div>
            </div>

          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import flvjs from "flv.js";

export default {
  name: "Live",
  data() {
    return {
      flvPlayer: null,
      id: this.$route.query.id,
      live: {},
      url: '',
      productList: {},
      form: {},
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
    };
  },
  created() {

    this.request.get("/live-product/" + this.id).then(res => {
      this.productList = res.data
      console.log(this.productList)
    })


    if (this.id !== null) {
      this.request.get("/live/" + this.id).then(res => {
        this.live = res.data
        this.createVideo(this.live.liveUrl, "videoLive")
      })
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
    createVideo(url, elementId) {
      if (flvjs.isSupported()) {
        let videoElement = document.getElementById(elementId);
        this.flvPlayer = flvjs.createPlayer({
          type: "flv",
          enableWorker: true, //浏览器端开启flv.js的worker,多进程运行flv.js
          isLive: true, //直播模式
          hasAudio: false, //关闭音频
          hasVideo: true,
          stashInitialSize: 128,
          enableStashBuffer: true, //播放flv时，设置是否启用播放缓存，只在直播起作用。
          url: url,
        });
        this.flvPlayer.attachMediaElement(videoElement);
        this.flvPlayer.load();
        this.flvPlayer.play();
      }
    },
  },
};
</script>

<style scoped>

/deep/ element.style {
  padding-top: 0px;
}

ul li {
  display: inline-block;
}

.a {
  height: 1500px;
  background: url("../../assets/img/bei.jpg") no-repeat center center;
}
</style>

