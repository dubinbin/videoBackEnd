<template>
  <div class="topicCategoryEdit">
  <div style="margin: 20px;"></div>
  <el-form :label-position="labelPosition" label-width="80px" >
    <el-form-item label="名称">
      <el-input v-model="topicCategoryName"></el-input>
    </el-form-item>

    <el-form-item>
      <el-button type="primary" @click="addCategory">提交</el-button>
      <el-button @click="resetForm()">重置</el-button>
    </el-form-item>
  </el-form>
  </div>
</template>

<script>
import { LOCALHOST_URL } from '../assets/js/localhost.js'
  export default {
    data() {
      return {
          labelPosition: 'top',
          topicCategoryName:'',
      }
    },
    created() {
       this.$store.dispatch('setTitlename', {name:'话题类别增加'})
    },
    methods: {
      addCategory() {
        this.$http.post(''+LOCALHOST_URL+'/api/topicCategoryAdd',{
          topicCategoryName: this.topicCategoryName
        }).then((response) => {
          this.$router.push('/topicCategory')
          this.$message({
            type: 'success',
            message: '上传成功!'
          });
        })
      },
      resetForm(){
        this.topicCategoryName = ''
      }
    }
  }
</script>

<style>
.el-upload{
  margin-left: 0;
  margin-bottom: 31px;
}
.el-upload-list{
  margin-bottom: 25px;
}
</style>