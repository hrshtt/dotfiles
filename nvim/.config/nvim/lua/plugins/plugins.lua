local keymaps = require('../config/keymaps').general
vim.opt.termguicolors = true

return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				-- config
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{ "rcarriga/nvim-notify" },
	{
		"nvim-neo-tree/neo-tree.nvim",
		keys = {
			{ keymaps.explorer.toggle, "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
			{ keymaps.explorer.focus, "<cmd>Neotree focus<cr>", desc = "NeoTree" },
		},
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
          -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
		config = function()
			require("neo-tree").setup()
		end,
	},
    {  "nvim-treesitter/nvim-treesitter" },
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" }
    }
}
