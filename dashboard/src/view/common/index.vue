<template>
  <div>
    <Tabs value="a">
      <TabPane label="账户管理" name="a">
        <Admin/>
      </TabPane>
      <TabPane label="角色权限管理" name="b">
       <Role />
      </TabPane>
      <TabPane label="日志管理" name="c">
       <Log/>
      </TabPane>
    </Tabs>
  </div>
</template>

<script>
  import Tables from '@/components/tables/normaltable'
  import Role from './role'
  import Admin from './admin'
  import Log from './log'
  export default {
    name: 'userlist',
    data() {
      return {
      }
    },
    components: {
     Admin,
     Role,
     Log
    },
    methods: {
    },
    mounted() {},
  }

</script>

<style>

</style>
