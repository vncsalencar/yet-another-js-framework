<template>
  <ul class="flex flex-col gap-4 text-center text-white">
    <li
      class="hover:scale-125 transition-all duration-250"
      v-for="item of listItems"
    >
      <a class="text-3xl hover:text-accent" href="#">{{ item.name }}</a>
    </li>
  </ul>
</template>

<script setup lang="ts">
defineProps<{
  listItems: {
    name: string;
    link: string;
  }[];
}>();
</script>
