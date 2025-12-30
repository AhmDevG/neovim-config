-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "C:\\Users\\Ahmed-PC\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1741730670\\share\\lua\\5.1\\?.lua;C:\\Users\\Ahmed-PC\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1741730670\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\Ahmed-PC\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1741730670\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\Ahmed-PC\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1741730670\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\Ahmed-PC\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.1741730670\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n”\5\0\0\v\0\27\0@6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0004\4\3\0005\5\4\0>\5\1\4=\4\5\3=\3\a\2B\0\2\0016\0\b\0009\0\t\0009\0\n\0'\2\v\0'\3\f\0'\4\r\0005\5\14\0B\0\5\0016\0\b\0009\0\t\0009\0\n\0'\2\v\0'\3\15\0'\4\16\0005\5\17\0B\0\5\1)\0\1\0)\1\t\0)\2\1\0M\0\15Ä6\4\b\0009\4\t\0049\4\n\4'\6\v\0'\a\18\0\18\b\3\0'\t\19\0&\a\t\a'\b\20\0\18\t\3\0'\n\21\0&\b\n\b5\t\22\0B\4\5\1O\0Ò\1276\0\b\0009\0\t\0009\0\n\0'\2\v\0'\3\23\0'\4\16\0005\5\24\0B\0\5\0016\0\b\0009\0\t\0009\0\n\0'\2\v\0'\3\25\0'\4\r\0005\5\26\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\n<C-l>\1\0\1\vsilent\2\n<C-h>\1\0\1\vsilent\2\t<CR>\31<Cmd>BufferLineGoToBuffer \6>\b<A-\1\0\1\vsilent\2\29:BufferLineCyclePrev<CR>\f<S-Tab>\1\0\1\vsilent\2\29:BufferLineCycleNext<CR>\n<Tab>\6n\bset\vkeymap\bvim\foptions\1\0\1\foptions\0\foffsets\1\0\4\ttext\18File Explorer\14separator\2\rfiletype\rNvimTree\14highlight\14Directory\1\0\b\tmode\fbuffers\20show_close_icon\1\fnumbers\fordinal\28show_buffer_close_icons\2\27always_show_bufferline\2\16diagnostics\rnvim_lsp\foffsets\0\20separator_style\nslant\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["competitest.nvim"] = {
    config = { "\27LJ\2\n≤\1\0\1\b\0\n\0\0206\1\0\0009\1\1\1'\3\2\0009\4\3\0B\1\3\0026\2\4\0009\2\5\2'\4\6\0\18\5\1\0'\6\a\0&\4\6\4B\2\2\0016\2\0\0009\2\1\2'\4\b\0\18\5\1\0009\6\3\0009\a\t\0B\2\5\2L\2\2\0\tFEXT\r%s/%s.%s\6\"\fmkdir \"\fexecute\aos\fPROBLEM&D:/Problems/mostafa_saad_sheet/%s\vformat\vstring‘\2\0\1\b\0\n\0\0236\1\0\0009\1\1\1'\3\2\0009\4\3\0&\3\4\3B\1\2\0019\1\4\0\a\1\5\0X\1\tÄ6\1\0\0009\1\6\0019\1\a\1)\3\0\0)\4\0\0)\5ˇˇ+\6\1\0005\a\b\0B\1\6\0016\1\0\0009\1\1\1'\3\t\0B\1\2\1K\0\1\0002call vsnip#expandable() ? vsnip#expand() : ''\1\n\0\0\29#include <bits/stdc++.h>\25using namespace std;\5\17int main() {%    ios::sync_with_stdio(false);\26    cin.tie(nullptr);\t    \18    return 0;\6}\23nvim_buf_set_lines\bapi\bcpp\tFEXT\rfilepath\nedit \bcmd\bvim∏\2\1\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0003\4\3\0=\4\5\0035\4\6\0=\4\a\0033\4\b\0=\4\t\3B\1\2\1K\0\1\0\15on_receive\0\14editor_ui\1\0\4\17popup_height\4≥ÊÃô\3≥Êåˇ\3\fshow_nu\2\rshow_rnu\1\16popup_width\4ö≥ÊÃ\tô≥Ê˛\3\27receiver_problems_path\1\0\5*start_receiving_persistently_on_setup\2\27receiver_problems_path\0\15on_receive\0\14editor_ui\0\26receive_print_message\2\0\nsetup\16competitest\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\competitest.nvim",
    url = "https://github.com/xeluxee/competitest.nvim"
  },
  ["copilot.lua"] = {
    config = { "\27LJ\2\n·\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\npanel\1\0\1\fenabled\2\15suggestion\1\0\2\15suggestion\0\npanel\0\vkeymap\1\0\4\tprev\n<M-[>\fdismiss\n<C-]>\vaccept\n<C-l>\tnext\n<M-]>\1\0\3\fenabled\2\17auto_trigger\2\vkeymap\0\nsetup\fcopilot\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\copilot.lua",
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  harpoon = {
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\harpoon",
    url = "https://github.com/theprimeagen/harpoon"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nç\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\1\foptions\0\1\0\3\ntheme\tauto\25component_separators\5\23section_separators\5\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  onedark = {
    config = { "\27LJ\2\no\0\0\3\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\4\0B\0\1\1K\0\1\0\tload\1\0\2\nstyle\vwarmer\16transparent\2\nsetup\fonedark\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\onedark",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["presence.nvim"] = {
    config = { "\27LJ\2\nÍ\2\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\v\20git_commit_text\23Committing changes\23file_explorer_text\16Browsing %s\17reading_text\15Reading %s\24plugin_manager_text\21Managing plugins\17editing_text\15Editing %s\21line_number_text\22Line %s out of %s\19workspace_text\18Working on %s\22neovim_image_text\15Neovim IDE\15main_image\vneovim\23enable_line_number\2\21debounce_timeout\3\n\nsetup\rpresence\frequire\0" },
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\presence.nvim",
    url = "https://github.com/andweeb/presence.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-be-good"] = {
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-be-good",
    url = "https://github.com/ThePrimeagen/vim-be-good"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "C:\\Users\\Ahmed-PC\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: onedark
time([[Config for onedark]], true)
try_loadstring("\27LJ\2\no\0\0\3\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\4\0B\0\1\1K\0\1\0\tload\1\0\2\nstyle\vwarmer\16transparent\2\nsetup\fonedark\frequire\0", "config", "onedark")
time([[Config for onedark]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n”\5\0\0\v\0\27\0@6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0004\4\3\0005\5\4\0>\5\1\4=\4\5\3=\3\a\2B\0\2\0016\0\b\0009\0\t\0009\0\n\0'\2\v\0'\3\f\0'\4\r\0005\5\14\0B\0\5\0016\0\b\0009\0\t\0009\0\n\0'\2\v\0'\3\15\0'\4\16\0005\5\17\0B\0\5\1)\0\1\0)\1\t\0)\2\1\0M\0\15Ä6\4\b\0009\4\t\0049\4\n\4'\6\v\0'\a\18\0\18\b\3\0'\t\19\0&\a\t\a'\b\20\0\18\t\3\0'\n\21\0&\b\n\b5\t\22\0B\4\5\1O\0Ò\1276\0\b\0009\0\t\0009\0\n\0'\2\v\0'\3\23\0'\4\16\0005\5\24\0B\0\5\0016\0\b\0009\0\t\0009\0\n\0'\2\v\0'\3\25\0'\4\r\0005\5\26\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\n<C-l>\1\0\1\vsilent\2\n<C-h>\1\0\1\vsilent\2\t<CR>\31<Cmd>BufferLineGoToBuffer \6>\b<A-\1\0\1\vsilent\2\29:BufferLineCyclePrev<CR>\f<S-Tab>\1\0\1\vsilent\2\29:BufferLineCycleNext<CR>\n<Tab>\6n\bset\vkeymap\bvim\foptions\1\0\1\foptions\0\foffsets\1\0\4\ttext\18File Explorer\14separator\2\rfiletype\rNvimTree\14highlight\14Directory\1\0\b\tmode\fbuffers\20show_close_icon\1\fnumbers\fordinal\28show_buffer_close_icons\2\27always_show_bufferline\2\16diagnostics\rnvim_lsp\foffsets\0\20separator_style\nslant\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: presence.nvim
time([[Config for presence.nvim]], true)
try_loadstring("\27LJ\2\nÍ\2\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\v\20git_commit_text\23Committing changes\23file_explorer_text\16Browsing %s\17reading_text\15Reading %s\24plugin_manager_text\21Managing plugins\17editing_text\15Editing %s\21line_number_text\22Line %s out of %s\19workspace_text\18Working on %s\22neovim_image_text\15Neovim IDE\15main_image\vneovim\23enable_line_number\2\21debounce_timeout\3\n\nsetup\rpresence\frequire\0", "config", "presence.nvim")
time([[Config for presence.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nç\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\1\foptions\0\1\0\3\ntheme\tauto\25component_separators\5\23section_separators\5\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: competitest.nvim
time([[Config for competitest.nvim]], true)
try_loadstring("\27LJ\2\n≤\1\0\1\b\0\n\0\0206\1\0\0009\1\1\1'\3\2\0009\4\3\0B\1\3\0026\2\4\0009\2\5\2'\4\6\0\18\5\1\0'\6\a\0&\4\6\4B\2\2\0016\2\0\0009\2\1\2'\4\b\0\18\5\1\0009\6\3\0009\a\t\0B\2\5\2L\2\2\0\tFEXT\r%s/%s.%s\6\"\fmkdir \"\fexecute\aos\fPROBLEM&D:/Problems/mostafa_saad_sheet/%s\vformat\vstring‘\2\0\1\b\0\n\0\0236\1\0\0009\1\1\1'\3\2\0009\4\3\0&\3\4\3B\1\2\0019\1\4\0\a\1\5\0X\1\tÄ6\1\0\0009\1\6\0019\1\a\1)\3\0\0)\4\0\0)\5ˇˇ+\6\1\0005\a\b\0B\1\6\0016\1\0\0009\1\1\1'\3\t\0B\1\2\1K\0\1\0002call vsnip#expandable() ? vsnip#expand() : ''\1\n\0\0\29#include <bits/stdc++.h>\25using namespace std;\5\17int main() {%    ios::sync_with_stdio(false);\26    cin.tie(nullptr);\t    \18    return 0;\6}\23nvim_buf_set_lines\bapi\bcpp\tFEXT\rfilepath\nedit \bcmd\bvim∏\2\1\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0003\4\3\0=\4\5\0035\4\6\0=\4\a\0033\4\b\0=\4\t\3B\1\2\1K\0\1\0\15on_receive\0\14editor_ui\1\0\4\17popup_height\4≥ÊÃô\3≥Êåˇ\3\fshow_nu\2\rshow_rnu\1\16popup_width\4ö≥ÊÃ\tô≥Ê˛\3\27receiver_problems_path\1\0\5*start_receiving_persistently_on_setup\2\27receiver_problems_path\0\15on_receive\0\14editor_ui\0\26receive_print_message\2\0\nsetup\16competitest\frequire\0", "config", "competitest.nvim")
time([[Config for competitest.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'copilot.lua'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
