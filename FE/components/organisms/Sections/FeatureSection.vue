<template>
  <Section title="🔥 Trending">
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-4">
      <FeatureCard
        v-for="framework in featureFrameworks"
        :featured-framework="framework"
      ></FeatureCard>
    </div>
  </Section>
</template>

<script setup lang="ts">
const featureFrameworks: FeaturedFramework[] = [
  {
    title: "Vue",
    description:
      "The progressive JavaScript framework for building modern web UI.",
    version: "3.2.38",
    latestRelease: "4 days ago",
    link: "https://www.npmjs.com/package/vue",
    weeklyDownloads: 4000000,
    githubStars: 32400,
  },
  {
    title: "Vue",
    description:
      "The progressive JavaScript framework for building modern web UI.",
    version: "3.2.38",
    latestRelease: "4 days ago",
    link: "https://www.npmjs.com/package/vue",
    weeklyDownloads: 4000000,
    githubStars: 32400,
  },
  {
    title: "Vue",
    description:
      "The progressive JavaScript framework for building modern web UI.",
    version: "3.2.38",
    latestRelease: "4 days ago",
    link: "https://www.npmjs.com/package/vue",
    weeklyDownloads: 4000000,
    githubStars: 32400,
  },
];
</script>
