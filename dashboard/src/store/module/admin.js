import {
  delrole,
  adminList,
  roleList,
  updateAdmin,
  updateRole,
  deladmin
} from '@/api/admin'
export default {
  state: {
    list: [],
    roleList: [],
    admin: {},
    role: {},
    index: 1,
    size: 10,
    totalCount: 0
  },
  mutations: {
    setList(state, list) {
      state.list = list
    },
    setRoleList(state, roleList) {
      state.roleList = roleList
    },
    setAdmin(state, admin) {
      state.admin = admin;
    },
    setRole(state, role) {
      state.role = role;
    },
    setIndex(state, index) {
      state.index = index
    },
    setSize(state, size) {
      state.size = size
    },
    setTotalCount(state, totalCount) {
      state.totalCount = totalCount
    },
  },
  getters: {
    adminList: state => state.adminList,
    admin: state => state.admin,
    roleList: state => state.roleList,
    role: state => state.role,
  },
  actions: {
    // 获取用户列表
    admin_list({
      commit
    }, {
      index,
      size,
      where
    }) {
      return new Promise((resolve, reject) => {
        adminList({
          index,
          size,
          where
        }).then(res => {
          const data = res.data.data
          commit('setList', data.records);
          commit('setTotalCount', data.total);
          resolve()
        }).catch(err => {
          reject(err)
        })
      })
    }
  }
}
