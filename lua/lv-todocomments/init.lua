local M = {}
local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then
	return
end

M.config = function()
	todo_comments.setup({
		highlight = {
			before = "fg", -- "fg" or "bg" or empty
			keyword = "fg", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
			after = "fg", -- "fg" or "bg" or empty
			pattern = [[.*<(KEYWORDS)\s*:]], -- pattern used for highlightng (vim regex)
			comments_only = true, -- uses treesitter to match keywords in comments only
			max_line_len = 400, -- ignore lines longer than this
			exclude = {}, -- list of file types to exclude highlighting
		},
	})
end

return M
