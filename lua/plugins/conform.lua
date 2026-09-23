return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      format_on_save = function(bufnr)
        -- Get the full path of the current buffer
        local bufname = vim.api.nvim_buf_get_name(bufnr)

        -- Disable auto-format specifically for dwl / suckless config files
        if bufname:match("config%.def%.h$") or bufname:match("config%.h$") then
          return
        end

        -- Return format options for all other files
        return { timeout_ms = 500, lsp_fallback = true }
      end,

      -- Your existing formatters configuration
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettier" },
        c = { "clang-format" },
      },
      -- Trigger auto-format whenever you save the file
    })
  end,
}
