import {
  delrole,
  roleList,
  updateRole,
  role
} from '@/api/admin'
export default {
  state: {
    list: [],
    role: { permissionIds:[]},
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
    setAllPermissions(state, all) {
      state.allPermissions = all
    },
    setHasPermissions(state, has) {
      state.hasPermissions = has
    },
    setRole(state, role) {
      state.role = role;
    },
    setRoleIndex(state, index) {
      state.index = index
    },
    setRoleSize(state, size) {
      state.size = size
    },
    setRoleTotalCount(state, totalCount) {
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
          commit('setRoleTotalCount', data.total);
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
      return new Promise((resolve, reject) => {
        updateRole(ww).then(res => {
          commit('setRole', {});
          resolve()
        }).catch(err => {
          reject(err)
        });
      })
    },
    role_delrole({commit},id){
      return new Promise((resolve, reject) => {
        delrole(id).then(res => {
          resolve()
        }).catch(err => {
          reject(err)
        });
      })
    }
  }
}
