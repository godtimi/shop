<template>
  <div style="max-width: 980px;min-width: 980px;margin: 0 auto;padding-top: 30px">
    <div>
      <div style="text-align: center">
        <h3> {{ article.title }}</h3>
      </div>
      <div style="text-align: center;margin-top: 50px">
        <mavon-editor
            style="width: 962px;z-index: 500;"
            class="md"
            :value="content"
            :subfield="false"
            :defaultOpen="'preview'"
            :toolbars-flag="false"
            :editable="false"
            :scroll-style="true"
            :ishljs="true"
            :imageClick="false"
        />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Article",
  data() {
    return {
      content: '',
      articleId: this.$route.query.id,
      article: {},
    }
  },
  methods: {},
  created() {
    this.request.get("/article/" + this.articleId).then(res => {
      console.log(res)
      if (res.code === '200') {
        if (res.data !== null) {
          this.article = res.data
          this.content = res.data.content
        }
      } else {
        this.$message.error("数据请求失败")
      }
    })
  }
}
</script>

<style scoped>
/*/deep/ .markdown-body img {*/
/*  width: 300px;*/
/*}*/
</style>