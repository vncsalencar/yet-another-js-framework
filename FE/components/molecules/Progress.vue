<template>
  <Details title="Progress" ref="progress" v-show="answered">
    <ul class="flex flex-col md:flex-row gap-8 justify-evenly mt-4">
      <li class="flex flex-col items-center">
        <b class="text-2xl text-accent align-middle">{{
          progressData.questionsAnswered
        }}</b>
        <p class="text-center">Questions Answered</p>
      </li>

      <li class="flex flex-col items-center">
        <b class="text-2xl text-accent align-middle"
          >{{ Number(progressData.correctPercentage).toFixed(2) }}%</b
        >
        <p class="text-center">Answered Correctly</p>
      </li>

      <li class="flex flex-col items-center">
        <b class="text-2xl text-accent align-middle">{{
          progressData.currentStreak
        }}</b>
        <p class="text-center">Current Streak</p>
      </li>

      <li class="flex flex-col items-center">
        <b class="text-2xl text-accent align-middle">{{
          progressData.maxStreak
        }}</b>
        <p class="text-center">Max Streak</p>
      </li>

      <li class="flex justify-center">
        <Countdown :count-down-date="countdownDate"></Countdown>
      </li>
    </ul>
  </Details>
</template>

<script setup lang="ts">
const countdownDate = new Date("Jan 5, 2024 15:37:25").getTime();

const props = defineProps<{
  answeredQuestions: any;
  correctAnswer: boolean;
  answered: boolean;
}>();

const progressData = ref({
  questionsAnswered: 0,
  correctPercentage: 0,
  currentStreak: 0,
  maxStreak: 0,
});

onMounted(() => {
  getProgress();
});

const getProgress = () => {
  let localStorageProgress = localStorage.getItem("progress");
  if (localStorageProgress) {
    progressData.value = JSON.parse(localStorageProgress);
    return;
  }
  localStorage.setItem("progress", JSON.stringify(progressData.value));
};

const updateProgress = (correctAnswer: boolean) => {
  let correctAnswers = props.answeredQuestions.filter(
    (answer) => answer.correct
  ).length;

  progressData.value.questionsAnswered = ++progressData.value.questionsAnswered;
  progressData.value.correctPercentage =
    (correctAnswers / progressData.value.questionsAnswered) * 100;

  progressData.value.currentStreak = correctAnswer
    ? ++progressData.value.currentStreak
    : 0;

  progressData.value.maxStreak =
    progressData.value.currentStreak > progressData.value.maxStreak
      ? progressData.value.currentStreak
      : progressData.value.maxStreak;

  localStorage.setItem("progress", JSON.stringify(progressData.value));
};

defineExpose({
  updateProgress,
});
</script>

<style scoped></style>
