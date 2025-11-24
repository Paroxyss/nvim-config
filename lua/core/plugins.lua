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
	{
		"rktjmp/lush.nvim",
		-- if you wish to use your own colorscheme:
		-- { dir = '/absolute/path/to/colorscheme', lazy = true },
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
		version = "^1.0.0",
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
		version = "^1.0.0",
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

	"micangl/cmp-vimtex",

	{
		"Paroxyss/texmate.nvim",
		ft = { "tex" },
		lazy = true,
		config = function() require("plugins.texmate") end,
	},

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
			require("iterm").setup({
				auto_reset = false,
			})
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

	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", 'gomod' },
		build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
	},

	{
		"deponian/nvim-base64",
		version = "*",
		keys = {
			-- Decode/encode selected sequence from/to base64
			-- (mnemonic: [b]ase64)
			{ "gb", "<Plug>(FromBase64)", mode = "v" },
			{ "gB", "<Plug>(ToBase64)",   mode = "v" },
		},
		config = function()
			require("nvim-base64").setup()
		end,
	},

	-- syntax highlighting for kitty config files
	{
		"fladson/vim-kitty",
		ft = "kitty",
	},

	{
		"Civitasv/cmake-tools.nvim",
		ft = { "c", "cpp" },
		dependencies = { "stevearc/overseer.nvim" },
		config = function()
			require("plugins.cmake-tools")
		end,
	},
	{ -- The task runner we use
		"stevearc/overseer.nvim",
		commit = "400e762648b70397d0d315e5acaf0ff3597f2d8b",
		cmd = { "MakeitOpen", "MakeitToggleResults", "MakeitRedo" },
		opts = {
			task_list = {
				direction = "bottom",
				min_height = 25,
				max_height = 25,
				default_detail = 1
			},
		},
	},
	{
		'mfussenegger/nvim-dap'
	},
	{
		"julianolf/nvim-dap-lldb",
		dependencies = { "mfussenegger/nvim-dap" },
	},
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },

	{
		"nat-418/boole.nvim",
		config = function()
			require('boole').setup({
				mappings = {
					increment = '<C-a>',
					decrement = '<C-x>'
				},
				-- User defined loops
				additions = {},
				allow_caps_additions = {
					{ 'enable', 'disable' }
					-- enable → disable
					-- Enable → Disable
					-- ENABLE → DISABLE
				}
			})
		end,
	},

	{
		'sahaj-b/brainrot.nvim',
		event = 'VeryLazy',
		opts = {
			disable_phonk = false, -- skip phonk/overlay on "no errors"
			phonk_time = 2.5, -- seconds the phonk/image overlay stays
			min_error_duration = 0.5, -- minimum seconds errors must exist before phonk triggers (0 = instant)
			block_input = false, -- block input during phonk/overlay
			dim_level = 60,  -- phonk overlay darkness 0..100

			sound_enabled = true, -- enable sounds
			image_enabled = true, -- enable images (needs image.nvim)

			boom_volume = 50, -- volume for vine boom sound (0..100)
			phonk_volume = 50, -- volume for phonk sound (0..100)

			boom_sound = nil, -- custom boom sound path (e.g., "~/sounds/boom.ogg")
			phonk_dir = nil, -- custom phonk folder path (e.g., "~/sounds/phonks")
			image_dir = nil, -- custom image folder path (e.g., "~/memes/images")

			lsp_wide = false,
		}
	},

	{
		"3rd/image.nvim",
		build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
		opts = {
			processor = "magick_cli",
		},
		config = function()
			require("image").setup()
		end,
	}
})
