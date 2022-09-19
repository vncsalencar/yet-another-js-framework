<template>
  <button
    class="p-4 w-100 text-white border-solid border-2 border-white hover-text-accent hover-border-accent"
  >
    {{ text }}
  </button>
</template>

<script setup lang="ts">
defineProps<{
  text: string;
}>();
</script>

<style scoped></style>
