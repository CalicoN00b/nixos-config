vim.lsp.config("clangd", {
    cmd = { 
        "clangd",
        "--clang-tidy",
        "--background-index",
        "--offset-encoding=utf-8",
    },
    filetypes = { "c", "cpp" },
    root_markers = { ".git", ".clangd", ".clang-format", "compile_commands.json" },
    settings = {
        clangd = {
            formatting = { 
                command = { "clang-format" },
            },
        },
    },
})

vim.lsp.enable("clangd")