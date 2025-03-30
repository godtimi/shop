<template>
  <div>
    <div>
      <!--      头部-->
      <Header :user="user"/>
    </div>
    <div style="padding-top: 119px;">
      <!--      内容-->
      <router-view @refreshUser="getUser" style="width: 100%; " :key="key"/>
    </div>
  </div>
</template>

<script>
import Header from "@/reception/Header";

export default {
  name: "Front",
  components: {Header},
  computed: {
    key() {
      return this.$route.name !== undefined ? this.$route.name + +new Date() : this.$route + +new Date()
    }
  },
  data() {

    return {
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}
    }
  },
  created() {
    this.$store.commit("updateUser", localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {})
  },
  methods: {
    getUser() {
      let username = localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")).username : ""
      //从后台获取数据
      this.request.get("/user/personify/" + username).then(res => {
        //重新赋值
        this.user = res.data
        this.$store.commit("updateUser", res.data)
      })

    }
  }
}
</script>

<style scoped>

</style>