-- TODO figure out why this don't work
vim.fn.sign_define(
	"LspDiagnosticsSignError",
	{ texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError" }
)
vim.fn.sign_define(
	"LspDiagnosticsSignWarning",
	{ texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning" }
)
vim.fn.sign_define(
	"LspDiagnosticsSignHint",
	{ texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint" }
)
vim.fn.sign_define(
	"LspDiagnosticsSignInformation",
	{ texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation" }
)

-- Set Default Prefix.
-- Note: You can set a prefix per lsp server in the lv-globals.lua file
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = { prefix = "", spacing = 0 },
	signs = true,
	underline = true,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = O.lsp.popup_border,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = O.lsp.popup_border,
})

-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
	"   (Text) ",
	"   (Method)",
	"   (Function)",
	"   (Constructor)",
	" ﴲ  (Field)",
	"[] (Variable)",
	"   (Class)",
	" ﰮ  (Interface)",
	"   (Module)",
	" 襁 (Property)",
	"   (Unit)",
	"   (Value)",
	" 練 (Enum)",
	"   (Keyword)",
	"   (Snippet)",
	"   (Color)",
	"   (File)",
	"   (Reference)",
	"   (Folder)",
	"   (EnumMember)",
	" ﲀ  (Constant)",
	" ﳤ  (Struct)",
	"   (Event)",
	"   (Operator)",
	"   (TypeParameter)",
}

local function documentHighlight(client)
	-- Set autocommands conditional on server_capabilities
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
			false
		)
	end
end

local lsp_config = {}

-- Taken from https://www.reddit.com/r/neovim/comments/gyb077/nvimlsp_peek_defination_javascript_ttserver/
function lsp_config.preview_location(location, context, before_context)
	-- location may be LocationLink or Location (more useful for the former)
	context = context or 15
	before_context = before_context or 0
	local uri = location.targetUri or location.uri
	if uri == nil then
		return
	end
	local bufnr = vim.uri_to_bufnr(uri)
	if not vim.api.nvim_buf_is_loaded(bufnr) then
		vim.fn.bufload(bufnr)
	end

	local range = location.targetRange or location.range
	local contents = vim.api.nvim_buf_get_lines(
		bufnr,
		range.start.line - before_context,
		range["end"].line + 1 + context,
		false
	)
	local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
	return vim.lsp.util.open_floating_preview(contents, filetype, { border = O.lsp.popup_border })
end

function lsp_config.preview_location_callback(_, method, result)
	local context = 15
	if result == nil or vim.tbl_isempty(result) then
		print("No location found: " .. method)
		return nil
	end
	if vim.tbl_islist(result) then
		lsp_config.floating_buf, lsp_config.floating_win = lsp_config.preview_location(result[1], context)
	else
		lsp_config.floating_buf, lsp_config.floating_win = lsp_config.preview_location(result, context)
	end
end

function lsp_config.PeekDefinition()
	if vim.tbl_contains(vim.api.nvim_list_wins(), lsp_config.floating_win) then
		vim.api.nvim_set_current_win(lsp_config.floating_win)
	else
		local params = vim.lsp.util.make_position_params()
		return vim.lsp.buf_request(0, "textDocument/definition", params, lsp_config.preview_location_callback)
	end
end

function lsp_config.PeekTypeDefinition()
	if vim.tbl_contains(vim.api.nvim_list_wins(), lsp_config.floating_win) then
		vim.api.nvim_set_current_win(lsp_config.floating_win)
	else
		local params = vim.lsp.util.make_position_params()
		return vim.lsp.buf_request(0, "textDocument/typeDefinition", params, lsp_config.preview_location_callback)
	end
end

function lsp_config.PeekImplementation()
	if vim.tbl_contains(vim.api.nvim_list_wins(), lsp_config.floating_win) then
		vim.api.nvim_set_current_win(lsp_config.floating_win)
	else
		local params = vim.lsp.util.make_position_params()
		return vim.lsp.buf_request(0, "textDocument/implementation", params, lsp_config.preview_location_callback)
	end
end

function lsp_config.common_on_attach(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "gp", ":lua require'lsp'.PeekDefinition()<CR>", opts)
	buf_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "<C-p>", ":lua vim.lsp.diagnostic.goto_prev:<CR>", opts)
	buf_set_keymap("n", "<C-n>", ":lua vim.lsp.diagnostic.goto_next:<CR>", opts)
	vim.cmd('command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()')

	if O.lsp.document_highlight then
		documentHighlight(client, bufnr)
	end
end

-- use q to close the lspinfo popup
require("lv-utils").define_augroups({
	_general_lsp = { { "FileType", "lspinfo", "nnoremap <silent> <buffer> q :q<CR>" } },
})

return lsp_config
