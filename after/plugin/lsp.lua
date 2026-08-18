--- @diagnostic disable
local lsp = require("lsp-zero")
local cmp = require("cmp")
local lspkind = require("lspkind")

lsp.preset("recommended")

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },

    window = {
        completion = cmp.config.window.bordered({
            border = "rounded",
        }),
        documentation = cmp.config.window.bordered({
            border = "rounded",
        }),
    },

    formatting = {
        fields = { "kind", "abbr", "menu" },

        format = lspkind.cmp_format({
            mode = "symbol_text",

            menu = {
                nvim_lsp = "[LSP]",
                buffer = "[BUF]",
                path = "[PATH]",
                vsnip = "[SNIP]",
            },
        }),
    },

    mapping = cmp.mapping.preset.insert({

        ["<Tab>"] = cmp.mapping(function(fallback)

            if vim.fn["vsnip#available"](1) == 1 then
                vim.fn.feedkeys(
                    vim.api.nvim_replace_termcodes("<Plug>(vsnip-expand-or-jump)" , true , true , true)  ,  ""
                )
            else 
                fallback()
            end

        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)

            if vim.fn["vsnip#jumpable"](-1) == 1 then 
                vim.fn.feedkeys(
                    vim.api.nvim_replace_termcodes("<Plug>(vsnip-jump-prev)" , true  , true , true) , 
                    ""
                )
            else
                fallback()
            end

        end, { "i", "s" }),

        ["<C-y>"] = cmp.mapping.confirm({
            select = true,
        }),

        ["<C-Space>"] = cmp.mapping.complete(),

        ["<C-e>"] = cmp.mapping.abort(),
    }),

    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "vsnip" },
        { name = "path" },
        { name = "buffer" },
    }),
})




lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

    vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
    end, opts)
end)



require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "pyright",
        "clangd",
        "ts_ls",
    },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,

        ["pyright"] = function()
            require('lspconfig').pyright.setup({
                settings = {
                    python = {
                        pythonPath = "C:/Users/Ahmed-PC/AppData/Local/Programs/Python/Python312/python.exe",
                    },
                },
            })
        end,
    },
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = {
        prefix = "●",
        spacing = 4,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
