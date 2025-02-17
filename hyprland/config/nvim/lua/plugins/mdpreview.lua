return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
			vim.g.mkdp_theme = "dark"
		end,
		ft = { "markdown" },
		keys = {
			{
				"<leader>cp",
				ft = "markdown",
				"<cmd>MarkdownPreviewToggle<cr>",
				desc = "Markdown Preview",
			},
		},
		config = function()
			vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
			vim.cmd([[
      function! OpenMarkdownPreview(url)
        execute "silent ! firefox --new-window " . a:url
      endfunction
      do FileType
    ]])
		end,
	},
}
