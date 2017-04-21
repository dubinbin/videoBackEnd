<template>
<el-form ref="form" :model="form" label-width="80px" action="api/info">
<el-row>
  <el-col :span="8"><div class="grid-content"></div></el-col>
  <el-col :span="8">
     <div class="grid-content login">
        <p class="loginTitle">登陆| Login</p>
  		<el-input type="text" v-model="userName" placeholder="请输入你的用户名"></el-input>
  		<el-input type="password" v-model="password" placeholder="请输入你的密码"></el-input>
  		 <el-button type="info" @click="login">登陆</el-button>
     </div>
  </el-col>
  <el-col :span="8"><div class="grid-content"></div></el-col>
</el-row>
</el-form>
</template>

<script>
	export default {
	  data() {
	    return {
	      userName: '',
	      password: ''
	    }
	  },
   methods:{
      login() {
        this.userName = this.userName.trim()
        this.$http.post('/api/login',{
          userName: this.userName,
          password: this.password
        }).then((response) => {
          this.loginResponse(response)
          },(response)=>{
            console.log(response)
          }
        )
      },
      loginResponse(response){
          let body = response.body;
          if (body.state === '登陆成功') {
              this.$router.push('/admin')
          }
          else if(body.state === '密码错误'){
              alert('密码错误喽')
          }
          else{
            alert('h')
          }
         }
      }
    }
</script>

<style>
  .login{
  	padding-top: 15%;
  }
  .el-row {
    margin-bottom: 20px;
    &:last-child {
      margin-bottom: 0;
    }
  }
  .loginTitle{
  	text-align: center;
  	color: #504b4b;
  	margin-bottom: 4%;
    font-weight: 200;
  }
  .el-input{
  	margin-bottom: 20px;
  }
  .grid-content {
    min-height: 36px;
  }
  .row-bg {
    padding: 10px 0;
  }
</style>