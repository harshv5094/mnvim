return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" }, -- You can add other filetypes as needed
				},
				format_on_save = {
					lsp_fallback = true, -- fallback if no native LSP formatting
					timeout_ms = 1000,
				},
				-- Optional: log level for debugging
				log_level = vim.log.levels.WARN,
			})

			-- Optional keymap to format manually
			vim.keymap.set({ "n", "v" }, "<leader>cf", function()
				require("conform").format({
					async = true,
					lsp_fallback = true,
				})
			end, { desc = "Format file or range" })
		end,
	},
}
