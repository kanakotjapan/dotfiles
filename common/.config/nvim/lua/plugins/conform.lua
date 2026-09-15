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
			format_on_save = function(bufnr)
				local path = vim.api.nvim_buf_get_name(bufnr)
				if vim.bo[bufnr].filetype == "markdown" and path:find("/Documents/Notes/", 1, true) then
					return
				end
				return {
					timeout_ms = 500,
					lsp_format = "fallback",
				}
			end,
		})
	end,
}
