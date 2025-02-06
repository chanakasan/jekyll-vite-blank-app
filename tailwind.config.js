/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./index.md",
    "./index.html",
    "_layouts/*.html",
    "_includes/*.html",
    "_pages/*.{html,md}",
    "frontend/components/*.{html,vue}",
    "frontend/App.vue",
  ],
  theme: {
    extend: {},
  },
  plugins: [require('daisyui')],
}

