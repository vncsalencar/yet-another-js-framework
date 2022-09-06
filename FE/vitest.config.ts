import { defineConfig } from 'vitest/config'
import vue from "@vitejs/plugin-vue";

export default defineConfig({
    plugins: [vue()],
    test: {
        coverage: {
            all: true,
            exclude: [
                'node_modules/**',
                'dist/**',
                'public/**',
                'types/**',
                '.nuxt/**',
                '.output/**',
                '*.config.js',
                '*.config.ts'
            ],
        }
    },
})
