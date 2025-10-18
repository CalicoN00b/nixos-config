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
                },
                { "mason-org/mason.nvim" },
                { "mason-org/mason-lspconfig.nvim" },
                { "neovim/nvim-lspconfig" },
                { "mfussenegger/nvim-jdtls" },
                { "hrsh7th/cmp-nvim-lsp" },
                { "hrsh7th/cmp-buffer" },
                { "hrsh7th/cmp-path" },
                { "hrsh7th/cmp-cmdline" },
                { "hrsh7th/nvim-cmp" }
            }
            local opts = {}

            -- Setup Lazy
            require("lazy").setup(plugins, opts)

            -- Setup Telescope and keybindings
            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
            
            -- Neotree keybindings
            vim.keymap.set('n', '<leader>exo', ':Neotree filesystem reveal<CR>', {})
            vim.keymap.set('n', '<leader>exc', ':Neotree filesystem close<CR>', {})

            -- Treesitter stuff
            local config = require("nvim-treesitter.configs")
            config.setup({
                ensure_installed = { "java", "nix" },
                highlight = { enable = true },
                indent = { enable = true }
            })

            -- Mason and LSP stuff
            require("mason").setup()

            require("mason-lspconfig").setup({
                ensure_installed = { "jdtls" }
            })

            vim.lsp.config("jdtls", {
                cmd = { "/home/igalaviz/.local/share/nvim/mason/packages/jdtls/jdtls" },
                filetypes = { "java" }
            })
            vim.lsp.enable("jdtls")

            require("lualine").setup()

            require("catppuccin").setup()
            vim.cmd.colorscheme "catppuccin"
        '';
    };
}
