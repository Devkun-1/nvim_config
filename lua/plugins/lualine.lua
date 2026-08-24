local icons = require("config.icons") --icons
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    return {
      options = {
        -- "auto" pulls colors from the active colorscheme instead of a fixed palette,
        -- so the statusline background always matches your current theme
        theme = "auto",
        icons_enabled = true,
        component_separators = "", -- VSCode uses a flat style, no arrow separators
        section_separators = "",
        globalstatus = true,   -- single status bar for all windows, like VSCode
        disabled_filetypes = {
          statusline = { "dashboard", "alpha", "snacks_dashboard" },
          winbar = { "dashboard", "alpha", "snacks_dashboard" },
        },
      },

      sections = {
        -- Left side: branch, git diff, diagnostics, filename
        lualine_a = {
          {
            "branch",
            icon = {
              icons.File,
              color = {
                fg = "#F14E32",
              },
            }, -- git branch icon, shows e.g. " main" / " master"
          },
        },
        lualine_b = {
          {
            "diff",
            symbols = {
              added = icons.Git.Added,
              modified = icons.Git.Modified,
              removed = icons.Git.Modified,
            },
          },
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = {
              error = icons.Diagnostics.Error,
              warn = icons.Diagnostics.Warn,
              info = icons.Diagnostics.Info,
              hint = icons.Diagnostics.Hint,
            },
            -- colored = true (default) gives red for errors, yellow for warnings, etc.
          },
        },
        lualine_c = {
          {
            -- file type icon (colored per language) shown right before the filename
            function()
              local filename = vim.fn.expand("%:t")
              if filename == "" then
                return ""
              end
              local devicons_ok, devicons = pcall(require, "nvim-web-devicons")
              if not devicons_ok then
                return ""
              end
              local icon = devicons.get_icon(filename, vim.fn.expand("%:e"), { default = true })
              return icon or ""
            end,
            color = function()
              local devicons_ok, devicons = pcall(require, "nvim-web-devicons")
              if not devicons_ok then
                return nil
              end
              local filename = vim.fn.expand("%:t")
              local _, icon_color =
                  devicons.get_icon_color(filename, vim.fn.expand("%:e"), { default = true })
              return { fg = icon_color }
            end,
            padding = { left = 1, right = 0 },
          },
          { "filename", path = 1, padding = { left = 1, right = 1 } }, -- relative path, similar to VSCode's tab label
        },

        -- Right side: filetype, line/col, encoding, line ending
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn" },
            symbols = { error = " ", warn = " " },
            -- colored = true (default) so errors show red and warnings show yellow
          },
        },
        lualine_y = {
          { "filetype",   icon_only = false, colored = false }, -- e.g. "Lua"
          { "encoding",   colored = false },             -- e.g. "utf-8"
          { "fileformat", colored = false },             -- e.g. "unix" (LF)
        },
        lualine_z = {
          {
            -- VSCode-style "Ln X, Col Y" indicator
            function()
              local line = vim.fn.line(".")
              local col = vim.fn.col(".")
              return string.format("Ln %d, Col %d", line, col)
            end,
          },
        },
      },

      -- Status line shown on inactive windows
      inactive_sections = {
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "location" },
      },

      extensions = { "nvim-tree", "lazy", "fugitive" },
    }
  end,
}
