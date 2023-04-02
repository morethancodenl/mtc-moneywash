local function EnterWash()
    local Sure = lib.alertDialog({
        header = Lang:t('dialog.header'),
        content = Lang:t('dialog.content'),
        size = 'md',
        centered = true,
        cancel = true
    })

    if Sure ~= "confirm" then return end

    local HasPaid = lib.callback.await('mtc-moneywash:server:pay')
    if not HasPaid then 
        QBCore.Functions.Notify(Lang:t('error.not_enough_money'), 'error')    
        return
     end

    CreateThread(function()
        DoScreenFadeOut(1000)
        Wait(1000)
        SetEntityCoords(PlayerPedId(), Config.shell)
        TriggerEvent('InteractSound_CL:PlayOnOne', 'houses_door_open', 1)
        Wait(1000)
        DoScreenFadeIn(1000)
    end)
end

CreateThread(function()
    local ped = Ped:spawn()

    exports['qb-target']:AddTargetEntity(ped, {
        options = {{
            icon = 'fas fa-money-bill-wave',
            label = 'Money Wash',
            action = function()
                EnterWash()
            end,
            item = "markedbills",
        }},
        distance = 1.5
    })

end)
