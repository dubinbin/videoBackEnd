<template>
  <div class="header">
	   <h1 class="systemName">后台管理系统</h1>
     <div class="userNow">
       <el-dropdown :hide-on-click="false">
      <span class="el-dropdown-link">
       {{time}}好 : {{user.name}}<i class="el-icon-caret-bottom el-icon--right"></i>
      </span>
      <el-dropdown-menu slot="dropdown">
        <el-dropdown-item><router-link :to="{path:'userinfo'}" tag="span">个人资料</router-link></el-dropdown-item>
        <el-dropdown-item><span @click="logout">登出</span></el-dropdown-item>
      </el-dropdown-menu>
    </el-dropdown>
     </div>
	</div>
</template>

<script>
import {mapState}  from 'vuex'
import { LOCALHOST_URL } from '../assets/js/localhost.js'

  export default {
    methods: {
      logout() {
        this.$http.post(''+LOCALHOST_URL+'/api/logout').then((response) => {
            this.$store.commit('SET_USER', {name: ''})
            this.$router.push('/')
            this.$message({
                message: '已登出',
                type: 'success'
            });
          },(response)=>{
            console.log(response)
           }
          )
        }
      },
      computed: mapState({
        time(){
          let hours = new Date().getHours()
          if (hours > 5 && hours < 12) {
            return '早上'
          } else if (hours > 11 && hours < 19) {
            return '下午'
          } else {
            return '晚上'
          }
        },
        user(){
          var getUserName = window.localStorage.getItem('userName');
          if(this.$store.state.user.name ==''){
             this.$store.commit('GET_USER', {name: getUserName})
          }
          return this.$store.state.user;
        }
      })
  }
</script>

<style>
.header{
    background: #fff;
    box-shadow: 0px 0px 6px #b9b8b8;
    z-index: 122;
    position: fixed;
    height: 45px;
    width: 100%;
}
.systemName{
    position: absolute;
    top: 15px;
    left: 15px;
    font-size: 16px;
    font-weight: 200;
}
.userNow{
    position: absolute;
    right: 2%;
    cursor: pointer;
    top: 15px;
    font-size: 17px;
}
</style>