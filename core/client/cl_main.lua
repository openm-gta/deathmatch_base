-- CONFIG --

currentSpawn = nil
currentWeapon = nil

spawns = {
    ["LSD ATM"] = {
        coords = {
            vector3(1685.461, 4817.599, 42.00587),
            vector3(1693.494, 4814.708, 41.97884),
            vector3(1676.663, 4806.982, 42.0132),
            vector3(1663.785, 4812.57, 41.84346),
            vector3(1670.827, 4825.074, 42.02897),
            vector3(1680.79, 4833.053, 42.07229),
            vector3(1674.328, 4849.919, 42.02959),
            vector3(1667.286, 4841.607, 41.02661),
            vector3(1652.503, 4822.442, 41.99611),
            vector3(1643.453, 4830.88, 42.02599),
            vector3(1679.637, 4802.319, 41.99105)
        },
        name = "LSD ATM",
    },
    ["Rebel"] = {
        coords = {
            vector3(1486.15,6365.56,23.68),
            vector3(1481.54,6338.05,18.74),
            vector3(1432.77,6359.31,23.99),
            vector3(1505.84,6364.07,16.46),
            vector3(1502.36,6319.77,24.08),
            vector3(1516.32,6346.08,24.05),
            vector3(1552.12,6330.46,24.08),
            vector3(1545.13,6315.98,24.13),
            vector3(1543.61,6371.64,35.77),
            vector3(1492.23,6348.67,23.98),
            vector3(1542.54,6334.83,24.08),
            vector3(1522.77,6240.93,123.61),
            vector3(1350.94,6415.77,31.97),
            vector3(1492.58,6395.11,35.74),
            vector3(1479.85,6392.36,22.86)
        },
        name = "Rebel",
    }
}


assaultrifles = {
    {name = "AK200", spawncode = "WEAPON_AK200", hashkey = GetHashKey("WEAPON_AK200")},
    {name = "Carbine Rifle", spawncode = "WEAPON_CARBINERIFLE", hashkey = GetHashKey("WEAPON_CARBINERIFLE")},
}

sniperRifles  = {
    {name = "Mosin", spawncode = "WEAPON_MOSIN", hashkey = GetHashKey("WEAPON_MOSIN")},
    {name = "Heavy Sniper", spawncode = "WEAPON_HEAVYSNIPER", hashkey = GetHashKey("WEAPON_HEAVYSNIPER")},
}

pistols = { 
    {name = "M1911", spawncode = "WEAPON_M1911", hashkey = GetHashKey("WEAPON_M1911")},
    {name = "Heavy Pistol", spawncode = "WEAPON_HEAVYPISTOL", hashkey = GetHashKey("WEAPON_HEAVYPISTOL")},
    {name = "Glock 17", spawncode = "WEAPON_GLOCK17", hashkey = GetHashKey("WEAPON_GLOCK17")},
}

-- RAGEUI STUFF --
-- these are all the rageui submenus and main menu for the F1 menu --


RMenu.Add('mainmenu', 'main', RageUI.CreateMenu("", "Deathmatch",  1300,100, "banners", "mainmenu"))
RMenu.Add("mainmenu", "spawns", RageUI.CreateSubMenu(RMenu:Get("mainmenu", "main")))
RMenu.Add("mainmenu", "weapons", RageUI.CreateSubMenu(RMenu:Get("mainmenu", "main")))
RMenu.Add("mainmenu", "assaultrifles", RageUI.CreateSubMenu(RMenu:Get("mainmenu", "weapons")))
RMenu.Add("mainmenu", "snipers", RageUI.CreateSubMenu(RMenu:Get("mainmenu", "weapons")))
RMenu.Add("mainmenu", "pistols", RageUI.CreateSubMenu(RMenu:Get("mainmenu", "weapons")))

RageUI.CreateWhile(1.0, RMenu:Get('mainmenu', 'main'), nil, function()
    RageUI.IsVisible(RMenu:Get('mainmenu', 'main'), true, false, true, function()
        RageUI.Button("Weapon Menu", nil, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
            if (Hovered) then 
            end 
            if (Active) then 
            end 
            if (Selected) then
             end 
        end, RMenu:Get('mainmenu', 'weapons'))
        RageUI.Button("Teleport Menu", nil, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
            if (Hovered) then 
            end 
            if (Active) then 
            end 
            if (Selected) then
             end 
        end, RMenu:Get('mainmenu', 'spawns'))
        RageUI.Button("~r~Suicide", nil, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
          if (Selected) then
              SetEntityHealth(GetPlayerPed(-1), 0)
          end
        end)
end)
end)

