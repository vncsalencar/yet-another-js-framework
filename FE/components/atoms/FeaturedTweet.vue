<template>
  <div class="flex justify-center" v-html="tweetHtml"></div>
</template>

<script setup lang="ts">

const props = defineProps<{ tweetHtml: string }>();
</script>
