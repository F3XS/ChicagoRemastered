--[[
    Any Credits to the Script Please Don't Steal them
    If you Want to use some Features On your Script Please Credit me ;)
    Thank you
]]

-- // ESP \\ 
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/F3XS/3007/main/releases/ESP.lua"))()
ESP:Toggle(true)
ESP.Players = true
ESP.Tracers = false
ESP.Boxes = false
ESP.Names = false

-- // Library \\ -- 
local Luxtl = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Luxware-UI-Library/main/Source.lua"))()

-- // Tittle \\ --
local Luxt = Luxtl.CreateWindow("Chixs Hub - 😈Chicago Remastered", 6105620301)


-- // Tabs \\ --
local PlayersTab = Luxt:Tab("Player", 9741305924)
local CombatTab = Luxt:Tab("Combat", 7072717139)
local VisualTab = Luxt:Tab("Visual", 7072715517)
local ShopTab = Luxt:Tab("Shop", 7072721954)
local AutoFarmTab = Luxt:Tab("AutoFarm", 6087485864)
local CreditsTab = Luxt:Tab("Credit", 9751999244)




-- // Credit Section \\ --
local Credit = CreditsTab:Section("Credit")

Credit:Label("Made By Chixie")

Credit:Label("UI Library Used | LuxWare")

Credit:Label("UI Library Owner | xHeptc")

Credit:Label("No Recoil | Modx#0001")

Credit:Label("ESP | Universal ESP")

-- // Visual Section \\ --
local Visual = VisualTab:Section("ESP")
Visual:Label("ESP")

Visual:Toggle("Toggle ESP", function(Value)
    ESP:Toggle(Value)
end)

Visual:Toggle("Show box", function(box)
    ESP.Boxes = (box)
end)

Visual:Toggle("Show Tracers", function(tracer)
    ESP.Tracers = (tracer)
end)

Visual:Toggle("Show Tracers", function(name)
    ESP.Names = (name)
end)

Visual:Label("Extra")

Visual:Slider("Field Of View", 70, 120, function(Value)
    game.Players.LocalPlayer.Data.Settings.FOV.Value = (Value)
end)

Visual:Button("Inf Zoom Distance", function()
    game.Players.LocalPlayer.CameraMaxZoomDistance = 190000000
end)

-- // Combat Section \\ -- 
local Combat = CombatTab:Section("Combat")

Combat:Label("Aimlock")

