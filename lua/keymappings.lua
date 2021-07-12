local opts = { noremap = true, silent = true }

-- better window movement
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { silent = true })
-- resize with arrows
vim.api.nvim_set_keymap("n", "<A-Up>", ":resize -2<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-Down>", ":resize +2<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-Left>", ":vertical resize -2<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-Right>", ":vertical resize +2<CR>", { silent = true })

-- better indenting
vim.api.nvim_set_keymap("v", "<", "<gv", opts)
vim.api.nvim_set_keymap("v", ">", ">gv", opts)

-- better escape
vim.api.nvim_set_keymap("i", "kj", "<ESC>", opts)
vim.api.nvim_set_keymap("i", "jk", "<ESC>", opts)

-- Move current line / block
vim.api.nvim_set_keymap("n", "<C-j>", ":m .+1<cr>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", ":m .-2<cr>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", opts)

-- forward delete in insert mode
vim.api.nvim_set_keymap("i", "<C-l>", "<del>", opts)

-- better deletions
vim.api.nvim_set_keymap("n", "x", '"_x', opts)
vim.api.nvim_set_keymap("n", "X", '"_x', opts)

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-k> ("\\<C-p>")')
vim.cmd('inoremap <expr> <c-j> ("\\<C-n>")')

-- better yanking
vim.api.nvim_set_keymap("x", "y", "ygv<ESC>", opts) -- keep the cursor at the bottom of the visual selection after yanking
vim.api.nvim_set_keymap("n", "Y", "y$", opts)

-- better putting / pasting
vim.api.nvim_set_keymap("x", "p", "pgvy", opts)

-- replace text (simulates multiple cursors)
vim.api.nvim_set_keymap("x", "<leader>r*", '"sy:let @/=@s<CR>cgn', opts)

-- QuickFix
vim.api.nvim_set_keymap("n", "]q", ":cnext<CR>", opts)
vim.api.nvim_set_keymap("n", "[q", ":cprev<CR>", opts)

-- Toggle the QuickFix window
vim.api.nvim_set_keymap("", "<C-q>", ":call QuickFixToggle()<CR>", opts)
