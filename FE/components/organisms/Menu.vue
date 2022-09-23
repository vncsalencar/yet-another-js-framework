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
import { SectionIdEnum } from "~~/types/enums";
import { useMenuStore } from "../../stores/menuStore";

const emit = defineEmits<{
  (e: "changeSection", sectionId: SectionIdEnum): void;
}>();

const store = useMenuStore();

const closeMenu = () => {
  store.toggle();
};

const changeSection = (sectionId: SectionIdEnum) => {
  closeMenu();
  emit("changeSection", sectionId);
};

const listItems = [
  { name: "Trending on NPM and Github", sectionId: SectionIdEnum.Trending },
  { name: "Content we liked", sectionId: SectionIdEnum.Content },
  { name: "Question of the day", sectionId: SectionIdEnum.Question },
  { name: "Helpful Material", sectionId: SectionIdEnum.HelpfulMaterial },
  { name: "About this project", sectionId: SectionIdEnum.About },
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
