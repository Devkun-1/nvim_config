return {
  {
    "crnvl96/lazydocker.nvim",
    cmd = { "Lazydocker" },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      -- Toggle LazyDocker with <leader>kk
      { "<leader>dd", "<cmd>LazyDocker<cr>", desc = "Toggle LazyDocker" },
    },
  }
}
