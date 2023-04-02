CreateThread(function()
    for i = 1, #Config.zones, 1 do
        local zonedata = Config.zones[i]

        exports['qb-target']:AddBoxZone(zonedata.name, zonedata.coords, zonedata.length, zonedata.width, {
            name = zonedata.name,
            heading = zonedata.heading,
            debugPoly = Config.debug,
            minZ = zonedata.minZ,
            maxZ = zonedata.maxZ
        }, {
            options = zonedata.options,
            distance = 1.5
        })
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        for i = 1, #Config.zones, 1 do
            exports['qb-target']:RemoveZone(Config.zones[i].name)
        end
    end
end)
