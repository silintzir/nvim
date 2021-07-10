local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
    return
end

packer.init {
    git = {clone_timeout = 300},
    display = {
        open_fn = function()
            return require("packer.util").float {border = "single"}
        end
    }
}

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(
    function(use)
        -- Packer can manage itself as an optional plugin
        use "wbthomason/packer.nvim"

        -- NOTE: refactor all of this (for now it works, but yes I know it could be wrapped in a simpler function)
        use {"neovim/nvim-lspconfig"}
        use {"kabouzeid/nvim-lspinstall", event = "VimEnter"}

        -- Telescope
        use {"nvim-lua/popup.nvim"}
        use {"nvim-lua/plenary.nvim"}
        use {"tjdevries/astronauta.nvim"}
        use {"nvim-telescope/telescope.nvim", config = [[require('lv-telescope')]]}

        -- Autocomplete
        use {
            "hrsh7th/nvim-compe",
            event = "InsertEnter",
            config = function()
                require("lv-compe").config()
            end
        }

        use {"hrsh7th/vim-vsnip", event = "InsertEnter"}
        use {"rafamadriz/friendly-snippets", event = "InsertEnter"}

        -- Treesitter
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

        -- neoformat
        use {
            "sbdchd/neoformat",
            config = function()
                require "lv-neoformat"
            end,
            event = "BufRead"
        }

        -- nvim-tree
        use {
            "kyazdani42/nvim-tree.lua",
            config = function()
                require("lv-nvimtree").config()
            end
        }

        -- gitsigns
        use {
            "lewis6991/gitsigns.nvim",
            config = function()
                require("lv-gitsigns").config()
            end,
            event = "BufRead"
        }

        -- whichkey
        use {
            "folke/which-key.nvim",
            config = function()
                require "lv-which-key"
            end,
            event = "BufWinEnter"
        }

        -- Autopairs
        use {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            after = {"telescope.nvim"},
            config = function()
                require "lv-autopairs"
            end
        }

        -- Comments
        use {
            "terrortylor/nvim-comment",
            event = "BufWinEnter",
            config = function()
                local status_ok, nvim_comment = pcall(require, "nvim_comment")
                if not status_ok then
                    return
                end
                nvim_comment.setup()
            end
        }

        -- Color
        -- use {"christianchiarulli/nvcode-color-schemes.vim", opt = true}

        -- tokyonight
        use {"folke/tokyonight.nvim"}

        -- Icons
        use {"kyazdani42/nvim-web-devicons"}

        -- Status Line
        use {
            "glepnir/galaxyline.nvim",
            event = "BufWinEnter",
            config = function()
                require "lv-galaxyline"
            end
        }

        -- barbar
        use {
            "romgrk/barbar.nvim",
            config = function()
                require("lv-barbar").config()
            end,
            event = "BufWinEnter"
        }

        -- startup time
        use {"tweekmonster/startuptime.vim"}

        -- Builtins, these do not load by default

        -- Zen Mode
        use {
            "folke/zen-mode.nvim",
            cmd = "ZenMode",
            -- event = "BufRead",
            config = function()
                require("lv-zen").config()
            end,
            disable = not O.plugin.zen.active
        }

        -- Colorizer
        use {
            "norcalli/nvim-colorizer.lua",
            event = "BufRead",
            config = function()
                require("lv-colorizer")
            end,
            disable = not O.plugin.colorizer.active
        }

        -- treesitter playground
        use {
            event = "BufRead",
            "nvim-treesitter/playground",
            disable = not O.plugin.ts_playground.active
        }

        -- indent blankline
        use {
            "lukas-reineke/indent-blankline.nvim",
            event = "BufRead",
            setup = function()
                vim.g.indentLine_enabled = 1
                vim.g.indent_blankline_char = "▏"

                vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
                vim.g.indent_blankline_buftype_exclude = {"terminal"}

                vim.g.indent_blankline_show_trailing_blankline_indent = false
                vim.g.indent_blankline_show_first_indent_level = true
            end,
            disable = not O.plugin.indent_line.active
        }

        -- comments in context
        use {
            "JoosepAlviste/nvim-ts-context-commentstring",
            event = "BufRead",
            disable = not O.plugin.ts_context_commentstring.active
        }

        -- Symbol Outline
        use {
            "simrat39/symbols-outline.nvim",
            cmd = "SymbolsOutline",
            disable = not O.plugin.symbol_outline.active
        }

        -- diagnostics
        use {"folke/trouble.nvim", cmd = "TroubleToggle", disable = not O.plugin.trouble.active}

        -- Floating terminal
        use {
            "numToStr/FTerm.nvim",
            event = "BufWinEnter",
            config = function()
                require("lv-floatterm").config()
            end,
            disable = not O.plugin.floatterm.active
        }

        -- telescope fzy sorter
        use {
            "nvim-telescope/telescope-fzy-native.nvim",
            event = "BufRead",
            disable = not O.plugin.telescope_fzy.active
        }

        -- Use project for telescope
        use {
            "nvim-telescope/telescope-project.nvim",
            event = "BufRead",
            setup = function()
                vim.cmd [[packadd telescope.nvim]]
            end,
            disable = not O.plugin.telescope_project.active
        }

        -- Diffview
        use {"sindrets/diffview.nvim", event = "BufRead", disable = not O.plugin.diffview.active}

        -- Better motions
        use {
            "phaazon/hop.nvim",
            event = "BufRead",
            config = function()
                require("lv-hop").config()
            end,
            disable = not O.plugin.hop.active
        }

        -- Better quickfix
        use {"kevinhwang91/nvim-bqf", event = "BufRead", disable = not O.plugin.bqf.active}

        -- Search & Replace
        use {
            "windwp/nvim-spectre",
            event = "BufRead",
            config = function()
                require("lv-spectre").config()
            end,
            disable = not O.plugin.spectre.active
        }

        -- Lazygit
        use {"kdheepak/lazygit.nvim", cmd = "LazyGit", disable = not O.plugin.lazygit.active}

        -- todo-comments
        use {
            "folke/todo-comments.nvim",
            after = {"nvim-compe"},
            config = function()
                require("lv-todocomments").config {}
            end
        }

        use {
            "ray-x/lsp_signature.nvim",
            event = "InsertEnter",
            config = function()
                require("lsp_signature").on_attach()
            end
        }

        -- Javascript / Typescript
        use {
            "jose-elias-alvarez/nvim-lsp-ts-utils",
            after = {"nvim-compe"},
            ft = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"}
        }

        -- Pretty parentheses
        use {"p00f/nvim-ts-rainbow", disable = not O.plugin.ts_rainbow.active}

        -- Autotags <div>|</div>
        use {"windwp/nvim-ts-autotag", event = "InsertEnter", disable = not O.plugin.ts_autotag.active}

        -- Custom semantic text objects
        use {"nvim-treesitter/nvim-treesitter-textobjects", disable = not O.plugin.ts_textobjects.active}

        -- Smart text objects
        use {"RRethy/nvim-treesitter-textsubjects", disable = not O.plugin.ts_textsubjects.active}

        -- Text objects using hint labels
        use {"mfussenegger/nvim-ts-hint-textobject", event = "BufRead", disable = not O.plugin.ts_hintobjects.active}
    end
)
