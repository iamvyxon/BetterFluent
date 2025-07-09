-- iamvyxon | Colorpickers module
local function createColorpickers(t, defs)
    local c = {}
    for _, d in ipairs(defs) do
        local p = t:AddColorpicker(d.k, {
            Title = d.t or d.k,
            Description = d.d,
            Default = d.df,
            Transparency = d.tr
        })
        if d.oc then p:OnChanged(d.oc) end
        if d.sv then p:SetValueRGB(d.sv) end
        if d.x then p.X = d.x end
        if d.z then p.Z = d.z end
        c[d.k] = p
    end
    return c
end
return createColorpickers
