CreateThread(function()
    QBCore.Functions.AddItems({
        ['wet_money_roll'] = {
            name = 'wet_money_roll',
            label = 'Roll of wet money',
            weight = 0,
            type = 'item',
            image = 'cashroll.png',
            unique = false,
            useable = false,
            shouldClose = false,
            combinable = nil,
            description = 'This money looks really wet'
        },
        ['dry_money_roll'] = {
            name = 'dry_money_roll',
            label = 'Empty notes',
            weight = 0,
            type = 'item',
            image = 'cashstack.png',
            unique = false,
            useable = false,
            shouldClose = false,
            combinable = nil,
            description = 'Some empty notes'
        }
    })
end)

lib.callback.register('mtc-moneywash:server:pay', function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    return Player.Functions.RemoveMoney('cash', math.random(Config.price.min, Config.price.max), 'money-wash')
end)

lib.callback.register('mtc-moneywash:server:getWorth', function(source)
    local item = QBCore.Functions.GetPlayer(source).Functions.GetItemByName('markedbills')
    if item == nil then return false end 
    local worth = item.info.worth

    return worth
end)

RegisterNetEvent('mtc-moneywash:server:giveWorth', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item = Player.Functions.GetItemByName('markedbills')
    if not item then return false end 

    local worth = item.info.worth
    Player.Functions.RemoveItem('markedbills', 1)
    Player.Functions.AddItem('wet_money_roll', math.floor(worth * Config.multiplier))

    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['markedbills'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['wet_money_roll'], 'add')
end)

RegisterNetEvent('mtc-moneywash:server:dry', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item = Player.Functions.GetItemByName('wet_money_roll')
    
    if not item then return false end

    Player.Functions.RemoveItem('wet_money_roll', item.amount)
    Player.Functions.AddItem('dry_money_roll', item.amount)

    
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['wet_money_roll'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['dry_money_roll'], 'add')
end)

RegisterNetEvent('mtc-moneywash:server:print', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local item = Player.Functions.GetItemByName('dry_money_roll')
    
    if not item then return false end

    Player.Functions.RemoveItem('dry_money_roll', item.amount)
    Player.Functions.AddMoney('cash', item.amount, "money-wash")

    
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['dry_money_roll'], 'remove')
end)

