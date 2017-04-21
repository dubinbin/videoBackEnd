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
      label="地址"
      width="180">
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
          @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
        <el-button
          size="small"
          type="danger"
          @click="handleDelete(scope.$index, scope.row)">删除</el-button>
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
  export default {
    data() {
      return {
        tableData: []
      }
    },
    created () {
        this.$http.get('/api/banner').then((response)=>{
          let body = response.body;
          var data = [];
          let _this = this;
          for(let i=0;i<body.data.length;i++){
            var obj = {};
            obj.title = body.data[i].title;
            obj.url = body.data[i].url;
            // obj.enable = body.data[i].enable;
            // if(body.data[i].enable =='1'){
            //   obj.enable = '是';
            // }
            // else{
            //   obj.enable = '否';
            // }
            data[i] = obj;
          }
          _this.tableData = data;
        })
    },
    methods: {
      handleEdit(index, row) {
        console.log(index, row);
        this.$router.push('/carouseledit');
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