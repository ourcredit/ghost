<template>
  <div>
    <Row :gutter="20">
      <div salt="search" class="search-con search-con-top">
        <Form slot="filter" ref="queryForm" :label-width="65" label-position="left" inline>
          <Row :gutter="4">
            <Col span="21">
            <FormItem label="昵称:">
              <Input clearable v-model="filter.nickname" placeholder="搜索关键词" />
            </FormItem>
            <FormItem label="邮箱:">
              <Input clearable v-model="filter.email" placeholder="搜索关键词" />
            </FormItem>
            <FormItem label="电话:">
              <Input clearable v-model="filter.mobile" placeholder="搜索关键词" />
            </FormItem>
            <FormItem label="注册国家:">
              <Input clearable v-model="filter.country" placeholder="搜索关键词" />
            </FormItem>
            <FormItem label="登录时间:">
              <Input clearable v-model="filter.logindate" placeholder="搜索关键词" />
            </FormItem>
            <FormItem label="注册时间:">
              <Input clearable v-model="filter.registerdate" placeholder="搜索关键词" />
            </FormItem>
            </Col>
            <Col span="3">
            <Button @click="searchSome" class="search-btn" type="primary">
              <Icon type="search" />&nbsp;&nbsp;搜索</Button>
            </Col>
          </Row>
        </Form>
      </div>
      <Tables :filter="filter" ref="tablesMain" searchable :type="'contact'" :columns="columns"></Tables>
    </Row>
  </div>
</template>

<script>
  import Tables from '@/components/tables/normaltable'
  export default {
    name: 'userlist',
    data() {
      return {
        filter: {},
        columns: [{
            title: 'id',
            key: 'id',
            sortable: false,
            width: "90px"
          },
          {
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
            title: '手机',
            key: 'phone',
            editable: false
          },
          {
            title: '邮箱',
            key: 'email',
            editable: true
          },
          {
            title: '注册国家',
            key: 'country',
            editable: true
          },
          {
            title: '最后登录时间',
            key: 'updated',
            editable: true
          },
          {
            title: '创建时间',
            key: 'created'
          },
          {
            title: 'Action',
            key: 'action',
            width: 600,
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
                      this.$store.dispatch("contact_user", params.row.id).then(r => {
                        this.$router.push('/user/detail');
                      })
                    }
                  }
                }, '用户详情'),
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
                    this.$router.push({name:"rd_list"});
                    }
                  }
                }, '聊天记录'),
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
                      console.log("2");
                    }
                  }
                }, '群组'),
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
                      console.log("2");
                    }
                  }
                }, '公共频道'),
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
                      console.log("2");
                    }
                  }
                }, '好友请求'),
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
                      console.log("2");
                    }
                  }
                }, 'app使用情况'),
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
      Tables
    },
    methods: {
      //搜索
      searchSome() {
        this.$refs.tablesMain.initTableData();
      }
    },
    mounted() {},
  }

</script>

<style>

</style>
