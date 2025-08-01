return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
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
    },
  },

  -- Status Line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
      theme = "tokyonight",
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts_extend = { "spec" },
    opts = {
      preset = "helix",
      defaults = {},
      spec = {
        {
          mode = { "n", "v" },
          { "<leader><tab>", group = "tabs" },
          { "<leader>c", group = "code" },
          { "<leader>d", group = "debug" },
          { "<leader>dp", group = "profiler" },
          { "<leader>f", group = "file/find" },
          { "<leader>g", group = "git" },
          { "<leader>gh", group = "hunks" },
          { "<leader>q", group = "quit/session" },
          { "<leader>s", group = "search" },
          { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
          { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
          { "[", group = "prev" },
          { "]", group = "next" },
          { "g", group = "goto" },
          { "gs", group = "surround" },
          { "z", group = "fold" },
          {
            "<leader>b",
            mode = { "n", "v" },
            group = "buffer",
            expand = function()
              return require("which-key.extras").expand.buf()
            end,
          },
        },
      },
    },
  },
}
