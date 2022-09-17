<template>
  <header
    class="sticky top-0 h-[70px] md:h-[98px] z-10 py-4 border-b-2 border-white bg-primary"
    ref="header"
  >
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
      <BtnHamburger></BtnHamburger>
    </div>
  </header>
</template>

<script setup lang="ts"></script>
