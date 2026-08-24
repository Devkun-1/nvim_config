local keymap = vim.keymap.set

--- oil
-- keymap("n", "<leader>e", "<cmd>Oil<cr>")

keymap("n", "<leader>e", function() Snacks.picker.explorer() end, { desc = "File Explorer" })

-- split window
keymap("n", "sv", "<cmd> vsplit <cr>")
keymap("n", "ss", "<cmd> split <cr>")

-- Navigate to previous/next buffer
keymap("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Cycle to previous buffer" })
keymap("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Cycle to next buffer" })

-- neotree
keymap("n", "<leader>no", "<cmd> Neotree toggle right<cr>")

-- move window
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- vcoolor
keymap("n", "<leader>vc", "<cmd> VCoolor <cr>")

--- Lazy
keymap("n", "<leader>l", "<cmd> Lazy <cr>")

--- resize window using
keymap("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- toggle terminal
keymap("n", "<leader>ft", "<cmd> ToggleTerm terminal <cr>", { desc = "Toggle Terminal" })

-- 	telescope.diagnostics({ bufnr = 0 })
