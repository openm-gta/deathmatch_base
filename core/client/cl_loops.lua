CreateThread(function()
    if config.disablepunch then
        while true do
            if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("WEAPON_UNARMED") then
                DisableControlAction(0,263,true)
                DisableControlAction(0,264,true)
                DisableControlAction(0,257,true)
                DisableControlAction(0,140,true) 
                DisableControlAction(0,141,true) 
                DisableControlAction(0,142,true)
                DisableControlAction(0,143,true) 
                DisableControlAction(0,24,true)
                DisableControlAction(0,25,true) 
            end
            SetPedCanBeDraggedOut(PlayerPedId(),false)
            Wait(0)
        end
    else end
end)

CreateThread(function()
    while true do
        if handsup then
            DisableControlAction(2, 37, true)
            DisableControlAction(0,24,true) -- disable attack
            DisableControlAction(0,25,true) -- disable aim
            DisableControlAction(0,47,true) -- disable weapon
            DisableControlAction(0,58,true) -- disable weapon
            DisablePlayerFiring(PlayerPedId(),true)
        end
        Wait(0)
    end
end)

local handsup = false
CreateThread(function()
    if config.handsup then
        RequestAnimDict('mp_arresting')
        RequestAnimDict('random@arrests')
        RequestAnimDict('missminuteman_1ig_2')
        while true do
        if IsControlPressed(1, 323) then
            DisablePlayerFiring(PlayerPedId(), true)
            DisableControlAction(0, 22, true)
            DisableControlAction(0, 25, true)
            if not IsEntityDead(PlayerPedId()) then
                if not handsup then
                    handsup = true
                    TaskPlayAnim(PlayerPedId(), 'missminuteman_1ig_2', 'handsup_enter', 7.0, 1.0, -1, 50, 0, false, false, false)
                end
            end
        end
        if IsControlReleased(1, 323) and handsup then
            handsup = false
            CreateThread(function()
                local enableFiring = false
                CreateThread(function()
                    Wait(1000)
                    enableFiring = true
                end)
                while not enableFiring do
                    DisablePlayerFiring(PlayerPedId(), true)
                    Wait(1)
                end
            end)
            DisableControlAction(0, 21, true)
            DisableControlAction(0, 137, true)
            ClearPedTasks(PlayerPedId())
        end
        Wait(1)
    end
    else end
end)

CreateThread(function()
    while true do
    Wait(0)
    for i = 1, 12 do
        EnableDispatchService(i, false)
    end
        SetPlayerWantedLevel(PlayerId(), 0, false)
        SetPlayerWantedLevelNow(PlayerId(), false)
        SetPlayerWantedLevelNoDrop(PlayerId(), 0, false)
    end
end)

local toggleweather = true
CreateThread(function()
    while true do
        Wait(1)
        weather = config.weather
        WaterOverrideSetStrength(0.8)
        NetworkOverrideClockTime(11, 00, 00)
        SetWeatherTypePersist(weather)
        SetWeatherTypeNowPersist(weather)
        SetWeatherTypeNow(weather)
        SetOverrideWeather(weather)
        SetForcePedFootstepsTracks(false)
        SetForceVehicleTrails(false)
    end
end)


CreateThread( function()
    while true do
        Wait(1)
        RestorePlayerStamina(PlayerId(), 1.0)
        NetworkSetTalkerProximity(12.0)
        SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
        SetPedDropsWeaponsWhenDead(PlayerPedId(), 0)
    end
end)





Citizen.CreateThread(function()
    player_already_dead = false
    while true do
        Citizen.Wait(0)
        local player_ped = PlayerPedId()
        if IsEntityDead(player_ped) and not alreadyDead then
            exports.spawnmanager:setAutoSpawn(false)
            TriggerServerEvent("dm_player_died", get_killer())
            SetEntityHealth(player_ped,0)
            Citizen.Wait(1200)
            exports.spawnmanager:setAutoSpawn(true)
            player_already_dead = true
        end
        if not IsEntityDead(player_ped) then
            player_already_dead = false
        end
    end
end)
