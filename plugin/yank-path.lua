-- Auto-load plugin and create commands
-- This file is automatically sourced by Neovim when the plugin is loaded

if vim.fn.has("nvim-0.7.0") == 0 then
	vim.api.nvim_err_writeln("yank-path.nvim requires Neovim >= 0.7.0")
	return
end

-- Prevent loading the plugin twice
if vim.g.loaded_yank_path then
	return
end
vim.g.loaded_yank_path = 1

-- Setup with defaults (users can call setup() again with custom config)
require("yank-path").setup()
