<template>
<div class="mainController">
  <p style="font-weight: 200;">自豪的采用Vue.js与Element UI构建此系统</p>
<div style="width:98%">
  <img draggable="false" style="width: 280px; float: left;" src="../assets/img/vue.png">
  <img draggable="false" style="width: 450px;float: right;margin-top: 30px;" src="../assets/img/ele.png">
</div>
</div>
</template>

<script>
	export default {
        created() {
          this.$store.dispatch('setTitlename', {name:'控制中心'})
        }
    }
</script>

<style>

</style>