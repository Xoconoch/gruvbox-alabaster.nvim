vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "gruvbox-alabaster"

local theme
---@diagnostic disable: undefined-global
if vim.o.background == "dark" then
	-- terminal colors
	vim.g.terminal_color_0 = "#504945"
	vim.g.terminal_color_1 = "#fb4934"
	vim.g.terminal_color_2 = "#689d6a"
	vim.g.terminal_color_3 = "#eebd35"
	vim.g.terminal_color_4 = "#217EBC"
	vim.g.terminal_color_5 = "#9B3596"
	vim.g.terminal_color_6 = "#178F79"
	vim.g.terminal_color_7 = "#ebdbb2"
	vim.g.terminal_color_8 = "#504945"
	vim.g.terminal_color_9 = "#cc241d"
	vim.g.terminal_color_10 = "#8ec07c"
	vim.g.terminal_color_11 = "#fabd2f"
	vim.g.terminal_color_12 = "#83a598"
	vim.g.terminal_color_13 = "#b16286"
	vim.g.terminal_color_14 = "#458588"
	vim.g.terminal_color_15 = "#ebdbb2"

	-- colors
	local bg = "#282828"
	local fg = "#ebdbb2"
	local punct_fg = "#ebdbb2"
	local def_fg = "#83a598"
	local const_fg = "#b16286"
	local active = "#eebd35"
	local string_fg = "#b8bb26"
	local darker_fg = "#83a598"
	local diffadd = "#689d6a"
	local diffdelete = "#fb4934"
	local diffchange = "#d65d0e"
	local statusline = "#504945"
	local comment = "#fabd2f"
	local dim_comment = "#665c54"
	local mistake = {
		fg = "#cc241d",
		bg = "#2b1d1e",
	}
	local error = "#cc241d"
	local warn = "#f4b371"
	local hint = "#83a598"
	local info = "#8ec07c"
	local ansi = {
		black = "#504945",
		blue = "#83a598",
		brightyellow = "#fabd2f",
		cyan = "#458588",
		green = "#8ec07c",
		magenta = "#b16286",
		red = "#cc241d",
		white = "#ebdbb2",
		yellow = "#eebd35",
	}
	local comment_fg = vim.g.alabaster_dim_comments and dim_comment or comment
	local pmenu_bg = "#504945"
	local float_bg = vim.g.alabaster_floatborder and bg or pmenu_bg
	local floatborder = vim.g.alabaster_floatborder and { bg = bg, fg = "#504945" }
		or {
			bg = float_bg,
			fg = float_bg,
		}
	theme = {
		Comment = { fg = comment_fg },
		ColorColumn = { bg = "#504945" },
		Conceal = { fg = "#dedede" },
		Cursor = { bg = active, fg = "#504945" },
		-- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
		CursorColumn = { bg = "#504945" },
		CursorLine = { bg = "#504945" },
		Directory = { fg = ansi.blue },
		DiffAdd = { bg = "#504945", fg = "#8ec07c" },
		DiffDelete = { bg = "#504945", fg = "#f85149" },
		DiffText = { fg = "#504945", bg = "#fff987" },
		DiffChange = { bg = "#504945", fg = "#e3b341" },
		EndOfBuffer = { fg = "#504945" },
		-- TermCursor   { }, -- cursor in a focused terminal
		TermCursorNC = { fg = bg, bg = fg },
		ErrorMsg = { fg = error, bg = mistake.bg },
		VertSplit = { fg = "#504945" },
		Folded = { bg = "#504945", fg = "#83a598" },
		FoldColumn = { bg = bg, fg = "#504945" },
		SignColumn = {},
		IncSearch = { bg = ansi.yellow, fg = bg },
		-- Substitute   { }, -- |:substitute| replacement text highlighting
		LineNr = { fg = "#7c6f64" },
		CursorLineNr = { fg = ansi.yellow, bold = 1 },
		MatchParen = { underline = 1, sp = active },
		-- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea      { }, -- Area for messages and cmdline
		-- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg = { fg = ansi.green, bold = 1 },
		NonText = { fg = "#665c54" },
		Normal = { bg = bg, fg = fg },
		NormalFloat = { bg = float_bg },
		-- NormalNC     { }, -- normal text in non-current windows
		FloatBorder = floatborder,
		Pmenu = { bg = pmenu_bg },
		PmenuSel = { bg = "#504945" },
		PmenuSbar = { bg = "#504945" },
		PmenuThumb = { bg = "#47666b" },
		Question = { fg = diffadd },
		QuickFixLine = { bg = "#504945" },
		Search = { bg = "#504945" },
		SpecialKey = { fg = ansi.cyan },
		SpellBad = { undercurl = 1, sp = ansi.red },
		SpellCap = { undercurl = 1, sp = ansi.blue },
		SpellLocal = { undercurl = 1, sp = ansi.cyan },
		SpellRare = { undercurl = 1, sp = ansi.magenta },
		StatusLine = { bg = statusline, fg = fg },
		StatusLineNC = { bg = statusline, fg = "#9f9f9f" },
		TabLine = { bg = statusline, fg = "#83a598" },
		TabLineFill = { bg = statusline },
		TabLineSel = { bg = statusline, fg = ansi.blue },
		Title = { fg = const_fg },
		Visual = { bg = "#665c54" },
		VisualNOS = { bg = "#665c54" },
		WarningMsg = { fg = "#e1ad4c" },
		WildMenu = { bg = "#504945" },
		WinBar = { bg = bg, fg = ansi.white, bold = true },
		WinBarNC = { bg = bg, fg = "#83a598" },

		--- SYNTAX I: TS groups link to these
		Constant = { fg = const_fg },
		String = { fg = string_fg },
		Character = { fg = const_fg },
		Number = { fg = const_fg },
		Boolean = { fg = const_fg },
		Float = { fg = const_fg },
		Operator = { fg = punct_fg },

		--- SYNTAX II: TS groups have their own definition, the below are defined to have somewhat working hl w/o treesitter
		Identifier = { fg = ansi.white },
		Function = { fg = def_fg },
		Statement = { fg = ansi.white },
		Conditional = { fg = ansi.white },
		Repeat = { fg = ansi.white },
		Label = { fg = def_fg },
		Keyword = { fg = ansi.white },
		Exception = { fg = ansi.white },
		PreProc = { fg = ansi.white },
		Include = { fg = ansi.white },
		Define = { fg = ansi.white },
		Macro = { fg = ansi.white },
		PreCondit = { fg = ansi.white },
		Type = { fg = ansi.white },
		StorageClass = { fg = ansi.white },
		Structure = { fg = def_fg },
		Typedef = { fg = def_fg },

		Special = { fg = ansi.yellow },
		-- TODO better color than diffchange, try reddish
		-- SpecialChar = { fg = diffchange }, --  special character in a constant
		-- Tag            { }, --    you can use CTRL-] on this
		-- Delimiter      { },
		SpecialComment = { bg = "#504945", fg = ansi.blue },
		debugPc = { bg = "#0f2534" },
		debugBreakpoint = { bg = "#b33229" },
		helpHyperTextJump = { fg = ansi.magenta },
		helpSectionDelim = { fg = ansi.magenta },
		helpExample = { fg = ansi.cyan },
		helpCommand = { fg = ansi.cyan },
		helpHeadline = { fg = ansi.blue },
		helpHeader = { fg = ansi.magenta },

		Underlined = { underline = 1 }, -- (preferred) text that stands out, HTML links
		Italic = { italic = 1 },

		-- ("Ignore", below, may be invisible...)
		-- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

		Error = { bg = mistake.bg, fg = mistake.fg },

		Todo = { bg = "#d0d058", fg = bg },

		--- Diagnostic
		LspReferenceText = { bg = "#504945" },
		LspReferenceRead = { bg = "#504945" },
		LspReferenceWrite = { bg = "#504945", underline = 1, sp = active },
		LspCodeLens = { fg = "#504945" },
		LspCodeLensSeparator = { fg = "#504945" },

		--- Diagnostic
		DiagnosticError = { fg = error },
		DiagnosticWarn = { fg = warn },
		DiagnosticHint = { fg = hint },
		DiagnosticInfo = { fg = info },
		DiagnosticVirtualTextError = { bg = "#350B0B", fg = "#D1503A" },
		DiagnosticVirtualTextWarn = { bg = "#3F240A", fg = "#C8935D" },
		DiagnosticVirtualTextHint = { bg = "#1D2B37", fg = "#7E9CB9" },
		DiagnosticVirtualTextInfo = { bg = "#162C0B", fg = "#7BAC62" },

		--- Treesitter
		TSAttribute = {},
		TSConstructor = { fg = ansi.white },
		TSConditional = { fg = ansi.white },
		TSConstBuiltin = { fg = const_fg },
		TSConstMacro = { fg = ansi.white },
		TSError = { bg = mistake.bg, fg = mistake.fg },
		TSException = { fg = ansi.white },
		TSField = { fg = ansi.white },
		TSFunction = { fg = ansi.white },
		TSFuncBuiltin = { fg = ansi.white },
		TSFuncMacro = { fg = ansi.white },
		TSKeyword = { fg = ansi.white },
		TSKeywordFunction = { fg = ansi.white },
		TSLabel = { fg = ansi.white },
		TSMethod = { fg = ansi.white },
		TSNamespace = { fg = ansi.white },
		TSNone = { fg = const_fg },
		TSParameter = { fg = ansi.white },
		TSParameterReference = { fg = ansi.white },
		TSProperty = { fg = ansi.white },
		TSPunctDelimiter = { fg = punct_fg },
		TSPunctBracket = { fg = "#bababa" },
		TSPunctSpecial = { fg = punct_fg },
		TSRepeat = { fg = ansi.white },
		TSString = { fg = string_fg },
		TSStringRegex = { bg = "#504945", fg = const_fg },
		TSStringEscape = { bg = "#504945", fg = const_fg },
		TSSymbol = {},
		TSType = { fg = ansi.white },
		TSTypeBuiltin = { fg = ansi.white },
		TSVariable = { fg = ansi.white },
		TSVariableBuiltin = { fg = ansi.white },
		TSTag = { fg = ansi.white },
		TSTagDelimiter = { fg = punct_fg },
		TSText = { fg = ansi.white },
		["@attribute"] = {},
		["@constructor"] = { fg = ansi.white },
		["@conditional"] = { fg = ansi.white },
		["@constant.builtin"] = { fg = const_fg },
		["@constant.macro"] = { fg = ansi.white },
		["@error"] = { bg = mistake.bg, fg = mistake.fg },
		["@exception"] = { fg = ansi.white },
		["@field"] = { fg = ansi.white },
		["@function"] = { fg = ansi.white },
		["@function.builtin"] = { fg = ansi.white },
		["@function.macro"] = { fg = ansi.white },
		["@keyword"] = { fg = ansi.white },
		["@keyword.function"] = { fg = ansi.white },
		["@keyword.operator"] = { fg = punct_fg },
		["@label"] = { fg = ansi.white },
		["@method"] = { fg = ansi.white },
		["@module"] = { fg = ansi.white },
		["@namespace"] = { fg = ansi.white },
		["@none"] = { fg = const_fg },
		["@parameter"] = { fg = ansi.white },
		["@parameter.reference"] = { fg = ansi.white },
		["@property"] = { fg = ansi.white },
		["@punctuation.delimiter"] = { fg = punct_fg },
		["@punctuation.bracket"] = { fg = "#bababa" },
		["@punctuation.special"] = { fg = punct_fg },
		["@repeat"] = { fg = ansi.white },
		["@string"] = { fg = string_fg },
		["@string.regex"] = { bg = "#504945", fg = const_fg },
		["@string.escape"] = { bg = "#504945", fg = const_fg },
		["@symbol"] = {},
		["@type"] = { fg = ansi.white },
		["@type.builtin"] = { fg = ansi.white },
		["@variable"] = { fg = ansi.white },
		["@variable.builtin"] = { fg = ansi.white },
		["@tag"] = { fg = ansi.white },
		["@tag.delimiter"] = { fg = punct_fg },
		["@text"] = { fg = ansi.white },
		["@text.note"] = { bg = "#504945", fg = ansi.blue },
		["@text.warning"] = { bg = "#d0d058", fg = bg },

		--- Theme specific
		["@GruvboxAlabasterBase"] = { fg = ansi.white },
		["@GruvboxAlabasterConstant"] = { fg = const_fg },
		["@GruvboxAlabasterDefinition"] = { fg = def_fg },
		["@GruvboxAlabasterPunct"] = { fg = punct_fg },
		["@GruvboxAlabasterString"] = { fg = string_fg },
		["@GruvboxAlabasterHashbang"] = { fg = dim_comment },
		--- Gitsigns
		GitSignsAdd = { fg = diffadd },
		GitSignsChange = { fg = diffchange },
		GitSignsDelete = { fg = diffdelete },
		--- Telescope
		TelescopeBorder = { fg = "#2b3d40" },
		TelescopeMatching = { fg = "#f09942" },
		TelescopeMultiSelection = { fg = ansi.magenta },
		TelescopePromptPrefix = { fg = ansi.blue },
		TelescopeSelectionCaret = { fg = mistake.fg },
		TelescopeTitle = { fg = ansi.brightyellow },
		TelescopeResultsTitle = { fg = ansi.yellow },
		--- fzf-lua
		FzfLuaBorder = { fg = "#2b3d40" },
		--- mini.nvim
		MiniPickMatchCurrent = { fg = "#f09942" },
		--- Neogit
		NeogitPopupActionDisabled = { fg = darker_fg },
		NeogitPopupActionKey = { fg = ansi.magenta },
		NeogitPopupOptionDisabled = { fg = darker_fg },
		NeogitPopupOptionKey = { fg = ansi.blue },
		NeogitPopupSwitchDisabled = { fg = darker_fg },
		NeogitPopupSwitchEnabled = { fg = ansi.cyan },
		NeogitPopupSwitchKey = { fg = ansi.magenta },
		--- Fugitive
		diffAdded = { link = "DiffAdd" },
		diffRemoved = { link = "DiffDelete" },
		--- Startify
		StartifyBracket = { fg = darker_fg },
		StartifyFile = { fg = ansi.white },
		StartifySection = { fg = ansi.green },
		StartifySlash = { fg = "#4e6e75" },
		StartifyPath = { fg = "#4e6e75" },
		--- Statusline
		StatuslineAdd = { fg = diffadd, bg = statusline },
		StatuslineErr = { fg = error, bg = statusline },
		StatuslineHint = { fg = hint, bg = statusline },
		StatuslineInfo = { fg = info, bg = statusline },
		StatuslineWarn = { fg = warn, bg = statusline },
		StatuslineBlue = { fg = ansi.blue, bg = statusline },
		StatuslineRed = { fg = ansi.red, bg = statusline },
		StatuslineGreen = { fg = ansi.green, bg = statusline },
		StatuslineCyan = { fg = ansi.cyan, bg = statusline },
		StatuslineMagenta = { fg = ansi.magenta, bg = statusline },
		--- ALE
		ALEWarningSign = { fg = warn },
		--- vim-matchup
		MatchupVirtualText = { fg = ansi.yellow },
		--- For `highlight link`
		GruvboxAlabasterBlack = { fg = ansi.black },
		GruvboxAlabasterBlue = { fg = ansi.blue },
		GruvboxAlabasterBrightYellow = { fg = ansi.brightyellow },
		GruvboxAlabasterCyan = { fg = ansi.cyan },
		GruvboxAlabasterGreen = { fg = ansi.green },
		GruvboxAlabasterDarkGreen = { fg = "#689d6a" },
		GruvboxAlabasterMagenta = { fg = ansi.magenta },
		GruvboxAlabasterRed = { fg = ansi.red },
		GruvboxAlabasterWhite = { fg = ansi.white },
		GruvboxAlabasterYellow = { fg = ansi.yellow },
		--- Hop
		HopNextKey = { fg = ansi.brightyellow },
		HopNextKey1 = { fg = ansi.cyan },
		HopNextKey2 = { fg = "#297567" },
		HopUnmatched = { fg = "#3d3d3d" },
		--- Lightspeed
		LightspeedGreyWash = { fg = "#3d3d3d" },
		--- checkhealth
		healthSuccess = { fg = ansi.green, bg = bg },
		--- cmp
		CmpItemMenuDefault = { fg = ansi.magenta },
		--- nvim-ts-rainbow
		rainbowcol1 = { fg = ansi.yellow },
		rainbowcol2 = { fg = ansi.magenta },
		rainbowcol3 = { fg = ansi.blue },
		rainbowcol4 = { fg = ansi.green },
		rainbowcol5 = { fg = ansi.brightyellow },
		rainbowcol6 = { fg = ansi.red },
		rainbowcol7 = { fg = ansi.cyan },
		--- Iswap
		ISwapSnipe = { bg = ansi.yellow, fg = bg },
		ISwapGrey = { fg = "#3d3d3d" },
		--- vim-dadbod-ui
		dbui_help = { fg = dim_comment },
		dbui_connection_source = { fg = dim_comment },
		--- nvim-dap-virtual-text
		NvimDapVirtualText = { bg = "#504945", fg = ansi.cyan },
		--- Noice
		NoiceCmdlineIcon = { link = "GruvboxAlabasterDarkGreen" },
		NoiceCmdlinePopupBorder = { link = "GruvboxAlabasterDarkGreen" },
		NoiceConfirmBorder = { link = "GruvboxAlabasterDarkGreen" },
		NoiceCmdlinePopupBorderCmdline = { link = "GruvboxAlabasterDarkGreen" },
		NoiceCmdlineIconCmdline = { link = "GruvboxAlabasterDarkGreen" },
		NoiceCmdlinePopupBorderFilter = { link = "GruvboxAlabasterDarkGreen" },
		NoiceCmdlineIconFilter = { link = "GruvboxAlabasterDarkGreen" },
		NoiceCmdlinePopupBorderLua = { link = "GruvboxAlabasterDarkGreen" },
		NoiceCmdlineIconLua = { link = "GruvboxAlabasterDarkGreen" },
		NoiceCmdlinePopupBorderSearch = { link = "GruvboxAlabasterYellow" },
		NoiceCmdlineIconSearch = { link = "GruvboxAlabasterYellow" },
		-- Ministatusline
		MiniStatuslineModeNormal = { fg = "#282828", bg = "#ebdbb2", nocombine = true },
		MiniStatuslineModeCommand = { fg = "#282828", bg = "#fabd2f", nocombine = true },
		MiniStatuslineModeReplace = { fg = "#282828", bg = "#fb4934", nocombine = true },
		MiniStatuslineModeInsert = { fg = "#282828", bg = "#83a598", nocombine = true },
		MiniStatuslineModeVisual = { fg = "#282828", bg = "#b8bb26", nocombine = true },
		MiniStatuslineModeOther = { fg = "#282828", bg = "#8ec07c", nocombine = true },
		-- Languages
		--- asm
		asmDirective = { fg = dim_comment },
		nasmLabel = { link = "@GruvboxAlabasterDefinition" },

		["@lsp.mod.declaration"] = { fg = fg },
		["@lsp.type.enumMember"] = { fg = fg },
		["@lsp.type.function"] = { fg = fg },
		["@lsp.type.method"] = { fg = fg },
		["@lsp.type.selfKeyword"] = { fg = fg },
		["@lsp.typemod.class.declaration"] = { fg = def_fg },
		["@lsp.typemod.class.definition"] = { fg = def_fg },
		["@lsp.typemod.enum.declaration"] = { fg = def_fg },
		["@lsp.typemod.enumMember.defaultLibrary"] = { fg = fg },
		["@lsp.typemod.function.declaration"] = { fg = def_fg },
		["@lsp.typemod.function.definition"] = { fg = def_fg },
		["@lsp.typemod.macro.declaration"] = { fg = def_fg },
		["@lsp.typemod.method.declaration"] = { fg = def_fg },
		["@lsp.typemod.selfKeyword"] = { fg = fg },
		["@lsp.typemod.struct.declaration"] = { fg = def_fg },
		["@lsp.typemod.type.declaration"] = { fg = def_fg },
	}
