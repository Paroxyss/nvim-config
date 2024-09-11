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

	'sainnhe/sonokai',
	'NLKNguyen/papercolor-theme',

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
		'phaazon/hop.nvim',
		event = "VeryLazy",
		commit = 'caaccee814afefa8cb5ba4cca4d1e22013c4b489',
		config = function()
			require('plugins.hop')
		end
	},

	{
		"L3MON4D3/LuaSnip",
		event = "VeryLazy",
		config = function()
			local ls = require("luasnip")
			ls.config.setup({ enable_autosnippets = true })
			require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath('config') .. "/LuaSnip/" })
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
		'Vonr/align.nvim',
		event = "VeryLazy",
		config = function()
			require("plugins.align")
		end
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

	{
		"lervag/vimtex",
		init = function()
			require('texmate').setup({})
			-- Use init for configuration, don't use the more common "config".
		end
	},
	"micangl/cmp-vimtex",

	"Paroxyss/texmate.nvim",
	{
		"David-Kunz/gen.nvim",
		opts = {
			model = "mistral", -- The default model to use.
			host = "localhost", -- The host running the Ollama service.
			port = "11434", -- The port on which the Ollama service is listening.
			display_mode = "float", -- The display mode. Can be "float" or "split".
			show_prompt = false, -- Shows the Prompt submitted to Ollama.
			show_model = false, -- Displays which model you are using at the beginning of your chat session.
			quit_map = "q", -- set keymap for quit
			no_auto_close = false, -- Never closes the window automatically.
			init = function(_) end,
			-- Function to initialize Ollama
			command = function(options)
				return "curl --silent --no-buffer -X POST http://" ..
					options.host .. ":" .. options.port .. "/api/chat -d $body"
			end,
			-- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
			-- This can also be a command string.
			-- The executed command must return a JSON object with { response, context }
			-- (context property is optional).
			-- list_models = '<omitted lua function>', -- Retrieves a list of model names
			debug = false -- Prints errors and the command which is run.
		}
	},
	{
		"Faywynnn/llama-copilot.nvim",
		init = function()
			require('llama-copilot').setup({
				host = "localhost",
				port = "11434",
				model = "codellama:13b-code"
			})
			-- Use init for configuration, don't use the more common "config".
		end
	}

})
