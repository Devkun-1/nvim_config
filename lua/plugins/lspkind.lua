local icons = require("config.icons")
return {
  {
    "onsails/lspkind.nvim",
    config = function()
      require("lspkind").setup({
        preset = "default",
        mode = "symbol_text",
        maxwidth = 50,
        symbol_map = icons.lspkind,
      })
    end,
  },
}
