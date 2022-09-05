<template>
  <div class="px-3 bg-gray text-accent rounded-2xl">
    {{ title }}
  </div>
</template>

<script setup lang="ts">
defineProps<{
  title: string;
}>();
</script>
