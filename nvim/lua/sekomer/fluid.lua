--
-- just messing around in this file, don't use this shit!!!
--
local M = {}


function M.start_fluid_simulation()

    -- get current window height and width
    local current_width = vim.api.nvim_win_get_width(0)
    local current_height = vim.api.nvim_win_get_height(0)

    local width = current_width
    local height = current_height

    local lines = {}

    for h = 1, height do
        -- table.insert(lines, string.rep(' ', width))
        -- copy the lines from top of current buffer with index 0 to bottom
        table.insert(lines, vim.api.nvim_buf_get_lines(0, 0, -1, false)[h])
    end

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    local win = vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = width,
        height = height,
        row = 1,
        col = 1,
        focusable = false,
        style = 'minimal',
    })

    -- TODO: Implement fluid simulation logic here

    -- Close the window after some time or user interaction
    vim.defer_fn(function()
        vim.api.nvim_win_close(win, true)
    end, 2000)  -- Close the window after 5 seconds
end




M.start_fluid_simulation()

return M

