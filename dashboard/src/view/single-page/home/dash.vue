
<template>
  <div>
    <Row :gutter="20">
      <i-col :md="24" :lg="10">
        <Row>
          <Col :md="24" :lg="24">
          <Card>
            <p slot="title">
              <Icon type="ios-film-outline"></Icon>
              新注册用户数: 13
            </p>
            <a href="#" slot="extra" @click.prevent="changeLimit">
              <Icon type="ios-loop-strong"></Icon>
              更多
            </a>
            <ul>
              <li>张三</li>
              <li>a</li>
            </ul>
          </Card>
          </Col>
        </Row>
         <Row>
          <Col :md="24" :lg="24">
          <Card>
            <p slot="title">
              <Icon type="ios-film-outline"></Icon>
              最新聊天记录
            </p>
            <a href="#" slot="extra" @click.prevent="changeLimit">
              <Icon type="ios-loop-strong"></Icon>
              更多
            </a>
            <ul>
              <li>张三</li>
              <li>a</li>
              <li>a</li>
              <li>a</li>
              <li>a</li>
              <li>a</li>
              <li>a</li>
            </ul>
          </Card>
          </Col>
        </Row>  
      </i-col>
      <i-col :md="24" :lg="6">
         <Card>
            <p slot="title">
              <Icon type="ios-film-outline"></Icon>
              登陆时长排行榜(每分钟更新)
            </p>
            <a href="#" slot="extra" @click.prevent="changeLimit">
              <Icon type="ios-loop-strong"></Icon>
              更多
            </a>
            <ul>
              <li>张三</li>
              <li>a</li>
            </ul>
          </Card>
      </i-col>
      <i-col :md="24" :lg="8">
        <Card>
            <p slot="title">
              <Icon type="ios-film-outline"></Icon>
              用户活跃度分布
            </p>
            <chart-pie style="height: 300px;" :value="pieData" text="用户访问来源"></chart-pie>
          </Card>
      </i-col>
    </Row>

     <Row :gutter="20">
      <i-col :md="24" :lg="12">
        <Row>
          <Col :md="24" :lg="24">
          <Card>
            <p slot="title">
              <Icon type="ios-film-outline"></Icon>
              最新成立群组 ：5
            </p>
            <a href="#" slot="extra" @click.prevent="changeLimit">
              <Icon type="ios-loop-strong"></Icon>
              更多
            </a>
            <ul>
              <li>张三</li>
              <li>a</li>
            </ul>
          </Card>
          </Col>
        </Row>
       
      </i-col>
      <i-col :md="24" :lg="12">
         <Card>
            <p slot="title">
              <Icon type="ios-film-outline"></Icon>
              最新成立公共频道： 4
            </p>
            <a href="#" slot="extra" @click.prevent="changeLimit">
              <Icon type="ios-loop-strong"></Icon>
              更多
            </a>
            <ul>
              <li>张三</li>
              <li>a</li>
            </ul>
          </Card>
      </i-col>
    </Row>
  </div>
</template>

<script>
  import InforCard from '_c/info-card'
  import CountTo from '_c/count-to'
  import {
    ChartPie,
    ChartBar
  } from '_c/charts'
  import Example from './example.vue'
  export default {
    name: 'home',
    components: {
      InforCard,
      CountTo,
      ChartPie,
      ChartBar,
      Example
    },
    data() {
      return {
        inforCardData: [{
            title: '新增用户',
            icon: 'md-person-add',
            count: 803,
            color: '#2d8cf0'
          },
          {
            title: '累计点击',
            icon: 'md-locate',
            count: 232,
            color: '#19be6b'
          },
          {
            title: '新增问答',
            icon: 'md-help-circle',
            count: 142,
            color: '#ff9900'
          },
          {
            title: '分享统计',
            icon: 'md-share',
            count: 657,
            color: '#ed3f14'
          },
          {
            title: '新增互动',
            icon: 'md-chatbubbles',
            count: 12,
            color: '#E46CBB'
          },
          {
            title: '新增页面',
            icon: 'md-map',
            count: 14,
            color: '#9A66E4'
          }
        ],
        pieData: [{
            value: 335,
            name: '直接访问'
          },
          {
            value: 310,
            name: '邮件营销'
          },
          {
            value: 234,
            name: '联盟广告'
          },
          {
            value: 135,
            name: '视频广告'
          },
          {
            value: 1548,
            name: '搜索引擎'
          }
        ],
        barData: {
          Mon: 13253,
          Tue: 34235,
          Wed: 26321,
          Thu: 12340,
          Fri: 24643,
          Sat: 1322,
          Sun: 1324
        }
      }
    },
    mounted() {
      //
    }
  }

</script>

<style lang="less">
  .count-style {
    font-size: 50px;
  }

</style>
