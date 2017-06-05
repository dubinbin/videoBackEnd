<template>
<div class="movielist">
  <el-table
    :data="tableData"
    border
    style="width: 100%">
     <el-table-column
      label="电影"
      width="150">
      <template scope="scope">
        <span>{{ scope.row.name }}</span>
      </template>
    </el-table-column>
    <el-table-column
      label="类型"
      width="100">
      <template scope="scope">
        <span>{{ scope.row.category }}</span>
      </template>
    </el-table-column>
    <el-table-column
      label="时长"
      width="80">
      <template scope="scope">
          <div slot="reference" class="name-wrapper">
            <el-tag>{{ scope.row.duration }}</el-tag>
          </div>
      </template>
    </el-table-column>
     <el-table-column
      label="上映时间"
      width="145">
      <template scope="scope">
        <el-icon name="time"></el-icon>
        <span>{{ scope.row.date }}</span>
      </template>
    </el-table-column>

    <el-table-column
      label="审核通过"
      width="110">
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
          @click="editMovie(scope.row.id)">编辑</el-button>
         <el-button
          size="small"
          type="warning"
          v-if="scope.row.enable =='是'"
          @click="banMovie(scope.row.id,scope.row)">小黑屋</el-button>
          <el-button
          size="small"
          type="info"
          v-if="scope.row.enable =='否'"
          @click="unBanMovie(scope.row.id,scope.row)">解封</el-button>
        <el-button
          size="small"
          type="danger"
          @click="DeleteMovie(scope.row.id, scope.row, index)">删除</el-button>
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
import { LOCALHOST_URL } from '../assets/js/localhost.js'
import TitleLink from './TitleLink.vue'

  export default {
    data() {
      return {
        tableData: [],
        currentPage: 1,
        pageTotal: null
      }
    },
    created () {
        this.$store.dispatch('setTitlename', {name:'视频管理'})
        this.$http.get(''+LOCALHOST_URL+'/api/movielist').then((response)=>{
          let body = response.body;
          var data = [];
          var getTenData = 10;
          let _this = this;
          for(let i=0;i<getTenData;i++){
            var obj = {};
            obj.id = body.data[i].id;
            obj.name = body.data[i].Mname;
            obj.category = body.data[i].name;
            obj.PicUrl = body.data[i].PicUrl;
            obj.movieUrl = body.data[i].movieUrl;
            obj.date = body.data[i].showTime;
            obj.duration = body.data[i].moviePlayTime;
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
          _this.pageTotal = body.data.length;
        })
    },
    methods: {
       //分页器触发方法
      currentPageNum(val) {
        var getpageNum = parseInt(val - 1);
        this.$http.post(''+LOCALHOST_URL+'/api/movielistPage',{
          pageNum: getpageNum
        }).then((response)=>{
          let body = response.body;
          var data = [];
          let _this = this;
          for(let i=0;i<body.data.length;i++){
            var obj = {};
            obj.id = body.data[i].id;
            obj.name = body.data[i].Mname;
            obj.category = body.data[i].name;
            obj.date = body.data[i].showTime;
            obj.PicUrl = body.data[i].PicUrl;
            obj.movieUrl = body.data[i].movieUrl;
            obj.duration = body.data[i].moviePlayTime;
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
      editMovie(id) {
        this.$router.push('/movieedit?id='+ id);
      },
      unBanMovie(id,index) {
        this.$confirm('此操作将解封该影片', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
            this.$http.post(''+LOCALHOST_URL+'/api/unBanMovie',{
            id : id
          }).then((response) => {
            index.enable ='是';
            this.$message({
              type: 'success',
              message: '已解封当前影片!'
            });
            },(response)=>{
              console.log(response)
            });
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消解封'
          });          
        });
      },
      banMovie(id,index) {
        this.$confirm('此操作将封禁该用影片', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
            this.$http.post(''+LOCALHOST_URL+'/api/movieBan',{
            id : id
          }).then((response) => {
            index.enable = '否'
            },(response)=>{
              console.log(response)
            });
            this.$message({
              type: 'success',
              message: '已封禁当前影片!'
            });
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消封禁'
          });          
        });
      },
      DeleteMovie(id, row, index) {
        this.$confirm('此操作将删除改影片, 请慎重!', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
            this.$http.post(''+LOCALHOST_URL+'/api/movieDelete',{
            id : id
          }).then((response) => {
             this.$http.post(''+LOCALHOST_URL+'/api/deletePic',{
             imgSrc: row.PicUrl
             }).then((response)=>{
              console.log('删除成功')
             })
             
             this.$http.post(''+LOCALHOST_URL+'/api/deleteVideo',{
             videoSrc: row.movieUrl
             }).then((response)=>{
              console.log('删除成功')
             })
            },(response)=>{
              console.log(response)
            });
            this.$message({
              type: 'success',
              message: '删除成功!'
            });
            this.tableData.splice(index,1);
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消删除'
          });          
        });
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