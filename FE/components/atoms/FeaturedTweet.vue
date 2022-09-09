<template>
    <Tweet align="center" theme="dark" :tweet-id="tweetId" />
</template>

<script setup lang="ts">
import Tweet from "vue-tweet";

const props = defineProps<{ tweetId: string }>();
</script>
