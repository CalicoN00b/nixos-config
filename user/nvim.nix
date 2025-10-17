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

            local plugins = {
                { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
            }
            local opts = {}

            require("lazy").setup(plugins, opts)

            require("catppuccin").setup()
            vim.cmd.colorscheme "catppuccin"
        '';
    };
}
