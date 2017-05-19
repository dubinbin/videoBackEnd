<template>
  <div class="topiclist">
    <div class="topiclist">
   <el-table
    :data="tableData"
    border
    style="width: 100%">
     <el-table-column
      label="ID"
      width="80">
      <template scope="scope">
        <span>{{ scope.row.id }}</span>
      </template>
    </el-table-column>
      <el-table-column
      label="标题"
      width="250">
      <template scope="scope">
        <span>{{ scope.row.title }}</span>
      </template>
    </el-table-column>
    <el-table-column
      label="发布时间"
      width="145">
      <template scope="scope">
        <el-icon name="time"></el-icon>
        <span>{{ scope.row.date }}</span>
      </template>
    </el-table-column>
    <el-table-column
      label="分类"
      width="100">
      <template scope="scope">
          <div slot="reference" class="name-wrapper">
            <el-tag>{{ scope.row.category }}</el-tag>
          </div>
      </template>
    </el-table-column>
    <el-table-column label="操作">
      <template scope="scope">
        <el-button
          size="small"
          @click="topicEdit(scope.row.id)">编辑</el-button>
          <el-button
          size="small"
          type="warning"
          v-if="scope.row.enable =='1'"
          @click="topicBan(scope.row.id, index)">小黑屋</el-button>
          <el-button
          size="small"
          type="info"
          v-if="scope.row.enable =='0'"
          @click="topicUnban(scope.row.id, index)">解封</el-button>
        <el-button
          size="small"
          type="danger"
          @click="topicDelete(scope.row.id, scope.row, index)">删除</el-button>
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
  <div>
  </div>
</div>
</template>

<script>

  export default {
    data() {
      return {
        tableData: [],
        pageTotal: null,
        currentPage: 1
      }
    },
    created() {
        this.$store.dispatch('setTitlename', {name:'话题列表'})
        this.$http.get('/api/topiclist').then((response)=>{
          let body = response.body;
          var data = [];
          var getTenData = 10;
          let _this = this;
          for(let i=0;i<getTenData;i++){
            var obj = {};
            obj.id = body.data[i].id;
            obj.title = body.data[i].tname;
            obj.date = body.data[i].time;
            obj.category = body.data[i].name;
            obj.enable = body.data[i].enable;
            data[i] = obj;
            _this.tableData = data;
            _this.pageTotal = body.data.length;
          }
        })
    },
    methods: {
       currentPageNum(val) {
        var getpageNum = parseInt(val - 1);
        this.$http.post('/api/topiclistPage',{
          pageNum: getpageNum
        }).then((response)=>{
          let body = response.body;
          var data = [];
          let _this = this;
          for(let i=0;i<body.data.length;i++){
            var obj = {};
            obj.id = body.data[i].id;
            obj.title = body.data[i].tname;
            obj.date = body.data[i].time;
            obj.category = body.data[i].name;
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
      topicBan(id) {
        this.$confirm('此操作将封禁该话题', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
            this.$http.post('/api/topicBan',{
            id : id
          }).then((response) => {
            setTimeout(function(){
              window.location.reload()},1000);
            },(response)=>{
              console.log(response)
            });
            this.$message({
              type: 'success',
              message: '已封禁当前话题!'
            });
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消封禁'
          });          
        });
      },
      topicUnban(id) {
        this.$confirm('此操作将解封该话题', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
            this.$http.post('/api/topicLeaveBan',{
            id : id
          }).then((response) => {
            setTimeout(function(){
              window.location.reload()},1000);
            },(response)=>{
              console.log(response)
            });
            this.$message({
              type: 'success',
              message: '已解封当前话题!'
            });
             // window.location.reload();
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消解封'
          });          
        });
      },
      topicEdit(id) {
        this.$router.push('/foundTopicEdit?id='+id);
      },
      topicDelete(index, row) {
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