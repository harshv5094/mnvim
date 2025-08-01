return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts ={
			style = "moon",
			light_style = "day",
			transparent = true,
			terminal_colors = true,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
			},
			lualine_bold = true,
			-- For better performance
			cache = true,
			on_highlights = function(hl)
				local fgcolor = "#636da6"
				local bgcolor = "none"
				local colors = require("tokyonight.colors").setup()
				hl.MsgArea = { fg = colors.fg_float }
				hl.LineNrAbove = { fg = fgcolor, bg = bgcolor }
				hl.LineNrBelow = { fg = fgcolor, bg = bgcolor }
				hl.Comment = { fg = fgcolor, bg = bgcolor }
				hl.TreesitterContextLineNumber = { fg = fgcolor, bg = bgcolor }
			end,
    }
	},

  -- Status Line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = "VeryLazy",
    opts = {
      theme = 'tokyonight'
    }
  },

  -- Which Keys Like Emacs
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "helix"
    },
   keys = {
     {
       "<leader>b", 
       group = "buffers",
        expand = function()
          return require("which-key.extras").expand.buf()
        end
     },
     {
        ";n",
        group = "Ease of Access",
        expand = function()
          return require("which-key.extras").expand.buf()
        end
    }
  },
  }
}
