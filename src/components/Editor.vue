<template>
  <div id="summernote"></div>
</template>

<script>
import $ from 'jquery';
import { LOCALHOST_URL } from '../assets/js/localhost.js'

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
        Picdata.append('upload',files[0]);

        $.ajax({
            url: ''+LOCALHOST_URL+'/api/uploadEditorPic',
            type: 'POST',
            cache: false,
            data: Picdata,
            processData: false,
            contentType: false
            }).success(function(res) {
                let changeUrl = LOCALHOST_URL + res.substring(1);
                $('#summernote').summernote("insertImage", changeUrl);  
            }).fail(function(res) {
                console.log('error')
            });
    }, 
}
</script>

<style>

</style>


