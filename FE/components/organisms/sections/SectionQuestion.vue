<template>
  <Section bg-secondary>
    <template v-slot:title>
      <span class="text-accent">Question</span> of the day
    </template>
    <div class="flex flex-col gap-6">
      <div>
        <pre
          v-highlightjs
        ><code class="javascript">{{question.snippet}}</code></pre>
      </div>

      <h3>{{ question.text }}</h3>

      <ul class="flex flex-col gap-4">
        <li v-for="answer of question.alternatives">
          <BtnAnswer
            @answer-selected="checkAnswer"
            :text="answer.text"
            :correct="answer.correct"
            :alternative="answer.alternative"
            :answered="answered"
            :selected="selectedAnswer"
            :class="{
              'border-green': answered && answer.correct,
              'border-red': answered && !answer.correct,
            }"
          ></BtnAnswer>
        </li>
      </ul>

      <Details title="Explanation" ref="explanation" v-show="answered">
        <p>
          {{ question.explanation }}
        </p>
      </Details>

      <Progress
        :answered-questions="answeredQuestions"
        :answered="answered"
        :correct-answer="correctAnswer"
        ref="progress"
      ></Progress>
    </div>
  </Section>
</template>

<script setup lang="ts">
import { ApiRouteEnum } from "~~/types/enums";

const answered = ref(false);
const correctAnswer = ref(false);
const selectedAnswer = ref("");

const progress = ref();

const answeredQuestions = ref([]);

const config = useRuntimeConfig();
const API_URL = `${config.CMS}/${ApiRouteEnum.Question}`;

const { data: question } = await useFetch<Question>(API_URL);

onMounted(() => {
  checkQuestionPrevAnswered();
});

const checkAnswer = (correct: boolean, selected: string) => {
  correctAnswer.value = correct;
  selectedAnswer.value = selected;
  answeredQuestions.value.push({
    id: question.value.id,
    correct: correct,
    selected: selected,
  });
  localStorage.setItem("questions", JSON.stringify(answeredQuestions.value));
  answered.value = true;

  progress.value.updateProgress(correctAnswer.value);
};

const checkQuestionPrevAnswered = () => {
  console.log(question);
  let localStorageQuestions = localStorage.getItem("questions");
  if (localStorageQuestions) {
    answeredQuestions.value = JSON.parse(localStorageQuestions);
    let answerFound = answeredQuestions.value.find(
      (q) => q.id == question.value.id
    );

    if (answerFound) {
      answered.value = true;
      selectedAnswer.value = answerFound.selected;
    }
    return;
  }

  localStorage.setItem("questions", JSON.stringify([]));
};
</script>

<style scoped></style>
