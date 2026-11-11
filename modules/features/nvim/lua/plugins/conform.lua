
vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim", name = "conform" },
})

require("conform").setup({
    formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
        nix = { "alejandra" },
    },
    format_on_save = true,
    undojoin = true,
})