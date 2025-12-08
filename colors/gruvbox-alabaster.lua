---@class GruvboxPalette
---@field dark0_hard string
---@field dark0 string
---@field dark0_soft string
---@field dark1 string
---@field dark2 string
---@field dark3 string
---@field dark4 string
---@field light0_hard string
---@field light0 string
---@field light0_soft string
---@field light1 string
---@field light2 string
---@field light3 string
---@field light4 string
---@field bright_red string
---@field bright_green string
---@field bright_yellow string
---@field bright_blue string
---@field bright_purple string
---@field bright_aqua string
---@field bright_orange string
---@field neutral_red string
---@field neutral_green string
---@field neutral_yellow string
---@field neutral_blue string
---@field neutral_purple string
---@field neutral_aqua string
---@field neutral_orange string
---@field gray string
---@field alabaster_diff_add string
---@field alabaster_diff_bg_add string
---@field alabaster_diff_del string
---@field alabaster_diff_bg_del string
---@field alabaster_dark_dim_comment string

---@class GruvboxAlabaster
---@field config GruvboxConfig
---@field palette GruvboxPalette
local GruvboxAlabaster = {}

---@alias Contrast "hard" | "soft" | ""

---@class ItalicConfig
---@field strings boolean
---@field comments boolean
---@field operators boolean
---@field folds boolean
---@field emphasis boolean

---@class HighlightDefinition
---@field fg string?
---@field bg string?
---@field sp string?
---@field blend integer?
---@field bold boolean?
---@field standout boolean?
---@field underline boolean?
---@field undercurl boolean?
---@field underdouble boolean?
---@field underdotted boolean?
---@field strikethrough boolean?
---@field italic boolean?
---@field reverse boolean?
---@field nocombine boolean?

---@class GruvboxConfig
---@field bold boolean?
---@field contrast Contrast?
---@field dim_inactive boolean?
---@field inverse boolean?
---@field invert_selection boolean?
---@field invert_signs boolean?
---@field invert_tabline boolean?
---@field italic ItalicConfig?
---@field overrides table<string, HighlightDefinition>?
---@field palette_overrides table<string, string>?
---@field strikethrough boolean?
---@field terminal_colors boolean?
---@field transparent_mode boolean?
---@field undercurl boolean?
---@field underline boolean?
local default_config = {
	terminal_colors = true,
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = true,
		emphasis = true,
		comments = true,
		operators = false,
		folds = true,
	},
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	inverse = true,
	contrast = "", -- "hard" will use standard gruvbox bg, "" uses alabaster bg
	palette_overrides = {},
	overrides = {},
	dim_inactive = false,
	transparent_mode = false,
}

GruvboxAlabaster.config = vim.deepcopy(default_config)

-- Standard Gruvbox Palette
---@type GruvboxPalette
GruvboxAlabaster.palette = {
	dark0_hard = "#1d2021",
	dark0 = "#282828",
	dark0_soft = "#32302f",
	dark1 = "#3c3836",
	dark2 = "#504945",
	dark3 = "#665c54",
	dark4 = "#7c6f64",
	light0_hard = "#f9f5d7",
	light0 = "#fbf1c7",
	light0_soft = "#f2e5bc",
	light1 = "#ebdbb2",
	light2 = "#d5c4a1",
	light3 = "#bdae93",
	light4 = "#a89984",
	bright_red = "#fb4934",
	bright_green = "#b8bb26",
	bright_yellow = "#fabd2f",
	bright_blue = "#83a598",
	bright_purple = "#d3869b",
	bright_aqua = "#8ec07c",
	bright_orange = "#fe8019",
	neutral_red = "#cc241d",
	neutral_green = "#98971a",
	neutral_yellow = "#d79921",
	neutral_blue = "#458588",
	neutral_purple = "#b16286",
	neutral_aqua = "#689d6a",
	neutral_orange = "#d65d0e",
	gray = "#928374",
	-- Alabaster specific tweaks
	alabaster_diff_add = "#0A7816", -- Darker green for text
	alabaster_diff_bg_add = "#ADFFB7",
	alabaster_diff_del = "#872C28",
	alabaster_diff_bg_del = "#F8B28F",
	alabaster_dark_dim_comment = "#665c54",
}

