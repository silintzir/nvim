local M = {}

M.config = function()
	local opts = { noremap = true, silent = true }
	vim.api.nvim_set_keymap("n", "<TAB>", ":BufferNext<cr>", opts)
	vim.api.nvim_set_keymap("n", "<S-TAB>", ":BufferPrevious<cr>", opts)
	vim.api.nvim_set_keymap("n", "<S-x>", ":BufferClose<cr>", opts)
	vim.api.nvim_set_keymap("n", "<leader>1", ":BufferGoto 1<cr>", opts)
	vim.api.nvim_set_keymap("n", "<leader>2", ":BufferGoto 2<cr>", opts)
	vim.api.nvim_set_keymap("n", "<leader>3", ":BufferGoto 3<cr>", opts)
	vim.api.nvim_set_keymap("n", "<leader>4", ":BufferGoto 4<cr>", opts)
	vim.api.nvim_set_keymap("n", "<leader>5", ":BufferGoto 5<cr>", opts)
	vim.api.nvim_set_keymap("n", "<leader>6", ":BufferGoto 6<cr>", opts)
	vim.api.nvim_set_keymap("n", "<leader>7", ":BufferGoto 7<cr>", opts)
	vim.api.nvim_set_keymap("n", "<leader>8", ":BufferGoto 8<cr>", opts)
	vim.api.nvim_set_keymap("n", "<leader>9", ":BufferGoto 9<cr>", opts)
end

return M
