<template>
  <div
    class="fixed h-screen w-screen m-0 p-0 z-50 bg-white overflow-hidden"
    v-show="store.active"
  >
    <button @click="closeMenu" aria-label="Close Menu">X</button>
    <ul>
      <li><a href="#">Home</a></li>
      <li><a href="#">About</a></li>
      <li><a href="#">Services</a></li>
      <li><a href="#">Portfolio</a></li>
      <li><a href="#">Contact Us</a></li>
    </ul>
  </div>
</template>

<script setup lang="ts">
import { useMenuStore } from "../../stores/menuStore";
const store = useMenuStore();

const closeMenu = () => {
  store.toggle();
};
</script>

<style scoped></style>
