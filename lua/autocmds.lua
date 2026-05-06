require "nvchad.autocmds"

vim.api.nvim_create_autocmd(
  { "FileType" },
  {
    pattern = "clojure",
    command = "set iskeyword-=/",
  }
)
