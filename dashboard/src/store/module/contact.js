import {
    users,
    user,
    edit,
    remove,
    appUseState,
    recordInfo,
    groupInfo,
    publicGroup,
    friendInvate
  } from '@/api/contact'
  import { setToken, getToken } from '@/libs/util'
  
  export default {
    state: {
      userList: [],
      user: {},
      index: 1,
      size: 10,
      totalCount:0
    },
    mutations: {
      setIndex (state, index) {
        state.index = index
      },
      setSize (state, size) {
        state.size = size
      },
      setTotalCount (state, totalCount) {
        state.totalCount = totalCount
      },
      setUserList (state, list) {
        state.userList = list
      },
      setUser (state, user) {
        state.user = user
      }
    },
    getters: {
        userList: state => state.userList,
        user: state => state.user,
    },
    actions: {
      // 获取用户列表
      contact_users ({ commit }, { index, size,where }) {
        return new Promise((resolve, reject) => {
          users({
            index,
            size,where
          }).then(res => {
            const data = res.data
            commit('setUserList', data.records);
            commit('setTotalCount', data.total);
            resolve()
          }).catch(err => {
            reject(err)
          })
        })
      }
    }
  }
  