else
	-- terminal colors
	vim.g.terminal_color_0 = "#504945"
	vim.g.terminal_color_1 = "#fb4934"
	vim.g.terminal_color_2 = "#448c27"
	vim.g.terminal_color_3 = "#fabd2f"
	vim.g.terminal_color_4 = "#458588"
	vim.g.terminal_color_5 = "#7a3e9d"
	vim.g.terminal_color_6 = "#458588"
	vim.g.terminal_color_7 = "#ebdbb2"
	vim.g.terminal_color_8 = "#777777"
	vim.g.terminal_color_9 = "#fb4934"
	vim.g.terminal_color_10 = "#8ec07c"
	vim.g.terminal_color_11 = "#eebd35"
	vim.g.terminal_color_12 = "#83a598"
	vim.g.terminal_color_13 = "#b16286"
	vim.g.terminal_color_14 = "#458588"
	vim.g.terminal_color_15 = "#ebdbb2"

	-- colors
	local bg = "#ebdbb2"
	local fg = "#504945"
	local punct_fg = "#777777"
	local def_fg = "#458588"
	local const_fg = "#7a3e9d"
	local active = "#eebd35"
	local active_blue = "#83a598"
	local string_fg = "#448c27"
	local darker_fg = "#83a598"
	local diffadd = "#284918"
	local diffdelete = "#B40600"
	local diffchange = "#d65d0e"
	local statusline = "#dedede"
	local comment = "#fb4934"
	local dim_comment = "#665c54"
	local mistake = {
		fg = "#cc241d",
		bg = "#f8b28f",
	}
	local ansi = {
		black = "#504945",
		blue = "#458588",
		brightyellow = "#eebd35",
		cyan = "#458588",
		green = "#448c27",
		magenta = "#7a3e9d",
		red = "#fb4934",
		white = "#ebdbb2",
		yellow = "#fabd2f",
	}
	local error = "#cc241d"
	local warn = "#BC7500"
	local hint = ansi.blue
	local info = "#278C00"
	local comment_fg = vim.g.alabaster_dim_comments and dim_comment or comment
	local pmenu_bg = "#e7e7e7"
	local float_bg = vim.g.alabaster_floatborder and bg or pmenu_bg
	local floatborder = vim.g.alabaster_floatborder and { bg = bg, fg = "#999999" }
		or {
			bg = float_bg,
			fg = float_bg,
		}
	theme = {
		Comment = { fg = comment_fg },
		ColorColumn = { bg = "#E2EEEE" },
		Conceal = { fg = "#dedede" },
		Cursor = { bg = "#83a598", fg = "#bfdbfe" },
		-- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
		CursorColumn = { bg = "#E2EEEE" },
		CursorLine = { bg = "#E2EEEE" },
		Directory = { fg = ansi.blue },
		DiffAdd = { bg = "#ADFFB7", fg = "#0A7816" },
		DiffDelete = { bg = "#F8B28F", fg = "#872C28" },
		DiffText = { fg = "#fff987", bg = "#876004" },
		DiffChange = { bg = "#fff987", fg = "#504945" },
		EndOfBuffer = { fg = "#b6b6b6" },
		-- TermCursor   { }, -- cursor in a focused terminal
		TermCursorNC = { fg = bg, bg = fg },
		ErrorMsg = { fg = error, bg = mistake.bg },
		VertSplit = { fg = "#abbdc0" },
		Folded = { bg = "#dddddd", fg = "#83a598" },
		FoldColumn = { bg = bg, fg = "#504945" },
		SignColumn = {},
		IncSearch = { bg = active, fg = fg },
		-- Substitute   { }, -- |:substitute| replacement text highlighting
		LineNr = { fg = "#7d7c7c" },
		CursorLineNr = { fg = ansi.blue, bold = 1 },
		MatchParen = { underline = 1, sp = active },
		-- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea      { }, -- Area for messages and cmdline
		-- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg = { fg = ansi.green, bold = 1 },
		NonText = { fg = "#665c54" },
		Normal = { bg = bg, fg = fg },
		NormalFloat = { bg = float_bg },
		-- NormalNC     { }, -- normal text in non-current windows
		FloatBorder = floatborder,
		Pmenu = { bg = pmenu_bg },
		PmenuSel = { bg = "#c7c7c7" },
		PmenuSbar = { bg = "#777777" },
		PmenuThumb = { bg = "#504945" },
		Question = { fg = ansi.green },
		QuickFixLine = { bg = "#E2EEEE" },
		Search = { bg = "#fae9b7", fg = fg },
		SpecialKey = { fg = ansi.cyan },
		SpellBad = { undercurl = 1, sp = ansi.red },
		SpellCap = { undercurl = 1, sp = ansi.blue },
		SpellLocal = { undercurl = 1, sp = ansi.cyan },
		SpellRare = { undercurl = 1, sp = ansi.magenta },
		StatusLine = { bg = statusline, fg = fg },
		StatusLineNC = { bg = statusline, fg = "#9f9f9f" },
		TabLine = { bg = statusline, fg = "#83a598" },
		TabLineFill = { bg = statusline },
		TabLineSel = { bg = statusline, fg = ansi.blue },
		Title = { fg = const_fg },
		Visual = { bg = "#bfdbfe" },
		VisualNOS = { bg = "#bfdbfe" },
		WarningMsg = { fg = "#e1ad4c" },
		WildMenu = { bg = "#999999" },
		WinBar = { bg = bg, fg = ansi.black, bold = true },
		WinBarNC = { bg = bg, fg = "#83a598" },

		--- SYNTAX I: TS groups link to these
		Constant = { fg = const_fg },
		String = { fg = string_fg },
		Character = { fg = const_fg },
		Number = { fg = const_fg },
		Boolean = { fg = const_fg },
		Float = { fg = const_fg },
		Operator = { fg = punct_fg },

		--- SYNTAX II: TS groups have their own definition, the below are defined to have somewhat working hl w/o treesitter
		Identifier = { fg = ansi.black },
		Function = { fg = def_fg },
		Statement = { fg = ansi.black },
		Conditional = { fg = ansi.black },
		Repeat = { fg = ansi.black },
		Label = { fg = def_fg },
		Keyword = { fg = ansi.black },
		Exception = { fg = ansi.black },
		PreProc = { fg = ansi.black },
		Include = { fg = ansi.black },
		Define = { fg = ansi.black },
		Macro = { fg = ansi.black },
		PreCondit = { fg = ansi.black },
		Type = { fg = ansi.black },
		StorageClass = { fg = ansi.black },
		Structure = { fg = def_fg },
		Typedef = { fg = def_fg },

		Special = { fg = ansi.yellow },
		-- TODO better color than diffchange, try reddish
		-- SpecialChar = { fg = diffchange }, --  special character in a constant
		-- Tag            { }, --    you can use CTRL-] on this
		-- Delimiter      { },
		SpecialComment = { bg = "#FFDEAA", fg = ansi.blue },
		debugPc = { bg = "#C7C7EE" },
		debugBreakpoint = { bg = "#F8B28F" },
		helpHyperTextJump = { fg = ansi.magenta },
		helpSectionDelim = { fg = ansi.magenta },
		helpExample = { fg = ansi.cyan },
		helpCommand = { fg = ansi.cyan },
		helpHeadline = { fg = ansi.blue },
		helpHeader = { fg = ansi.magenta },

		Underlined = { underline = 1 }, -- (preferred) text that stands out, HTML links
		Italic = { italic = 1 },

		-- ("Ignore", below, may be invisible...)
		-- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

		Error = { bg = mistake.bg, fg = mistake.fg },

		Todo = { bg = "#FFDEAA", fg = ansi.blue },

		--- Diagnostic
		LspReferenceText = { bg = "#dadada" },
		LspReferenceRdad = { bg = "#dadada" },
		LspReferenceWrite = { bg = "#dadada", underline = 1, sp = active_blue },
		LspCodeLens = { fg = "#999999" },
		LspCodeLensSeparator = { fg = "#999999" },

		--- Diagnostic
		DiagnosticError = { fg = error },
		DiagnosticWarn = { fg = warn },
		DiagnosticHint = { fg = hint },
		DiagnosticInfo = { fg = info },
		DiagnosticVirtualTextError = { bg = "#F8B28F", fg = "#411414" },
		DiagnosticVirtualTextWarn = { bg = "#fff987", fg = fg },
		DiagnosticVirtualTextHint = { fg = "#0F171D", bg = "#C3D0DA" },
		DiagnosticVirtualTextInfo = { bg = "#ADFFB7", fg = "#042F09" },

		--- Treesitter
		TSAttribute = {},
		TSConstructor = { fg = ansi.black },
		TSConditional = { fg = ansi.black },
		TSConstBuiltin = { fg = const_fg },
		TSConstMacro = { fg = ansi.black },
		TSError = { bg = mistake.bg, fg = mistake.fg },
		TSException = { fg = ansi.black },
		TSField = { fg = ansi.black },
		TSFunction = { fg = ansi.black },
		TSFuncBuiltin = { fg = ansi.black },
		TSFuncMacro = { fg = ansi.black },
		TSKeyword = { fg = ansi.black },
		TSKeywordFunction = { fg = ansi.black },
		TSLabel = { fg = ansi.black },
		TSMethod = { fg = ansi.black },
		TSNamespace = { fg = ansi.black },
		TSNone = { fg = const_fg },
		TSParameter = { fg = ansi.black },
		TSParameterReference = { fg = ansi.black },
		TSProperty = { fg = ansi.black },
		TSPunctDelimiter = { fg = punct_fg },
		TSPunctBracket = { fg = punct_fg },
		TSPunctSpecial = { fg = punct_fg },
		TSRepeat = { fg = ansi.black },
		TSString = { fg = string_fg },
		TSStringRegex = { bg = bg, fg = "#777777" },
		TSStringEscape = { bg = bg, fg = "#777777" },
		TSSymbol = {},
		TSType = { fg = ansi.black },
		TSTypeBuiltin = { fg = ansi.black },
		TSVariable = { fg = ansi.black },
		TSVariableBuiltin = { fg = ansi.black },
		TSTag = { fg = ansi.black },
		TSTagDelimiter = { fg = punct_fg },
		TSText = { fg = ansi.black },

		["@attribute"] = {},
		["@constructor"] = { fg = ansi.black },
		["@conditional"] = { fg = ansi.black },
		["@constant.builtin"] = { fg = const_fg },
		["@constant.macro"] = { fg = ansi.black },
		["@error"] = { bg = mistake.bg, fg = mistake.fg },
		["@exception"] = { fg = ansi.black },
		["@field"] = { fg = ansi.black },
		["@function"] = { fg = ansi.black },
		["@function.builtin"] = { fg = ansi.black },
		["@function.macro"] = { fg = ansi.black },
		["@keyword"] = { fg = ansi.black },
		["@keyword.function"] = { fg = ansi.black },
		["@label"] = { fg = ansi.black },
		["@method"] = { fg = ansi.black },
		["@module"] = { fg = ansi.black },
		["@namespace"] = { fg = ansi.black },
		["@none"] = { fg = const_fg },
		["@parameter"] = { fg = ansi.black },
		["@parameter.reference"] = { fg = ansi.black },
		["@property"] = { fg = ansi.black },
		["@punctuation.delimiter"] = { fg = punct_fg },
		["@punctuation.bracket"] = { fg = punct_fg },
		["@punctuation.special"] = { fg = punct_fg },
		["@repeat"] = { fg = ansi.black },
		["@string"] = { fg = string_fg },
		["@string.regex"] = { bg = bg, fg = "#777777" },
		["@string.escape"] = { bg = bg, fg = "#777777" },
		["@symbol"] = {},
		["@type"] = { fg = ansi.black },
		["@type.builtin"] = { fg = ansi.black },
		["@variable"] = { fg = ansi.black },
		["@variable.builtin"] = { fg = ansi.black },
		["@tag"] = { fg = ansi.black },
		["@tag.delimiter"] = { fg = punct_fg },
		["@text"] = { fg = ansi.black },
		["@text.note"] = { bg = "#dddddd", fg = ansi.blue },
		["@text.warning"] = { bg = "#FFDEAA", fg = ansi.blue },

		--- Theme specific
		["@GruvboxAlabasterConstant"] = { fg = const_fg },
		["@GruvboxAlabasterDefinition"] = { fg = def_fg },
		["@GruvboxAlabasterPunct"] = { fg = punct_fg },
		["@GruvboxAlabasterString"] = { fg = string_fg },
		["@GruvboxAlabasterHashbang"] = { fg = dim_comment },
		--- Gitsigns
		GitSignsAdd = { fg = "#689d6a" },
		GitSignsChange = { fg = diffchange },
		GitSignsDelete = { fg = diffdelete },
		--- Telescope
		TelescopeBorder = { fg = "#abbdc0" },
		TelescopeMatching = { fg = "#CC6F14" },
		TelescopeMultiSelection = { fg = ansi.magenta },
		TelescopePromptPrefix = { fg = ansi.blue },
		TelescopeSelectionCaret = { fg = mistake.fg },
		TelescopeTitle = { fg = ansi.yellow },
		TelescopeResultsTitle = { fg = ansi.yellow },
		--- fzf-lua
		FzfLuaBorder = { fg = "#abbdc0" },
		--- Neogit
		NeogitPopupActionDisabled = { fg = darker_fg },
		NeogitPopupActionKey = { fg = ansi.magenta },
		NeogitPopupOptionDisabled = { fg = darker_fg },
		NeogitPopupOptionKey = { fg = ansi.blue },
		NeogitPopupSwitchDisabled = { fg = darker_fg },
		NeogitPopupSwitchEnabled = { fg = ansi.cyan },
		NeogitPopupSwitchKey = { fg = ansi.magenta },
		--- Fugitive
		diffAdded = { link = "DiffAdd" },
		diffRemoved = { link = "DiffDelete" },
		--- Startify
		StartifyBracket = { fg = darker_fg },
		StartifyFile = { fg = ansi.black },
		StartifySection = { fg = ansi.green },
		StartifySlash = { fg = "#4e6e75" },
		StartifyPath = { fg = "#4e6e75" },
		--- Statusline
		StatuslineAdd = { fg = diffadd, bg = statusline },
		StatuslineErr = { fg = "#8E1410", bg = statusline },
		StatuslineHint = { fg = hint, bg = statusline },
		StatuslineInfo = { fg = info, bg = statusline },
		StatuslineWarn = { fg = warn, bg = statusline },
		StatuslineBlue = { fg = ansi.blue, bg = statusline },
		StatuslineRed = { fg = ansi.red, bg = statusline },
		StatuslineGreen = { fg = ansi.green, bg = statusline },
		StatuslineCyan = { fg = ansi.cyan, bg = statusline },
		StatuslineMagenta = { fg = ansi.magenta, bg = statusline },
		--- ALE
		ALEWarningSign = { fg = warn },
		--- vim-matchup
		MatchupVirtualText = { fg = ansi.yellow },
		--- For `highlight link`
		GruvboxAlabasterBlack = { fg = ansi.black },
		GruvboxAlabasterBlue = { fg = ansi.blue },
		GruvboxAlabasterBrightYellow = { fg = ansi.brightyellow },
		GruvboxAlabasterCyan = { fg = ansi.cyan },
		GruvboxAlabasterGreen = { fg = ansi.green },
		GruvboxAlabasterBrightGreen = { fg = "#8ec07c" },
		GruvboxAlabasterMagenta = { fg = ansi.magenta },
		GruvboxAlabasterRed = { fg = ansi.red },
		GruvboxAlabasterWhite = { fg = ansi.black },
		GruvboxAlabasterYellow = { fg = ansi.yellow },
		--- Hop
		HopNextKey = { fg = ansi.yellow },
		HopNextKey1 = { fg = ansi.blue },
		HopNextKey2 = { fg = "#17A2D6" },
		HopUnmatched = { fg = "#bfbfbf" },
		--- Lightspeed
		LightspeedGreyWash = { fg = "#bfbfbf" },
		--- checkhealth
		healthSuccess = { fg = ansi.green, bg = bg },
		--- cmp
		CmpItemMenuDefault = { fg = ansi.magenta },
		--- nvim-ts-rainbow
		rainbowcol1 = { fg = ansi.yellow },
		rainbowcol2 = { fg = ansi.magenta },
		rainbowcol3 = { fg = ansi.blue },
		rainbowcol4 = { fg = ansi.green },
		rainbowcol5 = { fg = ansi.brightyellow },
		rainbowcol6 = { fg = ansi.red },
		rainbowcol7 = { fg = ansi.cyan },
		--- Iswap
		ISwapSnipe = { bg = ansi.yellow, fg = bg },
		ISwapGrey = { fg = "#bfbfbf" },
		--- vim-dadbod-ui
		dbui_help = { fg = dim_comment },
		dbui_connection_source = { fg = dim_comment },
		--- nvim-dap-virtual-text
		NvimDapVirtualText = { bg = "#78D2C9", fg = fg },
		--- Noice
		NoiceCmdlineIcon = { link = "GruvboxAlabasterBrightGreen" },
		NoiceCmdlinePopupBorder = { link = "GruvboxAlabasterBrightGreen" },
		NoiceConfirmBorder = { link = "GruvboxAlabasterBrightGreen" },
		NoiceCmdlinePopupBorderCmdline = { link = "GruvboxAlabasterBrightGreen" },
		NoiceCmdlineIconCmdline = { link = "GruvboxAlabasterBrightGreen" },
		NoiceCmdlinePopupBorderFilter = { link = "GruvboxAlabasterBrightGreen" },
		NoiceCmdlineIconFilter = { link = "GruvboxAlabasterBrightGreen" },
		NoiceCmdlinePopupBorderLua = { link = "GruvboxAlabasterBrightGreen" },
		NoiceCmdlineIconLua = { link = "GruvboxAlabasterBrightGreen" },
		NoiceCmdlinePopupBorderSearch = { link = "GruvboxAlabasterYellow" },
		NoiceCmdlineIconSearch = { link = "GruvboxAlabasterYellow" },
		-- Languages
		--- asm
		asmDirective = { fg = dim_comment },
		nasmLabel = { link = "@GruvboxAlabasterDefinition" },
		["@lsp.mod.declaration"] = { fg = fg },
		["@lsp.type.enumMember"] = { fg = fg },
		["@lsp.type.function"] = { fg = fg },
		["@lsp.type.method"] = { fg = fg },
		["@lsp.type.selfKeyword"] = { fg = fg },
		["@lsp.typemod.class.declaration"] = { fg = def_fg },
		["@lsp.typemod.class.definition"] = { fg = def_fg },
		["@lsp.typemod.enum.declaration"] = { fg = def_fg },
		["@lsp.typemod.enumMember.defaultLibrary"] = { fg = fg },
		["@lsp.typemod.function.declaration"] = { fg = def_fg },
		["@lsp.typemod.function.definition"] = { fg = def_fg },
		["@lsp.typemod.macro.declaration"] = { fg = def_fg },
		["@lsp.typemod.method.declaration"] = { fg = def_fg },
		["@lsp.typemod.selfKeyword"] = { fg = fg },
		["@lsp.typemod.struct.declaration"] = { fg = def_fg },
		["@lsp.typemod.type.declaration"] = { fg = def_fg },
	}
end

for group, hl in pairs(theme) do
	vim.api.nvim_set_hl(0, group, hl)
end

-- vi:nowrap
