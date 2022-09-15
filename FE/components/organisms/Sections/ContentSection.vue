<template>
  <Section title="📚 Content we liked">
    <!-- <ul>
      <ContentCard :content="contentList.data[0].attributes"></ContentCard>
    </ul> -->

    <pre>{{ contentList }}</pre>

    <div class="flex justify-end items-center gap-4 mt-4">
      <small> 10 pages </small>
      <Pagination
        :active-page="activePage"
        :page-size="3"
        :total-pages="10"
        :max-pages="5"
        @page-change="pageChange"
      ></Pagination>
    </div>
  </Section>
</template>

<script setup lang="ts">
const config = useRuntimeConfig()
const { data: contentList, pending } = await useFetch(
  `${config.CMS}?content-type=liked`,
  { initialCache: false }
);

const activePage = ref(1);
const pageChange = (newPage: number) => {};
</script>
