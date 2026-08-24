return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require("snacks").setup({
      explorer = {
        enabled = true,
        replace_netrw = true,
      },
      indent = { enabled = true },
      input = { enabled = true },
      picker = {
        enabled = true,
        sources = {
          explorer = {
            hidden = true,
          }
        }
      },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    })
  end,
}
