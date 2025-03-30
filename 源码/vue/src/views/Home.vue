<template>
  <div>
    <el-row :gutter="20" style="margin-bottom: 40px">
      <el-col :span="8">
        <el-card class="data-card data-card-blue" shadow="hover">
          <div class="data-card-header">
            <i class="el-icon-user-solid data-card-icon"></i>
            <span class="data-card-title">用户总数</span>
          </div>
          <div class="data-card-value">
            {{ info.userCount }}
          </div>
          <div class="data-card-footer">
            <span>较上月 <i class="el-icon-top" style="color: #67C23A;"></i> 5.2%</span>
          </div>
        </el-card>
      </el-col>

      <el-col :span="8">
        <el-card class="data-card data-card-red" shadow="hover">
          <div class="data-card-header">
            <i class="el-icon-money data-card-icon"></i>
            <span class="data-card-title">销售总量</span>
          </div>
          <div class="data-card-value">
            ￥{{ info.sale }}
          </div>
          <div class="data-card-footer">
            <span>较上月 <i class="el-icon-top" style="color: #67C23A;"></i> 3.8%</span>
          </div>
        </el-card>
      </el-col>

      <el-col :span="8">
        <el-card class="data-card data-card-green" shadow="hover">
          <div class="data-card-header">
            <i class="el-icon-shopping-cart-full data-card-icon"></i>
            <span class="data-card-title">今日下单数量</span>
          </div>
          <div class="data-card-value">
            {{ info.saleCount }}
          </div>
          <div class="data-card-footer">
            <span>较昨日 <i class="el-icon-top" style="color: #67C23A;"></i> 7.1%</span>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-row>
      <el-col :span="24">
        <el-card class="chart-card" shadow="hover">
          <div id="main" style="width: 100%; height: 450px"></div>
        </el-card>
      </el-col>
    </el-row>

  </div>
</template>

<script>
import * as echarts from 'echarts';

export default {
  name: "Home",
  data() {
    return {
      info: {},
    }
  },
  methods: {
    //封装请求数据的方法
    load() {
      this.request.get("/user/info").then(res => {
        this.info = res.data
      })
    },
  },
  created() {
    this.load()
  },
  mounted() { //页面元素渲染好才触发
    var chartDom = document.getElementById('main');
    var myChart = echarts.init(chartDom);
    var option;
    option = {
      title: {
        text: "本月各县商品销售额",
        left: 'center',
        textStyle: {
          fontSize: 18,
          fontWeight: 'bold'
        }
      },
      tooltip: {
        trigger: 'axis',
        axisPointer: {
          type: 'shadow'
        },
        backgroundColor: 'rgba(255, 255, 255, 0.9)',
        borderColor: '#eee',
        borderWidth: 1,
        textStyle: {
          color: '#333'
        },
        formatter: function(params) {
          let result = params[0].name + '<br/>';
          params.forEach(item => {
            result += '<div style="display: flex; align-items: center;">'
              + '<span style="display:inline-block;margin-right:5px;width:10px;height:10px;border-radius:50%;background-color:' + item.color + ';"></span>'
              + item.seriesName + ': ' + item.value + '元<br/>'
              + '</div>';
          });
          return result;
        }
      },
      grid: {
        left: '3%',
        right: '3%',
        bottom: '3%',
        containLabel: true
      },
      legend: {
        orient: 'horizontal',
        top: 'bottom',
        icon: 'circle',
        itemWidth: 10,
        itemHeight: 10,
        textStyle: {
          fontSize: 12
        }
      },
      xAxis: {
        type: 'category',
        data: [],
        axisLine: {
          lineStyle: {
            color: '#ddd'
          }
        },
        axisLabel: {
          color: '#666',
          rotate: 30
        },
        splitLine: {
          show: false
        }
      },
      yAxis: {
        type: 'value',
        axisLine: {
          show: false
        },
        axisLabel: {
          color: '#666'
        },
        splitLine: {
          lineStyle: {
            type: 'dashed',
            color: '#eee'
          }
        }
      },
      series: []
    };
    this.request.get("/echarts/members").then(res => {
      console.log(res)
      //折线图
      option.xAxis.data = res.data.data.xaxis;
      option.series = res.data.data.series;
      
      // 为每个系列添加样式
      option.series.forEach((item, index) => {
        // 为柱状图添加渐变色
        if (item.type === 'bar') {
          item.itemStyle = {
            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
              { offset: 0, color: ['#1890FF', '#36CBCB', '#F6C54D', '#F78B77'][index % 4] },
              { offset: 1, color: ['#246FDB', '#1FBCDE', '#D8A537', '#D56355'][index % 4] }
            ])
          };
          item.barWidth = '50%';
          item.barGap = '10%';
        }
        
        // 为折线图添加样式
        if (item.type === 'line') {
          item.smooth = true;
          item.symbol = 'circle';
          item.symbolSize = 8;
          item.lineStyle = {
            width: 3
          };
          item.emphasis = {
            itemStyle: {
              shadowBlur: 10,
              shadowColor: 'rgba(0, 0, 0, 0.2)'
            }
          };
        }
      });
      
      //在数据准备完毕在set
      myChart.setOption(option);
    });

    // 响应式调整
    window.addEventListener('resize', function() {
      myChart.resize();
    });
  }
}
</script>

<style scoped>
.data-card {
  position: relative;
  height: 180px;
  display: flex;
  flex-direction: column;
  padding: 20px;
  overflow: hidden;
}

.data-card::before {
  content: '';
  position: absolute;
  top: -50px;
  right: -50px;
  width: 120px;
  height: 120px;
  border-radius: 50%;
  opacity: 0.2;
  z-index: 1;
}

.data-card-blue {
  background: linear-gradient(135deg, #1890ff 10%, #3dadff 100%);
  color: white;
}

.data-card-blue::before {
  background-color: rgba(255, 255, 255, 0.3);
}

.data-card-red {
  background: linear-gradient(135deg, #ff6b6b 10%, #ff9f9f 100%);
  color: white;
}

.data-card-red::before {
  background-color: rgba(255, 255, 255, 0.3);
}

.data-card-green {
  background: linear-gradient(135deg, #67C23A 10%, #95d475 100%);
  color: white;
}

.data-card-green::before {
  background-color: rgba(255, 255, 255, 0.3);
}

.data-card-header {
  display: flex;
  align-items: center;
  z-index: 2;
}

.data-card-icon {
  font-size: 24px;
  margin-right: 10px;
}

.data-card-title {
  font-size: 16px;
  font-weight: 500;
}

.data-card-value {
  font-size: 36px;
  font-weight: bold;
  margin: 20px 0 10px 0;
  z-index: 2;
}

.data-card-footer {
  margin-top: auto;
  font-size: 14px;
  opacity: 0.8;
  z-index: 2;
}

.chart-card {
  margin-top: 20px;
  padding: 20px;
}
</style>