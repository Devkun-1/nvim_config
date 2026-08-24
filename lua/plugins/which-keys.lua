return {
  "folke/which-key.nvim",
  lazy = false,
  config = function()
    local wk = require("which-key")

    -- Setup which-key with LazyVim-style options
    wk.setup({
      preset = "helix",                -- LazyVim uses the "modern" preset layout
      delay = function(ctx)
        return ctx.plugin and 0 or 200 -- show instantly for plugin-triggered popups
      end,
      filter = function(mapping)
        -- Exclude mappings with no description (matches LazyVim behavior)
        return mapping.desc and mapping.desc ~= ""
      end,
      spec = {
        -- Top-level group names (LazyVim's defaults)
        { "<leader>f", group = "find/file" },
        { "<leader>s", group = "search" },
        { "<leader>g", group = "git" },
        { "<leader>b", group = "buffer" },
        { "<leader>c", group = "code" },
        { "<leader>d", group = "debug" },
        { "<leader>w", group = "window" },
        { "<leader>x", group = "diagnostics/quickfix" },
        { "<leader>u", group = "ui/toggle" },
        { "<leader>q", group = "quit/session" },
        { "<leader>l", group = "lazy/plugins" },
        { "<leader>n", group = "noice/notifications" },
      },
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
        mappings = true, -- show icons next to keymaps (needs nvim-web-devicons)
      },
      win = {
        border = "rounded",
        padding = { 1, 2 },
      },
      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
      },
    })

    -- Register a few example keymaps under groups (adjust to your own setup)
    wk.add({
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>",   desc = "Recent Files" },
      { "<leader>sg", "<cmd>Telescope live_grep<cr>",  desc = "Grep Search" },
      { "<leader>gg", "<cmd>LazyGit<cr>",              desc = "LazyGit" },
      { "<leader>bd", "<cmd>bdelete<cr>",              desc = "Delete Buffer" },
      { "<leader>uw", "<cmd>set wrap!<cr>",            desc = "Toggle Wrap" },
      { "<leader>qq", "<cmd>qa<cr>",                   desc = "Quit All" },
    })

    -- Show which-key popup automatically when pressing <leader> (default behavior)
    vim.o.timeoutlen = 300 -- LazyVim's default timeout before popup shows
  end,
}
