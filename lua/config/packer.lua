vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install' },
        },
        config = function()
            require('telescope').setup {
                extensions = {
                    fzf = {}
                },
                pickers = {
                    find_files = {
                        theme = "dropdown",
                    },
                    git_files = {
                        theme = "dropdown",
                    },
                    grep_string = {
                        theme = "dropdown",
                    },
                    help_tags = {
                        theme = "dropdown",
                    },
                    diagnostics = {
                        theme = "dropdown",
                    },
                }
            }
        end
    }
    use('mbbill/undotree')

    use({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lua' },

            "hrsh7th/vim-vsnip",
            "hrsh7th/cmp-vsnip",

            "rafamadriz/friendly-snippets",
        }
    })

    use({
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    })

    use("ThePrimeagen/vim-be-good")

    use({
        'xeluxee/competitest.nvim',
        requires = { 'MunifTanjim/nui.nvim' },
        ft = { 'cpp' },
        config = function()
            local competi = require('competitest')

            competi.setup({
                receiver_problems_path = function(info)
                    local folder_path = string.format("D:/Problems/mostafa_saad_sheet/%s", info.PROBLEM)
                    os.execute('mkdir "' .. folder_path .. '"')

                    local file_path = string.format("%s/%s.%s", folder_path, info.PROBLEM, info.FEXT)
                    return file_path
                end,

                start_receiving_persistently_on_setup = false,
                receive_print_message = true,

                editor_ui = {
                    popup_width = 0.4,
                    popup_height = 0.6,
                    show_nu = true,
                    show_rnu = false,
                },

                on_receive = function(info)
                    vim.cmd("edit " .. info.filepath)

                    if info.FEXT == "cpp" then
                        vim.api.nvim_buf_set_lines(0, 0, -1, false, {
                            "#include <bits/stdc++.h>",
                            "using namespace std;",
                            "",
                            "int main() {",
                            "    ios::sync_with_stdio(false);",
                            "    cin.tie(nullptr);",
                            "    ",
                            "    return 0;",
                            "}"
                        })
                    end

                    vim.cmd("call vsnip#expandable() ? vsnip#expand() : ''")
                end


            })
        end,
    })



    use {
        "rafamadriz/friendly-snippets",
    }



    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

    use {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    }

    use {
        'tommcdo/vim-exchange',
        config = function()
        end
    }

    use {
        "ej-shafran/compile-mode.nvim",
        version = "^5.0.0",
        branch = "latest",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            vim.keymap.set("n", "<leader>r", function()
                vim.cmd("w")
                vim.cmd("below Compile")
            end, { desc = "Compile & Run" })

            vim.keymap.set("n", "<leader>R", function()
                vim.cmd("below Recompile")
            end, { desc = "Recompile" })
        end
    }

    use { 'lewis6991/gitsigns.nvim' }
    use { 'romgrk/barbar.nvim' }
    use { 'nvim-tree/nvim-web-devicons' }

    use { "tpope/vim-fugitive" }

    use { "onsails/lspkind.nvim" }
    use { "oskarnurm/koda.nvim" }
    use { "catppuccin/nvim", as = "catppuccin" }

    use({
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup({
                skip_confirm_simple_edits = true,
            })
        end,
    })

    use({
        "github/copilot.vim"
    })


    use({ "folke/tokyonight.nvim" })

    use {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    }


    use {
        "lukas-reineke/indent-blankline.nvim" ,
        config = function()
            require("ibl").setup()
        end
    }

    use {
        "rose-pine/neovim",
    }

    use {
        "andweeb/presence.nvim" ,
        config = function()
            require("presence").setup({
                auto_update         = true,
                neovim_image_text   = "The One True Text Editor",
                main_image          = "neovim",
                client_id           = "793271441293967371",
                log_level           = nil,
                debounce_timeout    = 10,
                enable_line_number  = false,
                blacklist           = {},
                buttons             = true,
                file_assets         = {},
                show_time           = true,
                editing_text        = "Editing %s",
                file_explorer_text  = "Browsing %s",
                git_commit_text     = "Committing changes",
                plugin_manager_text = "Managing plugins",
                reading_text        = "Reading %s",
                workspace_text      = "Working on %s",
                line_number_text    = "Line %s out of %s",
            })
        end
    }

    use "blazkowolf/gruber-darker.nvim"

end)
