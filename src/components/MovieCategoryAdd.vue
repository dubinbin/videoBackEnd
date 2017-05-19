<template>
  <div class="MovieCategoryEdit">
  <div style="margin: 20px;"></div>
  <el-form :label-position="labelPosition" label-width="80px" :model="formLabelAlign">
    <el-form-item label="名称">
      <el-input v-model="categoryName"></el-input>
    </el-form-item>

    <el-form-item>
      <el-button type="primary" @click="addCategory">提交</el-button>
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
          categoryName:''
      }
    },
    created() {
       this.$store.dispatch('setTitlename', {name:'影片分类增加'})
    },
    methods: {
      addCategory() {
        this.$http.post('/api/movieCategoryAdd',{
          categoryName: this.categoryName
        }).then((response) => {
          console.log(response);
        })
        this.$router.push('/movieCategoryList')
         this.$message({
           type: 'success',
           message: '上传成功!'
        });
      },
      resetForm(){
        this.categoryName = ''
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