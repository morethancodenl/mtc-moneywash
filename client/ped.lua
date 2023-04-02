SpawnedPed = nil
Ped = {}

function Ped:spawn()
    local coords = Config.npc.coords
    local model = joaat(Config.npc.model)

    self:delete() --> only 1 ped at a time

    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(50)
    end

    SpawnedPed = CreatePed(4, model, coords, false, false)
    SetBlockingOfNonTemporaryEvents(SpawnedPed, true)
    SetEntityInvincible(SpawnedPed, true)
    FreezeEntityPosition(SpawnedPed, true)
    SetEntityHeading(SpawnedPed, coords.w)

    if Config.npc.scenario ~= nil then
        TaskStartScenarioInPlace(SpawnedPed, Config.npc.scenario, 0, true)
    end

    return SpawnedPed
end

function Ped:delete()
    if SpawnedPed ~= nil then
        DeleteEntity(SpawnedPed)
        SpawnedPed = nil
    end
end

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        Ped:delete()
    end
end)
