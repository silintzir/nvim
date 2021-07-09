CONFIG_PATH = vim.fn.stdpath("config")
DATA_PATH = vim.fn.stdpath("data")
CACHE_PATH = vim.fn.stdpath("cache")
TERMINAL = vim.fn.expand "$TERMINAL"
USER = vim.fn.expand "$USER"

function Foo()
    print("Panayiotis")
end

O = {
    format_on_save = false,
    auto_close_tree = 0,
    auto_complete = true,
    colorcolumn = "99999", -- fixes indentline for now
    colorscheme = "lunar",
    clipboard = "unnamedplus",
    hidden_files = true,
    wrap = false,
    nvim_tree_width = 40,
    number = true,
    relative_number = true,
    number_width = 4,
    cmdheight = 2,
    cursorline = true,
    shell = "zsh",
    scrolloff = 0,
    timeoutlen = 100,
    nvim_tree_disable_netrw = 0,
    ignore_case = true,
    smart_case = true,
    hl_search = false,
    document_highlight = true,
    transparent_window = false,
    extras = false,
    leader_key = " ",
    vsnip_dir = CONFIG_PATH .. "/snippets",
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
    -- @usage pass a table with installed languages
    treesitter = {
        ensure_installed = {"typescript", "javascript", "lua", "html", "css", "php", "yaml"},
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
    lsp = {popup_border = "single"},
    database = {save_location = "~/.config/nvcode_db", auto_execute = 1},
    lang = {
        css = {virtual_text = true},
        graphql = {},
        emmet = {active = false},
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
            filetypes = {"php", "go"}
        },
        sh = {
            linter = "",
            diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
        },
        tsserver = {
            linter = "eslint",
            diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
        },
        yaml = {}
    },
    user_autocommands = {{"FileType", "qf", "set nobuflisted"}}
}