local function get_colors()
	local p = GruvboxAlabaster.palette
	local config = GruvboxAlabaster.config

	for color, hex in pairs(config.palette_overrides) do
		p[color] = hex
	end

	local bg = vim.o.background
	local contrast = config.contrast

	-- Mapping Logic for Alabaster Principles
	-- Backgrounds are shifted: Dark uses dark2 (lighter gray) by default for that "Alabaster" washed look
	-- unless contrast is set to "hard", then it acts like standard Gruvbox background.

	local color_groups = {
		dark = {
			-- Alabaster Dark uses #504945 (dark2) as main background usually
			bg0 = (contrast == "hard") and p.dark0 or p.dark2,
			bg1 = p.dark1, -- Darker for UI elements
			bg2 = p.dark0, -- Even darker for contrasts
			bg3 = p.dark3,
			bg4 = p.dark4,

			fg0 = p.light1, -- Main Text (ebdbb2)
			fg1 = p.light2, -- Dimmer text
			fg_dim = p.dark4, -- Punctuation / non-essential

			-- Syntax Colors (Alabaster Mappings)
			comment = p.bright_yellow, -- Alabaster uses bright comments
			string = p.bright_aqua,
			constant = p.bright_purple,
			definition = p.bright_blue,
			type_def = p.bright_yellow,

			-- Standard palette refs for plugins
			red = p.bright_red,
			green = p.bright_green,
			yellow = p.bright_yellow,
			blue = p.bright_blue,
			purple = p.bright_purple,
			aqua = p.bright_aqua,
			orange = p.bright_orange,

			gray = p.gray,
			mistake_bg = "#2b1d1e",
			diff_add_bg = "#34381b", -- Custom subtle greens
			diff_del_bg = "#402120",
		},
		light = {
			-- Alabaster Light uses #ebdbb2 (light1)
			bg0 = (contrast == "hard") and p.light0 or p.light1,
			bg1 = p.light2,
			bg2 = p.light0,
			bg3 = p.light3,
			bg4 = p.light4,

			fg0 = p.dark2, -- Main Text (#504945)
			fg1 = p.dark1,
			fg_dim = p.gray,

			-- Syntax Colors
			comment = p.neutral_red, -- Reddish comments in light mode per Alabaster
			string = p.neutral_green,
			constant = p.neutral_purple,
			definition = p.neutral_blue,
			type_def = p.neutral_yellow,

			-- Standard palette refs
			red = p.neutral_red,
			green = p.neutral_green,
			yellow = p.neutral_yellow,
			blue = p.neutral_blue,
			purple = p.neutral_purple,
			aqua = p.neutral_aqua,
			orange = p.neutral_orange,

			gray = p.gray,
			mistake_bg = "#f8b28f",
			diff_add_bg = "#ADFFB7",
			diff_del_bg = "#F8B28F",
		},
	}

	return color_groups[bg]
end

local function get_groups()
	local colors = get_colors()
	local config = GruvboxAlabaster.config

	if config.terminal_colors then
		vim.g.terminal_color_0 = colors.bg0
		vim.g.terminal_color_8 = colors.gray
		vim.g.terminal_color_1 = colors.red
		vim.g.terminal_color_9 = colors.red
		vim.g.terminal_color_2 = colors.green
		vim.g.terminal_color_10 = colors.green
		vim.g.terminal_color_3 = colors.yellow
		vim.g.terminal_color_11 = colors.yellow
		vim.g.terminal_color_4 = colors.blue
		vim.g.terminal_color_12 = colors.blue
		vim.g.terminal_color_5 = colors.purple
		vim.g.terminal_color_13 = colors.purple
		vim.g.terminal_color_6 = colors.aqua
		vim.g.terminal_color_14 = colors.aqua
		vim.g.terminal_color_7 = colors.fg0
		vim.g.terminal_color_15 = colors.fg1
	end

	local groups = {
		-- Base UI
		Normal = config.transparent_mode and { fg = colors.fg0, bg = nil } or { fg = colors.fg0, bg = colors.bg0 },
		NormalFloat = config.transparent_mode and { fg = colors.fg0, bg = nil } or { fg = colors.fg0, bg = colors.bg1 },
		NormalNC = config.dim_inactive and { fg = colors.fg1, bg = colors.bg0 } or { link = "Normal" },
		CursorLine = { bg = colors.bg2 },
		CursorColumn = { link = "CursorLine" },
		ColorColumn = { bg = colors.bg2 },
		LineNr = { fg = colors.bg4 },
		CursorLineNr = { fg = colors.blue, bold = true },
		VertSplit = { fg = colors.bg4, bg = nil },
		WinSeparator = { link = "VertSplit" },
		StatusLine = { fg = colors.fg0, bg = colors.bg2 },
		StatusLineNC = { fg = colors.gray, bg = colors.bg1 },

		-- Search / Selection
		Visual = { bg = colors.bg3, reverse = config.invert_selection },
		Search = { fg = colors.bg0, bg = colors.yellow },
		IncSearch = { fg = colors.bg0, bg = colors.orange },
		CurSearch = { link = "IncSearch" },
		MatchParen = { bg = colors.bg3, bold = true, underline = true },

		-- UI Messages
		ErrorMsg = { fg = colors.red, bg = colors.mistake_bg, bold = true },
		WarningMsg = { fg = colors.yellow, bold = true },
		MoreMsg = { fg = colors.green, bold = true },
		Question = { fg = colors.aqua, bold = true },
		Directory = { fg = colors.blue, bold = true },
		Title = { fg = colors.yellow, bold = true },
		NonText = { fg = colors.bg4 },
		SpecialKey = { fg = colors.bg4 },
		Whitespace = { fg = colors.bg2 },

		-- Tabs and Splits
		TabLine = { fg = colors.gray, bg = colors.bg1 },
		TabLineSel = { fg = colors.fg0, bg = colors.bg0 },
		TabLineFill = { fg = colors.bg1, bg = colors.bg1 },

		-- Pmenu
		Pmenu = { fg = colors.fg0, bg = colors.bg2 },
		PmenuSel = { fg = colors.bg0, bg = colors.blue, bold = true },
		PmenuSbar = { bg = colors.bg2 },
		PmenuThumb = { bg = colors.gray },

		-- Diffs
		DiffAdd = { bg = colors.diff_add_bg, fg = nil },
		DiffDelete = { bg = colors.diff_del_bg, fg = nil },
		DiffChange = { bg = colors.bg2, fg = nil },
		DiffText = { bg = colors.yellow, fg = colors.bg0 },

		-------------------------------------------------------------------------
		-- ALABASTER PRINCIPLES SYNTAX HIGHLIGHTING
		-------------------------------------------------------------------------

		-- 1. Base Text & Keywords -> Normal (Strip color)
		Statement = { link = "Normal" },
		Conditional = { link = "Normal" },
		Repeat = { link = "Normal" },
		Label = { link = "Normal" },
		Exception = { link = "Normal" },
		Operator = { fg = colors.fg_dim }, -- Dimmed operator
		Keyword = { link = "Normal" },

		-- 2. Identifiers -> Normal (Usage is not highlighted)
		Identifier = { link = "Normal" },
		Function = { link = "Normal" }, -- Usage is normal

		-- 3. PreProc & Types -> Normal
		PreProc = { link = "Normal" },
		Include = { link = "Normal" },
		Define = { link = "Normal" },
		Macro = { link = "Normal" },
		PreCondit = { link = "Normal" },
		Type = { link = "Normal" },
		StorageClass = { link = "Normal" },
		Structure = { link = "Normal" },
		Typedef = { link = "Normal" },

		-- 4. Literals & Values (Keep distinct)
		Constant = { fg = colors.constant },
		String = { fg = colors.string, italic = config.italic.strings },
		Character = { link = "Constant" },
		Number = { link = "Constant" },
		Boolean = { link = "Constant" },
		Float = { link = "Constant" },

		-- 5. Comments & Specials
		Comment = { fg = colors.comment, italic = config.italic.comments },
		Special = { fg = colors.orange }, -- Regex, escapes
		SpecialChar = { link = "Special" },
		Tag = { link = "Normal" },
		Delimiter = { fg = colors.fg_dim }, -- Dimmed punctuation
		Debug = { link = "Special" },

		-- 6. Definitions (The "Alabaster" logic: Declarations get color)
		-- We define these groups for TS/LSP to hook into
		GruvboxDefinition = { fg = colors.definition, bold = config.bold },
		GruvboxTypeDef = { fg = colors.type_def, bold = config.bold },

		-- Standard Highlights kept simple
		Underlined = { underline = config.underline },
		Ignore = { fg = colors.bg4 },
		Error = { fg = colors.red, bold = true },
		Todo = { fg = colors.bg0, bg = colors.yellow, bold = true, italic = config.italic.comments },

		-------------------------------------------------------------------------
		-- TREESITTER (Implementing Alabaster Principles)
		-------------------------------------------------------------------------

		-- Punctuation -> Dimmed
		["@punctuation.delimiter"] = { link = "Delimiter" },
		["@punctuation.bracket"] = { link = "Delimiter" },
		["@punctuation.special"] = { link = "Delimiter" },

		-- Literals -> Colored
		["@string"] = { link = "String" },
		["@string.regex"] = { link = "Special" },
		["@string.escape"] = { link = "Special" },
		["@character"] = { link = "Character" },
		["@boolean"] = { link = "Boolean" },
		["@number"] = { link = "Number" },
		["@float"] = { link = "Float" },

		-- Functions -> Logic: Usage = Normal, Definition = Colored
		["@function"] = { link = "Normal" },
		["@function.call"] = { link = "Normal" },
		["@function.builtin"] = { link = "Normal" }, -- Alabaster style: minimal builtins
		["@function.macro"] = { link = "Normal" },
		["@method"] = { link = "Normal" },
		["@method.call"] = { link = "Normal" },
		["@constructor"] = { link = "GruvboxTypeDef" }, -- Constructors often look like Types

		-- Keywords -> Normal
		["@keyword"] = { link = "Normal" },
		["@keyword.function"] = { link = "Normal" },
		["@keyword.operator"] = { link = "Delimiter" },
		["@keyword.return"] = { link = "Normal" },
		["@conditional"] = { link = "Normal" },
		["@repeat"] = { link = "Normal" },
		["@include"] = { link = "Normal" },
		["@exception"] = { link = "Normal" },

		-- Variables -> Normal (No rainbow soup)
		["@variable"] = { link = "Normal" },
		["@variable.builtin"] = { link = "Normal" },
		["@variable.parameter"] = { link = "Normal" },
		["@variable.member"] = { link = "Normal" },
		["@property"] = { link = "Normal" },
		["@field"] = { link = "Normal" },

		-- Types -> Logic: Usage = Normal, Definition = Colored
		["@type"] = { link = "Normal" },
		["@type.builtin"] = { link = "Normal" },
		["@type.definition"] = { link = "GruvboxTypeDef" },
		["@type.qualifier"] = { link = "Normal" },
		["@storageclass"] = { link = "Normal" },
		["@structure"] = { link = "Normal" },
		["@namespace"] = { link = "Normal" },

		-- Tags (HTML/JSX) -> Alabaster usually keeps these minimal
		["@tag"] = { link = "Normal" },
		["@tag.attribute"] = { link = "Normal" },
		["@tag.delimiter"] = { link = "Delimiter" },

		-- Text
		["@text.strong"] = { bold = true },
		["@text.emphasis"] = { italic = true },
		["@text.underline"] = { underline = true },
		["@text.title"] = { link = "Title" },
		["@text.uri"] = { link = "Underlined" },
		["@text.diff.add"] = { link = "DiffAdd" },
		["@text.diff.delete"] = { link = "DiffDelete" },

		-------------------------------------------------------------------------
		-- UI FANCINESS (Plugins) - Keeping the "Gruvbox" feel in UI
		-------------------------------------------------------------------------

		-- Diagnostics
		DiagnosticError = { fg = colors.red },
		DiagnosticWarn = { fg = colors.yellow },
		DiagnosticInfo = { fg = colors.blue },
		DiagnosticHint = { fg = colors.aqua },
		DiagnosticOk = { fg = colors.green },

		DiagnosticUnderlineError = { sp = colors.red, underline = true },
		DiagnosticUnderlineWarn = { sp = colors.yellow, underline = true },
		DiagnosticUnderlineInfo = { sp = colors.blue, underline = true },
		DiagnosticUnderlineHint = { sp = colors.aqua, underline = true },

		-- LSP References (Highlight current word)
		LspReferenceText = { bg = colors.bg2 },
		LspReferenceRead = { bg = colors.bg2 },
		LspReferenceWrite = { bg = colors.bg2, underline = true },

		-- GitSigns / Gutter
		GitSignsAdd = { fg = colors.green },
		GitSignsChange = { fg = colors.yellow },
		GitSignsDelete = { fg = colors.red },

		-- Telescope
		TelescopeNormal = { link = "Normal" },
		TelescopeBorder = { fg = colors.gray },
		TelescopeSelection = { bg = colors.bg2, bold = true },
		TelescopeMatching = { fg = colors.orange, bold = true },
		TelescopePromptPrefix = { fg = colors.aqua },

		-- NeoTree
		NeoTreeNormal = { link = "Normal" },
		NeoTreeDirectoryName = { fg = colors.blue, bold = true },
		NeoTreeFileName = { fg = colors.fg0 },
		NeoTreeFileNameOpened = { fg = colors.fg0, bold = true },
		NeoTreeRootName = { fg = colors.orange, bold = true },
		NeoTreeGitAdded = { fg = colors.green },
		NeoTreeGitDeleted = { fg = colors.red },
		NeoTreeGitModified = { fg = colors.yellow },
		NeoTreeIndentMarker = { fg = colors.bg4 },

		-- WhichKey
		WhichKey = { fg = colors.aqua },
		WhichKeyDesc = { fg = colors.fg0 },
		WhichKeyGroup = { fg = colors.orange },
		WhichKeySeparator = { fg = colors.gray },

		-- Lazy
		LazyNormal = { bg = colors.bg1 },
		LazyH1 = { link = "Title" },

		-- Mason
		MasonHeader = { link = "Title" },
		MasonHighlight = { fg = colors.aqua },

		-- Noice
		NoiceCmdlinePopupBorder = { fg = colors.gray },
		NoiceCmdlineIcon = { fg = colors.aqua },
	}

	for group, hl in pairs(config.overrides) do
		if groups[group] then
			groups[group].link = nil
		end
		groups[group] = vim.tbl_extend("force", groups[group] or {}, hl)
	end

	return groups
end

---@param config GruvboxConfig?
GruvboxAlabaster.setup = function(config)
	GruvboxAlabaster.config = vim.deepcopy(default_config)
	GruvboxAlabaster.config = vim.tbl_deep_extend("force", GruvboxAlabaster.config, config or {})
end

GruvboxAlabaster.load = function()
	if vim.version().minor < 8 then
		vim.notify_once("gruvbox-alabaster.nvim: you must use neovim 0.8 or higher")
		return
	end

	if vim.g.colors_name then
		vim.cmd.hi("clear")
	end
	vim.g.colors_name = "gruvbox-alabaster"
	vim.o.termguicolors = true

	local groups = get_groups()

	for group, settings in pairs(groups) do
		vim.api.nvim_set_hl(0, group, settings)
	end
end

return GruvboxAlabaster
