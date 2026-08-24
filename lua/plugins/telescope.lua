return {
  {
    "nvim-telescope/telescope.nvim",
    -- Load lazily only when these commands are used, for faster startup
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        -- fzf-native: compiles a C extension for much faster fuzzy matching
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",              -- requires 'make' and a C compiler (gcc/clang)
      },
      "nvim-tree/nvim-web-devicons", -- optional: file icons
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>",          desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",           desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",             desc = "Find Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",           desc = "Help Tags" },
      -- Diagnostics (errors/warnings) search
      { "<leader>fd", "<cmd>Telescope diagnostics<cr>",         desc = "Find Diagnostics (Errors)" },
      { "<leader>fD", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Diagnostics (Current Buffer)" },
      { "<leader>fc", "<cmd> Telescope colorscheme <cr> ",      desc = "Find Colorscheme" }
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          -- Use ripgrep as the search engine (fast, must be installed on system)
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",       -- include hidden files
            "--glob=!.git/*", -- but exclude .git directory
          },
          prompt_prefix = "🔍 ",
          selection_caret = "➤ ",
          path_display = { "truncate" },
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = { prompt_position = "top", preview_width = 0.55 },
          },
          file_ignore_patterns = { "node_modules", ".git/", "dist/", "build/" },
          mappings = {
            -- i = {
            -- 	["<C-j>"] = actions.move_selection_next,
            -- 	["<C-k>"] = actions.move_selection_previous,
            -- 	["<esc>"] = actions.close, -- close with single Esc in insert mode
            -- },

            -- Mappings while in Normal mode (press <Esc> once to enter Normal mode first)
            n = {
              ["j"] = actions.move_selection_next,     -- move down
              ["k"] = actions.move_selection_previous, -- move up
              ["q"] = actions.close,                   -- quick close
              ["<C-c>"] = actions.close,
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true, -- show hidden files too
          },
          diagnostics = {
            -- theme = "dropdown", -- compact bottom-panel style, good for error lists
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true, -- use fzf sorter for generic picker
            override_file_sorter = true,    -- use fzf sorter for file picker
            case_mode = "smart_case",
          },
        },
      })

      -- Load fzf-native extension after setup
      telescope.load_extension("fzf")
    end,
  },
}
