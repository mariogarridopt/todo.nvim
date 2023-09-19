<h1 align="center">
  todo.nvim
</h1>

<p align="center">A <i>simple</i> 🥸 to-do list plugin for Neovim built using <b>lua</b>.</p>

![Demo GIF](https://github.com/mariogarridopt/todo.nvim/assets/1191102/caf8e152-fdf2-42bb-b514-130baf5d4fbd)

### Usage

Use the key mappings:

- `<leader>i` - Inset new item;
- `<leader>x` - Toggle item status;


### Configure

The to-do plugin needs to be initialized using:

```lua
require('todo').setup {}
```

However, you can pass in some config options, the defaults are:

```lua
require('todo').setup {
    -- Symbols used
    done_symbol = "[X] ",
    todo_symbol = "[ ] ",
    -- keymaps used in normal mode to operate the plugin
    new_item_key_map = "<leader>i",
    done_key_map = "<leader>x"
}
```

## Installation

Install just as you would a normal plugin, here are some options:

### Built-in package manager

```bash
mkdir -p ~/.local/share/nvim/site/pack/plugins/start
cd ~/.local/share/nvim/site/pack/plugins/start
git clone https://github.com/mariogarridopt/todo.nvim
```

### Via a plugin manager

Using [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use "mariogarridopt/todo.nvim"
require('todo').setup()
```
