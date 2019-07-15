import {
  delrole,
  roleList,
  updateRole,
  role
} from '@/api/admin'
export default {
  state: {
    list: [],
    role: {},
    roles: [],
    allPermissions: [],
    hasPermissions: [],
    index: 1,
    size: 10,
    totalCount: 0
  },
  mutations: {
    setRoleList(state, list) {
      state.list = list
    },
    setRoles(state, roles) {
      state.roles = roles
    },
    setAllPermissions(state, all) {
      state.allPermissions = all
    },
    setHasPermissions(state, has) {
      state.hasPermissions = has
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
  },
  actions: {
    // 获取用户列表
    role_list({
      commit
    }, {
      index,
      size,
      where
    }) {
      return new Promise((resolve, reject) => {
        roleList({
          index,
          size,
          where
        }).then(res => {
          const data = res.data.data
          commit('setRoleList', data.records);
          commit('setTotalCount', data.total);
          resolve()
        }).catch(err => {
          reject(err)
        })
      })
    },
    role_role({
      commit
    }, id) {
      return new Promise((resolve, reject) => {
        role(id).then(res => {
          const data = res.data.data
          commit('setAllPermissions', data.allPermissions);
          commit('setHasPermissions', data.hasPermissions);
          commit('setRole', data);
          resolve()
        }).catch(err => {
          reject(err)
        });
      })
    },
    role_updateRole({
      commit
    }, ww) {
      debugger;
      return new Promise((resolve, reject) => {
        updateRole(ww).then(res => {
          commit('setRole', {});
          resolve()
        }).catch(err => {
          reject(err)
        });
      })
    }
  }
}
