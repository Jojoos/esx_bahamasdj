local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX          = nil
local GUI    = {}
local isDead = false
GUI.Time     = 0

-- Marker
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

-- Markers
AddEventHandler('esx_jojo_dj:hasEnteredMarker', function (zone)
  if zone == 'bahamas' then
    CurrentAction     = 'dj'
    CurrentActionMsg  = _U('marker')
    CurrentActionData = {}
  end
end)

AddEventHandler('esx_jojo_dj:hasExitedMarker', function (zone)
  CurrentAction = nil
end)

function jojodjmenu()

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'esx_jojo_dj',
	{
		title    = 'Bahamas Nightclub - Dj',
		align    = 'top-left',
		elements = {
			{label = 'Stop', value = 'stop'},
            {label = _U('animations'), value = 'animations'},
			{label = _U('playlist'), value = 'playlist'},
		},
	},
	
    function(data, menu)
       if data.current.value == 'stop' then
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 0, 0.0)
      end
            
      if data.current.value == 'animations' then
        	animations()
      end        

      if data.current.value == 'playlist' then
        	playlist()
      end
    end,
    function(data, menu)
      menu.close()
    end
  )
end

function playlist()

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'interactsound',
	{
		title    = 'Bahamas Nightclub - Playlist',
		align    = 'top-left',
		elements = {
			{label = 'Tiesto - Boom', value = 'boom'},
			{label = 'Coola Kids - Ligga med nils', value = 'Liggamednils'},
			{label = 'Don Diablo - CuttingShapes', value = 'CuttingShapes'},
			{label = 'Kygo - First time', value = 'KygoFirstTime'},
			{label = 'Timmy Trumpet - Nightmare', value = 'TimmyTrumpetNightmare'},
			{label = 'Xillions - Somebody Like Me', value = 'XillionsSomebodyLikeMe'},
		},
	},
	
    function(data, menu)
      if data.current.value == 'Liggamednils' then
		TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 15, "COOLAKIDSLiggamedNils", 0.3)
        TriggerEvent('jojo:animation1')
      end

      if data.current.value == 'CuttingShapes' then
		TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 15, "DonDiabloCuttingShapes", 0.3)
        TriggerEvent('jojo:animation1')
      end

      if data.current.value == 'KygoFirstTime' then
		TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 15, "KygoFirstTime", 0.3)
        TriggerEvent('jojo:animation1')
      end

      if data.current.value == 'boom' then
		TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 15, "TiestoBoom", 0.3)
        TriggerEvent('jojo:animation1')        
      end

      if data.current.value == 'TimmyTrumpetNightmare' then
		TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 15, "TimmyTrumpetNightmare", 0.3)
        TriggerEvent('jojo:animation1')        
      end

      if data.current.value == 'XillionsSomebodyLikeMe' then
		TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 15, "XillionsSomebodyLikeMe", 0.3)
        TriggerEvent('jojo:animation1')        
      end
    end,
    function(data, menu)
      menu.close()
    end
  )
end

function animations()

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'Jojoanimations',
	{
		title    = 'Bahamas Nightclub - Animations',
		align    = 'top-left',
		elements = {
			{label = _U('dj'), value = 'animation1'},
            {label = _U('dance1'), value = 'animation2'},
		},
	},
	
    function(data, menu)

      if data.current.value == 'animation1' then
        TriggerEvent('jojo:animation1')        
      end
            
    if data.current.value == 'animation2' then
        TriggerEvent('jojo:animation2')        
      end
    end,
    function(data, menu)
      menu.close()
    end
  )
end

-- Marker
Citizen.CreateThread(function ()
  while true do
    Wait(0)

    local coords = GetEntityCoords(GetPlayerPed(-1))

    for k,v in pairs(Config.Zones) do
      if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
        DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
      end
    end
  end
end)

-- Exit/Enter marker
Citizen.CreateThread(function ()
  while true do
    Wait(0)

    local coords      = GetEntityCoords(GetPlayerPed(-1))
    local isInMarker  = false
    local currentZone = nil

    for k,v in pairs(Config.Zones) do
      if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
        isInMarker  = true
        currentZone = k
      end
    end

    if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
      HasAlreadyEnteredMarker = true
      LastZone                = currentZone
      TriggerEvent('esx_jojo_dj:hasEnteredMarker', currentZone)
    end

    if not isInMarker and HasAlreadyEnteredMarker then
      HasAlreadyEnteredMarker = false
      TriggerEvent('esx_jojo_dj:hasExitedMarker', LastZone)
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 0, 0.0)
      ESX.UI.Menu.CloseAll()
    end
  end
end)

-- Controls
Citizen.CreateThread(function ()
  while true do
    Citizen.Wait(0)

      local playerPed = GetPlayerPed(-1)

    if CurrentAction ~= nil then
      SetTextComponentFormat('STRING')
      AddTextComponentString(CurrentActionMsg)
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)


        if CurrentAction == 'dj' then
      if IsControlPressed(0, Keys['E']) then
      	CurrentActionMsg  = nil
        jojodjmenu()
        end
      end
    end
  end       
end)

-- Dj Animation
RegisterNetEvent('jojo:animation1')
AddEventHandler('jojo:animation1', function()
  local animDictionary = 'anim@mp_player_intcelebrationmale@dj'
  local animName = 'dj'
  RequestAnimDict(animDictionary)
  while not HasAnimDictLoaded(animDictionary) do
    Citizen.Wait(0)
  end
  TaskPlayAnim(GetPlayerPed(-1), animDictionary, animName, 8.0, -8.0, -1, 0, 0, false, false, false)
end)

-- Dance Animation
RegisterNetEvent('jojo:animation2')
AddEventHandler('jojo:animation2', function()
  local animDictionary = 'misschinese2_crystalmazemcs1_ig'
  local animName = 'dance_loop_tao'
  RequestAnimDict(animDictionary)
  while not HasAnimDictLoaded(animDictionary) do
    Citizen.Wait(0)
  end
  TaskPlayAnim(GetPlayerPed(-1), animDictionary, animName, 8.0, -8.0, -1, 0, 0, false, false, false)
end)


