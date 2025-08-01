return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
    },
    keys = {      
    -- git
    { "<leader>gb", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },

    -- Toggle Terminal
    { "<leader>t", function() Snacks.terminal() end, desc = "Toggle Terminal" },
    },
  }
}
