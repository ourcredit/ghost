import Main from '@/components/main'
import parentView from '@/components/parent-view'

/**
 * iview-admin中meta除了原生参数外可配置的参数:
 * meta: {
 *  title: { String|Number|Function }
 *         显示在侧边栏、面包屑和标签栏的文字
 *         使用'{{ 多语言字段 }}'形式结合多语言使用，例子看多语言的路由配置;
 *         可以传入一个回调函数，参数是当前路由对象，例子看动态路由和带参路由
 *  hideInBread: (false) 设为true后此级路由将不会出现在面包屑中，示例看QQ群路由配置
 *  hideInMenu: (false) 设为true后在左侧菜单不会显示该页面选项
 *  notCache: (false) 设为true后页面在切换标签后不会缓存，如果需要缓存，无需设置这个字段，而且需要设置页面组件name属性和路由配置的name一致
 *  access: (null) 可访问该页面的权限数组，当前路由设置的权限会影响子路由
 *  icon: (-) 该页面在左侧菜单、面包屑和标签导航处显示的图标，如果是自定义图标，需要在图标名称前加下划线'_'
 *  beforeCloseName: (-) 设置该字段，则在关闭当前tab页时会去'@/router/before-close.js'里寻找该字段名对应的方法，作为关闭前的钩子函数
 * }
 */

