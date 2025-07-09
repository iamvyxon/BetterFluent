-- iamvyxon | Buttons module
local function createButtons(t, defs)
        local c         = {}
        for _, d in ipairs(defs) do
                c[d.k] = t:AddButton({
                        Title       = d.t or d.k,
                        Description = d.d,
                        Callback    = d.cb
                })
        end
        return c
end
return createButtons
