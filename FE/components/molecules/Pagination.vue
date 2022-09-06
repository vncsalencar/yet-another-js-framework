<template>
  <ul class="flex justify-end gap-2 mt-4">
    '
    <button
      aria-label="Previous page"
      class="w-8 h-8 border-solid border-2 border-white text-white hover:text-accent"
      @click="previousPage"
      v-show="activePage > 1"
    >
      &lt
    </button>

    <PageBtn
      v-for="i in pages"
      :page-number="i"
      @page-change="upatePages"
      :active="i == activePage"
    ></PageBtn>

    <button
      aria-label="Next page"
      class="w-8 h-8 border-solid border-2 border-white text-white hover:text-accent"
      @click="nextPage"
      v-show="activePage < pages"
    >
      &gt
    </button>
  </ul>
</template>

<script setup lang="ts">
import PageBtnVue from '~~/components/atoms/PageBtn.vue';

const props = defineProps<{ pages: number }>();
const activePage = ref(1);

const upatePages = (pageClicked) => {
  activePage.value = pageClicked
};

const nextPage = () =>{
  activePage.value++
}

const previousPage = () =>{
  activePage.value--
}

</script>
