vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use ('wbthomason/packer.nvim')
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({
        "rose-pine/neovim",
        as = "rose-pine",
        config = function()
            vim.cmd("colorscheme rose-pine")
        end
    })

    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')

    use({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-nvim-lua'},

            {'L3MON4D3/LuaSnip'},
            {'saadparwaiz1/cmp_luasnip'},
        }
    })

    use({
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    keymap = {
                        accept = "<C-l>",  						
                        next = "<M-]>",
                        prev = "<M-[>",
                        dismiss = "<C-]>",
                    },
                },
                panel = { enabled = true },
            })
        end
    })

    use({
        "andweeb/presence.nvim",
        config = function()
            require("presence").setup({
                neovim_image_text   = "Neovim IDE",
                main_image          = "neovim",    
                debounce_timeout    = 10,
                enable_line_number  = true,
                editing_text        = "Editing %s",
                file_explorer_text  = "Browsing %s",
                git_commit_text     = "Committing changes",
                plugin_manager_text = "Managing plugins",
                reading_text        = "Reading %s",
                workspace_text      = "Working on %s",
                line_number_text    = "Line %s out of %s",
            })
        end
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
        config = function()
            require('competitest').setup({
                receiver_problems_path =  "D:/Problems/Contests/$(JUDGE)/$(CONTEST)/$(PROBLEM).$(FEXT)",
                start_receiving_persistently_on_setup = true,
                receive_print_message = true,
                editor_ui = {
                    popup_width = 0.4,
                    popup_height = 0.6,
                    show_nu = true,
                    show_rnu = false,
                }
            })
        end,
    })

    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup({
                options = { theme = 'auto', section_separators = '', component_separators = '' }
            })
        end
    })

end)
