-- @diagnostic disable: undefined-global
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.autochdir = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.wildmenu = true
vim.opt.wildmode = "full"
vim.opt.complete:append("k")

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "130"
vim.g.vsnip_snippet_dir = vim.fn.stdpath("config") .. "/snippets"

vim.cmd("set lazyredraw")
vim.cmd("set updatetime=1000")
vim.cmd("set timeoutlen=500")
vim.cmd("set ttimeoutlen=10")
vim.opt.redrawtime = 1500
vim.opt.synmaxcol = 200

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})
