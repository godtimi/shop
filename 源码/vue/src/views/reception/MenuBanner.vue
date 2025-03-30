<template>
  <div>
    <div class="menu-banner">
      <div class="menu-container" @mouseleave="bannerMenuHide()">
        <ul class="menu-list">
          <li class="list-item"
              v-for="(item, index) in menus"
              :key="index"
              @mouseenter="bannerMenuShow(item.type)">
            <a :href="item.url" target="blank">{{ item.value }}</a>
            <i class="el-icon-arrow-right"></i>
          </li>
        </ul>
      </div>

      <div class="menu-info"
           v-show="bannerMenuFlag"
           @mouseleave="bannerMenuHide()"
           @mouseenter="bannerMenuShow()">
        <ul class="menu-info-list"
            v-for="(list, key) in menuListMatch"
            :key="key"
            :data-key="key">
          <li class="info-list-item"
              v-for="(item, index) in list"
              :key="index"
              :data-index="index">
            <a :href="'/reception/detail?id='+item.id">
              <img :src="item.url" :alt="item.name"/>
              <span class="">{{ item.name }}</span>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      bannerMenuFlag: false,
      menuTimer: '',
      listInfoData: [],
      menus: [],
      banners: [],
      productList: {}
    }
  },
  created() {
    this.request.get("classification/menus").then(res => {
      let cateMenus = res.data;
      for (let i = 0; i < cateMenus.length; i++) {
        const cate = cateMenus[i]
        console.log(cate)
        this.menus.push({
          value: cate.name,
          url: '/reception/classification?id=' + cate.id,
          type: cate.id
        })

        //处理商品
        this.productList[cate.id] = cate.productDTOList
      }
    })
  },
  methods: {
    bannerMenuHide() {
      this.menuTimer = setTimeout(() => {
        this.bannerMenuFlag = false;
      }, 300);
    },
    bannerMenuShow(type) {
      if (type) {
        this.listInfoData = this.productList[type];
      }
      this.bannerMenuFlag = true;
      clearTimeout(this.menuTimer);
    }
  },
  computed: {
    menuListMatch() {
      const matchData = [];
      if (this.listInfoData && this.listInfoData.length) {
        for (let i = 0; i < this.listInfoData.length; i += 6) {
          matchData.push(this.listInfoData.slice(i, i + 6));
        }
      }
      return matchData;
    }
  },
  components: {}
}
</script>

<style lang="less">
.menu-banner {
  position: relative;
  width: 100%;
  height: auto;
  margin: 0 auto;

  .menu-container {
    left: 0;
    top: 0;
    width: 235px;
    height: auto;
    background: linear-gradient(to bottom, #67C23A, #85ce61);
    border-radius: 8px 0 0 8px;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    z-index: 10;
  }
}

.menu-list {
  padding: 20px 0;
  height: 458px;

  .list-item {
    display: flex;
    padding-left: 30px;
    height: 42px;
    transition: all 0.3s ease;

    &:hover {
      background-color: rgba(255, 255, 255, 0.2);
      transform: translateX(5px);
    }

    a {
      position: relative;
      display: inline-block;
      width: 170px;
      height: 42px;
      line-height: 42px;
      color: #fff;
      text-align: left;
      background-color: transparent;
      text-decoration: none;
      font-size: 15px;
      transition: color 0.3s;
    }

    i {
      font-size: 16px;
      color: #fff;
      line-height: 42px;
      transition: transform 0.3s;
    }

    &:hover i {
      transform: translateX(3px);
    }
  }
}

.menu-info {
  position: absolute;
  display: flex;
  flex-flow: row nowrap;
  justify-content: flex-start;
  left: 235px;
  top: 0;
  z-index: 11;
  border: none;
  border-radius: 0 8px 8px 0;
  box-shadow: 5px 5px 20px rgba(0, 0, 0, 0.15);
  background: #ffffff;
  animation: fadeIn 0.3s ease-in-out;

  .menu-info-list {
    width: 248px;
    height: 458px;
    margin: 0;
    padding: 0;
    list-style: none;
    background: #fff;

    a {
      display: flex;
      padding: 18px 20px;
      line-height: 40px;
      color: #333;
      text-decoration: none;
      transition: all 0.3s;

      &:hover {
        background-color: #f5f7fa;
      }

      img {
        width: 40px;
        height: 40px;
        margin-right: 12px;
        vertical-align: middle;
        border-radius: 8px;
        object-fit: cover;
        transition: transform 0.3s;
      }

      span {
        width: 172px;
        line-height: 40px;
        font-size: 14px;
        text-align: start;
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
        transition: color 0.3s;
      }

      &:hover {
        img {
          transform: scale(1.05);
        }
        
        span {
          color: #67C23A;
        }
      }
    }
  }
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateX(-10px);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}
</style>

