-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- rose-pine theme
	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function() end,
	})

	-- themes
	use("savq/melange-nvim")
	use("rebelot/kanagawa.nvim")
	use("NLKNguyen/papercolor-theme")
	use("morhetz/gruvbox")

	-- copilot

	use("github/copilot.vim")

	vim.keymap.set("i", "<C-J>", 'copilot#Accept("<CR>")', {
		expr = true,
		replace_keycodes = false,
	})
    vim.keymap.set('i', '<C-]>', '<Plug>(copilot-next)')

	vim.g.copilot_no_tab_map = true

	-- use({
	-- 	"zbirenbaum/copilot.lua",
	-- 	cmd = "Copilot",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require("copilot").setup({
	-- 			suggestion = {
	-- 				enabled = true,
	-- 				auto_trigger = true,
	-- 			},
	-- 			panel = { enabled = false },
	-- 		})
	-- 	end,
	-- })

	-- use {
	--     "zbirenbaum/copilot-cmp",
	--     after = { "copilot.lua" },
	--     config = function ()
	--         require("copilot_cmp").setup({
	--             event = { "InsertEnter", "LspAttach" },
	--             fix_pairs = true,
	--         })
	--     end
	-- }

	-- formatter
	use("mhartington/formatter.nvim")

	-- lsp kind
	use("onsails/lspkind.nvim")

	-- -- copilot
	-- use {
	--     "zbirenbaum/copilot.lua",
	--     cmd = "Copilot",
	--     event = "InsertEnter",
	--     config = function()
	--         require("copilot").setup({
	--             suggestion = { enabled = true, auto_trigger = true },
	--             panel = { enabled = false },
	--         })
	--     end,
	-- }

	-- use {
	--     "zbirenbaum/copilot-cmp",
	--     after = { "copilot.lua" },
	--     config = function ()
	--         require("copilot_cmp").setup({
	--             event = { "InsertEnter", "LspAttach" },
	--             fix_pairs = true,
	--         })
	--     end
	-- }

	-- treesitter
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-treesitter/playground")

	-- harpoon
	use("theprimeagen/harpoon")

	use("mbbill/undotree")
	use("tpope/vim-fugitive")

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	})
end)
