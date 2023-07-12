RegisterNetEvent('rentacar', function(price, plate, model, account)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeAccountMoney(account, price)
    exports.ox_inventory:AddItem(xPlayer.source, Config.Item, 1, {owner = xPlayer.getName(), plate = plate, model = model})
end)

ESX.RegisterServerCallback('havemoney', function(source, cb, price, account)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getAccount(account).money >= price then
        cb(true)
    else
        cb(false)
    end
end)
