<template>
  <div>
    <Row :gutter="20">
      <Tabs value="a">
        <TabPane label="概况信息" name="a">
          <Card>
            <p slot="title">
              <Icon type="ios-film-outline"></Icon>
              基本信息
            </p>
            <table border="1" style="width:100%">
              <tr>
                <td>用户账号</td>
                <td>cb</td>
                <td>昵称</td>
                <td>d</td>
              </tr>
              <tr>
                <td>性别</td>
                <td>cb</td>
                <td>出生日期</td>
                <td>d</td>
              </tr>
              <tr>
                <td>登陆手机号</td>
                <td>cb</td>
                <td>手机号</td>
                <td>d</td>
              </tr>
              <tr>
                <td>电子邮箱</td>
                <td>cb</td>
                <td>所在地区</td>
                <td>d</td>
              </tr>
              <tr>
                <td>常活跃地</td>
                <td>cb</td>
                <td>登陆手机IMEI</td>
                <td>d</td>
              </tr>
              <tr>
                <td>最近上线时间</td>
                <td>cb</td>
                <td>注册时间</td>
                <td>d</td>
              </tr>
              <tr>
                <td>最近下线时间</td>
                <td>cb</td>
                <td>上线IP</td>
                <td>d</td>
              </tr>
              <tr>
                <td>下线IP</td>
                <td>cb</td>
                <td>活跃国家</td>
                <td>d</td>
              </tr>
              <tr>
                <td>备注</td>
                <td>cb</td>
                <td>app版本</td>
                <td>d</td>
              </tr>
              <tr>
                <td cospan="1">个性签名</td>
                <td cospan="3">cb</td>
              </tr>
            </table>

          </Card>
        </TabPane>
        <TabPane label="手机详情" name="b">
          <Card>
            <p slot="title">
              <Icon type="ios-film-outline"></Icon>
              手机详情
            </p>
            <table border="1" style="width:100%">
              <tr>
                <td>手机型号</td>
                <td>cb</td>
                <td>手机版本</td>
                <td>d</td>
              </tr>
              <tr>
                <td>IEMI</td>
                <td>cb</td>
              </tr>
            </table>

          </Card>
        </TabPane>
        <TabPane label="联系人" name="c">
          <Card>
            <p slot="title">
              <Icon type="ios-film-outline"></Icon>
              联系人
            </p>
            <Tables :filter="{}" ref="tablesMain" :type="'contact'" :columns="[{title: '姓名', key: 'id', sortable: false},{ title: '手机',key: 'username', sortable: false}]"></Tables>
          </Card>
        </TabPane>
        <TabPane label="用户IP记录" name="d">
          <Card>
            <p slot="title">
              <Icon type="ios-film-outline"></Icon>
              用户ip详情
            </p>
            <Tables :filter="{}" ref="tablesMain" :type="'contact'" :columns="[{title: '姓名', key: 'id', sortable: false},{ title: '手机',key: 'username', sortable: false}]"></Tables>
          </Card></TabPane>
        <TabPane label="账号分布区域" name="e">标签三的内容</TabPane>
        <TabPane label="生活轨迹" name="f">标签三的内容</TabPane>
        <TabPane label="短信记录" name="g">标签三的内容</TabPane>
        <TabPane label="通话记录" name="h">标签三的内容</TabPane>
        <TabPane label="应用列表" name="i">标签三的内容</TabPane>
        <TabPane label="文件列表" name="j">标签三的内容</TabPane>
      </Tabs>
    </Row>
  </div>
</template>

<script>
  import Tables from '@/components/tables/normaltable'
  export default {
    name: 'userlist',
    data() {
      return {
      }
    },
    components: {
      Tables
    },
    methods: {},
    mounted() {},
  }

</script>

<style>

</style>
