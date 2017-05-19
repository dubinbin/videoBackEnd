<template>
  <div class="userinfoedit">
  <div style="margin: 20px;"></div>
  <el-form :label-position="labelPosition">
   <el-form-item label="名称">
      <el-input v-model="userName"></el-input>
    </el-form-item> 
    <p class="uploadPicText">原图</p>
    <div class="orginPic">
      <img width="200" :src="originPic">
    </div>
    <p class="uploadPicText">上传图片</p>
    <el-upload
      class="upload"
      ref="upload"
      action="/api/uploadPic"
      name="upload"
      :on-preview="handlePreview"
      :on-success="handleAvatarSuccess"
      :on-remove="handleRemove"
      :file-list="fileList"
      :auto-upload="false">
      <el-button slot="trigger" size="small" type="primary">选取文件</el-button>
      <el-button style="margin-left: 10px;" size="small" type="success" @click="submitUpload">上传到服务器</el-button>
      <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb,且一次只能上传一张</div>
    </el-upload>
    <el-button class="addBanner" type="primary" @click="uploadinfo">修改完成</el-button>
  </el-form>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        fileList: [],
        userName:'',
        imgSrc:'',
        originPic:''
      };
    },
    created() {
        this.$store.dispatch('setTitlename', {name:'用户资料修改'})
        const id = this.$route.query.id
        this.$http.get('/api/userinfoEdit',{
          params:{id : id}
        }).then((response)=>{
          let body = response.body;
          this.userName = body[0].username;
          this.originPic = body[0].thumb;
        })
    },
    methods: {
      handleAvatarSuccess(res, file) {
        this.imgSrc = res;
      },
      uploadinfo() {
        const id = this.$route.query.id;
        if(this.imgSrc ==''){
          this.originPic === this.imgSrc;
        }
        this.$http.post('/api/userinfoUpload',{
          userName: this.userName,
          thumb: this.imgSrc,
          id : id
        }).then((response) => {
          console.log(response);
        })
        this.$router.push('/userManage')
         this.$message({
           type: 'success',
           message: '上传成功!'
        });
      },
      submitUpload() {
        this.$refs.upload.submit();    
      }, 
      handleRemove(file, fileList) {
        console.log(file, fileList);
      },
      handlePreview(file) {
        console.log(file);
      }
    }
  }
</script>

<style>
.uploadPicText{
  font-size: 13px;
  margin-bottom: 16px;
}
.addBanner{
  margin-top: 20px!important;
}
.el-upload{
  margin-left: 0;
  margin-bottom: 31px;
}
.el-upload-list{
  margin-bottom: 25px;
}
</style>