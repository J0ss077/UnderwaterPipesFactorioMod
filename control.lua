local filter = {}

for class, list in pairs(prototypes.mod_data["F077UP-data-carrier"].data.underwater_entities--[[@as table]]) do
    --
    for i0, name in ipairs(list) do
        --
        table.insert(filter, { filter = "name", name = name })
    end
end

local function handler(arguments)
    --
    if arguments.entity and arguments.entity.valid then
        --
        arguments.entity.destructible = false
    end
end

for __, event in ipairs({
    --
    defines.events.on_built_entity, defines.events.on_robot_built_entity,
    --
    defines.events.script_raised_built, defines.events.script_raised_revive,
    --
}) do script.on_event(event, handler, filter) end
