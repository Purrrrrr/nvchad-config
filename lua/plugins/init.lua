return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre' -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      local ret = require "nvchad.configs.nvimtree"
      ret.actions = {
        open_file = {
          window_picker = {
            picker = function ()
              return require('window-picker').pick_window()
            end
          }
        }
      }

      return ret
    end,
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
    lazy = false,
  },
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
      require'window-picker'.setup({
        hint = 'floating-big-letter',
      })
    end,
  },
  {
    "tpope/vim-eunuch",
    lazy = false,
  },
  {
    "ntpeters/vim-better-whitespace";
    config = function()
      vim.g.better_whitespace_enabled = 1
      vim.g.strip_whitespace_on_save = 1
      vim.g.strip_whitespace_confirm = 0
    end,
  },
  {
    "dominikduda/vim_current_word",
    lazy = false,
    config = function()
      vim.g["vim_current_word#highlight_current_word"] = 0
    end,
  },
  {
    "tpope/vim-surround",
    lazy = false,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
  			"html-lsp", "css-lsp", "eslint-lsp",
        "typescript-language-server",
  		},
  	},
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
        "html", "css", "javascript", "typescript",
        "tsx",
        "markdown",
        "markdown_inline",
  		},
  	},
  },

  {
    "wavded/vim-stylus",
    lazy = false,
  },
}
