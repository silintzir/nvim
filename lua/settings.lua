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
opt.shortmess:append("c") -- Don't pass messages to |ins-completion-menu|.

local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin", -- 'man',
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin"
    -- 'matchit', 'matchparen', 'shada_plugin',
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

for k, v in pairs(O.default_options) do
    vim.opt[k] = v
end
