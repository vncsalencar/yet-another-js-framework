<template>
  <ul class="flex justify-end gap-2">
    <li>
      <button
        aria-label="Previous page"
        class="w-8 h-8 border-solid border-2 border-white text-white hover:text-accent"
        @click="changePage(-1, true)"
        v-show="activePage > 1"
      >
        &lt
      </button>
    </li>

    <li>
      <PageBtn
        v-for="i of range"
        :page-number="i"
        @page-change="changePage(i)"
        :active="i == activePage"
      ></PageBtn>
    </li>

    <li>
      <button
        aria-label="Next page"
        class="w-8 h-8 border-solid border-2 border-white text-white hover:text-accent"
        @click="changePage(1, true)"
        v-show="activePage < totalPages"
      >
        &gt
      </button>
    </li>
  </ul>
</template>

<script setup lang="ts">
import { onMounted, ref } from "vue";

const props = defineProps<{
  activePage: number;
  totalPages: number;
  maxPages: number;
}>();
const emit = defineEmits<{ (e: "pageChange", activePage: number): void }>();
const activePage = ref(props.activePage);

const range = computed(() => {
  const range = [];

  for (
    let i = firstPage.value;
    i <= Math.min(firstPage.value + props.maxPages - 1, props.totalPages);
    i++
  ) {
    range.push(i);
  }

  return range;
});

const firstPage = computed(() => {
  if (activePage.value <= 1) {
    return 1;
  }

  if (activePage.value + props.maxPages > props.totalPages) {
    return props.totalPages - props.maxPages + 1;
  }

  return activePage.value;
});

const changePage = (pageClicked?: number, increment: boolean = false) => {
  increment
    ? (activePage.value += pageClicked)
    : (activePage.value = pageClicked);
  emit("pageChange", activePage.value);
};
</script>
