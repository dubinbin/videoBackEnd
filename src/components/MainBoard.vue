<template>
<div class="mainController">
  <p>自豪的采用Vue.js构建</p>
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