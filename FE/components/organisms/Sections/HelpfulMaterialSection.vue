<template>
  <Section title="🎓 Helpful Material">
    <div class="flex flex-col gap-4">
      <MaterialCollapsable
        v-for="material of data"
        :helpful-material="material"
      ></MaterialCollapsable>
    </div>

    <pre>{{materialList}}</pre>
  </Section>
</template>

<script setup lang="ts">
import { API_CMS } from "~/constants";

const { data: materialList, pending } = await useFetch(
  `${API_CMS}?content-type=helpful`
);


const data: HelpfulMaterial[] = [
  { title: "Javascript", content: [{ title: "test 1", link: "#" }] },
  { title: "HTML", content: [{ title: "test 1", link: "#" }] },
  { title: "CSS", content: [{ title: "test 1", link: "#" }] },
];
</script>
