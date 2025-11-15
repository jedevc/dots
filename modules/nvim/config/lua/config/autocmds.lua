-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

vim.filetype.add({
  extension = {
    hx = "haxe",
  },
})
vim.api.nvim_create_autocmd("User", {
  pattern = "TSUpdate",
  callback = function()
    require("nvim-treesitter.parsers").haxe = {
      install_info = {
        url = "https://github.com/vantreeseba/tree-sitter-haxe",
        queries = "queries",
      },
    }
  end,
})
