<template>
  <Section title="📚 Content we liked">
    <div class="">
      <ContentCard
        v-for="content in contentList"
        :content="content"
      ></ContentCard>
    </div>
  </Section>
</template>

<script setup lang="ts">
const contentList: Content[] = [
  {
    type: "Article",
    title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
    date: "09/11/1996",
    author: "Tulio",
    thumbnail: {
      url: "/assets/images/thumbnail1.jpg",
      alt: "thumbnail", 
    },
    tags: ["Vue", "Nuxt"],
    link: "",
  },
];
</script>
