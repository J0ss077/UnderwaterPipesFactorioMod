data:extend({
    {
        type = "pump",

        name = "F077UP-pressure-pump",

        icon = "__base__/graphics/icons/pump.png",

        flags = { "placeable-neutral", "player-creation" },

        energy_usage = "30kW",

        energy_source = { type = "void" },

        pumping_speed = 05,

        selection_box = { { -0.5, -1 }, { 0.5, 1 } },

        collision_box = { { -0.29, -0.9 }, { 0.29, 0.9 } },

        collision_mask = { layers = { underwater_pipeline = true } },

        corpse = "pump-remnants",

        dying_explosion = "pump-explosion",

        open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.5 },

        close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.29 },

        working_sound = { max_sounds_per_prototype = 2, sound = { audible_distance_modifier = 0.5, filename = "__base__/sound/pump.ogg", volume = 0.1 } },

        fluid_box = {

            volume = 400,
            pipe_connections = {
                { direction = defines.direction.north, flow_direction = "output", position = { 0, 0 - 0.5 } },
                { direction = defines.direction.south, flow_direction = "input",  position = { 0, 0 + 0.5 } },
            },
            pipe_covers = {
                north = {
                    layers = {
                        { filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north.png",        height = 128, priority = "extra-high", scale = 0.5, width = 128 },
                        { filename = "__base__/graphics/entity/pipe-covers/pipe-cover-north-shadow.png", height = 128, priority = "extra-high", scale = 0.5, width = 128, draw_as_shadow = true }
                    }
                },
                south = {
                    layers = {
                        { filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south.png",        height = 128, priority = "extra-high", scale = 0.5, width = 128 },
                        { filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south-shadow.png", height = 128, priority = "extra-high", scale = 0.5, width = 128, draw_as_shadow = true }
                    }
                },
                east = {
                    layers = {
                        { filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east.png",        height = 128, priority = "extra-high", scale = 0.5, width = 128 },
                        { filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east-shadow.png", height = 128, priority = "extra-high", scale = 0.5, width = 128, draw_as_shadow = true }
                    }
                },
                west = {
                    layers = {
                        { filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west.png",        height = 128, priority = "extra-high", scale = 0.5, width = 128 },
                        { filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west-shadow.png", height = 128, priority = "extra-high", scale = 0.5, width = 128, draw_as_shadow = true }
                    }
                }
            }
        },
        glass_pictures = {

            north = { filename = "__base__/graphics/entity/pump/pump-north-glass.png", height = 128, scale = 0.5, width = 64 },
            south = { filename = "__base__/graphics/entity/pump/pump-south-glass.png", height = 128, scale = 0.5, width = 64 },

            east = { filename = "__base__/graphics/entity/pump/pump-east-glass.png", height = 192, scale = 0.5, width = 128, shift = { -0.0, 0 } },
            west = { filename = "__base__/graphics/entity/pump/pump-west-glass.png", height = 192, scale = 0.5, width = 192, shift = { -0.5, 0 } },
        },
        animations = {

            north = { animation_speed = 0.5, filename = "__base__/graphics/entity/pump/pump-north.png", frame_count = 32, height = 164, line_length = 8, scale = 0.5, shift = { 0.25000000, -0.0265625 }, width = 103 },
            south = { animation_speed = 0.5, filename = "__base__/graphics/entity/pump/pump-south.png", frame_count = 32, height = 160, line_length = 8, scale = 0.5, shift = { 0.39062500, -0.2500000 }, width = 114 },

            east = { animation_speed = 0.5, filename = "__base__/graphics/entity/pump/pump-east.png", frame_count = 32, height = 109, line_length = 8, scale = 0.5, shift = { -0.0156250, 0.05468750 }, width = 130 },
            west = { animation_speed = 0.5, filename = "__base__/graphics/entity/pump/pump-west.png", frame_count = 32, height = 111, line_length = 8, scale = 0.5, shift = { -0.0078125, 0.03906250 }, width = 131 },
        },
        fluid_animation = {

            north = { filename = "__base__/graphics/entity/pump/pump-north-liquid.png", frame_count = 32, height = 22, line_length = 8, scale = 0.5, shift = { -0.0078125, -0.5234375 }, width = 38, apply_runtime_tint = true },
            south = { filename = "__base__/graphics/entity/pump/pump-south-liquid.png", frame_count = 32, height = 45, line_length = 8, scale = 0.5, shift = { 0.01562500, -0.2890625 }, width = 38, apply_runtime_tint = true },

            east = { filename = "__base__/graphics/entity/pump/pump-east-liquid.png", frame_count = 32, height = 46, line_length = 8, scale = 0.5, shift = { 0.19531250, -0.2656250 }, width = 35 },
            west = { filename = "__base__/graphics/entity/pump/pump-west-liquid.png", frame_count = 32, height = 47, line_length = 8, scale = 0.5, shift = { -0.2031250, -0.2968750 }, width = 35 },
        },
        water_reflection = {

            rotate = false, orientation_to_variation = true,

            pictures = {

                filename = "__cargo-ships-graphics__/graphics/entity/pump/pump-water-reflection.png",

                variation_count = 4, line_length = 1,

                scale = 5, shift = { 0, 0.3125 },

                height = 19, width = 19,
            },
        },
        minable = { mining_time = 0.2, result = "F077UP-pressure-pump" }
    },
    {
        type = "item",

        name = "F077UP-pressure-pump",

        stack_size = 50,

        order = "b[pipe]-c[pump]",

        subgroup = "energy-pipe-distribution",

        place_result = "F077UP-pressure-pump",

        drop_sound = { aggregation = { max_count = 1, remove = true }, filename = "__base__/sound/item/fluid-inventory-move.ogg", volume = 0.6 },

        pick_sound = { aggregation = { max_count = 1, remove = true }, filename = "__base__/sound/item/fluid-inventory-pickup.ogg", volume = 0.5 },

        icons = {
            --
            { scale = 0.50, icon = "__base__/graphics/icons/pump.png",        icon_size = 64, floating = false, draw_background = true,  shift = { -0, -0 } },
            --
            { scale = 0.25, icon = "__base__/graphics/icons/fluid/water.png", icon_size = 64, floating = true,  draw_background = false, shift = { -8, -8 } },
        },
    },
    {
        type = "recipe",

        name = "F077UP-pressure-pump",

        enabled = false,

        energy_required = 2,

        results = { { type = "item", name = "F077UP-pressure-pump", amount = 1 } },

        ingredients = {
            --
            { type = "item", name = "pump",        amount = 01 },
            --
            { type = "item", name = "steel-plate", amount = 06 },
            --
            { type = "item", name = "concrete",    amount = 15 },
        },
    },
})

--- @param sprite data.SpritePrototype
---
local function mod_entity_sprite(sprite)
    ------
    sprite.blend_mode = "additive"

    local shift = sprite.shift or { 0.0, 0.0 }; sprite.shift = { shift[1] + 0.0, shift[2] + 0.4 }

    local tint = sprite.tint or {
        r = 1.0,
        g = 1.0,
        b = 1.0,
        a = 1.0,
    }
    sprite.tint = {
        r = tint.r * 0.02,
        g = tint.g * 0.18,
        b = tint.b * 0.20,
        a = tint.a * 0.50,
    }
end

local pump = data["raw"]["pump"]["F077UP-pressure-pump"]

for n1, cover in pairs(pump.fluid_box.pipe_covers) do
    --
    for n2, layer in pairs(cover.layers) do
        --
        mod_entity_sprite(layer)
    end
end

for __, element in pairs(pump.animations)      do mod_entity_sprite(element) end

for __, element in pairs(pump.glass_pictures)  do mod_entity_sprite(element) end

for __, element in pairs(pump.fluid_animation) do mod_entity_sprite(element) end

table.insert(data.raw["mod-data"]["F077UP-data-carrier"].data.underwater_entities--[[@as table]], "F077UP-pressure-pump")