Combat:Button("Toggle Aimlock", function()
    getgenv().AimPart = "Head" -- For R15 Games: {UpperTorso, LowerTorso, HumanoidRootPart, Head} | For R6 Games: {Head, Torso, HumanoidRootPart}
              getgenv().AimlockToggleKey = "T" -- Toggles Aimbot On/Off 
              getgenv().AimRadius = 50 -- How far away from someones character you want to lock on at
              getgenv().ThirdPerson = false -- Locking onto someone in your Third Person POV
              getgenv().FirstPerson = true -- Locking onto someone in your First Person POV
              getgenv().TeamCheck = false -- Check if Target is on your Team (True means it wont lock onto your teamates, false is vice versa) (Set it to false if there are no teams)
              getgenv().PredictMovement = true -- Predicts if they are moving in fast velocity (like jumping) so the aimbot will go a bit faster to match their speed 
              getgenv().PredictionVelocity = 10 -- The speed of the PredictMovement feature 
    
              getgenv().CiazwareUniversalAimbotLoadingTime = tick()
              if CiazwareUniversalAimbotLoaded == true then
                  return 
              end
    
              local Players, Uis, RService, SGui = game:GetService"Players", game:GetService"UserInputService", game:GetService"RunService", game:GetService"StarterGui";
              local Client, Mouse, Camera, CF, RNew, Vec3, Vec2 = Players.LocalPlayer, Players.LocalPlayer:GetMouse(), workspace.CurrentCamera, CFrame.new, Ray.new, Vector3.new, Vector2.new;
              local Aimlock, MousePressed, CanNotify = true, false, false;
              local AimlockTarget;
              getgenv().CiazwareUniversalAimbotLoaded = true
    
    
    
              getgenv().WorldToViewportPoint = function(P)
              return Camera:WorldToViewportPoint(P)
          end
    
          getgenv().WorldToScreenPoint = function(P)
          return Camera.WorldToScreenPoint(Camera, P)
      end
    
      getgenv().GetObscuringObjects = function(T)
      if T and T:FindFirstChild(getgenv().AimPart) and Client and Client.Character:FindFirstChild("Head") then 
          local RayPos = workspace:FindPartOnRay(RNew(
              T[getgenv().AimPart].Position, Client.Character.Head.Position)
          )
          if RayPos then return RayPos:IsDescendantOf(T) end
      end
    end
    
    getgenv().GetNearestTarget = function()
        -- Credits to whoever made this, i didnt make it, and my own mouse2plr function kinda sucks
        local players = {}
        local PLAYER_HOLD  = {}
        local DISTANCES = {}
        for i, v in pairs(Players:GetPlayers()) do
            if v ~= Client then
                table.insert(players, v)
            end
        end
        for i, v in pairs(players) do
            if v.Character ~= nil then
                local AIM = v.Character:FindFirstChild("Head")
                if getgenv().TeamCheck == true and v.Team ~= Client.Team then
                    local DISTANCE = (v.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
                    local RAY = Ray.new(game.Workspace.CurrentCamera.CFrame.p, (Mouse.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * DISTANCE)
                    local HIT,POS = game.Workspace:FindPartOnRay(RAY, game.Workspace)
                    local DIFF = math.floor((POS - AIM.Position).magnitude)
                    PLAYER_HOLD[v.Name .. i] = {}
                    PLAYER_HOLD[v.Name .. i].dist= DISTANCE
                    PLAYER_HOLD[v.Name .. i].plr = v
                    PLAYER_HOLD[v.Name .. i].diff = DIFF
                    table.insert(DISTANCES, DIFF)
                elseif getgenv().TeamCheck == false and v.Team == Client.Team then 
                    local DISTANCE = (v.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
                    local RAY = Ray.new(game.Workspace.CurrentCamera.CFrame.p, (Mouse.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * DISTANCE)
                    local HIT,POS = game.Workspace:FindPartOnRay(RAY, game.Workspace)
                    local DIFF = math.floor((POS - AIM.Position).magnitude)
                    PLAYER_HOLD[v.Name .. i] = {}
                    PLAYER_HOLD[v.Name .. i].dist= DISTANCE
                    PLAYER_HOLD[v.Name .. i].plr = v
                    PLAYER_HOLD[v.Name .. i].diff = DIFF
                    table.insert(DISTANCES, DIFF)
                end
            end
        end
        
        if unpack(DISTANCES) == nil then
            return nil
        end
        
        local L_DISTANCE = math.floor(math.min(unpack(DISTANCES)))
        if L_DISTANCE > getgenv().AimRadius then
            return nil
        end
        
        for i, v in pairs(PLAYER_HOLD) do
            if v.diff == L_DISTANCE then
                return v.plr
            end
        end
        return nil
    end
    
    Uis.InputBegan:Connect(function(Key)
        if not (Uis:GetFocusedTextBox()) then 
            if Key.UserInputType == Enum.UserInputType.MouseButton2 then 
                pcall(function()
                    if MousePressed ~= true then MousePressed = true end 
                    local Target;Target = GetNearestTarget()
                    if Target ~= nil then 
                        AimlockTarget = Target
                        Notify("Ciazware", "Aimlock Target: "..tostring(AimlockTarget), "", 3)
                    end
                end)
            end
            if Key.KeyCode == Enum.KeyCode[AimlockToggleKey] then 
                Aimlock = not Aimlock
                Notify("Ciazware", "Aimlock: "..tostring(Aimlock), "", 3)
            end
        end
    end)
    Uis.InputEnded:Connect(function(Key)
        if not (Uis:GetFocusedTextBox()) then 
            if Key.UserInputType == Enum.UserInputType.MouseButton2 then 
                if AimlockTarget ~= nil then AimlockTarget = nil end
                if MousePressed ~= false then 
                    MousePressed = false 
                end
            end
        end
    end)
    
    RService.RenderStepped:Connect(function()
        if getgenv().FirstPerson == true and getgenv().ThirdPerson == false then 
            if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude <= 1 then 
                CanNotify = true 
            else 
                CanNotify = false 
            end
        elseif getgenv().ThirdPerson == true and getgenv().FirstPerson == false then 
            if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude > 1 then 
                CanNotify = true 
            else 
                CanNotify = false 
            end
        end
        if Aimlock == true and MousePressed == true then 
            if AimlockTarget and AimlockTarget.Character and AimlockTarget.Character:FindFirstChild(getgenv().AimPart) then 
                if getgenv().FirstPerson == true then
                    if CanNotify == true then
                        if getgenv().PredictMovement == true then 
                            Camera.CFrame = CF(Camera.CFrame.p, AimlockTarget.Character[getgenv().AimPart].Position + AimlockTarget.Character[getgenv().AimPart].Velocity/PredictionVelocity)
                        elseif getgenv().PredictMovement == false then 
                            Camera.CFrame = CF(Camera.CFrame.p, AimlockTarget.Character[getgenv().AimPart].Position)
                        end
                    end
                elseif getgenv().ThirdPerson == true then 
                    if CanNotify == true then
                        if getgenv().PredictMovement == true then 
                            Camera.CFrame = CF(Camera.CFrame.p, AimlockTarget.Character[getgenv().AimPart].Position + AimlockTarget.Character[getgenv().AimPart].Velocity/PredictionVelocity)
                        elseif getgenv().PredictMovement == false then 
                            Camera.CFrame = CF(Camera.CFrame.p, AimlockTarget.Character[getgenv().AimPart].Position)
                        end
                    end 
                end
            end
        end
    end)
end)

Combat:DropDown("AimPart", {"Head", "Torso", "Penis"}, function(Value) -- food is chosen item
        getgenv().AimPart = Value

        local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
        local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
        
        Notification:Notify(
            {Title = "Chixie", Description = "AimPart Changed to"}..Value,
            {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "option"},
            {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) print(tostring(State)) end}
        )
        
end)

Combat:DropDown("Aimlock Key", {"G", "H", "T", "V"}, function(Value) -- food is chosen item
        getgenv().AimlockToggleKey = Value

        local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
        local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
        
        Notification:Notify(
            {Title = "Chixie", Description = "Aimlock Key Changed to"}..Value,
            {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "option"},
            {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) print(tostring(State)) end}
        )
end)

Combat:Label("Other")

Combat:Button("HBE | Legit", function()
    --CONFIG
    local BoxSize = 5 --default 14
    local Transparency = 1
    --CONFIG ENG
    --Maelstronomer <-- Leeched the colliders off this guy
    local Players = game:GetService("Players")
    local renaming={
        ['Head'] = 1,
        ['Torso'] = 1,
        ['HumanoidRootPart'] = 1,
        ['Left Arm'] = 1,
        ['Right Arm'] = 1,
        ['Left Leg'] = 1,
        ['Right Leg']=1,
    }
    function stopCharacterCollision(character)
        --while not character.Parent do wait(.1) end
        spawn(function()
            --wait(5)
            
            wait() --print'k'
            local partData = {}
            for _, child in next, character:GetChildren() do
                --if child:IsA("BasePart") then
                if child:IsA("Part") or child:IsA("MeshPart") then
                    partData[child] = child.Name
                    child.Name = "BREAK"
                end
            end
            wait()
            for basePart, name in next, partData do
                basePart.Name = name
                basePart.CanCollide = false
            end
        end)
    end
    function hookPlayer(player)
        if player ~= Players.LocalPlayer then
            player.CharacterAdded:connect(stopCharacterCollision)
            if player.Character and player.Character.Parent then
                stopCharacterCollision(player.Character)
            end
        end
    end
    
    Players.ChildAdded:connect(hookPlayer)
    for _, player in next, Players:GetPlayers() do
        hookPlayer(player)
    end
    --actual work
    spawn(function()
    while wait() do
        for _, v in pairs(game.Players:GetPlayers()) do
            if v.Name == game.Players.LocalPlayer.Name then else
                if v ~= nill and v.Character ~= nil then
                    if v.Character:findFirstChild("HumanoidRootPart") ~= nil then
                        v.Character.HumanoidRootPart.Transparency = Transparency
                        v.Character.HumanoidRootPart.BrickColor = v.TeamColor--replace with team color
                        v.Character.HumanoidRootPart.Size = Vector3.new(BoxSize,BoxSize,BoxSize)
                    end
                    if v.Character:findFirstChild("Head") ~= nil then
                        v.Character.Head.Transparency = Transparency
                        v.Character.Head.BrickColor = v.TeamColor--replace with team color
                        v.Character.Head.Size = Vector3.new(2,2,2)
                    end
                end
            end
        end
    end
end)
end)

Combat:Button("HBE | Blatant", function()
    -- // CONFIG \\ --
    local BoxSize = 5 --default 14
    local Transparency = 1
    -- // CONFIG ENG \\ --
    -- // Maelstronomer <-- Leeched the colliders off this guy \\ --
    local Players = game:GetService("Players")
    local renaming={
        ['Head'] = 10,
        ['Torso'] = 1,
        ['HumanoidRootPart'] = 1,
        ['Left Arm'] = 1,
        ['Right Arm'] = 1,
        ['Left Leg'] = 1,
        ['Right Leg']=1,
    }
    function stopCharacterCollision(character)
        -- // while not character.Parent do wait(.1) end \\ --
        spawn(function()
            -- // wait(5) \\ --
            
            wait() -- // print'k' \\ --
            local partData = {}
            for _, child in next, character:GetChildren() do
                -- // if child:IsA("BasePart") then \\ --
                if child:IsA("Part") or child:IsA("MeshPart") then
                    partData[child] = child.Name
                    child.Name = "BREAK"
                end
            end
            wait()
            for basePart, name in next, partData do
                basePart.Name = name
                basePart.CanCollide = false
            end
        end)
    end
    function hookPlayer(player)
        if player ~= Players.LocalPlayer then
            player.CharacterAdded:connect(stopCharacterCollision)
            if player.Character and player.Character.Parent then
                stopCharacterCollision(player.Character)
            end
        end
    end
    
    Players.ChildAdded:connect(hookPlayer)
    for _, player in next, Players:GetPlayers() do
        hookPlayer(player)
    end
    -- // actual work \\ --
    spawn(function()
    while wait() do
        for _, v in pairs(game.Players:GetPlayers()) do
            if v.Name == game.Players.LocalPlayer.Name then else
                if v ~= nill and v.Character ~= nil then
                    if v.Character:findFirstChild("HumanoidRootPart") ~= nil then
                        v.Character.HumanoidRootPart.Transparency = Transparency
                        v.Character.HumanoidRootPart.BrickColor = v.TeamColor--replace with team color
                        v.Character.HumanoidRootPart.Size = Vector3.new(BoxSize,BoxSize,BoxSize)
                    end
                    if v.Character:findFirstChild("Head") ~= nil then
                        v.Character.Head.Transparency = Transparency
                        v.Character.Head.BrickColor = v.TeamColor -- // replace with team color \\ --
                        v.Character.Head.Size = Vector3.new(2,2,2)
                    end
                end
            end
        end
    end
end)
end)


Combat:Button("No Gun Recoil", function()
    local delay_hook = nil 
            delay_hook = replaceclosure(delay, newcclosure(function(...)
                local Arguments = ({...});
       
       if getcallingscript() and getcallingscript().Name ~= "GunClient" then 
           return delay_hook(...);
       end
       
       table.foreach(Arguments, function(Index, Value)
           if Value and type(Value) == "function" then 
               local valid_constants = getconstants(Value);
               -- // I know I can just do getconstants(Arguments[2]) but idk they might change it \\ --
               
               if valid_constants and table.find(valid_constants, "CoordinateFrame") then 
                   setconstant(Value, 12, "focus")
               end
           end
       end)
       
       return delay_hook(...);
    end));
end)

-- // AutoFarm Section \\ -- 
local AutoFarm = AutoFarmTab:Section("Auto Farm")
AutoFarm:Button("Bank Auto Rob | Rejoins you", function()
    getgenv().BankRobbed = false
    getgenv().SwitchServer = true



MaxCapacity = nil
local LocalPlayer = game:GetService("Players").LocalPlayer;
DiedCapacity = nil

local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

function start()
    --bank start
    local function SellBag()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-5.5096611976623535, -8.599377632141113, -19.811023712158203)
        task.wait(0.5)
        fireclickdetector(game:GetService("Workspace").Map.Buildings.Bank.Rob.Sell.ClickDetector)
    end

   --Buy bag function
   local function BuyBag()
    if not game:GetService("Workspace")[LocalPlayer.Name]:FindFirstChild("Duffel Bag") then
                game:GetService("ReplicatedStorage")._network.atm:InvokeServer("Withdraw", 100)

        game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = CFrame.new(-9, -9, -26)}):Play()
        wait(1)
        fireproximityprompt(game:GetService("Workspace").Map.NPCs.BankDealerNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt) -- fires the prompt inside of the object ( make sure your object has a proximityprompt )
        task.wait(0.5)
        game:GetService("ReplicatedStorage")._network.purchase:InvokeServer("bank_dealer", "Duffel Bag")
        task.wait(0.5)
        --MaxCapacity = game:GetService("Workspace")[LocalPlayer.Name]["Duffel Bag"].Handle.AmountDisplay.container["gold_container"].amount.Text:sub(2) 
        --print(MaxCapacity) 
        end
    end   

    FullBag2 = false

    Amm = 0
    FullBag = false
    local function GrabGold()
        while Amm ~= 5 do
            if getgenv().BankRobbed then return end
            for i,v in pairs(game:GetService("Workspace").Map.Buildings.Bank.Rob.items.gold:GetChildren()) do
                if  v.Gold.MeshPart.Transparency ~= 1 then
                    BuyBag()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Part.CFrame
                    wait(1)
                    fireclickdetector(v.ClickDetector) 
                    if game:GetService("Workspace")[LocalPlayer.Name]["Duffel Bag"].Handle.AmountDisplay.container["gold_container"].amount.Text == "5/5" then
                        FullBag = true
                        Amm = Amm + 1
                        SellBag()
                        task.wait(0.5)
                        getgenv().BankRobbed = true
                        if getgenv().SwitchServer then
                            Teleport()
                        end
                        --GrabJewerly()
                    end
                end
                
            end
        end
    end
    local function Grabcash()
        for i,v in pairs(game:GetService("Workspace").Map.Buildings.Bank.Rob.items.cash:GetChildren()) do
            if v.Transparency ~= 1 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                wait(1)
                fireclickdetector(v.ClickDetector) 
            end
        end
        GrabGold()
    end
   
    local function OpenBankDoor()
        game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = CFrame.new(-9, -9, -26)}):Play()
        task.wait(1)
        fireproximityprompt(game:GetService("Workspace").Map.NPCs.BankDealerNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt) -- fires the prompt inside of the object ( make sure your object has a proximityprompt )
        task.wait(0.5)
        game:GetService("ReplicatedStorage")._network.purchase:InvokeServer("bank_dealer", "C4")
        task.wait(0.5)
        game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = CFrame.new(-246, 5, 94)}):Play()
        task.wait(1)
        fireclickdetector(game:GetService("Workspace").Map.Buildings.Bank.Rob.Init.screen.ClickDetector)
        task.wait(2)
        game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = CFrame.new(-224.99034118652344, 6.321899890899658, 102.79098510742188)}):Play()
        task.wait(12)
        fireclickdetector(game:GetService("Workspace").Map.Buildings.Bank.Rob.vault.door.ClickDetector)
        Grabcash()
    end

  
    
    BuyBag()
    task.wait(0.5)
    if game:GetService("Workspace").Map.Buildings.Bank.Rob.Init["explode_wall"].CanCollide == true then
        OpenBankDoor()  
    elseif game:GetService("Workspace").Map.Buildings.Bank.Rob.Init["explode_wall"].CanCollide == false then
        game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = CFrame.new(-224.99034118652344, 6.321899890899658, 102.79098510742188)}):Play()
        task.wait(0.5)
        fireclickdetector(game:GetService("Workspace").Map.Buildings.Bank.Rob.vault.door.ClickDetector)
        task.wait(1)
        Grabcash()
    end
