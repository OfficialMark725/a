-- swing obby for brainrots

return function(section, data)
    local elements = loadstring(game:HttpGet(getgitpath("src").."elements.lua"))()

    local setdata = data[tostring(game.PlaceId)] or {}
    setdata.farmrots = setdata.farmrots or false
    data[tostring(game.PlaceId)] = setdata
    writefile("BrainrotPolice/Config.json", game:GetService("HttpService"):JSONEncode(data))

    local plr = game:GetService("Players").LocalPlayer
    local brainrotFold = workspace.ActiveBrainrots

    getgenv().Farming = false

     local function grabem(where)
        local char = plr.Character
        for _, br in pairs(where:GetChildren()) do
            if not br.Attachment then continue end
            char:MoveTo(br.Position)
            task.wait(0.5)
            fireproximityprompt(br.Attachment.ProximityPrompt)
            task.wait(0.25)
            char:MoveTo(Vector3.new(-140, -10, -40))
            task.wait(0.5)
        end
    end

    elements:Toggle("Farming", section, setdata.farmrots, function(isOn)
        setconfig("farmrots", isOn)
        if isOn then
            getgenv().Farming = true
            while getgenv().Farming do

                grabem(brainrotFold)
                task.wait(1)
            end
        else
            getgenv().Farming = false
        end
    end)
end