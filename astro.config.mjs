import { defineConfig } from "astro/config"
import expressiveCode from "astro-expressive-code"
import mdx from "@astrojs/mdx"
import tailwindcss from "@tailwindcss/vite"

export default defineConfig({
  site: "https://paulovillarroel.github.io",
  base: "/curso-sql",
  integrations: [
    expressiveCode({
      themes: ["github-dark"],
      styleOverrides: {
        borderRadius: "0.5rem",
        codeFontFamily: "JetBrains Mono, monospace",
      },
      defaultProps: {
        showCopyButton: true,
      },
    }),
    mdx(),
  ],
  vite: {
    plugins: [tailwindcss()],
  },
})
