return {
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit" },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      -- Toggle LazyGit with <leader>gg
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Toggle LazyGit" },
    },
  },
}
