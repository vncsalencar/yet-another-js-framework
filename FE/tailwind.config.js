/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./assets/**/*.{vue,js,css}",
    "./components/**/*.{js,vue,ts}",
    "./layouts/**/*.vue",
    "./pages/**/*.vue",
    "./plugins/**/*.{js,ts}",
    "./nuxt.config.{js,ts}",
  ],
  theme: {
    extend: {},
    fontFamily: {
      'primary': 'SpaceMono',
    },
      colors: {
        transparent: 'transparent',
        current: 'currentColor',
        'white': '#f8f8f2',
        'gray': '#44475a',
        'bg': '#282a36',
        'accent': '#f0db4f'
        
      },
  },
  plugins: [
    require('@tailwindcss/line-clamp'),
  ],
};
