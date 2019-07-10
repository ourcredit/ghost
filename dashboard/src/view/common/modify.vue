<template>
  <div>
    <Modal title="编辑用户" :value="value" @on-ok="save" @on-visible-change="visibleChange">
      <Form ref="adminForm" label-position="top" :rules="adminRule" :model="admin">
        <FormItem label="用户名" prop="uname">
          <Input v-model="admin.uname" :maxlength="32" :minlength="2" />
        </FormItem>
        <FormItem label="角色">
          <Select v-model="roleIds" multiple >
            <Option   v-for="item in models" :value="item.value" :key="item.value">{{ item.name }}</Option>
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
        },
        admin: {},
        models: [{
          name: "a",
          value: 1
        }, {
          name: "b",
          value: 2
        }],
        roleIds: []
      }
    },
    methods: {
      save() {
        this.$refs.adminForm.validate(valid => {
          if (valid) {
            this.$store.dispatch("admin_modify", this.admin);
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
        }
      }
    },

  }

</script>
