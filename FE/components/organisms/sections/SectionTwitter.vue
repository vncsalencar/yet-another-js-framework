<template>
  <Section title="🐦 Twitter" bg-secondary>
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-4">
      <CardTweet :tweet-html="tweetHTML[0]"></CardTweet>
      <CardTweet :tweet-html="tweetHTML[0]"></CardTweet>
      <CardTweet :tweet-html="tweetHTML[0]"></CardTweet>
    </div>
  </Section>
</template>

<script setup lang="ts">
useHead({
  script: [
    {
      src: "https://platform.twitter.com/widgets.js",
      body: true,
    },
  ],
});
const tweetHTML = [
  `<blockquote class="twitter-tweet" data-lang="en" data-theme="dark"><p lang="en" dir="ltr">Sunsets don&#39;t get much better than this one over <a href="https://twitter.com/GrandTetonNPS?ref_src=twsrc%5Etfw">@GrandTetonNPS</a>. <a href="https://twitter.com/hashtag/nature?src=hash&amp;ref_src=twsrc%5Etfw">#nature</a> <a href="https://twitter.com/hashtag/sunset?src=hash&amp;ref_src=twsrc%5Etfw">#sunset</a> <a href="http://t.co/YuKy2rcjyU">pic.twitter.com/YuKy2rcjyU</a></p>&mdash; US Department of the Interior (@Interior) <a href="https://twitter.com/Interior/status/463440424141459456?ref_src=twsrc%5Etfw">May 5, 2014</a></blockquote>`,
];
</script>
