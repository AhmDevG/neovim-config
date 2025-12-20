vim.g.mapleader = " "


vim.keymap.set("n" , "<leader>pv" , vim.cmd.Ex)
vim.keymap.set("v" , "J" , ":m '>+1<CR>gv=gv")
vim.keymap.set("v" , "K" , ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>rr", ":CompetiTest run<CR>", { noremap = true, silent = true, desc = "Run testcases" })
vim.keymap.set("n", "<leader>ra", ":CompetiTest add_testcase<CR>", { noremap = true, silent = true, desc = "Add testcase" })
vim.keymap.set("n", "<leader>re", ":CompetiTest edit_testcase<CR>", { noremap = true, silent = true, desc = "Edit testcase" })
vim.keymap.set("n", "<leader>rd", ":CompetiTest delete_testcase<CR>", { noremap = true, silent = true, desc = "Delete testcase" })
vim.keymap.set("n", "<leader>rp", ":CompetiTest receive problem<CR>", { noremap = true, silent = true, desc = "Receive problem" })
vim.keymap.set("n", "<leader>rc", ":CompetiTest receive contest<CR>", { noremap = true, silent = true, desc = "Receive contest" })
vim.keymap.set("n", "<leader>rs", ":CompetiTest show_ui<CR>", { noremap = true, silent = true, desc = "Show test UI" })
vim.keymap.set('n', '<leader>w', ':bdelete<CR>', { silent = true })
vim.api.nvim_set_keymap("i", "<C-k>", "<cmd>lua require'luasnip'.expand_or_jump()<CR>", {silent = true})


vim.keymap.set("i", "<Tab>", function()
  if vim.fn == 1 then
    return "<Plug>(vsnip-expand-or-jump)"
  end
  return "<Tab>"
end, { expr = true })

vim.keymap.set("i", "<S-Tab>", function()
  if vim.fn["vsnip#jumpable"](-1) == 1 then
    return "<Plug>(vsnip-jump-prev)"
  end
  return "<S-Tab>"
end, { expr = true })
