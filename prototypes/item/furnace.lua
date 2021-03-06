local function createFurnace(version, type)
    local cf
    if version == 1 then
        if type == nil then
            cf = table.deepcopy(data.raw.item["electric-furnace"])
        else
            cf = table.deepcopy(data.raw.item["electric-" .. type .. "-furnace"])
        end
    else
        if type == nil then
            cf = table.deepcopy(data.raw.item["electric-furnace-" .. version])
        else
            cf = table.deepcopy(data.raw.item["electric-chemical-mixing-furnace-" .. version])
        end
    end
    if type == nil then
        cf.name = "logistic-electric-furnace-" .. version
        cf.icons = { { icon = data.raw.item["electric-furnace"].icon, icon_size = 64 }, logistic_requester_chest_mask, logistic_provider_chest_mask, }
        cf.localised_name = lm_localised_name("logistic-electric-furnace", version)
    else
        cf.name = "logistic-electric-" .. type .. "-furnace-" .. version
        cf.icons = { { icon = data.raw.item["electric-" .. type .. "-furnace"].icon, icon_size = 32 }, logistic_requester_chest_mask, logistic_provider_chest_mask, }
        cf.localised_name = lm_localised_name("logistic-electric-" .. type .. "-furnace", version)
    end
    cf.icon_size = 32
    cf.place_result = cf.name
    cf.flags = {"draw-logistic-overlay"}
    cf.localised_description = lm_localised_description_main
    return cf
end

data:extend({
    createFurnace(1, nil),
})

if mods["bobassembly"] then
    data:extend({
        createFurnace(2, nil),
        createFurnace(3, nil),
    })
end

if mods["bobplates"] then
    data:extend({
        createFurnace(1, "mixing"),
        createFurnace(1, "chemical"),
    })
end

if mods["bobplates"] and mods["bobassembly"] then
    data:extend({
        createFurnace(1, "chemical-mixing"),
        createFurnace(2, "chemical-mixing"),
    })
end
