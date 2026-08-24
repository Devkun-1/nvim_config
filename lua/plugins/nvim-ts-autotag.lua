return {
	"windwp/nvim-ts-autotag",
	ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "vue", "svelte" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true, -- auto close tags
				enable_rename = true, -- auto rename the matching closing tag
				enable_close_on_slash = false,
			},
		})
	end,
}
