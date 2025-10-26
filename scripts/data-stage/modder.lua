--// dependencies

local data_carrier = data.raw["mod-data"]["F077UP-data-carrier"]

local utils = require("scripts.others.utils")

local module = {}

--// modifications

local item_water_icon_percent_shift = { x = 0.50, y = 0.50 }

local item_water_icon_percent_scale = 0.50

local entity_sprite_blend_mode = "additive"

local entity_sprite_shift = { 0.0, 0.4 }

local entity_sprite_tint = {
    --
    a = 0.50,
    --
    r = 0.02,
    --
    g = 0.18,
    --
    b = 0.20,
}

--// placeholders

local options_placeholder = {
    --
    use_default_recipe = false
}

local entity_placeholder = {
    --
    minable = { result = "", mining_time = 00.10 }
}

local recipe_placeholder = {
    --
    type = "recipe",
    --
    enabled = false,
    --
    category = "advanced-crafting"
}

local item_placeholder = {
    --
    type = "item"
}

--// support functions

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

--- @param placeholder table
---
--- @param data table
---
--- @return table
---
local function implement_placeholder(placeholder, data)
    --
    local new_prototype_data = table.deepcopy(placeholder)

    for name, attr in pairs(table.deepcopy(data)) do
        --
        new_prototype_data[name] = attr
    end

    return new_prototype_data
end

--- @param prototype table
---
--- @param localization_class string
---
--- @param localization_name string
---
local function assign_prototype_localised_name(prototype, localization_class, localization_name)
    --
    prototype.localised_name = prototype.localised_name or { localization_class .. "." .. localization_name }
    --
    prototype.localised_name = { "", prototype.localised_name, " ", { localization_class .. "." .. "F077UP-underwater-postfix" } }
end

--// module functions

--- @param coll table
---
function module.make_underwater_variant(coll)
    --
    for i1, objs in ipairs(coll) do
        --
        for i2, elem in ipairs(objs) do
            --
            if type(elem) ~= "table" then error("all data must be tables !!") end
        end

        local options = implement_placeholder(options_placeholder, objs.options or {})

        local new_entity_prototype = implement_placeholder(entity_placeholder, objs.entity or {})

        new_entity_prototype.name = "F077UP-underwater-" .. new_entity_prototype.name

        assign_prototype_localised_name(new_entity_prototype, "entity-name", objs.entity.name)

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

        data:extend({ new_entity_prototype })

        ------------------------------------------------------------------------------
        table.insert(data_carrier.data.underwater_entities, new_entity_prototype.name)
        ------------------------------------------------------------------------------

        if not objs.item then goto F077UP_continue_001 end

        local new_item_prototype = implement_placeholder(item_placeholder, objs.item or {})

        new_item_prototype.name = "F077UP-underwater-" .. new_item_prototype.name

        assign_prototype_localised_name(new_item_prototype, "item-name", objs.item.name)

        utils.parse_item_icons(new_item_prototype)

        local icon_size = new_item_prototype.icons[1].icon_size or 64

        --local icon_scale = new_item_prototype.icons[1].scale or 0.5

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

        new_item_prototype.place_result = new_entity_prototype.name

        data:extend({ new_item_prototype })

        -------------------------------------------------------------
        new_entity_prototype.minable.result = new_item_prototype.name
        -------------------------------------------------------------

        if not (objs.recipe or options.use_default_recipe) then goto F077UP_continue_001 end

        local new_recipe_prototype = implement_placeholder(recipe_placeholder, objs.recipe or {})

        new_recipe_prototype.name = new_recipe_prototype.name and ("F077UP-underwater-" .. new_recipe_prototype.name) or new_item_prototype.name

        assign_prototype_localised_name(new_recipe_prototype, "recipe-name", objs.recipe and objs.recipe.name or objs.item.name)

        new_recipe_prototype.ingredients = new_recipe_prototype.ingredients or {
            --
            { type = "item", name = objs.item.name, amount = 02 },
            --
            { type = "item", name = "steel-plate",  amount = 05 },
            --
            { type = "item", name = "concrete",     amount = 20 },
        }

        new_recipe_prototype.results = { { type = "item", name = new_item_prototype.name, amount = 1 } }

        data:extend({ new_recipe_prototype })

        ::F077UP_continue_001::
    end
end

return module