end
game:GetService("Players").LocalPlayer.Character.Humanoid.Died:connect(function()
    pcall(function()
        DiedCapacity = game:GetService("Workspace")[LocalPlayer.Name]["Duffel Bag"].Handle.AmountDisplay.container["gold_container"].amount.Text:sub(1, 1)
    end)
end)
    

repeat task.wait() until game:IsLoaded()
start()
end)



AutoFarm:Button("Jewelry Store Auto Rob | Rejoins You", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/jasonsworks/cr-autofarm/master/main.lua"))()
end)

AutoFarm:Toggle("Autorob | Not Mine made by Modx#0001", function(Value)
    getgenv().Autorob = (Value)
    
            spawn(function()
                while Autorob do
    
                    local moneybag = game:GetService("Workspace"):FindFirstChild("MoneyBag")
                    if moneybag then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = moneybag.CFrame
                        wait(0.1)
                        --- TP DANS LA SAFE ZONE
                        game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = CFrame.new(0, -10, 0)}):Play()
                    end
                    wait()
                end
            end)
    
        while Autorob do	
            local vu = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:connect(function()
                vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                wait(1)
                vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end)
    
    
        -------------- IL BRAQUE LE KFC
        if game:GetService("Workspace").Map.NPCs.InNOutNPC.RobValues.cooldown.Value == true then
            print("KFC IN CD")
            
        else
            print("KFC NO CD")
            game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = CFrame.new(589.576233, 4.51501942, -81.5663528, 0.90208447, 6.4622796e-09, -0.431559473, 2.41140299e-08, 1, 6.53795666e-08, 0.431559473, -6.93845266e-08, 0.90208447)}):Play()
            wait(0.5)
    
            local ohString1 = "InNOutNPC"
            game:GetService("ReplicatedStorage")._network.rob:FireServer(ohString1)
        end
    
        --- TP DANS LA SAFE ZONE
        game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = CFrame.new(0, -10, 0)}):Play()
        wait(0.5)
    
    -------------- IL BRAQUE LA SUPERETTE 7/11
    
        if game:GetService("Workspace").Map.NPCs["7/11NPC"].RobValues.cooldown.Value == true then
            print("7/11 IN CD")
            
        else
            print("7/11 NO CD")
            game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = CFrame.new(-65.8490982, 3.47316074, -194.744827, -0.0265948288, 3.41664652e-08, -0.999646306, 1.10695026e-08, 1, 3.388406e-08, 0.999646306, -1.01644462e-08, -0.0265948288)}):Play()
            wait(0.5)
            
            local ohString1 = "7/11NPC"
            game:GetService("ReplicatedStorage")._network.rob:FireServer(ohString1)
        end
        --- TP DANS LA SAFE ZONE
        game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = CFrame.new(0, -10, 0)}):Play()
    
    
    ------------- IL BRAQUE LA STATION SERVICE
    
        
    if game:GetService("Workspace").Map.NPCs.GasStationNPC.RobValues.cooldown.Value == true then
        print("GAS STATION IN CD")
        
    else
        print("GAS STATION NO CD")
        game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = CFrame.new(338.800415, 3.7742219, -45.2131996, -0.999761283, -7.49826796e-08, 0.0218488555, -7.59862004e-08, 1, -4.5100073e-08, -0.0218488555, -4.67495198e-08, -0.999761283)}):Play()
        wait(0.5)
    
        local ohString1 = "GasStationNPC"
        game:GetService("ReplicatedStorage")._network.rob:FireServer(ohString1)
    end
    --- TP DANS LA SAFE ZONE
    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = CFrame.new(0, -10, 0)}):Play()
    wait(0.5)
    
    
    ------------- IL BRAQUE LE DELI NPC 2
    
        
    if game:GetService("Workspace").Map.NPCs.Deli2NPC.RobValues.cooldown.Value == true then
        print("DELI2 IN CD")
        
    else
        print("DELI2 NO CD")
        game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = CFrame.new(234.3237, 3.24997902, -187.245102, -0.999642611, -1.07214717e-08, 0.0267333444, -8.79396467e-09, 1, 7.22187892e-08, -0.0267333444, 7.1957885e-08, -0.999642611)}):Play()
        wait(0.5)
    
        local ohString1 = "Deli2NPC"
        game:GetService("ReplicatedStorage")._network.rob:FireServer(ohString1)
    end
    --- TP DANS LA SAFE ZONE
    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = CFrame.new(0, -10, 0)}):Play()
    wait(0.5)
    
    ------------- IL BRAQUE LE BLOXGENERAL
    
        
    if game:GetService("Workspace").Map.NPCs.BloxGeneralNPC.RobValues.cooldown.Value == true then
        print("BLOXGENERAL 1 IN CD")
        
    else
        print("BLOXGENERAL 1 NO CD")
        game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = CFrame.new(652.790466, 3.27521968, 78.5791245, 0.999864817, 3.25941869e-08, -0.016441917, -3.2850128e-08, 1, -1.52964645e-08, 0.016441917, 1.58345159e-08, 0.999864817)}):Play()
        wait(0.5)
    
        local ohString1 = "BloxGeneralNPC"
        game:GetService("ReplicatedStorage")._network.rob:FireServer(ohString1)
    end
    --- TP DANS LA SAFE ZONE
    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = CFrame.new(0, -10, 0)}):Play()
    wait(0.5)
    
    ------------- IL BRAQUE LE BLOXGENERAL2
    
    
    if game:GetService("Workspace").Map.NPCs.BloxGeneralNPC2.RobValues.cooldown.Value == true then
        print("BLOXGENERAL 2 IN CD")
        
    else
        print("BLOXGENERAL 2 NO CD")
        game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = CFrame.new(653.025757, 3.27522063, 89.830246, 0.999956131, 3.56903951e-09, 0.00936501753, -2.95632585e-09, 1, -6.54396288e-08, -0.00936501753, 6.54090755e-08, 0.999956131)}):Play()
        wait(0.5)
    
        local ohString1 = "BloxGeneralNPC2"
        game:GetService("ReplicatedStorage")._network.rob:FireServer(ohString1)
    end
    --- TP DANS LA SAFE ZONE
    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = CFrame.new(0, -10, 0)}):Play()
    wait(0.5)
    
    
    
        end
