return {
	"saghen/blink.cmp",
	version = "1.*",
	event = { "InsertEnter", "CmdlineEnter" },
	config = function()
		require("blink.cmp").setup({
			keymap = { preset = "super-tab" },
			sources = {
				default = { "lsp", "buffer", "snippets", "path" },
			},
			fuzzy = { implementation = "rust" },
		})
	end,
}
