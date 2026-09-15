-- https://github.com/MeanderingProgrammer/render-markdown.nvim/wiki
return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("render-markdown").setup({
			file_types = { "markdown" },
			anti_conceal = {
				ignore = {
					link = true,
				},
			},
			pipe_table = {
				cell = "trimmed",
			},
			html = {
				tag = {
					br = { icon = " / ", highlight = "RenderMarkdownTableRow" },
				},
			},
			win_options = {
				concealcursor = { default = "", rendered = "nvic" },
				wrap = { default = false, rendered = false },
			},
			sign = {
				enabled = false,
			},
			heading = {
				icons = { "", "", "", "", "", "" },
				position = "inline",
				backgrounds = {},
			},
			link = {
				image = "",
				email = "",
				hyperlink = "",
				custom = {
					web = { icon = "" },
					youtube = { icon = "" },
				},
			},
		})
		vim.keymap.set("n", "<leader>m", require("render-markdown").toggle, {
			desc = "Toggle Markdown rendering",
		})
	end,
}
