<style lang="less">
  @import './detail.less';
</style>
<template>
  <div>
    <Row :gutter="20">
      <Tabs @on-click="init" value="a">
        <TabPane label="概况信息" name="a">
          <Card>
            <p slot="title">
              <Icon type="ios-film-outline"></Icon>
              基本信息
            </p>
            <table id="tttt">
              <tr>
                <td>用户账号</td>
                <td>{{user.username}}</td>
                <td>昵称</td>
                <td>{{user.nicnname}}</td>
              </tr>
              <tr>
                <td>性别</td>
                <td>{{user.sex==2?'女':(user.sex==1?'男':'未知')}}</td>
                <td>出生日期</td>
                <td>{{user.created}}</td>
              </tr>
              <tr>
                <td>登陆手机号</td>
                <td>{{user.phone}}</td>
                <td>手机号</td>
                <td>{{user.phone}}</td>
              </tr>
              <tr>
                <td>电子邮箱</td>
                <td>{{user.email}}</td>
                <td>所在地区</td>
                <td>{{user.country +'  '+user.city}}</td>
              </tr>
              <tr>
                <td>常活跃地</td>
                <td>{{user.country +'  '+user.city}}</td>
                <td>登陆手机IMEI</td>
                <td>d</td>
              </tr>
              <tr>
                <td>最近上线时间</td>
                <td>{{user.updated }}</td>
                <td>注册时间</td>
                <td>{{user.created}}</td>
              </tr>
              <tr>
                <td>最近下线时间</td>
                <td>cb</td>
                <td>上线IP</td>
                 <td>{{user.ipAddress}}</td>
              </tr>
              <tr>
                <td>下线IP</td>
                <td>cb</td>
                <td>活跃国家</td>
                <td>{{user.country }}</td>
              </tr>
              <tr>
                <td>备注</td>
                 <td>{{user.data_sign }}</td>
                <td>app版本</td>
                  <td>{{user.appVersion }}</td>
              </tr>
              <tr>
                <td cospan="1">个性签名</td>
                <td cospan="3">{{user.signInfo }}</td>
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
            <table id="ttttt">
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
         <ContactUser ref="c" type="contact" />
        </TabPane>
        <TabPane label="用户IP记录" name="d">
        <IpAddress ref="d" />
        </TabPane>
        <TabPane label="账号分布区域" name="e">
        </TabPane>
        <TabPane label="生活轨迹" name="f">标签三的内容</TabPane>
        <TabPane label="短信记录" name="g">
        <Message ref="g" />
        </TabPane>
        <TabPane label="通话记录" name="h">
        <Telphone ref="h"/>
        </TabPane>
        <TabPane label="应用列表" name="i">
        <Appinfo ref="i"/>
        </TabPane>
        <TabPane label="文件列表" name="j">标签三的内容</TabPane>
      </Tabs>
    </Row>
  </div>
</template>

<script>
  import Tables from '@/components/tables/normaltable'
  import ContactUser from './detailextend/contact'
  import IpAddress from './detailextend/ipaddress'
  import Message from './detailextend/message'
  import Telphone from './detailextend/telphone'
  import Appinfo from './detailextend/appinfo'
  export default {
    name: 'contactuser',
    data() {
      return {}
    },
    components: {
      Tables,
      ContactUser,
      IpAddress,
      Message,
      Telphone,
      Appinfo
    },
    computed: {
      user() {
        let t = this.$store.state.contact.user;
        return t;
      }
    },
    methods: {
      init(name){
        let ref=this.$refs[name];
        console.log("----------------------");
        console.log(ref);
        if(ref){
          ref.initTableData();
        }
      }
    },
    mounted() {
      if (!this.user || !this.user.id) {
        this.$router.push("/user");
      }
      console.log(this.user);
    },
  }

</script>

<style>

</style>