RageUI.CreateWhile(1.0,RMenu:Get("mainmenu", "spawns"),nil,function()
    RageUI.IsVisible(RMenu:Get("mainmenu", "spawns"),true, false,true,function()
        RMenu:Get("mainmenu", "spawns"):SetSubtitle("Teleport Menu")
        CreateSpawnButtons()
    end)
end)

RageUI.CreateWhile(1.0,RMenu:Get("mainmenu", "snipers"),nil,function()
    RageUI.IsVisible(RMenu:Get("mainmenu", "snipers"),true, false,true,function()
        RMenu:Get("mainmenu", "snipers"):SetSubtitle("Snipers")
        SniperButtons()
    end)
end)

RageUI.CreateWhile(1.0,RMenu:Get("mainmenu", "pistols"),nil,function()
    RageUI.IsVisible(RMenu:Get("mainmenu", "pistols"),true, false,true,function()
        RMenu:Get("mainmenu", "pistols"):SetSubtitle("Pistols")
        PistolButtons()
    end)
end)

RageUI.CreateWhile(1.0,RMenu:Get("mainmenu", "assaultrifles"),nil,function()
    RageUI.IsVisible(RMenu:Get("mainmenu", "assaultrifles"),true, false,true,function()
        RMenu:Get("mainmenu", "snipers"):SetSubtitle("Assault Rifles")
        ARButtons()
    end)
end)



RageUI.CreateWhile(1.0,RMenu:Get("mainmenu", "weapons"),nil,function()
    RageUI.IsVisible(RMenu:Get("mainmenu", "weapons"),true, false,true,function()
        RMenu:Get("mainmenu", "weapons"):SetSubtitle("Weapon Menu")
        RageUI.Button("Assault Rifles", nil, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
            if (Hovered) then 
            end 
            if (Active) then 
            end 
            if (Selected) then
             end 
        end, RMenu:Get('mainmenu', 'assaultrifles'))
        RageUI.Button("Snipers", nil, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
            if (Hovered) then 
            end 
            if (Active) then 
            end 
            if (Selected) then
             end 
        end, RMenu:Get('mainmenu', 'snipers'))
        RageUI.Button("Pistols", nil, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
            if (Hovered) then 
            end 
            if (Active) then 
            end 
            if (Selected) then
             end 
        end, RMenu:Get('mainmenu', 'pistols'))
    end)
end)



-- MAIN FUNCTIONS




function CreateSpawnButtons()
    for k,v in pairs(spawns) do -- for every item in the table "spawns" it creates a button with the data in there
        RageUI.Button(v.name, "", {RightLabel = "→→→"}, true, function(Hovered, Active, Selected)
            if Selected and not IsEntityDead(PlayerPedId()) then
                Spawn(v.name)
            end
        end)
    end
end



function ARButtons()
    for k,v in pairs(assaultrifles) do -- same as the spawn button function but with weapons
        RageUI.Button(v.name,"",{RightLabel = "→→→"}, true, function(Hovered,Active,Selected)
            if Selected then
                GiveWeapon(v.hashkey)
            end
        end)
    end
end

function PistolButtons()
    for k,v in pairs(pistols) do -- same as the spawn button function but with weapons
        RageUI.Button(v.name,"",{RightLabel = "→→→"}, true, function(Hovered,Active,Selected)
            if Selected then
                GiveWeapon(v.hashkey)
            end
        end)
    end
end

function SniperButtons()
    for k,v in pairs(sniperRifles) do -- same as the spawn button function but with weapons
        RageUI.Button(v.name,"",{RightLabel = "→→→"}, true, function(Hovered,Active,Selected)
            if Selected then
                GiveWeapon(v.hashkey)
            end
        end)
    end
end



-- MAIN FUNCTIONS




