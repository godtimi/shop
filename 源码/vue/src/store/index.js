import Vue from 'vue'
import Vuex from 'vuex'
import router, {resetRouter} from "@/router";

Vue.use(Vuex)

const store = new Vuex.Store({
    state: {
        currentPathName: '',
        user: {},
        name: "",
        stateName: "全部",
        productId: 0,
        activeName: '0',
        orderId: 0,
        data: {}
    },
    mutations: {
        logout() {
            localStorage.removeItem("user");
            localStorage.removeItem("menus");
            localStorage.removeItem("location");
            router.push("/login")

            //重置路由
            resetRouter()
        },
        setPath(state) {
            state.currentPathName = localStorage.getItem("currentPathName")
        },
        updateUser(state, user) {
            state.user = user
        },
        search(state, name) {
            state.name = name
        },
        setStateName(state, stateName) {
            state.stateName = stateName
        },
        setProductId(state, productId) {
            state.productId = productId
        },
        setActiveName(state, activeName) {
            state.activeName = activeName
        },
        setOrderId(state, orderId) {
            state.orderId = orderId
        },
        setData(state, data) {
            state.data = data
        },

    }
})

export default store