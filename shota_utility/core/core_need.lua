local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118, ["Enter"] = 191
}

ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
         Citizen.Wait(0)
         SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
    end
end)

-- ปิด ต่อยแล้วแว่นหมวกหลุด
if Config.LoseProp then

Citizen.CreateThread(function()
  while true do
      SetPedCanLosePropsOnDamage(PlayerPedId(),false,0)
      Citizen.Wait(1000)
  end
end)

end

if Config.DISR then

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            local ped = PlayerPedId()
            if IsPedArmed(ped, 6) then
                DisableControlAction(1, 140, true)
                DisableControlAction(1, 141, true)
                DisableControlAction(1, 142, true)
                DisableControlAction(1, 263, true)
                DisableControlAction(1, 264, true)
            end
        end
    end)
    
    end

    
-- SIT
if Config.SIT then
local crouched = false

RegisterCommand('crouched', function()
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
        DisableControlAction( 1, 36, true )
        DisableControlAction( 2, 36, true )

        if ( not IsPauseMenuActive() ) then 
            RequestAnimSet( "move_ped_crouched" )

            while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do 
                Citizen.Wait( 100 )
            end 

            if ( crouched == true ) then 
                ResetPedMovementClipset( ped, 0 )
                crouched = false 
            elseif ( crouched == false ) then
                SetPedMovementClipset( ped, "move_ped_crouched", 0.25 )
                crouched = true 
            end 
        
        end 
    end 
end, false)

RegisterKeyMapping('crouched', 'Crouched', 'keyboard', 'LCONTROL')  --ปุ่มกด

end


--ขาหัก
if Config.HURT then
    local hurt = false
    Citizen.CreateThread( function()
        while true do 
            Citizen.Wait( 1 )
            local setHurtSleep = true
            -- ขาหัก
            if GetEntityHealth(GetPlayerPed(-1)) <= 129 then
                setHurt()
                setHurtSleep = false
            elseif hurt and GetEntityHealth(GetPlayerPed(-1)) > 130 then
                setNotHurt()
                setHurtSleep = true
            end
            if setHurtSleep then
                Citizen.Wait(500)
            end
        end
    end )
    function setHurt()
        hurt = true
        RequestAnimSet("move_m@injured")
        SetPedMovementClipset(GetPlayerPed(-1), "move_m@injured", true)
    end
    function setNotHurt()
        hurt = false
        ResetPedMovementClipset(GetPlayerPed(-1))
        ResetPedWeaponMovementClipset(GetPlayerPed(-1))
        ResetPedStrafeClipset(GetPlayerPed(-1))
    end
end


-- คุกเค่า
if Config.ARREST then

RegisterKeyMapping('ArrestAnims', 'Arrest Anims', 'keyboard', 'Y')
RegisterCommand("ArrestAnims", function(source, args, rawCommand)
    knee()
end, false)
function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 

