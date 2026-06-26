---@diagnostic disable: undefined-global

vim.g.mapleader = " "

local keymap = vim.keymap.set


keymap("n" , "<leader>v" , vim.cmd.Ex)
keymap("v" , "J" , ":m '>+1<CR>gv=gv")
keymap("v" , "K" , ":m '<-2<CR>gv=gv")
keymap("n", "<leader>rr", ":CompetiTest run<CR>", { noremap = true, silent = true, desc = "Run testcases" })
keymap("n", "<leader>ra", ":CompetiTest add_testcase<CR>", { noremap = true, silent = true, desc = "Add testcase" })
keymap("n", "<leader>re", ":CompetiTest edit_testcase<CR>", { noremap = true, silent = true, desc = "Edit testcase" })
keymap("n", "<leader>rd", ":CompetiTest delete_testcase<CR>", { noremap = true, silent = true, desc = "Delete testcase" })
keymap("n", "<leader>rp", ":CompetiTest receive problem<CR>", { noremap = true, silent = true, desc = "Receive problem" })
keymap("n", "<leader>rc", ":CompetiTest receive contest<CR>", { noremap = true, silent = true, desc = "Receive contest" })
keymap("n", "<leader>rs", ":CompetiTest show_ui<CR>", { noremap = true, silent = true, desc = "Show test UI" })
keymap("i", "<C-k>", "<cmd>lua require'luasnip'.expand_or_jump()<CR>", {silent = true})
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("x", "<leader>p", [["_dP]])
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap("n", "<leader>vpp", "<cmd>e  C:/Users/Ahmed-PC/AppData/Local/nvim/lua/config/packer.lua<CR>");
keymap("n", "<leader><leader>", function()
    vim.cmd("so")
end)
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "J", "mzJ`z")
keymap("x", "<leader>p", [["_dP]])

keymap("i", "<Tab>", function()

  if vim.fn == 1 then
    return "<Plug>(vsnip-expand-or-jump)"
  end
  return "<Tab>"
end, { expr = true })

keymap("i", "<S-Tab>", function()
  if vim.fn["vsnip#jumpable"](-1) == 1 then
    return "<Plug>(vsnip-jump-prev)"
  end
  return "<S-Tab>"
end, { expr = true })

keymap("n", "p", function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    vim.cmd("normal! p")
    vim.api.nvim_win_set_cursor(0, { row+1, col })
end, { noremap = true, silent = true })

keymap("n", "P", function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    vim.cmd("normal! P")
    vim.api.nvim_win_set_cursor(0, { row+1, col })
end, { noremap = true, silent = true })

keymap("v", "y", function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    vim.cmd("normal! y")
    vim.api.nvim_win_set_cursor(0, { row, col })
end, { noremap = true, silent = true })


keymap("n", "ge", function()
    local path = vim.fn.expand("%:p:h") .. "/"
    vim.api.nvim_feedkeys(":e " .. path, "n", false)
end, { noremap = true })


-- bar keymaps
keymap("n" , "<Tab>" , "<Cmd>BufferNext<CR>" , { silent = true })
keymap("n" , "<S-Tab>" , "<Cmd>BufferPrevious<CR>" , { silent = true })
keymap('n', '<leader>w', '<Cmd>BufferClose<CR>', { silent = true })
keymap("n", "<leader>0", "<Cmd>BufferLast<CR>")

for i = 1, 9 do
    keymap("n", "<leader>" .. i, "<Cmd>BufferGoto " .. i .. "<CR>")
end

-- git keymaps -- 
keymap("n", "gs", vim.cmd.Git)

keymap("n", "ga", vim.cmd("Git add ."))

keymap("n", "gc", vim.cmd("Git commit"))

keymap("n", "<leader>p", function()
    vim.cmd.Git('push')
end, opts)


keymap("n", "<leader>P", function()
    vim.cmd.Git({'pull',  '--rebase'})
end, opts)

keymap("n", "<leader>t", ":Git push -u origin ", opts);

keymap("n", "gu", "<cmd>diffget //2<CR>")
keymap("n", "gh", "<cmd>diffget //3<CR>")
