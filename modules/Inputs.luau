-- iamvyxon | Inputs module
local function createInputs(t, defs)
        local c         = {}
        for _, d in ipairs(defs) do
                local i     = t:AddInput(d.k, {
                        Title       = d.t or d.k,
                        Default     = d.df,
                        Placeholder = d.p,
                        Numeric     = d.n,
                        Finished    = d.f,
                        Callback    = d.cb
                })
                if d.och then i:OnChanged(d.och) end
                c[d.k] = i
        end
        return c
end
return createInputs
