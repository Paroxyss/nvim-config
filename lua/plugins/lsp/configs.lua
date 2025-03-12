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

local pwd=os.getenv("PWD")
if pwd and string.find(pwd, "CDR2025_LL", 1, true) then
	configs.clangd.cmd[#configs.clangd.cmd+1] = "--query-driver=**/*"
end

M.get = function(name)
	return configs[name] or {}
end

return M
