vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig", name = "lspconfig" },
})

vim.diagnostic.config({ virtual_text = true })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())

vim.lsp.config("*", { capabilities = capabilities })

require("plugins.lsp.nixd")
require("plugins.lsp.clangd")