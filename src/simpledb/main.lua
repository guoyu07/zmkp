local skynet = require "skynet"

local max_client = 64

skynet.start(function()
	print("Server start")
	-- local console = skynet.newservice("console")
	-- skynet.newservice("debug_console",18000)
	skynet.newservice("simpledb")
	local watchdog = skynet.newservice("watchdog")
	skynet.call(watchdog, "lua", "start", {
		port = 10104,
		maxclient = max_client,
	})

	skynet.exit()
end)
