require("prototypes.data-carrier")

local modder = require("scripts.data-stage.modder")

-- entity

local enty_underwater_pipe = modder.make_underwater_entity(data.raw["pipe"]["pipe"])
local enty_underwater_pitg = modder.make_underwater_entity(data.raw["pipe-to-ground"]["pipe-to-ground"])
data:extend({ enty_underwater_pipe, enty_underwater_pitg })

-- item

local item_underwater_pipe = modder.make_underwater_item(data.raw["item"]["pipe"])
local item_underwater_pitg = modder.make_underwater_item(data.raw["item"]["pipe-to-ground"])
data:extend({ item_underwater_pipe, item_underwater_pitg })

-- recipe

local reci_underwater_pipe = modder.make_underwater_recipe(data.raw["recipe"]["pipe"])
local reci_underwater_pitg = modder.make_underwater_recipe(data.raw["recipe"]["pipe-to-ground"])
data:extend({ reci_underwater_pipe, reci_underwater_pitg })

-- technology

data:extend({
    {
        type = "technology",
        name = "underwater-pipes",
        prerequisites = { "concrete", "steel-processing" },
        icon = "__underwater-pipes-updated__/graphics/technology.png",
        icon_size = 128,
        unit = {
            time = 30,
            count = 100,
            ingredients = {
                { "logistic-science-pack",   1 },
                { "automation-science-pack", 1 },
            },
        },
        effects = {},
    },
})

if not reci_underwater_pipe.enabled then
    --
    table.insert(data.raw["technology"]["underwater-pipes"].effects, { type = "unlock-recipe", recipe = reci_underwater_pipe.name })
end

if not reci_underwater_pitg.enabled then
    --
    table.insert(data.raw["technology"]["underwater-pipes"].effects, { type = "unlock-recipe", recipe = reci_underwater_pitg.name })
end

require("compatibilities.space-age")
