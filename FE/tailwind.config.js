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
      primary: "RobotoMono",
      secondary: "HussarBoldWeb",
      title: "Anton",
    },
    colors: {
      transparent: "transparent",
      current: "currentColor",
      white: "#e9efff",
      gray: "#44475a",
      primary: "#282a36",
      secondary: "#20222b",
      accent: "#f0db4f",
      green: "#93c961",
      red: "#be5944",
      blue: "#007acc ",
    },
  },
  plugins: [require("@tailwindcss/line-clamp")],
};
