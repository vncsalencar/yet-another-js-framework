
import VueHighlightJS from 'vue3-highlightjs'
import 'vue3-highlightjs/styles/dracula.css'

export default defineNuxtPlugin((nuxtApp) => {
    nuxtApp.vueApp.use(VueHighlightJS)
})