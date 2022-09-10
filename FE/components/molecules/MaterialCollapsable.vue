<template>
  <details class="p-2 border-2 border-solid border-white text-white">
    <summary class="cursor-pointer">HTML</summary>
    <div>
      <ul>
        <!-- <li v-for="item of content">
        </li> -->

        <li class="pl-3">
          <a class="underline hover:text-accent" href="www.uol.com.br" target="_blank">test 1</a>
        </li>

        <li class="pl-3">
          <a class="underline hover:text-accent" href="www.uol.com.br" target="_blank">test 1</a>
        </li>

        <li class="pl-3">
          <a class="underline hover:text-accent" href="www.uol.com.br" target="_blank">test 1</a>
        </li>

      </ul>
    </div>
  </details>
</template>

<script setup lang="ts">
defineProps<{ title: string; content: [] }>();
</script>
