--[[ idées
--
--]]
require('packer').startup(function(use)
	-- Packer can manage itself
	use 'lewis6991/impatient.nvim'
	use 'wbthomason/packer.nvim'
	use "nvim-lua/plenary.nvim"

	use "dstein64/vim-startuptime"

	use 'rcarriga/nvim-notify'

	use {
		'nvim-telescope/telescope.nvim',
		after = 'plenary.nvim',
		config = function()
			require('plugins.telescope')
		end
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('plugins.treesitter')
		end
	}


	use {
		'neovim/nvim-lspconfig',
		config = function()
			require('plugins.lsp')
		end
	}

	use {
		"williamboman/mason.nvim",
		after = "nvim-lspconfig",
		config = function()
			require('mason').setup()
		end
	}

	--completion for nvim plugins dev
	use "folke/neodev.nvim"

	use {
		"williamboman/mason-lspconfig.nvim",
		after = {
			"mason.nvim",
			"neodev.nvim"
		},
		config = function()
			require('plugins.lsp.masonlsp')
		end
	}

	--use {
	--    'projekt0n/github-nvim-theme',
	--    config = function()
	--        require('github-theme').setup({
	--            theme_style = "dimmed"
	--        })
	--    end
	--}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	use { 'echasnovski/mini.nvim', branch = 'stable' }

	use {
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup {}
		end
	}

	use {
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup({
				floating_window = false,
				hint_prefix = "",
				hint_scheme = "Comment",
			})
		end,
		requires = "neovim/nvim-lspconfig",
	}

	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use { 'hrsh7th/nvim-cmp',
		after = { 'cmp-nvim-lsp', 'cmp-buffer', 'cmp-path', 'cmp-cmdline' },
		config = function()
			require("plugins.cmp")
		end
	}

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons'
		},
		config = function()
			require('plugins.nvimtree')
		end
	}

	use {
		'phaazon/hop.nvim',
		commit = 'caaccee814afefa8cb5ba4cca4d1e22013c4b489',
		config = function()
			require('plugins.hop')
		end
	}

	use {
		"L3MON4D3/LuaSnip",
		config = function()
			local ls = require("luasnip")
			ls.config.setup({ enable_autosnippets = true })
			require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/LuaSnip/" })
		end
	}
	use { 'saadparwaiz1/cmp_luasnip' }

	use {
		'lervag/vimtex',
		ft = "tex"
	}

	--use 'github/copilot.vim'
	use {
		'TimUntersberger/neogit',
		requires = 'nvim-lua/plenary.nvim',
		config = function()
			require('plugins.neogit')
		end
	}

end)
