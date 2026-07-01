if not mods["no-pipe-touching"] then return end

local pipe_str = "pipe"
local pitg_str = "pipe-to-ground"

data.raw[pipe_str]["F077UP-underwater-" .. pipe_str]["npt_compat"] = { override = pipe_str, override_underground = pitg_str }
data.raw[pitg_str]["F077UP-underwater-" .. pitg_str]["npt_compat"] = { override = pipe_str, override_underground = pitg_str }
