repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

UserSettings():GetService("UserGameSettings").MasterVolume = 0
settings().Rendering.QualityLevel = 1
loadstring(game:HttpGet(("https://raw.githubusercontent.com/Dum1121/ReiPublic/refs/heads/main/Scripts/Extra/Smooth.lua")))()

local workspace = game:GetService("Workspace")
local plrs = game.Players
local plr = plrs.LocalPlayer

local PlaceId,JobId = game.PlaceId,game.JobId
local HttpService = cloneref(game:GetService("HttpService"))
local TeleportService = cloneref(game:GetService("TeleportService"))
local PlaceID,JobID = game.PlaceId,game.JobId local AllIDs = {} local foundAnything = "" local actualHour = os.date("!*t").hour local File = pcall( function() AllIDs = game:GetService("HttpService"):JSONDecode(readfile("NotSameServers.json")) end ) if not File then table.insert(AllIDs, actualHour) writefile("NotSameServers.json", game:GetService("HttpService"):JSONEncode(AllIDs)) end function TPReturner() local Site if foundAnything == "" then Site = game.HttpService:JSONDecode( game:HttpGet("https://games.roblox.com/v1/games/"..PlaceID.."/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true") ) else Site = game.HttpService:JSONDecode( game:HttpGet( "https://games.roblox.com/v1/games/" .. PlaceID .. "/servers/Public?sortOrder=Asc&limit=100&excludeFullGames=true&cursor=" .. foundAnything ) ) end local ID = "" if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then foundAnything = Site.nextPageCursor end local num = 0 for i, v in pairs(Site.data) do local Possible = true ID = tostring(v.id) if tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= JobID then for _, Existing in pairs(AllIDs) do if num ~= 0 then if ID == tostring(Existing) then Possible = false end else if tonumber(actualHour) ~= tonumber(Existing) then local delFile = pcall( function() delfile("NotSameServers.json") AllIDs = {} table.insert(AllIDs, actualHour) end ) end end num = num + 1 end if Possible == true then table.insert(AllIDs, ID) wait() pcall( function() writefile("NotSameServers.json", game:GetService("HttpService"):JSONEncode(AllIDs)) wait() game:GetService("TeleportService"):TeleportToPlaceInstance( PlaceID, ID, game.Players.LocalPlayer ) end ) wait(4) end end end end local function Teleport() while wait() do pcall( function() TPReturner() if foundAnything ~= "" then TPReturner() end end ) end end
--[[function Teleport()
    spawn(function()
        --[[local serverlist = game:GetService("ReplicatedStorage"):WaitForChild("Chest"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("GetServers"):InvokeServer()
        while wait() do
            for i,v in serverlist do
                local region = getgenv().Configs.Server.Region
                if getgenv().Configs.Server.Region == nil then region = v.Region end
                if v.Region:find(region) and v.GetPlayers == math.random(getgenv().Configs.Server.Limit,12) and v.JobId ~= game.JobId then
                 if getgenv().Configs.Server.Time.Enable then
                 local dateString = os.date("*t", v.ServerOsTime)
                     if dateString.hour >= getgenv().Configs.Server.Time.Hour and dateString.min >= getgenv().Configs.Server.Time.Minute then
                        print(region,v.GetPlayers,dateString.hour,dateString.min)
                     game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.JobId, game.Players.LocalPlayer)
                     task.wait()
                     end
                     else
                     game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.JobId, game.Players.LocalPlayer)
                     task.wait()
                     end
                end
                 end
        end
        while wait() do
                pcall(function()
                    local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
                    if httprequest then
                        local servers = {}
                        local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", PlaceId)})
                        local body = HttpService:JSONDecode(req.Body)
                
                        if body and body.data then
                            for i, v in next, body.data do
                                if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= JobId then
                                    table.insert(servers, 1, v.id)
                                end
                            end
                        end
                
                if #servers > 0 then
                            TeleportService:TeleportToPlaceInstance(PlaceId, servers[math.random(1, #servers)], plr)
                end
            end
                end)
end
    end)
end]]
function Attack()
    coroutine.wrap(function()
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                if v.ToolTip == "Sword" then
                    TypeWeapon = "SW"
                elseif v.ToolTip == "Combat" then
                    TypeWeapon = "FS"
                end
            
                if TypeWeapon then
                    local args = {
                        [1] = TypeWeapon.."_"..v.Name.."_M1"
                    }
                    
                    game:GetService("ReplicatedStorage"):WaitForChild("Chest"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("SkillAction"):InvokeServer(unpack(args))
                end
            end
        end
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") then
                if v.ToolTip == "Sword" then
                    TypeWeapon = "SW"
                elseif v.ToolTip == "Combat" then
                    TypeWeapon = "FS"
                end
            
                if TypeWeapon then
                    local args = {
                        [1] = TypeWeapon.."_"..v.Name.."_M1"
                    }
                    
                    game:GetService("ReplicatedStorage"):WaitForChild("Chest"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("SkillAction"):InvokeServer(unpack(args))
                end
            end
        end
    end)()
end
function skill()
    coroutine.wrap(function()
    local equipment = {}
    for i,v in game:GetService("Players").LocalPlayer.Backpack:GetChildren() do
        if v.ToolTip == "Sword" then
            for i,_ in require(game:GetService("ReplicatedStorage").Chest.Modules.SkillData.Swords[v.Name.."_Data"]) do
                if not (string.find(i,"Require") or string.find(i,"ERequire") or string.find(i,"Awake") or string.find(i,"Respawn"))  then
                    table.insert(equipment,"SW_"..v.Name.."_"..i)
                end
            end
        elseif v.ToolTip == "Fruit Power" then
            for i,_ in require(game:GetService("ReplicatedStorage").Chest.Modules.SkillData.Fruits[v.Name.."_Data"]) do
                if not (string.find(i,"Require") or string.find(i,"E") or string.find(i,"Awake") or string.find(i,"Respawn")) then
                    table.insert(equipment,"DF_"..v.Name.."_"..i)
                end
            end
        elseif v.ToolTip == "Combat" then
            for i,_ in require(game:GetService("ReplicatedStorage").Chest.Modules.SkillData.Styles[v.Name.."_Data"]) do
                if not (string.find(i,"Require") or string.find(i,"ERequire") or string.find(i,"Awake") or string.find(i,"Respawn")) then
                    table.insert(equipment,"FS_"..v.Name.."_"..i)
                end
            end
        end
    end
        spawn(function()
            for _,k in equipment do
                if plr.Character.Humanoid.Health <= 0 then return end
                spawn(function()
                    local args = {[1] = k,[2] = {["MouseHit"] = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0,-5,0),["Type"] = "Down"}}
                    game:GetService("ReplicatedStorage"):WaitForChild("Chest"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("SkillAction"):InvokeServer(unpack(args))
                end)
            spawn(function()
                local args = {[1] = k,[2] = {["MouseHit"] = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0,-5,0),["Type"] = "Up"}}
                game:GetService("ReplicatedStorage"):WaitForChild("Chest"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("SkillAction"):InvokeServer(unpack(args))
            end)
            task.wait(0.2)
        end
        end)
    end)()
end
function BodyClip()
    if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("DumWasHere") then
        local Noclip = Instance.new("BodyVelocity")
        Noclip.Name = "DumWasHere"
        Noclip.Parent = plr.Character.HumanoidRootPart
        Noclip.MaxForce = Vector3.new(100000,100000,100000)
        Noclip.Velocity = Vector3.new(0,0,0)
    end
end
local dl = false
function click(path) if dl == false then game:GetService("GuiService").SelectedObject = path if game:GetService("GuiService").SelectedObject == path then dl = true game:GetService("VirtualInputManager"):SendKeyEvent(true, 13, false, game) task.wait() game:GetService("VirtualInputManager"):SendKeyEvent(false, 13, false, game) end task.wait() game:GetService("GuiService").SelectedObject = nil dl = false end end


    for i,v in pairs(workspace.Island:GetChildren()) do
        if string.find(v.Name,"Legacy Island") then
            v.Name = "Legacy Island"
        end
        if string.find(v.Name,"Sea King") then
            v.Name = "Sea King"
        end
    end
    if not (workspace.Island:FindFirstChild("Legacy Island") or workspace.Island:FindFirstChild("Sea King") or workspace.GhostMonster:FindFirstChild("Ghost Ship")) then
        if not workspace:FindFirstChild("Chest1") then
            print("hop")
            Teleport()
            return
        end
    end
if not plr:FindFirstChild("DataLoaded") then 
    repeat task.wait(0.3)
game:GetService("ReplicatedStorage"):WaitForChild("Chest"):WaitForChild("Remotes"):WaitForChild("Functions"):WaitForChild("EtcFunction"):InvokeServer("EnterTheGame",{})
    until plr:FindFirstChild("DataLoaded")
    plr.Character.Humanoid.Health = 0
end
loadstring(game:HttpGet(("https://raw.githubusercontent.com/Dum1121/ReiPublic/refs/heads/main/Scripts/Extra/Smooth.lua")))();

spawn(function()
    while task.wait() do
        pcall(function()
            if not plr:FindFirstChild("DataLoaded") then return end
                                if plr.Character.Services.Haki.Value ~= 1 then
                    game:GetService("ReplicatedStorage"):WaitForChild("Chest"):WaitForChild("Remotes"):WaitForChild("Events"):WaitForChild("Armament"):FireServer()
                    wait(1)
                end
                BodyClip()
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if workspace.Island:FindFirstChild("Legacy Island") then
                if workspace.SeaMonster:FindFirstChildOfClass("Model") then
                    if workspace.SeaMonster:FindFirstChildOfClass("Model").Humanoid.Health ~= 0 then
                        repeat wait()
                            pcall(function()
                                plr.Character.HumanoidRootPart.CFrame = workspace.SeaMonster:FindFirstChildOfClass("Model").HumanoidRootPart.CFrame * CFrame.new(0,10,0)
                                Attack()
                                skill()
                            end)
                        until workspace.SeaMonster:FindFirstChildOfClass("Model").Humanoid.Health <= 0
                    end
                end
            if workspace.Island["Legacy Island"].ChestSpawner:FindFirstChildOfClass("Model") then
                plr.Character.HumanoidRootPart.CFrame = workspace.Island["Legacy Island"].ChestSpawner.CFrame
                for i,v in pairs(workspace.Island["Legacy Island"].ChestSpawner:FindFirstChildOfClass("Model"):GetDescendants()) do
                    if v.Name == "Rays" and v:IsA("ParticleEmitter") then
                    if v.Enabled then
                        wait(5)
                        workspace.Island["Legacy Island"].ChestSpawner:FindFirstChildOfClass("Model"):Destroy()
                        workspace.Island["Legacy Island"].Name = "Done."
                        end
                        return
                    end
                end
            end
            elseif workspace.Island:FindFirstChild("Sea King") then
                if workspace.SeaMonster:FindFirstChildOfClass("Model") then
                    if workspace.SeaMonster:FindFirstChildOfClass("Model").Humanoid.Health ~= 0 then
                        repeat wait()
                            pcall(function()
                                plr.Character.HumanoidRootPart.CFrame = workspace.SeaMonster:FindFirstChildOfClass("Model").HumanoidRootPart.CFrame * CFrame.new(0,10,0)
                                Attack()
                                skill()
                            end)
                        until workspace.SeaMonster:FindFirstChildOfClass("Model").Humanoid.Health <= 0
                    end
                end
                if workspace.Island["Sea King"]:FindFirstChildOfClass("Model") then
                    plr.Character.HumanoidRootPart.CFrame = workspace.Island["Sea King"]:FindFirstChildOfClass("Model").RootPart.CFrame
                    for i,v in pairs(workspace.Island["Sea King"]:FindFirstChildOfClass("Model"):GetDescendants()) do
                        if v.Name == "Rays" and v:IsA("ParticleEmitter") then
                        if v.Enabled then
                            wait(5)
                            workspace.Island["Sea King"]:FindFirstChildOfClass("Model"):Destroy()
                            workspace.Island["Sea King"].Name = "Done."
                            end
                            return
                        end
                    end
                end
            elseif workspace.GhostMonster:FindFirstChild("Ghost Ship") then
                if workspace.GhostMonster:FindFirstChild("Ghost Ship").Humanoid.Health ~= 0 then
                    if not workspace.GhostMonster:FindFirstChild("Ghost Ship"):FindFirstChild("HumanoidRootPart") then workspace.GhostMonster:FindFirstChild("Ghost Ship"):Destroy() return end
                    repeat wait()
                        pcall(function()
                    plr.Character.HumanoidRootPart.CFrame = workspace.GhostMonster["Ghost Ship"].HumanoidRootPart.CFrame * CFrame.new(0,10,0)
                    Attack()
                    skill()
                        end)
                        until workspace.GhostMonster:FindFirstChild("Ghost Ship").Humanoid.Health <= 0
                end
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if string.find(v.Name,"Chest") and v:IsA("Model") then
                        plr.Character.HumanoidRootPart.CFrame = v.Top.CFrame
                        wait(0.5)
                        v:Destroy()
                        wait(3)
                        return
                    end
                end
            end
            
            for i,v in pairs(plr.Backpack:GetChildren()) do
                if v:FindFirstChild("DevilFruit") and v:FindFirstChild("Server") then
                    if not string.find(game:GetService("Players").LocalPlayer.PlayerStats.FruitStore.Value,v.Name) then
                    plr.Character.Humanoid:EquipTool(v)
                    task.wait()
                    plr.Character[v.Name]:Activate()
                    repeat wait() until plr.PlayerGui:FindFirstChild("EatFruitBecky") and plr.PlayerGui.EatFruitBecky.Dialogue
                    click(plr.PlayerGui.EatFruitBecky.Dialogue.Collect)
                    wait(1)
                    return
                    end
                end
            end
            if not (workspace.Island:FindFirstChild("Legacy Island") or workspace.Island:FindFirstChild("Sea King") or workspace.GhostMonster:FindFirstChild("Ghost Ship")) then
                print("hop")
                Teleport()
            end
        end)
    end
end)
    if getgenv().Configs.Hop_Server.Enable then
spawn(function()
    wait(getgenv().Configs.Hop_Server.Mins * 60)
end)
end
