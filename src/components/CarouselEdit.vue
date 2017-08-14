<template>
  <div class="carousel_edit">
  <div style="margin: 20px;"></div>
  <el-form :label-position="labelPosition">
   <el-form-item label="名称">
      <el-input v-model="bannerName"></el-input>
    </el-form-item> 
    <p class="uploadPicText">原图</p>
    <div class="orginPic">
      <img width="200" :src="originPic">
    </div>
    <p class="uploadPicText">上传图片</p>
    <el-upload
      class="upload"
      ref="upload"
      action="http://back.dubinbin.cn:8080/api/uploadPic"
      name="banner"
      :on-preview="handlePreview"
      :on-success="handleAvatarSuccess"
      :on-remove="handleRemove"
      :file-list="fileList"
      :auto-upload="false">
      <el-button slot="trigger" size="small" type="primary">选取文件</el-button>
      <el-button style="margin-left: 10px;" size="small" type="success" @click="submitUpload()">上传到服务器</el-button>
      <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb,且一次只能上传一张</div>
    </el-upload>
    <el-button class="addBanner" type="primary" @click="EditBanner">增加轮播图</el-button>
  </el-form>
  </div>
</template>

<script>
import { LOCALHOST_URL } from '../assets/js/localhost.js'

  export default {
    data() {
      return {
        fileList: [],
        bannerName:'',
        NewimgSrc:'',
        originPic:'',
        getImgSrc:''
      };
    },
    created() {
        this.$store.dispatch('setTitlename', {name:'轮播图编辑'})
        const id = this.$route.query.id;
        this.$http.get(''+LOCALHOST_URL+'/api/bannerEdit',{
          params:{id : id}
        }).then((response)=>{
          let body = response.body;
          this.bannerName = body[0].title;
          this.getImgSrc = body[0].url;     //未处理原地址
          this.originPic = LOCALHOST_URL + body[0].url.substring(1);  //这个给原图用的地址
        })
    },
    methods: {
      submitUpload() {
        this.deletePic();
        this.$refs.upload.submit();    
      }, 
      handleAvatarSuccess(res, file) {
        this.NewimgSrc = res;  //上传获得地址
      },
      //删除功能正常
      deletePic() {
        this.$http.post(''+LOCALHOST_URL+'/api/deletePic',{
         imgSrc: this.getImgSrc
        }).then((response) => {
           console.log('成功')
         },(response)=>{
            console.log(response)
        });  
      },

      EditBanner() {
        const id = this.$route.query.id;
        if(this.NewimgSrc=='' || this.NewimgSrc==null || this.NewimgSrc=='undefined' ){      
        this.$http.post(''+LOCALHOST_URL+'/api/bannerUpload',{
            bannerName: this.bannerName,
            bannerSrc: this.getImgSrc,
            id : id
          }).then((response) => {
            this.$router.push('/carousel');
            console.log(response);
          })
        }else{
            this.$http.post(''+LOCALHOST_URL+'/api/bannerUpload',{
                bannerName: this.bannerName,
                bannerSrc: this.NewimgSrc,
                id : id
              }).then((response) => {
                this.$router.push('/carousel');
                console.log(response);
              })
          }
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