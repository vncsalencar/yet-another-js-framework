<template>
  <button
    :disabled="answered"
    @click="checkAnswer"
    class="btn-primary w-full flex"
    :class="{ 'bg-primary': answered && alternative == selected }"
  >
    {{ text }}
  </button>
</template>

<script setup lang="ts">
const props = defineProps<{
  text: string;
  correct: boolean;
  alternative: string;
  answered: boolean;
  selected: string;
}>();

const emit = defineEmits<{
  (e: "answerSelected", correct: boolean, selected: string): void;
}>();

const checkAnswer = () => {
  emit("answerSelected", props.correct, props.alternative);
};
</script>

<style scoped></style>
