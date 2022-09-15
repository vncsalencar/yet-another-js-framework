<template>
  <Section title="📚 Content we liked">
    <ul>
      <ContentCard
        v-for="content in contentList"
        :content="content"
      ></ContentCard>

      <!-- <ContentCardSkeleton v-for="i in 3"> </ContentCardSkeleton> -->
    </ul>
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
import { ContentType } from "../../../types/enums";

const activePage = ref(1);

const pageChange = (newPage: number) => {};

const contentList: Content[] = [
  {
    type: ContentType.Article,
    title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
    date: new Date("09/01/2022"),
    author: "Tulio",
    thumbnail: {
      url: "/assets/images/thumbnail1.jpg",
      alt: "thumbnail",
    },
    tags: ["article", "test", "ipsum", "lorem"],
    link: "",
  },
  {
    type: ContentType.Video,
    title: "I built a JavaScript framework",
    date: new Date("09/11/2021"),
    author: "Fireship",
    tags: ["javascript", "fireship", "framework"],
    link: "https://www.youtube.com/watch?v=SJeBRW1QQMA",
  },
  {
    type: ContentType.Project,
    title: "Vue",
    date: new Date("08/10/2022"),
    author: "yyx990803",
    tags: ["vue", "framework", "javascript"],
    link: "https://github.com/vuejs/vue",
  },
];
</script>
