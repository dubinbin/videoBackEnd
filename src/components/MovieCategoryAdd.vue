<template>
  <div class="movieCategoryAdd">
  <div style="margin: 20px;"></div>
  <el-form :label-position="labelPosition" label-width="80px" :model="formLabelAlign">
    <el-form-item label="话题">
      <el-input v-model="formLabelAlign.name"></el-input>
    </el-form-item>

    <el-form-item label="类别">
      <el-input v-model="formLabelAlign.name"></el-input>
    </el-form-item>

     <el-form-item label="简介">
      <el-input v-model="formLabelAlign.name"></el-input>
    </el-form-item>


    <el-form-item>
      <el-button type="primary" @click="submitForm('ruleForm2')">提交</el-button>
      <el-button @click="resetForm('ruleForm2')">重置</el-button>
    </el-form-item>
  </el-form>
	</div>
</template>

<script>
  export default {
    data() {
      return {
          labelPosition: 'top',
          formLabelAlign: {
          name: '',
          region: '',
          type: '',
          fileList2: [{name: 'food.jpeg', url: 'https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100'}, {name: 'food2.jpeg', url: 'https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100'}]
        }
      }
    },
    methods: {
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
.el-upload{
  margin-left: 0;
  margin-bottom: 31px;
}
.el-upload-list{
  margin-bottom: 25px;
}
</style>