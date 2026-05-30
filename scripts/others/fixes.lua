local data_carrier = data.raw["mod-data"]["F077UP-data-carrier"]

local definitions = require("scripts.var.definitions")

--- @param filter string?
---
--- @return string|function
---
local function iterate_underwater_pipes(filter)

    local index = 0

    return function() while true do

        index = index + 1

        local name = data_carrier.data.underwater_entities[index]; if name == nil then return nil end

        local type = data.raw["pipe"][name] and "pipe" or "pipe-to-ground"

        if  filter == nil or type == filter then
            ------
            return name, data.raw[type][name]
        end
        ---
    end end
end

local module = { }

function module.reset_collision_masks()
    ---
    for __, entity in iterate_underwater_pipes() do
        --
        entity.collision_mask = definitions.base_collision_mask
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