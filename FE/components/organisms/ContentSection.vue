<template>
  <Section>
    <h2 class="text-2xl mb-4 text-center uppercase">Content that we liked</h2>
    <div class="">
      <ContentCard></ContentCard>
      <ContentCard></ContentCard>
      <ContentCard></ContentCard>
    </div>
  </Section>
</template>

<script setup lang="ts">
const contentList: Content[] = [
  {
    title: "TITLE",
    type: "ARTICLE",
    date: "09/11/1996",
  },
];
</script>
