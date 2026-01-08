local tables = require("graindventure.utils.table")
local coloring = require("graindventure.utils.coloring")

--- Function that returns the default neovim's highlight groups. Can
--- be found by running `:help highlight-groups`.
--- @param palette graindventure.ColorPalette
--- @param config graindventure.ConfigTable
--- @return graindventure.GroupsData
local M = function(palette, config)
	local bolds = config.bolds or {}
	local transparents = config.transparents or {}
	local win_separator, cursor_line_nr, transparent_bg,
	match_paren, mode_msg, transparent_float, title
	win_separator = tables.contains(bolds, "win_separator")
	cursor_line_nr = tables.contains(bolds, "cursor_line_nr")
	transparent_bg = tables.contains(transparents, "bg")
	transparent_float = tables.contains(transparents, "float")
	match_paren = tables.contains(bolds, "match_paren")
	mode_msg = tables.contains(bolds, "mode_msg")
	title = tables.contains(bolds, "title")
	return {
		ColorColumn = { fg = palette.none, bg = palette.strongBackground },
		Conceal = "Normal",
		CurSearch = { fg = palette.blue, bg = palette.yellow },
		Cursor = { fg = palette.background, bg = palette.foreground },
		lCursor = "Cursor",
		CursorIM = "Cursor",
		CursorColumn = { bg = palette.strongBackground },
		CursorLine = { bg = palette.strongBackground },
		Directory = { fg = palette.cyan },
		DiffAdd = { bg = coloring.blend(palette.background, palette.green, 0.25) },
		DiffChange = { bg = coloring.blend(palette.background, palette.cyan, 0.25) },
		DiffDelete = { bg = coloring.blend(palette.background, palette.red, 0.25) },
		DiffText = { bg = palette.cyan },
		DiffTextAdd = { bg = palette.cyan, fg = palette.blue },
		EndOfBuffer = { fg = palette.weakForeground },
		TermCursor = { fg = palette.foreground },
		ErrorMsg = { fg = palette.red },
		StderrMsg = { fg = palette.red },
		StdoutMsg = { fg = palette.foreground },
		WinSeparator = { fg = palette.strongBackground, bold = win_separator },
		Folded = { fg = palette.cyan, bg = coloring.blend(palette.background, palette.blue, 0.15) },
		FoldColumn = { bg = transparent_bg and palette.none or palette.background, fg = palette.weakForeground },
		SignColumn = { bg = transparent_bg and palette.none or palette.background, fg = palette.weakForeground },
		IncSearch = { bg = palette.red, fg = palette.background },
		Substitute = { bg = palette.red, fg = palette.background },
		LineNr = { fg = palette.weakForeground },
		LineNrAbove = "LineNr",
		LineNrBelow = "LineNr",
		CursorLineNr = { fg = palette.red, bold = cursor_line_nr },
		CursorLineFold = "LineNr",
		CursorLineSign = "LineNr",
		MatchParen = { fg = palette.red, bold = match_paren },
		ModeMsg = { fg = palette.background, bold = mode_msg },
		MsgArea = { fg = palette.foreground },
		MsgSeparator = { fg = palette.strongBackground },
		MoreMsg = { fg = palette.blue },
		NonText = { fg = palette.weakForeground },
		Normal = { fg = palette.foreground, bg = transparent_bg and palette.none or palette.background },
		NormalFloat = { fg = palette.foreground, bg = transparent_float and palette.none or palette.background },
		FloatBorder = { fg = palette.red, bg = transparent_float and palette.none or palette.background },
		FloatTitle = { fg = palette.red, bg = transparent_float and palette.none or palette.background },
		FloatFooter = { fg = palette.weakForeground, bg = transparent_float and palette.none or palette.background },
		NormalNC = "Normal",
		Pmenu = "Normal",
		PmenuSel = { fg = palette.foreground, bg = coloring.blend(palette.background, palette.yellow, 0.25) },
		PmenuKind = { fg = palette.red },
		PmenuKindSel = "PmenuKind",
		-- TODO: add this PmenuExtra = ...
		-- TODO: add this PmenuExtraSel = ...
		PmenuSbar = { bg = palette.strongBackground },
		PmenuThumb = { bg = coloring.lighten(palette.strongBackground, 0.25) },
		PmenuMatch = { fg = palette.cyan },
		PmenuMatchSel = "PmenuMatch",
		-- TODO: add this ComplMatchIns = ...
		Question = { fg = palette.cyan },
		-- TODO: add this QuickFixLine = ...
		Search = { fg = palette.black, bg = palette.yellow },
		-- TODO: add this SnippetTabstop = ...
		SpecialKey = { fg = palette.weakForeground },
		SpellBad = { sp = palette.red, undercurl = true },
		SpellCap = { sp = palette.yellow, undercurl = true },
		SpellLocal = { sp = palette.blue, undercurl = true },
		SpellRare = { sp = palette.green, undercurl = true },
		StatusLine = { fg = palette.foreground, bg = palette.background },
		StatusLineNC = "StatusLine",
		StatusLineTerm = "StatusLine",
		StatusLineTermNC = "StatusLine",
		TabLine = { fg = palette.weakForeground, bg = palette.background },
		TabLineFill = { bg = transparent_bg and palette.none or palette.strongBackground },
		TabLineSel = { fg = palette.foreground, bg = palette.background },
		Title = { fg = palette.red, bold = title },
		Visual = { fg = palette.blue, bg = coloring.blend(palette.background, palette.red, 0.25) },
		VisualNOS = "Visual",
		WarningMsg = { fg = palette.yellow },
		Whitespace = { fg = palette.weakForeground },
		-- TODO: add WildMenu = ...
		WinBar = "StatusLine",
		WinBarNC = "WinBar",
		-- TODO: add Menu = ...
		-- TODO: add Scrollbar = ...
		-- TODO: add Tooltip = ...
	}
end

return M
