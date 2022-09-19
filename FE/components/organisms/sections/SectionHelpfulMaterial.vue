<template>
  <Section>
    <template v-slot:title>
      Helpful <span class="text-accent">Material</span> 
    </template>
    <div class="flex flex-col gap-4">
      <CardHelpfulMaterial
        v-for="material of materialList.data"
        :helpful-material="material"
      ></CardHelpfulMaterial>
    </div>
  </Section>
</template>

<script setup lang="ts">
import CardHelpfulMaterial from '~~/components/molecules/cards/CardHelpfulMaterial.vue';
const config = useRuntimeConfig();
const { data: materialList, pending } = await useFetch<Page<HelpfulMaterial>>(
  `${config.CMS}/helpful`
);
</script>
