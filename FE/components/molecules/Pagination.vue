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
        v-show="activePage < pageCount"
      >
        &gt
      </button>
    </li>
  </ul>
</template>

<script setup lang="ts">
const props = defineProps<{
  activePage: number;
  pageSize: number;
  pageCount: number
}>();
const emit = defineEmits<{ (e: "pageChange", activePage: number): void }>();
const activePage = ref(props.activePage);

const range = computed(() => {
  const range = [];

  for (
    let i = firstPage.value;
    i <= Math.min(firstPage.value + props.pageSize - 1, props.pageCount);
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

  if (activePage.value + props.pageSize > props.pageCount) {
    return props.pageCount - props.pageSize + 1;
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
