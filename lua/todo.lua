local M = {}

-- settings
M._done_symbol = "[X] "
M._todo_symbol = "[ ] "

-- setup
M.setup = function (opts)
	opts = opts or {}-- Ensure opts is a table if nil is passed

    if opts.done_symbol then
        M._done_symbol = opts.done_symbol
    end

    if opts.todo_symbol then
        M._todo_symbol = opts.todo_symbol
    end

	local new_item_key_map = '<leader>i'
	if opts.new_item_key_map then
		new_item_key_map = opts.new_item_key_map
	end

	local done_key_map = '<leader>x'
	if opts.done_key_map then
		done_key_map = opts.done_key_map
	end

	-- Setting up keymaps
	local map_opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap('n', new_item_key_map, ':lua require"todo".new_item()<CR>', map_opts)
	vim.api.nvim_set_keymap('n', done_key_map, ':lua require"todo".toggle_done()<CR>', map_opts)
end

-- add item 
M.new_item = function()
    local current_line = vim.api.nvim_get_current_line()

    if current_line:match("^%s*$") then  -- Check if the line is empty or just contains whitespace
		vim.api.nvim_command('normal! i' .. M._todo_symbol .. ' ')
        vim.api.nvim_command('startinsert')
    else
        vim.api.nvim_command('normal! o' .. M._todo_symbol .. ' ')
        vim.api.nvim_command('startinsert')
    end
end

-- toggle complete checkmark
M.toggle_done = function ()
	local current_line = vim.api.nvim_get_current_line()

    if current_line:find("^%s*" .. M._todo_symbol:escape()) then
		print("change to done")
        vim.api.nvim_set_current_line(M._done_symbol .. current_line:sub(#M._todo_symbol + 1))
    elseif current_line:find("^%s*" .. M._done_symbol:escape()) then
		print("change to todo")
        vim.api.nvim_set_current_line(M._todo_symbol .. current_line:sub(#M._done_symbol + 1))
    end
end

-- Helper function to escape Lua pattern special characters
local function escape_pattern(s)
    local magic_chars = { '%', '^', '$', '(', ')', '.', '[', ']', '*', '+', '-', '?' }
    for _, char in ipairs(magic_chars) do
        s = s:gsub('%' .. char, '%%' .. char)
    end
    return s
end

-- Attach the escape function to all string objects for easier use
string.escape = escape_pattern

return M