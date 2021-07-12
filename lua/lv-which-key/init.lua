local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local kopts = { noremap = true, silent = true }

-- Set leader
if O.leader_key == " " or O.leader_key == "space" then
	vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", kopts)
	vim.g.mapleader = " "
else
	vim.api.nvim_set_keymap("n", O.leader_key, "<NOP>", kopts)
	vim.g.mapleader = O.leader_key
end

local setup = O.plugin.which_key.setup
local opts = O.plugin.which_key.opts
local mappings = O.plugin.which_key.mappings
which_key.setup(setup)

for k, v in pairs(O.user_which_key) do
	mappings[k] = v
end

which_key.register(mappings, opts)
