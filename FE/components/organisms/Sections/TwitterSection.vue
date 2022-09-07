<template>
   <Section title="🐦 Twitter">
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-4">
        <FeaturedTweet tweet-id="1559912627643777025"></FeaturedTweet>
        <FeaturedTweet tweet-id="1564905995834384386"></FeaturedTweet>
        <FeaturedTweet tweet-id="1559912627643777025"></FeaturedTweet>
    </div>

    <div v-html="tiktok"></div>

   </Section>
</template>

<script setup lang="ts">

const tiktok = `<blockquote class="tiktok-embed" cite="https://www.tiktok.com/@anne8.0x/video/7139970718837607685" data-video-id="7139970718837607685" style="max-width: 605px;min-width: 325px;" > <section> <a target="_blank" title="@anne8.0x" href="https://www.tiktok.com/@anne8.0x?refer=embed">@anne8.0x</a> <p></p> <a target="_blank" title="♬ Originalton - ANNE" href="https://www.tiktok.com/music/Originalton-7139970737930095365?refer=embed">♬ Originalton - ANNE</a> </section> </blockquote> <script async src="https://www.tiktok.com/embed.js"></script>`
</script>
