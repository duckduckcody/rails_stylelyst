import Vue from 'vue'
import VueRouter from 'vue-router'
import styleList from 'src/styleList'
import settings from 'src/settings'
import App from 'src/app.vue'
import 'src/application.scss'

const routes = [
  {
    path: '/', component: styleList,
  },
  {
    path: '/settings', component: settings
  }
]

const router = new VueRouter({
  routes
})

Vue.use(VueRouter)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    router,
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)
})