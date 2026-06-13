local data_carrier = data.raw["mod-data"]["F077UP-data-carrier"]

local definitions = require("scripts.var.definitions")

local guess_type = { "pump", "pipe", "pipe-to-ground" }

--- @param name string
---
--- @return string?
---
local function guess_entity_type(name)
    ---
    for __, type in ipairs(guess_type) do
        --
        if data.raw[type][name] then return type end
    end
end

--- @return (string|function)?
---
local function iterate_underwater_entities()

    local index = 0

    return function() while true do index = index + 1

        local name = data_carrier.data.underwater_entities[index]

        if name == nil then return nil, nil end --- OUT_OF_BOUNDS

        return name, data.raw[guess_entity_type(name)][name]
    end
    end
end

local module = {}

function module.reset_collision_masks()
    ---
    for __, entity in iterate_underwater_entities() do
        --
        if entity then entity.collision_mask = definitions.base_collision_mask end
    end
end

--- @param layer string
---
function module.insert_collision_layer(layer)
    ----
    definitions.base_collision_mask["layers"][layer] = true; module.reset_collision_masks()
end

--- @param layer string
---
function module.remove_collision_layer(layer)
    ----
    definitions.base_collision_mask["layers"][layer] = nil; module.reset_collision_masks()
end

return module