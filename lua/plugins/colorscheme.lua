return {
  --- catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      style = "mocha"
    }
  },

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false
    },
  },

  -- solarized-osaka
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = function()
      return {
        transparent = true
      }
    end,
    -- config = function()
    --
    -- 	-- require("solarized-osaka").setup({
    -- 	-- 	transparent = true,
    -- 	-- 	terminal_colors = true,
    -- 	-- 	styles = {
    -- 	-- 		-- Style to be applied to different syntax groups
    -- 	-- 		-- Value is any valid attr-list value for `:help nvim_set_hl`
    -- 	-- 		comments = { italic = true },
    -- 	-- 		keywords = { italic = false },
    -- 	-- 		functions = {},
    -- 	-- 		variables = {},
    -- 	-- 		-- Background styles. Can be "dark", "transparent" or "normal"
    -- 	-- 		sidebars = "dark", -- style for sidebars, see below
    -- 	-- 		floats = "dark", -- style for floating windows
    -- 	-- 	},
    -- 	-- 	sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows
    -- 	-- 	day_brightness = 0.3,
    -- 	-- 	hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
    -- 	-- 	dim_inactive = false, -- dims inactive windows
    -- 	-- 	lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
    -- 	-- 	on_highlights = function(hl, c)
    -- 	-- 		local prompt = "#2d3149"
    -- 	-- 		hl.TelescopeNormal = {
    -- 	-- 			bg = c.bg_dark,
    -- 	-- 			fg = c.fg_dark,
    -- 	-- 		}
    -- 	-- 		hl.TelescopeBorder = {
    -- 	-- 			bg = c.bg_dark,
    -- 	-- 			fg = c.bg_dark,
    -- 	-- 		}
    -- 	-- 		hl.TelescopePromptNormal = {
    -- 	-- 			bg = c.bg_dark,
    -- 	-- 		}
    -- 	-- 		hl.TelescopePromptBorder = {
    -- 	-- 			bg = c.bg_dark,
    -- 	-- 			fg = c.bg_dark,
    -- 	-- 		}
    -- 	-- 		hl.TelescopePromptTitle = {
    -- 	-- 			bg = prompt,
    -- 	-- 			fg = "#2C94DD",
    -- 	-- 		}
    -- 	-- 		hl.TelescopePreviewTitle = {
    -- 	-- 			bg = c.bg_dark,
    -- 	-- 			fg = c.bg_dark,
    -- 	-- 		}
    -- 	-- 		hl.TelescopeResultsTitle = {
    -- 	-- 			bg = c.bg_dark,
    -- 	-- 			fg = c.bg_dark,
    -- 	-- 		}
    -- 	-- 	end,
    -- 	})
    -- end,
  },

  -- night Mare
  {
    "CantoroMC/nvim-nightmare",
  },

  -- ansi
  {
    'stevedylandev/ansi-nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
    end,
  },

  -- zenbones
  {
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    -- you can set set configuration options here
    -- config = function()
    --     vim.g.zenbones_darken_comments = 45
    --     vim.cmd.colorscheme('zenbones')
    -- end
  },

  -- zen.nvim
  {
    "nendix/zen.nvim",
    lazy = false,
    priority = 1000,
  },

  -- ondarker
  {
    'AlphaTechnolog/onedarker.nvim'
  }
}
