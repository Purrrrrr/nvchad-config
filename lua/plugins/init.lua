return {
  {
    "AndrewRadev/splitjoin.vim",
    lazy = false,
    -- keys = {
    --   { "gS", "<cmd>SplitjoinSplit<cr>", desc = "Split" },
    --   { "gJ", "<cmd>SplitjoinJoin<cr>", desc = "Join" },
    -- }
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "github/copilot.vim",
    lazy = false,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    cmd = { "CopilotChat" },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
    },
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
      ret.view.relativenumber = true
      ret.view.cursorline = true
      ret.view.width = {
        max = 100
      }
      ret.renderer.symlink_destination = false

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
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "html-lsp", "css-lsp", "eslint-lsp",
        "typescript-language-server",
      },
    },
  },

  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = {
  --     ensure_installed = {
  --       "vim", "lua", "vimdoc",
  --       "html", "css", "javascript", "typescript",
  --       "tsx",
  --       "markdown",
  --       "markdown_inline",
  --     },
  --     conceal = {
  --       enable = false,
  --     },
  --   },
  -- },
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  --   lazy = false,
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css", "tsx", "javascript", "typescript",
  -- 		},
  --     conceal = {
  --       enable = false,
  --     },
  -- 	},
  -- },

  {
    "wavded/vim-stylus",
    lazy = false,
  },
}
