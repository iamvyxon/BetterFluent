-- Standalone, BetterFluent Example (iamvyxon)
-- Credits to Dawid for the Fluent library and addons.

local Fluent         = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local iamvyxon   = "https://raw.githubusercontent.com/iamvyxon/BetterFluent/main/"
local u_R = true -- DONT EDIT

local function requireModule(path, localObj)
        if u_R then
                return loadstring(game:HttpGet(iamvyxon .. path))()
        else
                return require(localObj)
        end
end

local Icons          = requireModule("icons/icons.luau", script.Parent.icons.icons)
local Config         = requireModule("config.luau", script:FindFirstChild("config") or "config")
local Window         = Fluent:CreateWindow(Config)
local Tabs           = {
        Main         = Window:AddTab({ Title = "Main", Icon = getIcon("lucide-home") }),
        Settings     = Window:AddTab({ Title = "Settings", Icon = getIcon("lucide-settings") })
}
local Options        = Fluent.Options

-- Toggles
local function createToggles(tab, o, defs)
        local c     = {}
        for _, d in ipairs(defs) do
                local g     = tab:AddToggle(d.k, {
                        Title       = d.t or d.k,
                        Default     = d.df,
                        Description = d.d
                })
                if d.och then
                        g:OnChanged(function()
                                d.och(o[d.k].Value)
                        end)
                end
                if d.sv ~= nil then
                        o[d.k]:SetValue(d.sv)
                end
                c[d.k] = g
        end
        return c
end

-- Buttons
local function createButtons(tab, defs)
        local c     = {}
        for _, d in ipairs(defs) do
                c[d.k] = tab:AddButton({
                        Title       = d.t or d.k,
                        Description = d.d,
                        Callback    = d.cb
                })
        end
        return c
end

-- Paragraphs
local function createParagraphs(tab, defs)
        local c     = {}
        for _, d in ipairs(defs) do
                c[d.k] = tab:AddParagraph({
                        Title   = d.t or d.k,
                        Content = d.c
                })
        end
        return c
end

-- Keybinds
local function createKeybinds(tab, defs)
        local c     = {}
        for _, d in ipairs(defs) do
                local k     = tab:AddKeybind(d.k, {
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

-- Inputs
local function createInputs(tab, defs)
        local c     = {}
        for _, d in ipairs(defs) do
                local i     = tab:AddInput(d.k, {
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

-- Sliders
local function createSliders(tab, defs)
        local c     = {}
        for _, d in ipairs(defs) do
                local s     = tab:AddSlider(d.k, {
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

-- Colorpickers
local function createColorpickers(tab, defs)
        local c     = {}
        for _, d in ipairs(defs) do
                local p     = tab:AddColorpicker(d.k, {
                        Title         = d.t or d.k,
                        Description   = d.d,
                        Default       = d.df,
                        Transparency  = d.tr
                })
                if d.och then p:OnChanged(d.och) end
                if d.sv then p:SetValueRGB(d.sv) end
                c[d.k] = p
        end
        return c
end

-- Dropdowns
local function createDropdowns(tab)
        local c     = {}
        c.Dropdown  = tab:AddDropdown("Dropdown", {
                Title   = "Dropdown",
                Values  = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
                Multi   = false,
                Default = 1,
        })
        c.Dropdown:SetValue("four")
        c.Dropdown:OnChanged(function(Value)
                print("Dropdown changed:", Value)
        end)
        return c
end

-- Toggles
local toggles        = createToggles(Tabs.Main, Options, {
        { k = "MyToggle", t = "Main Toggle", df = false, och = function(v) print("Main Toggle changed:", v) end, sv = false },
        { k = "AutoFarm", t = "Auto Farm", df = true, och = function(v) print("Auto Farm changed:", v) end },
})
local dropdowns      = createDropdowns(Tabs.Main)
local buttons        = createButtons(Tabs.Main, {
        { k = "Example", t = "Button", d = "Very important button", cb = function()
                Window:Dialog({
                        Title   = "Title",
                        Content = "This is a dialog",
                        Buttons = {
                                { Title = "Confirm", Callback = function() print("Confirmed the dialog.") end },
                                { Title = "Cancel", Callback = function() print("Cancelled the dialog.") end }
                        }
                })
        end }
})
local paragraphs     = createParagraphs(Tabs.Main, {
        { k = "Example", t = "Paragraph", c = "This is a paragraph.\nSecond line!" }
})
local keybinds       = createKeybinds(Tabs.Main, {
        { k = "Keybind", t = "KeyBind", m = "Toggle", df = "LeftControl",
                cb  = function(v) print("Keybind clicked!", v) end,
                ccb = function(n) print("Keybind changed!", n) end,
                oc  = function() print("Keybind clicked:", keybinds.Keybind:GetState()) end,
                och = function() print("Keybind changed:", keybinds.Keybind.Value) end
        }
})
local inputs         = createInputs(Tabs.Main, {
        { k = "Input", t = "Input", df = "Default", p = "Placeholder", n = false, f = false,
                cb  = function(v) print("Input changed:", v) end,
                och = function() print("Input updated:", inputs.Input.Value) end
        }
})
local sliders        = createSliders(Tabs.Main, {
        { k = "Slider", t = "Slider", d = "This is a slider", df = 2, mn = 0, mx = 5, r = 1,
                cb  = function(v) print("Slider was changed:", v) end,
                och = function(v) print("Slider changed:", v) end,
                sv  = 3
        }
})
local colorpickers   = createColorpickers(Tabs.Main, {
        { k = "Colorpicker", t = "Colorpicker", df = Color3.fromRGB(96, 205, 255),
                och = function() print("Colorpicker changed:", colorpickers.Colorpicker.Value) end,
                sv  = Color3.fromRGB(0, 255, 140)
        },
        { k = "TransparencyColorpicker", t = "Colorpicker", d = "but you can change the transparency.", tr = 0, df = Color3.fromRGB(96, 205, 255),
                och = function() print("TColorpicker changed:", colorpickers.TransparencyColorpicker.Value, "Transparency:", colorpickers.TransparencyColorpicker.Transparency) end
        }
})

--[[
===============================================================================
        ADD YOUR CUSTOM CODE ABOVE THIS LINE!
        Or edit the values above, start Line 145
===============================================================================
]]
