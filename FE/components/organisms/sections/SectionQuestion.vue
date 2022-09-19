<template>
  <Section bg-secondary class="flex justify-center">
    <template v-slot:title>
      <span class="text-accent">Question</span> of the day
    </template>
    <p class="my-6 text-center">Which is the best?</p>
    <div class="flex flex-col gap-4">
      <BtnAnswer
        @answer-selected="checkAnswer"
        v-for="answer of answers"
        :text="answer.text"
        :is-correct="answer.isCorrect"
        :class="{
          'border-[#00ff00]': questionAnswered && answer.isCorrect,
          'border-[#ff0000]': questionAnswered && !answer.isCorrect,
        }"
      ></BtnAnswer>
    </div>
  </Section>
</template>

<script setup lang="ts">
const questionAnswered = ref(false);
const answers = [
  { text: "Angular", isCorrect: false },
  { text: "React", isCorrect: false },
  { text: "Vue", isCorrect: true },
  { text: "Svelte", isCorrect: false },
];

const checkAnswer = () => {
  questionAnswered.value = true;
};
</script>

<style scoped></style>
