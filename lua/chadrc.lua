---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "one_light",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
  statusline = {
    -- order = { "mode", "abc", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    modules = {
      file = function()
        local utils = require("nvchad.stl.utils")
        local path = vim.fn.expand('%p')
        if (path == "") then path = "Empty" end
        -- return filename
        local x = utils.file()
        local name = " " .. path .. " "
        return "%#St_file# " .. x[1] .. name .. "%#St_file_sep#" .. ""
      end,
    }
  }
}

return M
