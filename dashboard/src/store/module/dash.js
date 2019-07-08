import {
    newRegistUserCount,
    logout,
    getMessage,
    getContentByMsgId,
    hasRead,
    removeReaded,
    restoreTrash,
    getUnreadCount
  } from '@/api/user'
  import { setToken, getToken } from '@/libs/util'
  
  export default {
    state: {
      newRegistUserCount: 1,//新注册用户数
      newCreateGroup: 2,//最新成立群组
      newCreatePublicGroup: 3,//最新成立公开群组
      newRegistUserList: [],//新注册用户集合
      historyList: [],//聊天记录历史
      loginTimeList: [],//登陆时长排行榜
      activeList: [],//活跃度分布
      newCreateGroupList: [],
      newCreatePublicList: [],
      messageContentStore: {}
    },
    mutations: {
      setList(state,list){
        state.list = list;
      },
      setAvator (state, avatorPath) {
        state.avatorImgPath = avatorPath
      },
      setUserId (state, id) {
        state.userId = id
      },
      setUserName (state, name) {
        state.userName = name
      },
      setAccess (state, access) {
        state.access = access
      },
      setToken (state, token) {
        state.token = token
        setToken(token)
      },
      setHasGetInfo (state, status) {
        state.hasGetInfo = status
      },
      setMessageCount (state, count) {
        state.unreadCount = count
      },
      setMessageUnreadList (state, list) {
        state.messageUnreadList = list
      },
      setMessageReadedList (state, list) {
        state.messageReadedList = list
      },
      setMessageTrashList (state, list) {
        state.messageTrashList = list
      },
      updateMessageContentStore (state, { msg_id, content }) {
        state.messageContentStore[msg_id] = content
      },
      moveMsg (state, { from, to, msg_id }) {
        const index = state[from].findIndex(_ => _.msg_id === msg_id)
        const msgItem = state[from].splice(index, 1)[0]
        msgItem.loading = false
        state[to].unshift(msgItem)
      }
    },
    getters: {
      newRegistUserCount: state => state.newRegistUserCount,
      newCreateGroup: state => state.newCreateGroup,
      newCreatePublicGroup: state => state.newCreatePublicGroup
    },
    actions: {
      getAll({ commit }, params){
        return new Promise((resolve, reject) => {
          getDashList(params).then(res => {
            const data = res.data
            commit('setList', data);
            commit('setList', data);
            commit('setList', data);
            resolve()
          }).catch(err => {
            reject(err)
          })
        })
      },
      // 登录
      handleLogin ({ commit }, { userName, password }) {
        userName = userName.trim()
        return new Promise((resolve, reject) => {
          login({
            userName,
            password
          }).then(res => {
            const data = res.data
            commit('setToken', data.token)
            resolve()
          }).catch(err => {
            reject(err)
          })
        })
      },
      // 退出登录
      handleLogOut ({ state, commit }) {
        return new Promise((resolve, reject) => {
          logout(state.token).then(() => {
            commit('setToken', '')
            commit('setAccess', [])
            resolve()
          }).catch(err => {
            reject(err)
          })
          // 如果你的退出登录无需请求接口，则可以直接使用下面三行代码而无需使用logout调用接口
          // commit('setToken', '')
          // commit('setAccess', [])
          // resolve()
        })
      },
      // 此方法用来获取未读消息条数，接口只返回数值，不返回消息列表
      getUnreadMessageCount ({ state, commit }) {
        getUnreadCount().then(res => {
          const { data } = res
          commit('setMessageCount', data)
        })
      },
      // 获取消息列表，其中包含未读、已读、回收站三个列表
      getMessageList ({ state, commit }) {
        return new Promise((resolve, reject) => {
          getMessage().then(res => {
            const { unread, readed, trash } = res.data
            commit('setMessageUnreadList', unread.sort((a, b) => new Date(b.create_time) - new Date(a.create_time)))
            commit('setMessageReadedList', readed.map(_ => {
              _.loading = false
              return _
            }).sort((a, b) => new Date(b.create_time) - new Date(a.create_time)))
            commit('setMessageTrashList', trash.map(_ => {
              _.loading = false
              return _
            }).sort((a, b) => new Date(b.create_time) - new Date(a.create_time)))
            resolve()
          }).catch(error => {
            reject(error)
          })
        })
      },
      // 根据当前点击的消息的id获取内容
      getContentByMsgId ({ state, commit }, { msg_id }) {
        return new Promise((resolve, reject) => {
          let contentItem = state.messageContentStore[msg_id]
          if (contentItem) {
            resolve(contentItem)
          } else {
            getContentByMsgId(msg_id).then(res => {
              const content = res.data
              commit('updateMessageContentStore', { msg_id, content })
              resolve(content)
            })
          }
        })
      },
      // 把一个未读消息标记为已读
      hasRead ({ state, commit }, { msg_id }) {
        return new Promise((resolve, reject) => {
          hasRead(msg_id).then(() => {
            commit('moveMsg', {
              from: 'messageUnreadList',
              to: 'messageReadedList',
              msg_id
            })
            commit('setMessageCount', state.unreadCount - 1)
            resolve()
          }).catch(error => {
            reject(error)
          })
        })
      },
      // 删除一个已读消息到回收站
      removeReaded ({ commit }, { msg_id }) {
        return new Promise((resolve, reject) => {
          removeReaded(msg_id).then(() => {
            commit('moveMsg', {
              from: 'messageReadedList',
              to: 'messageTrashList',
              msg_id
            })
            resolve()
          }).catch(error => {
            reject(error)
          })
        })
      },
      // 还原一个已删除消息到已读消息
      restoreTrash ({ commit }, { msg_id }) {
        return new Promise((resolve, reject) => {
          restoreTrash(msg_id).then(() => {
            commit('moveMsg', {
              from: 'messageTrashList',
              to: 'messageReadedList',
              msg_id
            })
            resolve()
          }).catch(error => {
            reject(error)
          })
        })
      }
    }
  }
  