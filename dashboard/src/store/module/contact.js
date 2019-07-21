import {
    users,
    user
  } from '@/api/contact'
  
  export default {
    state: {
      list: [],
      user: {},
      index: 1,
      size: 10,
      totalCount:0
    },
    mutations: {
      setContactIndex (state, index) {
        state.index = index
      },
      setContactSize (state, size) {
        state.size = size
      },
      setTotalCount (state, totalCount) {
        state.totalCount = totalCount
      },
      setUserList (state, list) {
        state.list = list
      },
      setContactUser (state, user) {
        state.user = user
      }
    },
    getters: {
    },
    actions: {
      contact_index({
        commit
      }, index) {
        commit('setContactIndex', index);
      },
      contact_size({
        commit
      }, size) {
        commit('setContactSize', size);
      },
      // 获取用户列表
      contact_list ({ commit }, { index, size,where }) {
        return new Promise((resolve, reject) => {
          users({
            index,
            size,where
          }).then(res => {
            const data = res.data.data
          
            commit('setUserList', data.records);
            commit('setTotalCount', data.total);
            resolve()
          }).catch(err => {
            reject(err)
          })
        })
      },
      // 获取详情
      contact_user ({ commit },id) {
        return new Promise((resolve, reject) => {
          user(id).then(res => {
            const data = res.data.data
            commit('setContactUser', data);
            resolve()
          }).catch(err => {
            reject(err)
          })
        })
      }
    }
  }
  