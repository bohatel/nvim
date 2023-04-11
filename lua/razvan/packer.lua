-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  use({
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  })
  use({'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'})

  use({
	'nvim-treesitter/nvim-treesitter',
	run = function()
		local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		ts_update()
	end,
  })
  use('nvim-treesitter/playground')
  use("nvim-treesitter/nvim-treesitter-context");

--  use { 'EdenEast/nightfox.nvim' }
  use({
	'rose-pine/neovim',
	as = 'rose-pine',
	config = function()
		require("rose-pine").setup()
		vim.cmd('colorscheme rose-pine')
	end
  })

  use('ThePrimeagen/harpoon')
  use('mbbill/undotree')
  use("tpope/vim-fugitive")

  use({
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v1.x',
	requires = {
		-- LSP Support
		{'neovim/nvim-lspconfig'},             -- Required
		{'williamboman/mason.nvim'},           -- Optional
		{'williamboman/mason-lspconfig.nvim'}, -- Optional

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},         -- Required
		{'hrsh7th/cmp-nvim-lsp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp-signature-help'},
		{'hrsh7th/cmp-buffer'},       -- Optional
		{'hrsh7th/cmp-path'},         -- Optional
		{'saadparwaiz1/cmp_luasnip'}, -- Optional
		{'hrsh7th/cmp-nvim-lua'},     -- Optional

		-- Snippets
		{'L3MON4D3/LuaSnip'},             -- Required
		{'rafamadriz/friendly-snippets'}, -- Optional
	}
  })

  use("simrat39/rust-tools.nvim")

  use('lukas-reineke/indent-blankline.nvim')
  use('RRethy/vim-illuminate')
end)
