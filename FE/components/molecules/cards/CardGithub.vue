<template>
  <li>
    <a
      class="group flex flex-col gap-2 w-full mx-auto p-4 border-solid border-2 border-white hover-border-accent"
      href="#"
      target="_blank"
    >
      <h3 class="group-hover-text-accent">discordjs / discord.js</h3>
      <p class="line-clamp-3 md:line-clamp-1">
        A powerful JavaScript library for interacting with the Discord API
      </p>
      <div class="flex flex-row items-center gap-4">
        <div class="flex items-center gap-2">
          <span class="block w-[12px] h-[12px] bg-accent rounded-md"></span>
          <small>JavaScript</small>
        </div>
        <small>⭐ {{ formatCompactNumber(30000) }}</small>
        <small>forks {{ formatCompactNumber(30000) }}</small>
      </div>
    </a>
  </li>
</template>

<script setup lang="ts"></script>
