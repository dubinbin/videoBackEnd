<template>
  <div class="carousel">
    <div class="carouselList">
<el-table
    :data="tableData"
    border
    style="width: 100%">
     <el-table-column
      label="名称"
      width="150">
      <template scope="scope">
        <span>{{ scope.row.title }}</span>
      </template>
    </el-table-column>
    <el-table-column
      label="URL"
      width="250">
      <template scope="scope">
          <div slot="reference" class="name-wrapper">
            <el-tag>{{ scope.row.url }}</el-tag>
          </div>
      </template>
    </el-table-column>
    <el-table-column label="操作">
      <template scope="scope">
        <el-button
          size="small"
          @click="bannerEdit(scope.row.id)">编辑</el-button>
        <el-button
          size="small"
          type="danger"
          @click="bannerDelete(scope.row.id, scope.$index, tableData)">删除</el-button>
        </template>
        </el-table-column>
     </el-table>
      </div>
    <div>
      <router-view></router-view>
    </div>
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
    created () {
        this.$store.dispatch('setTitlename', {name:'轮播图'})
        this.$http.get(''+LOCALHOST_URL+'/api/banner').then((response)=>{
          let body = response.body;
          var data = [];
          let _this = this;
          for(let i=0;i<body.data.length;i++) {
            var obj = {};
            obj.id = body.data[i].id;
            obj.title = body.data[i].title;
            obj.url = body.data[i].url;
            data[i] = obj;
            }
           _this.tableData = data;  
        })
    },
    methods: {
      bannerEdit(id) {
        this.$router.push('/carouseledit?id='+ id);
      },
      bannerDelete(id,index,rows) {
         var bannerUrl = rows[index].url;
         this.$confirm('此操作将删除该轮播图, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
            this.$http.post(''+LOCALHOST_URL+'/api/bannerDelete',{
            id : id
          }).then((response) => {
             this.$http.post(''+LOCALHOST_URL+'/api/deletePic',{
             imgSrc: bannerUrl
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
            rows.splice(index,1)
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

</style>