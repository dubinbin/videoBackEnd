<template>
  <div class="carousel">
  <div style="margin: 20px;"></div>
  <el-form :label-position="labelPosition" label-width="80px" :model="formLabelAlign">
<!--     <el-form-item label="名称(没什么作用，仅用于标记)">
      <el-input v-model="formLabelAlign.name"></el-input>
    </el-form-item> -->
    <el-upload
      class="avatar-uploader"
      action="/api/upload"
      name="logo"
      :show-file-list="false"
      :on-success="handleAvatarSuccess"
      :before-upload="beforeAvatarUpload">
      <img v-if="imageUrl" :src="imageUrl" class="avatar">
      <i v-else class="el-icon-plus avatar-uploader-icon"></i>
    </el-upload>

    <el-form-item>
      <el-button type="primary"  @click="upload">提交</el-button>
      <el-button @click="resetForm">重置</el-button>
    </el-form-item>
  </el-form>
	</div>
</template>

<script>
  export default {
    data() {
      return {
          labelPosition: 'top',
          // formLabelAlign: {
          //   name: '',
          //   type: '',
          //    },
          imageUrl: ''
          }
     },
    methods: {
      handleAvatarSuccess(res, file) {
        this.imageUrl = URL.createObjectURL(file.raw);
      },
      uploadPic(){
        alert('h');
      },
      beforeAvatarUpload(file) {
        const isJPG = file.type === 'image/jpeg';
        const isLt2M = file.size / 1024 / 1024 < 2;

        if (!isJPG) {
          this.$message.error('上传头像图片只能是 JPG 格式!');
        }
        if (!isLt2M) {
          this.$message.error('上传头像图片大小不能超过 2MB!');
        }
        return isJPG && isLt2M;
      },
      resetForm(){
         this.formLabelAlign.name = '';
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