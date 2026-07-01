if not mods["5dim_compatibility"] then return end

if mods["Krastorio2"] then
    --
    require("scripts.others.collision-mask-utils").reset_collision_masks()
end
