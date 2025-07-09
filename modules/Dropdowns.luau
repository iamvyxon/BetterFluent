-- iamvyxon | Dropdowns module
local function createDropdowns(t)
        local c         = {}
        c.Dropdown      = t:AddDropdown("Dropdown", {
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
return createDropdowns
