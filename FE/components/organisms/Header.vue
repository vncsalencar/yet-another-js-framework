<template>
  <header class="sticky top-0 z-10 py-4 border-b-2 border-white bg-primary">
    <div class="flex justify-between items-center px-4 max-w-[1200px] mx-auto">
      <div>
        <h1 class="text-4xl hidden lg:block">
          YET ANOTHER <span class="text-[#f0db4f]">JS</span> FRAMEWORK...
        </h1>
        <h1 class="text-3xl block lg:hidden">
          YA<span class="text-[#f0db4f]">JS</span>F...
        </h1>
        <p class="hidden lg:block">Making sense of the Frontend world</p>
      </div>
      <!-- <a
      href="https://github.com/TulioAlcantara/yet-another-js-framework"
      target="_blank"
      class="hidden md:block text-white hover:text-[#f0db4f] underline"
      >Github
    </a> -->
      <button @click="toggleMenu" class="flex flex-col gap-1 group">
        <div
          class="w-5 h-[2px] rounded-md bg-white group-hover:bg-accent"
        ></div>
        <div
          class="w-5 h-[2px] rounded-md bg-white group-hover:bg-accent"
        ></div>
        <div
          class="w-5 h-[2px] rounded-md bg-white group-hover:bg-accent"
        ></div>
      </button>
    </div>
  </header>
</template>

<script setup lang="ts">
import { useMenuStore } from "../../stores/menuStore";

const store = useMenuStore();

onMounted(() => {
 
});

const toggleMenu = () => {
  store.toggle();
};
</script>
