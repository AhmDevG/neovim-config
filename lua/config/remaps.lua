---@diagnostic disable: undefined-global

vim.g.mapleader = " "

local keymap = vim.keymap.set


-- keymap("n" , "<leader>v" , vim.cmd.Ex)
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
keymap("n" , "<A-l>" , "<Cmd>BufferNext<CR>" , { silent = true })
keymap("n" , "<A-h>" , "<Cmd>BufferPrevious<CR>" , { silent = true })
keymap('n', '<leader>w', '<Cmd>BufferClose<CR>', { silent = true })
keymap("n", "<A-0>", "<Cmd>BufferLast<CR>")

for i = 1, 9 do
    keymap("n", "<A-" .. i .. ">", "<Cmd>BufferGoto " .. i .. "<CR>")
end

-- Git
keymap("n", "<leader>gg", "<cmd>Git<CR>", { desc = "Git Status" })

keymap("n", "<leader>ga", "<cmd>Git add .<CR>", { desc = "Git Add All" })

keymap("n", "<leader>gs", "<cmd>Git stash <CR>", { desc = "Git stash changes" })

keymap("n", "<leader>gS", "<cmd>Git stash pop<CR>", { desc = "Git stash pop changes" })

keymap("n", "<leader>gc", "<cmd>Git commit<CR>", { desc = "Git Commit" })

keymap("n", "<leader>gp", "<cmd>Git push<CR>", { desc = "Git Push" })

keymap("n", "<leader>gP", "<cmd>Git pull --rebase<CR>", { desc = "Git Pull Rebase" })

keymap("n", "<leader>gu", "<cmd>Git push -u origin <CR>", { desc = "Git Push Upstream" })

-- Merge conflicts
keymap("n", "<leader>gh", "<cmd>diffget //2<CR>", { desc = "Take Left" })
keymap("n", "<leader>gl", "<cmd>diffget //3<CR>", { desc = "Take Right" })


-- oil keymaps
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- quick fix list remaps
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>", {desc = "Navigated to the next element in the quick fix list"})
vim.keymap.set("n", "<M-k>", "<cmd>cprevious<CR>", {desc = "Navigated to the prev element in the quick fix list"})

-- move in insert mode using ctrl + h/j/k/l
vim.keymap.set("i", "<C-h>", "<Left>", {desc = "Move left"})
vim.keymap.set("i", "<C-l>", "<Right>", {desc = "Move Right"})
vim.keymap.set("i", "<C-k>", "<Up>", {desc = "Move Up"})
vim.keymap.set("i", "<C-j>", "<Down>", {desc = "Move Down"})
