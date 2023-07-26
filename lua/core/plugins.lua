require('packer').startup(function(use)
	-- Packer can manage itself
	use 'lewis6991/impatient.nvim'
	use 'wbthomason/packer.nvim'
	use "nvim-lua/plenary.nvim"

	use {
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
	}

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
	use 'nvim-treesitter/playground'

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
	use {
		"folke/neodev.nvim",
		--ft = "lua",
	}

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

	use 'sainnhe/sonokai'
	use 'NLKNguyen/papercolor-theme'

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function()
			require('lualine').setup()
		end
	}

	--use { 'echasnovski/mini.nvim', branch = 'stable' }

	use {
		"folke/which-key.nvim",
		config = function()
			 vim.o.timeoutlen = 2000
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
		--cmd = {"NvimTreeOpen", "NvimTreeToggle"},
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
			require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath('config') .. "/LuaSnip/" })
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

	-- >>> Tests
	use {
		'~/.config/nvim/localPlugins/texmate.nvim',
		after = "LuaSnip",
		config = function()
			require("plugins.texmate")
		end,
	}
	-- <<< Tests

	use { 'jdhao/better-escape.vim', event = 'InsertEnter' }

	use {
		'jbyuki/instant.nvim',
		--opt = true,
		cmd = { "InstantStartSingle", "InstantJoinSingle", "InstantStartSession", "InstantJoinSession" }
	}
	use {
		'Vonr/align.nvim',
		--opt = true,
		--event = "InsertEnter",
		config = function()
			require("plugins.align")
		end
	}

	use {
		'salkin-mada/openscad.nvim',
		config = function()
			require('openscad')
			-- load snippets, note requires
			vim.g.openscad_load_snippets = true
			vim.g.openscad_auto_open = true
		end,
		requires = 'L3MON4D3/LuaSnip'
	}

	use {
		'eandrju/cellular-automaton.nvim',
		config = function() require("plugins.cellAuto") end,
	}
end)
