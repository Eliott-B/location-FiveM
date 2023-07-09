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

RegisterCommand('location', function()
    local ped = PlayerPedId()
    local zone, street, crossingRoad = GetLocation(ped)
    TriggerEvent('chat:addMessage', {
        args = { 'District ', zone }
    })
    if(street ~= '') then
        TriggerEvent('chat:addMessage', {
            args = { 'Rue ', street }
        })
    end
    if(crossingRoad ~= '') then
        TriggerEvent('chat:addMessage', {
            args = { 'Route ', crossingRoad }
        })
    end
end)
