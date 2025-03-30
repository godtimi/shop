import Vue from 'vue'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import App from './App.vue'
import router from './router'
import './assets/gloable.css'
import request from "@/utils/request"
import store from './store'
import Moment from 'moment';
import 'default-passive-events'

import mavonEditor from 'mavon-editor'
import 'mavon-editor/dist/css/index.css'

import Avue from '@smallwei/avue';
import '@smallwei/avue/lib/index.css';

Vue.use(Avue);


import VideoPlayer from 'vue-video-player';
// import 'vue-video-player/src/custom-theme.css';
import 'video.js/dist/video-js.css'

Vue.use(VideoPlayer)


import VueDPlayer from "vue-dplayer";
import "vue-dplayer/dist/vue-dplayer.css";

Vue.use(VueDPlayer);


Vue.use(mavonEditor)


// 定义全局时间戳过滤器
Vue.filter('formatDate', function (value) {
    return Moment(value).format('YYYY-MM-DD HH:mm:ss')
})

Vue.config.productionTip = false
Vue.use(ElementUI, { size: "mini" });
Vue.prototype.request = request
new Vue({
    router,
    store,
    render: h => h(App)
}).$mount('#app')
