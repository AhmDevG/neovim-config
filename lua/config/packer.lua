vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use ('wbthomason/packer.nvim')
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    --
    -- use({
    --     "rose-pine/neovim",
    --     as = "rose-pine",
    --     config = function()
    --         vim.cmd("colorscheme rose-pine")
    --     end
    -- })
    --
    --
    -- use({
    --     "rebelot/kanagawa.nvim",
    --     as = "kanagawa",
    --     config = function()
    --         require("kanagawa").setup({
    --             commentStyle = { italic = true },
    --             keywordStyle = { italic = false },
    --             transparent = false,
    --         })
    --         vim.cmd("colorscheme kanagawa-dragon")
    --     end
    -- })
    use({
        'navarasu/onedark.nvim',
        as = 'onedark',
        config = function ()
            require('onedark').setup({
                style = 'warmer',
                transparent = false 
            })
            require('onedark').load()
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

            -- Snippets (vsnip ONLY)
            "hrsh7th/vim-vsnip",
            "hrsh7th/cmp-vsnip",

            -- Snippets collection
            "rafamadriz/friendly-snippets",
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
            local competi = require('competitest')

            competi.setup({
                receiver_problems_path = function(info)
                    local folder_path = string.format("D:/Problems/mostafa_saad_sheet/%s", info.PROBLEM)
                    os.execute('mkdir "' .. folder_path .. '"')

                    local file_path = string.format("%s/%s.%s", folder_path, info.PROBLEM, info.FEXT)
                    return file_path
                end,

                start_receiving_persistently_on_setup = true,
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


    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup({
                options = { theme = 'auto', section_separators = '', component_separators = '' }
            })
        end,
    })


    use {
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup {
                options = {
                    mode = "buffers", 
                    numbers = "ordinal",
                    diagnostics = "nvim_lsp",
                    separator_style = "slant",
                    show_buffer_close_icons = true,
                    show_close_icon = false,
                    always_show_bufferline = true,
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer",
                            highlight = "Directory",
                            separator = true
                        }
                    },
                },
            }
            vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', { silent = true })
            vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { silent = true })

            for i = 1, 9 do
                vim.keymap.set('n', '<A-' .. i .. '>', '<Cmd>BufferLineGoToBuffer ' .. i .. '<CR>', { silent = true })
            end

            vim.keymap.set('n', '<C-h>', ':BufferLineCyclePrev<CR>', { silent = true })
            vim.keymap.set('n', '<C-l>', ':BufferLineCycleNext<CR>', { silent = true })
        end
    }
    use {
        "rafamadriz/friendly-snippets",
    }


    use "tpope/vim-surround"


end)
