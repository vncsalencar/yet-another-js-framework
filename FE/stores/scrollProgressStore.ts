import { defineStore } from 'pinia';

export const useScrollProgressStore = defineStore("scrollStore", {
    state: () => ({
        pageHeight: 0
    }),
    actions: {
        calculatePageHeight() {
            this.pageHeight = document.documentElement.scrollHeight -
                document.documentElement.clientHeight;
        }
    }
})