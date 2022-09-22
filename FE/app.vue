<template>
  <Menu @change-section="scrollTo"></Menu>
  <ProgressScrollBar></ProgressScrollBar>
  <Container>
    <Header id="header"></Header>
    <SectionTrending id="trending"></SectionTrending>
    <SectionContent id="content"></SectionContent>
    <SectionQuestion id="question"></SectionQuestion>
    <!-- <SectionSocials id="socials"></SectionSocials> -->
    <SectionHelpfulMaterial id="helpful"></SectionHelpfulMaterial>
    <SectionAbout id="about"></SectionAbout>
  </Container>
</template>

<script setup lang="ts">
import { useMenuStore } from "./stores/menuStore";
import { useScrollProgressStore } from "./stores/scrollProgressStore";

const menuStore = useMenuStore();
const scrollProgressStore = useScrollProgressStore();

useHead({
  title: "Yet another Javascript framework",
  viewport: "width=device-width, initial-scale=1, maximum-scale=1",
  charset: "utf-8",
  link: [
    { rel: "shortcut icon", type: "image/x-icon", href: "/public/favicon.ico" },
  ],
  htmlAttrs: {
    lang: "en",
  },
});

onMounted(() => {
  toggleMenuOnEsc();
  calculateScrollProgressOnResize();
});

const toggleMenuOnEsc = () => {
  document.onkeydown = (ev: KeyboardEvent) => {
    if (ev.key == "Escape") {
      menuStore.toggle();
    }
  };
};

const calculateScrollProgressOnResize = () => {
  const resizeObserver = new ResizeObserver((entries) => {
    for (const entry of entries) {
      if (entry.contentRect) {
        scrollProgressStore.calculatePageHeight();
      }
    }
  });

  const body = document.querySelector("body");
  resizeObserver.observe(body);
};

const scrollTo = (sectionId: SectionIds) => {
  const position = document.getElementById(sectionId).offsetTop - 32;
  window.scrollTo({ top: position, behavior: "smooth" });
};
</script>
