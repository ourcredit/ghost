import axios from '@/libs/api.request'
export const users = ({ index, size,where }) => {
  const params = {
    index,
    size,
    where
  }
  return axios.request({
    url: '/app/api/user/list',
    data:params,
    method: 'post'
  })
}
export const user = (key) => {
  return axios.request({
    url: '/app/api/user',
    params: {
      key
    },
    method: 'get'
  })
}

export const edit = (user) => {
  return axios.request({
    url: '/app/api/user/edit',
    data:user,
    method: 'post'
  })
}

export const remove = (key) => {
  return axios.request({
    url: 'message/count',
    params:{
        key
    },
    method: 'get'
  })
}

export const appUseState = () => {
  return axios.request({
    url: 'message/init',
    method: 'get'
  })
}

export const recordInfo = msg_id => {
  return axios.request({
    url: 'message/content',
    method: 'get',
    params: {
      msg_id
    }
  })
}

export const groupInfo = msg_id => {
  return axios.request({
    url: 'message/has_read',
    method: 'post',
    data: {
      msg_id
    }
  })
}

export const publicGroup = msg_id => {
  return axios.request({
    url: 'message/remove_readed',
    method: 'post',
    data: {
      msg_id
    }
  })
}

export const friendInvate = msg_id => {
  return axios.request({
    url: 'message/restore',
    method: 'post',
    data: {
      msg_id
    }
  })
}
