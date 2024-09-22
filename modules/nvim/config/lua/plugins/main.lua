return {
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.go" },
  { import = "lazyvim.plugins.extras.lang.python" },

  { import = "lazyvim.plugins.extras.test.core" },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!.git/",
        },
      },
    },
  },

  -- replaced by nvim-treesitter-context
  -- {
  --   "wellle/context.vim",
  -- },
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
}
