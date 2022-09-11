<template>
  <Container>
    <Header></Header>
    <FeatureSection></FeatureSection>
    <ContentSection></ContentSection>
    <TwitterSection></TwitterSection>
    <RedditSection></RedditSection>
    <HelpfulMaterialSection></HelpfulMaterialSection>
    <AboutSection></AboutSection>
  </Container>
</template>

<script setup lang="ts">
useHead({
  title: "Yet another Javascript framework",
  htmlAttrs: {
    lang: "en",
  },
});
</script>
