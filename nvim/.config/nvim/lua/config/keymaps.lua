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
        install = '<leader>li',
        status = '<leader>ls', -- New keymap for plugin status
        show = '<leader>lz',   -- New keymap to show Lazy UI
    },
    -- New productivity shortcuts
    buffer = {
        next = '<leader>bn',
        prev = '<leader>bp',
        close = '<leader>bd',
    },
    window = {
        split_vertical = '<leader>sv',
        split_horizontal = '<leader>sh',
        close = '<leader>wc',
    },
    search = {
        clear_highlight = '<leader>nh',
        find_files = '<leader>ff',
        live_grep = '<leader>fg',
    },
    code = {
        format = '<leader>cf',
    },
}

-- Add the keybinding for manual plugin updates
vim.keymap.set("n", M.general.plugins.update, "<cmd>Lazy update<cr>", { desc = "Update plugins" })

-- Add the keybinding for plugin installation
vim.keymap.set("n", M.general.plugins.install, function()
    vim.cmd("Lazy install")
end, { desc = "Install plugins" })

-- Add the keybinding for plugin status check
vim.keymap.set("n", M.general.plugins.status, function()
    vim.cmd("Lazy check")
end, { desc = "Check plugin status" })

-- Add the keybinding to show Lazy UI
vim.keymap.set("n", M.general.plugins.show, function()
    vim.cmd("Lazy")
end, { desc = "Show Lazy UI" })

-- Add new keybindings
vim.keymap.set("n", M.general.buffer.next, ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", M.general.buffer.prev, ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", M.general.buffer.close, ":bdelete<CR>", { desc = "Close buffer" })

vim.keymap.set("n", M.general.window.split_vertical, ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", M.general.window.split_horizontal, ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", M.general.window.close, ":close<CR>", { desc = "Close window" })

vim.keymap.set("n", M.general.search.clear_highlight, ":nohl<CR>", { desc = "Clear search highlight" })
vim.keymap.set("n", M.general.search.find_files, ":Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", M.general.search.live_grep, ":Telescope live_grep<CR>", { desc = "Live grep" })

vim.keymap.set("n", M.general.code.format, ":lua vim.lsp.buf.format()<CR>", { desc = "Format code" })

return M
