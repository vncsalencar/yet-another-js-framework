<template>
  <Menu @change-section="scrollTo"></Menu>
  <ProgressScrollBar></ProgressScrollBar>
  <Container>
    <Header id="header"></Header>
    <SectionTrending id="trending"></SectionTrending>
    <SectionContent id="content"></SectionContent>
    <SectionQuestion id="question"></SectionQuestion>
    <!-- <SectionTwitter id="twitter"></SectionTwitter> -->
    <!-- <SectionTiktok id="tiktok"></SectionTiktok> -->
    <!-- <SectionReddit id="reddit"></SectionReddit> -->
    <SectionHelpfulMaterial id="helpful"></SectionHelpfulMaterial>
    <SectionAbout id="about"></SectionAbout>
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
  const position = document.getElementById(sectionId).offsetTop - 32;
  window.scrollTo({ top: position, behavior: "smooth" });
};
</script>
