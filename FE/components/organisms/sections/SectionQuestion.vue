<template>
  <Section bg-secondary class="flex justify-center">
    <template v-slot:title>
      <span class="text-accent">Question</span> of the day
    </template>
    <p class="my-6 text-center">Which is the best?</p>
    <div class="flex flex-col gap-4">
      <BtnAnswer text="Angular"></BtnAnswer>
      <BtnAnswer text="React"></BtnAnswer>
      <BtnAnswer text="Vue"></BtnAnswer>
      <BtnAnswer text="Svelte"></BtnAnswer>
    </div>
  </Section>
</template>

<script setup lang="ts"></script>

<style scoped></style>
