<template>
  <div id="scroll-progress" class="fixed top w-0 h-1 bg-accent z-20"></div>
</template>

<script setup lang="ts">
import { storeToRefs } from "pinia";
import { useScrollProgressStore } from "~/stores/scrollProgressStore";

const store = useScrollProgressStore();
const { pageHeight } = storeToRefs(store);

onMounted(() => {
  store.calculatePageHeight();
  calculateBar();
});

watch(pageHeight, (oldHeight: number, newHeight: number) => {
  if(oldHeight != newHeight){
    calculateBar();
  }
});


const calculateBar = () => {
  const scrollProgress = document.getElementById("scroll-progress");
  const height = pageHeight.value;

  window.addEventListener("scroll", () => {
    const scrollTop =
      document.body.scrollTop || document.documentElement.scrollTop;

    scrollProgress.style.width = `${(scrollTop / height) * 100}%`;
  });
};
</script>
