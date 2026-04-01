return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
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

		require("nvim-treesitter").install({
			"bash",
			"c",
			"cpp",
			"gitcommit",
			"go",
			"graphql",
			"html",
			"java",
			"javascript",
			"json",
			"json5",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"regex",
			"rust",
			"scss",
			"toml",
			"tsx",
			"typescript",
			"vue",
			"vim",
			"vimdoc",
			"yaml",
		})

		-- Lowering the LSP priority so treesitter has higher priority.
		vim.highlight.priorities.semantic_tokens = 95
	end,
}