end)

AutoFarm:Label("Job Autofarm")



AutoFarm:Toggle("Bartender Job", function(Value)
    while AutoBartender do	
        -------
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:connect(function()
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
        -------

        game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = CFrame.new(-249, 3, -47)}):Play();
        fireclickdetector(game:GetService("Workspace").Map.Jobs.Bartender.BottleGroup.ClickDetector, 10)
        wait()
    end
end)


-- // Player Section \\ -- 
local Player = PlayersTab:Section("Players")

Player:Button("Noclip | PRESS [K]", function()
    nam = game.Players.LocalPlayer.Name
        stat = "Off"
        plr = game.Players.LocalPlayer
        mouse = plr:GetMouse()
        k = "k"
        
        mouse.KeyDown:connect(
            function(key)
                if key == k then
                    if stat == "Off" then
                        stat = "On"
                    else
                        stat = "Off"
                    end
                end
            end
        )
        
        game:GetService("RunService").Stepped:connect(
            function()
                if stat == "On" then
                    for a, b in pairs(game.Workspace:GetChildren()) do
                        if b.Name == nam then
                            for i, v in pairs(game.Workspace[nam]:GetChildren()) do
                                if v:IsA("BasePart") then
                                    v.CanCollide = false
                                end
                            end
                        end
                    end
                end
            end
        )
        
        Workspace[nam].Head.Changed:connect(
            function()
                if stat == "On" then
                    for a, b in pairs(game.Workspace:GetChildren()) do
                        if b.Name == nam then
                            for i, v in pairs(game.Workspace[nam]:GetChildren()) do
                                if v:IsA("BasePart") then
                                    v.CanCollide = false
                                end
                            end
                        end
                    end
                end
            end)
end)