function knee()
    local player = GetPlayerPed( -1 )
	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
        loadAnimDict( "random@arrests" )
		loadAnimDict( "random@arrests@busted" )
		if ( IsEntityPlayingAnim( player, "random@arrests@busted", "idle_a", 3 ) ) then 
			TaskPlayAnim( player, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (3000)
            TaskPlayAnim( player, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
        else
            TaskPlayAnim( player, "random@arrests", "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (4000)
            TaskPlayAnim( player, "random@arrests", "kneeling_arrest_idle", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (500)
			TaskPlayAnim( player, "random@arrests@busted", "enter", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (1000)
			TaskPlayAnim( player, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )
        end     
    end
end
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
        local KneeBanKeySleep = true
		if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests@busted", "idle_a", 3) then
            KneeBanKeySleep = false
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
			DisableControlAction(0,21,true)
		end
        if KneeBanKeySleep then Citizen.Wait(500) end
	end
end)

end


-- ชี้นิ้ว
if Config.POINTING then

local pointing = false
local pointstate = false

RegisterCommand('pointing', function()
    local player = PlayerPedId()
    local incarkeyx = IsPedInAnyVehicle(player, true)
    if not incarkeyx then   
        if not pointstate then    
            pointstate = true
            if not pointing then
                pointing = true
                Citizen.CreateThread(function()
                    while pointing do
                        Citizen.Wait(0)
                        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) then
                            if not IsPedOnFoot(PlayerPedId()) then
                                stopPointing()
                            else
                                local ped = PlayerPedId()
                                local camPitch = GetGameplayCamRelativePitch()
                                if camPitch < -70.0 then
                                    camPitch = -70.0
                                elseif camPitch > 42.0 then
                                    camPitch = 42.0
                                end
                                camPitch = (camPitch + 70.0) / 112.0
                
                                local camHeading = GetGameplayCamRelativeHeading()
                                local cosCamHeading = Cos(camHeading)
                                local sinCamHeading = Sin(camHeading)
                                if camHeading < -180.0 then
                                    camHeading = -180.0
                                elseif camHeading > 180.0 then
                                    camHeading = 180.0
                                end
                                camHeading = (camHeading + 180.0) / 360.0
                
                                local blocked = 0
                                local nn = 0
                
                                local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
                                local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7);
                                nn,blocked,coords,coords = GetRaycastResult(ray)
                
                                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Pitch", camPitch)
                                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Heading", camHeading * -1.0 + 1.0)
                                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isBlocked", blocked)
                                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isFirstPerson", Citizen.InvokeNative(0xEE778F8C7E1142E2, Citizen.InvokeNative(0x19CAFA3C87F7C2FF)) == 4)
                
                            end
                        end
                    end
                end)
                startPointing()
            elseif pointing then
                Citizen.CreateThread(function()
                    while pointing do
                        Citizen.Wait(0)
                
                        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) and not pointing then
                            stopPointing()
                        end
                    end
                end)
                stopPointing()               
                pointing = false                                     
            end
            Wait(3000)
            pointstate = false
		else
			--[[exports.nc_notify:PushNotification({
				description = "<span style='color:white;'>     กดรัวๆทำไม ไม่น่ารักเลยนะ !!    </span> </strong>",
				color = '#fc150d',
				direction = 'right',
				duration = 1000
			})]]
		end

    end
end, false)

RegisterKeyMapping('pointing', 'Pointing', 'keyboard', 'B')  --ปุ่มกด
--------- [Right Stick] on GamePad

function startPointing()
    --print(1)
    local ped = PlayerPedId()
    RequestAnimDict("anim@mp_point")
    while not HasAnimDictLoaded("anim@mp_point") do
        Citizen.Wait(0)
    end
    SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
    SetPedConfigFlag(ped, 36, 1)
    Citizen.InvokeNative(0x2D537BA194896636, ped, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
    RemoveAnimDict("anim@mp_point")
end

function stopPointing()
    --print(2)
    local ped = PlayerPedId()
    Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")
    if not IsPedInjured(ped) then
        ClearPedSecondaryTask(ped)
    end
    if not IsPedInAnyVehicle(ped, 1) then
        SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
    end
    SetPedConfigFlag(ped, 36, 0)
    ClearPedSecondaryTask(PlayerPedId())
end

end


-- ยกมือ

if Config.HANDSUP then

local handsupSleep = true
local handsup = false
local handstate= false
RegisterCommand('handsup', function()
    local dict = "missminuteman_1ig_2"
    if not handstate then
        handstate = true
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(100)
        end
        handsupSleep = true
        if not handsup then
            TaskPlayAnim(GetPlayerPed(-1), dict, "handsup_enter", 8.0, 8.0, -1, 50, 0, false, false, false)
            handsup = true
        else
            handsup = false handsupSleep = true
            ClearPedTasks(GetPlayerPed(-1))
        end

        if handsupSleep then
            Citizen.Wait(500)
        end
        Wait(3000)
		handstate = false
    else
        --[[exports.nc_notify:PushNotification({
            description = "<span style='color:white;'>     กดรัวๆทำไม ไม่น่ารักเลยนะ !!    </span> </strong>",
            color = '#fc150d',
            direction = 'right',
            duration = 1000
        })]]
    end

end, false)

RegisterKeyMapping('handsup', 'Hands Up', 'keyboard', 'X')  --ปุ่มกด

end
	

-- สไลด์

if Config.SLIDE then

slide = true
RegisterCommand('Slide', function()
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        local ped = GetPlayerPed(-1)
        local ad = "missheistfbi3b_ig6_v2"
        local anim = "rubble_slide_gunman"
        if slide then
            slide = false
            loadAnimDict(ad)
            SetPedMoveRateOverride(ped, 1.25)
            ClearPedSecondaryTask(ped)
            TaskPlayAnim(ped, ad, anim, 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            ApplyForceToEntityCenterOfMass(ped, 1, 0, 12.8, 0.8, true, true, true, true)
            Wait(250)
            TaskPlayAnim(ped, ad, "exit", 3.0, 1.0, -1, 01, 0, 0, 0, 0)
            ClearPedSecondaryTask(ped)
            Wait(8 * 1000)
            slide = true
            NOTIFY01()
        end
    end
end,false)
RegisterKeyMapping("Slide", "Slide Anim", "keyboard", "H")
function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

end




if Config['PROTECT-UNDERGROUND'].USE then -- PROTECT UNDEGROUND

Citizen.CreateThread(function()
	Citizen.Wait(1000)
	
	while true do
		local ohmSleepsaasd = true
		_ped = PlayerPedId()
		if IsEntityDead(_ped) or not DoesEntityExist(_ped) then
			Citizen.Wait(1000)
			goto m_next
		end
		
		_coords = GetEntityCoords(_ped)
		_, z = GetGroundZFor_3dCoord(_coords.x, _coords.y, 150.0, 0)
		if _coords.z < Config['PROTECT-UNDERGROUND'].z_check then ohmSleepsaasd = false
			local flag_swimming, flag_falling, flag_inside = true, true, true
			if Config['PROTECT-UNDERGROUND'].check_swimming and (IsPedSwimming(_ped) or IsPedSwimmingUnderWater(_ped)) then
				flag_swimming = false
			end
			if Config['PROTECT-UNDERGROUND'].check_falling and not IsPedFalling(_ped) then
				flag_falling = false
			end
			if Config['PROTECT-UNDERGROUND'].check_inside and not IsPedFalling(_ped) and z > _coords.z then 
				flag_inside = false
			end
			if flag_falling and flag_swimming and flag_inside then
				drawTxt(Config['PROTECT-UNDERGROUND'].displayText, 0, 1, 0.5, 0.8, 0.4, 128, 128, 128, 255)
			end
			if IsControlJustReleased(0, Config['PROTECT-UNDERGROUND'].key) and (flag_falling and flag_swimming and flag_inside) then
				ClearPedTasksImmediately(_ped)
				if Config['PROTECT-UNDERGROUND'].preset then
					SetEntityCoords(_ped, Config['PROTECT-UNDERGROUND'].coords.x, Config['PROTECT-UNDERGROUND'].coords.y, Config['PROTECT-UNDERGROUND'].coords.z, true, false, false, false)
				else
					SetEntityCoords(_ped, _coords.x, _coords.y, z + 1.0, true, false, false, false)
				end
				if Config['PROTECT-UNDERGROUND'].freeze then
					Citizen.CreateThread(function()
						FreezeEntityPosition(_ped, true)
						local timer = Config['PROTECT-UNDERGROUND'].freeze_time
						while timer > 0 do
							timer = timer - 1
							Citizen.Wait(1000)
						end
						FreezeEntityPosition(_ped, false)
					end)
				end
			end
		end
		::m_next::
Citizen.Wait(5)if ohmSleepsaasd then Citizen.Wait(500) end
	end
end)

function drawTxt(text, font, centre, x, y, scale, r, g, b, a)
	SetTextFont(font)
	SetTextProportional(1)
	SetTextScale(0.0, 0.3)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

end -- PROTECT UNDEGROUND


if Config['JOIN-PROTECT'].USE then -- JOIN PROTECT
    local script_name = GetCurrentResourceName()
    local notfreeze = true
        Citizen.CreateThread(function()
            while notfreeze do
                Citizen.Wait(1)
                FreezeEntityPosition(PlayerPedId(), true)
                DrawTxt(0.900, 0.700, 1.0,1.0,0.55,Config['JOIN-PROTECT'].TEXT, 255,255,255,255)
                if IsControlJustReleased(0, Keys[Config['JOIN-PROTECT'].KEY]) then
                    notfreeze = false
                    FreezeEntityPosition(PlayerPedId(), false)
                end
            end
        end)
        RegisterFontFile(Config['JOIN-PROTECT'].FONT)
        fontId = RegisterFontId(Config['JOIN-PROTECT'].FONT)

        function DrawTxt(x,y ,width,height,scale, text, r,g,b,a)
            SetTextFont(fontId)
            SetTextProportional(0)
            SetTextScale(scale, scale)
            SetTextColour(r, g, b, a)
            SetTextDropShadow(0, 0, 0, 0,255)
            SetTextEdge(1, 0, 0, 0, 255)
            SetTextOutline()
            SetTextEntry("STRING")
            AddTextComponentString(text)
            DrawText(x - width/2, y - height/2 + 0.005)
        end
end -- JOIN PROTECT


if Config['MINIMAP'] then -- MINIMAP
local MINIMAP = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local MiniMapSleep = true
        if IsPedInAnyVehicle(PlayerPedId(), true) then
            MiniMapSleep = false
            MINIMAP = true
            DisplayRadar(true)
        else
            DisplayRadar(false)
            MiniMapSleep = true
            MINIMAP = false
        end if MiniMapSleep then Citizen.Wait(500) end
    end
end)
end -- MINIMAP


if Config['HEALTH-FEMALE'] then -- HEALTH WOMAN
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local Sleepaaaa = true
        local ped = GetPlayerPed(-1)
        if GetPedMaxHealth(ped) ~= 200 and not IsEntityDead(ped) then
            Sleepaaaa = false
            SetPedMaxHealth(ped, 200)
            SetEntityHealth(ped, GetEntityHealth(ped) + 25)
        end
        if Sleepaaaa then
            Citizen.Wait(7)
        end
    end
end)
end -- HEALTH WOMAN




-- DISABLE NPC
RemoveAllPickupsOfType(0xDF711959) -- carbine rifle
RemoveAllPickupsOfType(0xF9AFB48F) -- pistol
RemoveAllPickupsOfType(0xA9355DCD) -- pumpshotgun

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) local WantedSleep = true
        if Config['DISABLE-WANTED'] then--
        if GetPlayerWantedLevel(PlayerId()) ~= 0 then WantedSleep = false
            SetPlayerWantedLevel(PlayerId(), 0, false)
            SetPlayerWantedLevelNow(PlayerId(), false)
        end end if WantedSleep then Citizen.Wait(500) end
        if Config['DISABLE-NPCSERVICE'] then--
        for i = 1, 12 do
			EnableDispatchService(i, false)
		end end--
    end
