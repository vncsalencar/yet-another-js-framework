<template>
  <li>
  <a
    class="group block w-full mx-auto p-4 bg-primary"
    href="#"
    target="_blank"
  >
    <h3 class="group-hover-text-accent">{{ featuredFramework.title }}</h3>
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
  </a>
</li>
</template>

<script setup lang="ts">
defineProps<{
  featuredFramework: NpmPackage;
}>();
</script>
