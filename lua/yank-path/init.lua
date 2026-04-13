local config = require("yank-path.config")
local commands = require("yank-path.commands")

local M = {}

--- Setup the plugin
---@param opts table|nil User configuration options
function M.setup(opts)
	-- Setup configuration
	config.setup(opts)

	-- Create user commands
	commands.create_commands()

	-- Setup keymaps if enabled
	commands.setup_keymaps()
end

-- Export command functions for direct Lua API usage
M.yank_relative = commands.yank_relative
M.yank_full = commands.yank_full
M.yank_name = commands.yank_name
M.yank_dir = commands.yank_dir

return M
