<template>
  <article
    iv
    class="flex justify-between gap-4 w-100 py-4 border-b-2 border-white"
  >
    <div>
      <small class="text-accent">{{ contentType }}</small>
      <p>
        <b class="mb-2">{{ content.author }}</b>
      </p>
      <a :href="content.link" target="_blank">
        <h3 class="text-xl mb-1 cursor-pointer hover:text-accent">
          {{ content.title }}
        </h3>
      </a>
      <p class="mb-4">
        <small>{{ content.date }}</small>
      </p>
      <div class="flex gap-4 mb-2">
        <Chip v-for="tag in content.tags" :title="tag"></Chip>
      </div>
    </div>
    <div class="hidden md:block">
      <Thumbnail v-bind="thumbnail" :link="content.link"></Thumbnail>
    </div>
  </article>
</template>

<script setup lang="ts">
import { onMounted, ref } from "vue";
import { ContentType } from "../../types/enums";

const props = defineProps<{
  content: Content;
}>();

const contentType = ContentType[props.content.type];
const thumbnail = ref(props.content.thumbnail)

onMounted(() => {
  defineThumbnail();
});

const defineThumbnail = () => {
  if (props.content.type == ContentType.Video) {
    thumbnail.value  = {
      alt: `Youtube Video ${props.content.title}`,
      url: getYoutubeThumbnail(),
    };
  }

  if (props.content.type == ContentType.Project) {
    thumbnail.value = {
      alt: "Github",
      url: "/assets/images/github-logo.png",
    };
  }
};

const getYoutubeThumbnail = (): string => {
  const videoId = props.content.link.split("v=")[1];
  return `https://img.youtube.com/vi/${videoId}/sddefault.jpg`;
};
</script>
