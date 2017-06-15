<template>
<el-form ref="form"  label-width="80px" action="api/info">
<myCanvas></myCanvas>
<el-row>
  <el-col :span="8"><div class="grid-content"></div></el-col>
  <el-col :span="8">
     <div class="grid-content login">
        <p class="loginTitle">登陆  | Login</p>
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
import myCanvas from  './MyCanvas.vue'
import { LOCALHOST_URL } from '../assets/js/localhost.js'

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
        this.$http.post(''+LOCALHOST_URL+'/api/login',{
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
          if(body.state === '密码错误'){
             this.$message({
              message: '密码错误',
              type: 'warning'
            });
          }else if(body.state==='账号不存在'){
              this.$message({
              message: '账号不存在',
              type: 'warning'
            });
          }else{
            this.$message({
                message: '登陆成功',type: 'success'
            });
           let userid = body[0].id;
           this.$store.dispatch('setUsername', {name: this.userName,id: userid});
           this.$router.push('/mainboard');
          }       
         }
      },
      components:{
        myCanvas
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