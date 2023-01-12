Config = {}

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

Config = {

    -- NPC CONTROL
	--[[['DAMAGE'] = {				-- ควบคุม NPC
		['USE']			= false,	-- เปิด/ปิด ใช้งาน คุมดาเมจ
		['WEAPON_UNARMED'] = 0.01,
        ['WEAPON_SNOWBALL'] = 0.02,
        ['WEAPON_BAT'] = 0.18, -- 6
        ['WEAPON_WRENCH'] = 0.1, -- 6
     --   ['WEAPON_POOLCUE'] = 0.18, -- 6
		['WEAPON_POOLCUE'] = 0.12, -- 6
        ['WEAPON_GOLFCLUB'] = 0.18, -- 6
        ['WEAPON_NIGHTSTICK'] = 0.30,
        ['WEAPON_FLASHLIGHT'] = 0.04,
        ['WEAPON_KNUCKLE'] = 0.15,
        ['WEAPON_HAMMER'] = 0.1,
        ['WEAPON_HATCHET'] = 0.18,
        ['WEAPON_CROWBAR'] = 0.1,
        ['weapon_switchblade'] = 0.23,
        ['WEAPON_SWITCHBLADE'] = 0.23, -- 30 hp
        ['weapon_machete'] = 0.18,
        ['weapon_bottle'] = 0.18, -- 25 hp
        ['weapon_petrolcan'] = 0.29,
        ['WEAPON_RUN_OVER_BY_CAR'] = 0.002,

		['WEAPON_SMG'] = 0.3, -- 6 hp
		['WEAPON_MICROSMG'] = 0.30, -- 5 hp
		['WEAPON_ASSAULTSHOTGUN'] = 0.18, -- 24 hp
		['WEAPON_CARBINERIFLE'] = 0.35, -- 10 hp
		['WEAPON_ASSAULTRIFLE'] = 0.40, -- 11 hp
		['WEAPON_ASSAULTSMG'] = 0.35, -- 7 hp
		
		['WEAPON_POOLCUELV1'] = 0.11, -- 8 hp
		['WEAPON_POOLCUELV2'] = 0.13, -- 10 hp
		['WEAPON_POOLCUELV3'] = 0.18, -- 14 hp
		['WEAPON_POOLCUELV4'] = 0.22,  -- 17 hp
		['WEAPON_POOLCUELV5'] = 0.27, -- 21 hp
		['WEAPON_GOLFCLUBLV1'] = 0.11, -- 8
		['WEAPON_GOLFCLUBLV2'] = 0.13, -- 10
		['WEAPON_GOLFCLUBLV3'] = 0.18, -- 14
		['WEAPON_GOLFCLUBLV4'] = 0.21, -- 16
		['WEAPON_GOLFCLUBLV5'] = 0.25, -- 20
		['WEAPON_BATLV1'] = 0.10, -- 7 hp
		['WEAPON_BATLV2'] = 0.13, -- 10 hp
		['WEAPON_BATLV3'] = 0.17, --  13 hp
		['WEAPON_BATLV4'] = 0.21, -- 16 hp
		['WEAPON_BATLV5'] = 0.24, -- 19 hp

	}]]

	['LoseProp']	    = true,		-- กันต่อยแล้วแว่นหมวกหลุด
    ['DISR']	        = true,		-- ปิดตบปืน
    ['HEALTHRECHARGE']	= false,		-- ปิดเด้งเลือด
    ['DISCAMAFK']	    = true,		-- ปิดจอ AFK
    ['SIT']         	= true,		-- CTRL นั่งย่อง [ ปรับแต่งปุ่มได้ในเกม ]
    ['HURT']        	= false,		-- เลือดลดขากระเพก
    ['ARREST']      	= false,		-- Y คุกเข่า [ ปรับแต่งปุ่มได้ในเกม ]
    ['POINTING']    	= true,		-- B ชี้นิ้ว [ ปรับแต่งปุ่มได้ในเกม ]
    ['HANDSUP']     	= true,		-- X ยกมือ [ ปรับแต่งปุ่มได้ในเกม ]
    ['SLIDE']       	= true,		-- H สไลด์ [ ปรับแต่งปุ่มได้ในเกม ]
	['MINIMAP']			= false,		-- มินิแมพ มีตอนขึ้นรถ
	['HEALTH-FEMALE']	= true,		-- เลือดผู้หญิง 200

	['JOIN-PROTECT'] = { -- กันตกแมพตอนเข้าเกม
		['USE'] 	= false,											-- เปิด/ปิด ใช้งาน
		['FONT']	= 'font4thai',									-- ฟ้อน
		['KEY']		= 'ENTER',										-- ปุ่ม
		['TEXT'] 	= "~g~โหลดเสร็จ~g~กด ~r~[~w~ENTER~r~] ~g~เพื่อเดิน", -- ตัวหนังสือ
	},

	['PROTECT-UNDERGROUND'] = {
		['USE'] = false,
		['displayText'] = '<font face="font4thai">~y~กด ~g~E~s~ ~y~เพื่อขึ้นไปข้างบน',	-- ข้อความที่จะแสดง
		['key'] = Keys["E"],													-- ปุ่มที่เปิดใช้งานการเคลื่อนย้าย
		['preset'] = false,														-- false: วาง ped ที่ตำแหน่งปัจจุบันบนพื้นจุดที่ตก | true: วาง ped ที่ตำแหน่งที่กำหนดไว้ล่วงหน้าใน config ['coords']
		['coords'] = { x=0.0, y=0.0, z=0.0 }, 									-- พิกัดที่ตั้งไว้ล่วงหน้า
		['z_check'] = 0.0,														-- ค่าเดิมดีแล้ว
		['freeze'] = false,														-- จะแช่แข็งผู้เล่นตามเวลาที่กำหนด ['freeze_time'] หรือไม่
		['freeze_time'] = 2,													-- เวลาแช่แข็ง
		['check_swimming'] = false,												-- เช็คจมน้ำ
		['check_falling'] = false,												-- เช็คตกแมพ
		['check_inside'] = false,												-- เช็คทะลุแมพตึก,อาคาร
	},


	-- NPC CONTROL
	['NPC-CONTROL'] = {				-- ควบคุม NPC
		['USE']			= false,	-- เปิด/ปิด ใช้งาน [ ปรับ true = ไม่มี NPC100% | false = โอกาศเห็น NPC 10-30% ]
		['peds']		= 0.0,
	--	['peds']		= 0.46,		-- จำนวน ped npc
		['vehicles']	= 0.0,		-- จำนวน รถ npc
	},

	['DISABLE-WANTED']		= false,	-- เปิด/ปิด ใช้งาน [ ติดดาว ]
	['DISABLE-NPCSERVICE']	= false,	-- เปิด/ปิด ใช้งาน [ รถ หมอ NPC , รถดับเพลิง  ]
	['DEAD-REWARD']			= false,	-- เปิด/ปิด ใช้งาน [ NPC ตายแล้วปืน ดร็อป ]
	['VEHICLE-REWARD']		= false,	-- เปิด/ปิด ใช้งาน [ ได้รับปืนจากรถ ]

    ['BAN-VEHICLES'] = { -- รายชื่อ รถ, เครื่องบิน, เรือ ที่ไม่อยากให้มี
        'WORLD_VEHICLE_ATTRACTOR', 'WORLD_VEHICLE_AMBULANCE', 'WORLD_VEHICLE_BICYCLE_BMX', 'WORLD_VEHICLE_BICYCLE_BMX_BALLAS', 'WORLD_VEHICLE_BICYCLE_BMX_FAMILY',
        'WORLD_VEHICLE_BICYCLE_BMX_HARMONY', 'WORLD_VEHICLE_BICYCLE_BMX_VAGOS', 'WORLD_VEHICLE_BICYCLE_MOUNTAIN', 'WORLD_VEHICLE_BICYCLE_ROAD', 'WORLD_VEHICLE_BIKE_OFF_ROAD_RACE',
        'WORLD_VEHICLE_BIKER', 'WORLD_VEHICLE_BOAT_IDLE', 'WORLD_VEHICLE_BOAT_IDLE_ALAMO', 'WORLD_VEHICLE_BOAT_IDLE_MARQUIS', 'WORLD_VEHICLE_BROKEN_DOWN',
        'WORLD_VEHICLE_BUSINESSMEN', 'WORLD_VEHICLE_HELI_LIFEGUARD', 'WORLD_VEHICLE_CLUCKIN_BELL_TRAILER', 'WORLD_VEHICLE_CONSTRUCTION_SOLO', 'WORLD_VEHICLE_CONSTRUCTION_PASSENGERS',
        'WORLD_VEHICLE_DRIVE_PASSENGERS', 'WORLD_VEHICLE_DRIVE_PASSENGERS_LIMITED', 'WORLD_VEHICLE_DRIVE_SOLO', 'WORLD_VEHICLE_FIRE_TRUCK', 'WORLD_VEHICLE_EMPTY', 'WORLD_VEHICLE_MARIACHI',
        'WORLD_VEHICLE_MECHANIC', 'WORLD_VEHICLE_MILITARY_PLANES_BIG', 'WORLD_VEHICLE_MILITARY_PLANES_SMALL', 'WORLD_VEHICLE_PARK_PARALLEL', 'WORLD_VEHICLE_PARK_PERPENDICULAR_NOSE_IN',
        'WORLD_VEHICLE_PASSENGER_EXIT', 'WORLD_VEHICLE_POLICE_BIKE', 'WORLD_VEHICLE_POLICE_CAR', 'WORLD_VEHICLE_POLICE', 'WORLD_VEHICLE_POLICE_NEXT_TO_CAR', 'WORLD_VEHICLE_QUARRY',
        'WORLD_VEHICLE_SALTON', 'WORLD_VEHICLE_SALTON_DIRT_BIKE', 'WORLD_VEHICLE_SECURITY_CAR', 'WORLD_VEHICLE_STREETRACE', 'WORLD_VEHICLE_TOURBUS', 'WORLD_VEHICLE_TOURIST', 'WORLD_VEHICLE_TANDL',
        'WORLD_VEHICLE_TRACTOR', 'WORLD_VEHICLE_TRACTOR_BEACH', 'WORLD_VEHICLE_TRUCK_LOGS', 'WORLD_VEHICLE_TRUCKS_TRAILERS', 'WORLD_VEHICLE_DISTANT_EMPTY_GROUND',
    },
	-- END NPC CONTROL

}


