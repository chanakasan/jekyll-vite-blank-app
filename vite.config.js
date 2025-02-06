import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import { resolve } from 'path'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [vue()],
  root: 'frontend',
  publicDir: false,
  server: {
    origin: 'http://localhost:4000/frontend',
  },
  build: {
    copyPublicDir: true,
    assetsDir: 'compiled',
    emptyOutDir: true,
    manifest: true,
    outDir: resolve(__dirname, 'vite_dist'),
    rollupOptions: {
      // overwrite default index.html entry
      input: resolve(__dirname, 'frontend/main.js'),
    },
  }
})
