<template>
  <section
    class="px-4 py-24 md:py-40s"
    :class="{ 'bg-secondary': bgSecondary }"
  >
    <div class="max-w-[1200px] mx-auto">
      <h2 class="mb-4 text-center uppercase">{{ title }}</h2>
      <slot></slot>
    </div>
  </section>
</template>

<script setup lang="ts">
defineProps<{
  title: string;
  bgSecondary?: boolean;
}>();
</script>
