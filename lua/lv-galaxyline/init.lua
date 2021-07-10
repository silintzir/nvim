local gl = require("galaxyline")
-- get my theme in galaxyline repo
-- local colors = require('galaxyline.theme').default
-- bg = '#2E2E2E',
local colors = {
    bg = "#292D38",
    yellow = "#DCDCAA",
    dark_yellow = "#D7BA7D",
    cyan = "#4EC9B0",
    green = "#608B4E",
    light_green = "#B5CEA8",
    string_orange = "#CE9178",
    orange = "#FF8800",
    purple = "#C586C0",
    magenta = "#D16D9E",
    grey = "#858585",
    blue = "#569CD6",
    vivid_blue = "#4FC1FF",
    light_blue = "#9CDCFE",
    error_red = "#F44747",
    red = "#D16969",
    info_yellow = "#FFCC66"
}

local condition = require("galaxyline.condition")
local gls = gl.section
gl.short_line_list = {"NvimTree", "vista", "dbui", "packer"}

table.insert(
    gls.left,
    {
        ViMode = {
            provider = function()
                -- auto change color according the vim mode
                local mode_color = {
                    n = colors.blue,
                    i = colors.green,
                    v = colors.purple,
                    [""] = colors.purple,
                    V = colors.purple,
                    c = colors.magenta,
                    no = colors.blue,
                    s = colors.orange,
                    S = colors.orange,
                    [""] = colors.orange,
                    ic = colors.yellow,
                    R = colors.red,
                    Rv = colors.red,
                    cv = colors.blue,
                    ce = colors.blue,
                    r = colors.cyan,
                    rm = colors.cyan,
                    ["r?"] = colors.cyan,
                    ["!"] = colors.blue,
                    t = colors.blue
                }
                vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim.fn.mode()])
                return "▊ "
            end,
            highlight = {colors.red, colors.bg}
        }
    }
)

table.insert(
    gls.left,
    {
        FileSize = {provider = "FileSize", condition = condition.buffer_not_empty, highlight = {colors.fg, colors.bg}}
    }
)

table.insert(
    gls.left,
    {
        FileIcon = {
            provider = "FileIcon",
            condition = condition.buffer_not_empty,
            highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.bg}
        }
    }
)

table.insert(
    gls.left,
    {
        FileName = {
            provider = "FileName",
            condition = condition.buffer_not_empty,
            highlight = {colors.magenta, colors.bg, "bold"}
        }
    }
)

table.insert(
    gls.left,
    {
        LineInfo = {
            provider = "LineColumn",
            separator = " ",
            separator_highlight = {"NONE", colors.bg},
            highlight = {colors.fg, colors.bg}
        }
    }
)
table.insert(
    gls.left,
    {
        PerCent = {
            provider = "LinePercent",
            separator = " ",
            separator_highlight = {"NONE", colors.bg},
            highlight = {colors.fg, colors.bg, "bold"}
        }
    }
)

table.insert(
    gls.left,
    {DiagnosticError = {provider = "DiagnosticError", icon = "   ", highlight = {colors.red, colors.bg}}}
)

table.insert(
    gls.left,
    {DiagnosticWarn = {provider = "DiagnosticWarn", icon = "   ", highlight = {colors.yellow, colors.bg}}}
)

table.insert(
    gls.left,
    {DiagnosticHint = {provider = "DiagnosticHint", icon = "   ", highlight = {colors.cyan, colors.bg}}}
)

table.insert(
    gls.left,
    {DiagnosticInfo = {provider = "DiagnosticInfo", icon = "   ", highlight = {colors.blue, colors.bg}}}
)

table.insert(
    gls.mid,
    {
        TreesitterIcon = {
            provider = function()
                if next(vim.treesitter.highlighter.active) ~= nil then
                    return " "
                end
                return ""
            end,
            separator = " ",
            separator_highlight = {"NONE", colors.bg},
            highlight = {colors.green, colors.bg}
        }
    }
)

table.insert(
    gls.mid,
    {
        BufferType = {
            provider = "FileTypeName",
            condition = condition.hide_in_width,
            separator = " ",
            separator_highlight = {"NONE", colors.bg},
            highlight = {colors.green, colors.bg, "bold"}
        }
    }
)

table.insert(
    gls.mid,
    {
        ShowLspClient = {
            provider = "GetLspClient",
            condition = function()
                local tbl = {["dashboard"] = true, [" "] = true}
                if tbl[vim.bo.filetype] then
                    return false
                end
                return true
            end,
            separator = " ",
            separator_highlight = {"NONE", colors.bg},
            icon = "  ",
            highlight = {colors.blue, colors.bg}
        }
    }
)

table.insert(
    gls.mid,
    {
        FileEncode = {
            provider = "FileEncode",
            condition = condition.hide_in_width,
            separator = " ",
            separator_highlight = {"NONE", colors.bg},
            highlight = {colors.grey, colors.bg}
        }
    }
)

table.insert(
    gls.mid,
    {
        Tabstop = {
            provider = function()
                return "Spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth") .. " "
            end,
            condition = condition.hide_in_width,
            separator = " ",
            separator_highlight = {"NONE", colors.bg},
            highlight = {colors.grey, colors.bg}
        }
    }
)

table.insert(
    gls.right,
    {
        DiffAdd = {
            provider = "DiffAdd",
            condition = condition.hide_in_width,
            icon = "  ",
            highlight = {colors.green, colors.bg}
        }
    }
)
table.insert(
    gls.right,
    {
        DiffModified = {
            provider = "DiffModified",
            condition = condition.hide_in_width,
            icon = " 柳",
            highlight = {colors.blue, colors.bg}
        }
    }
)
table.insert(
    gls.right,
    {
        DiffRemove = {
            provider = "DiffRemove",
            condition = condition.hide_in_width,
            icon = "  ",
            highlight = {colors.red, colors.bg}
        }
    }
)
table.insert(
    gls.right,
    {
        GitIcon = {
            provider = function()
                return " "
            end,
            condition = condition.check_git_workspace,
            separator = " ",
            separator_highlight = {"NONE", colors.bg},
            highlight = {colors.orange, colors.bg}
        }
    }
)
table.insert(
    gls.right,
    {
        GitBranch = {
            provider = "GitBranch",
            condition = condition.check_git_workspace,
            separator = " ",
            separator_highlight = {"NONE", colors.bg},
            highlight = {colors.grey, colors.bg, "bold"}
        }
    }
)

table.insert(
    gls.short_line_left,
    {
        SFileName = {
            provider = "SFileName",
            condition = condition.buffer_not_empty,
            highlight = "StatusLineNC"
        }
    }
)
