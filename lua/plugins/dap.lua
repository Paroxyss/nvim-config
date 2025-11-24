require("dap-lldb").setup()
require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end


local wk = require("which-key")
wk.add({
	{ "<leader>d",  group = "dap" },
	{ "<leader>dc", function() dap.continue() end, desc = "continue" },
	{ "<leader>de", function() dap.close() end,    desc = "exit" },
	{ "<leader>db", function() dap.toggle_breakpoint() end,    desc = "exit" },
})