Player:TextBox("Teleport To Player", "Put [FULLNAME]", function(Value)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[Value].Character.HumanoidRootPart.CFrame
end)

Player:Slider("WalkSpeed", 16, 503, function(currentValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = currentValue
end)

Player:Slider("JumpPower", 16, 503, function(currentValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = currentValue
end)








-- // Shop Section \\ --
local Shop = ShopTab:Section("Shop")








-- // Dealer Shop Section \\ --
Shop:Label("Dealer")








Shop:Button("Buy C4 | 3,500$", function()
    if game.Players.LocalPlayer.Data.Stats.Cash.Value >= 3500 then
    
        game:GetService("Workspace").Map.NPCs.BankDealerNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt.RequiresLineOfSight = false

        yes = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
        

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7.36729527, -9.37552357, -26.8169289, -0.0188392345, -2.77030381e-08, 0.999822497, 4.10246592e-08, 1, 2.84809669e-08, -0.999822497, 4.1553939e-08, -0.0188392345)
        wait(0.5)
        fireproximityprompt(game:GetService("Workspace").Map.NPCs.BankDealerNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt, 1, true)

        wait(0.5)
        local ohString1 = "bank_dealer"
        local ohString2 = "C4"
        game:GetService("ReplicatedStorage")._network.purchase:InvokeServer(ohString1, ohString2)
        wait()
        local ohInstance1 = game:GetService("Players").LocalPlayer.PlayerGui.Shop
        game:GetService("ReplicatedStorage")._network.terminate:FireServer(ohInstance1)

        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = yes

    elseif game.Players.LocalPlayer.Data.Stats.Cash.Value <= 3500 then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Dirty Chixie";
            Text = "Damn Nigga ur broke";
            Icon = "http://www.roblox.com/asset/?id=7635712200";
            Duration = "10";
            Button1 = "Accept The Facts";
        })
    end
end)








Shop:Button("Buy Duffel Bag | 50$", function()
    if game.Players.LocalPlayer.Data.Stats.Cash.Value >= 50 then
    
        game:GetService("Workspace").Map.NPCs.BankDealerNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt.RequiresLineOfSight = false

        yes = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
        

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7.36729527, -9.37552357, -26.8169289, -0.0188392345, -2.77030381e-08, 0.999822497, 4.10246592e-08, 1, 2.84809669e-08, -0.999822497, 4.1553939e-08, -0.0188392345)
        wait(0.5)
        fireproximityprompt(game:GetService("Workspace").Map.NPCs.BankDealerNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt, 1, true)

        wait(0.5)
        local ohString1 = "bank_dealer"
        local ohString2 = "Duffel Bag"
        game:GetService("ReplicatedStorage")._network.purchase:InvokeServer(ohString1, ohString2)
        wait()
        local ohInstance1 = game:GetService("Players").LocalPlayer.PlayerGui.Shop
        game:GetService("ReplicatedStorage")._network.terminate:FireServer(ohInstance1)

        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = yes

    elseif game.Players.LocalPlayer.Data.Stats.Cash.Value <= 3500 then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Dirty Chixie";
            Text = "Fucking Broke ass only 50$?";
            Icon = "http://www.roblox.com/asset/?id=7635712200";
            Duration = "10";
            Button1 = "Accept The Facts";
        })
    end
end)








-- // Gun Store Shop Section \\ --
Shop:Label("Gun Store")








Shop:Button("Buy Ruger | 2,500$", function()
    if game.Players.LocalPlayer.Data.Stats.Cash.Value >= 2500 then
    
            
        game:GetService("Workspace").Map.NPCs.GunstoreNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt.RequiresLineOfSight = false

        yes = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
        

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(119.04763, 3.24572945, 46.8957443, 0.036562264, -9.65525437e-09, -0.999331355, 1.32148585e-07, 1, -4.82683049e-09, 0.999331355, -1.31883752e-07, 0.036562264)
        wait(0.5)
        fireproximityprompt(game:GetService("Workspace").Map.NPCs.GunstoreNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt, 1, true)

        wait(0.5)
        local ohString1 = "gun_store"
        local ohString2 = "Ruger LCP"
        game:GetService("ReplicatedStorage")._network.purchase:InvokeServer(ohString1, ohString2)
        wait()
        local ohInstance1 = game:GetService("Players").LocalPlayer.PlayerGui.Shop
        game:GetService("ReplicatedStorage")._network.terminate:FireServer(ohInstance1)

        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = yes   
    elseif game.Players.LocalPlayer.Data.Stats.Cash.Value <= 2500 then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Dirty Chixie";
            Text = "Nigga you this broke?";
            Icon = "http://www.roblox.com/asset/?id=7635712200";
            Duration = "10";
            Button1 = "Accept The Facts";
        })
    end
end)








