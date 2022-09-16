<template>
  <Section title="📚 Content we liked">
    <ul v-if="pending">
      <ContentCardSkeleton v-for="i in 3"></ContentCardSkeleton>
    </ul>

    <ul v-else>
      <ContentCard
        v-for="content of contentList.data"
        :content="content"
      ></ContentCard>
    </ul>

    <div class="flex justify-end items-center gap-4 mt-4">
      <small> {{ pageCount }} pages </small>
      <Pagination
        :active-page="activePage"
        :total-pages="totalPages"
        :page-size="pageSize"
        :page-count="pageCount"
        @page-change="pageChange"
      ></Pagination>
    </div>
  </Section>
</template>

<script setup lang="ts">
const config = useRuntimeConfig();
const URL = `${config.CMS}?content-type=liked`;
const activePage = ref(1);
const totalPages = ref(0);
const pageCount = ref(0);
const pageSize = ref(3);

const { data: contentList, pending } = await useFetch<Page<Content>>(URL, {
  initialCache: false,
});
totalPages.value =
  (contentList.value.meta.pagination.pageCount + pageSize.value - 1) /
  pageSize.value;
pageCount.value = contentList.value.meta.pagination.pageCount;

const pageChange = async (newPage: number) => {
  activePage.value = newPage;
  pending.value = true;
  contentList.value = await $fetch(URL, {
    params: {
      page: newPage,
    },
  });
  console.log(contentList.value);
  pending.value = false;
};
</script>
