return {
  {
    "ibhagwan/fzf-lua",
    opts = {
      fzf_opts = { ["--cycle"] = true },
    },
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

  {
    "pwntester/octo.nvim",
    opts = {
      use_local_fs = true,
    },
  },

  {
    "zbirenbaum/copilot.lua",
    opts = {
      filetypes = {
        ["dap-repl"] = false,
        ["dapui_watches"] = false,
        ["dapui_hover"] = false,
        ["dapui_scopes"] = false,
        ["dapui_console"] = false,
        sh = function()
          if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
            -- disable for .env files
            return false
          end
          return true
        end,
      },
    },
  },

  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>gx", group = "+conflicts" },
      },
    },
  },
  {
    "akinsho/git-conflict.nvim",
    lazy = false,
    opts = {
      default_mappings = false,
      default_commands = false,
      disable_diagnostics = true,
    },
    keys = {
      {
        "<leader>gxx",
        function()
          local fzfLua = require("fzf-lua")
          fzfLua.grep({
            winopts = {
              title = "Git Conflicts",
            },
            prompt = fzfLua.defaults.grep.input_prompt,
            search = "^<<<<<<<(.*?$).*?^>>>>>>>*(.*?$)",
            no_esc = true,
            rg_opts = "--multiline --multiline-dotall --replace='<$1 >$2' " .. fzfLua.defaults.grep.rg_opts,
          })
        end,
        desc = "List conflicts",
      },
      {
        "<leader>gxo",
        function()
          return require("git-conflict").choose("ours")
        end,
        desc = "Choose ours (git-conflict)",
      },
      {
        "<leader>gxt",
        function()
          return require("git-conflict").choose("theirs")
        end,
        desc = "Choose theirs (git-conflict)",
      },
      {
        "<leader>gxb",
        function()
          return require("git-conflict").choose("both")
        end,
        desc = "Choose both (git-conflict)",
      },
      {
        "<leader>gxn",
        function()
          return require("git-conflict").choose("none")
        end,
        desc = "Choose none (git-conflict)",
      },
      {
        "]x",
        function()
          return require("git-conflict").find_next("ours")
        end,
        desc = "Next conflict (git-conflict)",
      },
      {
        "[x",
        function()
          return require("git-conflict").find_prev("ours")
        end,
        desc = "Previous conflict (git-conflict)",
      },
    },
  },
}
