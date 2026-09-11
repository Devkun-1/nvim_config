-- ~/.config/nvim/lua/plugins/oil.lua
return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false, -- oil needs to load early to hijack netrw

  opts = {
    default_file_explorer = true,

    view_options = {
      show_hidden = true,
    },

    -- Columns shown in the file list (icon, permissions, size, modified time)
    columns = {
      "icon",
      "permissions",
      "size",
      "mtime",
    },

    -- Floating window appearance
    float = {
      padding = 2,
      max_width = 120, -- wider to fit both list + preview side by side
      max_height = 30,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
    },

    -- Preview pane on the right side, auto-updates as cursor moves
    preview_win = {
      update_on_cursor_moved = true,
      preview_method = "fast_scratch",
      disable_preview = function(_)
        return false
      end,
    },

    keymaps = {
      ["<C-p>"] = "actions.preview", -- toggle preview pane
      ["q"] = "actions.close",
    },
  },

  config = function(_, opts)
    require("oil").setup(opts)

    -- Open oil as floating window
    vim.keymap.set("n", "-", function()
      require("oil").open_float()
    end, { desc = "Open parent directory (oil, floating)" })
  end,
}
