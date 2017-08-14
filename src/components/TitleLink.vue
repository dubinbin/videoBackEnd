<template>
<!--低粒度组件，仅用于样式-->
 <div class="titleLink">
  <h1>{{titleName.name}}</h1>
  <hr>
</div>
</template>

<script>
import {mapState} from 'vuex'

export default {
  computed:mapState(['titleName'])
}
</script>

<style>
.titleLink h1{
   color: #4d79bb;
   font-size: 21px;
   font-weight: 200;
}
</style>