<template>
  <details
    class="group p-4  text-white bg-secondary"
  >
    <summary
      class="group-hover-text-accent"
    >
      {{ helpfulMaterial.title }}
    </summary>
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
