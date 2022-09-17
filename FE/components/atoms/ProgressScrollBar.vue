<template>
  <Transition name="progress-scroll">
    <div
      v-show="!menuStore.active"
      id="scroll-progress"
      class="fixed top w-0 h-1 bg-accent z-20"
    ></div>
  </Transition>
</template>

<script setup lang="ts">
import { storeToRefs } from "pinia";
import { useScrollProgressStore } from "~/stores/scrollProgressStore";
import { useMenuStore } from "~~/stores/menuStore";

const scollStore = useScrollProgressStore();
const menuStore = useMenuStore();
const { pageHeight } = storeToRefs(scollStore);
const scrollWidth = ref("");

onMounted(() => {
  scollStore.calculatePageHeight();
  calculateBar();
});

watch(pageHeight, (oldHeight: number, newHeight: number) => {
  if (oldHeight != newHeight) {
    calculateBar();
  }
});

const calculateBar = () => {
  const scrollProgress = document.getElementById("scroll-progress");
  const height = pageHeight.value;

  window.addEventListener("scroll", () => {
    const scrollTop =
      document.body.scrollTop || document.documentElement.scrollTop;

    scrollWidth.value = `${(scrollTop / height) * 100}%`;
    scrollProgress.style.width = scrollWidth.value;
  });
};
</script>

<style scoped>
@keyframes progress-scroll-closing {
  from {
    width: v-bind(scrollWidth);
  }
  to {
    width: 0;
  }
}

@keyframes progress-scroll-opening {
  from {
    width: 0;
  }
  to {
    width: v-bind(scrollWidth);
  }
}

.progress-scroll-enter-active {
  animation: progress-scroll-opening 0.2s linear;
}

.progress-scroll-leave-active {
  animation: progress-scroll-closing 0.2s linear;
}
</style>
