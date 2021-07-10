O.plugin.which_key = {
    active = true,
    setup = {
        plugins = {
            marks = true, -- shows a list of your marks on ' and `
            registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            -- the presets plugin, adds help for a bunch of default keybindings in neovim
            -- No actual key bindings are created

            presets = {
                operators = false, -- adds support for operators like d,y
                motions = false, -- adds help for motions
                text_objects = false, -- help for text objects triggered after entering an operator
                windows = true, -- default bindings on <C-w>
                nav = true, -- misc bindings to work with windows
                z = true, -- bindings for folds, spelling and others prefixed with z
                g = true -- bindings for prefixed with g
            }
        },
        icons = {
            breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
            separator = "➜", -- symbol used between a key and it's label
            group = " +" -- symbol prepended to a group
        },
        window = {
            border = "single", -- none, single, double, shadow
            position = "bottom", -- bottom, top
            margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
            padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
        },
        layout = {
            height = {min = 5, max = 25}, -- min and max height of the columns
            width = {min = 10, max = 50}, -- min and max width of the columns
            spacing = 10 -- spacing between columns
        },
        hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
        show_help = false -- show help message on the command line when the popup is visible
    },
    opts = {
        mode = "n", -- NORMAL mode
        prefix = "<leader>",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true -- use `nowait` when creating keymaps
    },
    mappings = {
        ["1"] = "Tab 1",
        ["2"] = "Tab 2",
        ["3"] = "Tab 3",
        ["4"] = "Tab 4",
        ["5"] = "Tab 5",
        ["6"] = "Tab 6",
        ["7"] = "Tab 7",
        ["8"] = "Tab 8",
        ["9"] = "Tab 9",
        m = {
            name = "Misc",
            a = {":e " .. CONFIG_PATH .. "/lv-config.lua<CR>", "Config"},
            d = {'"_d', "Dead delete"},
            e = {":lua require('lv-nvimtree').toggle_tree()<cr>", "Explorer"},
            h = {":set hlsearch!<cr>", "Toggle highlight searches"},
            n = {":set invrelativenumber<cr>", "Toggle relative number"},
            c = {':let @/=""<cr>', "Clear last searches"},
            s = {":source %<cr>", "Source %"},
            l = {":luafile %<cr>", "Luafile %"},
            t = {":lua require'FTerm'.toggle()<cr>", "Terminal"},
            z = {":ZenMode<cr>", "Zen mode"},
            q = {":qall!<cr>", "Quit vim & Discard all changes"}
        },
        f = {
            name = "Find",
            f = {":Telescope find_files<cr>", "Files"},
            l = {":Telescope live_grep<cr>", "Live grep"},
            m = {":Telescope marks<cr>", "Marks"},
            r = {":Telescope registers<cr>", "Registers"},
            h = {":Telescope help_tags<cr>", "Find Help"},
            M = {":Telescope man_pages<cr>", "Man Pages"},
            o = {":Telescope oldfiles<cr>", "Open Recent File"},
            t = {":TodoTelescope<cr>", "Todos/Bugs/Hacks"}
        },
        g = {
            name = "Git",
            g = {":LazyGit<cr>", "LazyGit"},
            j = {":lua require'gitsigns'.next_hunk()<cr>", "GS: Next hunk"},
            k = {":lua require'gitsigns'.prev_hunk()<cr>", "GS: Previous hunk"},
            l = {":lua require'gitsigns'.blame_line()<cr>", "GS: Blame line"},
            p = {":lua require'gitsigns'.preview_hunk()<cr>", "GS: Preview hunk"},
            r = {":lua require'gitsigns'.reset_hunk()<cr>", "GS: Reset hunk"},
            R = {":lua require'gitsigns'.reset_buffer()<cr>", "GS: Reset buffer"},
            s = {":lua require'gitsigns'.stage_hunk()<cr>", "GS: Stage hunk"},
            u = {":lua require'gitsigns'.undo_stage_hunk()<cr>", "GS: Undo stage hunk"},
            o = {":Telescope git_status<cr>", "Telescope: Open changed file"},
            b = {":Telescope git_branches<cr>", "Telescope: Checkout branch"},
            c = {":Telescope git_commits<cr>", "Telescope: Checkout commit"},
            C = {":Telescope git_bcommits<cr>", "Telescope: Checkout commit (for current file)"}
        },
        b = {
            name = "Buffers",
            b = {":BufferPick<cr>", "Pick"},
            c = {":BufferClose<cr>", "Close"},
            f = {":Telescope buffers<cr>", "Find in buffers"},
            l = {":BufferCloseBuffersLeft<cr>", "Close buffers to the left"},
            r = {":BufferCloseBuffersRight<cr>", "Close buffers to the right"},
            o = {":BufferCloseAllButCurrent<cr>", "Close all but current"},
            D = {":BufferOrderByDirectory<cr>", "Sort by directory"},
            E = {":BufferOrderByLanguage<cr>", "Sort by language"}
        },
        l = {
            name = "LSP",
            a = {":lua vim.lsp.buf.code_action()<cr>", "LSP: Code action"},
            d = {":Telescope lsp_document_diagnostics<cr>", "Telescope: Document diagnostics"},
            w = {":Telescope lsp_workspace_diagnostics<cr>", "Telescope: Workspace diagnostics"},
            f = {":lua vim.lsp.buf.formatting()<cr>", "Lsp: Format"},
            i = {":LspInfo<cr>", "LSP: Info"},
            j = {
                ":lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = O.lsp.popup_border}})<cr>",
                "LSP: Prev Diagnostic"
            },
            k = {
                ":lua vim.lsp.diagnostic.goto_next({popup_opts = {border = O.lsp.popup_border}})<cr>",
                "LSP: Next Diagnostic"
            },
            q = {":Telescope quickfix<cr>", "Telescope: Quickfix"},
            r = {":lua vim.lsp.buf.rename()<cr>", "LSP: Rename"},
            s = {":Telescope lsp_document_symbols<cr>", "Telescope: Document Symbols"},
            S = {":Telescope lsp_dynamic_workspace_symbols<cr>", "Telescope: Workspace Symbols"}
        },
        d = {
            name = "Diagnostics",
            t = {":TroubleToggle<cr>", "Trouble"},
            w = {":TroubleToggle lsp_workspace_diagnostics<cr>", "Workspace"},
            d = {":TroubleToggle lsp_document_diagnostics<cr>", "Document"},
            q = {":TroubleToggle quickfix<cr>", "Quickfix"},
            l = {":TroubleToggle loclist<cr>", "Location list"},
            r = {":TroubleToggle lsp_references<cr>", "References"}
        },
        r = {
            name = "Replace",
            r = {":lua require('spectre').open()<cr>", "In project"},
            w = {"viw:lua require('spectre').open_file_search()<cr>", "Current word"},
            ["*"] = {":let @/='\\<'.expand('<cword>').'\\>'<CR>cgn", "One by one"}
        }
    }
}
