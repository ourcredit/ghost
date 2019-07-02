<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
import { setSomeKey,getSomeKey } from '@/libs/util'
export default {
  name: 'App',
  mounted() {
    setSomeKey("appId","88888");
  },
}
</script>

<style lang="less">
.size{
  width: 100%;
  height: 100%;
}
html,body{
  .size;
  overflow: hidden;
  margin: 0;
  padding: 0;
}
#app {
  .size;
}
</style>
