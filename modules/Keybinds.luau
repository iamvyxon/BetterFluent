-- iamvyxon | Keybinds module
local function createKeybinds(t, defs)
        local c         = {}
        for _, d in ipairs(defs) do
                local k     = t:AddKeybind(d.k, {
                        Title           = d.t or d.k,
                        Mode            = d.m or "Toggle",
                        Default         = d.df or "LeftControl",
                        Callback        = d.cb,
                        ChangedCallback = d.ccb
                })
                if d.oc then k:OnClick(d.oc) end
                if d.och then k:OnChanged(d.och) end
                c[d.k] = k
        end
        return c
end
return createKeybinds
