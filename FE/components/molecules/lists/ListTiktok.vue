<template>
  <div class="flex flex-col lg:flex-row justify-center items-center lg:gap-4">
    <CardTiktok :tiktok-html="data"></CardTiktok>
    <CardTiktok :tiktok-html="data"></CardTiktok>
    <CardTiktok :tiktok-html="data"></CardTiktok>
  </div>
</template>

<script setup lang="ts">
useHead({
  script: [
    {
      src: "https://www.tiktok.com/embed.js",
      body: true,
    },
  ],
});
const data = `<blockquote class="tiktok-embed" cite="https://www.tiktok.com/@jomaoppa/video/7085420569780440366" data-video-id="7085420569780440366" style="max-width: 605px;min-width: 325px;" > <section> <a target="_blank" title="@jomaoppa" href="https://www.tiktok.com/@jomaoppa?refer=embed">@jomaoppa</a> <a title="coding" target="_blank" href="https://www.tiktok.com/tag/coding?refer=embed">#coding</a> <a title="programming" target="_blank" href="https://www.tiktok.com/tag/programming?refer=embed">#programming</a> <a title="tech" target="_blank" href="https://www.tiktok.com/tag/tech?refer=embed">#tech</a> <a title="computerscience" target="_blank" href="https://www.tiktok.com/tag/computerscience?refer=embed">#computerscience</a> <a title="math" target="_blank" href="https://www.tiktok.com/tag/math?refer=embed">#math</a> <a target="_blank" title="♬ original sound - Joma" href="https://www.tiktok.com/music/original-sound-7085420544572787502?refer=embed">♬ original sound - Joma</a> </section> </blockquote>`;
</script>
