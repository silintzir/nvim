require("default-config")
require("keymappings")
vim.cmd("luafile " .. CONFIG_PATH .. "/lv-config.lua")
require("settings")
require("plugins")
-- COLORSCHEME --
vim.g.colors_name = O.colorscheme -- needs to be callsed after plugins or it breaks new installs
require("lv-utils")
require("lv-treesitter")
