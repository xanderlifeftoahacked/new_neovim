-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use ({'catppuccin/nvim',
  	as = 'catppuccin',
	config = function()
		 vim.cmd("colorscheme catppuccin-mocha")
		 vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#928374', bold=false })
		 vim.api.nvim_set_hl(0, 'LineNr', { fg='#8ec07c', bold=true })
		 vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#928374', bold=false })
	end
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use {
	'nvim-lualine/lualine.nvim',
	requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {"akinsho/toggleterm.nvim", tag = '*'}

  use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
  use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
  use 'romgrk/barbar.nvim'
  use {
	  'numToStr/Comment.nvim',
	  config = function()
		  require('Comment').setup({
		    opleader = {
			line = "<leader>/",
			block = 'gb',
		    }})
	  end
  }

  use {
	  "nvim-neo-tree/neo-tree.nvim",
	  branch = "v3.x",
	  requires = { 
		  "nvim-lua/plenary.nvim",
		  "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		  "MunifTanjim/nui.nvim",
		  -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	  }
  }

  use {"rhysd/vim-clang-format", 
			requires = {"kana/vim-operator-user"}
	}

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  use "m4xshen/autoclose.nvim"

  end)
