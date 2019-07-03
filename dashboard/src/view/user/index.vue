<template>
  <div>
 <Row :gutter="20">
    <Tables :type="'contact'" :columns="columns" ></Tables>
    </Row>
  </div>
</template>

<script>
import Tables from '@/components/tables/normaltable'
export default {
  name: 'userlist',
   data () {
    return {
      columns: [
        { title: 'id', key: 'id', sortable: false,width:"90px" },
        { title: '用户名', key: 'username', sortable: false },
        { title: '昵称', key: 'nickname', editable: false },
        { title: '手机', key: 'phone', editable: false },
        { title: '邮箱', key: 'email', editable: true },
        { title: '注册国家', key: 'country', editable: true },
        { title: '最后登录时间', key: 'updated', editable: true },
        { title: '创建时间', key: 'created' },
        {
          title: '操作',
          key: 'handle',
          options: ['delete'],
          button: [
            (h, params, vm) => {
              return h('Poptip', {
                props: {
                  confirm: true,
                  title: '你确定要删除吗?'
                },
                on: {
                  'on-ok': () => {
                    vm.$emit('on-delete', params)
                    vm.$emit('input', params.tableData.filter((item, index) => index !== params.row.initRowIndex))
                  }
                }
              }, [
                h('Button', '自定义删除')
              ])
            }
          ]
        }
      ],
    }
  },
  components: {
    Tables
  },
  methods: {
  },
  mounted() {
  },
}
</script>

<style>

</style>
