<template>
  <div class="flex flex-col justify-center items-end gap-4 mt-4">
    <ul class="flex justify-end gap-2">
      <li>
        <BtnPage
          first
          @page-change="changePage"
          v-show="activePage > 1"
        ></BtnPage>
      </li>
      <li>
        <BtnPage
          previous
          @page-change="changePage"
          v-show="activePage > 1"
        ></BtnPage>
      </li>
      <li>
        <BtnPage
          v-for="i of range"
          :page-number="i"
          @page-change="changePage"
          :active="i == activePage"
        ></BtnPage>
      </li>
      <li>
        <BtnPage
          next
          @page-change="changePage"
          v-show="activePage < pageCount"
        ></BtnPage>
      </li>
      <li>
        <BtnPage
          last
          @page-change="changePage"
          v-show="activePage < pageCount"
        ></BtnPage>
      </li>
    </ul>
    <p>{{ pageCount }} pages</p>
  </div>
</template>

<script setup lang="ts">
const props = defineProps<{
  activePage: number;
  pageCount: number;
  maxPages: number;
}>();
const emit = defineEmits<{ (e: "pageChange", activePage: number): void }>();
const activePage = ref(props.activePage);

const range = computed(() => {
  const range = [];

  for (
    let i = firstPage.value;
    i <= Math.min(firstPage.value + props.maxPages - 1, props.pageCount);
    i++
  ) {
    range.push(i);
  }

  return range;
});

const firstPage = computed(() => {
  if (props.pageCount > props.maxPages) {
    if (activePage.value <= 1) {
      return 1;
    }

    if (activePage.value + props.maxPages > props.pageCount) {
      return props.pageCount - props.maxPages + 1;
    }

    return activePage.value;
  }

  return 1;
});

const changePage = (payload: ChangePagePayload) => {
  if (payload.nextPage) activePage.value = ++activePage.value;
  if (payload.previousPage) activePage.value = --activePage.value;
  if (payload.firstPage) activePage.value = 1;
  if (payload.lastPage) activePage.value = props.pageCount;
  if (payload.pageClicked) activePage.value = payload.pageClicked;

  emit("pageChange", activePage.value);
};
</script>
