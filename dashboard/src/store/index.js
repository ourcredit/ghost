import Vue from 'vue'
import Vuex from 'vuex'

import user from './module/user'
import app from './module/app'
import contact from './module/contact'
import dash from './module/dash'
import admin from './module/admin'
import role from './module/role'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    //
  },
  mutations: {
    //
  },
  actions: {
    //
  },
  modules: {
    user,
    app,
    contact,
    dash,
    admin,
    role
  }
})
