import axios from '@/libs/api.request'


export const groups = (data) => {
  return axios.request({
    url: '/app/api/group',
    data,
    method: 'post'
  })
}
export const group = (id) => {
  return axios.request({
    url: '/app/api/group/' + id,
    method: 'get'
  })
}
export const record = (data) => {
  return axios.request({
    url: '/app/api/group/record',
    data,
    method: 'post'
  })
}
export const members = (data) => {
  return axios.request({
    url: '/app/api/group/members',
    data,
    method: 'post'
  })
}
export const delgroup=(id) => {
  return axios.request({
    url: '/app/api/group/delgroup/' + id,
    method: 'get'
  })
}