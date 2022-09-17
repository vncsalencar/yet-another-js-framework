<!-- TODO: Create focus trap for this component -->

<template>
  <Transition name="menu">
    <div
      class="fixed flex h-screen w-screen justify-center items-center z-30 pb-[70px] md:pb-[70px] top-[70px] md:top-[98px] overflow-hidden bg-primary"
      v-show="store.active"
    >
      <MenuList
        @change-section="changeSection"
        :list-items="listItems"
      ></MenuList>
    </div>
  </Transition>
</template>

<script setup lang="ts">
import { storeToRefs } from "pinia";
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

<style scoped>
@keyframes menu-closing {
  from {
    transform: translate(0%);
  }
  to {
    transform: translate(100%);
  }
}

@keyframes menu-opening {
  from {
    transform: translate(100%);
  }
  to {
    transform: translate(0%);
  }
}

.menu-enter-active {
  animation: menu-opening 0.2s linear;
}

.menu-leave-active {
  animation: menu-closing 0.2s linear;
}
</style>
