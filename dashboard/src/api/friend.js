import axios from '@/libs/api.request'


export const friends = (id,data) => {
  return axios.request({
    url: `/app/api/friend/${id}`,
    data,
    method: 'post'
  })
}
export const friend = (fromid,toid) => {
  return axios.request({
    url: `/app/api/friend/${fromid}/${toid}`,
    method: 'get'
  })
}
export const content = (fromid,toid,data) => {
  return axios.request({
    url: `/app/api/friend/${fromid}/${toid}/content`,
    data,
    method: 'post'
  })
}