Shop:Button("Buy Makarov | 2,700$", function()
    if game.Players.LocalPlayer.Data.Stats.Cash.Value >= 2750 then
    
        game:GetService("Workspace").Map.NPCs.GunstoreNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt.RequiresLineOfSight = false

        yes = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
        

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(119.04763, 3.24572945, 46.8957443, 0.036562264, -9.65525437e-09, -0.999331355, 1.32148585e-07, 1, -4.82683049e-09, 0.999331355, -1.31883752e-07, 0.036562264)
        wait(0.5)
        fireproximityprompt(game:GetService("Workspace").Map.NPCs.GunstoreNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt, 1, true)

        wait(0.5)
        local ohString1 = "gun_store"
        local ohString2 = "Makarov"
        game:GetService("ReplicatedStorage")._network.purchase:InvokeServer(ohString1, ohString2)
        wait()
        local ohInstance1 = game:GetService("Players").LocalPlayer.PlayerGui.Shop
        game:GetService("ReplicatedStorage")._network.terminate:FireServer(ohInstance1)

        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = yes

    elseif game.Players.LocalPlayer.Data.Stats.Cash.Value <= 2750 then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Dirty Chixie";
            Text = "Nigga If your This broke use my AutoFarm";
            Icon = "http://www.roblox.com/asset/?id=7635712200";
            Duration = "10";
            Button1 = "Okay Dirty Chixie ;(";
        })
    end
end)








Shop:Button("Buy G26 | 2,900$", function()
    if game.Players.LocalPlayer.Data.Stats.Cash.Value >= 2900 then
    
        game:GetService("Workspace").Map.NPCs.GunstoreNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt.RequiresLineOfSight = false

        yes = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
        

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(119.04763, 3.24572945, 46.8957443, 0.036562264, -9.65525437e-09, -0.999331355, 1.32148585e-07, 1, -4.82683049e-09, 0.999331355, -1.31883752e-07, 0.036562264)
        wait(0.5)
        fireproximityprompt(game:GetService("Workspace").Map.NPCs.GunstoreNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt, 1, true)

        wait(0.5)
        local ohString1 = "gun_store"
        local ohString2 = "G26"
        game:GetService("ReplicatedStorage")._network.purchase:InvokeServer(ohString1, ohString2)
        wait()
        local ohInstance1 = game:GetService("Players").LocalPlayer.PlayerGui.Shop
        game:GetService("ReplicatedStorage")._network.terminate:FireServer(ohInstance1)

        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = yes

    elseif game.Players.LocalPlayer.Data.Stats.Cash.Value <= 2900 then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Dirty Chixie";
            Text = "Nigga If your This broke use my AutoFarm";
            Icon = "http://www.roblox.com/asset/?id=7635712200";
            Duration = "10";
            Button1 = "Okay Dirty Chixie ;(";
        })
    end
end)








Shop:Button("Buy G17 | 3,000$", function()
    if game.Players.LocalPlayer.Data.Stats.Cash.Value >= 3000 then
    
        game:GetService("Workspace").Map.NPCs.GunstoreNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt.RequiresLineOfSight = false

        yes = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
        

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(119.04763, 3.24572945, 46.8957443, 0.036562264, -9.65525437e-09, -0.999331355, 1.32148585e-07, 1, -4.82683049e-09, 0.999331355, -1.31883752e-07, 0.036562264)
        wait(0.5)
        fireproximityprompt(game:GetService("Workspace").Map.NPCs.GunstoreNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt, 1, true)

        wait(0.5)
        local ohString1 = "gun_store"
        local ohString2 = "G17"
        game:GetService("ReplicatedStorage")._network.purchase:InvokeServer(ohString1, ohString2)
        wait()
        local ohInstance1 = game:GetService("Players").LocalPlayer.PlayerGui.Shop
        game:GetService("ReplicatedStorage")._network.terminate:FireServer(ohInstance1)

        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = yes
    elseif game.Players.LocalPlayer.Data.Stats.Cash.Value <= 3000 then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Dirty Chixie";
            Text = "Nigga If your This broke use my AutoFarm";
            Icon = "http://www.roblox.com/asset/?id=7635712200";
            Duration = "10";
            Button1 = "Okay Dirty Chixie ;(";
        })
    end
end)








Shop:Button("Buy Berreta M9 | 3,500$", function()
    if game.Players.LocalPlayer.Data.Stats.Cash.Value >= 3500 then
    
        game:GetService("Workspace").Map.NPCs.GunstoreNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt.RequiresLineOfSight = false

        yes = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
        

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(119.04763, 3.24572945, 46.8957443, 0.036562264, -9.65525437e-09, -0.999331355, 1.32148585e-07, 1, -4.82683049e-09, 0.999331355, -1.31883752e-07, 0.036562264)
        wait(0.5)
        fireproximityprompt(game:GetService("Workspace").Map.NPCs.GunstoreNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt, 1, true)

        wait(0.5)
        local ohString1 = "gun_store"
        local ohString2 = "Berreta M9"
        game:GetService("ReplicatedStorage")._network.purchase:InvokeServer(ohString1, ohString2)
        wait()
        local ohInstance1 = game:GetService("Players").LocalPlayer.PlayerGui.Shop
        game:GetService("ReplicatedStorage")._network.terminate:FireServer(ohInstance1)

        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = yes
    elseif game.Players.LocalPlayer.Data.Stats.Cash.Value <= 3500 then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Dirty Chixie";
            Text = "Nigga If your This broke use my AutoFarm";
            Icon = "http://www.roblox.com/asset/?id=7635712200";
            Duration = "10";
            Button1 = "Okay Dirty Chixie ;(";
        })
    end
end)








Shop:Button("Buy 1911 | 4,000$", function()
    if game.Players.LocalPlayer.Data.Stats.Cash.Value >= 4000 then
    
        game:GetService("Workspace").Map.NPCs.GunstoreNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt.RequiresLineOfSight = false

        yes = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
        

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(119.04763, 3.24572945, 46.8957443, 0.036562264, -9.65525437e-09, -0.999331355, 1.32148585e-07, 1, -4.82683049e-09, 0.999331355, -1.31883752e-07, 0.036562264)
        wait(0.5)
        fireproximityprompt(game:GetService("Workspace").Map.NPCs.GunstoreNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt, 1, true)

        wait(0.5)
        local ohString1 = "gun_store"
        local ohString2 = "1911"
        game:GetService("ReplicatedStorage")._network.purchase:InvokeServer(ohString1, ohString2)
        wait()
        local ohInstance1 = game:GetService("Players").LocalPlayer.PlayerGui.Shop
        game:GetService("ReplicatedStorage")._network.terminate:FireServer(ohInstance1)

        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = yes
    elseif game.Players.LocalPlayer.Data.Stats.Cash.Value <= 4000 then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Dirty Chixie";
            Text = "Nigga If your This broke use my AutoFarm";
            Icon = "http://www.roblox.com/asset/?id=7635712200";
            Duration = "10";
            Button1 = "Okay Dirty Chixie ;(";
        })
    end
