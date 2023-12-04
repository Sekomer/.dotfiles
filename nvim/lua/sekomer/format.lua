local prettier = { exe = 'prettier', args = { '--stdin-filepath', '' }, stdin = true }

local function set_prettier_filepath()
    prettier.args[2] = vim.api.nvim_buf_get_name(0)
    return prettier
end

local black = { exe = 'black', args = {'-'}, stdin = true }
local gofmt = { exe = 'gofmt', args = {}, stdin = true }
local rustfmt = { exe = 'rustfmt', args = {'--emit=stdout'}, stdin = true }
local clang_format = { exe = 'clang-format', args = {}, stdin = true }
local stylua = { exe = 'stylua', args = {'--indent-width', '2', '-'}, stdin = true }



require('formatter').setup({
    filetype = {
        javascript = { set_prettier_filepath },
        typescript = { set_prettier_filepath },
        python = { black },
        go = { gofmt },
        rust = { rustfmt },
        c = { clang_format },
        lua = { stylua },
        -- Add more filetypes and corresponding formatters as needed
    }
})

-- leader f/F to format/format-write
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>Format<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>F", "<cmd>FormatWrite<CR>", { noremap = true, silent = true })


