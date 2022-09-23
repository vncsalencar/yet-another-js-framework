<template>
  <Section bg-secondary>
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
import { ApiRouteEnum } from '~~/types/enums';

const config = useRuntimeConfig();
const API_URL = `${config.CMS}/${ApiRouteEnum.HelpfulMaterial}`;

const { data: materialList, pending } = await useFetch<Page<HelpfulMaterial>>(
  API_URL,
  {
    params:{
      page_size: 5
    }
  }
);
</script>
