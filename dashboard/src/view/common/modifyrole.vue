<template>
  <div>
    <Modal title="编辑用户" :value="value" @on-ok="save" @on-visible-change="visibleChange">
      <Form ref="roleForm" label-position="top" :rules="roleRule" :model="role">
        <FormItem label="角色名" prop="roleName">
          <Input v-model="role.roleName" />
        </FormItem>
        <FormItem label="显示名" prop="pwd">
          <Input v-model="role.displayName" />
        </FormItem>
        <FormItem label="权限">
          <CheckboxGroup v-model="role.hasPermissions">
            <Checkbox v-for="item in allPermissions" :key="item.permission" :label="item.permission">
              <span>{{item.shouName}}</span>
            </Checkbox>
          </CheckboxGroup>
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
        roleRule: {
          roleName: [{
            required: true,
            message: "用户名必填",
            trigger: "blur"
          }]
        }
      }
    },

    computed: {
      role() {
        return this.$store.state.role.role;
      },
      allPermissions() {
        return this.$store.state.role.allPermissions;
      },
      hasPermissions() {
        return this.$store.state.role.hasPermissions;
      }
    },
    methods: {
      save() {
        let _ = this;
        this.$refs.roleForm.validate(valid => {
          if (valid) {
            console.log(_.role);
            let role = Object.assign({}, _.role);
            role.permissionIds = role.hasPermissions;
           delete role.hasPermissions;
           delete role.allPermissions;
            this.$refs.roleForm.resetFields();
            this.$store.dispatch("role_updateRole", role).then(r => {
              this.$emit("save-success");
              this.$emit("input", false);
            });
          }
        })
      },
      showChange(e) {
        console.log(e);
      },
      cancel() {
        this.$refs.roleForm.resetFields();
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
