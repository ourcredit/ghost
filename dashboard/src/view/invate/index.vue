<template>
  <div>
    <Row :gutter="20">
      <div salt="search" class="search-con search-con-top">
        <Form slot="filter" ref="queryForm" :label-width="65" label-position="left" inline>
          <Row :gutter="4">
            <Col span="21">
            <FormItem label="邀请人id:">
              <Input clearable v-model="filter.nickname" placeholder="搜索关键词"/>
            </FormItem>
            <FormItem label="邀请人昵称:">
              <Input clearable v-model="filter.email" placeholder="搜索关键词"/>
            </FormItem>
            <FormItem label="邀请人手机:">
              <Input clearable v-model="filter.mobile" placeholder="搜索关键词"/>
            </FormItem>
               <FormItem label="结果:">
              <Input clearable v-model="filter.mobile" placeholder="搜索关键词"/>
            </FormItem>
             <FormItem label="被邀请人id:">
              <Input clearable v-model="filter.nickname" placeholder="搜索关键词"/>
            </FormItem>
            <FormItem label="被邀请人昵称:">
              <Input clearable v-model="filter.email" placeholder="搜索关键词"/>
            </FormItem>
            <FormItem label="被邀请人手机:">
              <Input clearable v-model="filter.mobile" placeholder="搜索关键词"/>
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
            title: '邀请人id',
            key: 'username',
            sortable: false
          },
          {
            title: '邀请人昵称',
            key: 'nickname',
            editable: false
          },
          {
            title: '邀请人手机号',
            key: 'phone',
            editable: false
          },
          {
            title: '被邀请人id',
            key: 'email',
            editable: true
          },
          {
            title: '被邀请人昵称',
            key: 'country',
            editable: true
          },
          {
            title: '被邀请人手机号',
            key: 'updated',
            editable: true
          },
             {
            title: '结果',
            key: 'updated',
            editable: true
          },
          {
            title: '创建时间',
            key: 'created'
          }]
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
