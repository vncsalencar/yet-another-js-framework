<template>
  <Section>
    <template v-slot:title>
      <span class="text-accent">Content</span> we liked
    </template>

    <ul v-if="!pending" class="border-t-2 border-white border-solid">
      <CardContent
        v-for="content of contentList.data"
        :content="content"
      ></CardContent>
    </ul>

    <ul
      v-if="pending || loadingMore"
      class="border-t-2 border-white border-solid"
    >
      <SkeletonCardContet v-for="i in 3"></SkeletonCardContet>
    </ul>

    <Pagination
      :active-page="activePage"
      :page-count="pageCount"
      :max-pages="maxPages"
      @page-change="pageChange"
      @load-more="loadMore"
    ></Pagination>
  </Section>
</template>

<script setup lang="ts">
import { ApiRouteEnum } from "~~/types/enums";

const config = useRuntimeConfig();
const API_URL = `${config.CMS}/${ApiRouteEnum.Content}`;

const activePage = ref(1);
const pageCount = ref(0);
const maxPages = ref(5);

const loadingMore = ref(false);

const { data: contentList, pending } = await useFetch<Page<Content>>(API_URL);
pageCount.value = contentList.value.meta.pagination.pageCount;

const pageChange = async (newPage: number) => {
  activePage.value = newPage;
  pending.value = true;
  contentList.value = await $fetch(API_URL, {
    params: {
      page: newPage,
    },
  });
  pending.value = false;
};

const loadMore = async () => {
  loadingMore.value = true;
  let payload = await $fetch(API_URL, {
    params: {
      page: ++activePage.value,
    },
  });
  contentList.value.data = [...contentList.value.data, ...payload.data];
  activePage.value = ++activePage.value;
  loadingMore.value = false;
};
</script>
