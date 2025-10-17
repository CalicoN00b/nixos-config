{ pkgs, ... }:

{
    programs.neovim = {
        enable = true;

        plugins = with pkgs.vimPlugins; [
            lazy-nvim
            # nvim-treesitter
            # telescope-nvim
            # mason-nvim
        ];

        # This is probably such a stupid way to do this
        extraLuaConfig = ''
            vim.cmd("set expandtab")
            vim.cmd("set tabstop=4")
            vim.cmd("set softtabstop=4")
            vim.cmd("set shiftwidth=4")
            vim.opt.number = true
            vim.g.mapleader = " "

            local plugins = {
                { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
                {
                    "nvim-telescope/telescope.nvim", tag = "0.1.8",
                    dependencies =  { "nvim-lua/plenary.nvim" }    
                },
                -- getting rid of mason for now
                -- {
                --     "mason-org/mason-lspconfig.nvim",
                --     opts = {},
                --     dependencies = {
                --         { "mason-org/mason.nvim", opts = {} },
                --         "neovim/nvim-lspconfig",
                --     },
                -- },
                {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
                {
                    "nvim-neo-tree/neo-tree.nvim",
                    branch = "v3.x",
                    dependencies = {
                        "nvim-lua/plenary.nvim",
                        "MunifTanjim/nui.nvim",
                        "nvim-tree/nvim-web-devicons"
                    },
                },
                {
                    'nvim-lualine/lualine.nvim',
                    dependencies = { 'nvim-tree/nvim-web-devicons' }
                }
            }
            local opts = {}

            require("lazy").setup(plugins, opts)

            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            
            vim.keymap.set('n', '<leader>exo', ':Neotree filesystem reveal<CR>', {})
            vim.keymap.set('n', '<leader>exc', ':Neotree filesystem close<CR>', {})

            local config = require("nvim-treesitter.configs")
            config.setup({
                ensure_installed = { "java", "nix" },
                highlight = { enable = true },
                indent = { enable = true }
            })

            -- require("mason-lspconfig").setup({
            --     ensure_installed = { "jdtls" },
            -- })
            
            require("lualine").setup()

            require("catppuccin").setup()
            vim.cmd.colorscheme "catppuccin"
        '';
    };
}
