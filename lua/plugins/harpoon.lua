return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2", -- Use latest stable version
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      -- Import and initialize Harpoon
      local harpoon = require("harpoon")
      harpoon:setup()

      -- Key mappings
      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add() -- Add current file to Harpoon list
      end, { desc = "Add file to Harpoon" })

      vim.keymap.set("n", "<C-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list()) -- Open Harpoon menu
      end, { desc = "Open Harpoon menu" })

      -- Jump directly to files by position
      vim.keymap.set("n", "<leader>1", function()
        harpoon:list():select(1)
      end, { desc = "Go to Harpoon file 1" })
      vim.keymap.set("n", "<leader>2", function()
        harpoon:list():select(2)
      end, { desc = "Go to Harpoon file 2" })
      vim.keymap.set("n", "<leader>3", function()
        harpoon:list():select(3)
      end, { desc = "Go to Harpoon file 3" })
      vim.keymap.set("n", "<leader>4", function()
        harpoon:list():select(4)
      end, { desc = "Go to Harpoon file 4" })
    end,
  },
}
