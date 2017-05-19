<template>
  <div id="summernote"></div>
</template>

<script>
import $ from 'jquery';

export default {
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
        var IMAGE_PATH = 'http://localhost:9000/';
        Picdata.append('upload',files[0]);

        $.ajax({
            url: '/api/uploadEditorPic',
            type: 'POST',
            cache: false,
            data: Picdata,
            processData: false,
            contentType: false
            }).success(function(res) {
                let changeUrl = IMAGE_PATH + res.substring(2);
                $('#summernote').summernote("insertImage", changeUrl);  
            }).fail(function(res) {
                console.log('error')
            });
    }, 
}
</script>

<style>

</style>


