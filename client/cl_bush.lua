local IsWearing = false

RegisterNetEvent('cxc:client:bush:qbcore')
AddEventHandler('cxc:client:bush:qbcore', function()
  local QBCore = exports['qb-core']:GetCoreObject()
  local src = source
  local ped = GetPlayerPed(-1)
  WearBush()
  if IsWearing then
    QBCore.Functions.Progressbar("spawn_table", Lang:t("progbar.progbar_takeoff"), Config.BushTakeOffTime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("bushremove", src)
        end, function() -- Cance
            QBCore.Functions.Notify(Lang:t("progbar.progbar_cancel"), 'error')
      end)
  else
    QBCore.Functions.Progressbar("spawn_table", Lang:t("progbar.progbar_puton"), Config.BushTime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("bushwear", src)
        end, function() -- Cancel
            QBCore.Functions.Notify(Lang:t("progbar.progbar_cancel"), 'error')
      end)
  end
end)

RegisterNetEvent('cxc:client:bush:esx')
AddEventHandler('cxc:client:bush:esx', function()
  local src = source
  local ped = GetPlayerPed(-1)
  WearBush()
  if IsWearing then
      Wait(2000)
      TriggerEvent("bushremove", src)
      Wait(100)
      ClearPedTasks(ped)
  else
      Wait(2000)
      TriggerEvent("bushwear", src)
      ClearPedTasks(ped)
   end
end)

RegisterNetEvent("bushwear")
AddEventHandler("bushwear", function(source)
    IsWearing = true
    spawnBush()
end)

RegisterNetEvent("bushremove")
AddEventHandler("bushremove", function(source)
    IsWearing = false
    removeBush()
end)

function loadAnimDict(dict) while (not HasAnimDictLoaded(dict)) do RequestAnimDict(dict) Wait(5) end end
function WearBush()
    loadAnimDict("clothingshirt")
    TaskPlayAnim(PlayerPedId(), "clothingshirt", "try_shirt_positive_d", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
end

function removeBush()
    SetModelAsNoLongerNeeded(BushProp)
    DeleteEntity(BushProp)
end

function spawnBush()
    local src = source
    local ped = PlayerPedId()
    local bone = GetPedBoneIndex(ped, Config.PedBone)
    local bushmodel = Config.BushProp
    RequestModel(bushmodel)
    while not HasModelLoaded(bushmodel) do
        Wait(10)
    end
    BushProp = CreateObject(GetHashKey(Config.BushProp), 1.0, 1.0, 1.0, true, true, false)   
    AttachEntityToEntity(BushProp, ped, bone, Config.X, Config.Y, Config.Z, Config.RX, Config.RY, Config.RZ, false, false, false, false, 2, true)
end
