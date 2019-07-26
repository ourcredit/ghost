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
      <Tables :filter="filter" ref="tablesMain" searchable :type="'friend'" :columns="columns"></Tables>
    </Row>
  </div>
</template>

<script>
  import Tables from '@/components/tables/normaltable'
  export default {
    name: 'recordlist',
    data() {
      return {
        filter: {},
        columns: [{
            title: '消息记录',
            key: 'username',
            sortable: false
          },
          {
            title: '最后消息时间',
            key: 'nickname',
            editable: false
          },
          {
            title: '操作',
            key: 'action',
            width: 400,
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
                }, '好友信息'),
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
                }, '聊天记录')
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
