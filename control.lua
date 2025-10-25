--- @param tile LuaTile
---
--- @return boolean
---
local function is_water_tile(tile)
    --
    local layers = tile.prototype.collision_mask.layers
    --
    return layers["water_tile"] == true and (layers["ground_tile"] == nil or layers["ground_tile"] == false)
end

--- @param entity LuaEntity
---
--- @return boolean
---
local function is_far_from_ground(entity)
    --
    local area = {
        --
        { entity.position.x - 1, entity.position.y - 1 },
        --
        { entity.position.x + 1, entity.position.y + 1 },
    }

    for __, tile in ipairs(entity.surface.find_tiles_filtered { area = area }) do
        --
        if not tile or not is_water_tile(tile) then
            --
            return false
        end
    end

    return true
end

local filter = {}

for __, name in ipairs(prototypes.mod_data["underwater-pipes-data-carrier"].data.underwater_entities) do
    --
    table.insert(filter, { filter = "name", name = name })
end

local function handler(args)
    --
    if is_far_from_ground(args.entity) then return end

    --------------------------------------------------

    local player = args.player_index and game.players[args.player_index]

    local items_spilled, item_returned = nil, false

    if player then
        --
        player.create_local_flying_text { text = "too close to ground !!", position = args.entity.position }

        if player.mine_entity(args.entity, false) then
            --
            item_returned = true
        end
    end

    if not item_returned then
        --
        if args.consumed_items then
            --
            items_spilled = args.entity.surface.spill_inventory { position = args.entity.position, inventory = args.consumed_items }
            --
        elseif args.stack then
            --
            items_spilled = args.entity.surface.spill_item_stack { position = args.entity.position, stack = args.stack }
        end
    end

    if items_spilled then
        --
        for __, item in ipairs(items_spilled) do
            --
            item.order_deconstruction(args.entity.force)
        end
    end

    if args.entity and args.entity.valid then args.entity.destroy { raise_destroy = true } end
end

for __, event in ipairs({
    --
    defines.events.on_built_entity, defines.events.on_robot_built_entity,
    --
    defines.events.script_raised_built, defines.events.script_raised_revive,
    --
}) do script.on_event(event, handler, filter) end