function CreateSpawnButtons()
    for k,v in pairs(spawns) do -- for every item in the table "spawns" it creates a button with the data in there
        RageUI.Button(v.name, "", {RightLabel = "→→→"}, true, function(Hovered, Active, Selected)
            if Selected and not IsEntityDead(PlayerPedId()) then
                Spawn(v.name)
            end
        end)
    end
end






function GiveWeapon(spawncode)
    RemoveAllPedWeapons(PlayerPedId(),false) -- make sure they dont have more than 2 weapons
    GiveWeaponToPed(PlayerPedId(),spawncode,config.maxammo,false,true) -- give weapon to the ped
    currentWeapon = spawncode -- set the current weapon, for respawn
end



function Spawn(location)
    RandomPoint(location) -- picks random point in the location they are currently set to
    GiveWeapon(currentWeapon) -- gives them the weapon they died with
    currentSpawn = location -- sets their current spawn again just incase anything fucks up
    SetPedArmour(PlayerPedId(),100) -- 100 armour
end

function StartSpawn()
    currentSpawn = "Rebel"
    Spawn(currentSpawn)
end

function RandomPoint(location)
    math.randomseed(GetGameTimer())
    coord = math.random(1,#spawns[location].coords)
    SetEntityCoords(PlayerPedId(), spawns[location].coords[coord])

end



AddEventHandler("playerSpawned", function()
    if currentSpawn == nil then -- if this is their first time joining and no spawn is set, they spawn at rebel which can be changed in the StartSpawn function
        SetClothes()
        StartSpawn()
    else
        SetClothes()
        Spawn(currentSpawn) -- if this then their spawn is already set and it will teleport them over there
    end

    if currentWeapon == nil then
        GiveWeapon(GetHashKey("weapon_assaultrifle")) -- if they have no weapon, it gives them this
    else end

    SetEntityHealth(PlayerPedId(),200) -- sets to 200hp because some peds spawn with lowerhp
end)



function SetClothes()
    SetCanAttackFriendly(GetPlayerPed(-1), true, false)
	NetworkSetFriendlyFireOption(true)
	local mhash = config.defaultped
	RequestModel(mhash)
    while not HasModelLoaded(mhash) do
        RequestModel(mhash)
        Wait(10)
    end
	Wait(100)
	SetPlayerModel(PlayerId(), mhash)
	SetModelAsNoLongerNeeded(mhash)
end

RegisterKeyMapping("mainmenu", "Main Menu", "keyboard", "F1")
RegisterCommand("mainmenu", function()
    RageUI.Visible(RMenu:Get("mainmenu", "main"), not RageUI.Visible(RMenu:Get("mainmenu", "main")))
end)


-- HUD --

CreateThread(function()
    local blip = GetMainPlayerBlipId() -- the arrow blip you see on the map
    SetBlipAlpha(blip,100000)
    SetBlipScale(blip,0.5)
    SetBlipColour(blip,38)

	RequestStreamedTextureDict("circlemap", false)
	while not HasStreamedTextureDictLoaded("circlemap") do
		Wait(100)
	end
	AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circlemap", "radarmasksm") -- replacing old map texture with a circle map 
    local minimap = RequestScaleformMovie("minimap")
    while not HasScaleformMovieLoaded(minimap) do
      Wait(0)
    end
    SetMinimapComponentPosition("minimap", "L", "B", -0.005, -0.732, 0.210, 0.258888)
    SetMinimapComponentPosition("minimap_blur", "L", "B", 0.012, -0.641, 0.256, 0.337) -- moving the circle map to top right
    SetMinimapComponentPosition("minimap_mask", "L", "B", 0.012, -0.641, 0.256, 0.337)
    SetRadarBigmapEnabled(true, false)
    Wait(500)
    SetRadarBigmapEnabled(false, false)
    while true do
        Wait(0)
		SetBlipAlpha(GetNorthRadarBlip(), 0)
        BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR") -- hiding the armour and health default hud
        ScaleformMovieMethodAddParamInt(3)
        EndScaleformMovieMethod()

        local health = (GetEntityHealth(PlayerPedId()) - 100)
        local armor = GetPedArmour(PlayerPedId())
        SendNUIMessage({
            action = 'updateStatusHud', -- sending message to the NUI hud to update HP and armour constantly
            show = true,
            health = health,
            armour = armor,
        })
    end
end)

