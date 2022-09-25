<template>
  <Section bg-secondary>
    <template v-slot:title>
      Helpful <span class="text-accent">Material</span>
    </template>
    <div class="flex flex-col gap-4">
      <Details v-for="material of materialList.data" :title="material.title">
        <ul>
          <li v-for="data of material.materials" class="pl-3">
            <a
              class="underline text-white hover:text-accent"
              :href="data.link"
              target="_blank"
              >{{ data.title }}</a
            >
          </li>
        </ul>
      </Details>
    </div>
  </Section>
</template>

<script setup lang="ts">
import { ApiRouteEnum } from "~~/types/enums";

const config = useRuntimeConfig();
const API_URL = `${config.CMS}/${ApiRouteEnum.HelpfulMaterial}`;

const { data: materialList } = await useFetch<Page<HelpfulMaterial>>(API_URL, {
  params: {
    page_size: 5,
  },
});
</script>
