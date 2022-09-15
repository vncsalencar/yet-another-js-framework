<template>
  <Section title="🎓 Helpful Material">
    <div class="flex flex-col gap-4">
      <MaterialCollapsable
        v-for="material of data"
        :helpful-material="material"
      ></MaterialCollapsable>
    </div>

    <!-- <pre>{{materialList}}</pre> -->
  </Section>
</template>

<script setup lang="ts">
const config = useRuntimeConfig();
const { data: contentList, pending } = await useFetch(
  `${config.CMS}?content-type=helpful`
);

const data: HelpfulMaterial[] = [
  { title: "Javascript", content: [{ title: "test 1", link: "#" }] },
  { title: "HTML", content: [{ title: "test 1", link: "#" }] },
  { title: "CSS", content: [{ title: "test 1", link: "#" }] },
];
</script>
