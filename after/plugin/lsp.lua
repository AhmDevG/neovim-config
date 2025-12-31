local lsp = require("lsp-zero")
lsp.preset("recommended")

-- CMP Setup
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
      elseif vim.fn  == 1 then
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
  ensure_installed = { "clangd", "lua_ls", "pyright" },
  handlers = { lsp.default_setup },
})

-- LSP-zero Setup + Keymaps
lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  -- GoTo
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

  -- Hover & Signature
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

  -- Rename & Code Action
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

  -- Formatting
  vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, opts)
end)

lsp.setup()
