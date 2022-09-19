import { defineNuxtConfig } from 'nuxt'
import Icons from 'unplugin-icons/vite'

// https://v3.nuxtjs.org/api/configuration/nuxt.config
export default defineNuxtConfig({
    buildModules: [
        '@pinia/nuxt',
        'unplugin-icons/nuxt',
    ],
    css: [
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
    runtimeConfig: {
        public: {
            CMS: process.env.CMS,
            API: process.env.API
        }
    },
    vite: {
        plugins: [
          Icons({
            // the feature below is experimental ⬇️
            autoInstall: true
          })
        ]
      }
})
