<template>
  <li
    iv
    class="flex justify-between gap-3 w-100 h-[186px] py-4 border-b-2 border-white"
  >
    <div class="flex flex-col gap-2">
      <AnimatedPlaceholder width="80px" height="24px"></AnimatedPlaceholder>
      <AnimatedPlaceholder width="150px" height="28px"></AnimatedPlaceholder>
      <AnimatedPlaceholder width="250px" height="20px"></AnimatedPlaceholder>
      <AnimatedPlaceholder width="120px" height="24px"></AnimatedPlaceholder>

      <div class="flex flex-wrap gap-4 mb-2">
        <AnimatedPlaceholder
          v-for="i in 3"
          width="60px"
          height="20px"
          border-radius="6px"
        ></AnimatedPlaceholder>
      </div>
    </div>
    <div class="hidden md:block">
      <AnimatedPlaceholder width="250px" height="150px"></AnimatedPlaceholder>
    </div>
  </li>
</template>
