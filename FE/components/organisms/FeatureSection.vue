<template>
  <section>
    <h2 class="text-2xl mb-4 text-center uppercase">🔥Upcoming Frameworks</h2>
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-4">
      <FeatureCard
        v-for="framework in featureFrameworks"
        :featured-framework="framework"
      ></FeatureCard>
    </div>
  </section>
</template>

<script setup lang="ts">
const featureFrameworks = [
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
