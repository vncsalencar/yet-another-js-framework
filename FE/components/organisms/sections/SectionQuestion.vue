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
          :is-correct="answer.isCorrect"
          :class="{
            'border-[#00ff00]': questionAnswered && answer.isCorrect,
            'border-[#ff0000]': questionAnswered && !answer.isCorrect,
          }"
        ></BtnAnswer>
      </div>

      <details v-show="questionAnswered" class="group bg-primary p-4">
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
    </div>
  </Section>
</template>

<script setup lang="ts">
const questionAnswered = ref(false);
const answers = [
  { text: "Lydia and undefined", isCorrect: false },
  { text: "Lydia and ReferenceError", isCorrect: false },
  { text: "ReferenceError and 21", isCorrect: false },
  { text: "undefined and ReferenceError", isCorrect: true },
];

const checkAnswer = () => {
  questionAnswered.value = true;
};
</script>

<style scoped></style>
