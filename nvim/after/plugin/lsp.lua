local lsp = require("lsp-zero")

lsp.preset("recommended")

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'tsserver',
        'eslint',
        'rust_analyzer',
        'lua_ls',
        'pylsp',
        'clangd',
        'gopls'
    },
    handlers = {
        lsp.default_setup,
    },
})


require'lspconfig'.lua_ls.setup{}

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

-- sekomer cmp setup
cmp.setup({
    sources = {
        { name = "nvim_lsp", group_index = 1 },
        -- { name = "copilot", group_index = 1 },
    },
    preselect = cmp.PreselectMode.None,
    mapping = cmp.mapping.preset.insert({
        ['<M-Esc>'] = cmp.mapping.complete(),
        ['<C-y>'] = cmp.mapping.confirm({select = true}),
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    }),
    completion = {
        keyword_length = 2,
    },
    -- experimental = {
    --     ghost_text = true,
    -- }
})
-- sekomer cmp setup

-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
-- local cmp_mappings = lsp.defaults.cmp_mappings({
--   ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--   ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--   ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--   ["<C-Space>"] = cmp.mapping.complete(),
-- })
-- 
-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil
-- 
-- lsp.setup_nvim_cmp({
--   mapping = cmp_mappings
-- })


lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false
    })
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

