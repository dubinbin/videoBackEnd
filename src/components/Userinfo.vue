<template>
    <div class="userinfo" style="width:60%">
    <div style="margin: 20px;"></div>
    <el-form :label-position="labelPosition" label-width="80px" :model="setPsw" ref="setPsw">
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
  export default {
    data() {
      return {
        labelPosition: 'top',
         password: '',
         userName:'admin',
         passwordRepeat: ''
      }
    },
    created() {
       this.$store.dispatch('setTitlename', {name:'管理员密码'})
    },
    methods: {
      savePsw() {
        if(this.password != this.passwordRepeat){
          alert('唔吼')
        }
        else{
          this.$http.post('/api/setPsw',{
           password: this.passwordRepeat,
           userName: this.userName,
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
        console.log(response)
          let body = response.body;
          if (body.state === '修改成功') {
              this.$router.push('/admin')
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