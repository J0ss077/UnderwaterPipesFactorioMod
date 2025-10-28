--// prototypes

require("prototypes.technology")

require("prototypes.data-carrier")

--// variants

local pipe_str = "pipe"

local pitg_str = "pipe-to-ground"

require("scripts.data-stage.modder").make_underwater_variant({
    {
        item = data.raw["item"][pipe_str],
        --
        entity = data.raw[pipe_str][pipe_str],
        --
        options = { use_default_recipe = true }
    },
    {
        item = data.raw["item"][pitg_str],
        --
        entity = data.raw[pitg_str][pitg_str],
        --
        options = { use_default_recipe = true }
    },
})

--// compatibilities

require("compatibilities.space-age")

require("compatibilities.no-pipe-touching")
