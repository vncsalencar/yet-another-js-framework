<template>
  <a :href="link" target="_blank">
    <img
    :src="url"
    :alt="alt"
    class="h-[150px] w-[250px] object-cover"
  />
  </a>

</template>

<script setup lang="ts">
defineProps<{
  url?: string;
  alt?: string;
  link: string;
}>();
</script>
