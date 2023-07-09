function GetLocation(ped)
    local globalZone = Config.ZoneName
    local pos = GetEntityCoords(ped)
    local zone = GetNameOfZone(pos.x, pos.y, pos.z)
    local zoneName = globalZone[zone]
    local street, crossingRoad = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
    local streetName = GetStreetNameFromHashKey(street)
    local crossingRoadName = GetStreetNameFromHashKey(crossingRoad)
    return zoneName, streetName, crossingRoadName
end

function PrintInChat(message)
    TriggerEvent('chat:addMessage', {
        args = { message }
    })
end

RegisterCommand('location', function()
    local ped = PlayerPedId()
    local zone, street, crossingRoad = GetLocation(ped)
    PrintInChat("Dristrict : " .. zone)
    if(street ~= '') then
        PrintInChat("Street : " .. street)
    end
    if(crossingRoad ~= '') then
        PrintInChat("Road : " .. crossingRoad)
    end
end)
