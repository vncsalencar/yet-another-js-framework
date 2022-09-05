<template>
  <NuxtLink
    class="block w-full mx-auto border-solid p-2 border-2 border-white hover:border-[#f0db4f]"
    to="#"
    target="_blank"
  >
    <h3 class="text-xl">{{ featuredFramework.title }}</h3>
    <p class="line-clamp-2">{{ featuredFramework.description }}</p>
    <div class="flex flex-row items-center gap-2">
      <p>{{ featuredFramework.version }}</p>
      <span class="inline-block h-2 w-2 bg-white rounded-md"></span>
      <p>Published {{ featuredFramework.latestRelease }}</p>
    </div>
    <p>
      <small>
        Weekly downloads: {{ featuredFramework.weeklyDownloads }}
      </small>
    </p>
    <p>
      <small> Github ⭐: {{ featuredFramework.githubStars }} </small>
    </p>
  </NuxtLink>
</template>

<script setup lang="ts">
defineProps<{
  featuredFramework: FeaturedFramework;
}>();
</script>
