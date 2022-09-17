<template>
  <Section title="🎓 Helpful Material">
    <div class="flex flex-col gap-4">
      <MaterialCollapsable
        v-for="material of materialList.data"
        :helpful-material="material"
      ></MaterialCollapsable>
    </div>
  </Section>
</template>

<script setup lang="ts">
const config = useRuntimeConfig();
const { data: materialList, pending } = await useFetch<Page<HelpfulMaterial>>(
  `${config.CMS}/helpful`
);
</script>
