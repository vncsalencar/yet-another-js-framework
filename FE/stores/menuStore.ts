import { defineStore } from 'pinia';

export const useMenuStore = defineStore("menu", {
    state: () => {
        return { active: false }
    },
    actions: {
        toggle() {
            this.active = !this.active
        }
    }
})