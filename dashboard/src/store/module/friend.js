import {
  friends,
  friend,
  content,
} from '@/api/friend'
export default {
  state: {
    list: [],
    friend:{},
    index: 1,
    size: 10,
    totalCount: 0
  },
  mutations: {
    setFriendList(state, list) {
      state.list = list
    },
    setFriend(state, friend) {
      state.friend = friend;
    },
    setFriendIndex(state, index) {
      state.index = index
    },
    setFriendSize(state, size) {
      state.size = size
    },
    setFriendTotalCount(state, totalCount) {
      state.totalCount = totalCount
    },
  },
  getters: {},
  actions: {
    friend_index({
      commit
    }, index) {
      commit('setFriendIndex', index);
    },
    friend_size({
      commit
    }, size) {
      commit('setFriendSize', size);
    },
    // 获取用户列表
    friend_list({
      commit
    }, {
      index,
      size,
      where
    }) {
      return new Promise((resolve, reject) => {
        friends({
          index,
          size,
          where
        }).then(res => {
          const data = res.data.data
          commit('setFriendList', data.records);
          commit('setFriendTotalCount', data.total);
          resolve()
        }).catch(err => {
          reject(err)
        })
      })
    },
    friend_friend({
      commit
    }, id) {
      return new Promise((resolve, reject) => {
        friend(id).then(res => {
          const data = res.data.data
          commit('setFriend', data);
          resolve()
        }).catch(err => {
          reject(err)
        });
      })
    },
    friend_content({
      commit
    }, ww) {
      return new Promise((resolve, reject) => {
        content({
          index,
          size,
          where
        }).then(res => {
          const data = res.data.data
          commit('setFriendList', data.records);
          commit('setFriendTotalCount', data.total);
          resolve()
        }).catch(err => {
          reject(err)
        })
      })
    }
  }
}
