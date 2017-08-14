<template>
  <div class="foundedit">
  <div style="margin: 20px;"></div>
  <el-form :label-position="labelPosition" label-width="80px" :model="formLabelAlign">
    <el-form-item label="话题">
      <el-input v-model="topicName"></el-input>
    </el-form-item>

    <el-form-item label="类别">
      <el-select v-model="topicId" placeholder="请选择">
        <el-option
          v-for="item in topicCategory"
          :label="item.name"
          :value="item.tid"
          :key="item.tid">
        </el-option>
      </el-select>
    </el-form-item>

     <el-form-item label="简介">
     <el-input
      type="textarea"
      :rows="2"
      placeholder="请输入内容"
      v-model="content">
    </el-input>
    </el-form-item>

    <div class="orginPic">
       <p>原图</p>
       <img width="200" :src="coverPic">
     </div>

    <p class="uploadPicText">上传封面</p>
    <el-upload
      class="upload"
      ref="upload"
      action="http://back.dubinbin.cn:8080/api/uploadEditorPic"
      name="upload"
      :on-preview="handlePreview"
      :on-success="uploadPicSuccess"
      :on-remove="handleRemove"
      :file-list="fileList"
      :auto-upload="false">
      <el-button slot="trigger" size="small" type="primary">选取文件</el-button>
      <el-button style="margin-left: 10px;" size="small" type="success" @click="submitUpload">上传到服务器</el-button>
      <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb,且一次只能上传一张</div>
    </el-upload>

      <div class="editor-area">
        <el-form-item label="文章"></el-form-item>
        <!-- editor -->
        <textarea id="summernote"></textareas>
      </div>

    <el-form-item>
      <el-button type="primary" @click="editTopic">提交</el-button>
      <el-button @click="resetForm">重置</el-button>
    </el-form-item>
  </el-form>
	</div>
</template>

<script>
import $ from 'jquery'
import {formatDate} from '../assets/js/date';
import { LOCALHOST_URL } from '../assets/js/localhost.js'
import 'bootstrap/js/modal.js'
import 'bootstrap/js/dropdown.js'
import 'bootstrap/js/tooltip.js'
import 'summernote'
import 'summernote/dist/lang/summernote-zh-CN.js'

  export default {
    data() {
      return {
          labelPosition: 'top',
          topicName: '',
          topicCategory: '',
          topicContent: '',
          fileList: [],
          options:[],
          coverPic:'',
          topicId:'',
          article:'',
          NewimgSrc:'',
          getImgSrc:''
        }
    },
    created () {
       this.$store.dispatch('setTitlename', {name:'话题编辑'})
       this.$http.get(''+LOCALHOST_URL+'/api/topicCategoryList').then((response)=>{
          let body = response.body;
          this.topicCategory = body;
        });

        let id = this.$route.query.id;
        this.$http.get(''+LOCALHOST_URL+'/api/topicEdit',{
          params:{id : id}
         }).then((response)=>{
          let body = response.body;
          this.topicName = body[0].tname;
          this.content= body[0].content;
          this.getImgSrc = body[0].coverPic;
          this.coverPic =LOCALHOST_URL+ body[0].coverPic.substring(1);
          this.topicId = body[0].categoryId;
          this.article = body[0].article;
          var getArticle = this.article;
          $('#summernote').summernote("code", getArticle); 
        })
    },
    mounted(){
      $('#summernote').summernote({
        lang:'zh-CN',
        height:300,
        minHeight:null,
        maxHeight:null,
        focus:true,
        toolbar:[
          ['style',['bold','italic','clear']],
          ['fontsize',['fontsize']],
          ['para',['ul','ol','paragraph']],
          ['insert',['picture','link','video']]
        ],
        callbacks:{
          onImageUpload:function(files){     
            var Picdata = new FormData();
            var imgUrl = null;
            Picdata.append('upload',files[0]);
            $.ajax({
                url: ''+LOCALHOST_URL+'/api/uploadEditorPic',
                type: 'POST',
                cache: false,
                data: Picdata,
                processData: false,
                contentType: false
              }).success(function(res) {
                  var imgUrl = LOCALHOST_URL + res.substring(1);
                   $('#summernote').summernote("insertImage", imgUrl);  
              }).fail(function(res) {
                  console.log('error')
              });
          }
        }
      })
    },
    methods: {
      submitUpload() {
        this.deletePic();   
        this.$refs.upload.submit(); 
      }, 
       uploadPicSuccess(res,file){
        this.NewimgSrc = res;
      },
      deletePic() {
        this.$http.post(''+LOCALHOST_URL+'/api/deletePic',{
         imgSrc: this.getImgSrc
        }).then((response) => {
           console.log('成功')
         },(response)=>{
            console.log(response)
        });  
      },
      editTopic() {
        let id = this.$route.query.id;
        let sendDate = new Date();
        let serializeDate = formatDate(sendDate, 'yyyy-MM-dd hh:mm');
        let sendArticle = $('#summernote').summernote('code');
        if(this.NewimgSrc=='' || this.NewimgSrc==null || this.NewimgSrc=='undefined' ){      
          this.$http.post(''+LOCALHOST_URL+'/api/topicUpload',{
              topicName: this.topicName,
              content : this.content,
              coverPic: this.getImgSrc,
              categoryId: this.topicId,
              id : id,
              article: sendArticle,
              time :serializeDate
            }).then((response) => {
              this.$router.push('/foundTopicList');
              console.log(response);
            })
        }else{
            this.$http.post(''+LOCALHOST_URL+'/api/topicUpload',{
                topicName: this.topicName,
                content : this.content,
                coverPic: this.NewimgSrc,
                categoryId: this.topicId,
                id : id,
                article: sendArticle,
                time :serializeDate
              }).then((response) => {
                this.$router.push('/foundTopicList');
                console.log(response);
              })
        }
      },
      resetForm() {
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
.el-upload{
  margin-left: 0;
  margin-bottom: 31px;
}
.el-upload-list{
  margin-bottom: 25px;
}
.quill-editor-area{
  margin-top: 20px;
}
.ql-container{
    height: 300px !important;
    overflow: scroll;
}
.modal-content{
  z-index: 9999!important;
}
.modal-backdrop{
  display: none;
}
.form-control{
  width: 94%!important;
}
.modal-dialog{
  margin-top: 12%!important;
}
</style>