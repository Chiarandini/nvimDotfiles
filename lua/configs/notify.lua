local notify = require('notify')


print = function(...)
    local print_safe_args = {}
    local _ = { ... }
    for i = 1, #_ do
        table.insert(print_safe_args, tostring(_[i]))
    end
    notify(table.concat(print_safe_args, ' '), "info")
end

---@diagnostic disable-next-line: missing-fields
notify.setup({
	background_colour = "NotifyBackground",
	-- background_colour = "NotifyBackground",
	fps = 30,
	icons = {
		DEBUG = "",
		ERROR = "",
		INFO = "",
		TRACE = "✎",
		WARN = "",
	},
	level = 2,
	minimum_width = 50,
	render = "default",
	stages = "fade", -- default: fade_in_slide_out
	time_formats = {
		notification = "%T",
		notification_history = "%FT%T"
	},
	timeout = 200,
    top_down = true
})
vim.notify = notify