end)



if Config['DEAD-REWARD'] then--
function RemoveWeapon()
    local handle, ped = FindFirstPed()
    local finished = false 
    repeat
        if DoesEntityExist(ped) then
            if not IsEntityDead(ped) then
                local pedType = GetPedType(ped)
                if pedType ~= 28 and not IsPedAPlayer(ped) then
                    SetPedDropsWeaponsWhenDead(ped, false)
                    RemoveWeaponDrops(GetCurrentPedWeaponEntityIndex(ped))
                end
            end
        end
        finished, ped = FindNextPed(handle)
    until not finished
    EndFindPed(handle)
end
function RemoveWeaponDrops(object)
    SetEntityAsMissionEntity(object, false, true)
    DeleteObject(object)
end
Citizen.CreateThread(function()
    while true do
        RemoveWeapon()
        Citizen.Wait(200)
    end
end)
end--
if Config['VEHICLE-REWARD'] then--
Citizen.CreateThread(function()
    while true do
	 Citizen.Wait(1)
	 local AnyVehicleSleep = true
		if IsPedInAnyVehicle(PlayerPedId(), true) then
			AnyVehicleSleep = false
			DisablePlayerVehicleRewards(PlayerId())
		end
		if AnyVehicleSleep then
			Citizen.Wait(500)
		end
	end
end)
end--
SetPedDropsWeaponsWhenDead(ped, false) 
DisableVehicleDistantlights(true)
SetPedPopulationBudget(0)
SetVehiclePopulationBudget(0)
SetRandomEventFlag(false)

