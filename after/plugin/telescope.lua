local builtin = require('telescope.builtin')


vim.keymap.set('n', '<C-l>', function()
    builtin.find_files({ previewer = false })
end, {})

vim.keymap.set('n', '<C-p>', function()
    builtin.git_files({ previewer = false })
end, {})

vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > "), previewer = false })
end)

vim.keymap.set('n', '<leader>pws', function()
    builtin.grep_string({ search = vim.fn.expand("<cword>"), previewer = false })
end)

vim.keymap.set('n', '<leader>pWs', function()
    builtin.grep_string({ search = vim.fn.expand("<cWORD>"), previewer = false })
end)

vim.keymap.set('n', '<leader>vh', function()
    builtin.help_tags({ previewer = false })
end, {})


vim.keymap.set('n', '<leader>de', function()
    builtin.diagnostics({ previewer = false })
end, {})
