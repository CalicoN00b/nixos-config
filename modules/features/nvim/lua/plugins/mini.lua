vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.nvim", name = "mini" },
})

-- Mini Files
local MiniFiles = require("mini.files")
MiniFiles.setup({
    mappings = {
        go_in = "",
        go_in_plus = "<Right>",
        go_out = "",
        go_out_plus = "<Left>",
    },
})

vim.keymap.set("n", "<leader>x", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle MiniFile explorer" })

-- Mini Notify
require("mini.notify").setup({
    -- Only show messages
    content = {
        format = function(notif)
            return notif.msg
        end,
    },
})

-- Mini Cmdline Completion
require("mini.cmdline").setup({
    autocorrect = { enable = false }
})