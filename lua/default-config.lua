CONFIG_PATH = vim.fn.stdpath("config")
DATA_PATH = vim.fn.stdpath("data")
CACHE_PATH = vim.fn.stdpath("cache")
TERMINAL = vim.fn.expand "$TERMINAL"
USER = vim.fn.expand "$USER"

O = {
    -- custom options
    colorscheme = "tokyonight",
    transparent_window = false,
    leader_key = " ",
    format_on_save = false,
    vsnip_dir = CONFIG_PATH .. "/snippets",
    -- default options
    default_options = {
        backup = false, -- creates a backup file
        clipboard = "unnamedplus", -- allows neovim to access the system clipboard
        cmdheight = 2, -- more space in the neovim command line for displaying messages
        colorcolumn = "99999", -- fixes indentline for now
        completeopt = {"menuone", "noselect"},
        conceallevel = 0, -- so that `` is visible in markdown files
        fileencoding = "utf-8", -- the encoding written to a file
        guifont = "monospace:h17", -- the font used in graphical neovim applications
        hidden = true, -- required to keep multiple buffers and open multiple buffers
        hlsearch = false, -- highlight all matches on previous search pattern
        ignorecase = true, -- ignore case in search patterns
        mouse = "a", -- allow the mouse to be used in neovim
        pumheight = 10, -- pop up menu height
        showmode = false, -- we don't need to see things like -- INSERT -- anymore
        showtabline = 2, -- always show tabs
        smartcase = true, -- smart case
        smartindent = true, -- make indenting smarter again
        splitbelow = true, -- force all horizontal splits to go below current window
        splitright = true, -- force all vertical splits to go to the right of current window
        swapfile = false, -- creates a swapfile
        termguicolors = true, -- set term gui colors (most terminals support this)
        timeoutlen = 100, -- time to wait for a mapped sequence to complete (in milliseconds)
        title = true, -- set the title of window to the value of the titlestring
        -- opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
        undodir = CACHE_PATH .. "/undo", -- set an undo directory
        undofile = true, -- enable persisten undo
        updatetime = 300, -- faster completion
        writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
        expandtab = true, -- convert tabs to spaces
        shiftwidth = 2, -- the number of spaces inserted for each indentation
        tabstop = 2, -- insert 2 spaces for a tab
        cursorline = true, -- highlight the current line
        number = true, -- set numbered lines
        relativenumber = false, -- set relative numbered lines
        numberwidth = 4, -- set number column width to 2 {default 4}
        signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
        wrap = false, -- display lines as one long line
        spell = false,
        spelllang = "en",
        scrolloff = 8 -- is one of my fav
    },
    -- TODO: refactor for tree
    auto_close_tree = 0,
    nvim_tree_disable_netrw = 0,
    -- lsp
    lsp = {popup_border = "single", document_highlight = true},
    -- database
    database = {save_location = "~/.config/nvcode_db", auto_execute = 1},
    -- plugins
    plugin = {
        colorizer = {active = false},
        zen = {active = false},
        ts_playground = {active = false},
        ts_context_commentstring = {active = false},
        ts_hintobjects = {active = false},
        ts_autotag = {active = false},
        ts_rainbow = {active = false},
        ts_textobjects = {active = false},
        ts_textsubjects = {active = false},
        telescope_fzy = {active = false},
        telescope_project = {active = false},
        indent_line = {active = false},
        symbol_outline = {active = false},
        diffview = {active = false},
        floatterm = {active = false},
        trouble = {active = false},
        hop = {active = false},
        bqf = {active = false},
        spectre = {active = false},
        lazygit = {active = false}
    },
    -- TODO: just using mappings (leader mappings)
    user_which_key = {},
    -- user plugins - do not put here, use lv-config.lua instead
    user_plugins = {},
    -- auto commands
    user_autocommands = {
        {"FileType", "qf", "set nobuflisted"}
    },
    -- @usage pass a table with installed languages
    treesitter = {
        ensure_installed = {
            "typescript",
            "javascript",
            "lua",
            "html",
            "css",
            "php",
            "yaml",
            "json",
            "graphql",
            "jsonc",
            "jsdoc",
            "latex",
            "bash"
        },
        ignore_install = {},
        -- The below are for treesitter-textobjects plugin
        highlight = {enabled = true},
        textobj_prefixes = {
            goto_next = "]", -- Go to next
            goto_previous = "[", -- Go to previous
            inner = "i", -- Select inside
            outer = "a", -- Selct around
            swap = "<leader>a" -- Swap with next
        },
        textobj_suffixes = {
            -- Start and End respectively for the goto keys
            -- for other keys it only uses the first
            ["function"] = {"f", "F"},
            ["class"] = {"m", "M"},
            ["parameter"] = {"a", "A"},
            ["block"] = {"k", "K"},
            ["conditional"] = {"i", "I"},
            ["call"] = {"c", "C"},
            ["loop"] = {"l", "L"},
            ["statement"] = {"s", "S"},
            ["comment"] = {"/", "?"}
        },
        -- The below is for treesitter hint textobjects plugin
        hint_labels = {"h", "j", "f", "d", "n", "v", "s", "l", "a"}
    },
    lang = {
        css = {virtual_text = true},
        graphql = {},
        emmet = {active = true},
        html = {},
        json = {diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}},
        lua = {
            diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
        },
        php = {
            diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true},
            format = {
                braces = {
                    default = "psr12"
                }
            },
            environment = {
                php_version = "5.6"
            },
            filetypes = {"php", "phtml", "go"}
        },
        sh = {
            -- @usage can be 'shellcheck'
            linter = "",
            -- @usage can be 'shfmt'
            diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
        },
        tsserver = {
            linter = "",
            diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
        },
        vim = {},
        yaml = {}
    }
}

require "lv-zen.config"
require "lv-compe.config"
require "lv-floatterm.config"
require "lv-galaxyline.config"
require "lv-gitsigns.config"
require "lv-telescope.config"
require "lv-which-key.config"
require "lv-treesitter.config"
