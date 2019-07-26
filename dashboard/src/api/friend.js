import axios from '@/libs/api.request'


export const friends = (data) => {
  return axios.request({
    url: '/app/api/friend',
    data,
    method: 'post'
  })
}
export const friend = (id) => {
  return axios.request({
    url: '/app/api/friend/' + id,
    method: 'get'
  })
}
export const content = (id,data) => {
  return axios.request({
    url: `/app/api/friend/${id}/content`,
    data,
    method: 'post'
  })
}