<template>
  <Section bg-secondary>
    <template v-slot:title>
      TRENDING ON NPM 
    </template>
    <ul class="grid grid-cols-1 lg:grid-cols-3 gap-4">
      <CardNpm
        v-for="framework in npmPackages"
        :featured-framework="framework"
      ></CardNpm>

      <!-- <FeatureNpmCardSkeleton
        v-if="loading"
        v-for="i in 3"
      ></FeatureNpmCardSkeleton> -->
    </ul>
  </Section>
</template>

<script setup lang="ts">
import { Ref } from "vue";


const npmPackages: Ref<NpmPackage[]> = ref([
  {
    title: "Vue",
    description:
      "The progressive JavaScript framework for building modern web UI.",
    version: "3.2.38",
    latestRelease: new Date("08/11/2021"),
    link: "https://www.npmjs.com/package/vue",
    weeklyDownloads: 4000000,
    githubStars: 32400,
  },
  {
    title: "Vue",
    description:
      "The progressive JavaScript framework for building modern web UI.",
    version: "3.2.38",
    latestRelease: new Date("09/11/2020"),
    link: "https://www.npmjs.com/package/vue",
    weeklyDownloads: 4000000,
    githubStars: 32400,
  },
  {
    title: "Vue",
    description:
      "The progressive JavaScript framework for building modern web UI.",
    version: "3.2.38",
    latestRelease: new Date("01/01/2022"),
    link: "https://www.npmjs.com/package/vue",
    weeklyDownloads: 4000000,
    githubStars: 32400,
  },
]);
</script>
