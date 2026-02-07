return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			lazy = true,
		},
		{
			"windwp/nvim-ts-autotag",
		},
	},
	version = false,
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})

		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = false,
			},
		})

		-- Lowering the LSP priority so treesitter has higher priority.
		vim.highlight.priorities.semantic_tokens = 95
	end,
}
