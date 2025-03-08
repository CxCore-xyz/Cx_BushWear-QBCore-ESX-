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

AddEventHandler('onResourceStart', function(resource)
   if resource == GetCurrentResourceName() then
	Citizen.Wait(5000)
        print('^2>>-----------------^4CxCore^2----------------<<')
	print('^4Cx_BushWear ^0(Created By CxCore)')
        print('^1Discord : ^0https://discord.gg/CcVQHbJCSH')
        print('^5Discord #2 : ^0https://dsc.gg/CxCCore')
        print('^2>>-----------------^4CxCore^2----------------<<')
   end
end)
