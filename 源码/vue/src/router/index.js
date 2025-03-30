import Vue from 'vue'
import VueRouter from 'vue-router'
import store from '../store'

Vue.use(VueRouter)

// 获取原型对象上的push函数
const originalPush = VueRouter.prototype.push
// 修改原型对象中的push方法
VueRouter.prototype.push = function push(location) {
    return originalPush.call(this, location).catch(err => err)
}


const routes = [
    {
        path: '/login',
        name: 'Login',
        component: () => import('../views/Login.vue'),
    },
    {
        path: '/register',
        name: 'register',
        component: () => import('../views/Register.vue'),
    },
    {
        path: '/reception',
        name: 'Reception',
        component: () => import('../views/reception/Reception.vue'),
        children: [
            {
                path: 'home',
                name: 'Home',
                component: () => import('../views/reception/Home.vue')
            },
            {
                path: 'personal',
                name: 'Personal',
                component: () => import('../views/reception/Personal.vue')
            },
            {
                path: 'detail',
                name: 'Detail',
                component: () => import('../views/reception/Detail')
            },
            {
                path: 'cart',
                name: 'Cart',
                component: () => import('../views/reception/Cart')
            },
            {
                path: 'orders',
                name: 'Orders',
                component: () => import('../views/reception/Orders')
            },
            {
                path: 'collection',
                name: 'Collection',
                component: () => import('../views/reception/Collection')
            },
            {
                path: 'display',
                name: 'Display',
                component: () => import('../views/reception/Display')
            },
            {
                path: 'menuBanner',
                name: 'MenuBanner',
                component: () => import('../views/reception/MenuBanner')
            },
            {
                path: 'classification',
                name: 'Classification',
                component: () => import('../views/reception/Classification')
            },
            {
                path: 'video',
                name: 'Video',
                component: () => import('../views/reception/Video')
            },
            {
                path: 'lives',
                name: 'Lives',
                component: () => import('../views/reception/Lives')
            },
            {
                path: 'blank',
                name: 'Blank',
                component: () => import('../views/reception/Blank')
            },
            {
                path: 'article',
                name: 'Article',
                component: () => import('../views/reception/Article')
            },
            {
                path: 'chat',
                name: 'Chat',
                component: () => import('../views/reception/Chat')
            },
            {
                path: 'toEvaluate',
                name: 'ToEvaluate',
                component: () => import('../views/reception/ToEvaluate')
            },
            {
                path: 'password',
                name: 'Password',
                component: () => import('../views/reception/Password')
            },
            {
                path: 'settlement',
                name: 'Settlement',
                component: () => import('../views/reception/Settlement')
            },
            {
                path: 'address',
                name: 'Address',
                component: () => import('../views/reception/Address')
            },
            {
                path: 'settlement1',
                name: 'Settlement1',
                component: () => import('../views/reception/Settlement1')
            },
            {
                path: 'live',
                name: 'Live',
                component: () => import('../views/reception/Live')
            }

        ]
    },
    {
        path: '/404',
        name: '404',
        component: () => import('../views/404.vue')
    }
]

const router = new VueRouter({
    mode: 'history',
    base: process.env.BASE_URL,
    routes
})
//重置路由方法
export const resetRouter = () => {
    router.matcher = new VueRouter({
        mode: 'history',
        base: process.env.BASE_URL,
        routes
    })
}

//导出路由
export const setRoutes = () => {
    const storeMenus = localStorage.getItem("menus"); //取出数组
    //判断有无
    if (storeMenus) {
        const currentRoutesNames = router.getRoutes().map(v => v.name)
        //动态添加到现在的路由中去
        if (!currentRoutesNames.includes('Manage')) {
            //拼装动态路由
            const manageRoute = {
                path: '/',
                name: "Manage",
                meta: {title: '首页'},
                component: () => import('../views/Manage.vue'),
                // redirect: "/home",
                children: [
                    {
                        path: 'person',
                        name: 'Person',
                        meta: {title: '个人信息'},
                        component: () => import('../views/Person.vue'),
                    }, {path: 'password', name: '修改密码', component: () => import('../views/Password.vue')}
                ]
            }
            // 解析
            const menus = JSON.parse(storeMenus)

            menus.forEach(item => {
                if (item.path) { // 当且仅当path不为空设置路由
                    let itemMenu = {
                        path: item.path.replace("/", ""),
                        name: item.name,
                        meta: {title: item.name},
                        component: () => import('../views/' + item.pagePath + '.vue')
                    }
                    manageRoute.children.push(itemMenu)
                } else if (item.children.length) {
                    item.children.forEach(item => {
                        if (item.path) {// 当且仅当path不为空设置路由
                            let itemMenu = {
                                path: item.path.replace("/", ""),
                                name: item.name,
                                meta: {title: item.name},
                                component: () => import('../views/' + item.pagePath + '.vue')
                            }
                            manageRoute.children.push(itemMenu)
                        }
                    })
                }
            })


            router.addRoute(manageRoute)
        }
    }
}

setRoutes()

router.beforeEach((to, from, next) => {
    store.commit("setPath")  // 触发store的数据更新
    // 兼容chrome
    document.body.scrollTop = 0
    // 兼容firefox
    document.documentElement.scrollTop = 0
    // 兼容safari
    window.pageYOffset = 0
    //未找到路由情况
    if (!to.matched.length) {
        const storeMenus = localStorage.getItem("menus")
        if (storeMenus) {
            next("")  // 放行路由
        } else {
            next("/reception/home")// 去登录
        }
    }
    next()  // 放行路由
})


export default router


