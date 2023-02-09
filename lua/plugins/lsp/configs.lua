local M = {}
local configs = {
	sumneko_lua = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim", "u", "nvim", "P" }
				},
				workspaces = {
					library = --{
						vim.api.nvim_get_runtime_file('/Users/williamfournier/.config/nvim/emmylua-nvim', true),
						--[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						--[vim.fn.stdpath("config") .. "/lua"] = true
					--}
				},
				telemetry = {
					enable = false
				}
			}
		}
	},
	clangd = {
		cmd = { "clangd", "--background-index", "--suggest-missing-includes" },
		filetypes = { "c", "cpp", "objc", "objcpp" },
	}
}

M.get = function(name)
	return configs[name] or {}
end

return M
