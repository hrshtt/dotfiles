-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local M = {}

M.general = {
    explorer = {
        toggle = '<leader>ee',
        focus = '<leader>e',
    },
    plugins = {
        update = '<leader>lu',
    },
}

-- Add the keybinding for manual plugin updates
vim.keymap.set("n", M.general.plugins.update, "<cmd>Lazy update<cr>", { desc = "Update plugins" })

return M
