<template>
  <div class="movieEdit">
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
            :picker-options="pickerOptions0"
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

     <div class="orginPic">
       <p>原图</p>
       <img width="200" :src="picSrc">
     </div>
     <el-form-item label="封面">
     <el-upload
      accept ='image/jpg'
      class="upload"
      ref="upload"
      action="http://back.dubinbin.cn:8080/api/uploadMoviePic"
      name="movie"
      :on-success="uploadPicSuccess"
      :on-remove="handleRemove"
      :file-list="fileList"
      :auto-upload="false">
      <el-button slot="trigger" size="small" type="primary">选取文件</el-button>
      <el-button style="margin-left: 10px;" size="small" type="success" @click="PicUpload">上传到服务器</el-button>
      <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb,且一次只能上传一张</div>
    </el-upload>
    </el-form-item>

   <div class="orginVideo">
    <p>原视频</p>
    <video width="200" :src="videoSrc"></video>
   </div>
   <el-form-item label="视频上传">
     <el-upload
      accept="video/mp4"
      class="upload"
      ref="video"
      action="http://back.dubinbin.cn:8080/api/addVideo"
      name="video"
      :on-success="uploadVideoSuccess"
      :on-remove="handleRemove"
      :file-list="fileList2"
      :auto-upload="false">
      <el-button slot="trigger" size="small" type="primary">选取文件</el-button>
      <el-button style="margin-left: 10px;" size="small" type="success" @click="uploadVideo()">上传到服务器</el-button>
      <div slot="tip" class="el-upload__tip">只能上传视频(mp4)文件，且不超过500M,且一次只能上传一个,修改将会直接覆盖原视频,此操作不可逆</div>
     </el-upload>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="moiveUpload">修改</el-button>
      <el-button>重置</el-button>
    </el-form-item>
  </el-form>
  </div>
</template>

<script>
import { LOCALHOST_URL } from '../assets/js/localhost.js'
import { mapState } from 'vuex';

  export default {
    data() {
      return {
          labelPosition: 'top',
          getImgSrc:'', //获得的影片封面url
          getVideoSrc:'',//获得的影片url
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
          videoSrc:'',       //视频url
          picSrc:'',         //照片url
          NewimgSrc:'',      //新上传的地址
          NewvideoSrc:''     //新上传的视频地址
      }
    },
    created (){
        this.$store.dispatch('setTitlename', {name:'影片编辑'})
        this.$http.get(''+LOCALHOST_URL+'/api/movieCategoryList').then((response)=>{
          let body = response.body;
          this.movieCategory = body;
        });

        var id = this.$route.query.id
        this.$http.get(''+LOCALHOST_URL+'/api/movieEdit',{
          params:{id : id}
         }).then((response)=>{
          let body = response.body;
          this.Mname = body[0].Mname;
          this.showDate = body[0].showTime;
          this.Mdesc = body[0].content;
          this.actor= body[0].Actor;
          this.getImgSrc = body[0].PicUrl;     //获取的未处理图片原地址
          this.getVideoSrc = body[0].movieUrl; //获取的未处理视频原地址
          this.videoSrc =LOCALHOST_URL + body[0].movieUrl.substring(1);//处理的原封面地址
          this.picSrc = LOCALHOST_URL + body[0].PicUrl.substring(1);//处理的原视频地址
          this.movieCid = body[0].fid;
          this.MshowTime = body[0].moviePlayTime;
        })
    },
    methods: {
      PicUpload() {
        this.deletePic();
        this.$refs.upload.submit();
      },
      uploadVideoSuccess(res, file) {
        this.NewvideoSrc = res;
         console.log(this.NewvideoSrc);
      },
      uploadPicSuccess(res, file){
        this.NewimgSrc = res;
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
      uploadVideo() {
        this.deleteOldVideo();
        this.$refs.video.submit();  
      }, 
      deleteOldVideo() {
        this.$http.post(''+LOCALHOST_URL+'/api/deleteVideo',{
         videoSrc:this.getVideoSrc
        }).then((response) => {
           console.log('成功')
         },(response)=>{
            console.log(response)
        });   
      },
      //删除新图片
      deletePic() {
        this.$http.post(''+LOCALHOST_URL+'/api/deletePic',{
         imgSrc: this.getImgSrc
        }).then((response) => {
           console.log('成功')
         },(response)=>{
            console.log(response)
        });  
      },
      movieSubmit(picUrl,movieUrl){
         var id = this.$route.query.id;
         this.$http.post(''+LOCALHOST_URL+'/api/moiveUpload',{
            movieName: this.Mname,
            PicSrc : picUrl,
            showTime: this.showDate,
            content: this.Mdesc,
            id : id,
            movieUrl: movieUrl,
            moviePlayTime: this.MshowTime + 'min',
            BelongId: this.movieCid,
            uid:this.$store.state.user.id,
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
      },
      //提交影片
      moiveUpload(){
        if(this.NewimgSrc=='' || this.NewimgSrc==null || this.NewimgSrc=='undefined'){      
           if(this.NewvideoSrc=='' || this.NewvideoSrc==null || this.NewvideoSrc=='undefined'){
              this.movieSubmit(this.getImgSrc, this.getVideoSrc);   
           }
           else{
              //用户只上传了视频
              this.movieSubmit(this.getImgSrc, this.NewvideoSrc);          
           }
        }else if(this.NewimgSrc!='' && this.NewimgSrc!=null && this.NewimgSrc!='undefined'){
          if(this.NewvideoSrc=='' || this.NewvideoSrc==null || this.NewvideoSrc=='undefined' ){
            //用户只上传了图片 success
            this.movieSubmit(this.NewimgSrc, this.getVideoSrc);
          }else{
             //用户又上传视频又上传了图片
             this.movieSubmit(this.NewimgSrc, this.NewvideoSrc);         
          }
        }
        else{
         console.log('不可能会有这种情况了亲')
        }
    },
    computed:mapState({
        user(){
          var getUserName = window.localStorage.getItem('userName');
          if(this.$store.state.user.name ==''){
              this.$store.commit('GET_USER', {name: getUserName})
          }
            return this.$store.state.user;
          }
      })
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