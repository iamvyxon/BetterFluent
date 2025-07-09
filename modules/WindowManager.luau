-- THIS FILE WAS NOT INTENT TO BE EDITED
--  -- It is used to create the Fluent window and return it for use in other scripts

local Config = require(script.Parent.Parent.config)
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow(Config)

return {
    Fluent = Fluent,
    Window = Window
}
