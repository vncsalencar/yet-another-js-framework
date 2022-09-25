<template>
  <li>
    <a
      class="group flex flex-col gap-2 w-full mx-auto p-4 bg-primary hover-text-accent"
      :href="link"
      target="_blank"
    >
      <h3 class="group-hover-text-accent">{{ githubTrending.title }}</h3>
      <p class="line-clamp-3 md:line-clamp-1">
        {{ githubTrending.description }}
      </p>
      <div class="flex items-center gap-2">
        <span class="block w-[12px] h-[12px] rounded-md" :class="isJS()"></span>
        <small>{{ githubTrending.language }}</small>
      </div>

      <div class="flex items-center gap-4">
        <small>⭐{{ formatCompactNumber(githubTrending.stars) }}</small>
        <span class="inline-block h-2 w-2 bg-white rounded-md"></span>
        <small>forks: {{ formatCompactNumber(githubTrending.forks) }}</small>
        <span class="inline-block h-2 w-2 bg-white rounded-md"></span>
        <small
          >⭐{{ formatCompactNumber(githubTrending.starsToday) }} today</small
        >
      </div>
    </a>
  </li>
</template>

<script setup lang="ts">
const props = defineProps<{
  githubTrending: GithubTrending;
}>();

const link = `https://www.github.com/${props.githubTrending.title}`;

const isJS = (): string => {
  if (props.githubTrending.language == "JavaScript") return "bg-accent";
  return "bg-blue";
};
</script>
