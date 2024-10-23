-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- swap cwd/root bindings
local lazyterm = function()
  LazyVim.terminal()
end
vim.keymap.set("n", "<c-/>", lazyterm, { desc = "Terminal (cwd)" })
vim.keymap.set("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })
