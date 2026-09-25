return {
	"shivambaku/fire-and-forget.nvim",
	config = function()
		require("faf").setup({
			model = "openai/gpt-5.6-sol#high",
		})
	end,
}
