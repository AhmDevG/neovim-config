local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', function()
    builtin.git_files({ previewer = false })
end, {})

vim.keymap.set('n', '<leader>fw', function()
    builtin.grep_string({ search = vim.fn.expand("<cword>"), previewer = false })
end)

vim.keymap.set('n', '<leader>fW', function()
    builtin.grep_string({ search = vim.fn.expand("<cWORD>"), previewer = false })
end)

vim.keymap.set('n', '<leader>fh', function()
    builtin.help_tags({ previewer = false })
end, {})


vim.keymap.set('n', '<leader>d', function()
    builtin.diagnostics({ previewer = false })
end, {})

vim.keymap.set('n', '<leader>ff', function()
    builtin.find_files({ previewer = false })
end, {})

vim.keymap.set("n", "<leader>fg", function()
    builtin.grep_string({ search = vim.fn.input("Grep > "), previewer = false })
end)

vim.keymap.set("n", "<leader>fd", function()
    builtin.find_files {
        cwd = vim.fn.stdpath("config"),
        previewer = false
    }
end)

vim.keymap.set("n" , "<leader>fs", "<cmd>AutoSession search<CR>")
vim.keymap.set("n" , "<C-s>", "<cmd>AutoSession toggle<CR>")

