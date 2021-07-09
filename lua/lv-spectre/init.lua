local M = {}

M.config = function()
    require('spectre').setup({
        color_devicons = true,
        line_sep_start = '┌-----------------------------------------',
        result_padding = '¦  ',
        line_sep = '└-----------------------------------------',
        is_insert_mode = true
    })
end

return M
