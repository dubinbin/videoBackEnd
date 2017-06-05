<template>
<div class="movieCommentlist">
  <el-table
    :data="tableData"
    border
    style="width: 100%">
     <el-table-column
      label="评论于"
      width="150">
      <template scope="scope">
        <span>{{ scope.row.Mname }}</span>
      </template>
    </el-table-column>
    <el-table-column
      label="评论"
      width="100">
      <template scope="scope">
        <span>{{ scope.row.comment | ellipsis}}</span>
      </template>
    </el-table-column>
    <el-table-column
      label="评论用户"
      width="100">
      <template scope="scope">
          <div slot="reference" class="name-wrapper">
            <el-tag>{{ scope.row.username }}</el-tag>
          </div>
      </template>
    </el-table-column>
     <el-table-column
      label="评论时间"
      width="120">
      <template scope="scope">
        <el-icon name="time"></el-icon>
        <span>{{ scope.row.time }}</span>
      </template>
    </el-table-column>

    <el-table-column
      label="审核通过"
      width="100">
      <template scope="scope"> 
          <div slot="reference" class="name-wrapper">
            <span>{{ scope.row.enable }}</span>
          </div>
      </template>
    </el-table-column>
    <el-table-column label="操作">
      <template scope="scope">
         <el-button
          size="small"
          type="warning"
          v-if="scope.row.enable =='是'"
          @click="banComment(scope.row.id, scope.row)">屏蔽</el-button>
          <el-button
          size="small"
          type="info"
          v-if="scope.row.enable =='否'"
          @click="unBanComment(scope.row.id, scope.row)">解封</el-button>
        <el-button
          size="small"
          type="danger"
          @click="DeleteComment(scope.row.id, scope.row, index)">删除</el-button>
      </template>
    </el-table-column>
  </el-table>
 <div class="block">
    <el-pagination
      @current-change="currentPageNum"
      :current-page="currentPage"
      :page-size="10"
      layout="total, prev, pager, next"
      :total="pageTotal">
    </el-pagination>
  </div>
  </div>
</template>

<script>
import TitleLink from './TitleLink.vue'
import { LOCALHOST_URL } from '../assets/js/localhost.js'

  export default {
    data() {
      return {
        tableData: [],
        currentPage: 1,
        pageTotal: null
      }
    },
    created () {
        this.$store.dispatch('setTitlename', {name:'视频评论管理'})
        this.$http.get(''+LOCALHOST_URL+'/api/getMovieComment').then((response)=>{
          let body = response.body;
          var getTenData= 10;
          var data = [];
          let _this = this;
          for(let i=0;i<getTenData;i++){
            var obj = {};
            obj.id = body.data[i].id;
            obj.comment = body.data[i].comment;
            obj.time = body.data[i].time;
            obj.username = body.data[i].username;
            obj.Mname = body.data[i].Mname;
            obj.enable = body.data[i].enable;
            _this.tableData = data;
            _this.pageTotal = body.data.length;
            if(body.data[i].enable =='1'){
              obj.enable = '是';
            }
            else{
              obj.enable = '否';
            }
            data[i] = obj;
          }
        })
    },
    methods: {
       //分页器触发方法
      currentPageNum(val) {
        var getpageNum = parseInt(val - 1);
        this.$http.post(''+LOCALHOST_URL+'/api/getMovieCommentPage',{
          pageNum: getpageNum
        }).then((response)=>{
          let body = response.body;
          var data = [];
          let _this = this;
          for(let i=0;i<body.data.length;i++){
            var obj = {};
            obj.id = body.data[i].id;
            obj.comment = body.data[i].comment;
            obj.time = body.data[i].time;
            obj.username = body.data[i].username;
            obj.Mname = body.data[i].Mname;
            obj.enable = body.data[i].enable;
            if(body.data[i].enable =='1'){
              obj.enable = '是';
            }
            else{
              obj.enable = '否';
            }
            data[i] = obj;
          }
          _this.tableData = data;
        },(response)=>{
          console.log(response)
        });
      },
      unBanComment(id,index) {
        this.$confirm('此操作将解封该评论', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
            this.$http.post(''+LOCALHOST_URL+'/api/unBanMovieComment',{
            id : id
          }).then((response) => {
             index.enable = '是';
             console.log(response)
            },(response)=>{
              console.log(response)
            });
            this.$message({
              type: 'success',
              message: '已解封当前评论!'
            });
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消解封'
          });          
        });
      },
      banComment(id,index) {
        this.$confirm('此操作将封禁该评论', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
            this.$http.post(''+LOCALHOST_URL+'/api/BanmovieComment',{
            id : id
          }).then((response) => {
            index.enable = '否';
            console.log(response)
            },(response)=>{
              console.log(response)
            });
            this.$message({
              type: 'success',
              message: '已封禁当前评论!'
            });
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消封禁'
          });          
        });
      },
      DeleteComment(id, row, index) {
        this.$confirm('此操作将删除该评论', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
            this.$http.post(''+LOCALHOST_URL+'/api/movieCommentDelete',{
            id : id
          }).then((response) => {
             console.log('删除成功')
            },(response)=>{
              console.log(response)
            });
            this.$message({
              type: 'success',
              message: '删除成功!'
            });
            this.tableData.splice(index,1)
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消删除'
          });          
        });
      }
    },
    filters: {
        ellipsis(text) {
            return text.substring(0,10)+'...'
        }
    }
  }
</script>
<style>
 .el-pagination{
    width: 364px;
    position: relative;
    padding-top: 19px;
    margin: 0 auto;  
    margin-top: 13px;
 } 
</style>