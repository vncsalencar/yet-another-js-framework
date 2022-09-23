<template>
  <li>
    <a
      :href="content.link"
      target="_blank"
      class="flex justify-between items-center gap-4 w-100 py-4 border-b-2 border-white group"
    >
      <div class="flex justify-start flex-col gap-2">
        <b class="text-accent">{{ content.contentType }}</b>
        <small>
          {{ content.author }}
        </small>
        <h3
          class="cursor-pointer line-clamp-2 md:line-clamp-1 group-hover-text-accent"
        >
          {{ content.title }}
        </h3>
        <small>{{ formatTimeAgo(new Date(content.date)) }}</small>
        <div class="flex flex-wrap gap-4">
          <Chip v-for="tag in tags" :title="tag"></Chip>
        </div>
      </div>
      <div class="hidden md:block">
        <Thumbnail v-bind="thumbnail" :link="content.link"></Thumbnail>
      </div>
    </a>
  </li>
</template>

<script setup lang="ts">
import { ContentTypeEnum } from "../../../types/enums";

const props = defineProps<{
  content: Content;
}>();

const tags = computed(() => {
  let tags = props.content.tags;
  if (tags && tags.includes(",")) {
    let tagsArray = tags.split(",");
    tagsArray = tagsArray.map((element) => element.trim());
    return tagsArray;
  }
  return [tags];
});

const thumbnail = computed(() => {
  if (props.content.contentType == ContentTypeEnum.Video) {
    return {
      alt: `Youtube Video ${props.content.title}`,
      url: getYoutubeThumbnail(),
    };
  }

  if (props.content.contentType == ContentTypeEnum.Project) {
    return {
      alt: "Github",
      url: "/images/logo-github.png",
    };
  }

  if (props.content.contentType == ContentTypeEnum.Article) {
    return {
      alt: props.content.thumbnailAlt || props.content.title,
      url: props.content.thumbnailUrl || getArticleThumbnail(),
    };
  }
});

const getYoutubeThumbnail = (): string => {
  const videoId = props.content.link.split("v=")[1];
  return `https://img.youtube.com/vi/${videoId}/maxresdefault.jpg`;
};

const getArticleThumbnail = (): string => {
  if (tags.value.includes("javascript")) {
    return "/images/logo-js.png";
  }

  if (tags.value.includes("html")) {
    return "/images/logo-html.png";
  }

  if (tags.value.includes("css")) {
    return "/images/logo-css.png";
  }
};
</script>
