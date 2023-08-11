local lsp = require("lsp-zero").preset({})

--lsp setup

lsp.preset("recommended")

lsp.on_attach(function(bufnr)
	lsp.default_keymaps({buffer = bufnr})
end)

--Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end


--packer stuff
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
	--packer
	use 'wbthomason/packer.nvim'

	-- file icons
	use('lewis6991/gitsigns.nvim') -- OPTIONAL: for git status
	use('nvim-tree/nvim-web-devicons') -- OPTIONAL: for file icons       

	-- fuzzy finder
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',

		requires = { {'nvim-lua/plenary.nvim'} }
	}

	--mason
	use {
		"williamboman/mason.nvim",
		run = ":MasonUpdate" -- :MasonUpdate updates registry contents
	}

	use {"catppuccin/nvim", as = "catppuccin"}

	require("catppuccin").setup({
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		transparent_background = true;
	})

	-- setup must be called before loading
	vim.cmd.colorscheme "catppuccin"


	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	-- autocompletion
	use{"hrsh7th/nvim-cmp"}

	--impatient
	use 'lewis6991/impatient.nvim'

	--dashboard
	use {
		'goolord/alpha-nvim',
		requires = { 'nvim-tree/nvim-web-devicons' },
		config = function ()
			require'alpha'.setup(require'alpha.themes.startify'.config)
		end
	}


	--lsp	
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
			'williamboman/mason.nvim',
			run = function()
				pcall(vim.cmd, 'MasonUpdate')
			end,
		},
		{'williamboman/mason-lspconfig.nvim'}, 

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},     -- Required
		{'hrsh7th/cmp-nvim-lsp'}, -- Required
		{'L3MON4D3/LuaSnip'},     -- Required
	}
}
end)


