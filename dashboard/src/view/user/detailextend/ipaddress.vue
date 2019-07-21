
<template>
  <div>
    <Row :gutter="20">
      <Card>
        <p slot="title">
          <Icon type="ios-film-outline"></Icon>
          通讯录:
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
    name: 'contactuser',
      props: {
      type: {
        type: String,
        default () {
          return "contact"
        }
      }
    },
    data() {
      return {
        filter: {type:2 },
        columns: [{
            title: '用户名',
            key: 'a',
            sortable: false
          },
          {
            title: '昵称',
            key: 'b',
            editable: false
          },
          {
            title: 'ip',
            key: 'c',
            sortable: false
          },{
            title: '登陆时间',
            key: 'time',
            sortable: false
          },
        ]
      }
    },
    components: {
      Tables
    },
    computed: {
      list() {
        return this.$store.state.contact.extendList;
      },
      total() {
        return this.$store.state.contact.extendCount;
      },
      currentIndex() {
        return this.$store.state.contact.index;
      },
      currentSize() {
        return this.$store.state.contact.size;
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
        let params = {
          index: this.currentIndex,
          size: this.currentSize,
          where: this.filter
        };
        console.log(this.type)
        this.$store.dispatch(`contact_extend`, params);
      }
    },
    mounted() {
      this.initTableData();
    },
  }

</script>

<style>

</style>
