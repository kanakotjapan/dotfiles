local function fix_all(client, bufnr)
	client:request_sync("workspace/executeCommand", {
		command = "eslint.applyAllFixes",
		arguments = {
			{
				uri = vim.uri_from_bufnr(bufnr),
				version = vim.lsp.util.buf_versions[bufnr],
			},
		},
	}, nil, bufnr)
end

local fix_on_save_group = vim.api.nvim_create_augroup("eslint_fix_on_save", { clear = false })

return {
	cmd = { "vscode-eslint-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
		"html",
		"markdown",
		"json",
		"jsonc",
		"yaml",
		"toml",
		"xml",
		"gql",
		"graphql",
		"astro",
		"css",
		"less",
		"scss",
		"pcss",
		"postcss",
	},
	root_markers = { ".eslintrc", ".eslintrc.js", ".eslintrc.json", "eslint.config.js", "eslint.config.mjs" },
	on_attach = function(client, bufnr)
		vim.api.nvim_buf_create_user_command(bufnr, "LspEslintFixAll", function()
			fix_all(client, bufnr)
		end, { desc = "Fix all ESLint problems", force = true })

		vim.api.nvim_clear_autocmds({ group = fix_on_save_group, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = fix_on_save_group,
			buffer = bufnr,
			desc = "Apply ESLint fixes before saving",
			callback = function()
				if not client:is_stopped() then
					fix_all(client, bufnr)
				end
			end,
		})
	end,
	settings = {
		codeAction = {
			disableRuleComment = {
				enable = true,
				location = "separateLine",
			},
			showDocumentation = {
				enable = true,
			},
		},
		codeActionOnSave = {
			enable = false,
			mode = "all",
		},
		experimental = {},
		format = true,
		nodePath = "",
		onIgnoredFiles = "off",
		problems = {
			shortenToSingleLine = false,
		},
		quiet = false,
		rulesCustomizations = {},
		run = "onType",
		useESLintClass = false,
		validate = "on",
		workingDirectory = {
			mode = "auto",
		},
	},
	before_init = function(_, config)
		if config.root_dir then
			config.settings = config.settings or {}
			config.settings.workspaceFolder = {
				uri = vim.uri_from_fname(config.root_dir),
				name = vim.fn.fnamemodify(config.root_dir, ":t"),
			}
		end
	end,
	handlers = {
		["eslint/confirmESLintExecution"] = function()
			return 4
		end,
		["eslint/probeFailed"] = function()
			vim.notify("ESLint probe failed", vim.log.levels.WARN)
			return {}
		end,
		["eslint/noLibrary"] = function()
			vim.notify("Unable to find the project's ESLint library", vim.log.levels.WARN)
			return {}
		end,
	},
}
