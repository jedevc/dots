return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      -- swap cwd/root bindings
      { "<leader><space>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
      { "<leader>/", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      mode = "topline",
    },
  },

  {
    "tpope/vim-sleuth",
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofmt" },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              analyses = {
                fieldalignment = false,
              },
            },
          },
        },
      },
    },
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  {
    "smjonas/live-command.nvim",
    config = function()
      require("live-command").setup({
        commands = {
          Norm = { cmd = "norm" },
          G = { cmd = "g" },
          D = { cmd = "d" },
        },
      })
    end,
  },

  {
    -- smarter gF
    "wsdjeg/vim-fetch",
  },

  {
    "folke/snacks.nvim",
    opts = {
      gitbrowse = {
        what = "permalink",
      },
    },
  },

  {
    -- disable snippets library
    "rafamadriz/friendly-snippets",
    enabled = false,
  },
}
