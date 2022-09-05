<template>
  <a :href="link" target="_blank">
    <img
    :src="url"
    :alt="alt"
    class="h-[150px] w-[200px"
  />
  </a>

</template>

<script setup lang="ts">
defineProps<{
  url: string;
  alt: string;
  link: string;
}>();
</script>
