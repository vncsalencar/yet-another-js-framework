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
    <ul v-if="!pending" class="flex flex-col gap-4">
      <CardGithub
        v-for="github of trendingList.data"
        :github-trending="github"
      ></CardGithub>
    </ul>

    <ul v-else class="flex flex-col gap-4">
      <SkeletonCardGithub v-for="i in 3"></SkeletonCardGithub>
    </ul>

    <Pagination
      :active-page="activePage"
      :page-count="pageCount"
      :max-pages="maxPages"
      @page-change="pageChange"
    ></Pagination>
  </Section>
</template>

<script setup lang="ts">
import { Ref } from "vue";
import { ApiRouteEnum } from "~~/types/enums";
import SkeletonCardGithub1 from "~~/components/molecules/skeleton-cards/SkeletonCardGithub.vue";

const config = useRuntimeConfig();
const API_URL = `${config.CMS}/${ApiRouteEnum.Trending}`;

const activePage = ref(1);
const pageCount = ref(0);
const maxPages = ref(3);

const { data: trendingList, pending } = await useFetch<Page<GithubTrending>>(
  API_URL
);
pageCount.value = trendingList.value.meta.pagination.pageCount;

const pageChange = async (newPage: number) => {
  activePage.value = newPage;
  pending.value = true;
  trendingList.value = await $fetch(API_URL, {
    params: {
      page: newPage,
    },
  });
  pending.value = false;
};

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
