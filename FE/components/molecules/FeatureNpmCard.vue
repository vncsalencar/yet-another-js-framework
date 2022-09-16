<template>
  <li>
  <NuxtLink
    class="block w-full mx-auto border-solid p-2 border-2 border-white transition duration-300 hover:border-[#f0db4f]"
    to="#"
    target="_blank"
  >
    <h3 class="text-xl">{{ featuredFramework.title }}</h3>
    <p class="line-clamp-2">{{ featuredFramework.description }}</p>
    <div class="flex flex-row items-center gap-2">
      <p>{{ featuredFramework.version }}</p>
      <span class="inline-block h-2 w-2 bg-white rounded-md"></span>
      <p>Published {{ formatTimeAgo(featuredFramework.latestRelease) }}</p>
    </div>
    <p>
      <small>
        Weekly downloads: {{ formatCompactNumber(featuredFramework.weeklyDownloads)}}
      </small>
    </p>
    <p>
      <small> Github ⭐: {{ formatCompactNumber(featuredFramework.githubStars) }} </small>
    </p>
  </NuxtLink>
</li>
</template>

<script setup lang="ts">
defineProps<{
  featuredFramework: NpmPackage;
}>();
</script>
