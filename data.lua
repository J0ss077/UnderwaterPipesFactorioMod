--// dependencies

require("prototypes.data-carrier")

--// variants

require("scripts.data-stage.modder").make_underwater_variant({
    {
        options = { use_default_recipe = true }, item = data.raw["item"]["pipe"], entity = data.raw["pipe"]["pipe"]
    },
    {
        options = { use_default_recipe = true }, item = data.raw["item"]["pipe-to-ground"], entity = data.raw["pipe-to-ground"]["pipe-to-ground"]
    },
})

-- technology

data:extend({
    {
        type = "technology",
        name = "F077UP-technology",
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

--// recipe unlocks

if not data.raw["recipe"]["F077UP-underwater-pipe"].enabled then
    --
    table.insert(data.raw["technology"]["F077UP-technology"].effects, { type = "unlock-recipe", recipe = "F077UP-underwater-pipe" })
end

if not data.raw["recipe"]["F077UP-underwater-pipe-to-ground"].enabled then
    --
    table.insert(data.raw["technology"]["F077UP-technology"].effects, { type = "unlock-recipe", recipe = "F077UP-underwater-pipe-to-ground" })
end

--// compatibilities

require("compatibilities.space-age")
