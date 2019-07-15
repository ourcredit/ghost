<template>
  <div>
   <div salt="search" class="search-con search-con-top">
      <Form slot="filter" ref="queryForm" :label-width="65" label-position="left" inline>
        <Row :gutter="4">
          <Col span="21">
          <FormItem label="角色名:">
            <Input clearable v-model="filter.displayName" placeholder="搜索关键词" />
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
   <RoleTable :filter="filter" ref="tablesRole"  :type="'role'" :columns="Rc"></RoleTable>
    <modify :value="userModify" @close="close" @save-success="searchSome"></modify>
  </div>
</template>

<script>
  import Tables from '@/components/tables/normaltable'
  import modify from './modifyrole.vue'
  export default {
    name: 'role',
    data() {
      return {
        filter: {},
        userModify: false,
        Rc: [{
            title: '角色名称',
            key: 'displayName',
          },
          {
            title: '权限',
            key: 'permissions',
          },
          {
            title: '创建时间',
            key: 'created',
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
                      this.getRole(params.row.id);
                    }
                  }
                }, '编辑'),
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
     RoleTable: Tables,
      modify
    },
    methods: {
      //搜索
      searchSome() {
        this.$refs.tablesRole.initTableData();
        this.userModify = false;
      },
      close() {
        this.userModify = false;
      },
      create() {
        this.getRole(0);
      },
      getRole(key) {
        this.$store.dispatch("role_role", key);
        this.userModify = true;
      }
    },
    mounted() {},
  }

</script>

<style>

</style>
