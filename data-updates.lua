local pipe_str = "pipe"
local pitg_str = "pipe-to-ground"

require("scripts.data-stage.modder").make_underwater_variants({
    { item = data.raw["item"][pipe_str], entity = data.raw[pipe_str][pipe_str], options = { use_default_recipe = true } },
    { item = data.raw["item"][pitg_str], entity = data.raw[pitg_str][pitg_str], options = { use_default_recipe = true } },
})

require("compatibilities.data-stage-02.space-age")
require("compatibilities.data-stage-02.no-pipe-touching")
