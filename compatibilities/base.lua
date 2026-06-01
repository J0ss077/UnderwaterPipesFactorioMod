local pipe_str = "pipe"
local pitg_str = "pipe-to-ground"

require("scripts.data-stage.modder").make_underwater_variants({
      ----
    { item = data.raw["item"][pipe_str], entity = data.raw[pipe_str][pipe_str], options = { use_default_recipe = true } },
    { item = data.raw["item"][pitg_str], entity = data.raw[pitg_str][pitg_str], options = { use_default_recipe = true } },
})

local function change_connection(conn)
    --
    if conn.connection_type ~= "underground" then conn.connection_category = "F077UP-underwater-pipe" end
    --
end

for __, conn in ipairs(data.raw[pipe_str]["F077UP-underwater-" .. pipe_str].fluid_box.pipe_connections) do change_connection(conn) end
for __, conn in ipairs(data.raw[pitg_str]["F077UP-underwater-" .. pitg_str].fluid_box.pipe_connections) do change_connection(conn) end