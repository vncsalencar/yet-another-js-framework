<template>
  <header
    class="sticky top-0 h-[70px] md:h-[98px] z-10 py-4 border-b-2 border-white bg-primary"
    ref="header"
    id="header"
  >
    <div class="flex justify-between items-center px-4 max-w-[1200px] mx-auto">
      <div>
        <h1 class="text-primary hidden lg:block">
          YET ANOTHER <span class="text-[#f0db4f]">JS</span> FRAMEWORK...
        </h1>
        <h1 class="text-primary text-4xl block lg:hidden">
          YA<span class="text-[#f0db4f]">JS</span>F...
        </h1>
        <p class="hidden lg:block">Making sense of the Frontend world</p>
      </div>
      <BtnHamburger></BtnHamburger>
    </div>
  </header>
</template>

<script setup lang="ts">
import { storeToRefs } from "pinia";
import { useMenuStore } from "~/stores/menuStore";

const menuStore = useMenuStore();
const { active } = storeToRefs(menuStore);
const header = ref(null);
let lastScroll = 0;

// watch(active, (newActive, oldActive) => {
//   if (newActive != oldActive) {
//     header.value.classList.add("header-show");
//     header.value.classList.remove("header-hide");
//   }
// });

// onMounted(() => {
//   window.addEventListener("scroll", () => {
//     let currentScroll = window.pageYOffset;
//     if (currentScroll > lastScroll) {
//       header.value.classList.add("header-hide");
//       header.value.classList.remove("header-show");
//     } else {
//       header.value.classList.add("header-show");
//       header.value.classList.remove("header-hide");
//     }

//     lastScroll = currentScroll;
//   });
// });
</script>

<style scoped lang="scss">
h1 {
  -webkit-text-stroke-width: 1px;
  -webkit-text-stroke-color: white;

  span {
    -webkit-text-stroke-width: 0px;
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
