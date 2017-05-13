import Vue 			    from 'vue'
import router       from './router'
import Vuex         from 'vuex'
import store        from './vuex/store'
import ElementUI 	  from 'element-ui'
import 'element-ui/lib/theme-default/index.css'
import VueResource    from 'vue-resource'
import 'bootstrap/js/modal.js'
import 'bootstrap/js/dropdown.js'
import 'bootstrap/js/tooltip.js'
import 'bootstrap/dist/css/bootstrap.css'
import 'font-awesome/css/font-awesome.css'
import 'summernote'
import 'summernote/dist/lang/summernote-zh-CN.js'
import 'summernote/dist/summernote.css'


Vue.config.productionTip = false

Vue.use(Vuex)
Vue.use(ElementUI)
Vue.use(VueResource)

let app = new Vue({
  router,
  store
}).$mount('#app');

