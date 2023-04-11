local cmp = require 'cmp'
local luasnip = require("luasnip")

cmp.setup({

	--[[completion = {
      --autocomplete = false
    },]] --

	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-h>'] = cmp.mapping.scroll_docs(-6),
		['<C-l>'] = cmp.mapping.scroll_docs(6),
		-- useless ? ['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({
			select = true
		}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<Tab>"] = cmp.mapping(function(fallback)
			if luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),

		--choices
		["Ï"] = cmp.mapping(function(fallback)
			if luasnip.choice_active() then
				luasnip.change_choice(1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["È"] = cmp.mapping(function(fallback)
			if luasnip.choice_active() then
				luasnip.change_choice(-1)
			else
				fallback()
			end
		end, { "i", "s" })
	}),
	sources = cmp.config.sources({
		{ name = 'luasnip', max_item_count = 2 },
		--{ name = 'omni' },
		{ name = 'nvim_lsp', max_item_count = 5 },
	}, { {
		name = 'buffer'
	} })
})
