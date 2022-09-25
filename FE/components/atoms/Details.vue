<template>
  <details class="group bg-primary p-4">
    <summary class="group-hover-text-accent">{{ title }}</summary>
    <slot></slot>
  </details>
</template>

<script setup lang="ts">
defineProps<{ title: string }>();
</script>