end)








Shop:Button("Buy G20 | 5,000$", function()
    if game.Players.LocalPlayer.Data.Stats.Cash.Value >= 5000 then
    
        game:GetService("Workspace").Map.NPCs.GunstoreNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt.RequiresLineOfSight = false

        yes = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
        

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(119.04763, 3.24572945, 46.8957443, 0.036562264, -9.65525437e-09, -0.999331355, 1.32148585e-07, 1, -4.82683049e-09, 0.999331355, -1.31883752e-07, 0.036562264)
        wait(0.5)
        fireproximityprompt(game:GetService("Workspace").Map.NPCs.GunstoreNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt, 1, true)

        wait(0.5)
        local ohString1 = "gun_store"
        local ohString2 = "G20"
        game:GetService("ReplicatedStorage")._network.purchase:InvokeServer(ohString1, ohString2)
        wait()
        local ohInstance1 = game:GetService("Players").LocalPlayer.PlayerGui.Shop
        game:GetService("ReplicatedStorage")._network.terminate:FireServer(ohInstance1)

        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = yes

    elseif game.Players.LocalPlayer.Data.Stats.Cash.Value <= 5000 then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Dirty Chixie";
            Text = "Nigga If your This broke use my AutoFarm";
            Icon = "http://www.roblox.com/asset/?id=7635712200";
            Duration = "10";
            Button1 = "Okay Dirty Chixie ;(";
        })
    end
end)

Shop:Button("Buy Armor | 20,000$", function()
    if game.Players.LocalPlayer.Data.Stats.Cash.Value >= 20000 then
    
        game:GetService("Workspace").Map.NPCs.GunstoreNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt.RequiresLineOfSight = false

        yes = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
        

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(119.04763, 3.24572945, 46.8957443, 0.036562264, -9.65525437e-09, -0.999331355, 1.32148585e-07, 1, -4.82683049e-09, 0.999331355, -1.31883752e-07, 0.036562264)
        wait(0.5)
        fireproximityprompt(game:GetService("Workspace").Map.NPCs.GunstoreNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt, 1, true)

        wait(0.5)
        local ohString1 = "gun_store"
        local ohString2 = "BodyArmor"
        game:GetService("ReplicatedStorage")._network.purchase:InvokeServer(ohString1, ohString2)
        wait()
        local ohInstance1 = game:GetService("Players").LocalPlayer.PlayerGui.Shop
        game:GetService("ReplicatedStorage")._network.terminate:FireServer(ohInstance1)

        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = yes
    elseif game.Players.LocalPlayer.Data.Stats.Cash.Value <= 20000 then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Dirty Chixie";
            Text = "Goofy ahh so broke mf";
            Icon = "http://www.roblox.com/asset/?id=7635712200";
            Duration = "10";
            Button1 = "Okay Dirty Chixie ;(";
        })
    end
end)

Shop:Label("Extra Store")

Shop:Button("Buy Shiesty Mask | 25$", function()
    if game.Players.LocalPlayer.Data.Stats.Cash.Value >= 25 then
    
        game:GetService("Workspace").Map.NPCs.DeliNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt.RequiresLineOfSight = false

        yes = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
        

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-64.1425247, 3.55489969, 57.7317085, -0.0533979461, -7.1409616e-08, 0.998573303, -1.13012544e-09, 1, 7.14512041e-08, -0.998573303, 2.68683453e-09, -0.0533979461)
        wait(0.5)
        fireproximityprompt(game.Workspace.Map.NPCs.DeliNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt, 1, true)

        wait(0.5)
        local ohString1 = "deli"
        local ohString2 = "OpenBalaclava"
        game:GetService("ReplicatedStorage")._network.purchase:InvokeServer(ohString1, ohString2)
        wait()
        local ohInstance1 = game:GetService("Players").LocalPlayer.PlayerGui.Shop
        game:GetService("ReplicatedStorage")._network.terminate:FireServer(ohInstance1)

        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = yes
    elseif game.Players.LocalPlayer.Data.Stats.Cash.Value <= 25 then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Dirty Chixie";
            Text = "Goofy ahh so broke mf";
            Icon = "http://www.roblox.com/asset/?id=7635712200";
            Duration = "10";
            Button1 = "Okay Dirty Chixie ;(";
        })
    end
end)

Shop:Button("Buy Balaclava Mask | 25$", function()
    if game.Players.LocalPlayer.Data.Stats.Cash.Value >= 25 then
    
        game:GetService("Workspace").Map.NPCs.DeliNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt.RequiresLineOfSight = false

        yes = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
        

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-64.1425247, 3.55489969, 57.7317085, -0.0533979461, -7.1409616e-08, 0.998573303, -1.13012544e-09, 1, 7.14512041e-08, -0.998573303, 2.68683453e-09, -0.0533979461)
        wait(0.5)
        fireproximityprompt(game.Workspace.Map.NPCs.DeliNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt, 1, true)

        wait(0.5)
        local ohString1 = "deli"
        local ohString2 = "Balaclava"
        game:GetService("ReplicatedStorage")._network.purchase:InvokeServer(ohString1, ohString2)
        wait()
        local ohInstance1 = game:GetService("Players").LocalPlayer.PlayerGui.Shop
        game:GetService("ReplicatedStorage")._network.terminate:FireServer(ohInstance1)

        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = yes
    elseif game.Players.LocalPlayer.Data.Stats.Cash.Value <= 25 then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Dirty Chixie";
            Text = "Goofy ahh so broke mf";
            Icon = "http://www.roblox.com/asset/?id=7635712200";
            Duration = "10";
            Button1 = "Okay Dirty Chixie ;(";
        })
    end
end)

