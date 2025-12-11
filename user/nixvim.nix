{ nixvim, ... }:

{
    imports = [
        nixvim.homeModules.nixvim
    ];

    programs.nixvim = {
        opts = {
            number = true;
            shiftwidth = 4;
        };

        enable = true;

        colorschemes.catppuccin.enable = true;
        globals.mapleader = " ";


        keymaps = [
            {
                action = "<cmd>Telescope live_grep<CR>";
                key = "<leader>lg";
            }
            {
                action = "<cmd>Telescope find_files<CR>";
                key = "<leader>ff";
            }
            {
                action = "<cmd>Neotree filesystem reveal left<CR>";
                key = "<leader>exo";
            }
            {
                action = "<cmd>Neotree filesystem close<CR>";
                key = "<leader>exc";
            }
        ];

        plugins = {
            lualine.enable = true;
            luasnip.enable = true;
            treesitter.enable = true;
            telescope.enable = true;
            web-devicons.enable = true;
	    markdown-preview.enable = true;

	    neo-tree = {
		enable = true;

		settings = {
		    filesystem.filtered_items.visible = true;
		};
	    };

            lsp = {
                enable = true;

                servers = {
                    jdtls.enable = true;
                    nixd.enable = true;
		    pylsp.enable = true;

                    rust_analyzer = {
                        enable = true;
                        installCargo = true;
                        installRustc = true;
                    };
                };
            };

            cmp = {
                enable = true;
                autoEnableSources = true;
                settings.sources = [
                    {name = "nvim_lsp";}
                    {name = "path";}
                    {name = "buffer";}
                    {name = "luasnip";}
                ];

                settings.mapping = {
                    "<CR>" = "cmp.mapping.confirm({ select = true })";
		    "<S-CR>" = "cmp.mapping.confirm({ select = false })";
                    "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
                    "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
                    # "<Tab>" = {
                    #     action = ''
                    #         function(fallback)
                    #             if cmp.visible() then
                    #                 cmp.select_next_item()
                    #             elseif luasnip.expandable() then
                    #                 luasnip.expand()
                    #             elseif luasnip.expand_or_jumpable() then
                    #                 luasnip.expand_or_jump()
                    #             elseif check_backspace() then
                    #                 fallback()
                    #             else
                    #                 fallback()
                    #             end
                    #         end
                    #     '';
                    #     modes = [ "i" "s" ];
                    # };
                };
            };

	    bufferline = {
		enable = true;

		settings.options.separator_style = "slant";
	    };
        };  
    };
}
