<template>
  <div class="px-3 bg-gray text-accent rounded-md">
    #{{ title }}
  </div>
</template>

<script setup lang="ts">
defineProps<{
  title: string;
}>();
</script>
