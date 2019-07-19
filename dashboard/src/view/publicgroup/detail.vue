<style lang="less">
  @import './detail.less';

</style>
<template>
  <div>

    <Row :gutter="20">
      <Card>
        <p slot="title">
          <Icon type="ios-film-outline"></Icon>
          基本信息:
        </p>
        <div class="demo-avatar">
          <table id="tttt">
            <tr>
              <td>群名称</td>
              <td>{{group.name}}</td>
              <td>成立时间</td>
              <td>{{group.created}}</td>
            </tr>
            <tr>
              <td>群人数</td>
              <td>{{group.userCnt}}</td>
              <td>群主昵称</td>
              <td>{{group.createrModel.nickname}}</td>
            </tr>
            <tr>
              <td>用户账号</td>
              <td>{{group.createrModel.phone}}</td>
              <td>手机号码</td>
              <td>{{group.createrModel.phone}}</td>
            </tr>
            <tr>
              <td>电子邮箱</td>
              <td>{{group.createrModel.email}}</td>
              <td>注册时间</td>
              <td>{{group.createrModel.created}}</td>
            </tr>
            <tr>
              <td>群公告</td>
              <td colspan="3">www</td>
            </tr>
          </table>
        </div>
      </Card>
      <Card>
        <p slot="title">
          <Icon type="ios-film-outline"></Icon>
          群成员:
        </p>
        <div class="demo-avatar">
          <tables ref="tables" v-model="list" :columns="columns" />
          <Row>
            <Page @on-change="pageIndex" @on-page-size-change="pageSize"  :total="total"
              :current="currentIndex" :page-size="currentSize" show-total show-sizer show-elevator />
          </Row>
        </div>
      </Card>
    </Row>
  </div>
</template>

<script>
  import Tables from '_c/tables'
  export default {
    name: 'userlist',
    data() {
      return {
        filter: {},
        columns: [{
            title: '用户名',
            key: 'username',
            sortable: false
          },
          {
            title: '昵称',
            key: 'nickname',
            editable: false
          },
          {
            title: '注册时间',
            key: 'email',
            editable: true
          }
        ]
      }
    },
    components: {
      Tables
    },
    computed: {
      group() {
        let group = this.$store.state.group.group;
        if (!group || !group.id) {
          this.$router.push({
            name: 'pm_group'
          });
        }
        return group;
      },
      list() {
        return this.$store.state.group.list;
      },
      total() {
        return this.$store.state.group.totalCount;
      },
      currentIndex() {
        return this.$store.state.group.index;
      },
      currentSize() {
        return this.$store.state.group.size;
      },
    },
    methods: {
      pageIndex(e) {
        this.$store.dispatch(`${this.type}_index`, e);
        this.initTableData();
      },
      pageSize(e) {
        this.$store.dispatch(`${this.type}_size`, e);
        this.initTableData();
      },
      initTableData() {
        this.filter.groupId=this.group.id;
        let params = {
          index: this.currentIndex,
          size: this.currentSize,
          where: this.filter
        };
        console.log(this.type)
        this.$store.dispatch(`group_member_list`, params);
      }
    },
    mounted() {
      let group = this.$store.state.group.group;
      if (!group || !group.id) {
        this.$router.push({
          name: 'pm_group'
        });
      }
      this.initTableData();
    },
  }

</script>

<style>

</style>
