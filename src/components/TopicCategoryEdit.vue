<template>
  <div class="topicCategoryEdit">
  <div style="margin: 20px;"></div>
  <el-form :label-position="labelPosition" label-width="80px" :model="formLabelAlign">
    <el-form-item label="名称">
      <el-input v-model="topicCategoryName"></el-input>
    </el-form-item>

    <el-form-item>
      <el-button type="primary" @click="uploadCategory">提交</el-button>
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
          topicCategoryName:''
      }
    },
    created() {
        this.$store.dispatch('setTitlename', {name:'话题分类编辑'})
        const id = this.$route.query.id
        this.$http.get('/api/topicCategoryEdit',{
          params:{id : id}
        }).then((response)=>{
          let body = response.body;
          this.topicCategoryName = body[0].name;
        })
     },  
    methods: {
      uploadCategory() {
        const id = this.$route.query.id;
        this.$http.post('/api/movieCategoryUpload',{
          topicCategoryName: this.topicCategoryName,
          id : id
        }).then((response) => {
          console.log(response);
        })
        this.$router.push('/topicCategory')
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