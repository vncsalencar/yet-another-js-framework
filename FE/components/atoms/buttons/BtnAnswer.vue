<template>
  <button
    :disabled="questionAnswered"
    @click="checkAnswer"
    class="p-4 btn-primary"
  >
    {{ text }}
  </button>
</template>

<script setup lang="ts">
const props = defineProps<{
  text: string;
  correct: boolean;
  questionAnswered: boolean;
}>();

const emit = defineEmits<{
  (e: "answerSelected", correct: boolean): void;
}>();

const checkAnswer = () => {
  emit("answerSelected", props.correct);
};
</script>

<style scoped></style>
