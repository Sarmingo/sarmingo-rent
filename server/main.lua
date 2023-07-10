RegisterNetEvent('rentacar', function(price, plate, model)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeMoney(price)
    exports.ox_inventory:AddItem(xPlayer.source, Config.Item, 1, {owner = xPlayer.getName(), plate = plate, model = model})
end)

ESX.RegisterServerCallback('havemoney', function(source, cb, price)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getMoney() >= price then
        cb(true)
    else
        cb(false)
    end
end)
