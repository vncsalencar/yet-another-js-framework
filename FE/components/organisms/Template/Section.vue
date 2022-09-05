<template>
  <section class="mt-16">
    <h2 class="text-2xl mb-4 text-center uppercase">{{ title }}</h2>
    <slot></slot>
  </section>
</template>

<script setup lang="ts">
defineProps<{
  title: string;
}>();
</script>