export default [{
    path: '/login',
    name: 'login',
    meta: {
      title: 'Login - 登录',
      hideInMenu: true
    },
    component: () => import('@/view/login/login.vue')
  },
  {
    path: '/',
    name: '_home',
    redirect: '/home',
    component: Main,
    meta: {
      hideInMenu: false,
      notCache: true
    },
    children: [{
      path: '/home',
      name: 'home',
      meta: {
        hideInMenu: false,
        title: '首页',
        notCache: true,
        icon: 'md-home'
      },
      component: () => import('@/view/home/dash')
    }]
  },
  {
    path: '/user',
    name: 'user',
    meta: {
      hideInBread: true
    },
    component: Main,
    children: [{
        path: '',
        name: '用户管理',
        meta: {
          icon: 'ios-hammer',
          title: '用户管理'
        },
        component: () => import('@/view/user/index')
      },
      {
        path: 'detail',
        name: '用户详情',
        meta: {
          icon: 'ios-hammer',
          title: '用户详情',
          hideInMenu: true
        },
        component: () => import('@/view/user/detail')
      },
      {
        path: '/recordlist',
        name: '用户聊天记录',
        meta: {
          icon: 'ios-hammer',
          title: '用户聊天记录',
          hideInMenu: true
        },
        component: () => import('@/view/user/recordlist')
      },
      {
        path: '/recorddetail',
        name: '用户聊天记录详情',
        meta: {
          icon: 'ios-hammer',
          title: '用户聊天记录详情',
          hideInMenu: true
        },
        component: () => import('@/view/user/recorddetail')
      },
      {
        path: '/grouplist',
        name: '用户群组记录',
        meta: {
          icon: 'ios-hammer',
          title: '用户群组记录',
          hideInMenu: true
        },
        component: () => import('@/view/user/grouplist')
      },
      {
        path: '/groupdetail',
        name: '用户群组记录详情',
        meta: {
          icon: 'ios-hammer',
          title: '用户群组记录详情',
          hideInMenu: true
        },
        component: () => import('@/view/user/groupdetail')
      },
      {
        path: '/publiclist',
        name: '公共频道聊天记录',
        meta: {
          icon: 'ios-hammer',
          title: '公共频道聊天记录',
          hideInMenu: true
        },
        component: () => import('@/view/user/publiclist')
      },
      {
        path: '/publicdetail',
        name: '公共频道聊天记录详情',
        meta: {
          icon: 'ios-hammer',
          title: '用户群组记录详情',
          hideInMenu: true
        },
        component: () => import('@/view/user/publicdetail')
      },
      {
        path: '/invatelist',
        name: '邀请记录',
        meta: {
          icon: 'ios-hammer',
          title: '邀请记录',
          hideInMenu: true
        },
        component: () => import('@/view/user/invatelist')
      },
      {
        path: '/appuse',
        name: 'App使用情况',
        meta: {
          icon: 'ios-hammer',
          title: 'App使用情况',
          hideInMenu: true
        },
        component: () => import('@/view/user/appuse')
      }
    ]
  },
  {
    path: '/invitation',
    name: 'invitation',
    component: Main,
    meta: {
      hideInBread: true
    },
    children: [{
      path: '',
      name: '邀请记录管理',
      meta: {
        icon: '_qq',
        title: '邀请记录管理'
      },
      component: () => import('@/view/join-page.vue')
    }]
  },
  {
    path: '/group',
    name: 'group',
    component: Main,
    meta: {
      hideInBread: true
    },
    children: [{
        path: '/',
        name: '群组管理',
        meta: {
          icon: '_qq',
          title: '群组管理'
        },
        component: () => import('@/view/group/index')
      },
      {
        path: '/groupdetail',
        name: '群组详情',
        meta: {
          icon: '_qq',
          title: '群组详情',
          hideInMenu: true
        },
        component: () => import('@/view/group/group')
      },
      {
        path: '/detail',
        name: '群组聊天记录',
        meta: {
          icon: '_qq',
          title: '群组聊天记录',
          hideInMenu: true
        },
        component: () => import('@/view/group/detail')
      }
    ]
  },
  {
    path: '/public',
    name: 'publicgroup',
    component: Main,
    meta: {
      hideInBread: true
    },
    children: [{
      path: '/',
      name: '公共频道管理',
      meta: {
        icon: '_qq',
        title: '公共频道管理'
      },
      component: () => import('@/view/publicgroup/index.vue')
    },
    {
      path: '/publicgroup',
      name: '公共频道详情',
      meta: {
        icon: '_qq',
        title: '公共频道详情',
        hideInMenu:true
      },
      component: () => import('@/view/publicgroup/group.vue')
    },
    {
      path: '/publicdetail',
      name: '公共频道记录',
      meta: {
        icon: '_qq',
        title: '公共频道记录',
        hideInMenu:true
      },
      component: () => import('@/view/publicgroup/detail.vue')
    }]
  },
  {
    path: '/history',
    name: 'history',
    component: Main,
    meta: {
      hideInBread: true
    },
    children: [{
      path: '/',
      name: '聊天记录管理',
      meta: {
        icon: '_qq',
        title: '聊天记录管理'
      },
      component: () => import('@/view/records/index')
    }]
  },
  {
    path: '/resource',
    name: 'resource',
    component: Main,
    meta: {
      hideInBread: true
    },
    children: [{
      path: '/',
      name: '资源管理',
      meta: {
        icon: '_qq',
        title: '资源管理'
      },
      component: () => import('@/view/resource/index')
    }]
  },
  {
    path: '/common',
    name: 'common',
    component: Main,
    meta: {
      hideInBread: true
    },
    children: [{
      path: '/',
      name: '通用管理',
      meta: {
        icon: '_qq',
        title: '通用管理'
      },
      component: () => import('@/view/common/index')
    }]
  },
  {
    path: '/statical',
    name: 'total',
    component: Main,
    meta: {
      hideInBread: true
    },
    children: [{
      path: '/',
      name: '统计',
      meta: {
        icon: '_qq',
        title: '统计'
      },
      component: () => import('@/view/statical/index')
    }]
  },
  {
    path: '/message',
    name: 'message',
    component: Main,
    meta: {
      hideInBread: true,
      hideInMenu: true
    },
    children: [{
      path: 'message_page',
      name: 'message_page',
      meta: {
        icon: 'md-notifications',
        title: '消息中心'
      },
      component: () => import('@/view/single-page/message/index.vue')
    }]
  },
 
  {
    path: '/401',
    name: 'error_401',
    meta: {
      hideInMenu: true
    },
    component: () => import('@/view/error-page/401.vue')
  },
  {
    path: '/500',
    name: 'error_500',
    meta: {
      hideInMenu: true
    },
    component: () => import('@/view/error-page/500.vue')
  },
  {
    path: '*',
    name: 'error_404',
    meta: {
      hideInMenu: true
    },
    component: () => import('@/view/error-page/404.vue')
  }
]
