<template>
  <div>
    <Row :gutter="20">
      <div salt="search" class="search-con search-con-top">
        <Form slot="filter" ref="queryForm" :label-width="65" label-position="left" inline>
          <Row :gutter="4">
            <Col span="21">
            <FormItem label="群组名称:">
              <Input clearable v-model="filter.nickname" placeholder="搜索关键词" />
            </FormItem>
            <FormItem label="所有者:">
              <Input clearable v-model="filter.email" placeholder="搜索关键词" />
            </FormItem>
            </Col>
            <Col span="3">
            <Button @click="searchSome" class="search-btn" type="primary">
              <Icon type="search" />&nbsp;&nbsp;搜索</Button>
            </Col>
          </Row>
        </Form>
      </div>
      <Tables :filter="filter" ref="tablesMain" searchable :type="'group'" :columns="columns"></Tables>
    </Row>
  </div>
</template>
<script>
  import Tables from '@/components/tables/normaltable'
  export default {
    name: 'group',
    data() {
      return {
        filter: {},
        columns: [{
            title: '群记录',
            key: 'username',
            sortable: false
          },
          {
            title: '所有者',
            key: 'nickname',
            editable: false
          },
          {
            title: '最后发言时间',
            key: 'phone',
            editable: false
          },
          {
            title: '创建时间',
            key: 'email',
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
                      console.log("1");
                    }
                  }
                }, '详情'),
                h('Button', {
                  props: {
                    type: 'error',
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
                }, '群记录'),
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
