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
          :question-answered="questionAnswered"
          :class="{
            'border-green': questionAnswered && answer.correct,
            'border-red': questionAnswered && !answer.correct,
          }"
        ></BtnAnswer>
      </div>

      <details
        ref="explanation"
        v-show="questionAnswered"
        class="group bg-primary p-4"
      >
        <summary class="group-hover-text-accent">Explanation</summary>
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
      </details>

      <!-- <details
        ref="progress"
        v-show="questionAnswered"
        class="group bg-primary p-4"
      >
        <summary class="group-hover-text-accent">Progress</summary>
        <div>
          <ul class="flex gap-8 justify-between mt-4">
            <li class="flex flex-col items-center">
              <b class="text-2xl align-middle">1</b>
              <p class="text-center">Played</p>
            </li>

            <li class="flex flex-col items-center">
              <b class="text-2xl align-middle">100</b>
              <p class="text-center">Correct %</p>
            </li>

            <li class="flex flex-col items-center">
              <b class="text-2xl align-middle">3</b>
              <p class="text-center">
                Current <br />
                streak
              </p>
            </li>

            <li class="flex flex-col items-center">
              <b class="text-2xl align-middle">5</b>
              <p class="text-center">
                Max <br />
                streak
              </p>
            </li>
          </ul>
        </div>
      </details> -->
    </div>
  </Section>
</template>

<script setup lang="ts">
const questionAnswered = ref(false);
const answeredQuestions = ref([]);
const explanation = ref(null);

const questionId = "1";
const answers = [
  { text: "Lydia and undefined", correct: false },
  { text: "Lydia and ReferenceError", correct: false },
  { text: "ReferenceError and 21", correct: false },
  { text: "undefined and ReferenceError", correct: true },
];

onMounted(() => {
  // checkQuestionPrevAnswered();
});

const checkQuestionPrevAnswered = () => {
  let localStorageQuestions = localStorage.getItem("questions");
  if (localStorageQuestions) {
    answeredQuestions.value = JSON.parse(localStorageQuestions);
    let questionFound = answeredQuestions.value.find((q) => q.id == questionId);

    if (questionFound) {
      questionAnswered.value = true;
    }
    return;
  }

  localStorage.setItem("questions", JSON.stringify([]));
};

const checkAnswer = (isAnswerCorrect: boolean) => {
  answeredQuestions.value.push({
    id: questionId,
    correct: isAnswerCorrect,
  });
  localStorage.setItem("questions", JSON.stringify(answeredQuestions.value));
  questionAnswered.value = true;
  explanation.value.setAttribute("open", true);
};
</script>

<style scoped></style>
