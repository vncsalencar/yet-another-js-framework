<template>
  <button :disabled="answered" @click="checkAnswer" class="p-4 btn-primary">
    <span class="mr-4 font-bold text-accent" v-show="answered && id == selected"
      >X</span
    >{{ text }}
  </button>
</template>

<script setup lang="ts">
const props = defineProps<{
  text: string;
  correct: boolean;
  id: number;
  answered: boolean;
  selected: number;
}>();

const emit = defineEmits<{
  (e: "answerSelected", correct: boolean, selected: number): void;
}>();

const checkAnswer = () => {
  emit("answerSelected", props.correct, props.id);
};
</script>

<style scoped></style>
