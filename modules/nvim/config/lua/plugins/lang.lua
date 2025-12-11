return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "haxe", -- installed in autocmds.lua
        "templ",
      },
    },
  },

  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "haxe-language-server", -- configured below
        "templ",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        haxe_language_server = {
          cmd = { "haxe-language-server" },
          filetypes = { "haxe" },
          root_markers = { ".hxml", ".git", "Project.xml" },
          before_init = function(params, config)
            local hxmls = vim.fs.find(function(name, path)
              -- only consider .hxml files
              if not name:match("%.hxml$") then
                return false
              end
              -- ignore hidden directories
              for dir in path:gmatch("[^/]+") do
                if dir:sub(1, 1) == "." then
                  return false
                end
              end
              return true
            end, { path = config.root_dir, type = "file" })
            local hxml = hxmls[1]
            if hxml then
              params.initializationOptions = params.initializationOptions or {}
              params.initializationOptions.displayArguments = { hxml }
            end
          end,
          settings = {
            haxe = {
              buildCompletionCache = true,
            },
          },
        },
      },
    },
  },
}
