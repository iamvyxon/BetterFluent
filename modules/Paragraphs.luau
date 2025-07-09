-- iamvyxon | Paragraphs module
local function createParagraphs(t, defs)
        local c         = {}
        for _, d in ipairs(defs) do
                c[d.k] = t:AddParagraph({
                        Title   = d.t or d.k,
                        Content = d.c
                })
        end
        return c
end
return createParagraphs
