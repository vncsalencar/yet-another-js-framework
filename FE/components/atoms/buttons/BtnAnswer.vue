<template>
  <button
    :disabled="questionAnswered"
    ref="btnAnswer"
    @click="checkAnswer"
    class="p-4 text-white border-solid border-2 border-white"
    :class="{ 'hover-text-accent hover-border-accent': !questionAnswered }"
  >
    {{ text }}
  </button>
</template>

<script setup lang="ts">
const btnAnswer = ref(null);

const props = defineProps<{
  text: string;
  correct: boolean;
  questionAnswered: boolean;
}>();

const emit = defineEmits<{
  (e: "answerSelected", correct: boolean): void;
}>();

const checkAnswer = () => {
  if (props.correct) {
    console.log("acertou");
  }
  console.log("errou");

  emit("answerSelected", props.correct);
};
</script>

<style scoped></style>
