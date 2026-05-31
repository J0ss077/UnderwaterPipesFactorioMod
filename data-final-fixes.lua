require("compatibilities.5dim-compatibility")

local pass = {
    --
    ["lava"] = true,
    --
    ["lava-hot"] = true,
}

for name, tile in pairs(data.raw.tile) do
    --
    if not tile.fluid or pass[name] then
        --
        tile.collision_mask["layers"]["underwater_pipeline"] = true
    end
end
