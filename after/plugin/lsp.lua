require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "pyright", "tsserver" },
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup({})
    end,
  },
})

local cmp = require("cmp")
local lsp_zero = require("lsp-zero")


cmp.setup({
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
    ["<C-n>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
    { name = "luasnip" },
  },
})

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  local keymap = vim.keymap.set

  keymap("n", "gd", vim.lsp.buf.definition, opts)
  keymap("n", "K", vim.lsp.buf.hover, opts)
  keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
  keymap("n", "[d", vim.diagnostic.goto_next, opts)
  keymap("n", "]d", vim.diagnostic.goto_prev, opts)
  keymap("n", "<leader>q", ":copen<CR>", opts)
  keymap("n", "<leader>de", function()
      vim.diagnostic.setloclist()
      vim.cmd("lopen")
  end, opts) 

  keymap("n", "<leader>l", ":lopen<CR>", opts)
  keymap("n", "<leader>dE", function()
      vim.diagnostic.setqflist()
      vim.cmd("copen")
  end, opts)
  keymap("n", "<leader>fm", function()
      vim.lsp.buf.format { async = true }
  end, opts)
  keymap("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>", opts)
end)

vim.diagnostic.config({
  virtual_text = true,
})

