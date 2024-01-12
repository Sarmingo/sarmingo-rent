CreateThread(function()
    exports.ox_inventory:displayMetadata({
        owner = 'Owner',
        plate = 'Plate',
        model = 'Vehicle',
    })
    for k, v in pairs(Config.Rent) do
        rent(k,v)
    end
end)

RegisterNetEvent('spawncar', function(data)
    ESX.TriggerServerCallback('havemoney', function(have)
        if have then
            if ESX.Game.IsSpawnPointClear(data.spawncoords, 3.0) then
                DoScreenFadeOut(800)
                while not IsScreenFadedOut() do
                    Wait(100)
                end
                ESX.Game.SpawnVehicle(data.model, vector3(data.spawncoords.x, data.spawncoords.y, data.spawncoords.z), data.spawncoords.w, function(vehicle)
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                    TriggerServerEvent('rentacar', data.price, GetVehicleNumberPlateText(vehicle), GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)), data.account)
                end)
                DoScreenFadeIn(800)
            else
                ESX.ShowNotification(Strings.movecar)
            end
        else
            ESX.ShowNotification(Strings.donthavemoney)
        end
    end, data.price, data.account)
end)

function rent(k, data)
    --BLIP
    blip = AddBlipForCoord(data.pedcoords.x, data.pedcoords.y, data.pedcoords.z)
    SetBlipSprite(blip, data.sprite)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, data.scale)
    SetBlipColour(blip, data.color)
    SetBlipAsShortRange(blip, true)
  BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(data.text)
    EndTextCommandSetBlipName(blip)

    --PED
    RequestModel(GetHashKey(data.ped))
    while not HasModelLoaded(GetHashKey(data.ped)) do
        Wait(1)
    end
    RentPed = CreatePed(4, data.ped, vector3(data.pedcoords.x, data.pedcoords.y, data.pedcoords.z - 1), data.pedheading, false, true)
    FreezeEntityPosition(RentPed, true)
    SetEntityInvincible(RentPed, true)
    SetBlockingOfNonTemporaryEvents(RentPed, true)

    --TARGET AND CONTEXT

    exports.qtarget:AddBoxZone("rent-"..k, vector3(data.pedcoords.x, data.pedcoords.y, data.pedcoords.z - 1), 0.45, 0.35, {
        name="rent-"..k,
        heading=data.pedheading,
        debugPoly=false,
        minZ=data.pedcoords.z - 1,
        maxZ=data.pedcoords.z + 2,
    }, {
        options = {
            {
                action = function ()
                    lib.registerContext({
                        id = 'rent-'..k,
                        title = data.title,
                        options = data.vehicles
                    })

                    lib.showContext('rent-'..k)
                end,
                icon = data.icon,
                label = data.label,
            },
        },
        distance = data.distance
    })
end
