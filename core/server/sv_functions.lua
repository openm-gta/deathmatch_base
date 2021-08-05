
function get_player_user_id(player)
    local license = get_player_identifer("license", player)
    local PermID = exports['ghmattimysql']:executeSync('SELECT id FROM user_info WHERE license = @license',{['@license'] = license})
    return PermID[1].id
end

function get_player_admin_level(user_id)
    local admin_level = exports['ghmattimysql']:executeSync('SELECT adminlvl FROM user_info WHERE id = @id',{['@id'] = user_id})
    if admin_level[1].adminlvl ~= nil then
        return admin_level[1].adminlvl
    else
        return 'invalid id / remember its the "permid" of the user'
    end
end

function set_user_admin_level(user_id, adminlvl)
    exports['ghmattimysql']:executeSync('UPDATE user_info SET adminlvl = @admin_level_to_set WHERE id = @id',{['@id'] = user_id, ['@admin_level_to_set'] = adminlvl})
end



function is_player_allowed_to(action, user_id)
    local user_admin_lvl = get_player_admin_level(user_id)
    local required_permission_for_action = sv_cfg.admin_permissions[action]
    if user_admin_lvl >= required_permission_for_action then
        return true 
    else
        return false
    end
end

--[[
USAGE: ^

local source_id = get_player_user_id(source)
if is_player_allowed_to('ban', source_id) then
    --- Do ban stuff here
else
    --- Player is not allowed to preform action
end

--]]

function get_player_stats(user_id) --- Not tested someone do please
    local player_stats = exports['ghmattimysql']:executeSync('SELECT kills, deaths FROM user_info WHERE id = @id',{['@id'] = user_id})
    return player_stats[1].kills, player_stats[1].deaths
end


function is_player_online(user_id)
    local players = GetPlayers()
    for _, v in ipairs(players) do
        if _G.source_to_perm[v] == user_id then
            return true
        end
    end
    return false
end

--- Will not work if u restart the resource without restarting server as it adds u to table once u join.
