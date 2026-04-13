local config = require("yank-path.config")

local M = {}

--- Yank text to clipboard with optional notification
---@param text string The text to yank
---@param label string Description of what was yanked (for notification)
local function yank_to_clipboard(text, label)
	local opts = config.options
	vim.fn.setreg(opts.clipboard_register, text)

	if opts.notify then
		vim.notify(string.format("Yanked %s: %s", label, text), opts.notify_level)
	end
end

--- Yank the relative path of the current file
function M.yank_relative()
	local path = vim.fn.expand("%:.")
	yank_to_clipboard(path, "relative path")
end

--- Yank the full/absolute path of the current file
function M.yank_full()
	local path = vim.fn.expand("%:p")
	yank_to_clipboard(path, "full path")
end

--- Yank only the filename (no directory)
function M.yank_name()
	local path = vim.fn.expand("%:t")
	yank_to_clipboard(path, "filename")
end

--- Yank the directory path of the current file
function M.yank_dir()
	local path = vim.fn.expand("%:p:h")
	yank_to_clipboard(path, "directory")
end

--- Create user commands
function M.create_commands()
	vim.api.nvim_create_user_command("YPath", M.yank_relative, {
		desc = "Yank relative file path to clipboard",
	})

	vim.api.nvim_create_user_command("YPathFull", M.yank_full, {
		desc = "Yank full file path to clipboard",
	})

	vim.api.nvim_create_user_command("YPathName", M.yank_name, {
		desc = "Yank filename to clipboard",
	})

	vim.api.nvim_create_user_command("YPathDir", M.yank_dir, {
		desc = "Yank directory path to clipboard",
	})
end

--- Setup keymaps if enabled
function M.setup_keymaps()
	local opts = config.options

	if not opts.default_keymaps.enabled then
		return
	end

	local keymaps = opts.default_keymaps
	local map_opts = { noremap = true, silent = true }

	if keymaps.yank_path then
		vim.keymap.set(
			"n",
			keymaps.yank_path,
			M.yank_relative,
			vim.tbl_extend("force", map_opts, { desc = "Yank relative path" })
		)
	end

	if keymaps.yank_full then
		vim.keymap.set(
			"n",
			keymaps.yank_full,
			M.yank_full,
			vim.tbl_extend("force", map_opts, { desc = "Yank full path" })
		)
	end

	if keymaps.yank_name then
		vim.keymap.set(
			"n",
			keymaps.yank_name,
			M.yank_name,
			vim.tbl_extend("force", map_opts, { desc = "Yank filename" })
		)
	end

	if keymaps.yank_dir then
		vim.keymap.set(
			"n",
			keymaps.yank_dir,
			M.yank_dir,
			vim.tbl_extend("force", map_opts, { desc = "Yank directory" })
		)
	end
end

return M
