return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt" },
				markdown = { "prettierd" },
				html = { "prettierd" },
				go = { "gofmt" },
				vue = { "prettierd" },
				typescript = { "prettierd" },
				javascript = { "prettierd" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
}
