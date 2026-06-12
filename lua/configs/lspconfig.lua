require("nvchad.configs.lspconfig").defaults()

local servers =
  { "html", "cssls", "tinymist", "astro", "marksman", "tailwindcss", "eslint", "vtsls", "yaml", "hyprls", "bashls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
