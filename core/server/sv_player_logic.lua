RegisterNetEvent('dm_player_died')
AddEventHandler('dm_player_died', function (killer)
    local source = source
    local killer = killer
    local victim_user_id = get_player_user_id(source)
    local attacker_user_id = get_player_user_id(killer)
    if victim_user_id ~= nil and attacker_user_id ~= nil and GetEntityHealth(GetPlayerPed(source)) <= 1 then
        exports["ghmattimysql"]:executeSync("UPDATE user_info SET kills = kills + 1 WHERE id = @user_perm_id", {['@user_perm_id'] = attacker_user_id})
        exports["ghmattimysql"]:executeSync("UPDATE user_info SET deaths = deaths + 1 WHERE id = @user_perm_id", {['@user_perm_id'] = victim_user_id})
    end
end)