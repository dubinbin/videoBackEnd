<template>
<div class="mainController">
  <p style="font-weight: 200;">采用开源的Vue.js与Element UI构建</p>
  <br>
  <p stlye="font-weight: 200;">Github : <a href="https://github.com/dubinbin/videoBackEnd">https://github.com/dubinbin/videoBackEnd</a></p>
<div style="width:98%">
  <img draggable="false" style="width: 200px" src="../assets/img/vue.png">
  <img draggable="false" style="width: 400px;position: absolute;margin-left: 120px;margin-top: 33px;" src="../assets/img/ele.png">
 </div>
 <p style="font-weight: 200;">此beta版本实现功能:超级管理员/管理员,未实现普通用户界面(主要是太懒)</p>
 <p style="font-weight: 200;">功能实现:轮播图CURD,视频/视频分类CURD,发现/话题版块CURD,用户反馈查看,修改密码,修改用户资料</p>
</div> 
</template>

<script>
	export default {
        created() {
          this.$store.dispatch('setTitlename', {name:'控制中心'})
        }
    }
</script>

<style>

</style>