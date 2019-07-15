<template>
  <div>
    <Modal title="编辑用户" :value="value" @on-ok="save" @on-visible-change="visibleChange">
      <Form ref="adminForm" label-position="top" :rules="adminRule" :model="admin">
        <FormItem label="用户名" prop="uname">
          <Input v-model="admin.uname"  />
        </FormItem>
        <FormItem v-if="!admin.id" label="密码" prop="pwd">
          <Input type="password" v-model="admin.pwd" />
        </FormItem>
        <FormItem label="角色">
          <Select v-model="admin.roleIds" multiple>
            <Option v-for="item in roles" :value="item.id" :key="item.id">{{ item.displayName }}</Option>
          </Select>
        </FormItem>

      </Form>
      <div slot="footer">
        <Button @click="cancel">关闭</Button>
        <Button @click="save" type="primary">保存</Button>
      </div>
    </Modal>
  </div>
</template>
<script>
  import {
    mapActions,
    mapGetters
  } from 'vuex'
  export default {
    props: {
      value: {
        type: Boolean,
        default () {
          return false;
        }
      },
    },
    data() {
      return {
        adminRule: {
          uname: [{
            required: true,
            message: "用户名必填",
            trigger: "blur"
          }]
        }
      }
    },
    computed: {
      admin() {
        return this.$store.state.admin.admin;
      },
      roles() {
        return this.$store.state.admin.roles;
      }
    },
    methods: {
      save() {
        let _=this;
        this.$refs.adminForm.validate(valid => {
          if (valid) {
            debugger;
             let admin= Object.assign({}, _.admin);
            this.$store.dispatch("admin_updateAdmin",admin);
            this.$refs.adminForm.resetFields();
            this.$emit("save-success");
             this.$emit("input", false);
          }
        })
      },
      showChange(e) {
        console.log(e);
      },
      cancel() {
        this.$refs.adminForm.resetFields();
        this.$emit("input", false);
        this.$emit("close", false);
      },
      visibleChange(value) {
        if (!value) {
          this.$emit("input", value);
          this.$emit("close", false);
        }
      }
    },

  }

</script>
