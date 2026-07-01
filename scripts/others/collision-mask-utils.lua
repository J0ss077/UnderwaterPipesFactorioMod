local data_carrier = data.raw["mod-data"]["F077UP-data-carrier"]

local definitions = require("scripts.var.definitions")

local module = {}

function module.reset_collision_masks()
    ---
    for class, list in pairs(data_carrier.data.underwater_entities--[[@as table]]) do
        --
        for i0, name in ipairs(list) do
            --
            data.raw[class][name].collision_mask = definitions.base_collision_mask
        end
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
