<template>
  <ul class="flex flex-col gap-4 text-center text-white">
    <li
      class="hover:scale-125 transition-all duration-300"
      v-for="item of listItems"
    >
      <button
        class="text-2xl md:text-3xl hover:text-accent"
        @click="emit('changeSection', item.sectionId)"
      >
        {{ item.name }}
      </button>
    </li>
  </ul>
</template>

<script setup lang="ts">
defineProps<{
  listItems: {
    name: string;
    sectionId: SectionIds;
  }[];
}>();

const emit = defineEmits<{
  (e: "changeSection", sectionId: SectionIds): void;
}>();
</script>
