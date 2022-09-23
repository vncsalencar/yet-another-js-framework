<template>
  <button
    aria-label="Toggle menu"
    @click="toggleMenu"
    class="flex flex-col gap-1 group"
  >
    <div id="upper-burger" class="w-6 h-[2px] rounded-md bg-primary"></div>
    <div id="mid-burger" class="w-6 h-[2px] rounded-md bg-primary"></div>
    <div id="bottom-burger" class="w-6 h-[2px] rounded-md bg-primary"></div>
  </button>
</template>

<script setup lang="ts">
import { storeToRefs } from "pinia";
import { useMenuStore } from "../../../stores/menuStore";

const store = useMenuStore();
const { active } = storeToRefs(store);

watch(active, (menuIsActive: boolean, menuWasActive: boolean) => {
  let upperBurger = document.getElementById("upper-burger");
  let bottomBurger = document.getElementById("bottom-burger");
  let midBurger = document.getElementById("mid-burger");

  if (menuIsActive != menuWasActive) {
    if (menuIsActive) {
      upperBurger.classList.add("upper-burger--menu-open");
      upperBurger.classList.remove("upper-burger--menu-closed");

      bottomBurger.classList.add("bottom-burger--menu-open");
      bottomBurger.classList.remove("bottom-burger--menu-closed");

      midBurger.classList.add("mid-burger--menu-open");
      midBurger.classList.remove("mid-burger--menu-closed");
      return;
    }

    upperBurger.classList.add("upper-burger--menu-closed");
    upperBurger.classList.remove("upper-burger--menu-open");

    bottomBurger.classList.add("bottom-burger--menu-closed");
    bottomBurger.classList.remove("bottom-burger--menu-open");

    midBurger.classList.add("mid-burger--menu-closed");
    midBurger.classList.remove("mid-burger--menu-open");
  }
});

const toggleMenu = () => {
  store.toggle();
};
</script>

<style scoped>
/* -------------------------------------------------------------------------- */
/*                                UPPER BURGER                                */
/* -------------------------------------------------------------------------- */

@keyframes upper-burger--menu-closing {
  from {
    transform: rotate(45deg) translate(5px, 4px);
    border-radius: 0;
  }
  to {
    transform: rotate(0deg) translate(0px, 0px);
    border-radius: 0.375rem;
  }
}

@keyframes upper-burger--menu-opening {
  from {
    transform: rotate(0deg) translate(0px, 0px);
    border-radius: 0.375rem;
  }
  to {
    transform: rotate(45deg) translate(5px, 4px);
    border-radius: 0;
  }
}

.upper-burger--menu-closed {
  animation: upper-burger--menu-closing 0.2s linear forwards;
}

.upper-burger--menu-open {
  animation: upper-burger--menu-opening 0.2s linear forwards;
}

/* -------------------------------------------------------------------------- */
/*                                 MID BURGER                                 */
/* -------------------------------------------------------------------------- */

@keyframes mid-burger--menu-opening {
  from {
    transform: translate(0);
    opacity: 100%;
  }
  50% {
    opacity: 50%;
  }
  to {
    transform: translate(-100%);
    opacity: 0%;
  }
}

@keyframes mid-burger--menu-closing {
  from {
    transform: translate(-100%);
    opacity: 0%;
  }
  50% {
    opacity: 50%;
  }
  to {
    transform: translate(0%);
    opacity: 100%;
  }
}

.mid-burger--menu-closed {
  animation: mid-burger--menu-closing 0.2s linear forwards;
}

.mid-burger--menu-open {
  animation: mid-burger--menu-opening 0.2s linear forwards;
}

/* -------------------------------------------------------------------------- */
/*                                BOTTOM BURGER                               */
/* -------------------------------------------------------------------------- */

@keyframes bottom-burger--menu-closing {
  from {
    transform: rotate(-45deg) translate(4px, -4px);
    border-radius: 0;
  }
  to {
    transform: rotate(0deg) translate(0px, 0px);
    border-radius: 0.375rem;
  }
}

@keyframes bottom-burger--menu-opening {
  from {
    transform: rotate(0deg) translate(0px, 0px);
    border-radius: 0.375rem;
  }
  to {
    transform: rotate(-45deg) translate(4px, -4px);
    border-radius: 0;
  }
}

.bottom-burger--menu-closed {
  animation: bottom-burger--menu-closing 0.2s linear forwards;
}

.bottom-burger--menu-open {
  animation: bottom-burger--menu-opening 0.2s linear forwards;
}
</style>
