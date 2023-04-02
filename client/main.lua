function WashMoney()
    local worth = lib.callback.await('mtc-moneywash:server:getWorth')
    if not worth then
        QBCore.Functions.Notify(Lang:t('error.no_washable_money'), 'error')
        return
    end

    QBCore.Functions.Progressbar('washing_money', Lang:t('progress.washing'), math.random(10000, 15000), false, false, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        anim = "machinic_loop_mechandplayer",
        flags = 16,
    }, {}, {}, function() -- Done
        TriggerServerEvent('mtc-moneywash:server:giveWorth', worth)
    end, function() -- Cancel
        QBCore.Functions.Notify(Lang:t('progress.canceled'), 'error')
    end)
end

function DryMoney()
    QBCore.Functions.Progressbar('drying_money', Lang:t('progress.drying'), math.random(30000, 60000), false, false, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        anim = "machinic_loop_mechandplayer",
        flags = 16,
    }, {}, {}, function() -- Done
        TriggerServerEvent('mtc-moneywash:server:dry')
    end, function() -- Cancel
        QBCore.Functions.Notify(Lang:t('progress.canceled'), 'error')
    end)
end

function PrintMoney()
    QBCore.Functions.Progressbar('printing_money', Lang:t('progress.printing'), math.random(60000, 90000), false, false, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        anim = "machinic_loop_mechandplayer",
        flags = 16,
    }, {}, {}, function() -- Done
        TriggerServerEvent('mtc-moneywash:server:print')
    end, function() -- Cancel
        QBCore.Functions.Notify(Lang:t('progress.canceled'), 'error')
    end)
end