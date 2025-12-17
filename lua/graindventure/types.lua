--- @class graindventure.ConfigTable Holds the configuration species.
--- @field bolds? graindventure.ConfigGroups: Which items must be bold.
--- @field italics? graindventure.ConfigGroups: Which items must be italic.
--- @field transparents? graindventure.Transparents: Which fields are expected to be transparent.

--- @class graindventure.ConfigGroups Holds all possible groups that a spec can be set.
--- @field [integer] graindventure.GroupSet: The groups set.

--- @alias graindventure.GroupSet "conditional" | "class" | "comment" | "annotation" | "struct" | "function"

--- @class graindventure.Transparents
--- @field [integer] graindventure.TransparentSet: Fields that are expected to be transparent.

--- @alias graindventure.TransparentSet "bg" | "float" | "terminal"
