local M = {}
local configs = {
	sumneko_lua = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim", "u", "nvim", "P" }
				},
				workspaces = {},
				telemetry = {
					enable = false
				}
			}
		}
	},
	clangd = {
		cmd = { "clangd", "--background-index", "--suggest-missing-includes", "--enable-config" },
		rootPatterns = { "compile_flags.txt", "compile_commands.json" },
		filetypes = { "c", "cpp", "objc", "objcpp" },
	}
}

M.get = function(name)
	return configs[name] or {}
end

return M
