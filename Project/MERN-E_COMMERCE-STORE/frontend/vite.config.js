import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    proxy: {
      "/api/": "http://backend_cont:5000",
      "/uploads/": "http://backend_cont:5000",
    },
  },
});
