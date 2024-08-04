local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Fluent " .. Fluent.Version,
    SubTitle = "by dawid",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

       --- Hub Values ---
        Hub = {}
        Hub.Name = "Tsuo Hub"
        Hub.Game = "Blox Fruits"
        ---- Settings -----
        HttpService = game:GetService("HttpService")
        HubSetting = {}
        function Save()
            if not isfolder(Hub.Name) then
                makefolder(Hub.Name)
            end
            if not isfile(Hub.Name .. "/" .. game.Players.LocalPlayer.Name .. "-" .. Hub.Game .. ".json") then
                writefile(
                    Hub.Name .. "/" .. game.Players.LocalPlayer.Name .. "-" .. Hub.Game .. ".json",
                    HttpService:JSONEncode({})
                )
            end
            for i, v in pairs(Fluent.Options) do
                HubSetting[i] = v.Value
            end
            writefile(
                Hub.Name .. "/" .. game.Players.LocalPlayer.Name .. "-" .. Hub.Game .. ".json",
                HttpService:JSONEncode(HubSetting)
            )
        end
        function ReadSetting()
            Returner = {}
            Scc, scc2 =
                pcall(
                function()
                    Returner =
                        HttpService:JSONDecode(
                        readfile(Hub.Name .. "/" .. game.Players.LocalPlayer.Name .. "-" .. Hub.Game .. ".json")
                    )
                end
            )
            if
                not Scc or not isfolder(Hub.Name) or
                    not isfile(Hub.Name .. "/" .. game.Players.LocalPlayer.Name .. "-" .. Hub.Game .. ".json")
             then
                Save()
            end
            Scc, scc2 =
                pcall(
                function()
                    Returner =
                        HttpService:JSONDecode(
                        readfile(Hub.Name .. "/" .. game.Players.LocalPlayer.Name .. "-" .. Hub.Game .. ".json")
                    )
                end
            )
            return Returner
        end
        Config = ReadSetting()
        spawn(
            function()
                while task.wait() do
                    repeat
                        task.wait()
                    until LoadedUiHub
                    Save()
                    Config = ReadSetting()
                end
            end
        )
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
        end
        ------------------
        RandomText = {
            "The Simulation is who we really are?",
            "It fantasy",
            "Live for your life",
            "Cause i never surrender",
            "their reflection in your eyes",
            "make me wanna sacrifice",
            "Wont end it, this fantasy",
            "Love it",
            "I'll waitting, waitting",
            "and if ever feel lonely, come see me",
            "Cause i Need someone to belive in love"
        }
        randomtexte = RandomText[math.random(1, #RandomText)]
        ------- Joining Team ---- 
        function Join(v2) 
            v2 = tostring(v2) or "Pirates"
            v2 = string.find(v2,"Marine") and "Marines" or "Pirates"
            for i, v in pairs(
                getconnections(
                    game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container[v2].Frame.TextButton.Activated
                )
            ) do
                v.Function()
            end
        end
        repeat
            pcall(
                function()
                    task.wait()
                    if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("ChooseTeam") then 
                        Config["Team"] = Config["Team"] or "Pirates"
                        Join(Config["Team"])
                    end
                end
            )
        until game.Players.LocalPlayer.Team ~= nil
        --- Creating Ui ---
        
        local Icons = {}
        local Success, Response =
            pcall(
            function()
                Icons =
                    HttpService:JSONDecode(
                    game:HttpGetAsync(
                        "https://raw.githubusercontent.com/evoincorp/lucideblox/master/src/modules/util/icons.json"
                    )
                ).icons
            end
        )
        local MMBStatus = ""
        if not Success then
            game.Players.LocalPlayer:Kick("Can not get icons....")
        end  
        local CheckMobile = function()
            if
                game:GetService("UserInputService").TouchEnabled
             then
                return true 
            end
        end 
        IsMobile = CheckMobile()
        Size11,Size22 = 600,460
        if IsMobile then 
            Size11,Size22 = 500,290
            local ClickButton = Instance.new("ScreenGui")
            local MainFrame = Instance.new("Frame")
            local ImageLabel = Instance.new("ImageLabel")
            local TextButton = Instance.new("TextButton") 
            local UICorner = Instance.new("UICorner") 
            local UICorner_2 = Instance.new("UICorner")
            if game.CoreGui:FindFirstChild("ClickButton") then 
                game.CoreGui:FindFirstChild("ClickButton"):Destroy()
            end
            ClickButton.Name = "ClickButton"
            ClickButton.Parent = game.CoreGui
            ClickButton.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            
            MainFrame.Name = "MainFrame"
            MainFrame.Parent = ClickButton
            MainFrame.Active = true
            MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            MainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
            MainFrame.BorderColor3 = Color3.new(0, 0, 0)
            MainFrame.BorderSizePixel = 0
            MainFrame.Transparency = 1
            MainFrame.Position = UDim2.new(0.187441245, 0, 0.476932675, 0)
            MainFrame.Size = UDim2.new(0, 45, 0, 45)
            
            UICorner.CornerRadius = UDim.new(0, 100)
            UICorner.Parent = MainFrame
            
            UICorner_2.CornerRadius = UDim.new(0, 100)
            UICorner_2.Parent = ImageLabel
            
            ImageLabel.Parent = MainFrame
            ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
            ImageLabel.BackgroundColor3 = Color3.new(0, 0, 0)
            ImageLabel.BorderColor3 = Color3.new(0, 0, 0)
            ImageLabel.BorderSizePixel = 0
            ImageLabel.Position = UDim2.new(0.48888889, 0, 0.48888889, 0)
            ImageLabel.Size = UDim2.new(0, 45, 0, 45)
            ImageLabel.Image = "rbxassetid://15241946029"
            
            TextButton.Parent = MainFrame
            TextButton.BackgroundColor3 = Color3.new(1, 1, 1)
            TextButton.BackgroundTransparency = 1
            TextButton.BorderColor3 = Color3.new(0, 0, 0)
            TextButton.BorderSizePixel = 0
            TextButton.Position = UDim2.new(3.3908421e-07, 0, 0, 0)
            TextButton.Size = UDim2.new(0, 45, 0, 45)
            TextButton.AutoButtonColor = false
            TextButton.Font = Enum.Font.SourceSans
            TextButton.Text = ""
            TextButton.TextColor3 = Color3.new(255, 255, 255)
            TextButton.TextSize = 15
            TextButton.MouseButton1Click:Connect(function()
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"LeftControl",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"LeftControl",false,game)
            end)
        end 
        local Window =
            Fluent:CreateWindow(
            {
                Title = "Tsuo Hub Update 20",
                SubTitle = "Dev By VMH09",
                TabWidth = 160,
                Size = UDim2.fromOffset(Size11, Size22),
                Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
                Theme = "Darker",
                MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
            }
        )
        function Window:NewTab(mmb)
            local domain
            newmm = Window:AddTab(mmb)
            domain = newmm
            function newmm:NewParagraph(cf)
                local paragraphnew
                newTitle = cf.Title or "Tsuo Hub"
                newContent = cf.Content or "MMB"
                paragraphnew =
                    domain:AddParagraph(
                    {
                        Content = newContent,
                        Title = newTitle
                    }
                )
                function paragraphnew:Set(cf2)
                    newTitle = cf2.Title or "Tsuo Hub"
                    newContent = cf2.Content or "MMB"
                    paragraphnew:SetTitle(newTitle)
                    paragraphnew:SetDesc(newContent)
                end
                return paragraphnew
            end
            function newmm:NewButton(cf)
                cfreal = {}
                cfreal.Title = cf.Title or "Button"
                cfreal.Description = cf.Description or ""
                cfreal.Callback = cf.Callback or function()
                    end
                for i, v in pairs(cfreal) do
                    cf[i] = v
                end
        
                cfreal.V = domain:AddButton(cf)
                return cfreal.V
            end
            function newmm:NewDialog(cf)
                cfreal = {}
                cfreal.Title = cf.Title or ""
                cfreal.Content = cf.Content or ""
                cfreal.Buttons = cf.Buttons or {}
                for i, v in pairs(cfreal) do
                    cf[i] = v
                end
                return Window:Dialog(cf)
            end
            function newmm:NewToggle(sv, cf)
                cfreal = {}
                cfreal.Title = cf.Title or "Toggle"
                cfreal.Description = cf.Description or ""
                cfreal.Default = Config[sv]
                cfreal.Callback = cf.Callback or function()
                    end
                function cfreal:Set(bo)
                    Options[sv]:SetValue(bo)
                end
                for i, v in pairs(cfreal) do
                    cf[i] = v
                end
                cf.Callback = function(v)
                    cfreal.Callback(v)
                    Save()
                end
                fake = domain:AddToggle(sv, cf)
                for i, v in pairs(fake) do
                    if not cfreal[i] then
                        cfreal[i] = v
                    else
                        table.insert(cfreal, v)
                    end
                end
                return fake
            end
            function newmm:NewSlider(scriptitle, cf)
                DFConfig = {
                    Title = "Slider",
                    Description = "",
                    Min = 5,
                    Max = 150,
                    Default = (5 + 150) / 2,
                    Rounding = 1,
                    Callback = function(v)
                    end
                }
                if not Config[scriptitle] then 
                    Config[scriptitle] = cf.Min 
                end
                cf.Default = cf.Default or Config[scriptitle]
                DFConfig.Callback = cf.Callback or function(v)
                end
                for i, v in pairs(DFConfig) do
                    if not cf[i] then
                        cf[i] = v
                    end
                end  
                cf.Callback = function(v)
                    DFConfig.Callback(v)
                    Save()
                end
                DFSCRIPT = domain:AddSlider(scriptitle, cf)
                function DFSCRIPT:Set(v)
                    DFSCRIPT:SetValue(v)
                end
                return DFSCRIPT
            end
            function newmm:NewDropdown(title, cf)
                DefaultConfigDropdown = {
                    Title = "Drodown",
                    Values = {"MMB", "TSUO"},
                    Multi = false,
                    Default = nil
                }
                if cf.Multi then
                    if not Config[title] then
                        Config[title] = {}
                        for i, v in pairs(cf.Values) do
                            Config[title][v] = false
                        end
                    end
                end
                cf.Default = Config[title]
                local dropdown
                local dropdown = domain:AddDropdown(title, cf)
                dropdown:OnChanged(
                    function(cv)
                        pcall(
                            function(cv)
                                Save()
                            end
                        )
                    end
                )
                function dropdown:Set(v)
                    dropdown:SetValue(v)
                end
                return dropdown
            end
            function newmm:NewColorPicker(title, cf)
                DFConfig = {
                    Title = "Colorpicker",
                    Default = Color3.fromRGB(96, 205, 255)
                }
                for i, v in pairs(DefaultConfig) do
                    if not cf[i] then
                        cf[i] = v
                    end
                end
                cf.Callback = function(v)
                    DefaultConfig.Callback(v)
                    Save()
                end
                cf.Defualt = Config[title] or Color3.fromRGB(96, 205, 255)
                cl = domain:AddColorpicker(title, cf)
                function cl:Set(v)
                    cl:SetValueRGB(v)
                end
                return cl
            end
            function newmm:NewKeyBind(title, cf)
                DFConfig = {
                    Title = "gg",
                    Mode = "Toggle",
                    Default = "LeftControl"
                }
                for i, v in pairs(DFConfig) do
                    if not cf[i] then
                        cf[i] = v
                    end
                end
                cf.Callback = function(v)
                    DFConfig.Callback(v)
                    Save()
                end
                DFConfig.Defualt = Config[title]
                kb = domain:AddKeybind(title, cf)
                return kb
            end
            function newmm:NewInput(title, cf)
                DefaultConfig = {
                    Title = "Input",
                    Default = "",
                    Placeholder = "Paste Here",
                    Numeric = false, -- Only allows numbers
                    Finished = true, -- Only calls callback when you press enter
                    Callback = function(Value)
                    end
                }
                DefaultConfig.Defualt = Config[title]
                for i, v in pairs(DefaultConfig) do
                    if not cf[i] then
                        cf[i] = v
                    end
                end
                ip = domain:AddInput(title, cf)
                return ip
            end
            return newmm
        end
        function getRandomIcon()
            idicon = math.random(1, 555)
            idcount = 0
            for i, v in pairs(Icons) do
                if v then
                    if idcount == idicon then
                        return v
                    else
                        idcount = idcount + 1
                    end
                end
            end
            return ""
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
                                    game:GetService("Workspace").Map.Darkb