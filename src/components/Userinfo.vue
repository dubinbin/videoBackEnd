<template>
    <div class="userinfo" style="width:60%">
    <div style="margin: 20px;"></div>
    <el-form :label-position="labelPosition" label-width="80px" ref="setPsw">
      <el-form-item label="密码">
        <el-input v-model="password" type="password"></el-input>
      </el-form-item>
      <el-form-item label="确认密码">
        <el-input v-model="passwordRepeat" type="password"></el-input>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" @click="savePsw()">提交</el-button>
        <el-button @click="resetForm()">重置</el-button>
      </el-form-item>
    </el-form>
	</div>
</template>

<script>
import { mapState } from 'vuex';
import { LOCALHOST_URL } from '../assets/js/localhost.js'

  export default {
    data() {
      return {
        labelPosition: 'top',
         password: '',
         passwordRepeat: ''
      }
    },
    created() {
       this.$store.dispatch('setTitlename', {name:'修改密码'})
    },
    methods: {
      savePsw() {
        if(this.password != this.passwordRepeat){
          alert('唔吼')
        }
        else{
          this.$http.post(''+LOCALHOST_URL+'/api/setPsw',{
           id :this.$store.state.user.id,
           password: this.passwordRepeat,
           repeatPsw: this.password
          }).then((response) => {
            this.setPswResponse(response)
          },(response)=>{
            console.log(response)
           }
          )
         }
       },
      setPswResponse(response){
          let body = response.body;
          if (body.state === '修改成功') {
            this.$message({
              type: 'success',
              message: '修改成功!请重新登录'
            });
            this.$router.push('/login');
          }else{
             this.$message({
              message: '修改失败',
              type: 'warning'
            });
          }
      },
      resetForm() {
        this.password = '';
        this.passwordRepeat ='';
      }
    }
  }
</script>

<style>
.el-upload{
	margin-left: 104px;
  margin-bottom: 31px;
}	
</style>