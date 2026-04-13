# yank-path.nvim

A simple and efficient Neovim plugin for yanking file paths to your clipboard.

## Features

- **Multiple path variants**: Yank relative paths, full paths, filenames, or directory paths
- **Vim commands**: `:YPath`, `:YPathFull`, `:YPathName`, `:YPathDir`
- **Lua API**: Call functions directly from Lua
- **Configurable keymaps**: Optional default keymaps or define your own
- **Customizable**: Configure clipboard register, notifications, and more
- **Lightweight**: No dependencies, pure Lua implementation

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "kluzny/yank-path.nvim",
  version = "0.1.0",  -- Pin to specific version for stability
  lazy = false,  -- Load immediately on startup
  config = function()
    require("yank-path").setup({
      -- Optional: enable default keymaps
      default_keymaps = {
        enabled = true,
        yank_path = "<leader>yp",  -- Yank relative path
        yank_full = "<leader>yP",  -- Yank full path
        yank_name = "<leader>yn",  -- Yank filename
        yank_dir = "<leader>yd",   -- Yank directory
      }
    })
  end,
}
```

**Note**: You can omit `version = "0.1.0"` to always use the latest version from the main branch.

#### Local Development

To use a local version of the plugin during development:

```lua
{
  dir = "~/Development/yank-path.nvim",
  lazy = false,  -- Load immediately on startup
  config = function()
    require("yank-path").setup({
      default_keymaps = {
        enabled = true,
        yank_path = "<leader>yp",
        yank_full = "<leader>yP",
        yank_name = "<leader>yn",
        yank_dir = "<leader>yd",
      }
    })
  end,
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "kluzny/yank-path.nvim",
  config = function()
    require("yank-path").setup()
  end
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'kluzny/yank-path.nvim'
```

Then in your `init.lua`:
```lua
require("yank-path").setup()
```

## Usage

### Commands

The plugin provides four commands:

- `:YPath` - Yank relative path (e.g., `lua/config.lua`)
- `:YPathFull` - Yank full/absolute path (e.g., `/Users/you/project/lua/config.lua`)
- `:YPathName` - Yank filename only (e.g., `config.lua`)
- `:YPathDir` - Yank directory path (e.g., `/Users/you/project/lua`)

### Lua API

You can call the functions directly from Lua:

```lua
require("yank-path").yank_relative()
require("yank-path").yank_full()
require("yank-path").yank_name()
require("yank-path").yank_dir()
```

This is useful for creating custom keymaps or integrations.

## Configuration

### Default Configuration

```lua
require("yank-path").setup({
  -- Clipboard register ('+' for system clipboard, '*' for selection)
  clipboard_register = "+",

  -- Show notification after yanking
  notify = true,

  -- Notification log level
  notify_level = vim.log.levels.INFO,

  -- Default keymaps configuration
  default_keymaps = {
    enabled = false,           -- Set to true to enable default keymaps
    yank_path = "<leader>yp",  -- Yank relative path
    yank_full = "<leader>yP",  -- Yank full path
    yank_name = "<leader>yn",  -- Yank filename
    yank_dir = "<leader>yd",   -- Yank directory
  },
})
```

### Custom Keymaps

If you prefer to define your own keymaps:

```lua
-- Disable default keymaps
require("yank-path").setup({
  default_keymaps = {
    enabled = false,
  }
})

-- Define custom keymaps
vim.keymap.set("n", "<C-y>p", require("yank-path").yank_relative, { desc = "Yank relative path" })
vim.keymap.set("n", "<C-y>f", require("yank-path").yank_full, { desc = "Yank full path" })
vim.keymap.set("n", "<C-y>n", require("yank-path").yank_name, { desc = "Yank filename" })
vim.keymap.set("n", "<C-y>d", require("yank-path").yank_dir, { desc = "Yank directory" })
```

### Disable Notifications

```lua
require("yank-path").setup({
  notify = false,
})
```

### Use Selection Clipboard

```lua
require("yank-path").setup({
  clipboard_register = "*",  -- Use selection clipboard instead of system
})
```

## Examples

### With Default Keymaps Enabled

```lua
require("yank-path").setup({
  default_keymaps = {
    enabled = true,
  }
})
```

Now you can use:
- `<leader>yp` - Yank relative path
- `<leader>yP` - Yank full path
- `<leader>yn` - Yank filename
- `<leader>yd` - Yank directory

### Minimal Setup

```lua
require("yank-path").setup()
```

This gives you the commands (`:YPath`, etc.) without any keymaps.

## Requirements

- Neovim >= 0.7.0

## License

This is free and unencumbered software released into the public domain. See [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
