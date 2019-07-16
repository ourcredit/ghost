<template>
  <div>
    <div salt="search" class="search-con search-con-top">
      <Form slot="filter" ref="queryForm" :label-width="65" label-position="left" inline>
        <Row :gutter="4">
          <Col span="21">
          <FormItem label="关键词:">
            <Input clearable v-model="filter.uname" placeholder="搜索关键词" />
          </FormItem>
          </Col>
          <Col span="3">
          <Button @click="searchSome" class="search-btn" type="primary">
            <Icon type="search" />&nbsp;&nbsp;搜索</Button>
          </Col>
        </Row>
      </Form>
    </div>
    <Tables :filter="filter" ref="tablesAdmin" searchable :type="'admin'" :columns="Ac"></Tables>
  </div>
</template>

<script>
  import Tables from '@/components/tables/normaltable'
  import modify from './modifyadmin.vue'
  import pwd from './pwd.vue'
  export default {
    name: 'log',
    data() {
      return {
        filter: {},
        Ac: [{
            title: '模块',
            key: 'uname',
            sortable: false
          },
          {
            title: '方法',
            key: 'createrUser',
            sortable: false
          },
          {
            title: '请求地址',
            key: 'createrUser',
            sortable: false
          },
            {
            title: '接口描述',
            key: 'createrUser',
            sortable: false
          },
          {
            title: '请求时间',
            key: 'created',
            editable: true
          },
          {
            title: '操作',
            key: 'action',
            width: 300,
            align: 'center',
            render: (h, params) => {
              return h('div', [
                h('Poptip', {
                  props: {
                    confirm: true,
                    title: '你确定要删除吗?',
                    type: 'error',
                    size: 'small'
                  },
                  on: {
                    'on-ok': () => {
                      console.log(1);
                      this.handleDelete(params);
                    }
                  }
                }, [
                  h('Button', {
                    props: {
                      type: 'error',
                      size: 'small'
                    }
                  }, '删除')
                ])
              ])

            }
          }
        ],
      }
    },
    components: {
       Tables
    },
    methods: {
      //搜索
      searchSome() {
        this.userModify = false;
        this.$refs.tablesAdmin.initTableData();
      },
      close() {
        this.userModify = false;
        this.pwdModify=false;
      },
      handleDelete(params) {
        console.log(params);
         this.$store.dispatch("admin_deladmin", params.row.id).then(r=>{
           this.searchSome();
         });
      },
      create() {
        this.getUser(0);
      },
      getUser(key) {
        this.$store.dispatch("admin_user", key);
        this.userModify = true;
      }
    },
    mounted() {},
  }

</script>

<style>

</style>
