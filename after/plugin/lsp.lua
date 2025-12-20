local lsp = require("lsp-zero")
lsp.preset("recommended")

-- CMP
local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn == 1 then
        vim.api.nvim_feedkeys(
          vim.api.nvim_replace_termcodes("<Plug>(vsnip-expand-or-jump)", true, true, true),
          "",
          true
        )
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        vim.api.nvim_feedkeys(
          vim.api.nvim_replace_termcodes("<Plug>(vsnip-jump-prev)", true, true, true),
          "",
          true
        )
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),

  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
    { name = "buffer" },
    { name = "path" },
  },
})
-- Mason
require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "clangd",
    "lua_ls",
    "pyright",
  },
  handlers = {
    lsp.default_setup,
  },
})

lsp.setup()
