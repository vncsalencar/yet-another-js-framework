<template>
  <Section bg-secondary>
    <template v-slot:title>
      TRENDING ON <span class="text-accent">NPM</span>...
    </template>
    <ul class="grid grid-cols-1 lg:grid-cols-3 gap-4">
      <CardNpm
        v-for="framework in npmPackages"
        :featured-framework="framework"
      ></CardNpm>
    </ul>
    <h2 class="mt-8 mb-4 text-center uppercase">
      ...AND <span class="text-accent">GITHUB</span>
    </h2>
    <ul class="flex flex-col gap-4">
      <CardGithub></CardGithub>
      <CardGithub></CardGithub>
      <CardGithub></CardGithub>
    </ul>
  </Section>
</template>

<script setup lang="ts">
import { Ref } from "vue";
import { ApiRouteEnum } from "~~/types/enums";

const config = useRuntimeConfig();
const API_URL = `${config.CMS}/${ApiRouteEnum.GithubTrending}`;

// const { data: githubTrendingList, pending } = await useFetch<
//   Page<GithubTrending>
// >(apiUrl);

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
