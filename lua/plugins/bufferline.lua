return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- Required for file icons
  },
  config = function()
    -- Set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    require("bufferline").setup({
      options = {
        mode = "buffers",          -- "buffers" | "tabs"
        separator_style = "thick", -- "slant" | "slope" | "thick" | "thin"
        always_show_bufferline = false,
        show_buffer_close_icons = true,
        show_close_icon = true,
        color_icons = true,

        -- Integrates with LSP diagnostics to show indicators
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,

        -- Hides NvimTree or Neo-tree from the tabline area
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
          },
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
          },
        },
      },
      highlights = {
        fill = {
          bg = "NONE",
        },
        background = {
          bg = "NONE",
        },
        buffer_selected = {
          bg = "NONE",
          bold = true,
        },
        separator = {
          bg = "NONE",
        },
        separator_visible = {
          bg = "NONE",
        },
        separator_selected = {
          bg = "NONE",
        },
        offset_separator = {
          bg = "NONE",
        },
      },
    })
  end,
}
