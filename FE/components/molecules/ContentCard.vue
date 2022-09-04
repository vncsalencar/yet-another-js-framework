<template>
  <div class="flex justify-between w-100 py-4 border-b-2 border-white">
    <div>
      <small>Article</small>
      <h3 class="text-xl mb-2 ">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
      </h3>
      <b class="mb-2">Author: Tulio</b>
      <p class="mb-2"><small>09/11/2022</small></p>
      <div class="flex gap-4 mb-2">
        <ContentChip></ContentChip>
        <ContentChip></ContentChip>
        <ContentChip></ContentChip>
      </div>
    </div>
    <div class="hidden md:block">
      <ContentThumbnail></ContentThumbnail>
    </div>
  </div>
</template>

<script setup lang="ts"></script>
