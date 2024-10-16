local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		'sainnhe/sonokai',
		config = function()
			require("plugins.theme")
		end,
		dependencies = {
			'NLKNguyen/papercolor-theme',
		}
	},

	"nvim-lua/plenary.nvim",

	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
	},

	--"github/copilot.vim",

	{
		'stevearc/dressing.nvim',
		opts = {},
	},
	'rcarriga/nvim-notify',

	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim', "which-key.nvim" },
		config = function()
			require("plugins.telescope")
		end,
	},

	{
		'nvim-treesitter/nvim-treesitter',
		build = ":TSUpdate",
		config = function()
			require('plugins.treesitter')
		end
	},

	{
		'neovim/nvim-lspconfig',
		config = function()
			require('plugins.lsp')
		end
	},

	{
		"williamboman/mason.nvim",
		after = "nvim-lspconfig",
		config = function()
			require('mason').setup()
		end
	},

	--completion for nvim plugins dev
	{
		"folke/neodev.nvim",
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"mason.nvim",
			"neodev.nvim"
		},
		config = function()
			require('plugins.lsp.masonlsp')
		end
	},


	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function()
			require('lualine').setup({})
		end
	},

	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeoutlen = 2000
			require("which-key").setup {}
		end
	},

	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup({
				floating_window = false,
				hint_prefix = "",
				hint_scheme = "Comment",
			})
		end,
		dependencies = { "neovim/nvim-lspconfig" },
	},

	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	{
		'hrsh7th/nvim-cmp',
		dependencies = { 'cmp-nvim-lsp', 'cmp-buffer', 'cmp-path', 'cmp-cmdline' },
		config = function()
			require("plugins.cmp")
		end
	},

	{
		'nvim-tree/nvim-tree.lua',
		event = "VeryLazy",
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		},
		config = function()
			require('plugins.nvimtree')
		end
	},

	{
		"ggandor/leap.nvim",
		enabled = true,
		-- keys = {
		-- 	{ "s",  mode = { "n", "x", "o" }, desc = "Leap Forward to" },
		-- 	{ "S",  mode = { "n", "x", "o" }, desc = "Leap Backward to" },
		-- 	{ "gs", mode = { "n", "x", "o" }, desc = "Leap from Windows" },
		-- },
		config = function(_, opts)
			local leap = require("leap")
			for k, v in pairs(opts) do
				leap.opts[k] = v
			end
			leap.add_default_mappings(true)
			leap.opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }
			vim.keymap.del({ "x", "o" }, "x")
			vim.keymap.del({ "x", "o" }, "X")
		end,
	},

	{
		"L3MON4D3/LuaSnip",
		event = "VeryLazy",
		config = function()
			local ls = require("luasnip")
			ls.config.setup({ enable_autosnippets = true })
			require("luasnip.loaders.from_lua").load({ paths = { vim.fn.stdpath('config') .. "/LuaSnip/" } })
		end
	},

	{ 'saadparwaiz1/cmp_luasnip' },

	{
		'lervag/vimtex',
		ft = "tex"
	},

	{
		'TimUntersberger/neogit',
		dependencies = { 'nvim-lua/plenary.nvim' },
		event = "VeryLazy",
		config = function()
			require('plugins.neogit')
		end
	},

	{ 'jdhao/better-escape.vim', event = 'InsertEnter' },

	{
		'jbyuki/instant.nvim',
		cmd = { "InstantStartSingle", "InstantJoinSingle", "InstantStartSession", "InstantJoinSession" }
	},

	{
		'salkin-mada/openscad.nvim',
		config = function()
			require('openscad')
			-- load snippets, note requires
			vim.g.openscad_load_snippets = true
			vim.g.openscad_auto_open = true
		end,
		dependencies = { 'L3MON4D3/LuaSnip' }
	},

	{
		'eandrju/cellular-automaton.nvim',
		event = "VeryLazy",
		config = function() require("plugins.cellAuto") end,
	},
	'xiyaowong/transparent.nvim',

	--[[{
		"lervag/vimtex",
		init = function()
			require('texmate').setup({})
			-- Use init for configuration, don't use the more common "config".
		end
	},]] --

	"micangl/cmp-vimtex",

	{ "Paroxyss/texmate.nvim", ft = { "tex" }, lazy = true },

	{
		"anurag3301/nvim-platformio.lua",
		dependencies = {
			{ "akinsho/nvim-toggleterm.lua" },
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
	},

	{
		"izeau/iterm.nvim",
		version = false,
		config = function()
			require("iterm").setup(false)
		end
	},

	{
		'jim-fx/sudoku.nvim',
		cmd = "Sudoku",
		config = function()
			--require("sudoku").setup()
		end
	},

	{ "rktjmp/playtime.nvim" },
	{
		'echasnovski/mini.nvim',
		version = '*',
		config = function()
			require("plugins.mini")
		end
	},
})
