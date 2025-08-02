return {
	-- All Server Installation script
	{
		"mason-org/mason.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		build = ":MasonUpdate",
		opts_extend = { "ensure_installed" },
		opts = {
			ensure_installed = {
				"stylua",
				"lua-language-server",
				"shfmt",
			},
		},
		---@param opts MasonSettings | {ensure_installed: string[]}
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			mr:on("package:install:success", function()
				vim.defer_fn(function()
					-- trigger FileType event to possibly load this newly installed LSP server
					require("lazy.core.handler.event").trigger({
						event = "FileType",
						buf = vim.api.nvim_get_current_buf(),
					})
				end, 100)
			end)

			mr.refresh(function()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end)
		end,
	},

	-- Auto Formatter
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

	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	},

	{
		"saghen/blink.cmp",
		dependencies = { "L3MON4D3/LuaSnip" },
		version = "1.*",
		opts = {
			keymap = { preset = "default" },
			completion = {
				documentation = { auto_show = false },
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = { implementation = "lua" },
		},
		opts_extend = { "sources.default" },
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },

		-- example using `opts` for defining servers
		opts = {
			servers = {
				lua_ls = {},
			},
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig["lua-language-server"].setup({ capabilities = capabilities })
		end,
	},
}
