<template>
  <div class="found">
  <div style="margin: 20px;"></div>
  <el-form :label-position="labelPosition" label-width="80px">
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

    <p class="uploadPicText">上传封面</p>
    <el-upload
      class="upload"
      ref="upload"
      action="http://back.dubinbin.cn:8080/api/uploadEditorPic"
      name="upload"
      :on-preview="handlePreview"
      :on-success="uploadPicCallback"
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
        <div id="summernote" v-loading.body="loading"></div>
      </div>

    <el-form-item>
      <el-button type="primary" @click="addTopic">提交</el-button>
      <el-button @click="resetForm">重置</el-button>
    </el-form-item>
  </el-form>
	</div>
</template>

<script>
import $ from 'jquery';
import { mapState } from 'vuex';
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
          content:'',
          coverPic:'',
          topicId:'',
          article:'',
          loading: false
        }
    },
    created () {
       this.$store.dispatch('setTitlename', {name:'话题新增'})
       this.$http.get(''+LOCALHOST_URL+'/api/topicCategoryList').then((response)=>{
          let body = response.body;
          this.topicCategory = body;
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
            this.loading = true;

            $.ajax({
                url: ''+LOCALHOST_URL+'/api/uploadEditorPic',
                type: 'POST',
                cache: false,
                data: Picdata,
                processData: false,
                contentType: false
              }).success(function(res) {
                  this.loading = false;
                  let changeUrl = LOCALHOST_URL + res.substring(1);
                 $('#summernote').summernote("insertImage", changeUrl);  
              }).fail(function(res) {
                  console.log('error')
            })
          }
        }
      })
    },
    methods: {
      addTopic() {
        let sendDate = new Date();
        let serializeDate = formatDate(sendDate, 'yyyy-MM-dd hh:mm');
        let sendArticle = $('#summernote').summernote('code');
        var id = this.$route.query.id
        this.$http.post(''+LOCALHOST_URL+'/api/topicAdd',{
          topicName: this.topicName,
          content : this.content,
          coverPic: this.coverPic,
          categoryId: this.topicId,
          id : id,
          uid:this.$store.state.user.id,
          article: sendArticle,
          time :serializeDate
        }).then((response) => {
           this.$router.push('/foundTopicList')
         },(response)=>{
            console.log(response)
        });
      },
      submitUpload() {
        this.$refs.upload.submit();    
      }, 
      uploadPicCallback(res,file) {
        this.coverPic = res;
      },
      resetForm() {
      },
      handleRemove(file, fileList) {
        console.log(file, fileList);
      },
      handlePreview(file) {
        console.log(file);
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
</script>

<style scoped>
@import '../assets/css/bootstrap_delete.css';
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