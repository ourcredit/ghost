<template>
  <div>
    <div salt="search" class="search-con search-con-top">
      <Form slot="filter" ref="queryForm" :label-width="65" label-position="left" inline>
        <Row :gutter="4">
          <Col span="21">
          <FormItem label="用户名:">
            <Input clearable v-model="filter.uname" placeholder="搜索关键词" />
          </FormItem>
          </Col>
          <Col span="3">
          <Button @click="searchSome" class="search-btn" type="primary">
            <Icon type="search" />&nbsp;&nbsp;搜索</Button>
          <Button @click="create" class="search-btn" type="primary">
            <Icon type="search" />&nbsp;&nbsp;创建</Button>
          </Col>
        </Row>
      </Form>
    </div>
    <AdminTable :filter="filter" ref="tablesAdmin" searchable :type="'admin'" :columns="Ac"></AdminTable>
    <modify :value="userModify" @close="close" @save-success="searchSome"></modify>
  </div>
</template>

<script>
  import Tables from '@/components/tables/normaltable'
  import modify from './modifyadmin.vue'
  export default {
    name: 'admin',
    data() {
      return {
        filter: {},
        userModify: false,
        Ac: [{
            title: '用户名',
            key: 'uname',
            sortable: false
          },
          {
            title: '创建人',
            key: 'createrUser',
            sortable: false
          },
          {
            title: '创建时间',
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
                h('Button', {
                  props: {
                    type: 'primary',
                    size: 'small'
                  },
                  style: {
                    marginRight: '5px'
                  },
                  on: {
                    click: () => {
                      this.getUser(params.row.id);
                    }
                  }
                }, '编辑'),
                h('Button', {
                  props: {
                    type: 'warning',
                    size: 'small'
                  },
                  style: {
                    marginRight: '5px'
                  },
                  on: {
                    click: () => {
                      console.log("2");
                    }
                  }
                }, '修改密码'),
                h('Button', {
                  props: {
                    type: 'error',
                    size: 'small'
                  },

                  on: {
                    click: () => {
                      console.log("2");
                    }
                  }
                }, '删除')
              ]);
            }
          }
        ],
      }
    },
    components: {
      AdminTable: Tables,
      modify
    },
    methods: {
      //搜索
      searchSome() {
        this.userModify = false;
        this.$refs.tablesAdmin.initTableData();
      },
      close() {
        this.userModify = false;
      },
      create() {
        this.getUser(0);
      },
      getUser(key) {
        this.$store.dispatch("admin_user", key);
        this.userModify = true;
      }
    },
    mounted() {
        this.searchSome();
    },
  }

</script>

<style>

</style>
