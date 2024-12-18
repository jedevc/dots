return {
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.go" },
  { import = "lazyvim.plugins.extras.lang.python" },
  { import = "lazyvim.plugins.extras.lang.rust" },
  { import = "lazyvim.plugins.extras.lang.markdown" },

  { import = "lazyvim.plugins.extras.test.core" },

  { import = "lazyvim.plugins.extras.editor.mini-files" },

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
    "tpope/vim-fugitive",
    cmd = { "Git", "GBrowse" },
    dependencies = { "tpope/vim-rhubarb" },
    keys = {
      { "<leader>gB", "<cmd>GBrowse<cr>", mode = { "n" }, desc = "Browse repo" },
      { "<leader>gB", "<Esc><cmd>'<,'>GBrowse<cr>", mode = { "v" }, desc = "Browse repo" },
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
}
