local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Custom Utility function
local git_init = require("utils.git_init")

-- New tab
map("n", "te", ":tabedit<CR>")
map("n", "<tab>", ":tabnext<CR>", opts)
map("n", "<s-tab>", ":tabprev<CR>", opts)

-- Split window
map("n", "ss", ":split<CR>", opts)
map("n", "sv", ":vsplit<CR>", opts)

-- Move window
map("n", "sh", "<C-w>h")
map("n", "sk", "<C-w>k")
map("n", "sj", "<C-w>j")
map("n", "sl", "<C-w>l")

-- Resize window
map("n", "<C-h>", "<C-w><", opts)
map("n", "<C-l>", "<C-w>>", opts)
map("n", "<C-k>", "<C-w>+", opts)
map("n", "<C-j>", "<C-w>-", opts)

-- Git init current open file root dir
map("n", "<leader>gi", git_init, { desc = "Git init (root)" })

-- netrw Directory explore window
map("n", ";x", "<cmd>Explore<CR>", opts)

-- Automatic find and replace
map("n", "<localleader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "String auto replace" })

-- Adding executable permission to script
map("n", "<localleader>x", "<cmd>!chmod +x %<CR>", { desc = " Set Script To Executable", silent = true })

-- adding lazy extras keybind
map("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "lazy" })

-- lazygit
if vim.fn.executable("lazygit") == 1 then
	map("n", "<leader>gg", function()
		Snacks.lazygit()
	end, { desc = "Lazygit (cwd)" })
end

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
