vim.pack.add({
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
})

local catppuccin = {
    normal = { -- Blue
        a = {bg = "#89b4fa", fg="#1e1e2e", gui="bold"},
        b = {bg = "#313244", fg="#89b4fa"},
        c = {bg = "#181825", fg="#cdd6f4"}
    },
    insert = { -- Green
        a = {bg = "#a6e3a1", fg="#1e1e2e", gui="bold"},
        b = {bg = "#313244", fg="#a6e3a1"},
        c = {bg = "#181825", fg="#cdd6f4"}
    },
    visual = { -- Mauve
        a = {bg = "#cba6f7", fg="#1e1e2e", gui="bold"},
        b = {bg = "#313244", fg="#cba6f7"},
        c = {bg = "#181825", fg="#cdd6f4"}
    },
    command = { -- Peach
        a = {bg = "#fab387", fg="#1e1e2e", gui="bold"},
        b = {bg = "#313244", fg="#fab387"},
        c = {bg = "#181825", fg="#cdd6f4"}
    },
    inactive = { -- Peach
        a = {bg = "#181825", fg="#313244", gui="bold"},
        b = {bg = "#181825", fg="#313244"},
        c = {bg = "#181825", fg="#313244"}
    }
}

require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = catppuccin
    }
})