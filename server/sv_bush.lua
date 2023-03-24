if Config.Core == "QBCore" then
     local QBCore = exports['qb-core']:GetCoreObject()
     QBCore.Functions.CreateUseableItem(Config.BushItem, function(source)
         local src = source
         local Player = QBCore.Functions.GetPlayer(src)
         TriggerClientEvent('cxc:client:bush:qbcore', src)
     end)
elseif Config.Core == "ESX" then
     ESX = nil
     TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
     ESX.RegisterUsableItem(Config.BushItem, function(source)
         local src = source
         local Player = ESX.GetPlayerFromId(src)
         TriggerClientEvent('cxc:client:bush:esx', src)
     end)
 else
     print('[INFORMATION]: The script started without core set in config.lua!')
end   




