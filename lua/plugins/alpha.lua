return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional: adds file icons
  config = function()
    -- Use the default 'dashboard' theme layout
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Configure your custom ASCII art header
    dashboard.section.header.val = {
      "                       ",
      " ▄         ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄               ▄  ▄▄▄▄▄▄▄▄▄▄▄          ▄▄▄▄      ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄       ▄▄▄▄▄▄▄▄▄▄▄ ",
      "▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░▌             ▐░▌▐░░░░░░░░░░░▌       ▄█░░░░▌    ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌     ▐░░░░░░░░░░░▌",
      "▐░▌       ▐░▌▐░█▀▀▀▀▀▀▀█░▌ ▐░▌           ▐░▌ ▐░█▀▀▀▀▀▀▀▀▀       ▐░░▌▐░░▌     ▀▀▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀▀▀      ▐░█▀▀▀▀▀▀▀▀▀ ",
      "▐░▌       ▐░▌▐░▌       ▐░▌  ▐░▌         ▐░▌  ▐░▌                 ▀▀ ▐░░▌              ▐░▌▐░█▄▄▄▄▄▄▄▄▄      ▐░▌          ",
      "▐░▌   ▄   ▐░▌▐░█▄▄▄▄▄▄▄█░▌   ▐░▌       ▐░▌   ▐░█▄▄▄▄▄▄▄▄▄           ▐░░▌              ▐░▌▐░░░░░░░░░░░▌     ▐░█▄▄▄▄▄▄▄▄▄ ",
      "▐░▌  ▐░▌  ▐░▌▐░░░░░░░░░░░▌    ▐░▌     ▐░▌    ▐░░░░░░░░░░░▌          ▐░░▌     ▄▄▄▄▄▄▄▄▄█░▌ ▀▀▀▀▀▀▀▀▀█░▌     ▐░░░░░░░░░░░▌",
      "▐░▌ ▐░▌░▌ ▐░▌▐░█▀▀▀▀▀▀▀█░▌     ▐░▌   ▐░▌     ▐░█▀▀▀▀▀▀▀▀▀           ▐░░▌    ▐░░░░░░░░░░░▌          ▐░▌      ▀▀▀▀▀▀▀▀▀█░▌",
      "▐░▌▐░▌ ▐░▌▐░▌▐░▌       ▐░▌      ▐░▌ ▐░▌      ▐░▌                    ▐░░▌    ▐░█▀▀▀▀▀▀▀▀▀           ▐░▌               ▐░▌",
      "▐░▌░▌   ▐░▐░▌▐░▌       ▐░▌       ▐░▐░▌       ▐░█▄▄▄▄▄▄▄▄▄       ▄▄▄▄█░░█▄▄▄ ▐░█▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄█░▌      ▄▄▄▄▄▄▄▄▄█░▌",
      "▐░░▌     ▐░░▌▐░▌       ▐░▌        ▐░▌        ▐░░░░░░░░░░░▌     ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌     ▐░░░░░░░░░░░▌",
      " ▀▀       ▀▀  ▀         ▀          ▀          ▀▀▀▀▀▀▀▀▀▀▀       ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀       ▀▀▀▀▀▀▀▀▀▀▀ ",
    }

    -- Set menu items (Change shortcuts and actions as needed)
    dashboard.section.buttons.val = {
      -- 	dashboard.button("f", "  Find File", ":Telescope find_files <CR>"),
      -- 	dashboard.button("n", "  New File", ":ene <BAR> startinsert <CR>"),
      -- 	dashboard.button("r", "  Recent Files", ":Telescope oldfiles <CR>"),
      -- 	dashboard.button("g", "  Find Text", ":Telescope live_grep <CR>"),
      -- 	dashboard.button("c", "  Config", ":e ~/.config/nvim/init.lua <CR>"),
      -- 	dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    -- Set a footer message
    dashboard.section.footer.val = {}

    dashboard.config.layout = {
      { type = "padding", val = math.floor(vim.fn.winheight(0) / 2) - 6 },
      dashboard.section.header,
    }

    -- Apply the configuration
    alpha.setup(dashboard.config)
  end,
}
