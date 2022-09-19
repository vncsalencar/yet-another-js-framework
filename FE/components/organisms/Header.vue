<template>
  <header
    class="sticky top-0 h-[70px] md:h-[98px] z-10 py-4 bg-accent"
    ref="header"
    id="header"
  >
    <div class="flex justify-between items-center px-4 max-w-[1200px] mx-auto">
      <div>
        <h1 class="text-primary hidden md:block">
          YET ANOTHER <span class="text-white">JS</span> FRAMEWORK...
        </h1>
        <h1 class="text-primary text-4xl block md:hidden">
          YA<span class="text-white">JS</span>F...
        </h1>
        <p class="hidden md:block">
          <b class="text-primary ">Making sense of the Frontend world</b>
        </p>
      </div>
      <BtnHamburger></BtnHamburger>
    </div>
  </header>
</template>

<script setup lang="ts">
import { storeToRefs } from "pinia";
import { useMenuStore } from "~/stores/menuStore";
import { useScrollProgressStore } from "~~/stores/scrollProgressStore";

const menuStore = useMenuStore();
const progressBarStore = useScrollProgressStore();
const { active } = storeToRefs(menuStore);
const header = ref(null);
let lastScroll = 0;

watch(active, (newActive, oldActive) => {
  if (newActive != oldActive) {
    showHeader();
  }
});

onMounted(() => {
  window.addEventListener("scroll", () => {
    let currentScroll = window.pageYOffset;
    if (currentScroll > lastScroll) {
      hideHeader();
    } else {
      showHeader();
    }

    lastScroll = currentScroll;
  });
});

const showHeader = () => {
  header.value.classList.add("header-show");
  header.value.classList.remove("header-hide");
  progressBarStore.primaryBackground()
};

const hideHeader = () => {
  header.value.classList.add("header-hide");
  header.value.classList.remove("header-show");
  progressBarStore.accentBackground()
};
</script>

<style scoped lang="scss">
h1 {
  span {
    -webkit-text-stroke-width: 2px;
    -webkit-text-stroke-color: rgb(40 42 54);
  }
}

#header {
  transition: translate 0.2s linear;
}

.header-hide {
  translate: 0 -70px;
}

.header-show {
  translate: 0 0;
}

@media (min-width: 768px) {
  .header-hide {
    translate: 0 -98px;
  }
}
</style>
