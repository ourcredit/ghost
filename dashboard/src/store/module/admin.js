import {
  adminList,
  updateAdmin,
  deladmin,
  user,
} from '@/api/admin'
export default {
  state: {
    list: [],
    admin: {},
    roles: [],
    index: 1,
    size: 10,
    totalCount: 0
  },
  mutations: {
    setAdminList(state, list) {
      state.list = list
    },
    setRoles(state, roles) {
      state.roles = roles
    },
    setAdmin(state, admin) {
      state.admin = admin;
    },
    setAdminIndex(state, index) {
      state.index = index
    },
    setAdminSize(state, size) {
      state.size = size
    },
    setAdminTotalCount(state, totalCount) {
      state.totalCount = totalCount
    },
  },
  getters: {
  },
  actions: {
    admin_index({commit},index){
      commit('setAdminIndex', index);
    },
    admin_size({commit},size){
      commit('setAdminSize', size);
    },
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
          commit('setAdminList', data.records);
          commit('setAdminTotalCount', data.total);
          resolve()
        }).catch(err => {
          reject(err)
        })
      })
    },
    admin_user({
      commit
    }, id) {
      return new Promise((resolve, reject) => {
        user(id).then(res => {
          const data = res.data.data
          commit('setRoles', data.roles);
          commit('setAdmin', data);
          resolve()
        }).catch(err => {
          reject(err)
        });
      })
    },
    admin_updateAdmin({
      commit
    }, ww) {
      return new Promise((resolve, reject) => {
        updateAdmin(ww).then(res => {
          commit('setAdmin', {});
          resolve()
        }).catch(err => {
          reject(err)
        });
      })
    }
  }
}
