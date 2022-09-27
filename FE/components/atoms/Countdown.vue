<template>
  <div>
    <p class="text-2xl text-center font-bold text-accent">{{ countdown }}</p>
    <p>Until Next Question</p>
  </div>
</template>

<script setup lang="ts">
const countdown = ref();

const props = defineProps<{
  countDownDate: number;
}>();

onMounted(() => {
  setCountdown();
});

const setCountdown = () => {
  setInterval(() => {
    let now = new Date().getTime();
    let distance = props.countDownDate - now;
    countdown.value = formatTime(distance);
  }, props.countDownDate);
};

const formatTime = (distance: number): string => {
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);

  return `${hours}h ${minutes}m ${seconds}s`;
};
</script>
