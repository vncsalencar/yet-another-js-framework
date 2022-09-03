import { defineNuxtConfig } from 'nuxt'

// https://v3.nuxtjs.org/api/configuration/nuxt.config
export default defineNuxtConfig({
    css: [
        '@/assets/scss/main.scss',
        '@/assets/scss/tailwind.scss',
    ],
    build: {
        postcss: {
            postcssOptions: require('./postcss.config.js'),
        },
    },
    components: [
        {
            path: '~/components', // will get any components nested in let's say /components/nested
            pathPrefix: false,
        }
    ],
})
