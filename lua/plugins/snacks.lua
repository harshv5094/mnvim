return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bufdelete = { enabled = true },
			explorer = { enabled = true },
			statuscolumn = { enabled = true },
		},
		keys = {
			-- File explorer
			{
				"<leader>e",
				function()
					Snacks.explorer()
				end,
				desc = "File Explorer",
			},

			-- git
			{
				"<leader>gb",
				function()
					Snacks.gitbrowse()
				end,
				desc = "Git Browse",
				mode = { "n", "v" },
			},

			-- Toggle Terminal
			{
				"<leader>ct",
				function()
					Snacks.terminal()
				end,
				desc = "Toggle Terminal",
			},

			-- Delete Buffer
			{
				"<leader>bd",
				function()
					Snacks.bufdelete()
				end,
				desc = "Delete Buffer",
			},
		},
	},
}
