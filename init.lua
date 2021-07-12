require("default-config")
require("keymappings")
local status_ok, _ = pcall(vim.cmd, "luafile " .. CONFIG_PATH .. "/lv-config.lua")
if not status_ok then
	print("Something is wrong with your lv-config")
end
require("plugins")
vim.g.colors_name = O.colorscheme -- needs to be callsed after plugins or it breaks new installs
require("settings")
require("lv-utils")
require("lv-treesitter")
