local masonlsp = require("mason-lspconfig")
local attach = require("utils.attach")
local configs = require('plugins.lsp.configs')
masonlsp.setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("neodev").setup({
  -- add any options here, or leave empty to use the default settings
})

local function setup_server(server_name)
	require("lspconfig")[server_name].setup(
		vim.tbl_extend('keep',
			configs.get(server_name),
			{
				on_attach = attach,
				capabilities = capabilities,
			}
		)
	)
end

masonlsp.setup_handlers { function(server_name)
	setup_server(server_name)
end }

function LoadAllAvailableLspConfigs()
	local availables = masonlsp.get_installed_servers()
	for _, server in ipairs(availables) do
		setup_server(server)
	end
end
