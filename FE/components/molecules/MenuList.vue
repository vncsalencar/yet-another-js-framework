<template>
  <ul class="flex flex-col items-center gap-4 text-white">
    <li
      class="group p-2 transition-all duration-300 ease-in-out hover:bg-left-bottom"
      v-for="item of listItems"
    >
      <button
        class="text-2xl md:text-3xl font-secondary transition-all duration-300 linear group-hover:text-primary"
        @click="emit('changeSection', item.sectionId)"
      >
        {{ item.name }}
      </button>
    </li>
  </ul>
</template>

<script setup lang="ts">
import { SectionIdEnum } from "~~/types/enums";

defineProps<{
  listItems: {
    name: string;
    sectionId: SectionIdEnum;
  }[];
}>();

const emit = defineEmits<{
  (e: "changeSection", sectionId: SectionIdEnum): void;
}>();
</script>

<style scoped lang="scss">
@keyframes menu-item-hover {
  0% {
  }
  100% {
  }
}

li {
  background: linear-gradient(to right, #f0db4f 50%, transparent 50%);
  background-size: 200% 100%;
  background-position: bottom right;
}
</style>
