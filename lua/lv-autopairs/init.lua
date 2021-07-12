local Rule = require("nvim-autopairs.rule")

local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
	return
end

-- skip it, if you use another global object
_G.MUtils = {}

vim.g.completion_confirm_key = ""
MUtils.completion_confirm = function()
	if vim.fn.pumvisible() ~= 0 then
		if vim.fn.complete_info()["selected"] ~= -1 then
			return vim.fn["compe#confirm"](autopairs.esc("<cr>"))
		else
			return autopairs.esc("<cr>")
		end
	else
		return autopairs.autopairs_cr()
	end
end

if package.loaded["compe"] then
	require("nvim-autopairs.completion.compe").setup({
		map_cr = true, --  map <CR> on insert mode
		map_complete = true, -- it will auto insert `(` after select function or method item
	})
end

autopairs.setup({
	check_ts = true,
	ts_config = {
		lua = { "string" }, -- it will not add pair on that treesitter node
		javascript = { "template_string" },
	},
})

require("nvim-treesitter.configs").setup({ autopairs = { enable = true } })

local ts_conds = require("nvim-autopairs.ts-conds")

-- press % => %% is only inside comment or string
autopairs.add_rules({
	Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({ "string", "comment" })),
	Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({ "function" })),
})
