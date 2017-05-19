<template>
  <div class="movieUpload">
  <div style="margin: 20px;"></div>
  <el-form :label-position="labelPosition" label-width="80px">
    <el-form-item label="电影名称">
      <el-input v-model="Mname"></el-input>
    </el-form-item>

  <el-form-item label="分类"> 
    <el-select v-model="movieCid" placeholder="请选择">
      <el-option
        v-for="item in movieCategory"
        :label="item.name"
        :value="item.fid"
        :key="item.fid">
      </el-option>
    </el-select>
    </el-form-item>

     <el-form-item label="时长">
      <el-input v-model="MshowTime"></el-input>
    </el-form-item>

     <el-form-item label="上映时间">
      <template>
        <div class="block">
          <el-date-picker
            v-model="showDate"
            type="date"
            placeholder="选择日期"
            @change="dateChange">
          </el-date-picker>
        </div>
      </template>
    </el-form-item>

     <el-form-item label="简介">
      <el-input type="textarea" v-model="Mdesc"></el-input>
    </el-form-item>

     <el-form-item label="主演">
      <el-input v-model="actor"></el-input>
    </el-form-item>

     <el-form-item label="封面">
     <el-upload
      accept ='image/jpg'
      class="upload"
      ref="upload"
      action="/api/uploadPic"
      name="upload"
      :on-success="uploadPicSuccess"
      :on-remove="handleRemove"
      :file-list="fileList"
      :auto-upload="false">
      <el-button slot="trigger" size="small" type="primary">选取文件</el-button>
      <el-button style="margin-left: 10px;" size="small" type="success" @click="PicUpload">上传到服务器</el-button>
      <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb,且一次只能上传一张</div>
    </el-upload>
    </el-form-item>

   <el-form-item label="视频上传">
     <el-upload
      accept="video/mp4"
      class="upload"
      ref="video"
      action="/api/addVideo"
      name="video"
      :on-success="uploadVideoSuccess"
      :on-remove="handleRemove"
      :file-list="fileList2"
      :auto-upload="false">
      <el-button slot="trigger" size="small" type="primary">选取文件</el-button>
      <el-button style="margin-left: 10px;" size="small" type="success" @click="videoUpload">上传到服务器</el-button>
      <div slot="tip" class="el-upload__tip">只能上传视频(mp4)文件，且不超过500M,且一次只能上传一个</div>
    </el-upload>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="moiveAdd">提交</el-button>
      <el-button>重置</el-button>
    </el-form-item>
  </el-form>
	</div>
</template>

<script>

  export default {
    data() {
      return {
          labelPosition: 'top',
          Mname: '',    //电影名
          MshowTime:'',  //上映时间
          Mdesc:'',     //简述
          actor:'',   //演员
          fileList: [],   //截图上传区
          fileList2:[],   //视频上传区
          movieCategory:[],  //影片分类 GET请求
          movieCid:'',      //影片类别 id(所选) POST请求
          moviePlayTime:'',  //播放时长
          showDate: '',       //上映日期
          videoSrc:'',
          picSrc:''
      }
    },
    created (){
      this.$store.dispatch('setTitlename', {name:'视频上传'})
      this.$http.get('/api/movieCategoryList').then((response)=>{
          let body = response.body;
          this.movieCategory = body;
        })
    },
    methods: {
      videoUpload() {
        this.$refs.video.submit();    
      }, 
      PicUpload() {
        this.$refs.upload.submit();
      },
      uploadVideoSuccess(res, file) {
        this.videoSrc = res;
      },
      uploadPicSuccess(res, file){
        this.picSrc = res;
      },
      handleRemove(file, fileList) {
        console.log(file, fileList);
      },
      handlePreview(file) {
        console.log(file);
      },
      dateChange(val) {
        this.showDate = val;
      },
      //提交影片
      moiveAdd(){
        this.$http.post('/api/movieAdd',{
          movieName: this.Mname,
          PicSrc : this.picSrc,
          showTime: this.showDate,
          content: this.Mdesc,
          movieUrl: this.videoSrc,
          moviePlayTime: this.MshowTime + 'min',
          BelongId: this.movieCid,
          actor: this.actor
        }).then((response) => {
           console.log('成功')
         },(response)=>{
            console.log(response)
        });
        this.$router.push('/movielist')
         this.$message({
           type: 'success',
           message: '上传成功!'
        });
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