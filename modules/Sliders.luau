-- iamvyxon | Sliders module
local function createSliders(t, defs)
        local c         = {}
        for _, d in ipairs(defs) do
                local s     = t:AddSlider(d.k, {
                        Title       = d.t or d.k,
                        Description = d.d,
                        Default     = d.df,
                        Min         = d.mn,
                        Max         = d.mx,
                        Rounding    = d.r,
                        Callback    = d.cb
                })
                if d.och then s:OnChanged(d.och) end
                if d.sv then s:SetValue(d.sv) end
                c[d.k] = s
        end
        return c
end
return createSliders
