-- Equivalent settings in init.lua

vim.g.mapleader = " "
vim.o.nocompatible = true  -- disable compatibility to old-time vi
vim.o.showmatch = true     -- show matching 
vim.o.ignorecase = true    -- case insensitive 
vim.o.mouse = 'v'          -- middle-click paste with 
vim.o.hlsearch = true      -- highlight search 
vim.o.incsearch = true     -- incremental search
vim.o.tabstop = 4          -- number of columns occupied by a tab 
vim.o.softtabstop = 4      -- see multiple spaces as tabstops so <BS> does the right thing
vim.o.expandtab = true     -- converts tabs to white space
vim.o.shiftwidth = 4       -- width for autoindents
vim.o.autoindent = true    -- indent a new line the same amount as the line just typed
vim.wo.number = true       -- add line numbers
vim.wo.relativenumber = true -- add relative line numbers
vim.o.wildmode = 'longest,list' -- get bash-like tab completions
vim.cmd [[filetype plugin indent on]]  -- allow auto-indenting depending on file type
vim.cmd [[syntax on]]                 -- syntax highlighting
vim.o.mouse = 'a'                     -- enable mouse click
vim.o.clipboard = 'unnamedplus'       -- using system clipboard
vim.cmd [[filetype plugin on]]
vim.o.ttyfast = true                  -- Speed up scrolling in Vim
-- vim.o.spell = true                 -- enable spell check (may need to download language package)
-- vim.o.swapfile = false             -- disable creating swap file
-- vim.o.backupdir = '~/.cache/vim'   -- Directory to store backup files.

require("config.lazy")
