import { defineStore } from 'pinia';

export const useScrollProgressStore = defineStore("scrollStore", {
    state: () => ({
        pageHeight: 0,
    }),
    actions: {
        //TODO: Use ResizeObserver to do this automatically
        calculatePageHeight() {
            this.pageHeight = document.documentElement.scrollHeight -
                document.documentElement.clientHeight;
        },
        accentBackground() {
            const progressBar = document.querySelector("#scroll-progress");
            progressBar.classList.add("bg-accent");
            progressBar.classList.remove("bg-primary");
        },
        primaryBackground() {
            const progressBar = document.querySelector("#scroll-progress");
            progressBar.classList.add("bg-primary");
            progressBar.classList.remove("bg-accent");
        }
    }
})