-- BLACKLIST WEAPON
Config['BLACKLIST']	= false 		-- เปิด/ปิด ใช้งาน
Config['BLACKLIST-WEAPON'] = { 	-- ไม่่ให้ใช้ อาวุธ
	"WEAPON_GRENADE",
	"WEAPON_HAMMER",
	"WEAPON_HATCHET",
	"WEAPON_CROWBAR",
	"WEAPON_SWITCHBLADE",
	"WEAPON_WRENCH",
	"WEAPON_STONE_HATCHET",
	"WEAPON_RAYPISTOL",
	"WEAPON_RAYCARBINE",
	"WEAPON_RPG",
	"WEAPON_GERNADELAUNCHER",
	"WEAPON_GERNADELAUNCHER_SMO",
	"WEAPON_MINIGUN",
	"WEAPON_FIERWORK",
	"WEAPON_RAILGUN",
	"WEAPON_HOMINGLAUNCHER",
	"WEAPON_MOLOTOV",
	"WEAPON_STICKYBOMB",
	"WEAPON_PROXMINE",
	"WEAPON_PIPEBOMB",

}



-- NOTIFY SLIDE
NOTIFY01 = function()
	exports["pNotify"]:Notify("สไลด์<span style='color:#47cf73'> พร้อม </span>ใช้งานแล้ว !", 5000, 'check', options)
end

-- NOTIFY BLACKLIST WEAPON
NOTIFY02 = function()
	TriggerEvent("pNotify:SendNotification", {
		text = '<strong class="red-text">คุณมีอาวุธไม่ได้รับอนุญาติ ระบบได้ลบออกแล้ว!!</span>',
		type = "error",
		timeout = 3000,
		layout = "bottomCenter",
		queue = "global"
	})
end