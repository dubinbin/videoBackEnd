<template>
  <div class="carousel_uplaod">
  <div style="margin: 20px;"></div>
  <el-form :label-position="labelPosition">
   <el-form-item label="名称">
      <el-input v-model="bannerName"></el-input>
    </el-form-item> 
    <p class="uploadPicText">上传图片</p>
    <el-upload
      accept ='image/*'
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
    <el-button class="addBanner" type="primary" @click="addBanner">增加轮播图</el-button>
  </el-form>
	</div>
</template>

<script>
  export default {
    data() {
      return {
        fileList: [],
        bannerName:'',
        imgSrc:''
      };
    },
    created() {
       this.$store.dispatch('setTitlename', {name:'轮播图上传'})
    },
    methods: {
      handleAvatarSuccess(res, file) {
        this.imgSrc = res;
      },
      addBanner() {
        this.$http.post('/api/bannerAdd',{
         bannerName: this.bannerName,
         bannerSrc: this.imgSrc
        }).then((response) => {
          console.log(response);
        })
        this.$router.push('/carousel');
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