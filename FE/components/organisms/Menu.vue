<!-- TODO: Create focus trap for this component -->

<template>
  <div
    class="fixed flex h-screen w-screen justify-center items-center m-0 p-0 z-30 overflow-hidden bg-primary"
    v-show="store.active"
  >
    <h1 class="absolute top-8 text-4xl hidden lg:block">
      YET ANOTHER <span class="text-[#f0db4f]">JS</span> FRAMEWORK...
    </h1>
    <h1 class="absolute top-8 text-3xl block lg:hidden">
      YA<span class="text-[#f0db4f]">JS</span>F...
    </h1>
    <button
      class="absolute right-8 top-8 text-3xl text-white hover:text-accent hover:scale-150 transition-all"
      @click="closeMenu"
      aria-label="Close Menu"
    >
      X
    </button>

    <MenuList
      @change-section="changeSection"
      :list-items="listItems"
    ></MenuList>
  </div>
</template>

<script setup lang="ts">
import { useMenuStore } from "../../stores/menuStore";

const emit = defineEmits<{
  (e: "changeSection", sectionId: SectionIds): void;
}>();

const store = useMenuStore();

const closeMenu = () => {
  store.toggle();
};

const changeSection = (sectionId: SectionIds) => {
  closeMenu();
  emit("changeSection", sectionId);
};

const listItems = [
  { name: "🏠 Home 🏠", sectionId: "home" as SectionIds },
  { name: "🔥 Trending on NPM 🔥", sectionId: "feature" as SectionIds },
  { name: "📚 Content we liked 📚", sectionId: "content" as SectionIds },
  { name: "🐦 Twitter 🐦", sectionId: "twitter" as SectionIds },
  { name: "🎵 Tiktok 🎵", sectionId: "tiktok" as SectionIds },
  { name: "🤖 Reddit 🤖", sectionId: "reddit" as SectionIds },
  { name: "🎓 Helpful Material 🎓", sectionId: "helpful" as SectionIds },
  { name: "ℹ About this project ℹ", sectionId: "about" as SectionIds },
];
</script>

<style scoped></style>
