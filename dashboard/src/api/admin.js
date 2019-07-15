import axios from '@/libs/api.request'


export const adminList = (data) => {
  return axios.request({
    url: '/app/api/admin/admins',
    data,
    method: 'post'
  })
}

export const roleList = (data) => {
  return axios.request({
    url: '/app/api/admin/roles',
    data,
    method: 'post'
  })
}

export const user = (id) => {
  return axios.request({
    url: '/app/api/admin/user/' + id,
    method: 'get'
  })
}
export const role = (id) => {
  return axios.request({
    url: '/app/api/admin/role/' + id,
    method: 'get'
  })
}
export const updateAdmin = data => {
  console.log("params：")
  console.log(data);
  return axios.request({
    url: '/app/api/admin/updateadmin',
    data,
    method: 'post'
  })
}
export const updateRole = data => {
  return axios.request({
    url: '/app/api/admin/updaterole',
    data,
    method: 'post'
  })
}
export const deladmin = adminId => {
  return axios.request({
    url: '/app/api/admin/deladmin',
    method: 'get',
    params: {
      adminId
    }
  })
}
export const delrole = roleId => {
  return axios.request({
    url: '/app/api/admin/delrole',
    method: 'get',
    params: {
      roleId
    }
  })
}
