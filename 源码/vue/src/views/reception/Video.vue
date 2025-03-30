<template>
  <d-player ref="player" :options="options" v-if="this.options.video.url"></d-player>
</template>

<script type="text/ecmascript-6">
import 'vue-dplayer/dist/vue-dplayer.css'

export default {
  name: 'in-video',
  props: {
    source: {
      type: String,
      default: ''
    }
  },
  data() {
    return {
      productId: this.$store.state.productId,
      options: {
        autoplay: true,
        screenshot: true,
        hotkey: true,
        preload: 'auto',  // 自动预加载
        video: {
          url: ''
        },
      }
    }
  },
  created() {
    this.request("/product/" + this.productId).then(res => {
      this.options.video.url = res.data.video
    })
  }
}
</script>
