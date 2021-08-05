function get_killer()
    local player_source_of_death = GetPedSourceOfDeath(PlayerPedId())
    if IsEntityAPed(player_source_of_death) and IsPedAPlayer(player_source_of_death) then
        Killer = NetworkGetPlayerIndexFromPed(player_source_of_death)
    elseif IsEntityAVehicle(player_source_of_death) and IsEntityAPed(GetPedInVehicleSeat(player_source_of_death, -1)) and IsPedAPlayer(GetPedInVehicleSeat(player_source_of_death, -1)) then
        Killer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(player_source_of_death, -1))
    end
    return GetPlayerServerId(Killer)
end
