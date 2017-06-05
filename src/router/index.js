import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

import Login              from '../components/Login.vue'
import Admin              from '../components/Admin.vue'
import MovieList          from '../components/MovieList.vue'
import Userinfo           from '../components/Userinfo.vue'
import Carousel           from '../components/Carousel.vue'
import CarouselEdit       from '../components/CarouselEdit.vue'
import MovieEdit          from '../components/MovieEdit.vue'
import CarouselUpload     from '../components/CarouselUpload.vue'
import MovieUpload        from '../components/MovieUpload.vue'
import UserManage         from '../components/UserManage.vue'
import FoundTopicAdd      from '../components/FoundTopicAdd.vue'
import FoundTopicList     from '../components/FoundTopicList.vue'
import MovieCategoryList  from '../components/MovieCategoryList.vue'
import MovieCategoryAdd   from '../components/MovieCategoryAdd.vue'
import MainBoard          from '../components/MainBoard.vue'
import FoundTopicEdit     from '../components/FoundTopicEdit.vue'
import MovieCategoryEdit  from '../components/MovieCategoryEdit.vue'
import UserinfoEdit       from '../components/UserinfoEdit.vue'
import TopicCategoryAdd   from '../components/TopicCategoryAdd.vue'
import TopicCategoryEdit  from '../components/TopicCategoryEdit.vue'
import TopicCategory      from '../components/TopicCategory.vue'
import TopicCommentlist   from '../components/TopicCommentlist.vue'
import MovieCommentlist   from '../components/MovieCommentlist.vue'
import FeedBack           from '../components/FeedBack.vue'

export default new Router({
  mode: 'history',
  routes: [
    {path: '/',component: Login },
    {
      name:'admin',
      path: '/admin',
      component: Admin,
      meta:{
        auth:true
      },
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
        {path: '/mainBoard',component:MainBoard,name:'MainBoard'},
        {path: '/foundTopicEdit',component:FoundTopicEdit,name:'FoundTopicEdit'},
        {path: '/movieCategoryEdit',component:MovieCategoryEdit,name:'MovieCategoryEdit'},
        {path: '/userinfoEdit',component:UserinfoEdit,name:'userinfoEdit'},
        {path: '/topicCategory',component:TopicCategory, name:'TopicCategory'},
        {path: '/topicCategoryAdd',component:TopicCategoryAdd,name:'TopCategoryAdd'},
        {path: '/topicCategoryEdit',component:TopicCategoryEdit,name:'TopicCategoryEdit'},
        {path: '/movieCommentlist',component:MovieCommentlist,name:'MovieCommentlist'},
        {path: '/topicCommentlist',component:TopicCommentlist,name:'TopicCommentlist'}, 
        {path: '/FeedBack',component:FeedBack ,name:'FeedBack'}
      ]
    }
  ]
})
