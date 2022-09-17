<template>
  <div v-html="redditPostHtml" class="flex justify-center"></div>
</template>

<script setup lang="ts">
defineProps<{
  redditPostHtml: string;
}>();
</script>
