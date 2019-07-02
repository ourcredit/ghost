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
        { title: 'Name', key: 'name', sortable: true },
        { title: 'Email', key: 'email', editable: true },
        { title: 'Create-Time', key: 'createTime' },
        {
          title: 'Handle',
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
    console.log(this.$store);
  },
}
</script>

<style>

</style>
