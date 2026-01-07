--- @class graindventure.ConfigTable Holds the configuration species.
--- @field termgui? boolean: If termgui is enabled.
--- @field bolds? graindventure.ConfigGroups: Which items must be bold.
--- @field italics? graindventure.ConfigGroups: Which items must be italic.
--- @field transparents? graindventure.Transparents: Which fields are expected to be transparent.
--- @field paletteExtend? graindventure.ColorPalette: Color palette to extends into default one.
--- @field groupsExtend? graindventure.GroupsData: Mapping to extends the default groups.

--- @alias graindventure.GroupsData table<string, string | table>

--- @class graindventure.ConfigGroups Holds all possible groups that a spec can be set.
--- @field [integer] graindventure.GroupSet: The groups set.

--- @alias graindventure.GroupSet "conditional" | "class" | "comment" | "annotation" | "struct" | "function"

--- @class graindventure.Transparents
--- @field [integer] graindventure.TransparentSet: Fields that are expected to be transparent.

--- @alias graindventure.TransparentSet "bg" | "float" | "terminal"

--- @class graindventure.ColorPalette The color palette class.
--- @field none? string: "NONE" value.
--- @field foreground? string: default text foreground color.
--- @field weakForeground? string: default text foreground color (for weak text).
--- @field background? string: default background color.
--- @field strongBackground? string: default background color (for emphasis blocks).
--- @field black? string: ansi black color.
--- @field red? string: ansi red color.
--- @field green? string: ansi green color.
--- @field yellow? string: ansi yellow color.
--- @field blue? string: ansi blue color.
--- @field magenta? string: ansi magenta color.
--- @field cyan? string: ansi cyan color.
--- @field white? string: ansi white color.
--- @field [string]? string: any other color added color.
