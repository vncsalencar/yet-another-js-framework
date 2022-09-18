<template>
  <img
    :src="url"
    :alt="alt"
    class="h-[150px] w-[250px] min-h-[150px] min-w-[250px] object-contain"
  />
</template>

<script setup lang="ts">
defineProps<{
  url?: string;
  alt?: string;
}>();
</script>
