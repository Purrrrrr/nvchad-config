require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>q", "<cmd>q<Cr>", { desc = "Custom: Close window" })
map("n", "<leader>w", "<cmd>w<Cr>", { desc = "Custom: Save file" })
map("n", "<leader>y", "+y", { desc = "Custom: Copy from system keyboard" })
map("n", "<leader>p", "+p", { desc = "Custom: Paste from system keyboard" })
map("n", "<leader>m", "<C-w>100+", { desc = "Custom: Make current window tall" })
-- map("n", "<leader>c", "<cmd>nohlsearch<CR>", { desc = "Custom: Clear search hilight" })
map("n", "<C-h>", function () WinMove("h") end, { desc = "Custom: Move window left" })
map("n", "<C-j>", function () WinMove("j") end, { desc = "Custom: Move window down" })
map("n", "<C-k>", function () WinMove("k") end, { desc = "Custom: Move window up" })
map("n", "<C-l>", function () WinMove("l") end, { desc = "Custom: Move window right" })
-- map("n", "<C-W>m", "<cmd>WinShift<CR>", { desc = "Custom: WinShift" })
-- map("n", "<C-W>S", "<cmd>WinShift swap<CR>", { desc = "Custom: WinShift Swap" })
map("n", "<leader>o", "<cmd> Telescope find_files <CR>", { desc = "Custom: Find files" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

function WinMove(key)
  local prevWin = vim.api.nvim_get_current_win()
  vim.cmd("wincmd " .. key)
  local curWin = vim.api.nvim_get_current_win()
  print(prevWin..", "..curWin)

  if (prevWin == curWin) then
    if key == "k" or key == "j" then
      vim.cmd("wincmd s")
    else
      vim.cmd("wincmd v")
    end
    vim.cmd("wincmd " .. key)
  end
end

map("n", "<F2>", 
  function()
    require("nvchad.lsp.renamer")()
  end,
  { desc = "LSP rename"}
)
map("n", "<leader>e", 
  function()
    vim.diagnostic.goto_next()
  end,
  { desc = "LSP Goto next"}
)
