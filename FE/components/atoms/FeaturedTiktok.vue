<template>
  <div class="flex justify-center" v-html="tiktokHtml"></div>
</template>

<script setup lang="ts">
const props = defineProps<{ tiktokHtml: string }>();
</script>

<style scoped>
blockquote {
  width: 323px !important;
}
</style>
