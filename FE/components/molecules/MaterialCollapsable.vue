<template>
  <details class="p-2 border-2 border-solid text-white border-white hover:border-accent">
    <summary class="cursor-pointer focus-visible:outline-none">{{ helpfulMaterial.title }}</summary>
    <div>
      <ul>
        <li v-for="material of helpfulMaterial.materials" class="pl-3">
          <a
            class="underline hover:text-accent"
            :href="material.link"
            target="_blank"
            >{{ material.title }}</a
          >
        </li>
      </ul>
    </div>
  </details>
</template>

<script setup lang="ts">
defineProps<{
  helpfulMaterial: HelpfulMaterial;
}>();
</script>
