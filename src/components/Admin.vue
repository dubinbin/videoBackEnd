<template>
<!-- 左边导航栏组件-->
	<div class="adminPanel" style="height:100%">
	<my-Header></my-Header>
	 <el-row class="tac">
		 <el-col :span="4" style="height:100%;width: 22.66667%;">
		  <div class="ControlPanel">
	  	  <el-col :span="24">
		    <el-menu default-active="2" class="el-menu-vertical-demo" theme="dark">
		    <router-link :to="{path:'mainboard'}"><el-menu-item index="1">控制中心</el-menu-item></router-link>
		      <el-submenu index="1">	      
		       <template slot="title">轮播图</template>
		        <el-menu-item-group>
		          <router-link :to="{path:'carouselupload'}"><el-menu-item index="1-1">上传轮播图</el-menu-item></router-link>
		          <router-link :to="{path:'carousel'}"><el-menu-item index="1-2">轮播图列表</el-menu-item></router-link>
		        </el-menu-item-group>
		      </el-submenu>
		      <el-submenu index="2">
		       <template slot="title">视频</template>
		        <el-menu-item-group>
		          <router-link :to="{path:'movieupload'}"><el-menu-item index="2-1">上传视频</el-menu-item></router-link>
		          <router-link :to="{path:'movielist'}"><el-menu-item index="2-2">视频列表</el-menu-item></router-link>
		         <el-submenu index="2-3">
          			<template slot="title">视频分类</template>
          			<router-link :to="{path:'movieCategoryList'}"><el-menu-item index="1-4-1">现有分类</el-menu-item></router-link>
          			<router-link :to="{path:'movieCategoryAdd'}"><el-menu-item index="1-4-2">增加分类</el-menu-item></router-link>
                 </el-submenu>
		        </el-menu-item-group>
		      </el-submenu>
		      <el-submenu index="3">
		       <template slot="title">发现版块</template>
		        <el-menu-item-group>
		          <router-link :to="{path:'foundTopicList'}"><el-menu-item index="3-1">话题列表</el-menu-item></router-link>
		          <router-link :to="{path:'foundTopicAdd'}"><el-menu-item index="3-3">话题增加</el-menu-item></router-link>
		        </el-menu-item-group>
		      </el-submenu>
		        <router-link :to="{path:'userManage'}"><el-menu-item index="4">用户管理</el-menu-item></router-link>
		      	<router-link :to="{path:'userinfo'}"><el-menu-item index="5">管理员密码</el-menu-item></router-link>
		    </el-menu>
	         </el-col>
	       </div>
	      </el-col>
  		 <!-- 右边展示视图 -->
        <el-col :span="20" class="mainShow" style="width: 74.33333%;">
		  <div class="ShowPanel">
	       <router-view></router-view>
	      </div>
	   </el-col>
	  </el-row>
	  <my-Footer></my-Footer>
	</div>
</template>

<script>
import myHeader  from './BackHeader.vue';
import myFooter  from './BackFooter.vue';

export default {
	components:{
	   myHeader,
	   myFooter
	}
}	
</script>

<style>
.tac{
	height: 100%;
    position: relative;
    z-index: 100;
}
.ControlPanel ul a{
	color: #000;
	text-decoration: none;
}
.ControlPanel{
	height: 100%;
	background: #324157;
	position: fixed;
	width: 180px;
    margin-top: 46px;
}
.mainShow{
	padding: 2% 2% 2% 2%;
	margin-top: 46px;
}
.showPanel{
	width:97%;
}
</style>