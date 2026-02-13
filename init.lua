require("config.sets")
require("config.remaps")

local colors = require("config.colors")

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "rose-pine",
    callback = function()
        colors.ColorMyPencils()
    end,
})

