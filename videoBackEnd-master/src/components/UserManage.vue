<template>
  <div class="carousel">
    <div class="carouselList">
<el-table
    :data="tableData"
    border
    style="width: 100%">
     <el-table-column
      label="用户名"
      width="150">
      <template scope="scope">
        <span>{{ scope.row.name }}</span>
      </template>
    </el-table-column>
    <el-table-column
      label="用户级别" 
      width="180">
      <template scope="scope">
          <div slot="reference" class="name-wrapper">
            <el-tag>{{ scope.row.level }}</el-tag>
          </div>
      </template>
    </el-table-column>
    <el-table-column
      label="用户状态" 
      width="100">
      <template scope="scope">
          <div slot="reference" class="name-wrapper">
            <el-tag>{{ scope.row.enable }}</el-tag>
          </div>
      </template>
    </el-table-column>
    <el-table-column label="操作">
      <template scope="scope">
        <el-button
          size="small"
          @click="userEdit(scope.row.id)">编辑</el-button>
        <el-button
          size="small"
          type="warning"
          v-if="scope.row.enable =='正常' && scope.row.level!='超级管理员' "
          @click="userBan(scope.row.id, scope.row)">封禁</el-button>
        <el-button
          size="small"
          type="info"
          v-if="scope.row.enable =='封禁' && scope.row.level!='超级管理员'"
          @click="userleaveBan(scope.row.id, scope.row)">解禁</el-button>
        <el-button
          size="small"
          type="danger"
          v-if="scope.row.level!='超级管理员'"
          @click="userDelete(scope.row.id, scope.$index, tableData)">删除</el-button>
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
    created() {
        this.$store.dispatch('setTitlename', {name:'用户管理'})

        // 取到后端数据并渲染到表格中
        this.$http.get(''+LOCALHOST_URL+'/api/userinfo').then((response)=>{
          let body = response.body;
          var data = [];
          let _this = this;
          for(let i=0;i<body.data.length;i++){
            var obj = {};
            obj.id = body.data[i].id;
            obj.name = body.data[i].username;
            obj.level = body.data[i].level;
            obj.enable = body.data[i].enable;
            data[i] = obj;
            if(body.data[i].level =='0'){
              obj.level = '超级管理员';
            }else{
              obj.level = '用户';
            }

            if(body.data[i].enable =='1'){
              obj.enable = '正常'
            }else{
              obj.enable = '封禁'
            }
          }
          _this.tableData = data;
        })
    },
    methods: {
      userEdit(id) {
        this.$router.push(''+LOCALHOST_URL+'/userinfoEdit?id='+ id);
      },
      userBan(id,index){
         this.$confirm('此操作将封禁该用户, 请慎重!', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
            index.enable = '封禁';
            this.$http.post(''+LOCALHOST_URL+'/api/userBan',{
            id : id
          }).then((response) => {
             console.log('删除成功')
            },(response)=>{
              console.log(response)
            });
            this.$message({
              type: 'success',
              message: '已封禁当前用户!'
            });
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消封禁'
          });          
        });
       },
      userleaveBan(id,index){
        this.$confirm('此操作将解封该用户', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
            index.enable = '正常'
            this.$http.post(''+LOCALHOST_URL+'/api/userleaveBan',{
            id : id
          }).then((response) => {
             console.log('解封成功')
            },(response)=>{
              console.log(response)
            });
            this.$message({
              type: 'success',
              message: '已解封当前用户!'
            });
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消解封'
          });          
        });
      },
      userDelete(id, index,rows) {
        this.$confirm('此操作将永久删除该用户, 请慎重!', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
            this.$http.post(''+LOCALHOST_URL+'/api/userDelete',{
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