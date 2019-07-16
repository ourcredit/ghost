<template>
  <div>
    <Modal title="修改密码" :value="value" @on-ok="save" @on-visible-change="visibleChange">
      <Form ref="adminForm" label-position="top" :rules="adminRule" :model="pwdModel">
        <FormItem label="旧密码" prop="old">
          <Input type="password" v-model="pwdModel.old" />
        </FormItem>
        <FormItem label="新密码" prop="ne">
          <Input type="password" v-model="pwdModel.ne" />
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
        pwdModel: {
          old: "",
          ne: ""
        },
        adminRule: {
          old: [{
            required: true,
            message: "原密码必填",
            trigger: "blur"
          }],
          ne: [{
            required: true,
            message: "新密码必填",
            trigger: "blur"
          }]
        }
      }
    },
    computed: {
      admin() {
        return this.$store.state.admin.admin;
      },
    },
    methods: {
      save() {
        let _ = this;
        this.$refs.adminForm.validate(valid => {
          if (valid) {
            let model = {
              id: this.admin.id,
              old: this.pwdModel.old,
              ne: this.pwdModel.ne
            };
            console.log(this.admin);
            this.$store.dispatch("admin_password", model).then(r => {
              this.$refs.adminForm.resetFields();
              this.$emit("save-success");
              this.$emit("input", false);
            }).catch(e => {
              this.$refs.adminForm.resetFields();
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
