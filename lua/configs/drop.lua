local function getTheme()
	local curTime = tonumber(string.sub(os.date(), 12, 13))

	-- if late at night or christmas, special return values
	if curTime >= 21 or curTime <= 6 then
		return {theme = "stars"}
	end
	return {
        { theme = "new_year", month = 1, day = 1 },
        { theme = "valentines_day", month = 2, day = 14 },
        { theme = "st_patricks_day", month = 3, day = 17 },
        { theme = "easter", holiday = "easter" },
        { theme = "april_fools", month = 4, day = 1 },
        { theme = "us_independence_day", month = 7, day = 4 },
        { theme = "halloween", month = 10, day = 31 },
        { theme = "us_thanksgiving", holiday = "us_thanksgiving" },
        { theme = "xmas", from = { month = 12, day = 20 }, to = { month = 12, day = 25 } },
        { theme = "leaves", from = { month = 9, day = 22 }, to = { month = 12, day = 20 } },
        { theme = "snow", from = { month = 12, day = 21 }, to = { month = 3, day = 19 } },
        { theme = "spring", from = { month = 3, day = 20 }, to = { month = 6, day = 20 } },
        { theme = "summer", from = { month = 6, day = 21 }, to = { month = 9, day = 21 } },
      }

	-- local christmas = string.sub(os.date(), 8, 10) == "Dec" and (tonumber(string.sub(os.date(), 5, 6)) > 19)
	-- local month = tonumber(string.sub(os.date("%x"), 4, 5))
	--
	-- elseif christmas then
	-- 	return "xmas"
	-- end
	--
	-- -- return the appropriate season
	-- if month >= 3 and month < 6 then
	-- 	return "spring"
	-- elseif month >= 6 and month < 10 then
	-- 	return "summer"
	-- elseif month >= 10 and month <= 11 then
	-- 	return "leaves"
	-- elseif (month <= 12) or (month >= 1 and month < 3) then
	-- 	return "snow"
	-- end
end
require("drop").setup({
	---@type DropTheme|string
	themes = getTheme(),       -- default options: "leaves", "snow", "stars", "xmas", "spring", "summer"

	max = 40,                 -- maximum number of drops on the screen
	interval = 150,           -- every 150ms we update the drops
	-- screensaver = 10, -- show after 8 minutes. Set to false, to disable
	screensaver = (1000 * 60) * 8, -- show after 8 minutes. Set to false, to disable
	filetypes = {},           -- will enable/disable automatically for the following filetypes
	winblend = 90
	-- filetypes = { "dashboard", "alpha", "starter" }, -- will enable/disable automatically for the following filetypes
})
