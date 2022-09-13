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
import { useMenuStore } from "./stores/menuStore";

const store = useMenuStore();

useHead({
  title: "Yet another Javascript framework",
  htmlAttrs: {
    lang: "en",
  },
});

onMounted(() => {
  document.onkeydown = (ev: KeyboardEvent) => {
    if (ev.key == "Escape") {
      store.toggle();
    }
  };
});

const scrollTo = (sectionId: SectionIds) => {
  if (sectionId == "home") {
    window.scrollTo({ top: 0, behavior: "smooth" });
    return;
  }

  const headerHeight = document.getElementById("header").offsetHeight + 16;
  const position = document.getElementById(sectionId).offsetTop - headerHeight;
  window.scrollTo({ top: position, behavior: "smooth" });
};
</script>
