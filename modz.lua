-- tsuo hub deob...

        local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Seraphim" .. Fluent.Version,
    SubTitle = "by dawid",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})
                ------- Specials Mobs --------
        Elites = {
            "Deandre [Lv. 1750]",
            "Urban [Lv. 1750]",
            "Diablo [Lv. 1750]"
        }
        BoneMobs = {
            "Reborn Skeleton [Lv. 1975]",
            "Living Zombie [Lv. 2000]",
            "Demonic Soul [Lv. 2025]",
            "Posessed Mummy [Lv. 2050]"
        }
        BossFarmEx = {}
        for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
            if string.find(v.Name, "Raid Boss") then
                table.insert(BossFarmEx, v.Name)
            end
        end
        for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
            if string.find(v.Name, "Raid Boss") then
                table.insert(BossFarmEx, v.Name)
            end
            
        DefaultTab = Window:NewTab({Title = "Default", Icon = getRandomIcon()})
        FarmTab = Window:NewTab({Title = "Farm", Icon = getRandomIcon()}) 
        ServerTab = Window:NewTab({Title = "Server & Info", Icon = getRandomIcon()})
        V4Tab = Window:NewTab({Title = "Race", Icon = getRandomIcon()})
        PlRTAB = Window:NewTab({Title = "Local Player", Icon = getRandomIcon()}) 
        WeaponTab = Window:NewTab({Title = "Weapon", Icon = getRandomIcon()}) 
        ShopTab = Window:NewTab({Title = "Shop",Icon = getRandomIcon()})
        RaidTab = Window:NewTab({Title = "Fruits & Raid", Icon = getRandomIcon()})
        if not Sea1 then 
            SeaBeastTab = Window:NewTab({Title = "Sea Beast",Icon = getRandomIcon()})
        end 
        SettingTab = Window:NewTab({Title = "Setting",Icon = getRandomIcon()})
        function CreateUiNotify(cf)
            newtitle = cf.Title or "Tsuo Hub"
            newcontent = cf.Content or "Nothing"
            newduration = cf.Duration or 10
            newsubcontent = cf.SubContent or ""
            Fluent:Notify(
                {
                    Title = newtitle,
                    Content = newcontent,
                    SubContent = newsubcontent, -- Optional
                    Duration = newduration -- Set to nil to make the notification not disappear
                }
            )
        end
        -------------------------------------------------------- MAIN FUNCTIONS -------------------------------------   
        function TweentoNearestChest()
            Chest = GetNearestChest()
            if Chest then 
                Tweento(Chest) 
            end
        end
        function AutoDarkBeard(collectchest)
            if CheckBoss("Darkbeard [Lv. 1000] [Raid Boss]") then
                KillMobNotInWorkSpace(CheckBoss("Darkbeard [Lv. 1000] [Raid Boss]"))
            else
                if CheckTool("Fist of Darkness") then
                    if GetDistance(game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection) <= 5 then
                        EquipWeaponName("Fist of Darkness")
                        pcall(
                            function()
                                firetouchinterest(
                                    game.Players.LocalPlayer.Character["Fist of Darkness"].Handle,
                                    game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection,
                                    0
                                )
                                firetouchinterest(
                                    game.Players.LocalPlayer.Character["Fist of Darkness"].Handle,
                                    game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection,
                                    1
                                )
                                firetouchinterest(
                                    game.Players.LocalPlayer.Character.HumanoidRootPart,
                                    game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection,
                                    0
                                )
                                firetouchinterest(
                                    game.Players.LocalPlayer.Character.HumanoidRootPart,
                                    game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection,
                                    1
                                )
                            end
                        )
                    else
                        Tweento(game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection.CFrame)
                    end
                elseif collectchest and Sea2 then 
                    TweentoNearestChest()
                end
            end
        end 
        function CountZombie(x)
            local Counter = 0
            for i, v in pairs(game.workspace.Enemies:GetChildren()) do
                if RemoveLevelTitle(v.Name) == "Living Zombie" and v.Humanoid.Health > 0 then
                    if
                        not x or
                            (v.HumanoidRootPart.Position - Vector3.new(-10171.7607421875, 138.62667846679688, 6008.0654296875)).magnitude <
                                30
                     then
                        Counter = Counter + 1
                    end
                end
            end
            return Counter
        end 
        function CountZombieInWorkspace()
            Counter = 0
            for i, v in pairs(game.workspace.Enemies:GetChildren()) do
                if RemoveLevelTitle(v.Name) == "Living Zombie" and v.Humanoid.Health > 0 then
                    Counter = Counter + 1
                end
            end
            return Counter
        end
        function BringMobSoulGuitar()
            pcall(
                function()
                    for i, v in pairs(game.workspace.Enemies:GetChildren()) do
                        if
                        RemoveLevelTitle(v.Name) == "Living Zombie" and v:FindFirstChild("Humanoid") and
                                v:FindFirstChild("HumanoidRootPart")
                         then
                            if
                                isnetworkowner(v.HumanoidRootPart) and
                                    GetDistance(
                                        v.HumanoidRootPart,
                                        CFrame.new(-10171.7607421875, 138.62667846679688, 6008.0654296875)
                                    ) > 5
                             then 
                                TweenObject(CFrame.new(-10171.7607421875, 138.62667846679688, 6008.0654296875),v.HumanoidRootPart,1500)
                                SizePart(
                                    v,
                                    CFrame.new(-10171.7607421875, 138.62667846679688, 6008.0654296875),
                                    "Living Zombie [Lv. 2000]"
                                )
                            end
                        end
                    end
                end
            )
        end 
        function CheckAnyPlayersInCFrame(gggggggggggggg, g6)
            min3 = g6
            local min5
            for i, v in pairs(game.Players:GetChildren()) do
                pcall(
                    function()
                        if
                            v.Name ~= game.Players.LocalPlayer.Name and
                                GetDistance(v.Character.HumanoidRootPart, gggggggggggggg) < min3
                         then
                            min3 = GetDistance(v.Character.HumanoidRootPart, gggggggggggggg)
                        end
                    end
                )
            end
            for i, v in pairs(game.Players:GetChildren()) do
                pcall(
                    function()
                        if
                            v.Name ~= game.Players.LocalPlayer.Name and
                                GetDistance(v.Character.HumanoidRootPart, gggggggggggggg) <= min3
                         then
                            min5 = v
                        end
                    end
                )
            end
            return min5
        end
        function CheckQuestSoulGuitar() 
            if not (Sea2 or Sea3) or CheckItem("Soul Guitar") or LocalPlayerLevelValue < 2300 then return end  
            MaterialReq = {
                Ectoplasm = 250,
                Bones = 500,
                ["Dark Fragment"] = 1,
            }
            for i,v in pairs(MaterialReq) do 
                MaterialRequired[i] = CheckMaterialCount(i) >= v 
            end 
            Returner = {
                Status = "None",
                SeaRequired = 0,
            } 
            if not MaterialReq.Ectoplasm or not MaterialReq.Bones or not MaterialReq["Dark Fragment"] then 
                if not MaterialReq.Ectoplasm then 
                    Returner.Status = "Ectoplasm" 
                    Returner.SeaRequired = 2
                elseif not MaterialReq.Bones then 
                    Returner.Status = "Bones"   
                    Returner.SeaRequired = 3
                elseif not MaterialReq["Dark Fragment"] then 
                    Returner.Status = "Dark Fragment"
                    Returner.SeaRequired = 2
                end 
                Config["SoulGuitarStatus"] = Returner
                return Returner 
            end  
            pcall(function()
                Config["SoulGuitarStatus"] = false
            end)
            if not game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("GuitarPuzzleProgress", "Check") then 
                if (CheckMoon() == "Full Moon" and (game.Lighting.ClockTime > 15 or game.Lighting.ClockTime < 5)) or Config["HopOption"] then 
                    return "Full Moon"
                end 
            else
                if game.Players.LocalPlayer.PlayerGui.Main.Dialogue.Visible then
                    game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0))
                    game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0))
                end 
                SoulGuitarCheck = game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("GuitarPuzzleProgress", "Check")
                if not SoulGuitarCheck.Swamp then
                    return "Swamp" 
                elseif not SoulGuitarCheck.Gravestones then 
                    return "Grave Stone"
                elseif not SoulGuitarCheck.Ghost then 
                    return "Ghost"
                elseif not SoulGuitarCheck.Trophies then 
                    return "Trophie"
                elseif not SoulGuitarCheck.Pipes then 
                    return "Pipe"  
                else
                    game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("soulGuitarBuy", true)
                    CreateUiNotify({
                        Content = game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("soulGuitarBuy"),
                        Duration = 30
                    }) 
                    pcall(function()
                        Config["SoulGuitarStatus"] = false
                    end)
                    return
                end
            end
        end 
        tickNotify = 15
        function DoSoulGuitarQuest(st) 
            if not st then return end 
            if not (Sea2 or Sea3) or CheckItem("Soul Guitar") or LocalPlayerLevelValue < 2300 then return end
            if typeof(st) == "string" then  
                TeleportWorld(3)
                if st == "Full Moon" then 
                    if
                        Sea3 and game.Lighting.Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" and
                            (game.Lighting.ClockTime > 15 or game.Lighting.ClockTime < 5)
                     then 
                        if (game.Lighting.ClockTime > 18 or game.Lighting.ClockTime < 5) then 
                            Tweento(CFrame.new(-8654.314453125, 140.9499053955078, 6167.5283203125)) 
                            if GetDistance(CFrame.new(-8654.314453125, 140.9499053955078, 6167.5283203125)) < 10 then
                                CheckRemote = game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("gravestoneEvent", 2) 
                                if CheckRemote ~= true then return end 
                                require(game.ReplicatedStorage.Effect).new("BlindCam"):replicate({
                                    Color = Color3.new(0.03, 0.03, 0.03), 
                                    Duration = 2, 
                                    Fade = 0.25, 
                                    ZIndex = -10
                                });
                                require(game.ReplicatedStorage.Util.Sound):Play("Thunder", workspace.CurrentCamera.CFrame.p);
                                CreateUiNotify({
                                    Content = game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("gravestoneEvent", 2, true),
                                    Duration = 15
                                })
                            end 
                        else
                            if tick()-tickNotify > 14 then 
                                tickNotify = tick() 
                                CreateUiNotify({
                                    Content = "Waitting full moon.",
                                    Duration = 15,
                                })
                            end
                        end
                    end 
                elseif st == "Swamp" then 
                    if GetDistance(CFrame.new(-10171.7607421875, 138.62667846679688, 6008.0654296875)) > 100 then
                        Tweento(CFrame.new(-10171.7607421875, 138.62667846679688, 6008.0654296875))
                    else
                        Tweento(CFrame.new(-10171.7607421875, 138.62667846679688, 6008.0654296875))
                        if CheckAnyPlayersInCFrame(CFrame.new(-10171.7607421875, 138.62667846679688, 6008.0654296875), 1500) then
                            CreateUiNotify({
                                Content = "A Player Farming There, Cannot Do Puzzle.\nHop to new server."
                            })
                            HopServer(10,true)
                        else
                            if CountZombie() == 6 then
                                for i, v in pairs(game.workspace.Enemies:GetChildren()) do
                                    if
                                        RemoveLevelTitle(v.Name) == "Living Zombie" and v:FindFirstChild("HumanoidRootPart") and
                                            v:FindFirstChild("Humanoid") and
                                            v.Humanoid.Health > 0
                                     then
                                        repeat
                                            wait()
                                            KillMob(v)
                                        until v.Humanoid.Health <= 0 or not v.Parent
                                    end
                                end
                            else
                                if CountZombieInWorkspace() == 6 then
                                    BringMobSoulGuitar()
                                end
                            end
                        end
                    end
                elseif st == "Grave Stone" then 
                    if GetDistance(CFrame.new(-8761.4765625, 142.10487365722656, 6086.07861328125)) > 50 then
                        Tweento(CFrame.new(-8761.4765625, 142.10487365722656, 6086.07861328125))
                    else
                        local ClickSigns = {
                            game.workspace.Map["Haunted Castle"].Placard1.Right.ClickDetector,
                            game.workspace.Map["Haunted Castle"].Placard2.Right.ClickDetector,
                            game.workspace.Map["Haunted Castle"].Placard3.Left.ClickDetector,
                            game.workspace.Map["Haunted Castle"].Placard4.Right.ClickDetector,
                            game.workspace.Map["Haunted Castle"].Placard5.Left.ClickDetector,
                            game.workspace.Map["Haunted Castle"].Placard6.Left.ClickDetector,
                            game.workspace.Map["Haunted Castle"].Placard7.Left.ClickDetector
                        }
                        for i, v in pairs(ClickSigns) do
                            fireclickdetector(v)
                        end
                    end
                elseif st == "Ghost" then 
                    if GetDistance(CFrame.new(-9755.6591796875, 271.0661315917969, 6290.61474609375)) > 7 then
                        Tweento(CFrame.new(-9755.6591796875, 271.0661315917969, 6290.61474609375))
                        game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("GuitarPuzzleProgress", "Ghost")
                    end  
                elseif st == "Trophie" then 
                    if GetDistance(CFrame.new(-9530.0126953125, 6.104853630065918, 6054.83349609375)) > 30 then
                        Tweento(CFrame.new(-9530.0126953125, 6.104853630065918, 6054.83349609375))
                    end
                    local DepTraiv4 = game.workspace.Map["Haunted Castle"].Tablet
                    for i, v in pairs(BlankTablets) do
                        local x = DepTraiv4[v]
                        if x.Line.Position.X ~= 0 then
                            repeat
                                wait()
                                fireclickdetector(x.ClickDetector)
                            until x.Line.Position.X == 0
                        end
                    end
                    for i, v in pairs(Trophy) do
                        local x = game.workspace.Map["Haunted Castle"].Trophies.Quest[v].Handle.CFrame
                        x = tostring(x)
                        x = x:split(", ")[4]
                        local c = "180"
                        if x == "1" or x == "-1" then
                            c = "90"
                        end
                        if not string.find(tostring(DepTraiv4[i].Line.Rotation.Z), c) then
                            repeat
                                wait()
                                fireclickdetector(DepTraiv4[i].ClickDetector)
                            until string.find(tostring(DepTraiv4[i].Line.Rotation.Z), c)
                            print(i, c)
                        end
                    end
                elseif st == "Pipe" then
                end 
                for i, v in pairs(Pipes) do
                    local x = game.workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model[i]
                    if x.BrickColor.Name ~= v then
                        repeat
                            wait()
                            fireclickdetector(x.ClickDetector)
                        until x.BrickColor.Name == v
                    end
                end
            elseif typeof(st) == "table" then 
                RealInfo = st.Status
                if RealInfo == "Ectoplasm" then 
                    if not Sea2 then 
                        TeleportWorld(2)
                        repeat task.wait() TeleportWorld(2) task.wait(10) until Sea2      
                    else
     