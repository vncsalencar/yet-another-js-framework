<template>
  <button
    class="w-12 h-12 text-lg font-bold btn-primary"
    :class="{ 'bg-primary text-accent': active, 'text-white': !active }"
    @click="pageChanged()"
  >
    <span v-if="previous">&lt</span>
    <span v-if="next">&gt</span>
    <span v-if="first">&lt&lt</span>
    <span v-if="last">&gt&gt</span>
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
  first?: boolean;
  last?: boolean;
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
  if (props.first) {
    emit("pageChange", {
      firstPage: true,
    });
  }
  if (props.last) {
    emit("pageChange", {
      lastPage: true,
    });
  }
  emit("pageChange", { pageClicked: props.pageNumber });
};
</script>
