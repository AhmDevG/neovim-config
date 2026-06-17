vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use ('wbthomason/packer.nvim')
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.8', requires = { {'nvim-lua/plenary.nvim'} }, } 
    -- use({
    --     'navarasu/onedark.nvim',
    --     as = 'onedark',
    --     config = function ()
    --         require('onedark').setup({
    --             style = 'darker',
    --             transparent = true
    --         })
    --         require('onedark').load()
    --     end
    -- })
    --use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
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

            "hrsh7th/vim-vsnip",
            "hrsh7th/cmp-vsnip",

            "rafamadriz/friendly-snippets",
        }
    })

    -- use({
    --     "zbirenbaum/copilot.lua",
    --     event = "InsertEnter",
    --     config = function()
    --         require("copilot").setup({
    --             suggestion = {
    --                 enabled = true,
    --                 auto_trigger = true,
    --                 keymap = {
    --                     accept = "<C-l>",  						
    --                     next = "<M-]>",
    --                     prev = "<M-[>",
    --                     dismiss = "<C-]>",
    --                 },
    --             },
    --             panel = { enabled = true },
    --         })
    --     end
    -- })


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
        ft = {'cpp'},
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
            require("nvim-autopairs").setup{}
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
            vim.g.compile_mode = {
                default_command = function()
                    local file = vim.api.nvim_buf_get_name(0)
                    local file_no_ext = file:gsub("%.%w+$", "")
                    local ft = vim.bo.filetype

                    if file == "" then
                        print("save file first !")
                        return ""
                    end

                    if ft == "cpp" then
                        return "g++ -std=c++17 -O2 -Wall \"" .. file .. "\" -o \"" .. file_no_ext .. "\" && \"" .. file_no_ext .. "\""
                    elseif ft == "python" then
                        return "python \"" .. file .. "\""
                    elseif ft == "javascript" then
                        return "node \"" .. file .. "\""
                    elseif ft == "typescript" then
                        return "ts-node \"" .. file .. "\""
                    else
                        print("file type " .. ft .. " is not supported for compilation [ADD IT YOURSELF BIT*H]")
                        return ""
                    end
                end,

                window = {
                    split = "below",
                    size = 12,
                },

                auto_close = false,
                auto_scroll = true,
                use_terminal = true,
            }

            vim.keymap.set("n", "<leader>r", function()
                vim.cmd("w")
                vim.cmd("below Compile")
            end, { desc = "Compile & Run" })

            vim.keymap.set("n", "<leader>R", function()
                vim.cmd("below Recompile")
            end, { desc = "Recompile" })
        end
    }
    --
    -- use {
    --     "bavajitu/brellary.nvim",
    --     config = function()
    --         vim.cmd("colorscheme brellary")
    --     end
    -- }
    --

    -- use {
    --     "ydkulks/cursor-dark.nvim",
    --     config = function()
    --         require("cursor-dark").setup({
    --             style = "dark-midnight",
    --             transparent = true,
    --             dashboard = true,
    --         })
    --
    --         vim.cmd("colorscheme cursor-dark")
    --     end
    -- }

    use{
        "oskarnurm/koda.nvim",
        config = function ()
            vim.cmd("colorscheme koda-dark")
        end
    }

    use {'nvim-tree/nvim-web-devicons'}
    use {'lewis6991/gitsigns.nvim'}
    use {'romgrk/barbar.nvim'}

end)
