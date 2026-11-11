vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", name = "treesitter" },
})

local treesitter = require("nvim-treesitter")

treesitter.setup({
    highlight = { enable = true },
    indent = { enable = true },
})

treesitter.install({
    "lua",
    "nix",
    "cpp",
})