-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- swap cwd/root bindings
vim.keymap.set("n", "<c-/>", function()
  Snacks.terminal()
end, { desc = "Terminal (cwd)" })
vim.keymap.set("n", "<c-_>", function()
  Snacks.terminal()
end, { desc = "which_key_ignore" })
