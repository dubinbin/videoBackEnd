import Vue 			  from 'vue'
import router         from './router'
import ElementUI 	  from 'element-ui'
import 'element-ui/lib/theme-default/index.css'
import VueResource    from 'vue-resource'

Vue.config.productionTip = true

Vue.use(ElementUI)
Vue.use(VueResource)

let app = new Vue({
  router
}).$mount('#app');

