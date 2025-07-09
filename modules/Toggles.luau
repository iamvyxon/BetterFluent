-- modules/Toggles.luau
local function createToggles(tab, options, togglesTable)
    local toggles = {}
    for _, def in ipairs(togglesTable) do
        local toggle = tab:AddToggle(def.key, {
            Title = def.title or def.key,
            Default = def.default or false,
            Description = def.description,
        })
        if def.onChanged then
            toggle:OnChanged(function()
                def.onChanged(options[def.key].Value)
            end)
        end
        if def.setValue ~= nil then
            options[def.key]:SetValue(def.setValue)
        end
        toggles[def.key] = toggle
    end
    return toggles
end

return createToggles
