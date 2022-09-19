<template>
  <button
    ref="btnAnswer"
    @click="checkAnswer"
    class="p-4 w-100 text-white border-solid border-2 border-white hover-text-accent hover-border-accent"
  >
    {{ text }}
  </button>
</template>

<script setup lang="ts">
const btnAnswer = ref(null);

const props = defineProps<{
  text: string;
  isCorrect: boolean;
}>();

const emit = defineEmits<{
  (e: "answerSelected"): void;
}>();

const checkAnswer = () => {
  if (props.isCorrect) {
    console.log("acertou");
    return;
  }
  console.log("errou");

  emit("answerSelected");
};
</script>

<style scoped></style>
