<template>
  <div id="scroll-progress" class="fixed top w-0 h-1 bg-accent z-20"></div>
</template>

<script setup lang="ts">
onMounted(() => {
  const scrollProgress = document.getElementById("scroll-progress");
  const height =
    document.documentElement.scrollHeight -
    document.documentElement.clientHeight;

  window.addEventListener("scroll", () => {
    const scrollTop =
      document.body.scrollTop || document.documentElement.scrollTop;
    scrollProgress.style.width = `${(scrollTop / height) * 100}%`;
  });
});
</script>
