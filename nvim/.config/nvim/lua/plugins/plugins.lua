local keymaps = require('../config/keymaps').general
vim.opt.termguicolors = true

return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			vim.defer_fn(function()
				require("dashboard").setup({
					-- config
				})
			end, 0)
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{ "rcarriga/nvim-notify", event = "VeryLazy" },
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		keys = {
			{ keymaps.explorer.toggle, "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
			{ keymaps.explorer.focus, "<cmd>Neotree focus<cr>", desc = "NeoTree" },
		},
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons",
          "MunifTanjim/nui.nvim",
        },
		config = function()
			require("neo-tree").setup()
		end,
	},
    {  "nvim-treesitter/nvim-treesitter", event = "BufReadPost" },
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        keys = {
            { keymaps.search.find_files, "<cmd>Telescope find_files<cr>", desc = "Find files" },
            { keymaps.search.live_grep, "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
        },
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    -- LSP and Completion
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            -- LSP setup will go here
        end,
    },

    -- Treesitter (optimized configuration)
    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufReadPost",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua" }, -- Only install Lua parser by default
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },

    -- Git integration
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        config = function()
            require("gitsigns").setup()
        end,
    },

    -- Color Scheme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd[[colorscheme tokyonight]]
        end,
    },

    -- Status Line
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function()
            require("lualine").setup()
        end,
    },

    -- Jupyter Notebook Integration
    { "goerz/jupytext.vim", ft = "ipynb" },

    -- Existing Telescope configuration...
}
