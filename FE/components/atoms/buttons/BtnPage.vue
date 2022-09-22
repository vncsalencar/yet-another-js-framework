<template>
  <button
    class="w-12 h-12 text-xl border-solid border-2 border-white hover-text-accent"
    :class="{ 'bg-gray text-accent': active, 'text-white': !active }"
    @click="pageChanged()"
  >
    <span v-if="previous">&lt</span>
    <span v-if="next">&gt</span>
    <span v-else>
      {{ pageNumber }}
    </span>
  </button>
</template>

<script setup lang="ts">
const props = defineProps<{
  pageNumber?: number;
  active?: boolean;
  previous?: boolean;
  next?: boolean;
}>();

const emit = defineEmits<{
  (e: "pageChange", payload: ChangePagePayload): void;
}>();

const pageChanged = () => {
  if (props.previous) {
    emit("pageChange", {
      previousPage: true,
    });
  }
  if (props.next) {
    emit("pageChange", {
      nextPage: true,
    });
  }
  emit("pageChange", { pageClicked: props.pageNumber });
};
</script>