Shop:Button("Buy Surgical White Mask | 6$", function()
    if game.Players.LocalPlayer.Data.Stats.Cash.Value >= 6 then
    
        game:GetService("Workspace").Map.NPCs.DeliNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt.RequiresLineOfSight = false

        yes = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
        

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-64.1425247, 3.55489969, 57.7317085, -0.0533979461, -7.1409616e-08, 0.998573303, -1.13012544e-09, 1, 7.14512041e-08, -0.998573303, 2.68683453e-09, -0.0533979461)
        wait(0.5)
        fireproximityprompt(game.Workspace.Map.NPCs.DeliNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt, 1, true)

        wait(0.5)
        local ohString1 = "deli"
        local ohString2 = "Surgical Mask (White)"
        game:GetService("ReplicatedStorage")._network.purchase:InvokeServer(ohString1, ohString2)
        wait()
        local ohInstance1 = game:GetService("Players").LocalPlayer.PlayerGui.Shop
        game:GetService("ReplicatedStorage")._network.terminate:FireServer(ohInstance1)

        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = yes
    elseif game.Players.LocalPlayer.Data.Stats.Cash.Value <= 6 then
    game.StarterGui:SetCore("SendNotification", {
        Title = "Dirty Chixie";
        Text = "Goofy ahh so broke mf";
        Icon = "http://www.roblox.com/asset/?id=7635712200";
        Duration = "10";
        Button1 = "Okay Dirty Chixie ;(";
    })
end
end)

Shop:Button("Buy  Surgical Black Mask | 25$", function()
    if game.Players.LocalPlayer.Data.Stats.Cash.Value >= 6 then
    
        game:GetService("Workspace").Map.NPCs.DeliNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt.RequiresLineOfSight = false

        yes = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
        

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-64.1425247, 3.55489969, 57.7317085, -0.0533979461, -7.1409616e-08, 0.998573303, -1.13012544e-09, 1, 7.14512041e-08, -0.998573303, 2.68683453e-09, -0.0533979461)
        wait(0.5)
        fireproximityprompt(game.Workspace.Map.NPCs.DeliNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt, 1, true)

        wait(0.5)
        local ohString1 = "deli"
        local ohString2 = "Surgical Mask (Black)"
        game:GetService("ReplicatedStorage")._network.purchase:InvokeServer(ohString1, ohString2)
        wait()
        local ohInstance1 = game:GetService("Players").LocalPlayer.PlayerGui.Shop
        game:GetService("ReplicatedStorage")._network.terminate:FireServer(ohInstance1)

        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = yes

    elseif game.Players.LocalPlayer.Data.Stats.Cash.Value <= 6 then
    game.StarterGui:SetCore("SendNotification", {
        Title = "Dirty Chixie";
        Text = "Goofy ahh so broke mf";
        Icon = "http://www.roblox.com/asset/?id=7635712200";
        Duration = "10";
        Button1 = "Okay Dirty Chixie ;(";
    })
end
end)


Shop:Button("Buy Water | 15$", function()
    if game.Players.LocalPlayer.Data.Stats.Cash.Value >= 15 then
    
        game:GetService("Workspace").Map.NPCs.DeliNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt.RequiresLineOfSight = false

        yes = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
        

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-64.1425247, 3.55489969, 57.7317085, -0.0533979461, -7.1409616e-08, 0.998573303, -1.13012544e-09, 1, 7.14512041e-08, -0.998573303, 2.68683453e-09, -0.0533979461)
        wait(0.5)
        fireproximityprompt(game:GetService("Workspace").Map.NPCs.DeliNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt, 1, true)

        wait(0.5)
        local ohString1 = "deli"
        local ohString2 = "Water"
        game:GetService("ReplicatedStorage")._network.purchase:InvokeServer(ohString1, ohString2)
        wait()
        local ohInstance1 = game:GetService("Players").LocalPlayer.PlayerGui.Shop
        game:GetService("ReplicatedStorage")._network.terminate:FireServer(ohInstance1)

        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = yes
    elseif game.Players.LocalPlayer.Data.Stats.Cash.Value <= 15 then
    game.StarterGui:SetCore("SendNotification", {
        Title = "Dirty Chixie";
        Text = "Goofy ahh so broke mf";
        Icon = "http://www.roblox.com/asset/?id=7635712200";
        Duration = "10";
        Button1 = "Okay Dirty Chixie ;(";
    })
end
end)

Shop:Button("Buy Bloxy Cola | 10$", function()
    if game.Players.LocalPlayer.Data.Stats.Cash.Value >= 10 then
    
        game:GetService("Workspace").Map.NPCs.DeliNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt.RequiresLineOfSight = false

        yes = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
        

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-64.1425247, 3.55489969, 57.7317085, -0.0533979461, -7.1409616e-08, 0.998573303, -1.13012544e-09, 1, 7.14512041e-08, -0.998573303, 2.68683453e-09, -0.0533979461)
        wait(0.5)
        fireproximityprompt(game:GetService("Workspace").Map.NPCs.DeliNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt, 1, true)

        wait(0.5)
        local ohString1 = "deli"
        local ohString2 = "BloxyCola"
        game:GetService("ReplicatedStorage")._network.purchase:InvokeServer(ohString1, ohString2)
        wait()
        local ohInstance1 = game:GetService("Players").LocalPlayer.PlayerGui.Shop
        game:GetService("ReplicatedStorage")._network.terminate:FireServer(ohInstance1)

        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = yes
    elseif game.Players.LocalPlayer.Data.Stats.Cash.Value <= 10 then
    game.StarterGui:SetCore("SendNotification", {
        Title = "Dirty Chixie";
        Text = "Goofy ahh so broke mf";
        Icon = "http://www.roblox.com/asset/?id=7635712200";
        Duration = "10";
        Button1 = "Okay Dirty Chixie ;(";
    })
end
end)

Shop:Button("Buy Burger | 15$", function()
    if game.Players.LocalPlayer.Data.Stats.Cash.Value >= 15 then
                            
        game:GetService("Workspace").Map.NPCs.InNOutNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt.RequiresLineOfSight = false

        yes = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
        

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(591.162903, 4.51501942, -81.2139816, 0.992074192, -3.99510718e-08, 0.12565361, 4.25762394e-08, 1, -1.82065349e-08, -0.12565361, 2.341209e-08, 0.992074192)
        wait(0.5)
        fireproximityprompt(game:GetService("Workspace").Map.NPCs.InNOutNPC.HumanoidRootPart.PromptAttachment.ProximityPrompt, 1, true)

        wait(0.5)
        local ohString1 = "in_n_out"
        local ohString2 = "Burger"
        game:GetService("ReplicatedStorage")._network.purchase:InvokeServer(ohString1, ohString2)
        wait()
        local ohInstance1 = game:GetService("Players").LocalPlayer.PlayerGui.Shop
        game:GetService("ReplicatedStorage")._network.terminate:FireServer(ohInstance1)

        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = yes
    elseif game.Players.LocalPlayer.Data.Stats.Cash.Value <= 15 then
    game.StarterGui:SetCore("SendNotification", {
        Title = "Dirty Chixie";
        Text = "Goofy ahh so broke mf";
        Icon = "http://www.roblox.com/asset/?id=7635712200";
        Duration = "10";
        Button1 = "Okay Dirty Chixie ;(";
    })
end
end)
