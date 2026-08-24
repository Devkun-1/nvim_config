return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettier" },
      },
      -- Trigger auto-format whenever you save the file
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback", -- Use LSP if no dedicated formatter is found
      },
    })
  end,
}
