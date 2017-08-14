<template>
  <div class="carousel">
        <el-table
            :data="tableData"
            height="250"
            border
            style="width: 100%">
            <el-table-column
            prop="uName"
            label="用户"
            width="120">
            </el-table-column>
            <el-table-column
            prop="title"
            label="标题"
            width="120">
            </el-table-column>
            <el-table-column
            prop="content"
            label="内容"
            width="250">
            </el-table-column>          
            <el-table-column
            prop="contact"
            label="联系方式">
             </el-table-column>   
            </el-table-column>          
            <el-table-column
            prop="time"
            label="时间">
             </el-table-column>   
        </el-table>
      <router-view></router-view>
  </div>
</template>

<script>
import { LOCALHOST_URL } from '../assets/js/localhost.js'

  export default {
    data() {
      return {
        tableData: []
      }
    },
    created() {
        this.$store.dispatch('setTitlename', {name:'用户反馈'})

        // 取到后端数据并渲染到表格中
        this.$http.get(''+LOCALHOST_URL+'/api/userfeedback').then((response)=>{
          let body = response.body;
          var data = [];
          let _this = this;
          for(let i=0;i<body.length;i++){
            var obj = {};
            obj.title = body[i].title;
            obj.content = body[i].content;
            obj.uName = body[i].uName;
            obj.time = body[i].time;
            obj.contact = body[i].contact;
            data[i] = obj;
          }
          _this.tableData = data;
        })
    }
  }
</script>

<style>

</style>