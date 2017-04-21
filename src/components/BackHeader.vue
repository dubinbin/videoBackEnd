<template>
  <div class="header">
	   <h1 class="systemName">管理系统</h1>
     <div class="userNow">
       <el-dropdown :hide-on-click="false">
      <span class="el-dropdown-link">
        当前用户 : admin<i class="el-icon-caret-bottom el-icon--right"></i>
      </span>
      <el-dropdown-menu slot="dropdown">
        <el-dropdown-item><router-link :to="{path:'userinfo'}">个人资料</router-link></el-dropdown-item>
        <el-dropdown-item @click="logout">登出</el-dropdown-item>
      </el-dropdown-menu>
    </el-dropdown>
     </div>
	</div>
</template>

<script>
  export default {
    methods: {
      logout() {
       console.log('hello');
      }
    }
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
    top: 15px;
    font-size: 17px;
}
</style>