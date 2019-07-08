<style lang="less">
  @import './dash.less';

</style>
<template>
  <div>
    <Row :gutter="20">
      <i-col :md="24" :lg="10">
        <Row>
          <Col :md="24" :lg="24">
          <Card>
            <p slot="title">
              <Icon type="ios-film-outline"></Icon>
              新注册用户数: {{newRegistUserCount}}
            </p>
            <a href="#" slot="extra" @click.prevent="changeLimit">
              <Icon type="ios-loop-strong"></Icon>
              更多
            </a>
            <div class="demo-avatar">
              <Avatar icon="ios-person" size="large" />
              <Avatar icon="ios-person" size="large" />
              <Avatar icon="ios-person" size="large" />
              <Avatar icon="ios-person" size="large" />
              <Avatar icon="ios-person" size="large" />
              <Avatar icon="ios-person" size="large" />
            </div>

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
            <Tables :pageable="false" :filter="{}" ref="tablesMain" :type="'contact'" :columns="recordColumns"></Tables>
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
          <Tables :pageable="false" :filter="{}" ref="tablesMain" :type="'contact'" :columns="loginTimeColumns">
          </Tables>
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
              最新成立群组 ：{{newCreateGroup}}
            </p>
            <a href="#" slot="extra" @click.prevent="changeLimit">
              <Icon type="ios-loop-strong"></Icon>
              更多
            </a>
            <Tables :pageable="false" :filter="{}" ref="tablesMain" :type="'contact'" :columns="loginTimeColumns">
            </Tables>
          </Card>
          </Col>
        </Row>

      </i-col>
      <i-col :md="24" :lg="12">
        <Card>
          <p slot="title">
            <Icon type="ios-film-outline"></Icon>
            最新成立公共频道： {{newCreatePublicGroup}}
          </p>
          <a href="#" slot="extra" @click.prevent="changeLimit">
            <Icon type="ios-loop-strong"></Icon>
            更多
          </a>
          <Tables :pageable="false" :filter="{}" ref="tablesMain" :type="'contact'" :columns="loginTimeColumns">
          </Tables>
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
  import {
    mapMutations,
    mapActions,
    mapGetters
  } from 'vuex'
  import Tables from '@/components/tables/normaltable'
  export default {
    name: 'home',
    components: {
      InforCard,
      CountTo,
      ChartPie,
      ChartBar,
      Tables
    },
    data() {
      return {
        recordColumns: [{
            title: '用户id',
            key: 'username',
            sortable: false
          },
          {
            title: '昵称',
            key: 'nickname',
            editable: false
          },
          {
            title: '消息内容',
            key: 'phone',
            editable: false
          },
          {
            title: '时间',
            key: 'created',
            editable: true
          }
        ],
        loginTimeColumns: [{
            title: '时长排名',
            key: 'username',
            sortable: false
          },
          {
            title: '头像',
            key: 'nickname',
            editable: false
          },
          {
            title: '昵称',
            key: 'phone',
            editable: false
          },
          {
            title: '在线时长',
            key: 'created',
            editable: true
          }
        ],
        groupColumns: [{
            title: '群组名称',
            key: 'username',
            sortable: false
          },
          {
            title: '创建者',
            key: 'nickname',
            editable: false
          },
          {
            title: '创建时间',
            key: 'created',
            editable: true
          }
        ],
        publicColumns: [{
            title: '公共群组名称',
            key: 'username',
            sortable: false
          },
          {
            title: '创建者',
            key: 'nickname',
            editable: false
          },
          {
            title: '创建时间',
            key: 'created',
            editable: true
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
        ]
      }
    },
    computed: {
      ...mapGetters([
        'newRegistUserCount',
        'newCreateGroup',
        'newCreatePublicGroup'
      ])
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
