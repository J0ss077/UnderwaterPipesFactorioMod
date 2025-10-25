local module = {}

--- @param item data.ItemPrototype
---
function module.parse_item_icons(item)
    --
    local icons = {}

    if item.icons then
        --
        icons = table.deepcopy(item.icons)
        --
    elseif item.icon then
        --
        table.insert(icons, {
            --
            scale = 0.5,
            --
            icon = item.icon,
            --
            draw_background = true,
            --
            icon_size = item.icon_size or 64,
        })
    end

    item.icon = nil

    item.icons = icons

    item.icon_size = nil
end

return module
