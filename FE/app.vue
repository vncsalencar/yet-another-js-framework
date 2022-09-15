<template>
  <Menu @change-section="scrollTo"></Menu>
  <ProgressScrollBar></ProgressScrollBar>
  <Container>
    <Header id="header"></Header>
  
    <TrendingNpmSection id="feature"></TrendingNpmSection>
    <ContentSection id="content"></ContentSection>
    <!-- <TwitterSection id="twitter"></TwitterSection> -->
    <!-- <TiktokSection id="tiktok"></TiktokSection> -->
    <!-- <RedditSection id="reddit"></RedditSection> -->
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
  toggleMenuOnEsc();
});

const toggleMenuOnEsc = () => {
  document.onkeydown = (ev: KeyboardEvent) => {
    if (ev.key == "Escape") {
      store.toggle();
    }
  };
};

const scrollTo = (sectionId: SectionIds) => {
  if (sectionId == "home") {
    window.scrollTo({ top: 0, behavior: "smooth" });
    return;
  }

  const position = document.getElementById(sectionId).offsetTop - 16;
  window.scrollTo({ top: position, behavior: "smooth" });
};
</script>
