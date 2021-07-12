CONFIG_PATH = vim.fn.stdpath("config")
DATA_PATH = vim.fn.stdpath("data")
CACHE_PATH = vim.fn.stdpath("cache")
TERMINAL = vim.fn.expand("$TERMINAL")
USER = vim.fn.expand("$USER")

O = {
	-- custom options
	leader_key = "space",
	colorscheme = "tokyonight",
	line_wrap_cursor_movement = true,
	transparent_window = false,
	format_on_save = true,
	vsnip_dir = CONFIG_PATH .. "/snippets",
	-- default options
	default_options = {
		backup = false, -- creates a backup file
		clipboard = "unnamedplus", -- allows neovim to access the system clipboard
		cmdheight = 2, -- more space in the neovim command line for displaying messages
		colorcolumn = "99999", -- fixes indentline for now
		completeopt = { "menuone", "noselect" },
		conceallevel = 0, -- so that `` is visible in markdown files
		cursorline = true, -- highlight the current line
		expandtab = true, -- convert tabs to spaces
		fileencoding = "utf-8", -- the encoding written to a file
		guifont = "monospace:h17", -- the font used in graphical neovim applications
		hidden = true, -- required to keep multiple buffers and open multiple buffers
		hlsearch = false, -- highlight all matches on previous search pattern
		ignorecase = true, -- ignore case in search patterns
		mouse = "a", -- allow the mouse to be used in neovim
		number = true, -- set numbered lines
		numberwidth = 4, -- set number column width to 2 {default 4}
		pumheight = 10, -- pop up menu height
		relativenumber = false, -- set relative numbered lines
		scrolloff = 8, -- is one of my fav
		shiftwidth = 2, -- the number of spaces inserted for each indentation
		showmode = false, -- we don't need to see things like -- INSERT -- anymore
		showtabline = 2, -- always show tabs
		signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
		smartcase = true, -- smart case
		smartindent = true, -- make indenting smarter again
		splitbelow = true, -- force all horizontal splits to go below current window
		spell = false,
		spelllang = "en",
		splitright = true, -- force all vertical splits to go to the right of current window
		swapfile = false, -- creates a swapfile
		tabstop = 2, -- insert 2 spaces for a tab
		termguicolors = true, -- set term gui colors (most terminals support this)
		timeoutlen = 100, -- time to wait for a mapped sequence to complete (in milliseconds)
		title = true, -- set the title of window to the value of the titlestring
		undodir = CACHE_PATH .. "/undo", -- set an undo directory
		undofile = true, -- enable persisten undo
		updatetime = 300, -- faster completion
		wrap = false, -- display lines as one long line
		writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	},
	-- TODO: refactor for tree
	auto_close_tree = 0,
	nvim_tree_disable_netrw = 0,
	-- lsp
	lsp = { popup_border = "single", document_highlight = true },
	-- database
	database = { save_location = "~/.config/nvcode_db", auto_execute = 1 },
	-- plugins
	plugin = {
		colorizer = { active = false },
		zen = { active = false },
		ts_playground = { active = false },
		ts_context_commentstring = { active = false },
		ts_hintobjects = { active = false },
		ts_autotag = { active = false },
		ts_rainbow = { active = false },
		ts_textobjects = { active = false },
		ts_textsubjects = { active = false },
		telescope_fzy = { active = false },
		telescope_project = { active = false },
		indent_line = { active = false },
		symbol_outline = { active = false },
		diffview = { active = false },
		floatterm = { active = false },
		trouble = { active = false },
		hop = { active = false },
		bqf = { active = false },
		spectre = { active = false },
		lazygit = { active = false },
	},
	-- TODO: just using mappings (leader mappings)
	user_which_key = {},
	-- user plugins - do not put here, use lv-config.lua instead
	user_plugins = {},
	-- auto commands
	user_autocommands = {
		{ "FileType", "qf", "set nobuflisted" },
	},
	lang = {
		css = { virtual_text = true },
		graphql = {},
		emmet = { active = true },
		html = {},
		json = {
			diagnostics = { virtual_text = { spacing = 0, prefix = "" }, signs = true, underline = true },
			formatter = {
				exe = "python",
				args = { "-m", "json.tool" },
			},
		},
		latex = {
			auto_save = false,
			ignore_errors = {},
		},
		lua = {
			diagnostics = { virtual_text = { spacing = 0, prefix = "" }, signs = true, underline = true },
			formatter = {
				exe = "stylua",
				args = {},
				stdin = false,
			},
		},
		php = {
			diagnostics = { virtual_text = { spacing = 0, prefix = "" }, signs = true, underline = true },
			format = {
				braces = {
					default = "psr12",
				},
			},
			environment = {
				php_version = "5.6",
			},
			filetypes = { "php", "phtml", "go" },
			formatter = {
				exe = "phpcbf",
				args = { "--standard=PSR12", vim.api.nvim_buf_get_name(0) },
				stdin = false,
			},
		},
		sh = {
			-- @usage can be 'shellcheck'
			linter = "",
			-- @usage can be 'shfmt'
			diagnostics = { virtual_text = { spacing = 0, prefix = "" }, signs = true, underline = true },
			formatter = {
				exe = "shfmt",
				args = { "-w" },
				stdin = false,
			},
		},
		tsserver = {
			linter = "eslint",
			diagnostics = { virtual_text = { spacing = 0, prefix = "" }, signs = true, underline = true },
			formatter = {
				exe = "prettier",
				args = { "--write", "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
				stdin = false,
			},
		},
		vim = {},
		yaml = {
			formatter = {
				exe = "prettier",
				args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
			},
		},
	},
}

require("lv-zen.config")
require("lv-compe.config")
require("lv-floatterm.config")
require("lv-galaxyline.config")
require("lv-gitsigns.config")
require("lv-telescope.config")
require("lv-which-key.config")
require("lv-treesitter.config")
