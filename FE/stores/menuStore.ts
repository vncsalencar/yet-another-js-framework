import { defineStore } from 'pinia';

export const useMenuStore = defineStore("menu", {
    state: () => ({ active: false }),
    actions: {
        toggle() {
            this.active = !this.active

            if (this.active) {
                document.querySelector("body").classList.add("overflow-hidden")
                return;
            }
            document.querySelector("body").classList.remove("overflow-hidden")
        }
    }
})