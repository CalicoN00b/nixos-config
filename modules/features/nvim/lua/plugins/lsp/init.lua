vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig", name = "lspconfig" },
})

vim.diagnostic.config({ virtual_text = true })

require("plugins.lsp.nixd")
require("plugins.lsp.clangd")