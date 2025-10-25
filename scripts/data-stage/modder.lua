local data_carrier = data.raw["mod-data"]["underwater-pipes-data-carrier"]

local utils = require("scripts.others.utils")

local module = {}

local item_water_icon_percent_shift = { x = 0.50, y = 0.50 }

local item_water_icon_percent_scale = 0.50

local entity_sprite_blend_mode = "additive"

local entity_sprite_shift = { 0.0, 0.4 }

local entity_sprite_tint = {
    --
    a = 0.50,
    r = 0.02,
    g = 0.18,
    b = 0.20,
}

--- @param sprite_name string
---
--- @param sprite data.SpritePrototype
---
local function mod_entity_sprite(sprite_name, sprite)
    --
    if string.find(sprite_name, "_visualization") then return end

    sprite.blend_mode = entity_sprite_blend_mode

    sprite.shift = entity_sprite_shift

    sprite.tint = entity_sprite_tint
end

--- @param entity_prototype data.PipePrototype | data.PipeToGroundPrototype
---
--- @return data.PipePrototype | data.PipeToGroundPrototype
---
function module.make_underwater_entity(entity_prototype)
    --
    local new_entity_prototype = table.deepcopy(entity_prototype)

    new_entity_prototype.name = "underwater-" .. new_entity_prototype.name

    for cover_name, cover in pairs(new_entity_prototype.fluid_box.pipe_covers) do
        --
        for layer_name, layer in pairs(cover.layers) do
            --
            mod_entity_sprite(layer_name, layer)
        end
    end

    for picture_name, picture in pairs(new_entity_prototype.pictures) do
        --
        mod_entity_sprite(picture_name, picture)
    end

    new_entity_prototype.collision_mask = { layers = { ground_tile = true } }

    new_entity_prototype.minable.result = "underwater-" .. new_entity_prototype.minable.result

    table.insert(data_carrier.data.underwater_entities, new_entity_prototype.name)

    return new_entity_prototype
end

--- @param item_prototype data.ItemPrototype
---
--- @return data.ItemPrototype
---
function module.make_underwater_item(item_prototype)
    --
    local new_item_prototype = table.deepcopy(item_prototype)

    new_item_prototype.name = "underwater-" .. new_item_prototype.name

    new_item_prototype.place_result = "underwater-" .. new_item_prototype.place_result

    utils.parse_item_icons(new_item_prototype)

    local icon_size = new_item_prototype.icons[1].icon_size or 64

    local icon_scale = new_item_prototype.icons[1].scale or 0.5

    table.insert(new_item_prototype.icons, {
        --
        icon = "__base__/graphics/icons/fluid/water.png",
        --
        icon_size = 64,
        --
        floating = true,
        --
        draw_background = false,
        --
        scale = (icon_size / 64) * 0.50 * item_water_icon_percent_scale,
        --
        shift = {
            --
            -(icon_size / 4) * item_water_icon_percent_shift.x,
            --
            -(icon_size / 4) * item_water_icon_percent_shift.y,
        },
    })

    return new_item_prototype
end

--- @param recipe_prototype data.RecipePrototype
---
--- @return data.RecipePrototype
---
function module.make_underwater_recipe(recipe_prototype)
    --
    local new_recipe_prototype = table.deepcopy(recipe_prototype)

    new_recipe_prototype.name = "underwater-" .. new_recipe_prototype.name

    new_recipe_prototype.ingredients = {
        --
        { type = "item", name = recipe_prototype.name, amount = 02 },
        --
        { type = "item", name = "steel-plate",         amount = 05 },
        --
        { type = "item", name = "concrete",            amount = 20 },
    }

    new_recipe_prototype.results = {
        --
        { type = "item", name = new_recipe_prototype.name, amount = 1 },
    }

    return new_recipe_prototype
end

return module
