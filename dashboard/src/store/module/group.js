import {
  groups,
  record,
  group,
  delgroup,
  members
} from '@/api/group'
export default {
  state: {
    list: [],
    group: {createrModel:{} },
    members: [],
    record: [],
    index: 1,
    size: 10,
    totalCount: 0
  },
  mutations: {
    setGroupList(state, list) {
      state.list = list
    },
    setGroup(state, group) {
      state.group = group;
    },
    setGroupIndex(state, index) {
      state.index = index
    },
    setGroupSize(state, size) {
      state.size = size
    },
    setGroupTotalCount(state, totalCount) {
      state.totalCount = totalCount
    },
  },
  getters: {},
  actions: {
    group_index({
      commit
    }, index) {
      commit('setGroupIndex', index);
    },
    group_size({
      commit
    }, size) {
      commit('setGroupSize', size);
    },
    group_member_index({
      commit
    }, index) {
      commit('setGroupIndex', index);
    },
    group_member_size({
      commit
    }, size) {
      commit('setGroupSize', size);
    },
    // 获取用户列表
    group_list({
      commit
    }, {
      index,
      size,
      where
    }) {
      return new Promise((resolve, reject) => {
        groups({
          index,
          size,
          where
        }).then(res => {
          const data = res.data.data
          commit('setGroupList', data.records);
          commit('setGroupTotalCount', data.total);
          resolve()
        }).catch(err => {
          reject(err)
        })
      })
    },
    group_group({
      commit
    }, id) {
      return new Promise((resolve, reject) => {
        group(id).then(res => {
          const data = res.data.data
          commit('setGroup', data);
          resolve()
        }).catch(err => {
          reject(err)
        });
      })
    },
    group_record({
      commit
    }, ww) {
      return new Promise((resolve, reject) => {
        record({
          index,
          size,
          where
        }).then(res => {
          const data = res.data.data
          commit('setGroupList', data.records);
          commit('setGroupTotalCount', data.total);
          resolve()
        }).catch(err => {
          reject(err)
        })
      })
    },
    group_member_list({
      commit
    },  {
      index,
      size,
      where
    }) {
      return new Promise((resolve, reject) => {
        members({
          index,
          size,
          where
        }).then(res => {
          const data = res.data.data
          commit('setGroupList', data.records);
          commit('setGroupTotalCount', data.total);
          resolve()
        }).catch(err => {
          reject(err)
        })
      })
    },
    group_delgroup({commit},id){
      console.log("del");
      return new Promise((resolve, reject) => {
        delgroup(id).then(res => {
          resolve()
        }).catch(err => {
          reject(err)
        });
      })
    }
  }
}
