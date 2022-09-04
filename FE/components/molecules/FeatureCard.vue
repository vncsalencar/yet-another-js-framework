<template>
  <NuxtLink
    class="block w-full mx-auto border-solid p-2 border-2 border-white hover:border-[#f0db4f]"
    to="#"
    target="_blank"
  >
    <h3 class="text-xl">{{ props.featuredFramework.title }}</h3>
    <p class="line-clamp-2">{{ props.featuredFramework.description }}</p>
    <div class="flex flex-row items-center gap-2">
      <p>{{ props.featuredFramework.version }}</p>
      <span class="inline-block h-2 w-2 bg-gray-400 rounded-md"></span>
      <p>Published {{ props.featuredFramework.latestRelease }}</p>
    </div>
    <p>
      <small>
        Weekly downloads: {{ props.featuredFramework.weeklyDownloads }}
      </small>
    </p>
    <p>
      <small> Github ⭐: {{ props.featuredFramework.githubStars }} </small>
    </p>
  </NuxtLink>
</template>

<script setup lang="ts">
const props = defineProps<{
  featuredFramework: FeaturedFramework;
}>();
</script>
