<template>
  <Menu @change-section="scrollTo"></Menu>
  <Container>
    <Header id="header"></Header>
    <FeatureSection id="feature"></FeatureSection>
    <ContentSection id="content"></ContentSection>
    <TwitterSection id="twitter"></TwitterSection>
    <TiktokSection id="tiktok"></TiktokSection>
    <RedditSection id="reddit"></RedditSection>
    <HelpfulMaterialSection id="helpful"></HelpfulMaterialSection>
    <AboutSection id="about"></AboutSection>
  </Container>
</template>

<script setup lang="ts">
useHead({
  title: "Yet another Javascript framework",
  htmlAttrs: {
    lang: "en",
  },
});

const scrollTo = (sectionId: SectionIds) => {
  const headerHeight = document.getElementById("header").offsetHeight + 16;
  const position = document.getElementById(sectionId).offsetTop - headerHeight;
  window.scrollTo({ top: position, behavior: "smooth" });
};

onMounted(() => {});
</script>
