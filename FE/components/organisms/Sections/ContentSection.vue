<template>
  <Section title="📚 Content we liked">
    <ul>
      <ContentCard
        v-for="content in contentList"
        :content="content"
      ></ContentCard>
    </ul>
    <Pagination :pages="5"></Pagination>
  </Section>
</template>

<script setup lang="ts">
import { ContentType } from "../../../types/enums";
const contentList: Content[] = [
  {
    type: ContentType.Article,
    title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
    date: "09/11/2022",
    author: "Tulio",
    thumbnail: {
      url: "/assets/images/thumbnail1.jpg",
      alt: "thumbnail",
    },
    tags: ["Article", "Test", "Ipsum", "Lorem"],
    link: "",
  },
  {
    type: ContentType.Video,
    title: "I built a JavaScript framework",
    date: "09/11/2022",
    author: "Fireship",
    tags: ["Javascript", "Fireship", "Framework"],
    link: "https://www.youtube.com/watch?v=SJeBRW1QQMA",
  },
  {
    type: ContentType.Project,
    title: "Vue",
    date: "09/11/2022",
    author: "yyx990803",
    tags: ["Vue", "Framework", "Javascript"],
    link: "https://github.com/vuejs/vue",
  },
];
</script>
