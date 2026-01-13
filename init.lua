vim.g.vsnip_snippet_dir = vim.fn.stdpath("config") .. "/snippets"
vim.cmd("colorscheme moonfly")


require("config.remaps")
require("config.sets")
