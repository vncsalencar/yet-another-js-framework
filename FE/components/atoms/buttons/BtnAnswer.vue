<template>
  <button
    :disabled="questionAnswered"
    @click="checkAnswer"
    class="p-4 btn-primary"
  >
    <span class="mr-4 font-bold text-accent" v-show="selected">X</span
    >{{ text }}
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

const selected = ref(false);

const checkAnswer = () => {
  selected.value = true;
  emit("answerSelected", props.correct);
};
</script>

<style scoped></style>
