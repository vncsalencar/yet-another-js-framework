<template>
  <Section title="🤖 Reddit" bg-secondary>
    <div class="flex flex-col gap-4">
      <FeatureRedditPost :reddit-post-html="data"></FeatureRedditPost>
      <FeatureRedditPost :reddit-post-html="data2"></FeatureRedditPost>
      <FeatureRedditPost :reddit-post-html="data3"></FeatureRedditPost>
    </div>
  </Section>
</template>

<script setup lang="ts">
const data = `<iframe id="reddit-embed" src="https://www.redditmedia.com/r/AskReddit/comments/xaxx9g/who_is_universally_loved_but_actually_an_asshole/?ref_source=embed&amp;ref=share&amp;embed=true" sandbox="allow-scripts allow-same-origin allow-popups" style="border: none;" scrolling="no" width="640" height="126"></iframe>`
const data2 = `<iframe id="reddit-embed" src="https://www.redditmedia.com/r/pics/comments/xb0ufz/indiana_jones_and_the_temple_of_doom_stars/?ref_source=embed&amp;ref=share&amp;embed=true&amp;theme=dark" sandbox="allow-scripts allow-same-origin allow-popups" style="border: none;" scrolling="no" width="640" height="546"></iframe>`
const data3 = `<iframe id="reddit-embed" src="https://www.redditmedia.com/r/programming/comments/x7a0fr/i_created_a_monospaced_version_of_the_minecraft/?ref_source=embed&amp;ref=share&amp;embed=true&amp;theme=dark" sandbox="allow-scripts allow-same-origin allow-popups" style="border: none;" scrolling="no" width="640" height="145"></iframe>`
</script>
