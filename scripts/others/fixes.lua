local data_carrier = data.raw["mod-data"]["F077UP-data-carrier"]

local module = { }

local comask = { layers = { ground_tile = true } }

function module.reset_collision_masks()
    --
    for __, name in ipairs(data_carrier.data.underwater_entities --[[@as table]]) do
        --
        local type = data.raw["pipe"][name] and "pipe" or "pipe-to-ground"
        --
        data.raw[type][name].collision_mask = comask
    end
end

return module