return {
  -- Colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = false,
      terminal_colors = true,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.o.background = "dark"
      vim.cmd.colorscheme("tokyonight-night")
    end,
  },

  -- Git signs, used as the data source for the diff component
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "folke/tokyonight.nvim",
      "lewis6991/gitsigns.nvim",
    },
    event = "VeryLazy",
    config = function()
      local icon = function(code)
        return vim.fn.nr2char(code)
      end

      -- Palette taken directly from tokyonight
      local colors = require("tokyonight.colors").setup({ style = "night" })
      local bg = colors.bg_dark
      local fg = colors.fg

      -- Flat theme: every section and mode shares the same colors
      local section = { bg = bg, fg = fg }
      local theme = {}
      for _, mode in ipairs({ "normal", "insert", "visual", "replace", "command", "inactive" }) do
        theme[mode] = { a = section, b = section, c = section, x = section, y = section, z = section }
      end

      -- Diagnostic counter that turns colored only when the count is above zero
      local function diagnostic_component(severity, glyph, active_color)
        local function count()
          return #vim.diagnostic.get(0, { severity = severity })
        end
        return {
          function()
            return glyph .. " " .. count()
          end,
          color = function()
            if count() > 0 then
              return { fg = active_color, bg = bg }
            end
            return { fg = fg, bg = bg }
          end,
          padding = { left = 1, right = 1 },
        }
      end

      -- Spinner frames for the LSP progress indicator
      local spinner_frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }

      -- Shows the current LSP progress message with an animated spinner
      local function lsp_status()
        local status = vim.lsp.status()
        if status == nil or status == "" then
          return ""
        end
        local frame = math.floor(vim.uv.hrtime() / 1e8) % #spinner_frames + 1
        local text = status:gsub("^[^:]+:%s*", ""):gsub("%s*%(%d+%%%)", "")
        return spinner_frames[frame] .. " " .. text
      end

      -- Human readable filetype names
      local filetype_names = {
        typescriptreact = "TypeScript JSX",
        typescript = "TypeScript",
        javascriptreact = "JavaScript JSX",
        javascript = "JavaScript",
        lua = "Lua",
        json = "JSON",
        jsonc = "JSON with Comments",
        html = "HTML",
        css = "CSS",
        scss = "SCSS",
        markdown = "Markdown",
        python = "Python",
        go = "Go",
        rust = "Rust",
        c = "C",
        cpp = "C++",
        sh = "Shell Script",
        yaml = "YAML",
        toml = "TOML",
        vim = "Vim Script",
      }

      local function filetype()
        local ft = vim.bo.filetype
        if ft == "" then
          return "Plain Text"
        end
        return filetype_names[ft] or (ft:sub(1, 1):upper() .. ft:sub(2))
      end

      local function remote()
        return icon(0xeb3a)
      end

      local function position()
        local line = vim.fn.line(".")
        local col = vim.fn.virtcol(".")
        return string.format("Ln %d, Col %d", line, col)
      end

      local function spaces()
        local width = vim.bo.expandtab and vim.bo.shiftwidth or vim.bo.tabstop
        local label = vim.bo.expandtab and "Spaces" or "Tab Size"
        return string.format("%s: %d", label, width)
      end

      local function encoding()
        local enc = vim.bo.fileencoding
        if enc == "" then
          enc = vim.o.encoding
        end
        return enc:upper()
      end

      local function eol()
        local formats = { unix = "LF", dos = "CRLF", mac = "CR" }
        return formats[vim.bo.fileformat] or "LF"
      end

      local function bell()
        return icon(0xeaa2)
      end

      -- Feeds added/modified/removed line counts from gitsigns into the diff component
      local function diff_source()
        local dict = vim.b.gitsigns_status_dict
        if dict then
          return {
            added = dict.added,
            modified = dict.changed,
            removed = dict.removed,
          }
        end
      end

      require("lualine").setup({
        options = {
          theme = theme,
          icons_enabled = true,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          globalstatus = true,
          refresh = { statusline = 100 },
        },
        sections = {
          lualine_a = {
            { remote, padding = { left = 1, right = 2 } },
          },
          lualine_b = {
            -- Git branch
            {
              "branch",
              icon = { icon(0xe725), color = { fg = colors.purple, bg = bg } },
              color = { fg = fg, bg = bg },
              padding = { left = 1, right = 1 },
            },
            -- Git diff stats with the tokyonight git colors
            {
              "diff",
              source = diff_source,
              symbols = { added = "+", modified = "~", removed = "-" },
              diff_color = {
                added = { fg = colors.git.add, bg = bg },
                modified = { fg = colors.git.change, bg = bg },
                removed = { fg = colors.git.delete, bg = bg },
              },
              padding = { left = 1, right = 1 },
            },
            -- Errors turn red and warnings turn yellow when present
            diagnostic_component(vim.diagnostic.severity.ERROR, icon(0xea87), colors.red),
            diagnostic_component(vim.diagnostic.severity.WARN, icon(0xea6c), colors.yellow),
          },
          lualine_c = {
            {
              lsp_status,
              color = { fg = colors.blue, bg = bg },
              padding = { left = 1, right = 1 },
            },
          },
          lualine_x = {
            { position, padding = { left = 1, right = 1 } },
            { spaces,   padding = { left = 1, right = 1 } },
            { encoding, padding = { left = 1, right = 1 } },
            { eol,      padding = { left = 1, right = 1 } },
            { filetype, padding = { left = 1, right = 1 } },
          },
          lualine_y = {},
          lualine_z = {
            { bell, padding = { left = 1, right = 1 } },
          },
        },
        inactive_sections = {},
      })

      -- Redraw the statusline whenever LSP progress changes
      vim.api.nvim_create_autocmd("LspProgress", {
        callback = function()
          require("lualine").refresh({ place = { "statusline" } })
        end,
      })
    end,
  },
}
