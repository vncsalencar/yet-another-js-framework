<template>
  <Section bg-secondary>
    <template v-slot:title>
      <span class="text-accent">Question</span> of the day
    </template>
    <div class="flex flex-col gap-6">
      <div>
        <pre v-highlightjs><code class="javascript">function sayHi() {
  console.log(name);
  console.log(age);
  var name = 'Lydia';
  let age = 21;
}
sayHi();</code></pre>
      </div>

      <h3>What's the output?</h3>

      <div class="flex flex-col gap-4">
        <BtnAnswer
          @answer-selected="checkAnswer"
          v-for="answer of answers"
          :text="answer.text"
          :correct="answer.correct"
          :id="answer.id"
          :answered="answered"
          :selected="selectedAnswer"
          :class="{
            'border-green': answered && answer.correct,
            'border-red': answered && !answer.correct,
          }"
        ></BtnAnswer>
      </div>

      <Details title="Explanation" ref="explanation" v-show="answered">
        <p>
          Within the function, we first declare the name variable with the var
          keyword. This means that the variable gets hoisted (memory space is
          set up during the creation phase) with the default value of undefined,
          until we actually get to the line where we define the variable. We
          haven't defined the variable yet on the line where we try to log the
          name variable, so it still holds the value of undefined. Variables
          with the let keyword (and const) are hoisted, but unlike var, don't
          get initialized. They are not accessible before the line we declare
          (initialize) them. This is called the "temporal dead zone". When we
          try to access the variables before they are declared, JavaScript
          throws a ReferenceError.
        </p>
      </Details>

      <Details title="Progress" ref="progress" v-show="answered">
        <ul class="flex gap-8 justify-around mt-4">
          <li class="flex flex-col items-center">
            <b class="text-2xl align-middle">{{
              progressData.questionsAnswered
            }}</b>
            <p class="text-center">Questions <br />answered</p>
          </li>

          <li class="flex flex-col items-center">
            <b class="text-2xl align-middle"
              >{{ Number(progressData.correctPercentage).toFixed(2) }}%</b
            >
            <p class="text-center">Correct %</p>
          </li>

          <li class="flex flex-col items-center">
            <b class="text-2xl align-middle">{{
              progressData.currentStreak
            }}</b>
            <p class="text-center">
              Current <br />
              streak
            </p>
          </li>

          <li class="flex flex-col items-center">
            <b class="text-2xl align-middle">{{ progressData.maxStreak }}</b>
            <p class="text-center">
              Max <br />
              streak
            </p>
          </li>
        </ul>
        <div class="flex justify-center mt-4">
          <Countdown :count-down-date="countdownDate"></Countdown>
        </div>
      </Details>
    </div>
  </Section>
</template>

<script setup lang="ts">
const answered = ref(false);
const correctAnswer = ref(false);
const selectedAnswer = ref(0);

const answeredQuestions = ref([]);
const progressData = ref({
  questionsAnswered: 0,
  correctPercentage: 0,
  currentStreak: 0,
  maxStreak: 0,
});

const countdownDate = new Date("Jan 5, 2024 15:37:25").getTime();

const questionId = "2";
const answers = [
  { id: 1, text: "Lydia and undefined", correct: false },
  { id: 2, text: "Lydia and ReferenceError", correct: false },
  { id: 3, text: "ReferenceError and 21", correct: false },
  { id: 4, text: "undefined and ReferenceError", correct: true },
];

onMounted(() => {
  checkQuestionPrevAnswered();
  getProgress();
});

const checkAnswer = (correct: boolean, selected: number) => {
  correctAnswer.value = correct;
  selectedAnswer.value = selected;
  answeredQuestions.value.push({
    id: questionId,
    correct: correct,
    selected: selected,
  });
  localStorage.setItem("questions", JSON.stringify(answeredQuestions.value));
  answered.value = true;

  updateProgress();
};

const checkQuestionPrevAnswered = () => {
  let localStorageQuestions = localStorage.getItem("questions");
  if (localStorageQuestions) {
    answeredQuestions.value = JSON.parse(localStorageQuestions);
    let questionFound = answeredQuestions.value.find((q) => q.id == questionId);

    if (questionFound) {
      answered.value = true;
      selectedAnswer.value = questionFound.selected;
    }
    return;
  }

  localStorage.setItem("questions", JSON.stringify([]));
};

const getProgress = () => {
  let localStorageProgress = localStorage.getItem("progress");
  if (localStorageProgress) {
    progressData.value = JSON.parse(localStorageProgress);
    return;
  }
  localStorage.setItem("progress", JSON.stringify(progressData.value));
};

const updateProgress = () => {
  let correctAnswers = answeredQuestions.value.filter(
    (answer) => answer.correct
  ).length;

  progressData.value.questionsAnswered = ++progressData.value.questionsAnswered;
  progressData.value.correctPercentage =
    (correctAnswers / progressData.value.questionsAnswered) * 100;

  progressData.value.currentStreak = correctAnswer.value
    ? ++progressData.value.currentStreak
    : 0;

  progressData.value.maxStreak =
    progressData.value.currentStreak > progressData.value.maxStreak
      ? progressData.value.currentStreak
      : progressData.value.maxStreak;

  localStorage.setItem("progress", JSON.stringify(progressData.value));
};
</script>

<style scoped></style>
