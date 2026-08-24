return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- add any options here
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},

	config = function()
		require("noice").setup({
			cmdline = {
				enabled = true,
				view = "cmdline_popup",
				format = {
					cmdline = { pattern = "^:", icon = "", lang = "vim" },
					search_down = { kind = "search", pattern = "^/", icon = " 󰥗", lang = "regex" },
					search_up = { kind = "search", pattern = "^%?", icon = " 󰥗", lang = "regex" },
					filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
					lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
					help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖" },
					input = { view = "cmdline_input", icon = "󰥻 " },
				},
			},

			views = {
				cmdline_popup = {
					border = {
						style = "rounded",
						padding = { 0, 1 },
					},
					filter_options = {},
					win_options = {
						winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
					},
				},
			},

			notify = {
				enabled = true,
			},
		})
	end,
}
