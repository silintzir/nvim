-- HELPERS --
local cmd = vim.cmd
local opt = vim.opt

-- VIM ONLY COMMANDS --
cmd("filetype plugin on") -- filetype detection
cmd('let &titleold="' .. TERMINAL .. '"')
cmd("set inccommand=split") -- Make substitution work in realtime
cmd("set iskeyword+=-") -- treat dash separated words as a word text object"
cmd("set whichwrap+=<,>,[,],h,l") -- move to next line with theses keys
if O.transparent_window then
    cmd "au ColorScheme * hi Normal ctermbg=none guibg=none"
    cmd "au ColorScheme * hi SignColumn ctermbg=none guibg=none"
end

-- SETTINGS
opt.backup = false
opt.clipboard = O.clipboard
opt.cmdheight = O.cmdheight -- More space for displaying messages
opt.colorcolumn = O.colorcolumn
opt.completeopt = {"menuone,noselect"}
opt.conceallevel = 0 -- So that I can see `` in markdown files
opt.cursorline = O.cursorline
opt.expandtab = true
opt.fileencoding = "utf-8" -- The encoding written to file
opt.hidden = O.hidden_files -- Required to keep multiple buffers open multiple buffers
opt.hlsearch = O.hl_search
opt.ignorecase = O.ignore_case
opt.mouse = "a"
opt.number = O.number -- set numbered lines
opt.numberwidth = O.numberwidth
opt.pumheight = 10 -- Makes popup menu smalle
opt.relativenumber = true -- set relative number
opt.scrolloff = O.scrolloff -- minimum number of files to keep above and below the cursor
opt.shiftwidth = 2
opt.shortmess:append("c") -- Don't pass messages to |ins-completion-menu|.
opt.showmode = true -- We don't need to see things like -- INSERT -- anymore
opt.showtabline = 2 -- Always show tabs
opt.signcolumn = "yes"
opt.smartcase = O.smart_case
opt.smartindent = true -- make indent smarter
opt.splitbelow = true -- Horizontal splits will automatically be below
opt.splitright = true -- Vertical splits will automatically be to the right
opt.swapfile = false -- Do not write any swp files
opt.tabstop = 2
opt.termguicolors = true -- set term gui colors most terminals support this
opt.timeoutlen = O.timeoutlen -- By default timeoutlen is 1000 ms
opt.title = true
opt.titlestring = "%<%F%=%l/%L - nvim"
opt.undodir = CACHE_PATH .. "/undo" -- Set undo directory
opt.undofile = true -- Enable persistent undo
opt.updatetime = 300 -- Faster completion
opt.wrap = O.wrap -- Display long lines as just one line
opt.writebackup = false -- This is recommended by coc
