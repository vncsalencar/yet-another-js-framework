<template>
  <button
    class="w-8 h-8 border-solid border-2 border-white text-white hover-text-accent"
    :class="{ 'bg-gray': active }"
    @click="pageChanged()"
  >
    {{ pageNumber }}
  </button>
</template>

<script setup lang="ts">
const props = defineProps<{ pageNumber: number; active?: boolean }>();
const emit = defineEmits<{(e: "pageChange", pageNumber: number): void}>()

const pageChanged = () => {
    emit("pageChange", props.pageNumber)
}
</script>
