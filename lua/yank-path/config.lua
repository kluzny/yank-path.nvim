local M = {}

--- Default configuration options
M.defaults = {
	-- Clipboard register to use ('+' for system clipboard, '*' for selection)
	clipboard_register = "+",

	-- Show notification after yanking
	notify = true,

	-- Notification log level
	notify_level = vim.log.levels.INFO,

	-- Enable default keymaps
	default_keymaps = {
		enabled = false,
		yank_path = "<leader>yp", -- Yank relative path
		yank_full = "<leader>yP", -- Yank full path
		yank_name = "<leader>yn", -- Yank filename
		yank_dir = "<leader>yd", -- Yank directory
	},
}

--- Current configuration (merged defaults + user config)
M.options = {}

--- Setup configuration
---@param opts table|nil User configuration options
function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", M.defaults, opts or {})
end

return M
