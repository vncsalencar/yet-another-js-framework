<template>
  <Container>
    <Header></Header>
    <HelpfulMaterialSection></HelpfulMaterialSection>
    <FeatureSection></FeatureSection>
    <ContentSection></ContentSection>
    <TwitterSection></TwitterSection>
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
