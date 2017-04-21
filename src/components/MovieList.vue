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
      width="120">
      <template scope="scope">
        <span>{{ scope.row.category }}</span>
      </template>
    </el-table-column>
    <el-table-column
      label="时长"
      width="120">
      <template scope="scope">
          <div slot="reference" class="name-wrapper">
            <el-tag>{{ scope.row.duration }}</el-tag>
          </div>
      </template>
    </el-table-column>
     <el-table-column
      label="上映时间"
      width="150">
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
          @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
        <el-button
          size="small"
          type="danger"
          @click="handleDelete(scope.$index, scope.row)">删除</el-button>
      </template>
    </el-table-column>
  </el-table>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        tableData: []
      }
    },
    created () {
        this.$http.get('/api/movielist').then((response)=>{
          let body = response.body;
          var data = [];
          let _this = this;
          for(let i=0;i<body.data.length;i++){
            var obj = {};
            obj.name = body.data[i].Mname;
            obj.category = body.data[i].name;
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
        })
    },
    methods: {
      handleEdit(index, row) {
        console.log(index, row);
        this.$router.push('/movieEdit');
      },
      handleDelete(index, row) {
        console.log(index, row);
        this.$confirm('此操作将永久删除该文件, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$message({
            type: 'success',
            message: '删除成功!'
          });
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