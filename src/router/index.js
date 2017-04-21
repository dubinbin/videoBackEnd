import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

import Login     from '../components/Login.vue'
import Admin     from '../components/Admin.vue'
import MovieList from '../components/MovieList.vue'
import Userinfo  from '../components/Userinfo.vue'
import Carousel  from '../components/Carousel.vue'
import CarouselEdit from '../components/CarouselEdit.vue'
import MovieEdit  from '../components/MovieEdit.vue'
import CarouselUpload from '../components/CarouselUpload.vue'
import MovieUpload  from '../components/MovieUpload.vue'
import UserManage  from  '../components/UserManage.vue'
import FoundTopicAdd  from '../components/FoundTopicAdd.vue'
import FoundTopicList from '../components/FoundTopicList.vue'
import MovieCategoryList from '../components/MovieCategoryList.vue'
import MovieCategoryAdd from '../components/MovieCategoryAdd.vue'
import MainBoard from '../components/MainBoard.vue'
 

export default new Router({
  mode: 'history',
  routes: [
    {path: '/login',component: Login },
    {
      path: '/admin',
      component: Admin,
      children: [
        {path: '/movielist',component: MovieList,name:'movieList'},
        {path: '/userinfo',component: Userinfo,name:'userinfo'},
        {path: '/carousel',component: Carousel,name:'carousel'},
        {path: '/carouseledit',component: CarouselEdit,name:'carouselEdit'},
        {path: '/movieedit',component: MovieEdit,name:'movieEdit'},
        {path: '/carouselupload',component:CarouselUpload,name:'CarouselUpload'},
        {path: '/movieupload',component:MovieUpload,name:'MovieUpload'},
        {path: '/userManage',component:UserManage,name:'userManage'},
        {path: '/foundTopicAdd',component:FoundTopicAdd,name:'FoundTopicAdd'},
        {path: '/foundTopicList',component:FoundTopicList,name:'FoundTopicList'},
        {path: '/movieCategoryAdd',component:MovieCategoryAdd,name:'MovieCategoryAdd'},
        {path: '/movieCategoryList',component:MovieCategoryList,name:'MovieCategoryList'},
        {path: '/mainBoard',component:MainBoard,name:'MainBoard'}  
      ]
    }
  ]
})