for i, v in pairs(Config['BAN-VEHICLES']) do
    SetScenarioTypeEnabled(v, false)
end

-- DAMAGE
--if Config['DAMAGE']['USE'] then

--Citizen.CreateThread(function()
	--for k,v in pairs(Config['DAMAGE']) do
	--	SetWeaponDamageModifier(k --[[ Hash ]], v --[[ number ]])
	--end
--end)

--end

if Config.HEALTHRECHARGE then

Citizen.CreateThread(function()  -- ปิดเลือดเด้ง  ปืนจากรถ ตร
    while true do
    Citizen.Wait(7)
        SetPlayerHealthRechargeLimit(PlayerId(), 0.0)
        SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
        DisablePlayerVehicleRewards(PlayerId())
    end
end)

end

if Config.DISCAMAFK then

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10000) -- The idle camera activates after 30 second so we don't need to call this per frame

        N_0xf4f2c0d4ee209e20() -- Disable the pedestrian idle camera
        N_0x9e4cfff989258472() -- Disable the vehicle idle camera
    end
end)

end

--[[if Config['NPC-CONTROL'].USE then -- DISABLE NPC
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0) -- prevent crashing

		-- These natives have to be called every frame.
		SetVehicleDensityMultiplierThisFrame(Config['NPC-CONTROL'].vehicles) -- set traffic density to 0 
		SetPedDensityMultiplierThisFrame(Config['NPC-CONTROL'].peds) -- set npc/ai peds density to 0
		SetRandomVehicleDensityMultiplierThisFrame(Config['NPC-CONTROL'].vehicles) -- set random vehicles (car scenarios / cars driving off from a parking spot etc.) to 0
		SetParkedVehicleDensityMultiplierThisFrame(Config['NPC-CONTROL'].vehicles) -- set random parked vehicles (parked car scenarios) to 0
		SetScenarioPedDensityMultiplierThisFrame(Config['NPC-CONTROL'].peds, Config['NPC-CONTROL'].peds) -- set random npc/ai peds or scenario peds to 0
		SetGarbageTrucks(false) -- Stop garbage trucks from randomly spawning
		SetRandomBoats(false) -- Stop random boats from spawning in the water.
		SetCreateRandomCops(false) -- disable random cops walking/driving around.
		SetCreateRandomCopsNotOnScenarios(false) -- stop random cops (not in a scenario) from spawning.
		SetCreateRandomCopsOnScenarios(false) -- stop random cops (in a scenario) from spawning.
		
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
		RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0);
	end
end)
end-- DISABLE NPC]]


-- BLACKLIST-WEAPON

if Config['BLACKLIST'] then -- BLACKLIST WEAPON

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			nothing, weapon = GetCurrentPedWeapon(playerPed, true)

			if disableallweapons then
				RemoveAllPedWeapons(playerPed, true)
			else
				if isWeaponBlacklisted(weapon) then
					RemoveAllPedWeapons(playerPed,false)
					NOTIFY02()
					Citizen.Wait(5000)
				end
			end
		end
	end
end)

function isWeaponBlacklisted(model)
	for _, blacklistedWeapon in pairs(Config['BLACKLIST-WEAPON']) do
		if model == GetHashKey(blacklistedWeapon) then
			return true
		end
	end

	return false
end

end -- BLACKLIST WEAPON