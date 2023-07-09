activate = false

function Draw2DText(x, y, text, scale)
    SetTextFont(4)
    SetTextProportional(7)
    SetTextScale(scale, scale)
    SetTextColour(255, 255, 255, 255)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

RegisterCommand('locationonscreen', function()
    activate = not activate
    local ped = PlayerPedId()
    while activate do
        Wait(1)
        local zone, street, crossingRoad = GetLocation(ped)
        print(zone, street, crossingRoad)

        Draw2DText(0.015, 0.71, zone, 0.50)
        Draw2DText(0.015, 0.735, street, 0.50)
        Draw2DText(0.015, 0.76, crossingRoad, 0.50)
    end
end)

RegisterKeyMapping('locationonscreen', 'Add/Remove location on screen', 'keyboard', 'f1')