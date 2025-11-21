-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "one_light",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

M.ui = {
  statusline = {
    modules = {
      file = function()
        local utils = require("nvchad.stl.utils")
        local buf, row, col = unpack(vim.fn.getcursorcharpos())

        local path = vim.fn.expand('%p')
        if (path == "") then path = "Empty" end
        -- return filename
        local x = utils.file()
        local name = " " .. path .. " "
        return "%#St_file# " .. x[1] .. name .. " " .. row .. ":" .. col .. "  %#St_file_sep#" .. ""
      end,
    }
  },
  cmp = {
    format_colors = {
      tailwind = true
    },
  },
  tabufline = {
    bufwidth = 26,
  },
}


return M
