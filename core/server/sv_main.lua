SetRoutingBucketPopulationEnabled(0, false)
SetRoutingBucketEntityLockdownMode(0, 'strict')


_G.source_to_perm = {}

AddEventHandler("playerConnecting",function(name, setMessage, deferrals)
    if sv_cfg.toggles['store_user_data'] then
        local source = source
        local ids = GetPlayerIdentifiers(source)
        local time = os.time()
        local name = GetPlayerName(source)
        local steam = get_player_identifer("steam", source)
        deferrals.defer()

        if ids and #ids > 0 then
            Wait(5)

            if not steam then
                deferrals.done("Steam is required to play this server")
            else
                license = get_player_identifer("license", source)
                exports['ghmattimysql']:execute("SELECT * FROM user_info WHERE license = @license", {license = license}, function(result)
                    if #result >= 1 then
                        name = result[1].name
                        if GetPlayerName(source) ~= name then
                            exports['ghmattimysql']:execute("UPDATE user_info SET name = '" .. GetPlayerName(source) .. "' WHERE license = '" .. license .. "'", {})
                        end

                        local user = result[1]
                        local ban = json.decode(user.bandata)
                        if ban.banned then
                            if ban.perm then
                                deferrals.done("You are permanently banned from this server\nReason: "..ban.reason.."\nBy: "..ban.by.."\nAppeal @"..tostring(sv_cfg.server_info['discord_invite']))
                                return
                            end

                            local timeleft = ((ban.time-time)/3600)
                            if math.floor(timeleft/60) <= 0 then
                                unbanned = json.encode({banned = false, reason ="", by = "", time = 0, perm = false})
                                exports.ghmattimysql:execute("UPDATE user_info SET bandata = '" .. newban .. "' WHERE license = '" .. license .. "'", {})
                                deferrals.done("You are unbanned")
                                _G.source_to_perm[source] = get_player_user_id(source)
                                return
                            else
                                deferrals.done("You have been banned by: "..ban.by.."\nReason: "..ban.reason.."\nTime remaining: "..timeleft.."hrs\nYou can appeal @"..sv_cfg.server_info['discord_invite'])
                                return
                            end
                        else
                            deferrals.done()
                            _G.source_to_perm[source] = get_player_user_id(source)
                        end
                    else
                        NewPlayer(source, license)
                        deferrals.done()
                        _G.source_to_perm[source] = get_player_user_id(source)
                    end
                end)
            end
        else
            deferalls.done("You dont have any accounts linked to FiveM")
            return
        end
        Wait(5)
    else end
end)
                    


AddEventHandler('playerDropped', function (reason)
    local source = source
    _G.source_to_perm[source] = nil
end)
  
  




function NewPlayer(source, id)
    local steam = get_player_identifer("steam", source)
    local discord = get_player_identifer("discord", source)
    local ip = get_player_identifer("ip", source)
    print(GetPlayerName(source).." is registering")
    if source and id then
        exports['ghmattimysql']:execute("INSERT INTO user_info (`license`, `name`, `bandata`,`discord`, `ip`, `steam`) VALUES (@license, @name, @bandata, @discord, @ip, @steam);", {license = id, name = GetPlayerName(source), bandata = json.encode({banned = false, reason = "", by = "", time = 0, perm = false}),discord = discord, steam = steam, ip = ip}, function() end)
    end
    print(GetPlayerName(source).." registered")
end
                








function get_player_identifer(type, id)
    local identifiers = {}
    local numIdentifiers = GetNumPlayerIdentifiers(id)

    for a = 0, numIdentifiers do
        table.insert(identifiers, GetPlayerIdentifier(id, a))
    end

    for b = 1, #identifiers do
        if string.find(identifiers[b], type, 1) then
            return identifiers[b]
        end
    end
    return false
end


print("Server Loaded")
