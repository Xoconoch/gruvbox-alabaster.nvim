local colors
if vim.o.background == "dark" then
	colors = {
		color1 = "#504945", -- base bg-ish
		color2 = "#eebd35", -- yellow/orange accent
		color3 = "#ebdbb2", -- fg
		color4 = "#7fa2ac", -- subtle/secondary fg
		color5 = "#665c54", -- darker bar bg
		color6 = "#b16286", -- purple accent (visual)
	}
else
	colors = {
		color1 = "#ebdbb2", -- light bg-ish
		color2 = "#fabd2f", -- stronger yellow for light bg
		color3 = "#504945", -- darker fg on light
		color4 = "#7fa2ac",
		color5 = "#dedede",
		color6 = "#b16286",
	}
end

return {
	replace = {
		a = { fg = colors.color1, bg = colors.color2, gui = "bold" },
		b = { fg = colors.color3, bg = colors.color1 },
	},
	inactive = {
		a = { fg = colors.color4, bg = colors.color1, gui = "bold" },
		b = { fg = colors.color4, bg = colors.color1 },
		c = { fg = colors.color4, bg = colors.color1 },
	},
	normal = {
		a = { fg = colors.color3, bg = colors.color5, gui = "bold" },
		b = { fg = colors.color3, bg = colors.color1 },
		c = { fg = colors.color3, bg = colors.color1 },
	},
	visual = {
		a = { fg = colors.color1, bg = colors.color6, gui = "bold" },
		b = { fg = colors.color3, bg = colors.color1 },
	},
	insert = {
		a = { fg = colors.color1, bg = colors.color3, gui = "bold" },
		b = { fg = colors.color3, bg = colors.color1 },
	},
}
