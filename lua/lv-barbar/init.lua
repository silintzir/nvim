local M = {}

M.config = function()
    local opts = {noremap = true, silent = true}
    vim.api.nvim_set_keymap("n", "<TAB>", ":BufferNext<cr>", opts)
    vim.api.nvim_set_keymap("n", "<S-TAB>", ":BufferPrevious<cr>", opts)
    vim.api.nvim_set_keymap("n", "<S-x>", ":BufferClose<cr>", opts)
end

return M
