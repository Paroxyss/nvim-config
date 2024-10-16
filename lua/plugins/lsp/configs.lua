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
		cmd = {
			"clangd",
			"--background-index",
			"--query-driver=**/*"
			--"--query-driver=/opt/homebrew/bin/arm-none-eabi-g++"
		},
		rootPatterns = { "compile_flags.txt", "compile_commands.json" },
		filetypes = { "c", "cpp", "objc", "objcpp" },
	},
	ccls = {
		cmd = { "ccls" },
		rootPatterns = { "compile_flags.txt", "compile_commands.json" },
		filetypes = { "c", "cpp", "objc", "objcpp" },
	},
}

M.get = function(name)
	return configs[name] or {}
end

return M
