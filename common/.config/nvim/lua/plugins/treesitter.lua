return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	dependencies = {
		-- {
		-- 	"JoosepAlviste/nvim-ts-context-commentstring",
		-- 	lazy = true,
		-- },
		{
			"windwp/nvim-ts-autotag",
		},
	},
	config = function()
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = false,
			},
		})

		-- Lowering the LSP priority so treesitter has higher priority.
		vim.highlight.priorities.semantic_tokens = 95
	end,
}
