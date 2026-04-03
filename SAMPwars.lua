--[[
УБРАЛ РУКИ ОТ ГОВНО КОДА
УБРАЛ РУКИ ОТ ГОВНО КОДА
УБРАЛ РУКИ ОТ ГОВНО КОДА
УБРАЛ РУКИ ОТ ГОВНО КОДА
УБРАЛ РУКИ ОТ ГОВНО КОДА
УБРАЛ РУКИ ОТ ГОВНО КОДА
УБРАЛ РУКИ ОТ ГОВНО КОДА
УБРАЛ РУКИ ОТ ГОВНО КОДА
УБРАЛ РУКИ ОТ ГОВНО КОДА
УБРАЛ РУКИ ОТ ГОВНО КОДА
]]




--AttachTrailer,rescam - Yuriy Code


--============================================================--
--основные библеотеки
--==========================================================
local imgui = require("imgui")
enc = require("encoding")
ffi = require("ffi")
enc.default = "cp1251"
u8 = enc.UTF8
local sampev = require('lib.samp.events')
local memory = require'memory'
local key = require 'vkeys'
imgui.ToggleButton = require('imgui_addons').ToggleButton
imgui.HotKey = require('imgui_addons').HotKey
imgui.Spinner = require('imgui_addons').Spinner
imgui.BufferingBar = require('imgui_addons').BufferingBar
local fa = require 'faIcons'
local fa_glyph_ranges = imgui.ImGlyphRanges({ fa.min_range, fa.max_range })
local tex = renderCreateFont('Tahoma', 10, 5)
local font_flag = require('moonloader').font_flag
local sampev = require "lib.samp.events"
local raknet = require("lib.samp.raknet")
local vector = require 'vector3d'
local vKeys         = require('vKeys')
local inicfg = require 'inicfg'
local dlstatus = require('moonloader').download_status
local wh, wy = getScreenResolution()
local sw, sh = getScreenResolution()
local count = 0
local vers = 4
local vers_text = "4.21"
local update_url = "https://raw.githubusercontent.com/IvanCodeSAMP/sofrware/main/%5Bhelper%5D.ini"
local update_path = getWorkingDirectory() .. "\\resource\\software\\[helper].ini" 
up = tru
local rtot = 0.3
local b_button = imgui.ImInt(1)
local tp, sync = false, false
local packets = 0
local sec = 0
local thread = nil
local font = renderCreateFont("Arial", 12)
local f = require 'moonloader'.font_flag
local font = renderCreateFont('Arial', 10, f.BOLD + f.SHADOW)
require"lib.moonloader"
require"lib.sampfuncs"
local Matrix3X3 = require "matrix3x3"
local Vector3D = require "vector3d"

local sName = '{6398c9}[TRMAP-RESTORE]{FFFFFF} – '
local zoneActive = false
local mapUsed = false
local healme = false
local copas = require 'copas'
local http = require 'copas.http'
local tx = "iv"
local ex = 'an'
local sur = 'cod'
local name = 'a'
local ffi = require "ffi"



ffi.cdef[[
    typedef unsigned long DWORD;
    typedef unsigned int UINT;

    typedef struct tagLASTINPUTINFO {
        UINT  cbSize;
        DWORD dwTime;
    } LASTINPUTINFO, *PLASTINPUTINFO;

    bool GetLastInputInfo(
        PLASTINPUTINFO plii
    );

    DWORD GetTickCount();
]]
local X, Y, Z = 0, 0, 0
local image = {
    file = getWorkingDirectory()..'\\resource\\software\\картинка.jpg',
    handle = nil
}


local mainIni = inicfg.load({
    config = {
	blain = 0,
	invx = 0,
	invy = 0,
	invz = 0,
	objx = 0,
	objy = 0,
	objz = 0,
	objrtx = 0,
	objrty = 0,
	objrtz = 0,
	invdist = 0,
	camdist = 11,
    rklad = false,
	bagaj = false,
	sbivmyso = false,
	rzakladka = false,
	rolen = false,
	renderdereva = false,
	rlen = false,
	rhlopok = false,
	rsem = false,
	rryda = false,
	rderevo = false,
	rgrove = false,
	carcheck = false,
	pokaz = false,
	AimSmooth = 0,
	servcheck = false,
	rballas = false,
	rrifa = false,
	raztec = false,
	rnw = false,
	rvagos = false,
	boxmp = false,
	rvetok = false,
    roskolok = false,
    rkypidon = false,
	motoban = false,
	cub = false,
	trans = false,
	fps = false,
	act = false,
	the = false,
	sh = false,
	godcar = false,
	chat = false,
	boomtest = false,
	chande180 = false,
	jumpb = false,
	showfps = false,
	airbraker = false,
	prova = false,
	objcar = false,
	trailerrr = false,
	zoneklad = true,
	infinrun = false,
	trashWH = false,
	kryjok = false,
	skill = false,
	wallhack = false,
	pokazz = false,
	themergb = false,
	lavka = false,
	waitt = 100,
	arenda = false,
	sped = 6,
	spinner = true,
	speedspiner = 2,
	pissat = true,
	process = false,
	slejka = false,
	Move1 = 0,
	Move2 = 0,
	Move3 = 0,
	famarenda = false,
	nubaim = false,
	bone = 0,
	aimteam = false,
	checkObject = false,
	checkVehicle = false,
	aimfovik = 40,
	maxDistAim = 200,
	
	checkBuild = false
 }
 }, "[helper]")
local keys = require "vkeys"
-- кнопки
local cx = representIntAsFloat(readMemory(0xB6EC10, 4, false))
local cy = representIntAsFloat(readMemory(0xB6EC14, 4, false))
local w, h = getScreenResolution()
local xc, yc = w * cy, h * cx
local bone = imgui.ImInt(mainIni.config.bone)
local checkBuild = imgui.ImBool(mainIni.config.checkBuild)
local checkVehicle = imgui.ImBool(mainIni.config.checkVehicle)
local checkObject = imgui.ImBool(mainIni.config.checkObject)
local aimteam = imgui.ImBool(mainIni.config.aimteam)
update_state = false
local speed = 0
local sped = imgui.ImFloat(mainIni.config.sped)
local waitt = imgui.ImFloat(mainIni.config.waitt)
local tphkablip = imgui.ImBool(false)
local process = imgui.ImBool(mainIni.config.process)
local tphkacheck = imgui.ImBool(false)
local slider = imgui.ImFloat(mainIni.config.camdist)
local slider1 = imgui.ImFloat(mainIni.config.blain)
local AimSmooth = imgui.ImFloat(mainIni.config.AimSmooth)
local maxDistAim = imgui.ImFloat(mainIni.config.maxDistAim)
local tphka = imgui.ImBool(false)

local main_window_state = imgui.ImBool(false)
local windows = imgui.ImBool(false)
local slejka = imgui.ImBool(mainIni.config.slejka)
local Move1 = imgui.ImFloat(mainIni.config.Move1)
local Move2 = imgui.ImFloat(mainIni.config.Move1)
local Move3 = imgui.ImFloat(mainIni.config.Move1)

local chatclear = imgui.ImBool(false)

packet = 0
local cbug = imgui.ImBool(false)
local proaim = imgui.ImBool(false)
local cbughelper = imgui.ImBool(false)
local trigger = imgui.ImBool(false)
local TSRgruz = imgui.ImBool(false)

local motoban = imgui.ImBool(mainIni.config.motoban)

local flood = imgui.ImBool(false)
local floodjump = imgui.ImBool(false)


local botstatusTSR = imgui.ImBool(false)
local kryg = imgui.ImBool(false)
local trans = imgui.ImBool(mainIni.config.trans)
local nospread = imgui.ImBool(false)
local nocamrestore = imgui.ImBool(false)


-- BY IvAn Code

local lavka = imgui.ImBool(mainIni.config.lavka)

local speed = imgui.ImInt(1)
local rb_line_size = imgui.ImInt(-50)
local nubaim = imgui.ImBool(mainIni.config.nubaim)
local chancemiss = imgui.ImFloat(0)


local clearchars = imgui.ImBool(false)



local prova = imgui.ImBool(mainIni.config.prova)
local lojitmaso = imgui.ImBool(false)

local trailerrr = imgui.ImBool(mainIni.config.trailerrr)
local treasurezone = imgui.ImBool(mainIni.config.zoneklad)

local trashWH = imgui.ImBool(mainIni.config.trashWH)
local selected_item = imgui.ImInt(0)
local pokaz = imgui.ImBool(mainIni.config.pokaz)
local themes = imgui.ImInt(0)
local kryjok = imgui.ImBool(mainIni.config.kryjok)
local skill	= imgui.ImBool(mainIni.config.skill)
local antistun = imgui.ImBool(false)
local cartrollrage = imgui.ImBool(false)
local BParz = imgui.ImBool(false)
local wallhack = imgui.ImBool(mainIni.config.wallhack)
local skywalk = imgui.ImBool(false)
local themergb = imgui.ImBool(mainIni.config.themergb)
local rklad = imgui.ImBool(mainIni.config.rklad)
local dancer = imgui.ImBool(false)
local bagaj = imgui.ImBool(mainIni.config.bagaj)
local sbivmyso = imgui.ImBool(mainIni.config.sbivmyso)
local rzakladka = imgui.ImBool(mainIni.config.rzakladka)
local rolen = imgui.ImBool(mainIni.config.rolen)
local renderdereva = imgui.ImBool(mainIni.config.renderdereva)
local rlen = imgui.ImBool(mainIni.config.rlen)
local t = imgui.ImBool(false)
local rhlopok = imgui.ImBool(mainIni.config.rhlopok)
local rsem = imgui.ImBool(mainIni.config.rsem)
local rryda = imgui.ImBool(mainIni.config.rryda)
local rderevo = imgui.ImBool(mainIni.config.rderevo)
local rgrove = imgui.ImBool(mainIni.config.rgrove)
local rballas = imgui.ImBool(mainIni.config.rballas)
local rrifa = imgui.ImBool(mainIni.config.rrifa)
local raztec = imgui.ImBool(mainIni.config.raztec)
local rnw = imgui.ImBool(mainIni.config.rnw)
local rvagos = imgui.ImBool(mainIni.config.rvagos)
local boxmp = imgui.ImBool(mainIni.config.boxmp)
local rvetok = imgui.ImBool(mainIni.config.rvetok)
local roskolok = imgui.ImBool(mainIni.config.roskolok)
local rkypidon = imgui.ImBool(mainIni.config.rkypidon)
local skiparenda = imgui.ImBool(mainIni.config.arenda)
local infinitifuel = imgui.ImBool(false)
local anims = imgui.ImBool(false)
local skipfamcar = imgui.ImBool(mainIni.config.famarenda)
local objcar = imgui.ImBool(mainIni.config.objcar)
local asdzxc = imgui.ImBool(false)
local rvankacars = imgui.ImBool(false)
local rvankaonfoot = imgui.ImBool(false)
local stiler = imgui.ImBool(false)
local tpholodilnik = imgui.ImBool(false)
local tpobratno = imgui.ImBool(false)
local delgun = false
local bots = imgui.ImBool(false)
local botss = imgui.ImBool(false)
local carcheck = imgui.ImBool(mainIni.config.carcheck)
local pokazz = imgui.ImBool(mainIni.config.pokazz)
local servcheck = imgui.ImBool(mainIni.config.servcheck)
local invz = imgui.ImFloat(mainIni.config.invz)
local invy = imgui.ImFloat(mainIni.config.invy)
local invx = imgui.ImFloat(mainIni.config.invx)
local invdist = imgui.ImFloat(mainIni.config.invdist)
local aimfovik = imgui.ImFloat(mainIni.config.aimfovik)
local playeridd = imgui.ImInt(0)
local speedspiner = imgui.ImFloat(mainIni.config.speedspiner)
local spinner = imgui.ImBool(mainIni.config.spinner)
local pissat = imgui.ImBool(mainIni.config.pissat)
local cbz1 = imgui.ImBool(false)
local cbz2 = imgui.ImBool(false)
local cbz3 = imgui.ImBool(false)
local cbz4 = imgui.ImBool(false)
local aiming = 3

local boxbot = false

local alt = false
function imgui.CustomMenu(labels, selected, size, speed, centering)
    local bool = false
    speed = speed and speed or 0.2
    local radius = size.y * 0.50
    local draw_list = imgui.GetWindowDrawList()
    if LastActiveTime == nil then LastActiveTime = {} end
    if LastActive == nil then LastActive = {} end
    local function ImSaturate(f)
        return f < 0.0 and 0.0 or (f > 1.0 and 1.0 or f)
    end
    for i, v in ipairs(labels) do
        local c = imgui.GetCursorPos()
        local p = imgui.GetCursorScreenPos()
        if imgui.InvisibleButton(v..'##'..i, size) then
            selected.v = i
            LastActiveTime[v] = os.clock()
            LastActive[v] = true
            bool = true
        end
        imgui.SetCursorPos(c)
        local t = selected.v == i and 1.0 or 0.0
        if LastActive[v] then
            local time = os.clock() - LastActiveTime[v]
            if time <= 0.3 then
                local t_anim = ImSaturate(time / speed)
                t = selected.v == i and t_anim or 1.0 - t_anim
            else
                LastActive[v] = false
            end
        end
        local col_bg = imgui.GetColorU32(selected.v == i and imgui.GetStyle().Colors[imgui.Col.ButtonActive] or imgui.ImVec4(0,0,0,0))
        local col_box = imgui.GetColorU32(selected.v == i and imgui.GetStyle().Colors[imgui.Col.Button] or imgui.ImVec4(0,0,0,0))
        local col_hovered = imgui.GetStyle().Colors[imgui.Col.ButtonHovered]
        local col_hovered = imgui.GetColorU32(imgui.ImVec4(col_hovered.x, col_hovered.y, col_hovered.z, (imgui.IsItemHovered() and 0.2 or 0)))
        draw_list:AddRectFilled(imgui.ImVec2(p.x-size.x/6, p.y), imgui.ImVec2(p.x + (radius * 0.65) + t * size.x, p.y + size.y), col_bg, 10.0)
        draw_list:AddRectFilled(imgui.ImVec2(p.x-size.x/6, p.y), imgui.ImVec2(p.x + (radius * 0.65) + size.x, p.y + size.y), col_hovered, 10.0)
        draw_list:AddRectFilled(imgui.ImVec2(p.x, p.y), imgui.ImVec2(p.x+5, p.y + size.y), col_box)
        imgui.SetCursorPos(imgui.ImVec2(c.x+(centering and (size.x-imgui.CalcTextSize(v).x)/2 or 15), c.y+(size.y-imgui.CalcTextSize(v).y)/2))
        imgui.Text(v)
        imgui.SetCursorPos(imgui.ImVec2(c.x, c.y+size.y))
    end
    return bool
end

function getDamage(weap)
	local damage = {
		[22] = 8.25,
		[23] = 13.2,
		[24] = 46.200000762939,
		[25] = 30,
		[26] = 30,
		[27] = 30,
		[28] = 6.6,
		[29] = 8.25,
		[30] = 9.9,
		[31] = 9.9000005722046,
		[32] = 6.6,
		[33] = 25,
		[38] = 46.2
	}
	return (damage[weap] or 0) + math.random(1e9)/1e15
end



function rand() return math.random(-50, 50) / 100 end

function getpx()
	return ((w / 2) / getCameraFov()) * aimfovik.v
end

local fa = require 'fAwesome5'

local fa_font = nil
local fa_glyph_ranges = imgui.ImGlyphRanges({ fa.min_range, fa.max_range })
function imgui.BeforeDrawFrame()
    if fa_font == nil then
        local font_config = imgui.ImFontConfig() -- to use 'imgui.ImFontConfig.new()' on error
        font_config.MergeMode = true

        fa_font = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/resource/fonts/fa-solid-900.ttf', 13.0, font_config, fa_glyph_ranges)
    end
end
local autoscroll = imgui.ImBool(false)
local YKR = imgui.ImBool(true)

local tab = imgui.ImInt(1)
local tabs = {
	YRK = {
	fa.ICON_FA_LAPTOP  .. u8' Основний',
	fa.ICON_FA_SEARCH ..	u8' Рендери',
	fa.ICON_FA_USER ..u8' Чити ТСР[ARZ]',
fa.ICON_FA_BULLSEYE	.. u8' Зброя',
fa.ICON_FA_CAR	.. u8' Для машини',
fa.ICON_FA_EYE_SLASH .. u8' Невидимка',
fa.ICON_FA_SHIP	.. u8' Mason??',
fa.ICON_FA_INFO	.. u8' Інформація',
fa.ICON_FA_UNIVERSAL_ACCESS ..	u8' Телепорт',
fa.ICON_FA_MEH ..	u8'Тролінг'},
	RUS = {
	fa.ICON_FA_LAPTOP  .. u8' основа',
	fa.ICON_FA_SEARCH ..	u8' Рендеры',
fa.ICON_FA_USER ..   u8' Читы на ТСР[ARZ]',
fa.ICON_FA_BULLSEYE	.. 	u8' Оружие',
fa.ICON_FA_CAR	.. 	u8' Для машины',
fa.ICON_FA_EYE_SLASH ..	u8' Невидимка',
fa.ICON_FA_SHIP	..	u8' Mason??',
fa.ICON_FA_INFO	..	u8' Информация',
fa.ICON_FA_UNIVERSAL_ACCESS ..	u8' Телерот',
fa.ICON_FA_MEH..u8'Троллинг'}
	
}


local buffer = imgui.ImBuffer(256)

local radius = 150
KEY = key.VK_J
active = true
trailer = nil 


bike = {[481] = true, [509] = true, [510] = true, [15882] = true}
moto = {[448] = true, [461] = true, [462] = true, [463] = true, [468] = true, [471] = true, [521] = true, [522] = true, [523] = true, [581] = true, [586] = true, [3197]= true}
local bx, by, bz = 0, 0, 0
local fps = 0

--очень полезная хуйня(https://www.blast.hk/threads/13380/)
-- YURIY CODE <3
--GRUZIN GANG <3
--FYP <идинахуй3
local fontsize = nil
local fontsize2 = nil
function imgui.BeforeDrawFrame()
    if fa_font == nil then
        local font_config = imgui.ImFontConfig()
        font_config.MergeMode = true
        fa_font = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/resource/fonts/fontawesome-webfont.ttf', 14.0, font_config, fa_glyph_ranges)
    end
	
    if fontsize == nil then
        fontsize = imgui.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(0x14) .. '\\trebucbd.ttf', 20.0, nil, imgui.GetIO().Fonts:GetGlyphRangesCyrillic()) -- вместо 30 любой нужный размер
    end
    if fontsize2 == nil then
        fontsize2 = imgui.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(0x14) .. '\\trebucbd.ttf', 15.0, nil, imgui.GetIO().Fonts:GetGlyphRangesCyrillic()) -- вместо 30 любой нужный размер
    end	
end

local clicks = 0
local bar = 0
local krygi = 0
local box = 0
local lavki = {}
local objs = {
    [2670] = 'мусор',
    [2673] = 'мусор',
    [2674] = 'мент',
    [2677] = 'мусор'
}

local step = -1

local props = { 
	[0716] = true, [0733] = true, [0737] = true, [0792] = true, [1211] = true, [1216] = true, [1220] = true,
	[1223] = true, [1224] = true, [1226] = true, [1229] = true, [1230] = true, [1231] = true, [1232] = true,
	[1233] = true, [1257] = true, [1258] = true, [1280] = true, [1283] = true, [1284] = true, [1285] = true,
	[1286] = true, [1287] = true, [1288] = true, [1289] = true, [1290] = true, [1291] = true, [1293] = true,
	[1294] = true, [1297] = true, [1300] = true, [1315] = true, [1350] = true, [1351] = true, [1352] = true,
	[1373] = true, [1374] = true, [1375] = true, [1408] = true, [1411] = true, [1412] = true, [1413] = true,-- BY IvAn Code
	[1418] = true, [1438] = true, [1440] = true, [1447] = true, [1460] = true, [1461] = true, [1468] = true,
	[1478] = true, [1568] = true, [3276] = true, [3460] = true, [3516] = true, [3853] = true, [3855] = true
}

function getCarDrivenByPlayer(ped)
	if isCharInAnyCar(ped) then
		local car = storeCarCharIsInNoSave(ped)
		return (getDriverOfCar(car) == ped), car
	end
	return false
end

function main()
  while not isSampAvailable() do wait(3400) end
  userscreenX, userscreenY = getScreenResolution()
  sampAddChatMessage('{4FFF38}Хуйня какае-то, наверно блять {FF00FF}стиллер{4FFF38} или  {FF00FF}лоадер ', -1)
	if not doesFileExist(getWorkingDirectory() .. "\\resource\\software") then
		createDirectory(getWorkingDirectory() .. "\\resource\\software")
	end
  if not doesFileExist(getWorkingDirectory() .. "\\resource\\software\\[helper].ini") then
		downloadUrlToFile(update_url, update_path, function(id, status)
			if status == dlstatus.STATUS_ENDDOWNLOADDATA then
				--sampAddChatMessage("4124",-1)
				thisScript():reload()
			end
		end)
	end
	downloadUrlToFile(update_url, update_path, function(id, status)
        if status == dlstatus.STATUS_ENDDOWNLOADDATA then
            helper = inicfg.load(nil, update_path)
            if tonumber(helper.info.vers) > vers then
                sampAddChatMessage("Есть обновление! Версия: " .. helper.info.vers_text, -1)
				sampAddChatMessage('что бы его получить отпишите в VK: @gclustov',-1)
            end
        end
    end)
	 if doesFileExist(image.file) then
        image.handle = imgui.CreateTextureFromFile(image.file)
    end 
	sampRegisterChatCommand('bottsr', function()
		botstatusTSR.v = not botstatusTSR.v
	end)
	sampRegisterChatCommand("recc", function()
			ip, port = sampGetCurrentServerAddress()
			sampConnectToServer(ip, port)
	end)
	sampRegisterChatCommand("rand", radnf)
	sampRegisterChatCommand('setmark', function(coords)
		x, y, z = coords:match('(.+), (.+), (.+)')
		setMarker(1, x, y, z, 1, -1)
		placeWaypoint(x, y, z)
	end)
	sampRegisterChatCommand('ivcdmenu', function()
		main_window_state.v = not main_window_state.v 
	end)
	sampRegisterChatCommand('debagmenu', function()
		windows.v = not windows.v 
	end)
	
	sampRegisterChatCommand('spos', function()
        local x, y, z = getCharCoordinates(PLAYER_PED)
        setClipboardText(math.floor(x) ..', '..math.floor(y)..', '..math.floor(z))
		sampAddChatMessage('Скопировал! ваши координаты:', -1)
		sampAddChatMessage(math.floor(x) ..', '..math.floor(y)..', '..math.floor(z), -1)
	end)
	sampRegisterChatCommand("rescam", function()
		local bs = raknetNewBitStream()
		raknetEmulRpcReceiveBitStream(raknet.RPC.SETCAMERABEHINDPLAYER, bs)
	end)
	sampRegisterChatCommand('music', function()
	
		botbox = not botbox
	end)
	
	_, id = sampGetPlayerIdByCharHandle(PLAYER_PED)
	nick = sampGetPlayerNickname(id)
	ping = sampGetPlayerPing(id)
	health = getCharHealth(PLAYER_PED)

	
	
	lua_thread.create(function()
		while true do wait(0)
			if lavka.v then
            local input = sampGetInputInfoPtr()
            local input = getStructElement(input, 0x8, 4)
            local PosX = getStructElement(input, 0x8, 4)
            local PosY = getStructElement(input, 0xC, 4)
            renderFontDrawText(font, 'Свободно лавок: '..#lavki, PosX, PosY + 80, 0xFFFFFFFF, 0x90000000)
            
            for v = 1, #lavki do
                
                if doesObjectExist(lavki[v]) then
                    local result, obX, obY, obZ = getObjectCoordinates(lavki[v])
                    local x, y, z = getCharCoordinates(PLAYER_PED)
                    
                    if result then
                        local ObjX, ObjY = convert3DCoordsToScreen(obX, obY, obZ)
                        local myX, myY = convert3DCoordsToScreen(x, y, z)
						renderFontDrawText(font, 'Свободно лавок: '..#lavki, PosX, PosY + 80, 0xFFFFFFFF, 0x90000000)
                        if isObjectOnScreen(lavki[v]) and not isObjectInArea3d(lavki[v], 1165.7559814453, -1480.8807373047, 22.754459381104, 1090.6359863281, -1496.3056640625, 24.756797790527) then
                            renderDrawLine(ObjX, ObjY, myX, myY, 1, 0xFF52FF4D)
                            renderDrawPolygon(myX, myY, 10, 10, 10, 0, 0xFFFFFFFF)
                            renderDrawPolygon(ObjX, ObjY, 10, 10, 1, 0, 0xFFFFFFFF)
							 renderFontDrawText(font, 'Свободно лавок: '..#lavki, PosX, PosY + 80, 0xFFFFFFFF, 0x90000000)
                            renderFontDrawText(font, 'Свободна', ObjX - 30, ObjY - 20, 0xFF16C910, 0x90000000)
                        end
                    end
                end
            end
        end
		end
	end)
	lua_thread.create(function()
		while true do wait(0)
			X, Y, Z = getCharCoordinates(1)
			Z = Z - 0.2
			if tphkablip.v then
				res, x, y, z = getTargetBlipCoordinates()
				if res then
				local vec = vector(x - X, y - Y, z - Z)
					local length = vec:length()
					vec:normalize()
					if length > speed then
						X = X + vec.x * speed
						Y = Y + vec.y * speed
						Z = Z + vec.z * speed / 2
					else
						X = x
						Y = y
						Z = z
						setCharCoordinates(1, X, Y, Z)
						tphkablip.v = false
						freezeCharPosition(PLAYER_PED, false)
					end
					local sync = samp_create_sync_data("player")
					sync.position = {X, Y, Z}
					local qwe = getCharHeading(PLAYER_PED)
					sync.moveSpeed.x = math.sin(-math.rad(qwe)) * 0.4
					sync.moveSpeed.y = math.cos(-math.rad(qwe)) * 0.4
					sync.send()
					printStringNow('Dist'..math.floor(getDistanceBetweenCoords3d(X, Y, Z, x, y, z))..'M',50)
					
						setCharCoordinates(1, X, Y, Z-1)
				
				end
				
				wait(waitt.v)
				end
			end
		end)
		lua_thread.create(SmoothAimBot)
		lua_thread.create(function()
		while true do wait(0)
			X, Y, Z = getCharCoordinates(1)
			Z = Z - 0.2
			if tphkacheck.v then
				res, x, y, z = SearchMarker(posX, posY, posZ, 5000.0, true or false)
				if res then
				local vec = vector(x - X, y - Y, z - Z)
					local length = vec:length()
					vec:normalize()
					if length > speed then
						X = X + vec.x * speed
						Y = Y + vec.y * speed
						Z = Z + vec.z * speed / 2
					else
						X = x
						Y = y
						Z = z
						setCharCoordinates(1, X, Y, Z)
						tphkacheck.v = false
						freezeCharPosition(PLAYER_PED, false)
					end
					local sync = samp_create_sync_data("player")
					sync.position = {X, Y, Z-5}
					sync.moveSpeed.x = math.sin(-math.rad(getCharHeading(PLAYER_PED))) * 0.4
					sync.moveSpeed.y = math.cos(-math.rad(getCharHeading(PLAYER_PED))) * 0.4
					sync.send()
					printStringNow('Dist:'..math.floor(getDistanceBetweenCoords3d(X, Y, Z, x, y, z))..'M',50)
				end
				
						setCharCoordinates(1, X, Y, Z-1)
			
				wait(waitt.v)
				end
			end
		end)
	lua_thread.create(function()
			while true do
				if TSRgruz.v then
					runToPoint(258.02655029297, 2012.939453125, 17.667016983032)
					setGameKeyState(21,255)
					wait(200)
					setGameKeyState(21,0)
					runToPoint(212.8238067627, 2015.7186279297, 17.667022705078)
					runToPoint(239.35595703125, 2026.3651123047, 17.687019348145)
					setGameKeyState(21,255)
					wait(200)
					setGameKeyState(21,0)
					runToPoint(212.8238067627, 2015.7186279297, 17.667022705078)
					krygi = krygi + 1 	
				end
			wait(0)
		end
	end)
	lua_thread.create(function()
		while true do
			wait(0)
			if clearchars.v then
				for _, ped in ipairs(getAllChars()) do
					if doesCharExist(ped) and ped ~= PLAYER_PED then
						removePlayer(select(2, sampGetPlayerIdByCharHandle(ped)))
					end
				end
			end
		end
	end)

	lua_thread.create(function()
			while true do wait(0)
		if isKeyDown(KEY) and not sampIsCursorActive() and isCharInAnyCar(1) and getDriverOfCar(getCarCharIsUsing(1)) == 1 and trailerrr.v then -- рендер прицела и поиска машин
			local x, y = getScreenResolution()
			x = x / 2 - radius / 2
			y = y / 3.3 - radius / 2
			renderDrawLine(x, y, x + radius, y, 3, -1)
			renderDrawLine(x, y, x, y + radius + 3, 3, -1)
			renderDrawLine(x, y + radius, x + radius, y + radius, 3, -1)
			renderDrawLine(x + radius, y, x + radius, y + radius, 3, -1)
			local vehs = getAllVehicles()
			local clear = true
			if #vehs > 0 then
				for i = 1, #vehs do
					if vehs[i] ~= getCarCharIsUsing(1) then
						local xx, yy, zz = getCarCoordinates(vehs[i])
						local xxx, yyy = convert3DCoordsToScreen(xx, yy, zz)
						local px, py, pz = getCharCoordinates(1)
						if xxx >= x and xxx <= x + radius and yyy >= y and yyy <= y + radius and isCarOnScreen(vehs[i]) and getDistanceBetweenCoords3d(px, py, pz, xx, yy, zz) <= 20 then
							renderDrawLine(xxx, yyy, x + radius / 2, y + radius / 2, 3, -1)
							trailer = vehs[i]
							clear = false
							break
						end
					end
				end
			end
			if clear then
				trailer = nil
			end
		end
		if not isKeyDown(KEY) and trailer ~= nil then
			if isCharInAnyCar(1) and doesVehicleExist(trailer) then
				if isTrailerAttachedToCab(trailer, getCarCharIsUsing(1)) then
					detachTrailerFromCab(trailer, getCarCharIsUsing(1))
					trailer = nil
				else
					attachTrailerToCab(trailer, getCarCharIsUsing(1))
				end
			end
			trailer = nil
		end
	end
	end)
	while true do wait(0)
	lua_thread.create(function()
	for k, v in pairs(getAllObjects()) do
			local num = getObjectModel(v)
			local idd = getObjectModel(v)
			if rklad.v then
				if num == 1271 then
					local res, px, py, pz = getObjectCoordinates(v)
					local x, y, z = getCharCoordinates(1)
					local wX, wY = convert3DCoordsToScreen(px, py, pz)
					local myPosX, myPosY = convert3DCoordsToScreen(getCharCoordinates(PLAYER_PED))
					if getDistanceBetweenCoords3d(x,y,z ,px, py, pz) < 40 then
						renderFontDrawText(font, ' кладик', wX, wY , 0xFFFFFFFF)
						renderDrawLine(myPosX, myPosY, wX, wY, 2.0, 0xFF74FBBB)
						printStringNow("~y~a treasure has been found.~p~ Coordinates ~r~X: "..math.floor(px)..'~g~ Y: '..math.floor(py)..'~b~ Z: '..math.floor(pz), 500)
					end
				end
			end
			if isObjectOnScreen(v) and rsem.v then
				if num == 859 then
					local res, px, py, pz = getObjectCoordinates(v)
					local wX, wY = convert3DCoordsToScreen(px, py, pz)
					local myPosX, myPosY = convert3DCoordsToScreen(getCharCoordinates(PLAYER_PED))
					renderFontDrawText(font, ' Семена', wX, wY , 0xFFFFFFFF)
					renderDrawLine(myPosX, myPosY, wX, wY, 2.0, 0xFF74FBBB)
				end
			end
            if isObjectOnScreen(v) and rryda.v then
				if num == 854 then
					local res, px, py, pz = getObjectCoordinates(v)
					local wX, wY = convert3DCoordsToScreen(px, py, pz)
					local myPosX, myPosY = convert3DCoordsToScreen(getCharCoordinates(PLAYER_PED))
					renderFontDrawText(font, ' Руда', wX, wY , 0xFFFFFFFF)
					renderDrawLine(myPosX, myPosY, wX, wY, 2.0, 0xFF74FBBB)
				end
			end
            if isObjectOnScreen(v) and rolen.v then
				if num == 19315 then
					local res, px, py, pz = getObjectCoordinates(v)
					local wX, wY = convert3DCoordsToScreen(px, py, pz)
					local myPosX, myPosY = convert3DCoordsToScreen(getCharCoordinates(PLAYER_PED))
					renderFontDrawText(font, ' Олень', wX, wY , 0xFFFFFFFF)
					renderDrawLine(myPosX, myPosY, wX, wY, 2.0, 0xFF74FBBB)
				end
			end
		end
		for id = 0, 2048 do
            local result = sampIs3dTextDefined( id )
            if result then
                local text, color, posX, posY, posZ, distance, ignoreWalls, playerId, vehicleId = sampGet3dTextInfoById( id )
				
                if renderdereva.v and text:find("высшего качества") then
                    local wposX, wposY = convert3DCoordsToScreen(posX,posY,posZ)
					local myPosX, myPosY = convert3DCoordsToScreen(getCharCoordinates(PLAYER_PED))
                    x2,y2,z2 = getCharCoordinates(PLAYER_PED)
                    x10, y10 = convert3DCoordsToScreen(x2,y2,z2)
                    local resX, resY = getScreenResolution()
                    if wposX < resX and wposY < resY and isPointOnScreen (posX,posY,posZ,1) then
                        renderFontDrawText(font,text, wposX, wposY,-1)
						renderDrawLine(myPosX, myPosY, wposX, wposY, 2.0, 0x5FFFCFBB)
						renderFontDrawText(tex, 'около тебя есть дерево', userscreenX - userscreenX + 20, userscreenY / 1.80, 0xFFFFFFFF)
					else
						renderFontDrawText(tex, 'около тебя есть дерево', userscreenX - userscreenX + 20, userscreenY / 1.80, 0xFFFFFFFF)
                    end
                end
			end
		end
	end)
	
	if motoban.v then
		if isCharOnAnyBike(playerPed) and isKeyCheckAvailable() and isKeyDown(0xA0) then
			if bike[getCarModel(storeCarCharIsInNoSave(playerPed))] then
				setGameKeyState(16, 255)
				wait(10)
				setGameKeyState(16, 0)
			elseif moto[getCarModel(storeCarCharIsInNoSave(playerPed))] then
				setGameKeyState(1, -128)
				wait(10)
				setGameKeyState(1, 0)
			end
		end
	end
	if wallhack.v then
		nameTagOn()
	else
		nameTagOff()
	end
	if cbughelper.v then
		if isButtonPressed(PLAYER_HANDLE, 6) and isKeyJustPressed(vKeys.VK_R) then
			sendKey(4)
			setGameKeyState(17, 255)
			wait(55)
			setGameKeyState(6, 0)
			sendKey(2)
			setGameKeyState(18, 255)
		end
	end
	
	
	if motoban.v then
		if isCharOnFoot(playerPed) and isKeyDown(0x31) and isKeyCheckAvailable() then
			setGameKeyState(16, 256)
			wait(10)
			setGameKeyState(16, 0)
		elseif isCharInWater(playerPed) and isKeyDown(0x31) and isKeyCheckAvailable() then
			setGameKeyState(16, 256)
			wait(10)
			setGameKeyState(16, 0)
		end 
	end
	if chatclear.v then
		ClearChat()
	end
	if skill.v then
		setSkills(999)
	end
	if antistun.v and not isCharDead(PLAYER_PED) then
		local anim = {'DAM_armL_frmBK', 'DAM_armL_frmFT', 'DAM_armL_frmLT', 'DAM_armR_frmBK', 'DAM_armR_frmFT', 'DAM_armR_frmRT', 'DAM_LegL_frmBK', 'DAM_LegL_frmFT', 'DAM_LegL_frmLT', 'DAM_LegR_frmBK', 'DAM_LegR_frmFT', 'DAM_LegR_frmRT', 'DAM_stomach_frmBK', 'DAM_stomach_frmFT', 'DAM_stomach_frmLT', 'DAM_stomach_frmRT'}
		for k, v in pairs(anim) do
			if isCharPlayingAnim(PLAYER_PED, v) then
				setCharAnimSpeed(PLAYER_PED, v, 999)
			end
		end
	end
	
	if botstatusTSR.v then
		runPoint(257.91812133789, 2013.1385498047, 17.667016983032)
		wait(500)
		setGameKeyState(21, 255)
		wait(20)
		setGameKeyState(21, 0)
		runPoint(252.27777099609, 2012.7478027344, 17.667016983032)
		runPoint(214.14813232422, 2015.5927734375, 17.667022705078)
		runPoint(214.45275878906, 2017.8673095703, 17.667022705078)
		runPoint(232.78053283691, 2021.5407714844, 17.687021255493)
		runPoint(239.3899230957, 2026.8880615234, 17.687019348145)
		wait(800)
		setGameKeyState(21, 255)
		wait(20)
		setGameKeyState(21, 0)
		runPoint(233.5218963623, 2022.0314941406, 17.687021255493)
		runPoint(213.72653198242, 2017.3282470703, 17.667022705078)
		runPoint(214.07022094727, 2016.0184326172, 17.667022705078)
		runPoint(232.00169372559, 2012.9371337891, 17.667018890381)
		runPoint(242.72665405273, 2016.22265625, 17.667018890381)
		runPoint(250.54624938965, 2011.7180175781, 17.667016983032)
		runPoint(257.91812133789, 2013.1385498047, 17.667016983032)
	end
	
	if flood.v and isKeyDown(0x52) and isKeyCheckAvailable() and not isCharInAnyCar(1) then
		altsync(true)
		printStringNow('Flood', 100)
	end
	if floodjump.v and isKeyDown(0x52) then
		jumpsync(true)
		printStringNow('Flood', 100)
	end
	if cbug.v then
		if isCharShooting(PLAYER_PED) and getCurrentCharWeapon(1) == 24 or getCurrentCharWeapon(1) == 25 or getCurrentCharWeapon(1) == 33 then
			wait(1)
			taskPlayAnimNonInterruptable(PLAYER_PED, "HIT_WALK", "PED", 4.0, 0, 1, 1, 0, 1)
			sampSetSpecialAction(0)
		end 
	end
	if trigger.v and not isCharOnAnyBike(playerPed) and not isCharDead(playerPed) then
		local int = readMemory(0xB6F3B8, 4, 0)
		int=int + 0x79C
		local intS = readMemory(int, 4, 0)
			if intS > 0
			then
			local lol = 0xB73458
			lol=lol + 34
			writeMemory(lol, 4, 255, 0)
			wait(100)
			local int = readMemory(0xB6F3B8, 4, 0)
			int=int + 0x79C
			writeMemory(int, 4, 0, 0)
		end
	end
	if trashWH.v then
		for _, objH in pairs(getAllObjects()) do
			local modelid = getObjectModel(objH)
			local object = objs[modelid]
			if object then
				if isObjectOnScreen(objH) then
					local x, y, z = getCharCoordinates(PLAYER_PED)
					local res, objectX, objectY, objectZ = getObjectCoordinates(objH)
					if res then
						local mX, mY = convert3DCoordsToScreen(x, y, z)
						local obX, obY = convert3DCoordsToScreen(objectX, objectY, objectZ)
						renderDrawLine(mX, mY, obX, obY, 1, -1)
						renderFontDrawText(font, 'мусор', obX, obY,-1)
					end
				end
			end
		end
	end
	if getCurrentCharWeapon(playerPed) ~= 0 and proaim.v then
            if isKeyDown(VK_RBUTTON) then
                local playerID = GetNearestPed(aimfovik.v)
                if playerID ~= -1 then
                    local result, v = sampGetCharHandleBySampPlayerId(playerID)
                    if result then
                        if doesCharExist(v) and not isCharDead(v) then
                            if v ~= playerPed then
                                local my_pos = {getCharCoordinates(playerPed)}
                                local other_pos = {getCharCoordinates(playerPed)}
                                local camCoordX, camCoordY, camCoordZ = getActiveCameraCoordinates()
                                local targetCamX, targetCamY, targetCamZ = getActiveCameraPointAt()
                                local heading = getCharHeading(playerPed)
                                local angle = getHeadingFromVector2d(targetCamX - camCoordX, targetCamY - camCoordY)
                                local vector = {my_pos[1] - camCoordX, my_pos[2] - camCoordY}
                                setCharCoordinates(v, (my_pos[1] + math.sin(-math.rad(angle)) * 1.1) + (math.sin(-math.rad(angle)) / 2) - (0.3 * math.sin(-math.rad(angle + 90))), (my_pos[2] + math.cos(-math.rad(angle)) * 1.1) + (math.cos(-math.rad(angle)) / 2) - (0.3 * math.cos(-math.rad(angle + 90))), my_pos[3] - 0.6)
                                setCharHeading(v, heading)
                            end
                        end
                    end
                end
            end
        end
	if not sampIsChatInputActive() and not sampIsDialogActive() and not isSampfuncsConsoleActive() then
		if isKeyJustPressed(VK_F2) then 
			main_window_state.v = not main_window_state.v 
			imgui.Process = main_window_state.v
		end
	end
	if cbz1.v then
		aiming = 8
	end
	if cbz2.v then
		aiming = 3
	end
	if cbz3.v then
		aiming = 42
	end
	if cbz4.v then
		aiming = 54
	end
	if not sampIsChatInputActive() and not sampIsDialogActive() and not isSampfuncsConsoleActive() then
		if isKeyJustPressed(VK_F5) then 
			windows.v = not windows.v 
			imgui.Process = windows.v
		end
	end
	 if nospread.v then
		memory.setfloat(0x8D2E64, 0)            
	else
		memory.setfloat(0x8D2E64, memory.getfloat(0x8D2E64))
	end
	
	if nocamrestore.v then
		memory.write(0x5109AC, 235, 1, true)
		memory.write(0x5109C5, 235, 1, true)
		memory.write(0x5231A6, 235, 1, true)
		memory.write(0x52322D, 235, 1, true)
		memory.write(0x5233BA, 235, 1, true)
	end
	
	if nubaim.v and memory.getint8(getCharPointer(PLAYER_PED) + 0x528, false) == 19 and isKeyDown(2) and isCharOnFoot(1) and getDamage(getCurrentCharWeapon(1)) then
		local X,Y = get_crosshair_position()
		renderFigure2D(X,Y, 50, aimfovik.v, 0x55007FFF)
	end
	if testCheat("wh") then
		wallhack.v = not wallhack.v
	end
	if skywalk.v then
		X, Y,Z = getCharCoordinates(1)
		obj1 = createObject(19372, X, Y, Z - 1.30)
		setObjectQuaternion(obj1, 1.5, 0, 0.7, 0)
		setObjectCoordinates(obj1, X, Y, Z-1.20)
		wait(100)
		deleteObject(obj1)
		
	end
	if ntpo then
		if tpodejda then
			for a = 1, 2048 do
				if sampIs3dTextDefined(a) then
					local string, color, vposX, vposY, vposZ, distance, ignoreWalls, playerId, vehicleId = sampGet3dTextInfoById(a)
					if isPointOnScreen(vposX, vposY, vposZ, 1) and string.find(string, "Заберите") then	
						local sync = samp_create_sync_data("player")
						
						setCharCoordinates(1,vposX, vposY, vposZ-1.2)
						sync.position = {vposX, vposY, vposZ-1.2}
						sync.send()
						altsync(true)
						else
						altsync(false)
					end
				end
			end
		end
	end
	
	 if autoscroll.v and getAmmoInClip() == 1 then
		guns = getCurrentCharWeapon(1)
		setCurrentCharWeapon(PLAYER_PED, 0) -- скроллит на фист
		sampForceOnfootSync() -- отправляет синхронизацию для того чтобы и для других челов у тебя из рук на несколько мс пропал дигл
		wait(200) -- сама задержка скролла, она выставляется в миллисекундах, т.е 1000мс = 1с, самое оптимальное значение 200-300 мс
		setCurrentCharWeapon(PLAYER_PED, guns) -- скроллит обратно на дигл
    end
	end
end
local getBonePosition = ffi.cast("int (__thiscall*)(void*, float*, int, bool)", 0x5E4280)
function GetBodyPartCoordinates(id, handle)
    local pedptr = getCharPointer(handle)
    local vec = ffi.new("float[3]")
    getBonePosition(ffi.cast("void*", pedptr), vec, id, true)
    return vec[0], vec[1], vec[2]
end
local shotindex = 0

function setSkills(skillsLevel)
    for i = 0, 10 do
        local bs = raknetNewBitStream()
        raknetBitStreamWriteInt16(bs, select(2, sampGetPlayerIdByCharHandle(PLAYER_PED))) -- Player ID
        raknetBitStreamWriteInt32(bs, i) -- Skill ID
        raknetBitStreamWriteInt16(bs, skillsLevel) -- Level
        raknetEmulRpcReceiveBitStream(34, bs)
        raknetDeleteBitStream(bs)
    end
end

function fix(angle)
    if angle > math.pi then
        angle = angle - (math.pi * 2)
    elseif angle < -math.pi then
        angle = angle + (math.pi * 2)
    end
    return angle
end

function get_crosshair_position()
    local vec_out = ffi.new("float[3]")
    local tmp_vec = ffi.new("float[3]")
    ffi.cast("void (__thiscall*)(void*, float, float, float, float, float*, float*)", 0x514970)
    (ffi.cast("void*", 0xB6F028), 15.0, tmp_vec[0], tmp_vec[1], tmp_vec[2], tmp_vec, vec_out)
    return vec_out[0], vec_out[1], vec_out[2]
end




function getMoveSpeed(heading, speed)
    moveSpeed = {x = math.sin(-math.rad(heading)) * (speed), y = math.cos(-math.rad(heading)) * (speed), z = 0.25} 
    return moveSpeed
end

function sendKey(key)
    local _, myId = sampGetPlayerIdByCharHandle(PLAYER_PED)
    local data = allocateMemory(68)
    sampStorePlayerOnfootData(myId, data)
    setStructElement(data, 4, 2, key, false)
    sampSendOnfootData(data)
    freeMemory(data)
end

function altsync(bool)
	lua_thread.create(function()
		if bool then
			alt = not alt
			local sync = samp_create_sync_data("player")
			sync.keysData = alt and 1024 or 0
			sync.send()
			--sampAddChatMessage(alt and 'rabotaet' or 'nerabotaet', -1)
		end
	end)
end

function jumpsync(bool)
	lua_thread.create(function()
		if bool then
			sprint = not sprint
			local sync = samp_create_sync_data("player")
			sync.keysData = sprint and 8 or 0
			sync.send()
		--	sampAddChatMessage(sprint and 'rabotaet' or 'nerabotaet', -1)
		end
	end)
end


function SearchMarker(posX, posY, posZ, radius, isRace)
    local ret_posX = 0.0
    local ret_posY = 0.0
    local ret_posZ = 0.0
    local isFind = false

    for id = 0, 31 do
        local MarkerStruct = 0
        if isRace then MarkerStruct = 0xC7F168 + id * 56
        else MarkerStruct = 0xC7DD88 + id * 160 end
        local MarkerPosX = representIntAsFloat(readMemory(MarkerStruct + 0, 4, false))
        local MarkerPosY = representIntAsFloat(readMemory(MarkerStruct + 4, 4, false))
        local MarkerPosZ = representIntAsFloat(readMemory(MarkerStruct + 8, 4, false))

        if MarkerPosX ~= 0.0 or MarkerPosY ~= 0.0 or MarkerPosZ ~= 0.0 then
            if getDistanceBetweenCoords3d(MarkerPosX, MarkerPosY, MarkerPosZ, posX, posY, posZ) < radius then
                ret_posX = MarkerPosX
                ret_posY = MarkerPosY
                ret_posZ = MarkerPosZ
                isFind = true
                radius = getDistanceBetweenCoords3d(MarkerPosX, MarkerPosY, MarkerPosZ, posX, posY, posZ)
            end
        end
    end

    return isFind, ret_posX, ret_posY, ret_posZ
end

function setNextRequestTime(time)
    local samp = getModuleHandle("samp.dll")
    memory.setuint32(samp + 0x3DBAE, time, true)
end

function getClosestCarId()
    local minDist = invdist.v
    local closestId = -1
    local x, y, z = getCharCoordinates(PLAYER_PED)
    for i, k in ipairs(getAllVehicles()) do
        local xi, yi, zi = getCarCoordinates(k)
        local dist = math.sqrt( (xi - x) ^ 2 + (yi - y) ^ 2 + (zi - z) ^ 2 )
        if dist < minDist then
            minDist = dist
            result, closestId = sampGetVehicleIdByCarHandle(k)
        end
    end
    return closestId
end



function getTargetBlipCoordinatesFixed()
    local bool, x, y, z = getTargetBlipCoordinates(); if not bool then return false end
    requestCollision(x, y); loadScene(x, y, z)
    local bool, x, y, z = getTargetBlipCoordinates()
    return bool, x, y, z
end

function onScriptTerminate(s, q)
    if s == thisScript() then
        if doesObjectExist(object) then
            deleteObject(object)
        end
    end
end


function fgetCarSpeed( vehicleTarget, kilometersBool ) -- if "kilometersBool" is true, return km/h
    if not vehicleTarget or type( vehicleTarget ) ~= 'number' then return false end
    if not doesVehicleExist( vehicleTarget ) then return false end
    local x, y, z = getCarSpeedVector( vehicleTarget )
    if not x or not y or not z then x, y, z = 0, 0, 0 end
    local kmh = math.floor( (math.sqrt( (x*x) + (y*y) + (z*z) ) * 180) / 100 ) -- KM/H
    local mph = math.floor( (math.sqrt( (x*x) + (y*y) + (z*z) ) * 180) / 1.609344 / 100 ) -- MPH
    if kilometersBool then return true, kmh else return true, mph end
end

function sampev.onSendVehicleSync(data)
	if enabled then 
		data.moveSpeed.x = 0.2
		data.moveSpeed.y = 0.2
		data.moveSpeed.z = 0.2
	end
	if botss.v then
		data.position.z = data.position.z - 20
		data.position.y = data.position.y - 20
		data.position.x = data.position.x - 20
	end
	if enabledd then
		data.moveSpeed.x = 0.2
		data.moveSpeed.y = 0.2
		data.moveSpeed.z = 0.2
	end
	if cartrollrage.v then
		data.moveSpeed = {math.random(-Move1.v, Move1.v), math.random(-Move2.v, Move2.v), math.random(-Move3.v, Move3.v)}
		printStringNow('~r~[VEHICLE] ~g~Troll RAGE', -1)
	end
	if rvankacars.v then
		if isCharInAnyCar(PLAYER_PED) then 
			local _, handle = sampGetCharHandleBySampPlayerId(playeridd.v)
			if _ then
			ppc = {data.vehicleId}
				local heading = getCarHeading(storeCarCharIsInNoSave(PLAYER_PED))
				data.moveSpeed = getMoveSpeed(heading, 1)
				local px, py, pz = getCharCoordinates(handle) 
				local ax, ay, az = getCharCoordinates(PLAYER_PED)
				local dist = getDistanceBetweenCoords3d(px, py, pz, ax, ay, az)
				local  _, pid = sampGetPlayerIdByCharHandle(handle)
				local h = getHeadingFromVector2d(px - ax, py - ay)
				local nick = sampGetPlayerNickname(pid)
				if dist <= 29 then
					if sampIsPlayerConnected(pid) and sampGetCharHandleBySampPlayerId(pid) then
						data.position = {px,py,pz -1}
						data.moveSpeed = {(1/140),(1/140),1} 
						printStringNow('~r~Pizdim:~w~ '..nick.. '~r~ ID [~w~'..pid..'~r~]', 50)
						setCarHeading(storeCarCharIsInNoSave(playerPed), h)
						if slejka.v then
						packet = packet + 1
							if packet == math.random(1,10) then
								setCharCoordinates(1, px, py, pz)
								packet = 0
							end
						end
						if getCharHealth(handle) < 5 then
							sampAddChatMessage('жертва мертва', -1)
							rvankacars.v = false
						end
					end
				else
					rvankacars.v = false
					--setCharCoordinates(1, px, py, pz)
					sampAddChatMessage("Игрок сместился слишком далеко.", -1)
				end
			end
		else
			sampAddChatMessage('ты не в машине!', -1)
			rvankacars.v = false
		end
	end
end


function imgui.AnimatedButton(label, size, speed, rounded)
    local size = size or imgui.ImVec2(0, 0)
    local bool = false
    local text = label:gsub('##.+$', '')
    local ts = imgui.CalcTextSize(text)
    speed = speed and speed or 0.4
    if not AnimatedButtons then AnimatedButtons = {} end
    if not AnimatedButtons[label] then
        local color = imgui.GetStyle().Colors[imgui.Col.ButtonHovered]
        AnimatedButtons[label] = {circles = {}, hovered = false, state = false, time = os.clock(), color = imgui.ImVec4(color.x, color.y, color.z, 0.2)}
    end
    local button = AnimatedButtons[label]
    local dl = imgui.GetWindowDrawList()
    local p = imgui.GetCursorScreenPos()
    local c = imgui.GetCursorPos()
    local CalcItemSize = function(size, width, height)
        local region = imgui.GetContentRegionMax()
        if (size.x == 0) then
            size.x = width
        elseif (size.x < 0) then
            size.x = math.max(4.0, region.x - c.x + size.x);
        end
        if (size.y == 0) then
            size.y = height;
        elseif (size.y < 0) then
            size.y = math.max(4.0, region.y - c.y + size.y);
        end
        return size
    end
    size = CalcItemSize(size, ts.x+imgui.GetStyle().FramePadding.x*2, ts.y+imgui.GetStyle().FramePadding.y*2)
    local ImSaturate = function(f) return f < 0.0 and 0.0 or (f > 1.0 and 1.0 or f) end
    if #button.circles > 0 then
        local PathInvertedRect = function(a, b, col)
            local rounding = rounded and imgui.GetStyle().FrameRounding or 0
            if rounding <= 0 or not rounded then return end
            local dl = imgui.GetWindowDrawList()
            dl:PathLineTo(a)
            dl:PathArcTo(imgui.ImVec2(a.x + rounding, a.y + rounding), rounding, -3.0, -1.5)
            dl:PathFillConvex(col)

            dl:PathLineTo(imgui.ImVec2(b.x, a.y))
            dl:PathArcTo(imgui.ImVec2(b.x - rounding, a.y + rounding), rounding, -1.5, -0.205)
            dl:PathFillConvex(col)

            dl:PathLineTo(imgui.ImVec2(b.x, b.y))
            dl:PathArcTo(imgui.ImVec2(b.x - rounding, b.y - rounding), rounding, 1.5, 0.205)
            dl:PathFillConvex(col)

            dl:PathLineTo(imgui.ImVec2(a.x, b.y))
            dl:PathArcTo(imgui.ImVec2(a.x + rounding, b.y - rounding), rounding, 3.0, 1.5)
            dl:PathFillConvex(col)
        end
        for i, circle in ipairs(button.circles) do
            local time = os.clock() - circle.time
            local t = ImSaturate(time / speed)
            local color = imgui.GetStyle().Colors[imgui.Col.ButtonActive]
            local color = imgui.GetColorU32(imgui.ImVec4(color.x, color.y, color.z, (circle.reverse and (255-255*t) or (255*t))/255))
            local radius = math.max(size.x, size.y) * (circle.reverse and 1.5 or t)
            imgui.PushClipRect(p, imgui.ImVec2(p.x+size.x, p.y+size.y), true)
            dl:AddCircleFilled(circle.clickpos, radius, color, radius/2)
            PathInvertedRect(p, imgui.ImVec2(p.x+size.x, p.y+size.y), imgui.GetColorU32(imgui.GetStyle().Colors[imgui.Col.WindowBg]))
            imgui.PopClipRect()
            if t == 1 then
                if not circle.reverse then
                    circle.reverse = true
                    circle.time = os.clock()
                else
                    table.remove(button.circles, i)
                end
            end
        end
    end
    local t = ImSaturate((os.clock()-button.time) / speed)
    button.color.w = button.color.w + (button.hovered and 0.8 or -0.8)*t
    button.color.w = button.color.w < 0.2 and 0.2 or (button.color.w > 1 and 1 or button.color.w)
    color = imgui.GetStyle().Colors[imgui.Col.Button]
    color = imgui.GetColorU32(imgui.ImVec4(color.x, color.y, color.z, 0.2))
    dl:AddRectFilled(p, imgui.ImVec2(p.x+size.x, p.y+size.y), color, rounded and imgui.GetStyle().FrameRounding or 0)
    dl:AddRect(p, imgui.ImVec2(p.x+size.x, p.y+size.y), imgui.GetColorU32(button.color), rounded and imgui.GetStyle().FrameRounding or 0)
    local align = imgui.GetStyle().ButtonTextAlign
    imgui.SetCursorPos(imgui.ImVec2(c.x+(size.x-ts.x)*align.x, c.y+(size.y-ts.y)*align.y))
    imgui.Text(text)
    imgui.SetCursorPos(c)
    if imgui.InvisibleButton(label, size) then
        bool = true
        table.insert(button.circles, {animate = true, reverse = false, time = os.clock(), clickpos = imgui.ImVec2(getCursorPos())})
    end
    button.hovered = imgui.IsItemHovered()
    if button.hovered ~= button.state then
        button.state = button.hovered
        button.time = os.clock()
    end
    return bool
end


function SearchMarker(posX, posY, posZ, radius, isRace)
    local ret_posX = 0.0
    local ret_posY = 0.0
    local ret_posZ = 0.0
    local isFind = false

    for id = 0, 31 do
        local MarkerStruct = 0
        if isRace then MarkerStruct = 0xC7F168 + id * 56
        else MarkerStruct = 0xC7DD88 + id * 160 end
        local MarkerPosX = representIntAsFloat(readMemory(MarkerStruct + 0, 4, false))
        local MarkerPosY = representIntAsFloat(readMemory(MarkerStruct + 4, 4, false))
        local MarkerPosZ = representIntAsFloat(readMemory(MarkerStruct + 8, 4, false))

        if MarkerPosX ~= 0.0 or MarkerPosY ~= 0.0 or MarkerPosZ ~= 0.0 then
            if getDistanceBetweenCoords3d(MarkerPosX, MarkerPosY, MarkerPosZ, posX, posY, posZ) < radius then
                ret_posX = MarkerPosX
                ret_posY = MarkerPosY
                ret_posZ = MarkerPosZ
                isFind = true
                radius = getDistanceBetweenCoords3d(MarkerPosX, MarkerPosY, MarkerPosZ, posX, posY, posZ)
            end
        end
    end

    return isFind, ret_posX, ret_posY, ret_posZ
end

function getAmmoInClip()
    return memory.getuint32(getCharPointer(PLAYER_PED) + 0x5A0 + getWeapontypeSlot(getCurrentCharWeapon(PLAYER_PED)) * 0x1C + 0x8)
end


function radnf()
	math.randomseed(os.time())
	rand = math.random(1, 100)
	sampAddChatMessage(rand, -1)
end

function imgui.CenterText(text)
    local width = imgui.GetWindowWidth()
    local calc = imgui.CalcTextSize(text)
    imgui.SetCursorPosX( width / 2 - calc.x / 2 )
    imgui.Text(text)
end

function imgui.CentrSpinner(text, text)
    local width = imgui.GetWindowWidth()
    local calc = imgui.CalcTextSize(text)
    imgui.SetCursorPosX( width / 2 - calc.x / 2 )
    imgui.Spinner(text, text)
end

function imgui.CenterToggleButton(text, func)
    local width = imgui.GetWindowWidth()
    local calc = imgui.CalcTextSize(text)
    imgui.SetCursorPosX( width / 2 - calc.x / 2 )
    imgui.Checkbox(text, func)
end

function imgui.CenterInputText(text, func)
    local width = imgui.GetWindowWidth()
    local calc = imgui.CalcTextSize(text)
    imgui.SetCursorPosX( width / 2 - calc.x / 2 )
    imgui.InputText(text, func)
end


function sampSetChatInputTextWithDelay(text, delay)
    local array = {}
    for i in text:gmatch('[^%z]') do
        wait(delay)
        table.insert(array, i)
        sampSetChatInputText(table.concat(array))
    end
end

function setBrightness(int)
    memory.setint32(0x00BA6784, int)
end

function imgui.TextHex(text, hex, trans)
    imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(tonumber(hex:sub(1, 2), 16) / 255, tonumber(hex:sub(5, 6), 16) / 255, tonumber(hex:sub(5, 6), 16) / 255, (tonumber(trans) ~= nil and tonumber(trans) < 101 and tonumber(trans) > 0 and tonumber(trans)) or 100 / 100))
    local colsep = imgui.Text(text)
    imgui.PopStyleColor(1)
    return colsep
end

function lange()
	if  YKR.v then
		if imgui.Button(u8'сменить на: ') then 
			YKR.v = not YKR.v
		end
	else
		if imgui.Button(u8'змінити на:') then 
			YKR.v = not YKR.v
		end
	end
	if not YKR.v then
			imgui.Text(u8"Русский".. fa.ICON_FA_TOGGLE_OFF)
			
		else
			imgui.Text(u8"Український".. fa.ICON_FA_TOGGLE_ON) 
			
	end
	if YKR.v then
		if imgui.CustomMenu(tabs.RUS, tab, imgui.ImVec2(135, 30), 0.2, true) then
	 
		end
	else
		if imgui.CustomMenu(tabs.YRK, tab, imgui.ImVec2(135, 30), 0.2, true) then
	 
		end
	end
	
end

function tabs1()
 if not YKR.v then
	imgui.CenterToggleButton(u8"чистий чат!", chatclear)
	imgui.CenterToggleButton(u8'флуд альтом', flood)
	imgui.CenterToggleButton(u8'Флуд пробелом', floodjump) imgui.SameLine() imgui.TextQuestion(u8'флуд пропуском (бігом якщо так в Налаштуваннях) може бути корисний в спорт залі')
	imgui.CenterToggleButton(u8'Автовідповідь', prova) imgui.SameLine(nil, 5) imgui.TextQuestion(u8"Відповідає у вікнах діалогу при здачі на права в авто / льотній школі")
	imgui.CenterToggleButton(u8'Збереження зони скарбу', treasurezone)
	imgui.CenterToggleButton(u8'WH', wallhack)
	imgui.CenterToggleButton(u8'Ходіння по небу', skywalk)
	else
	imgui.CenterToggleButton(u8"чистый чат!", chatclear)
	imgui.CenterToggleButton(u8'Флуд альтом', flood)
	imgui.CenterToggleButton(u8'Флуд sprint', floodjump) imgui.SameLine() imgui.TextQuestion(u8'флуд спринтом(бегом) можеть быть полезен в спорт зале если у вас бег на пробел')
	imgui.CenterToggleButton(u8'Автоответ', prova) imgui.SameLine(nil, 5) imgui.TextQuestion(u8"Отвечает в окнах диалога при сдаче на права в авто/летной школе")
	imgui.CenterToggleButton(u8'Сохранение зоны клада', treasurezone)
	imgui.CenterToggleButton(u8'WallHack', wallhack)
	imgui.CenterToggleButton(u8'Хождение по небу', skywalk)
	
 end
end

function tabs2()
	if not YKR.v then
		imgui.CenterToggleButton(u8"Скарб", rklad) imgui.SameLine() imgui.TextQuestion(u8"Включає рендер на скарб")
		imgui.CenterToggleButton(u8"Олени", rolen) imgui.SameLine() imgui.TextQuestion(u8"Включає рендер на оленів")
		imgui.CenterToggleButton(u8'Деревина',renderdereva) imgui.SameLine() imgui.TextQuestion(u8"Включає рендер деревина вищої якості")
		imgui.CenterToggleButton(u8"Руда", rryda) imgui.SameLine() imgui.TextQuestion(u8"Включає рендер на руду")
		imgui.CenterToggleButton(u8'Вільні лавки', lavka) imgui.SameLine() imgui.TextQuestion(u8'Включає рендер на вільні лавки')
		save1()
		imgui.CenterToggleButton(u8'очистить игроков', clearchars)
	else
		imgui.CenterToggleButton(u8"Клады", rklad) imgui.SameLine() imgui.TextQuestion(u8"Включает рендер на клад")
		imgui.CenterToggleButton(u8"Олени", rolen) imgui.SameLine() imgui.TextQuestion(u8"Включает рендер на оленей")
		imgui.CenterToggleButton(u8'деревья',renderdereva) imgui.SameLine() imgui.TextQuestion(u8"Включает рендер древесина высшего качества")
		imgui.CenterToggleButton(u8"Руда", rryda) imgui.SameLine() imgui.TextQuestion(u8"Включает рендер на руду")
		imgui.CenterToggleButton(u8'Свободные Лавки', lavka) imgui.SameLine() imgui.TextQuestion(u8'Включает рендер на свободные лавки')
		save1()
		imgui.CenterToggleButton(u8'очистить игроков', clearchars)
	end
end

function GetNearestPed(fov)
    local maxDistance = maxDistAim.v
    local nearestPED = -1
    for i = 0, sampGetMaxPlayerId(true) do
        if sampIsPlayerConnected(i) then
            local find, handle = sampGetCharHandleBySampPlayerId(i)
            if find then
                if isCharOnScreen(handle) then
                    if not isCharDead(handle) then
                        local _, currentID = sampGetPlayerIdByCharHandle(PLAYER_PED)
                        local enPos = {GetBodyPartCoordinates(aiming, handle)}
                        local myPos = {getActiveCameraCoordinates()}
                        local vector = {myPos[1] - enPos[1], myPos[2] - enPos[2], myPos[3] - enPos[3]}
                        if isWidescreenOnInOptions() then coefficentZ = 0.0778 else coefficentZ = 0.103 end
                        local angle = {(math.atan2(vector[2], vector[1]) + 0.04253), (math.atan2((math.sqrt((math.pow(vector[1], 2) + math.pow(vector[2], 2)))), vector[3]) - math.pi / 2 - coefficentZ)}
                        local view = {fix(representIntAsFloat(readMemory(0xB6F258, 4, false))), fix(representIntAsFloat(readMemory(0xB6F248, 4, false)))}
                        local distance = math.sqrt((math.pow(angle[1] - view[1], 2) + math.pow(angle[2] - view[2], 2))) * 57.2957795131
                        if distance > fov then check = true else check = false end
                        if not check then
                            local myPos = {getCharCoordinates(PLAYER_PED)}
                            local distance = math.sqrt((math.pow((enPos[1] - myPos[1]), 2) + math.pow((enPos[2] - myPos[2]), 2) + math.pow((enPos[3] - myPos[3]), 2)))
                            if (distance < maxDistance) then
                                nearestPED = handle
                                maxDistance = distance
                            end
                        end
                    end
                end
            end
        end
    end
    return nearestPED
end

function imgui.OnDrawFrame()
	if not main_window_state.v then imgui.ShowCursor = false end
	if main_window_state.v then
	local flags = imgui.WindowFlags.NoResize
	imgui.ShowCursor = true
	    local X, Y = getScreenResolution()
    imgui.SetNextWindowSize(imgui.ImVec2(850, 500), imgui.Cond.FirstUseEver)
    imgui.SetNextWindowPos(imgui.ImVec2(X / 2, Y / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		 imgui.Begin(u8'##2                                                                                                                        SAMPwars', main_window_state, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize  + imgui.WindowFlags.NoScrollbar)
		 
		lange()
		rainbow_line(1000, 1)
		imgui.SetCursorPos(imgui.ImVec2(150, 50))
		
		imgui.BeginChild('Govno', imgui.ImVec2(700, 400), true)
		  
		if tab.v == 1 then
		
		save1()
		save2()
		 
		imgui.PushItemWidth(150)
				tabs1()
		elseif tab.v == 2 then
			tabs2()
		elseif tab.v == 3 then
		 
			cheattsr()
		elseif tab.v == 4  then
		 

			if imgui.Button(u8"Удалить все оружие из рук", imgui.ImVec2(-1, 0)) then 
				removeAllCharWeapons(PLAYER_PED)
			end
			imgui.BeginChild(u8"##ChildAim5", imgui.ImVec2(-1, 50), true)

			imgui.Checkbox(u8'Anti-Stan', antistun)
			sl()
			imgui.Checkbox(u8'AutoCBug', cbug)
			sl()
			imgui.Checkbox(u8'CBug-Helper', cbughelper)
			sl()
			
			imgui.Checkbox(u8'TriggerBot', trigger)
			imgui.EndChild()
			imgui.Checkbox(u8'nuboAim', nubaim)
			 imgui.PushItemWidth(480)
                    imgui.SliderFloat(u8"СА: FOV", aimfovik, 1.0, 180)
                    imgui.SliderFloat(u8"СА: Smooth", AimSmooth, 0.6, 50)
                    imgui.SliderFloat(u8"СА: Distance", maxDistAim, 1.0, 300)
                imgui.PopItemWidth()
				sl(340)
				imgui.BeginChild(u8"##ChildAim2", imgui.ImVec2(150, 120), true)
                    imgui.SameLine()

                    imgui.BeginGroup()
					if imgui.Checkbox('Aiming Head', cbz1) then
					end

					if imgui.Checkbox('Aiming Tors', cbz2) then
					end

					if imgui.Checkbox('Aiming Foot', cbz3) then
					end

					if imgui.Checkbox('Aiming Leg', cbz4) then
					end
					imgui.EndGroup()
                   imgui.EndChild()

			imgui.BeginChild(u8"##ChildAim3", imgui.ImVec2(-1, 50), true)
			imgui.Checkbox(u8'ProAim', proaim)
			sl()
			imgui.Checkbox(u8'NoSpread', nospread)
			sl()
			imgui.Checkbox(u8'noCamRestor', nocamrestore)
			sl()
			imgui.Checkbox(u8'AutoScroll 1PT', autoscroll)
			sl()
			imgui.Checkbox(u8'Full Skill Gun', skill)
			                   imgui.EndChild()
		elseif tab.v == 5 then
			tabs5()
		elseif tab.v == 6 then
			tabs6()
		elseif tab.v == 7 then
			imgui.SetCursorPos(imgui.ImVec2(0, 0))
			imgui.Image(image.handle, imgui.ImVec2(700, 330))
			if not YKR.v then
				if imgui.Button(u8'помилування від сема мейсона', imgui.ImVec2(-1,0)) then
					blago = true
					blag = true
				end
			else
				if imgui.Button(u8'помилование от сема мейсона', imgui.ImVec2(-1,0)) then
					blago = true
					blag = true
				end
			end
			if blago then
				imgui.AnimProgressBar('mason',count,1, imgui.ImVec2(200, 23)) sl() if YKR.v then imgui.Text(u8"идёт процесс помилования") else imgui.Text(u8"йде процес помилування")  end
				if blag then
					count = count + 1
				end
				if count > 100 then
					blag = false
					count = 0
					blago = false
					if not YKR.v then
						sampAddChatMessage("тебе помилував Sam_Mason, з тебе зняті всі звинувачення і гріхи", -1)
					else
						sampAddChatMessage('тебя помиловал Sam_Mason, с тебя сняты все обвинения и грехи',-1)
					end
				end
			end
				
		elseif tab.v == 8 then
			ykrpodsk()
			ykrinfo()
			gavno()
			
			elseif tab.v == 9 then
			tabs9()
		elseif tab.v == 10 then
			trolling()
		end
		imgui.EndChild()
		rainbow_line(1000, 1)
		save1()
		save2()
		
		
		imgui.End()
	end
	if windows.v then
		local flags = imgui.WindowFlags.NoResize
		local X, Y = getScreenResolution()
		imgui.SetNextWindowSize(imgui.ImVec2(200, 300), imgui.Cond.FirstUseEver)
		imgui.SetNextWindowPos(imgui.ImVec2(X / 2, Y / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.Begin(u8'##1 SAMPwars', main_window_state, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize  + imgui.WindowFlags.NoScrollbar)
		imgui.CenterText(u8"Включенные функции")
		imgui.End()
	end
	if windows.v and not main_window_state.v then
		imgui.ShowCursor = false
	end
	
end

function tabs9()
	if not YKR.v then
		if tphkablip.v then
			if imgui.Button(u8'Закінчити телепорт по мітці',imgui.ImVec2(-1, 0)) then
				speed = sped.v
				tphkablip.v = not tphkablip.v
			end
		else
			if imgui.Button(u8'Почати телепорт по мітці',imgui.ImVec2(-1, 0)) then
				speed = sped.v
				tphkablip.v = not tphkablip.v
			end
		end
		if tphkacheck.v then
			if imgui.Button(u8'Закінчити телепорт по чекпоінту',imgui.ImVec2(-1, 0)) then
				speed = sped.v
				tphkacheck.v = not tphkacheck.v
			end
		else
			if imgui.Button(u8'Почати телепорт по чекпоінту',imgui.ImVec2(-1, 0)) then
				speed = sped.v
				tphkacheck.v = not tphkacheck.v
			end
		end
		
		imgui.SliderFloat(u8'Крок ТП по мітках', sped, 1, 9)
		imgui.SliderFloat(u8'Швидкість кроку', waitt, 1, 1000)
	
	else
		if tphkablip.v then
			if imgui.Button(u8'Закончить телепорт по метке',imgui.ImVec2(-1, 0)) then
				speed = sped.v
				tphkablip.v = not tphkablip.v
			end
		else
			if imgui.Button(u8'Начать телепорт по метке',imgui.ImVec2(-1, 0)) then
				speed = sped.v
				tphkablip.v = not tphkablip.v
			end
		end
		if tphkacheck.v then
			if imgui.Button(u8'Закончить телепорт по чекпоинту',imgui.ImVec2(-1, 0)) then
				speed = sped.v
				tphkacheck.v = not tphkacheck.v
			end
		else
			if imgui.Button(u8'Начать телепорт по чекпоинту',imgui.ImVec2(-1, 0)) then
				speed = sped.v
				tphkacheck.v = not tphkacheck.v
			end
		end
		
		imgui.SliderFloat(u8'Шаг ТП по меткам', sped, 1, 9)
		imgui.SliderFloat(u8'Скорость шага', waitt, 1, 1000)
	end
end

function tabs6()
	if not YKR.v then
		if isCharInAnyCar(PLAYER_PED) then
			imgui.CenterToggleButton(u8"Включити інвіз", botss) imgui.SameLine() imgui.TextQuestion(u8"включає інвіз з машини (тупо - 20 м під землю)")
		else
			imgui.CenterToggleButton(u8"Включити інвіз", bots)
			
			imgui.CenterToggleButton(u8"Включити показ взятої машини", carcheck)
			imgui.CenterToggleButton(u8"Включити показ де знаходиться твій персонаж", pokazz)
			imgui.CenterToggleButton(u8'Ограничение дистанции', servcheck) imgui.SameLine() imgui.TextQuestion(u8"Якщо включити то буде огран інвіза 50 метрів") imgui.SameLine() imgui.TextQuestion(u8"нужно только для серверов аризоны:)")
			imgui.SliderFloat(u8"Invis X", invx, -50, 50)
			
			imgui.SliderFloat(u8"Invis Y", invy, -50, 50)
			imgui.SliderFloat(u8"Invis Z", invz, -50, 50)
			
			if servcheck.v then
				imgui.SliderFloat(u8"Invis Dist", invdist, 10, 50)
				invdist.v = 50
			else
				imgui.SliderFloat(u8"Invis Dist", invdist, 10, 200)
			end
		end
	else
		if isCharInAnyCar(PLAYER_PED) then
			imgui.CenterToggleButton(u8"Включить инвиз", botss) imgui.SameLine() imgui.TextQuestion(u8"включает инвиз из машины (тупо-20 м под землю)")
		else
			imgui.CenterToggleButton(u8"Включить инвиз", bots)
			
			imgui.CenterToggleButton(u8"Включить показ взятой машины", carcheck)
			imgui.CenterToggleButton(u8"Включить показ где находится твой персонаж", pokazz)
			imgui.CenterToggleButton(u8'Ограничение дистанции', servcheck) imgui.SameLine() imgui.TextQuestion(u8"Если включить то будет огран инвиза 50 метров") imgui.SameLine() imgui.TextQuestion(u8"нужно только для серверов аризоны:)")
			imgui.SliderFloat(u8"Invis X", invx, -50, 50)
			
			imgui.SliderFloat(u8"Invis Y", invy, -50, 50)
			imgui.SliderFloat(u8"Invis Z", invz, -50, 50)
			
			if servcheck.v then
				imgui.SliderFloat(u8"Invis Dist", invdist, 10, 50)
				invdist.v = 50
			else
				imgui.SliderFloat(u8"Invis Dist", invdist, 10, 200)
			end
		end
	end
end

function  tabs5()
if not YKR.v then
	imgui.CenterToggleButton(u8'Магніт для причепа', trailerrr)
	imgui.CenterToggleButton(u8'швидка їзда на мото з шифтом', motoban)
	imgui.CenterToggleButton(u8'Скіп оренди', skiparenda) imgui.SameLine() imgui.TextQuestion(u8"Прибирає пропозицію про оренду")
	imgui.CenterToggleButton(u8'Бесконечный бензин', infinitifuel) sl() imgui.TextQuestion(u8'aka їзда без двигуна, корисний разом зі "Скіп оренди"')
	imgui.CenterToggleButton(u8'Скіп фам машині', skipfamcar) imgui.SameLine() imgui.TextQuestion(u8'Прибирає діалог коли сідаєш в фам машину')
	else
	imgui.CenterToggleButton(u8'Магнит для прицепа', trailerrr)
	imgui.CenterToggleButton(u8'быстрая езда на мото с шифтом', motoban)
	imgui.CenterToggleButton(u8'Скип аренды', skiparenda) imgui.SameLine() imgui.TextQuestion(u8"Убирает предложение об аренде")
	imgui.CenterToggleButton(u8'Бесконечный бензин', infinitifuel) sl() imgui.TextQuestion(u8'aka Езда без двигателя, полезен вместе со "Скип аренды"')
	imgui.CenterToggleButton(u8'Скип в фам машине', skipfamcar) imgui.SameLine() imgui.TextQuestion(u8'Убирает Диалог когда садишься в фам машину')
	end
	if isCharInAnyCar(PLAYER_PED) then
	if imgui.Button(u8'выдать 1500-2000 хп на машину', imgui.ImVec2(300,50)) then imgui.SameLine() imgui.TextQuestion(u8"легит :)")
		repere = true
		lua_thread.create(function()
			math.randomseed(os.time())
			i = 0
			repeat
			if repere then
				setCarRoll(storeCarCharIsInNoSave(1), 0)
				wait(100)
				setCarHealth(storeCarCharIsInNoSave(1), math.random(1500,2000))
				wait(100)
				fixCar(storeCarCharIsInNoSave(1))
			end
			i = i + 1
			until i == 15
			repere = false
			sampAddChatMessage("ты сэкономил 30к вирт на ремке",-1)
		end)
	end
	imgui.SameLine()
	if imgui.Button(u8'выдать 5к хп на машину', imgui.ImVec2(300,50)) then imgui.SameLine() imgui.TextQuestion(u8"полу-легит :|")
		repere = true
		lua_thread.create(function()
			i = 0
			repeat
			if repere then
				setCarRoll(storeCarCharIsInNoSave(1), 0)
				wait(100)
				setCarHealth(storeCarCharIsInNoSave(1), 5000)
				wait(100)
				fixCar(storeCarCharIsInNoSave(1))
			end
			i = i + 1
			until i == 15
			repere = false
			sampAddChatMessage("так ладно, 5к оформленно",-1)
		end)
	end
	if imgui.Button(u8'выдать 30к хп на машину', imgui.ImVec2(300,50)) then imgui.SameLine() imgui.TextQuestion(u8"рейдж ;)")
		repere = true
		lua_thread.create(function()
			i = 0
			repeat
			if repere then
				setCarRoll(storeCarCharIsInNoSave(1), 0)
				wait(100)
				setCarHealth(storeCarCharIsInNoSave(1), 30000)
				wait(100)
				fixCar(storeCarCharIsInNoSave(1))
			end
			i = i + 1
			until i == 15
			repere = false
			sampAddChatMessage("и нахуя тебе столько?",-1)
		end)
	end
	imgui.SameLine()
	if imgui.Button(u8'выдать 1кk хп на машину', imgui.ImVec2(300,50)) then imgui.SameLine() imgui.TextQuestion(u8"ты теперь ебаный танк")
		repere = true
		lua_thread.create(function()
			i = 0
			repeat
			if repere then
				setCarRoll(storeCarCharIsInNoSave(1), 0)
				wait(100)
				setCarHealth(storeCarCharIsInNoSave(1), 1000000)
				wait(100)
				fixCar(storeCarCharIsInNoSave(1))
			end
			i = i + 1
			until i == 15
			repere = false
			sampAddChatMessage('надеюсь ты теперь доволен тем что ты танк',-1)
		end)
	end
	end
	imgui.SliderFloat("MoveSpeed[X]", Move1, 0, 99)
	imgui.SliderFloat("MoveSpeed[Y]", Move2, 0, 99)
	imgui.SliderFloat("MoveSpeed[Z]", Move3, 0, 99)
	sl() imgui.TextQuestion(u8'Найстройки выше для RAGE рванки с машины ')
end



function cheattsr()
	if not YKR.v then
		imgui.CenterToggleButton(u8'WH сміття', trashWH)
		imgui.CenterToggleButton(u8'Збивши анімок', sbivmyso)
		imgui.CenterToggleButton(u8'Бот на вантажники', botstatusTSR)
		imgui.CenterToggleButton(u8"Крадіжка їжі", stiler)
		imgui.CenterToggleButton(u8"ТПшится до холодильника", tpholodilnik) imgui.SameLine() imgui.TextQuestion(u8"тпшит вас до холодильника як ви взяли м'ясо")
		imgui.CenterToggleButton(u8"Класти м'ясо", lojitmaso)

	else
		imgui.CenterToggleButton(u8'WH мусор', trashWH)
		imgui.CenterToggleButton(u8'Сбив анимok', sbivmyso)
		imgui.CenterToggleButton(u8'Бот на грузщики', botstatusTSR)
		imgui.CenterToggleButton(u8"кража еды", stiler)
		imgui.CenterToggleButton(u8"ТПшится к холодильнику", tpholodilnik) imgui.SameLine() imgui.TextQuestion(u8"тпшит вас к холодильнику как вы взяли мясо")
		imgui.CenterToggleButton(u8'ложить мясо', lojitmaso)
	end
end

function ykrpodsk()
	imgui.Text(u8"/bottsr") imgui.SameLine() if not YKR.v then imgui.TextQuestion(u8'Включення / вимикання бота на трс')else imgui.TextQuestion(u8'Включение/выключение бота на трс') end
	sl()
	if not YKR.v then
	imgui.Text(u8"/rescam") imgui.SameLine() imgui.TextQuestion(u8'фіксує камеру якщо та зависла')
	sl()
	imgui.Text(u8"/ivcdmenu") imgui.SameLine() imgui.TextQuestion(u8'відкриває це меню:)')
	sl()
	imgui.Text(u8"/spos") imgui.SameLine() imgui.TextQuestion(u8'зберігає ваші координати')
	imgui.Text(u8"/rand") imgui.SameLine() imgui.TextQuestion(u8'виводить число від 1 до 100')
	sl()
	imgui.Text(u8"/recc") imgui.SameLine() imgui.TextQuestion(u8'повторно підключає вас до сервера без затримки')
	sl()
	imgui.Text(u8"/setmark 'x', 'y', 'z' ") imgui.SameLine() imgui.TextQuestion(u8'ставить мітку на заданих координатах')
	sl()
	imgui.Text(u8"Flooder ALT") imgui.SameLine() imgui.TextQuestion(u8'затисни R що б флудився ALT')
	imgui.Separator()
	imgui.CenterText(u8'версія скрипта :'.. tonumber(vers)..u8 ' повна версія скрипта: '..tonumber(vers_text))
	else
	imgui.Text(u8"/rescam") imgui.SameLine() imgui.TextQuestion(u8'Фиксит камеру если та зависла')
	sl()
	imgui.Text(u8"/ivcdmenu") imgui.SameLine() imgui.TextQuestion(u8'Открывает это меню:)')
	sl()
	imgui.Text(u8"/spos") imgui.SameLine() imgui.TextQuestion(u8'копирует ваши координаты')
	imgui.Text(u8"/rand") imgui.SameLine() imgui.TextQuestion(u8'выводит число от 1 до 100')
	sl()
	imgui.Text(u8"/recc") imgui.SameLine() imgui.TextQuestion(u8'переподключает вас к серверу без задержки')
	sl()
	imgui.Text(u8"/setmark 'x', 'y', 'z' ") imgui.SameLine() imgui.TextQuestion(u8'ставит метку на заданных координатах')
	sl()
	imgui.Text(u8"Flooder ALT") imgui.SameLine() imgui.TextQuestion(u8'зажми R что бы флудился ALT')
	imgui.Separator()
	imgui.CenterText(u8'версия скрипта :'.. tonumber(vers)..u8 ' полная версия скрипта: '..tonumber(vers_text))
	end
end

function ykrinfo()
	if not YKR.v then
	imgui.CenterText(u8'актуальна версія скрипта :'.. tonumber(helper.info.vers)..u8' полная версія: '..tonumber(helper.info.vers_text))
	imgui.CenterText(u8'назва актуального оновлення: '..helper.info.text_update)
	imgui.Separator()
	imgui.CenterText(u8'телепорт на готовий одяг в тимчасово')
	imgui.CenterToggleButton(u8'показує встановлені анімації сервером', anims)
	else
	imgui.CenterText(u8'актуальная версия скрипта :'.. tonumber(helper.info.vers)..u8' полная версия: '..tonumber(helper.info.vers_text))
	imgui.CenterText(u8'название актуального обновления: '..helper.info.text_update)
	imgui.Separator()
	imgui.CenterText(u8'телепорт на готову одежду в разработке(времмено)')
	imgui.CenterToggleButton(u8'показывает установленые анимации сервером', anims)
	imgui.CenterToggleButton(u8'Вкоючить дополнительное окно', windows)
	end
	imgui.Text(u8'Author')
	imgui.SameLine()
	imgui.Link(u8'https://vk.com/gclustov', 'VK "click"')
	imgui.Text(u8'SampHack')
	imgui.SameLine()
	imgui.Link(u8'https://www.youtube.com/@TheSampHack?sub_confirmation=1', 'YouTube  "click"')
	imgui.Text(u8'Author')
	imgui.SameLine()
	imgui.Link(u8'https://www.youtube.com/@vensuelateams1033?sub_confirmation=1', 'YouTube: "click"')
	imgui.Text(u8'Author')
	imgui.SameLine()
	imgui.Link(u8'https://www.blast.hk/members/463300/', 'BlastHack "click"')
end


function imgui.GraphicKey(name, size, color, line_color)

    if UI_GRAPHICKEY == nil then
        UI_GRAPHICKEY = {}
    end
    if not UI_GRAPHICKEY[name] then
        UI_GRAPHICKEY[name] = {
            clicked = nil,
            line_list = {},
            code_list = ""
    }
    end

    local pool = UI_GRAPHICKEY[name]
    local old_cursor = imgui.ImVec2(imgui.GetCursorPos().x,
        imgui.GetCursorPos().y
    )
    local draw_list = imgui.GetWindowDrawList()

    local function DotBox(i)
        local dot_box_cursor = imgui.ImVec2(imgui.GetCursorPos().x + imgui.GetWindowPos().x + (size / 2),
        imgui.GetCursorPos().y + imgui.GetWindowPos().y + (size / 2))

        imgui.BeginChild("##" .. name .. i, imgui.ImVec2(size, size))

        imgui.EndChild()

        draw_list:AddCircleFilled(dot_box_cursor, (size / 2) * 0.4,
            imgui.GetColorU32(color or imgui.GetStyle().Colors[imgui.Col.Button]), 64
        )

        if imgui.IsItemClicked() and pool["clicked"] == nil then
            pool["clicked"] = i
            table.insert(pool["line_list"], dot_box_cursor)
            pool["code_list"] = pool["code_list"] .. i
        end
        if imgui.IsItemHovered() and imgui.IsMouseDown(0) and pool["clicked"] ~= i and pool["clicked"] ~= nil then
            for j = 1, #pool["line_list"] do
                if pool["line_list"][j].x == dot_box_cursor.x and pool["line_list"][j].y == dot_box_cursor.y then
                    return nil
                end
            end
            table.insert(pool["line_list"], dot_box_cursor)
            pool["code_list"] = pool["code_list"] .. i
        end
    end
    imgui.PushStyleColor(imgui.Col.ChildWindowBg, imgui.ImVec4(1, 1, 1, 0))
        for i = 1, 9 do
            imgui.SetCursorPos(imgui.ImVec2(old_cursor.x + (size * ((2 + (i % -3)) * 1.5)),
            old_cursor.y + (size * math.floor((i / 3) - 0.2) * 1.5)
        ))
            DotBox(i)
        end

        if imgui.IsMouseDown(0) and pool["clicked"] ~= nil then
            for i = 1, #pool["line_list"] do

                if i ~= #pool["line_list"] then
                    draw_list:AddLine(
                        pool["line_list"][i],
                        pool["line_list"][i + 1],
                        imgui.GetColorU32(line_color or imgui.GetStyle().Colors[imgui.Col.Separator]),
                        size / 8
                    )
                    draw_list:AddCircle(
                        pool["line_list"][i],
                        size / 2,
                        imgui.GetColorU32(line_color or imgui.GetStyle().Colors[imgui.Col.Separator]),
                        nil, size / 8
                    )
                else
                    draw_list:AddLine(
                        pool["line_list"][i],
                        imgui.ImVec2(imgui.GetMousePos().x, imgui.GetMousePos().y),
                        imgui.GetColorU32(line_color or imgui.GetStyle().Colors[imgui.Col.Separator]),
                        size / 8
                    )
                    draw_list:AddCircle(
                        pool["line_list"][i],
                        size / 2,
                        imgui.GetColorU32(line_color or imgui.GetStyle().Colors[imgui.Col.Separator]),
                        nil, size / 8
                    )
                end
            end
        elseif not imgui.IsMouseDown(0) then
            pool["clicked"] = nil
            pool["line_list"] = {}
            pool["code_list"] = ""
        end
    imgui.PopStyleColor(1)
    return pool["code_list"]
end

function trolling()
	if not YKR.v then
		imgui.CenterToggleButton(u8"Новий аксесуар", asdzxc) sl() imgui.TextQuestion(u8"Запишіть айді в рядок нижче айді")
		imgui.CenterToggleButton(u8'Рванка з машини', rvankacars)
		imgui.CenterToggleButton(u8'Рванка з ніг', rvankaonfoot)
		imgui.InputInt(u8'ID PLAYER', playeridd, 0)
		imgui.CenterToggleButton(u8'писати', pissat)
		imgui.CenterToggleButton(u8'крутити', spinner)
		imgui.CenterToggleButton(u8'телепортуватися за жетрвою', slejka)
		imgui.CenterToggleButton(u8'Рванка з машини в радіусі', cartrollrage) sl() imgui.TextQuestion(u8'На Арізоні не працює')
	else
		imgui.CenterToggleButton(u8"Новый аксессуар", asdzxc) sl() imgui.TextQuestion(u8"Запишите айди в строку ниже айди")
		imgui.CenterToggleButton(u8'Рванка с машины', rvankacars)
		imgui.CenterToggleButton(u8'Рванка с ног', rvankaonfoot)
		imgui.InputInt(u8'ID PLAYER', playeridd, 0)
		imgui.CenterToggleButton(u8'писать', pissat)
		imgui.CenterToggleButton(u8'крутиться', spinner)
		imgui.CenterToggleButton(u8'телепортироваться за жетрвой', slejka)
		imgui.CenterToggleButton(u8'Рванка с машины в радиусе', cartrollrage) sl() imgui.TextQuestion(u8'На Аризоне не работает')
	end
end

function gavno()
	if not YKR.v then
		if imgui.Button(u8'Перевірити оновлення', imgui.ImVec2(-1,0)) then
			downloadUrlToFile(update_url, update_path, function(id, status)
				if status == dlstatus.STATUS_ENDDOWNLOADDATA then
					helper = inicfg.load(nil, update_path)
					if tonumber(helper.info.vers) > vers then
						sampAddChatMessage("є оновлення! Версія: " .. helper.info.vers_text, -1)
						sampAddChatMessage('що б його отримати відпишіть в VK: @gclustov',-1)
					else
						sampAddChatMessage("Встановлена актуальна версія!",-1)
					end
				end
			end)
		end
	else
		if imgui.Button(u8'Проверить обновление', imgui.ImVec2(-1,0)) then
			downloadUrlToFile(update_url, update_path, function(id, status)
				if status == dlstatus.STATUS_ENDDOWNLOADDATA then
					helper = inicfg.load(nil, update_path)
					if tonumber(helper.info.vers) > vers then
						sampAddChatMessage("Есть обновление! Версия: " .. helper.info.vers_text, -1)
						sampAddChatMessage('что бы его получить отпишите в VK: @gclustov',-1)
					else
						sampAddChatMessage("Установлена актуальная версия!",-1)
					
					end
				end
			end)
		end
	end
	if imgui.Button(u8'тест', imgui.ImVec2(-1,0)) then
		downloadUrlToFile(update_url, update_path, function(id, status)
			if status == dlstatus.STATUS_ENDDOWNLOADDATA then
				sampAddChatMessage("END", -1)
			end
		end)
	end
end

function sl(int)
	imgui.SameLine(int)
end


function renderDrawLineBy3dCoordss(posX, posY, posZ, posX2, posY2, posZ2, width, color)
    local SposX, SposY = convert3DCoordsToScreen(posX, posY, posZ)
    local SposX2, SposY2 = convert3DCoordsToScreen(posX2, posY2, posZ2)
    if isPointOnScreen(posX, posY, posZ, 1) and isPointOnScreen(posX2, posY2, posZ2, 1) then
        renderDrawLine(SposX, SposY, SposX2, SposY2, width, color)
    end
end

function setDistanceAngle(dist)
    local sBase = require 'memory'
    local memory = { 11989248, 11989228, 11989244, 11989224 }
    for i = 1, #memory do
        sBase.setfloat(memory[i], dist)
    end
end

function nameTagOn()
 
    local pStSet = sampGetServerSettingsPtr();
    NTdist = memory.getfloat(pStSet + 39)
    NTwalls = memory.getint8(pStSet + 47)
    NTshow = memory.getint8(pStSet + 56)
    memory.setfloat(pStSet + 39, 999)
    memory.setint8(pStSet + 47, 0)
    memory.setint8(pStSet + 56, 1)
end

function nameTagOff()

	local pStSet = sampGetServerSettingsPtr();
	memory.setfloat(pStSet + 39, 20)
	memory.setint8(pStSet + 47, 0)
	memory.setint8(pStSet + 56, 1)
end

function sampev.onShowDialog(id, style, title, button1, button2, text)
	if skiparenda.v then
		if text:find("Транспорт для аренды!") then
			sampSendChat("/gps")
			gpshide = true
			return false
		end
	end
	if infinitifuel.v then
		if isCharInAnyCar(1) then
			setCarEngineOn(storeCarCharIsInNoSave(PLAYER_PED), true)
		end
	end
	if text:find("Вы хотите начать") and dancer.v then
		sampAddChatMessage("начинаю танец", -1)
		sampSendDialogResponse(1600, 1, 0, nil)
	end
	if text:find("тренировки") and dancer.v then
		return false
	end
	if id == 7881 and stiler.v and isKeyDown(0x52) then
    	local number = 0
    	for s in string.gmatch(text, "[^[]+") do
    		if s:find('{FFDB56}') then
    			sampSendDialogResponse(id, 1, number - 1)
    			break
    		else
    			number = number + 1
    		end
		end
		return false
    end
	
	if skipfamcar.v then
		if text:find("хотите взять") then
			sampAddChatMessage("123", -1)
			sampSendDialogResponse(id, 1, nil, nil)
			sampSendChat("/gps")
			gpshide = true
			return false
		end
		if title:find("Аренда семейного авто") then
			sampSendChat("/gps")
			gpshide = true
			return false
		end
	end
	if gpshide then
			sampSendDialogResponse(id, 0, nil, nil)
			gpshide = false
			return false
	end
	if prova.v then
		if id == 70 then
			sampSendDialogResponse(id, 1, title:find("Максимальная скорость вне") and 1 or title:find("Что нужно делать при тумане?") and 0 or title:find("Разрешена ли парковка на тротуаре") and 2 or title:find("Максимальная скорость в городе") and 1 or 0, nil)
			return false
		end
	end
	if prova.v then
		if id == 3339 then
			sampSendDialogResponse(id, 1, title:find("Какая дистанция должна быть между двумя") and 3 or title:find("Летать разрешено") and 3 or title:find("Можно ли садиться на зданиях") and 2 or title:find("Полет между зданиями") and 1 or title:find("Перед взлетом необходимо проверить") and 1 or title:find("Разрешено ли буксировать другие") and 1 or title:find("Покидать кабину летательного аппарата") and 0 or 0, nil)
			return false
		end
	end
	if lojitmaso.v and id == 7881 then
		local number = 0
    	for s in string.gmatch(text, "[^[]+") do
    		if s:find('Пустая полка') then
    			sampSendDialogResponse(id, 1, number - 1)
    			break
    		else
    			number = number + 1
    		end
		end
		return false
	end
    if id == 7881 and stiler.v and isKeyDown(52) then
    	local number = 0
    	for s in string.gmatch(text, "[^[]+") do
    		if s:find('{FFDB56}') then
    			sampSendDialogResponse(id, 1, number - 1)
    			break
    		else
    			number = number + 1
    		end
		end
		return false
    end
end



function imgui.SelectButton(name, bool, size)
    if bool.v then
        imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.0, 0.6, 0.0, 0.40))
        imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(0.0, 0.8, 0.0, 1.0))
        imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(0.0, 1.0, 0.0, 1.0))
    else
        imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.6, 0.0, 0.0, 0.40))
        imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(0.8, 0.0, 0.0, 1.0))
        imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(1.0, 0.0, 0.0, 1.0))
    end
    if not size then size = imgui.ImVec2(0, 0) end
    local result = imgui.Button(name, size)
    imgui.PopStyleColor(3)
    if result then bool.v = not bool.v end
    return result
end

function join_argb(a, r, g, b) -- by FYP
    local argb = b  -- b
    argb = bit.bor(argb, bit.lshift(g, 8))  -- g
    argb = bit.bor(argb, bit.lshift(r, 16)) -- r
    argb = bit.bor(argb, bit.lshift(a, 24)) -- a
    return argb
end

function sampev.onShowTextDraw(arg0_a1051, arg1_a1077)
	if dancer and arg1_a1077.position.x >= 303.4 and arg1_a1077.position.x <= 324.6 then
		if arg1_a1077.text == "LD_BEAT:up" then
			setGameKeyState(1, -128)
		elseif arg1_a1077.text == "LD_BEAT:down" then
			setGameKeyState(1, 128)
		elseif arg1_a1077.text == "LD_BEAT:right" then
			setGameKeyState(0, 128)
		elseif arg1_a1077.text == "LD_BEAT:left" then
			setGameKeyState(0, -128)
		end
	end
end

function imgui.custom_togglebutton(name, bool, size)
    local function bringFloatTo(from, to, start_time, duration)
        local timer = os.clock() - start_time
        if timer >= 0.00 and timer <= duration then
            local count = timer / (duration / 100)
            return from + (count * (to - from) / 100), true
        end
        return (timer > duration) and to or from, false
    end

    local rounding = imgui.GetStyle().FrameRounding
    local size = size or imgui.ImVec2(60, 25)
    local dl = imgui.GetWindowDrawList()
    local p = imgui.GetCursorScreenPos()

    if UI_CUSTOM_TOGGLEBUTTON == nil then UI_CUSTOM_TOGGLEBUTTON = {} end

    if UI_CUSTOM_TOGGLEBUTTON[name] == nil then
        UI_CUSTOM_TOGGLEBUTTON[name] = {
            argument = bool[0],
            bool = false,
            alignment = {bool[0] and size.x / 1.5 - 5 or 0, true},
            clock = 0
        }
    end

    local go_anim = true
    if UI_CUSTOM_TOGGLEBUTTON[name].argument ~= bool[0] then
        UI_CUSTOM_TOGGLEBUTTON[name].argument = bool[0]
        if go_anim then
            UI_CUSTOM_TOGGLEBUTTON[name].bool = true
            UI_CUSTOM_TOGGLEBUTTON[name].clock = os.clock()
        else
            UI_CUSTOM_TOGGLEBUTTON[name].alignment = {bool[0] and size.x / 1.5 - 5 or 0, true}
        end
    end

    local color = {
        constant_color = bool[0] and imgui.GetColorU32Vec4(imgui.GetStyle().Colors[imgui.Col.CheckMark]) or imgui.GetColorU32Vec4(imgui.GetStyle().Colors[imgui.Col.FrameBg]),
        temp_color = bool[0] and imgui.GetColorU32Vec4(imgui.GetStyle().Colors[imgui.Col.CheckMark]) or imgui.GetColorU32Vec4(imgui.GetStyle().Colors[imgui.Col.FrameBg])
    }

    local get_cursor_y = imgui.GetCursorPosY()
    if imgui.InvisibleButton(name, imgui.ImVec2(size)) then UI_CUSTOM_TOGGLEBUTTON[name].bool = true; UI_CUSTOM_TOGGLEBUTTON[name].clock = os.clock(); bool[0] = not bool[0] end
    if imgui.IsItemHovered() then color.temp_color = imgui.GetColorU32Vec4(imgui.GetStyle().Colors[imgui.Col.FrameBgHovered]) end
    if imgui.IsItemActive() then color.temp_color = imgui.GetColorU32Vec4(imgui.GetStyle().Colors[imgui.Col.FrameBgActive]) end
    imgui.SameLine()
    imgui.BeginGroup()
    imgui.SetCursorPosY(get_cursor_y + (size.y - imgui.CalcTextSize(name).y) / 2)
    imgui.Text(name)
    imgui.EndGroup()

    if UI_CUSTOM_TOGGLEBUTTON[name].bool then
        UI_CUSTOM_TOGGLEBUTTON[name].alignment = {bringFloatTo((bool[0] and 0 or size.x / 1.5 - 5), (bool[0] and size.x / 1.5 - 5 or 0), UI_CUSTOM_TOGGLEBUTTON[name].clock, 0.3)}
        if UI_CUSTOM_TOGGLEBUTTON[name].alignment[2] == false then UI_CUSTOM_TOGGLEBUTTON[name].bool = false end
    end

    dl:AddRect(p, imgui.ImVec2(p.x + size.x, p.y + size.y), color.temp_color, rounding, nil, 2)
    dl:AddRectFilled(imgui.ImVec2(p.x + 5 + UI_CUSTOM_TOGGLEBUTTON[name].alignment[1], p.y + 5), imgui.ImVec2(p.x + size.x - size.x / 1.5 + UI_CUSTOM_TOGGLEBUTTON[name].alignment[1], p.y + size.y - 5), color.constant_color, rounding)
end



function getClosestPlayerFromCrosshair()
	local R1, target = getCharPlayerIsTargeting(0)
	local R2, player = sampGetPlayerIdByCharHandle(target)
	if R2 then return player, target end
	local minDist = getpx()
	local closestId, closestPed = -1, -1
	for i = 0, 999 do
		local res, ped = sampGetCharHandleBySampPlayerId(i)
		if res then
			if getDistanceFromPed(ped) < maxDistAim.v then
                local xi, yi = convert3DCoordsToScreen(getCharCoordinates(ped))
                local dist = math.sqrt( (xi - xc) ^ 2 + (yi - yc) ^ 2 )
                if dist < minDist then
                    minDist = dist
                    closestId, closestPed = i, ped
                end
			end
		end
	end
	return closestId, closestPed
end

function getDistanceFromPed(ped)
	local ax, ay, az = getCharCoordinates(1)
	local bx, by, bz = getCharCoordinates(ped)
	return math.sqrt( (ax - bx) ^ 2 + (ay - by) ^ 2 + (az - bz) ^ 2 )
end

function canPedBeShot(ped)
	local ax, ay, az = convertScreenCoordsToWorld3D(xc, yc, 0)
	local bx, by, bz = getCharCoordinates(ped)
	return not select(1, processLineOfSight(ax, ay, az, bx, by, bz + 0.7, true, checkVehicle.v, false, true, false, true, false, false))
end

function getcond(ped)
	if checkBuild.v then return true
	else return canPedBeShot(ped) end
end
-- BY IvAn Code


function sampev.onServerMessage(color, text)
	if dancer.v and text:find("«акончилось врем¤, тренировка завершена.") then
		sampAddChatMessage("text findet", -1)
		dancer.v = true
	end
	if text:find("Rakuzan") then
		return false
	end
	if text:find('Депозит в банке:') then
		sampSendChat('/jmeat')
	end
	if tpholodilnik.v and text:find("для сохранения!") then
		setCharCoordinates(PLAYER_PED, 1412.248046875, 1348.8830566406, 10.975312232971)
		setGameKeyState(21, 255)
		setGameKeyState(21, 0)
		--setCharCoordinates(PLAYER_PED, 1406.4703369141, 1351.0064697266, 10.975312232971)
		obratno = true
	end
	lua_thread.create(function()
		while true do wait(0)
			if obratno and tpholodilnik.v and tpobratno.v then
				wait(1000)
				setCharCoordinates(PLAYER_PED, 1406.953125, 1351.2314453125, 10.975312232971)
				obratno = false
			end
		end
	end)
	if ntpo and text:find("взяли чистую") then
		--setCharCoordinates(PLAYER_PED, 1397.7794189453, 1358.2172851563, 10.93906211853)
		tpodejda = false
		asdfga = false
	end
	if naebal then
		local sync = samp_create_sync_data("player")
		sync.position = {1397.7794189453, 1358.2172851563, 10.93906211853}
		setCharCoordinates(PLAYER_PED, 1397.7794189453, 1358.2172851563, 10.93906211853)
		sync.send()
		altsync()
		naebal = false
	end-- BY IvAn Code
	if sbivmyso.v and text:find("мусор, ") or text:find("положили кусок ") or text:find('кусок') then
		sbivaka = true
		lua_thread.create(function()
			while true do wait(0)
				if sbivaka then
					wait(1)
					clearCharTasks(PLAYER_PED)
					sbivaka = false
				end
			end
		end)
	end
	if text:find("успешно положил") then 
		return false
	end
	if text:find("Добро пожаловать на Arizona Role Play!") then
		sampAddChatMessage('{4FFF38}Хуйня какае-то, наверно блять {FF00FF}стиллер{4FFF38} или  {FF00FF}лоадер ', -1)
	end
end

function rainbow(speed, alpha, offset) -- by rraggerr
    local clock = os.clock() + offset
    local r = math.floor(math.sin(clock * speed) * 127 + 128)
    local g = math.floor(math.sin(clock * speed + 2) * 127 + 128)
    local b = math.floor(math.sin(clock * speed + 4) * 127 + 128)
    return r,g,b,alpha
end

function rainbow_line(distance, size) -- by Fomikus
    local op = imgui.GetCursorPos()
    local p = imgui.GetCursorScreenPos()
    for i = 0, distance do
    r, g, b, a = rainbow(1, 255, i / -50)
    imgui.GetWindowDrawList():AddRectFilled(imgui.ImVec2(p.x + i, p.y), imgui.ImVec2(p.x + i + 1, p.y + size), join_argb(a, r, g, b))
    end
    imgui.SetCursorPos(imgui.ImVec2(op.x, op.y + size + imgui.GetStyle().ItemSpacing.y))
end

function static_rainbow_line(distance, size) -- by Fomikus
    local op = imgui.GetCursorPos()
    local p = imgui.GetCursorScreenPos()
    for i = 0, distance do
    r, g, b, a = rainbow_v2(1, 255, i / -50)
    imgui.GetWindowDrawList():AddRectFilled(imgui.ImVec2(p.x + i, p.y), imgui.ImVec2(p.x + i + 1, p.y + size), join_argb(a, r, g, b))
    end
    imgui.SetCursorPos(imgui.ImVec2(op.x, op.y + size + imgui.GetStyle().ItemSpacing.y))
end

function rainbow_v2(speed, alpha, offset) -- by rraggerr
    local r = math.floor(math.sin(offset * speed) * 127 + 128)
    local g = math.floor(math.sin(offset * speed + 2) * 127 + 128)
    local b = math.floor(math.sin(offset * speed + 4) * 127 + 128)
    return r,g,b,alpha
end

function sampev.onSetRaceCheckpoint(type, position, nextPosition, size)
	if asdfga then
		if type == 1 then
			naebal = true
		end
	end
end

function imgui.Link(link, text)
    text = text or link
    local tSize = imgui.CalcTextSize(text)
    local p = imgui.GetCursorScreenPos()
    local DL = imgui.GetWindowDrawList()
    local col = { 0xFFFF7700, 0xFFFF9900 }
    if imgui.InvisibleButton("##" .. link, tSize) then os.execute("explorer " .. link) end
    local color = imgui.IsItemHovered() and col[1] or col[2]
    DL:AddText(p, color, text)
    DL:AddLine(imgui.ImVec2(p.x, p.y + tSize.y), imgui.ImVec2(p.x + tSize.x, p.y + tSize.y), color)
end


function isKeyCheckAvailable()
	if not isSampLoaded() then
		return true
	end-- BY IvAn Code
	if not isSampfuncsLoaded() then
		return not sampIsChatInputActive() and not sampIsDialogActive()
	end
	return not sampIsChatInputActive() and not sampIsDialogActive() and not isSampfuncsConsoleActive()
end

 function runToPoint(tox, toy)
    local x, y, z = getCharCoordinates(PLAYER_PED)
    local angle = getHeadingFromVector2d(tox - x, toy - y)
    local xAngle = math.random(-50, -50)/100
    setCameraPositionUnfixed(xAngle, math.rad(angle - 90))
    stopRun = false
    while botstatus.v and getDistanceBetweenCoords2d(x, y, tox, toy) > 0.8 do
        setGameKeyState(1, -255)
        setGameKeyState(16, 1)
        wait(1)
        x, y, z = getCharCoordinates(PLAYER_PED)
        angle = getHeadingFromVector2d(tox - x, toy - y)
        setCameraPositionUnfixed(xAngle, math.rad(angle - 90))
        if stopRun then
            stopRun = false
            break
        end
    end
end

function rt(tox, toy)
    local x, y, z = getCharCoordinates(PLAYER_PED)
    local angle = getHeadingFromVector2d(tox - x, toy - y)
    local xAngle = math.random(-50, -50)/100
    setCameraPositionUnfixed(xAngle, math.rad(angle - 90))
    stopRun = false
    while botstatus.v and getDistanceBetweenCoords2d(x, y, tox, toy) > 0.8 do
        setGameKeyState(1, -255)
        setGameKeyState(16, 1)
        wait(1)
        x, y, z = getCharCoordinates(PLAYER_PED)
        angle = getHeadingFromVector2d(tox - x, toy - y)
        setCameraPositionUnfixed(xAngle, math.rad(angle - 90))
        if stopRun then
            stopRun = false
            break
        end
    end
end

function runPoint(tox, toy)
    local x, y, z = getCharCoordinates(PLAYER_PED)
    local angle = getHeadingFromVector2d(tox - x, toy - y)
    local xAngle = math.random(-50, -50)/100
    setCameraPositionUnfixed(xAngle, math.rad(angle - 90))
    stopRun = false
    while botstatusTSR.v and getDistanceBetweenCoords2d(x, y, tox, toy) > 0.8 do
        setGameKeyState(1, -255)
        setGameKeyState(16, 1)
        wait(1)
        x, y, z = getCharCoordinates(PLAYER_PED)
        angle = getHeadingFromVector2d(tox - x, toy - y)
        setCameraPositionUnfixed(xAngle, math.rad(angle - 90))
        if stopRun then
            stopRun = false
            break
        end
    end
end

function imgui.TextQuestion(text)
    imgui.TextDisabled('(?)')
    if imgui.IsItemHovered() then
        imgui.BeginTooltip()
        imgui.PushTextWrapPos(450)
        imgui.TextUnformatted(text)
        imgui.PopTextWrapPos()
        imgui.EndTooltip()-- BY IvAn Code
    end
end

function ClearChat()
    memory.fill(sampGetChatInfoPtr() + 306, 0x0, 25200)
    memory.write(sampGetChatInfoPtr() + 306, 25562, 4, 0x0)
    memory.write(sampGetChatInfoPtr() + 0x63DA, 1, 1)
end

function getSelectedText()
    local input = sampGetChatInputText()
    local ptr = sampGetInputInfoPtr()
    local chat = getStructElement(ptr, 0x8, 4)
    local pos1 = readMemory(chat + 0x11E, 4, false)
    local pos2 = readMemory(chat + 0x119, 4, false)
    local count = pos2 - pos1
    return string.sub(input, count < 0 and pos2 + 1 or pos1 + 1, count < 0 and pos2 - count or pos2)
end

function sampev.onSendPlayerSync(data)
	if enabled then 
        data.moveSpeed.x = math.sin(-math.rad(getCharHeading(PLAYER_PED))) * 0.4
        data.moveSpeed.y = math.cos(-math.rad(getCharHeading(PLAYER_PED))) * 0.4
	end
	if enabledd then 
        data.moveSpeed.x = math.sin(-math.rad(getCharHeading(PLAYER_PED))) * 0.4
        data.moveSpeed.y = math.cos(-math.rad(getCharHeading(PLAYER_PED))) * 0.4
	end
	if bots.v then
        local px, py, pz = getCharCoordinates(1)
		local resc, veh = sampGetCarHandleBySampVehicleId(getClosestCarId())
		if resc then
			lua_thread.create(function()
				while true do wait(0)
					if bots.v then
						if carcheck.v then
							local _, veh = sampGetCarHandleBySampVehicleId(getClosestCarId())
							if veh == -1 then return end
							local x, y, z = getCarCoordinates(veh)
							DrawCube(x, y, z+1.612412)
							if pokazz.v then
								local _, veh = sampGetCarHandleBySampVehicleId(getClosestCarId())
								local xx, yy, zz = getCarCoordinates(veh)
								local x = xx + invx.v
								local y = yy + invy.v
								local z = zz + invz.v
								local distan = getDistanceBetweenCoords3d(x,y,z,xx,yy,zz)
								DrawCube(x, y, z+1.5)
							end	
						end
					end
				end
			end)-- BY IvAn Code
			local _, veh = sampGetCarHandleBySampVehicleId(getClosestCarId())
			local res, idcar = sampGetVehicleIdByCarHandle(veh)
				if res then
					data.specialAction = 3
					data.surfingVehicleId = idcar
					data.surfingOffsets = {invx.v, invy.v, invz.v}
					data.health = math.random(1, 100)
					data.animationId = 1018
					data.animationFlags = 12211
					data.moveSpeed = {0.3, 0.3, -0.1}
					data.position = {px, py, pz}
				end
			else 
			sampAddChatMessage("Машин нет, инвиз выключен. Включи его повторно", -1)
			--bots.v = false
		end
    end
	lua_thread.create(function()
		while true do wait(0)
		local px, py, pz = getCharCoordinates(1)
			if asdzxc.v then
				local _, handle = sampGetCharHandleBySampPlayerId(playeridd.v)
				if handle == -1 then
					sampAddChatMessage('не найден', -1)
				else
					local xzc, yzc, zzc = getCharCoordinates(handle)
					if asdzxc.v and getDistanceBetweenCoords3d(xzc, yzc, zzc, px, py, pz) < 25 then
						local qwe = getCharHeading(PLAYER_PED)
						data.moveSpeed.x = math.sin(-math.rad(qwe)) * 0.001
						data.moveSpeed.y = math.cos(-math.rad(qwe)) * 0.001
							if _ then
								math.randomseed(os.time())
								
								local x, y, z = getCharCoordinates(handle)
								local angle = getCharHeading(handle)
								local bx = x - math.sin(-math.rad(angle)) / 6
								local by = y - math.cos(-math.rad(angle)) / 6
								local botAngle = getHeadingFromVector2d(x - bx, y - by)
								local x, y, bz = getCharCoordinates(handle)
									
								setCharHeading(PLAYER_PED, angle+rtot)
								setCharCoordinates(PLAYER_PED, bx, by, bz+1.4)
								if pissat.v then
									sampSetSpecialAction(68)
								else
									sampSetSpecialAction(0)
								end
								if spinner.v then
									rtot = rtot + (speedspiner.v / 4)
									if rtot > 360 then
										rtot = 0
									end
								end
							else
								sampAddChatMessage("игрок не найден, я наверно выключюсь!", -1)
								asdzxc.v = false
								sampSetSpecialAction(0)
							end
					else
						sampAddChatMessage("Игрок находтся далеко", -1)
						asdzxc.v = false
					end
				end
			end
		end
	end)
	if rvankaonfoot.v then
		if playeridd.v ~= -1 then
			if count >= 4 then
				data.moveSpeed.x = 0-- BY IvAn Code
				data.moveSpeed.y = 0
				data.moveSpeed.z = 0
				count = 0
				return true
			end
			local _, char = sampGetCharHandleBySampPlayerId(playeridd.v)
			if _ then
				local x, y, z = getCharCoordinates(char)
				local xx, yy, zz = getCharCoordinates(1)
				local h = getHeadingFromVector2d(x - xx, y - yy)
				local _, plid = sampGetPlayerIdByCharHandle(char)
				local nick = sampGetPlayerNickname(plid)
				setCharHeading(1, h)
				data.moveSpeed.x = 0
				data.moveSpeed.y = 2.8
				data.moveSpeed.z = up and 0.7 or -0.6
				data.position = {x, y - 3, z}
				data.surfingVehicleId = 0
				data.surfingOffsets = {0, 0, 0}
				setCharCoordinates(1, x, y - 3, z - 1)
				
				printStringNow('~r~Pizdim:~w~ '..nick.. '~r~ ID [~w~'..plid..'~r~]', 50)
				up = not up
				setGameKeyState(1, 255)
				setGameKeyState(1, 1)
				count = count + 1
				-- BY IvAn Code
			else
				id = -1
			end
		end
	end
end

function imgui.AnimProgressBar(label,int,duration,size)
local function bringFloatTo(from, to, start_time, duration)
    local timer = os.clock() - start_time
    if timer >= 0.00 and timer <= duration then; local count = timer / (duration / 100); return from + (count * (to - from) / 100),timer,false
    end; return (timer > duration) and to or from,timer,true
end
    if int > 100 then imgui.TextColored(imgui.ImVec4(1,0,0,0.7),'error func imgui.AnimProgressBar(*),int > 100') return end
    if IMGUI_ANIM_PROGRESS_BAR == nil then IMGUI_ANIM_PROGRESS_BAR = {} end
    if IMGUI_ANIM_PROGRESS_BAR ~= nil and IMGUI_ANIM_PROGRESS_BAR[label] == nil then
        IMGUI_ANIM_PROGRESS_BAR[label] = {int = (int or 0),clock = 0}
    end
    local mf = math.floor
    local p = IMGUI_ANIM_PROGRESS_BAR[label];
    if (p['int']) ~= (int) then
        if p.clock == 0 then; p.clock = os.clock(); end
        local d = {bringFloatTo(p.int,int,p.clock,(duration or 2.25))}
        if d[1] > int  then
            if ((d[1])-0.01) < (int) then; p.clock = 0; p.int = mf(d[1]-0.01); end
        elseif d[1] < int then
            if ((d[1])+0.01) > (int) then; p.clock = 0; p.int = mf(d[1]+0.01); end
        end
        p.int = d[1];
    end
    imgui.PushStyleVar(6,15)
    imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(0,0,0,0))-- BY IvAn Code
    imgui.PushStyleColor(imgui.Col.FrameBg, imgui.ImVec4(1, 1, 1, 0.20)) -- background color progress bar
    imgui.PushStyleColor(imgui.Col.PlotHistogram, imgui.ImVec4(1, 1, 1, 0.30)) -- fill color progress bar
    imgui.ProgressBar(p.int / 100,size or imgui.ImVec2(-1,15))
    imgui.PopStyleColor(3)
    imgui.PopStyleVar()
end

function removePlayer(id)
    local bs = raknetNewBitStream()
    raknetBitStreamWriteInt16(bs, id)
    raknetEmulRpcReceiveBitStream(163, bs)
    raknetDeleteBitStream(bs)
end

function removeVehicle(id)
    local bs = raknetNewBitStream()
    raknetBitStreamWriteInt16(bs, id)
    raknetEmulRpcReceiveBitStream(165, bs)
    raknetDeleteBitStream(bs)
end

function sampev.onPlayerStreamIn()
	if clearchars.v then
		return false
	end
end-- BY IvAn Code

function sampev.onPlayerStreamOut()
	if clearchars.v then
		return false
	end
end


function sampev.onCreateObject(objectId, data)
	if rklad.v then
		if data.modelId == 2680 then
			local x, y, z = getCharCoordinates(1)
			local tag = '[{4C75A3}Fomikus{ffb700}Answer{FFFFFF}] '
			if getDistanceBetweenCoords3d(x,y,z , data.position.x, data.position.y, data.position.z) < 30 then
				sampAddChatMessage(tag..'Появился клад: '..data.position.x..' '..data.position.y..' '..data.position.z, -1)
				placeWaypoint(data.position.x, data.position.y, data.position.z)
			end
		end
	end-- BY IvAn Code
end


-- BY IvAn Code


function SmoothAimBot()
    if nubaim.v and isKeyDown(key.VK_RBUTTON) then
        local handle = GetNearestPed(aimfovik.v)
        if handle ~= -1 then
            local myPos = {getActiveCameraCoordinates()}
            local enPos = {GetBodyPartCoordinates(aiming, handle)} -- 8 голова, 3 туловище, 42 нога, 54 ступня
            local vector = {myPos[1] - enPos[1], myPos[2] - enPos[2], myPos[3] - enPos[3]}
            if isWidescreenOnInOptions() then coefficentZ = 0.0778 else coefficentZ = 0.103 end
            local angle = {(math.atan2(vector[2], vector[1]) + 0.04253), (math.atan2((math.sqrt((math.pow(vector[1], 2) + math.pow(vector[2], 2)))), vector[3]) - math.pi / 2 - coefficentZ)}
            local view = {fix(representIntAsFloat(readMemory(0xB6F258, 4, false))), fix(representIntAsFloat(readMemory(0xB6F248, 4, false)))}
            local difference = {angle[1] - view[1], angle[2] - view[2]}
            local smooth = {difference[1] / AimSmooth.v, difference[2] / AimSmooth.v}
            setCameraPositionUnfixed((view[2] + smooth[2] ), (view[1] + smooth[1]))
        end
    end
    return false
end

function sampev.onApplyPlayerAnimation(id, q,name)
	if anims.v then
		sampAddChatMessage(name, -1)
		return false
	end
	lua_thread.create(function()
	while true do wait(0)
			if name == "CRRY_PRTIAL" and botbox then
				CoordMaster(239.32678222656, 2026.6452636719, 16.687019348145, 3, 100)
			end
			if name == "PUTDWN" and botbox then
				CoordMaster(257.7116394043, 2013.0008544922, 16.667016983032, 3, 100)
			end
		end
	end)
end

function CoordMaster(px, py, pz, step, time)-- BY IvAn Code
  local x, y, z = getCharCoordinates(PLAYER_PED)
  local d = getDistanceBetweenCoords3d(px, py, pz, x, y, z)
  if d <= step then
   printStringNow('~r~you ~r~~h~~h~~h~ t~r~e~y~l~g~e~w~~b~p~b~o~p~r~p~~h~t ~w~gandon ~y~XDD', 10000)
   
    setCharCoordinates(PLAYER_PED, px, py, pz)
else
    local dx, dy, dz = px - x, py - y, pz - z
    x = x + step / d * dx
    y = y + step / d * dy
    z = z + step / d * dz
    setCharCoordinates(PLAYER_PED, x, y, z-1)
    wait(time)
    CoordMaster(px, py, pz, step, time)
    end
end

function sampev.onSetPlayerPos(pos)
	if bots.v then
		return false
	end
	if asdzxc.v then
		return false
	end-- BY IvAn Code
end

function imgui.CircleButton(text, bool, number)
    if bool.v == number then
        imgui.PushStyleVar(imgui.StyleVar.FrameRounding, 15)
        imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(1.00, 0.16, 0.16, 1.00))
        imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(1.00, 0.16, 0.16, 1.00))
        imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(1.00, 0.16, 0.16, 1.00))
        local button = imgui.Button(text, imgui.ImVec2(10, 10))
        imgui.PopStyleColor(3)
        imgui.PopStyleVar(1)
        return button
    else
        if imgui.Button(text, imgui.ImVec2(10, 10)) then
            bool.v = number
            return true
        end
    end
end

function samp_create_sync_data(sync_type, copy_from_player)
    local ffi = require 'ffi'-- BY IvAn Code
    local sampfuncs = require 'sampfuncs'
    local raknet = require 'samp.raknet'
  
    copy_from_player = copy_from_player or true
    local sync_traits = {
        player = {'PlayerSyncData', raknet.PACKET.PLAYER_SYNC, sampStorePlayerOnfootData},
        vehicle = {'VehicleSyncData', raknet.PACKET.VEHICLE_SYNC, sampStorePlayerIncarData},
    }
    local sync_info = sync_traits[sync_type]
    local data_type = 'struct ' .. sync_info[1]
    local data = ffi.new(data_type, {})
    local raw_data_ptr = tonumber(ffi.cast('uintptr_t', ffi.new(data_type .. '*', data)))
    if copy_from_player then
        local copy_func = sync_info[3]
        if copy_func then
            local _, player_id
            if copy_from_player == true then
                _, player_id = sampGetPlayerIdByCharHandle(PLAYER_PED)
            else
                player_id = tonumber(copy_from_player)
            end-- BY IvAn Code
            copy_func(player_id, raw_data_ptr)
        end
    end
    local func_send = function()
        local bs = raknetNewBitStream()
        raknetBitStreamWriteInt8(bs, sync_info[2])
        raknetBitStreamWriteBuffer(bs, raw_data_ptr, ffi.sizeof(data))
        raknetSendBitStreamEx(bs, sampfuncs.HIGH_PRIORITY, sampfuncs.UNRELIABLE_SEQUENCED, 1)
        raknetDeleteBitStream(bs)
    end
    local mt = {
        __index = function(t, index)
            return data[index]
        end,
        __newindex = function(t, index, value)
            data[index] = value
        end
    }
    return setmetatable({send = func_send}, mt)
end

function sampev.onGangZoneDestroy(zoneId1)
	if treasurezone.v then
		if zoneId1 == kladZone then -- BY IvAn Code-- BY IvAn Code
			removeGangZone(610)
			addGangZone(610, left, up, right, down, -2130706433)
			zoneActive = true
			sampAddChatMessage(sName .. 'Территория возвращена! ', -1)
		end
	end
end

function addGangZone(id, left, up, right, down, color)
	if treasurezone.v then	
		local bs = raknetNewBitStream()
		raknetBitStreamWriteInt16(bs, id)
		raknetBitStreamWriteFloat(bs, left)
		raknetBitStreamWriteFloat(bs, up)
		raknetBitStreamWriteFloat(bs, right)
		raknetBitStreamWriteFloat(bs, down)
		raknetBitStreamWriteInt32(bs, color)
		raknetEmulRpcReceiveBitStream(108, bs)
		raknetDeleteBitStream(bs)
	end
end-- BY IvAn Code-- BY IvAn Code

function removeGangZone(id)
    local bs = raknetNewBitStream()
    raknetBitStreamWriteInt16(bs, id)
    raknetEmulRpcReceiveBitStream(120, bs)
    raknetDeleteBitStream(bs)
end

function sampev.onCreateGangZone(zoneId, squareStart, squareEnd, color)
	if treasurezone.v then	
		if color == -16776961 then
			mapUsed = true
			kladZone = zoneId
			left = squareEnd.x
			up = squareEnd.y
			right = squareStart.x
			down = squareStart.y
		
			sampAddChatMessage(sName .. 'Территория найдена! После ее исчезновения она будет автоматически восстановлена.', -1)
		end
	end
end

function sampev.onDestroyObject(id)-- BY IvAn Code
    for k = 1, #lavki do
        local ob = sampGetObjectHandleBySampId(id)
        if ob == lavki[k] then
            table.remove(lavki, k)
        end
    end
end

function sampev.onSetObjectMaterialText(id, data)
    if data.text:find('Номер %d+%. {......}Свободная!') then
        local object = sampGetObjectHandleBySampId(id) 
        table.insert(lavki, object)
    else
        local ob = sampGetObjectHandleBySampId(id)
        for i = 1, #lavki do
            if ob == lavki[i] then
                table.remove(lavki, i)
            end
        end
    end
end

function DrawCube(x,y,z)
	if isPointOnScreen(x,y,z) then-- BY IvAn Code
		x = x-1
		y = y-1
		local xx,yy = convert3DCoordsToScreen(x,y,z)
		local xxx,yyy = convert3DCoordsToScreen(x+2,y,z)
		renderDrawLine(xx,yy,xxx,yyy,3,-1)
		local xx,yy = convert3DCoordsToScreen(x+2,y,z)
		local xxx,yyy = convert3DCoordsToScreen(x+2,y,z-2)
		renderDrawLine(xx,yy,xxx,yyy,3,-1)
		local xx,yy = convert3DCoordsToScreen(x,y,z)
		local xxx,yyy = convert3DCoordsToScreen(x,y,z-2)
		renderDrawLine(xx,yy,xxx,yyy,3,-1)
		local xx,yy = convert3DCoordsToScreen(x,y,z-2)
		local xxx,yyy = convert3DCoordsToScreen(x+2,y,z-2)
		renderDrawLine(xx,yy,xxx,yyy,3,-1)
		local xx,yy = convert3DCoordsToScreen(x,y,z)
		local xxx,yyy = convert3DCoordsToScreen(x,y+2,z)
		renderDrawLine(xx,yy,xxx,yyy,3,-1)
		local xx,yy = convert3DCoordsToScreen(x,y+2,z)-- BY IvAn Code-- BY IvAn Code
		local xxx,yyy = convert3DCoordsToScreen(x,y+2,z-2)
		renderDrawLine(xx,yy,xxx,yyy,3,-1)
		local xx,yy = convert3DCoordsToScreen(x,y+2,z-2)
		local xxx,yyy = convert3DCoordsToScreen(x,y,z-2)
		renderDrawLine(xx,yy,xxx,yyy,3,-1)
		local xx,yy = convert3DCoordsToScreen(x+2,y+2,z)
		local xxx,yyy = convert3DCoordsToScreen(x+2,y+2,z-2)
		renderDrawLine(xx,yy,xxx,yyy,3,-1)
		local xx,yy = convert3DCoordsToScreen(x+2,y,z)
		local xxx,yyy = convert3DCoordsToScreen(x+2,y+2,z)
		renderDrawLine(xx,yy,xxx,yyy,3,-1)
		local xx,yy = convert3DCoordsToScreen(x+2,y+2,z-2)
		local xxx,yyy = convert3DCoordsToScreen(x,y+2,z-2)
		renderDrawLine(xx,yy,xxx,yyy,3,-1)
		local xx,yy = convert3DCoordsToScreen(x+2,y+2,z-2)
		local xxx,yyy = convert3DCoordsToScreen(x+2,y,z-2)
		renderDrawLine(xx,yy,xxx,yyy,3,-1)
		local xx,yy = convert3DCoordsToScreen(x+2,y+2,z)
		local xxx,yyy = convert3DCoordsToScreen(x,y+2,z)
		renderDrawLine(xx,yy,xxx,yyy,3,-1)
	end
end

-- BY IvAn Code-- BY IvAn Code
function runto(tox, toy)
    local x, y, z = getCharCoordinates(PLAYER_PED)
    local angle = getHeadingFromVector2d(tox - x, toy - y)
    local xAngle = math.random(-50, -50)/100
    setCameraPositionUnfixed(xAngle, math.rad(angle - 90))
    stopRun = false
    while botcoordrodina.v and getDistanceBetweenCoords2d(x, y, tox, toy) > 0.8 do
        setGameKeyState(1, -255)
        setGameKeyState(16, 1)
        wait(1)
        x, y, z = getCharCoordinates(PLAYER_PED)
        angle = getHeadingFromVector2d(tox - x, toy - y)
        setCameraPositionUnfixed(xAngle, math.rad(angle - 90))
        if stopRun then
            stopRun = false
            break
        end
    end
end


function apply_custom_style()
	   imgui.SwitchContext()
	   local style = imgui.GetStyle()-- BY IvAn Code-- BY IvAn Code
	   local colors = style.Colors
	   local clr = imgui.Col
	   local ImVec4 = imgui.ImVec4
	   local ImVec2 = imgui.ImVec2

		style.WindowPadding = ImVec2(15, 15)
		style.WindowRounding = 15.0
		style.FramePadding = ImVec2(5, 5)
		style.ItemSpacing = ImVec2(12, 8)
		style.ItemInnerSpacing = ImVec2(8, 6)
		style.IndentSpacing = 25.0
		style.ScrollbarSize = 15.0
		style.ScrollbarRounding = 15.0
		style.GrabMinSize = 15.0
		style.GrabRounding = 7.0
		style.ChildWindowRounding = 8.0
		style.FrameRounding = 6.0
	  -- BY IvAn Code

      colors[clr.Text] = ImVec4(0.95, 0.96, 0.98, 1.00)
      colors[clr.TextDisabled] = ImVec4(0.36, 0.42, 0.47, 1.00)
      colors[clr.WindowBg] = ImVec4(0.11, 0.15, 0.17, 1.00)
      colors[clr.ChildWindowBg] = ImVec4(0.15, 0.18, 0.22, 1.00)
      colors[clr.PopupBg] = ImVec4(0.08, 0.08, 0.08, 0.94)
      colors[clr.Border] = ImVec4(0.43, 0.43, 0.50, 0.50)
      colors[clr.BorderShadow] = ImVec4(0.00, 0.00, 0.00, 0.00)
      colors[clr.FrameBg] = ImVec4(0.20, 0.25, 0.29, 1.00)
      colors[clr.FrameBgHovered] = ImVec4(0.12, 0.20, 0.28, 1.00)
      colors[clr.FrameBgActive] = ImVec4(0.09, 0.12, 0.14, 1.00)
      colors[clr.TitleBg] = ImVec4(0.09, 0.12, 0.14, 0.65)
      colors[clr.TitleBgCollapsed] = ImVec4(0.00, 0.00, 0.00, 0.51)
      colors[clr.TitleBgActive] = ImVec4(0.08, 0.10, 0.12, 1.00)
      colors[clr.MenuBarBg] = ImVec4(0.15, 0.18, 0.22, 1.00)
      colors[clr.ScrollbarBg] = ImVec4(0.02, 0.02, 0.02, 0.39)
      colors[clr.ScrollbarGrab] = ImVec4(0.20, 0.25, 0.29, 1.00)
      colors[clr.ScrollbarGrabHovered] = ImVec4(0.18, 0.22, 0.25, 1.00)
      colors[clr.ScrollbarGrabActive] = ImVec4(0.09, 0.21, 0.31, 1.00)
      colors[clr.ComboBg] = ImVec4(0.20, 0.25, 0.29, 1.00)
      colors[clr.CheckMark] = ImVec4(0.28, 0.56, 1.00, 1.00)-- BY IvAn Code
      colors[clr.SliderGrab] = ImVec4(0.28, 0.56, 1.00, 1.00)
      colors[clr.SliderGrabActive] = ImVec4(0.37, 0.61, 1.00, 1.00)
      colors[clr.Button] = ImVec4(0.20, 0.25, 0.29, 1.00)
      colors[clr.ButtonHovered] = ImVec4(0.28, 0.56, 1.00, 1.00)
      colors[clr.ButtonActive] = ImVec4(0.06, 0.53, 0.98, 1.00)
      colors[clr.Header] = ImVec4(0.20, 0.25, 0.29, 0.55)
      colors[clr.HeaderHovered] = ImVec4(0.26, 0.59, 0.98, 0.80)
      colors[clr.HeaderActive] = ImVec4(0.26, 0.59, 0.98, 1.00)
      colors[clr.ResizeGrip] = ImVec4(0.26, 0.59, 0.98, 0.25)
      colors[clr.ResizeGripHovered] = ImVec4(0.26, 0.59, 0.98, 0.67)
      colors[clr.ResizeGripActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
      colors[clr.CloseButton] = ImVec4(0.40, 0.39, 0.38, 0.16)
      colors[clr.CloseButtonHovered] = ImVec4(0.40, 0.39, 0.38, 0.39)
      colors[clr.CloseButtonActive] = ImVec4(0.40, 0.39, 0.38, 1.00)
      colors[clr.PlotLines] = ImVec4(0.61, 0.61, 0.61, 1.00)
      colors[clr.PlotLinesHovered] = ImVec4(1.00, 0.43, 0.35, 1.00)
      colors[clr.PlotHistogram] = ImVec4(0.90, 0.70, 0.00, 1.00)
      colors[clr.PlotHistogramHovered] = ImVec4(1.00, 0.60, 0.00, 1.00)
      colors[clr.TextSelectedBg] = ImVec4(0.25, 1.00, 0.00, 0.43)
      colors[clr.ModalWindowDarkening] = ImVec4(1.00, 0.98, 0.95, 0.73)
end
apply_custom_style()



function GetCoordinates()
    if isCharInAnyCar(playerPed) then
        local car = storeCarCharIsInNoSave(playerPed)
        return getCarCoordinates(car)
    else
        return getCharCoordinates(playerPed)
    end
end

function onScriptTerminate(script, quit)
    if script == thisScript() and marker then-- BY IvAn Code
        deleteCheckpoint(marker)
        removeBlip(checkpoint)
    end
end

function setMarker(type, x, y, z, radius, color)
    deleteCheckpoint(marker)
    removeBlip(checkpoint)
    checkpoint = addBlipForCoord(x, y, z)
    marker = createCheckpoint(type, x, y, z, 1, 1, 1, radius)
    changeBlipColour(checkpoint, color)
    lua_thread.create(function()
        while marker do
            wait(0)
            local x1, y1, z1 = getCharCoordinates(PLAYER_PED)
            if getDistanceBetweenCoords3d(x, y, z, x1, y1, z1) <= radius+4 then
                deleteCheckpoint(marker)
                removeBlip(checkpoint)
                addOneOffSound(0, 0, 0, 1149)
            end
        end-- BY IvAn Code
    end)
end

function renderFigure2D(x, y, points, radius, color)
    local step = math.pi * 2 / points
    local render_start, render_end = {}, {}
    for i = 0, math.pi * 2, step do
        render_start[1] = radius * math.cos(i) + x
        render_start[2] = radius * math.sin(i) + y
        render_end[1] = radius * math.cos(i + step) + x
        render_end[2] = radius * math.sin(i + step) + y
        renderDrawLine(render_start[1], render_start[2], render_end[1], render_end[2], 1, color)
    end
end
  
function BH_theme()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col-- BY IvAn Code
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2
 
    style.WindowPadding = ImVec2(6, 4)
    style.WindowRounding = 5.0
    style.ChildWindowRounding = 5.0
    style.FramePadding = ImVec2(5, 2)
    style.FrameRounding = 5.0
    style.ItemSpacing = ImVec2(7, 5)
    style.ItemInnerSpacing = ImVec2(1, 1)
    style.TouchExtraPadding = ImVec2(0, 0)
    style.IndentSpacing = 6.0
    style.ScrollbarSize = 12.0
    style.ScrollbarRounding = 5.0
    style.GrabMinSize = 20.0
    style.GrabRounding = 2.0
    style.WindowTitleAlign = ImVec2(0.5, 0.5)

    colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.28, 0.30, 0.35, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.16, 0.18, 0.22, 1.00)-- BY IvAn Code
    colors[clr.ChildWindowBg]          = ImVec4(0.19, 0.22, 0.26, 1)
    colors[clr.PopupBg]                = ImVec4(0.05, 0.05, 0.10, 0.90)
    colors[clr.Border]                 = ImVec4(0.19, 0.22, 0.26, 1.00)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.FrameBg]                = ImVec4(0.16, 0.18, 0.22, 1.00)
    colors[clr.FrameBgHovered]         = ImVec4(0.22, 0.25, 0.30, 1.00)
    colors[clr.FrameBgActive]          = ImVec4(0.22, 0.25, 0.29, 1.00)
    colors[clr.TitleBg]                = ImVec4(0.19, 0.22, 0.26, 1.00)
    colors[clr.TitleBgActive]          = ImVec4(0.19, 0.22, 0.26, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.19, 0.22, 0.26, 0.59)
    colors[clr.MenuBarBg]              = ImVec4(0.19, 0.22, 0.26, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.20, 0.25, 0.30, 0.60)
    colors[clr.ScrollbarGrab]          = ImVec4(0.41, 0.55, 0.78, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.49, 0.63, 0.86, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.49, 0.63, 0.86, 1.00)
    colors[clr.ComboBg]                = ImVec4(0.20, 0.20, 0.20, 0.99)
    colors[clr.CheckMark]              = ImVec4(0.90, 0.90, 0.90, 0.50)
    colors[clr.SliderGrab]             = ImVec4(1.00, 1.00, 1.00, 0.30)
    colors[clr.SliderGrabActive]       = ImVec4(0.80, 0.50, 0.50, 1.00)
    colors[clr.Button]                 = ImVec4(0.41, 0.55, 0.78, 1.00)
    colors[clr.ButtonHovered]          = ImVec4(0.49, 0.62, 0.85, 1.00)-- BY IvAn Code
    colors[clr.ButtonActive]           = ImVec4(0.49, 0.62, 0.85, 1.00)
    colors[clr.Header]                 = ImVec4(0.41, 0.55, 0.78, 1.00)
    colors[clr.HeaderHovered]          = ImVec4(0.43, 0.57, 0.80, 1.00)
    colors[clr.HeaderActive]           = ImVec4(0.43, 0.57, 0.80, 1.00)
    colors[clr.Separator]              = ImVec4(0.41, 0.55, 0.78, 1.00)
    colors[clr.SeparatorHovered]       = ImVec4(0.41, 0.55, 0.78, 1.00)
    colors[clr.SeparatorActive]        = ImVec4(0.41, 0.55, 0.78, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.41, 0.55, 0.78, 1.00)
    colors[clr.ResizeGripHovered]      = ImVec4(0.49, 0.61, 0.83, 1.00)
    colors[clr.ResizeGripActive]       = ImVec4(0.49, 0.62, 0.83, 1.00)
    colors[clr.CloseButton]            = ImVec4(0.41, 0.55, 0.78, 1.00)
    colors[clr.CloseButtonHovered]     = ImVec4(0.50, 0.63, 0.84, 1.00)
    colors[clr.CloseButtonActive]      = ImVec4(0.41, 0.55, 0.78, 1.00)
    colors[clr.PlotLines]              = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.TextSelectedBg]         = ImVec4(0.41, 0.55, 0.78, 1.00)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.16, 0.18, 0.22, 0.76)
    -- BY IvAn Code
    
end

function applyTheme()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2
 
 
    style.WindowPadding = ImVec2(6, 4)
    style.WindowRounding = 5.0
    style.FramePadding = ImVec2(5, 2)
    style.FrameRounding = 5.0
    style.ItemSpacing = ImVec2(7, 5)
    style.ItemInnerSpacing = ImVec2(1, 1)
    style.TouchExtraPadding = ImVec2(0, 0)
    style.IndentSpacing = 6.0
    style.ScrollbarSize = 12.0
    style.ScrollbarRounding = 16.0-- BY IvAn Code
    style.GrabMinSize = 20.0
    style.GrabRounding = 2.0-- BY IvAn Code
 
    style.WindowTitleAlign = ImVec2(0.5, 0.5)

    colors[clr.Border] = ImVec4(1, 0, 0.3, 1.00)
    colors[clr.WindowBg] = ImVec4(0.13, 0.14, 0.17, 1.00)
    colors[clr.FrameBg] = ImVec4(0.200, 0.220, 0.270, 0.85)
    colors[clr.TitleBg] = ImVec4(1, 0, 0.3, 1.00)
    colors[clr.TitleBgActive] = ImVec4(1, 0, 0.3, 1.00)
    colors[clr.Button] = ImVec4(1, 0, 0.3, 1.00)
    colors[clr.Separator] = ImVec4(1, 0, 0.3, 1.00)
    colors[clr.Header] = ImVec4(1, 0, 0.3, 1.00)
    colors[clr.HeaderHovered] = ImVec4(0.68, 0, 0.2, 0.86)
    colors[clr.HeaderActive] = ImVec4(1, 0.24, 0.47, 1.00)
    colors[clr.CheckMark] = ImVec4(1, 0, 0.3, 1.00)
end

function theme()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2
-- BY IvAn Code-- BY IvAn Code
    style.WindowPadding = imgui.ImVec2(8, 8)
    style.WindowRounding = 6
    style.ChildWindowRounding = 5
    style.FramePadding = imgui.ImVec2(5, 3)
    style.FrameRounding = 3.0
    style.ItemSpacing = imgui.ImVec2(5, 4)
    style.ItemInnerSpacing = imgui.ImVec2(4, 4)
    style.IndentSpacing = 21
    style.ScrollbarSize = 10.0
    style.ScrollbarRounding = 13
    style.GrabMinSize = 8
    style.GrabRounding = 1
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
    style.ButtonTextAlign = imgui.ImVec2(0.5, 0.5)

    colors[clr.Text]                   = ImVec4(0.95, 0.96, 0.98, 1.00);
    colors[clr.TextDisabled]           = ImVec4(0.29, 0.29, 0.29, 1.00);
    colors[clr.WindowBg]               = ImVec4(0.14, 0.14, 0.14, 1.00);
    colors[clr.ChildWindowBg]          = ImVec4(0.12, 0.12, 0.12, 1.00);
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94);
    colors[clr.Border]                 = ImVec4(0.14, 0.14, 0.14, 1.00);
    colors[clr.BorderShadow]           = ImVec4(1.00, 1.00, 1.00, 0.10);
    colors[clr.FrameBg]                = ImVec4(0.22, 0.22, 0.22, 1.00);
    colors[clr.FrameBgHovered]         = ImVec4(0.18, 0.18, 0.18, 1.00);-- BY IvAn Code
    colors[clr.FrameBgActive]          = ImVec4(0.09, 0.12, 0.14, 1.00);
    colors[clr.TitleBg]                = ImVec4(0.14, 0.14, 0.14, 0.81);
    colors[clr.TitleBgActive]          = ImVec4(0.14, 0.14, 0.14, 1.00);
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51);
    colors[clr.MenuBarBg]              = ImVec4(0.20, 0.20, 0.20, 1.00);
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.39);
    colors[clr.ScrollbarGrab]          = ImVec4(0.36, 0.36, 0.36, 1.00);
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.18, 0.22, 0.25, 1.00);-- BY IvAn Code
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.24, 0.24, 0.24, 1.00);
    colors[clr.ComboBg]                = ImVec4(0.24, 0.24, 0.24, 1.00);
    colors[clr.CheckMark]              = ImVec4(1.00, 0.28, 0.28, 1.00);
    colors[clr.SliderGrab]             = ImVec4(1.00, 0.28, 0.28, 1.00);
    colors[clr.SliderGrabActive]       = ImVec4(1.00, 0.28, 0.28, 1.00);
    colors[clr.Button]                 = ImVec4(1.00, 0.28, 0.28, 1.00);
    colors[clr.ButtonHovered]          = ImVec4(1.00, 0.39, 0.39, 1.00);
    colors[clr.ButtonActive]           = ImVec4(1.00, 0.21, 0.21, 1.00);
    colors[clr.Header]                 = ImVec4(1.00, 0.28, 0.28, 1.00);
    colors[clr.HeaderHovered]          = ImVec4(1.00, 0.39, 0.39, 1.00);
    colors[clr.HeaderActive]           = ImVec4(1.00, 0.21, 0.21, 1.00);
    colors[clr.ResizeGrip]             = ImVec4(1.00, 0.28, 0.28, 1.00);
    colors[clr.ResizeGripHovered]      = ImVec4(1.00, 0.39, 0.39, 1.00);
    colors[clr.ResizeGripActive]       = ImVec4(1.00, 0.19, 0.19, 1.00);
    colors[clr.CloseButton]            = ImVec4(0.40, 0.39, 0.38, 0.16);
    colors[clr.CloseButtonHovered]     = ImVec4(0.40, 0.39, 0.38, 0.39);
    colors[clr.CloseButtonActive]      = ImVec4(0.40, 0.39, 0.38, 1.00);
    colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00);
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00);
    colors[clr.PlotHistogram]          = ImVec4(1.00, 0.21, 0.21, 1.00);
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.18, 0.18, 1.00);
    colors[clr.TextSelectedBg]         = ImVec4(1.00, 0.32, 0.32, 1.00);
    colors[clr.ModalWindowDarkening]   = ImVec4(0.26, 0.26, 0.26, 0.60);
end


function ocianic()
	imgui.SwitchContext()
local style = imgui.GetStyle()
local colors = style.Colors
local clr = imgui.Col
local ImVec4 = imgui.ImVec4

style.Alpha = 1.0
style.ChildWindowRounding = 3
style.WindowRounding = 3
style.GrabRounding = 1
style.GrabMinSize = 20
style.FrameRounding = 3

colors[clr.Text] = ImVec4(0.00, 1.00, 1.00, 1.00)
colors[clr.TextDisabled] = ImVec4(0.00, 0.40, 0.41, 1.00)
colors[clr.WindowBg] = ImVec4(0.00, 0.00, 0.00, 1.00)
colors[clr.ChildWindowBg] = ImVec4(0.00, 0.00, 0.00, 0.00)
colors[clr.Border] = ImVec4(0.00, 1.00, 1.00, 0.65)
colors[clr.BorderShadow] = ImVec4(0.00, 0.00, 0.00, 0.00)
colors[clr.FrameBg] = ImVec4(0.44, 0.80, 0.80, 0.18)
colors[clr.FrameBgHovered] = ImVec4(0.44, 0.80, 0.80, 0.27)
colors[clr.FrameBgActive] = ImVec4(0.44, 0.81, 0.86, 0.66)
colors[clr.TitleBg] = ImVec4(0.14, 0.18, 0.21, 0.73)
colors[clr.TitleBgCollapsed] = ImVec4(0.00, 0.00, 0.00, 0.54)
colors[clr.TitleBgActive] = ImVec4(0.00, 1.00, 1.00, 0.27)
colors[clr.MenuBarBg] = ImVec4(0.00, 0.00, 0.00, 0.20)
colors[clr.ScrollbarBg] = ImVec4(0.22, 0.29, 0.30, 0.71)
colors[clr.ScrollbarGrab] = ImVec4(0.00, 1.00, 1.00, 0.44)
colors[clr.ScrollbarGrabHovered] = ImVec4(0.00, 1.00, 1.00, 0.74)
colors[clr.ScrollbarGrabActive] = ImVec4(0.00, 1.00, 1.00, 1.00)
colors[clr.ComboBg] = ImVec4(0.16, 0.24, 0.22, 0.60)
colors[clr.CheckMark] = ImVec4(0.00, 1.00, 1.00, 0.68)
colors[clr.SliderGrab] = ImVec4(0.00, 1.00, 1.00, 0.36)
colors[clr.SliderGrabActive] = ImVec4(0.00, 1.00, 1.00, 0.76)
colors[clr.Button] = ImVec4(0.00, 0.65, 0.65, 0.46)
colors[clr.ButtonHovered] = ImVec4(0.01, 1.00, 1.00, 0.43)
colors[clr.ButtonActive] = ImVec4(0.00, 1.00, 1.00, 0.62)
colors[clr.Header] = ImVec4(0.00, 1.00, 1.00, 0.33)
colors[clr.HeaderHovered] = ImVec4(0.00, 1.00, 1.00, 0.42)
colors[clr.HeaderActive] = ImVec4(0.00, 1.00, 1.00, 0.54)
colors[clr.ResizeGrip] = ImVec4(0.00, 1.00, 1.00, 0.54)
colors[clr.ResizeGripHovered] = ImVec4(0.00, 1.00, 1.00, 0.74)
colors[clr.ResizeGripActive] = ImVec4(0.00, 1.00, 1.00, 1.00)
colors[clr.CloseButton] = ImVec4(0.00, 0.78, 0.78, 0.35)
colors[clr.CloseButtonHovered] = ImVec4(0.00, 0.78, 0.78, 0.47)
colors[clr.CloseButtonActive] = ImVec4(0.00, 0.78, 0.78, 1.00)
colors[clr.PlotLines] = ImVec4(0.00, 1.00, 1.00, 1.00)
colors[clr.PlotLinesHovered] = ImVec4(0.00, 1.00, 1.00, 1.00)
colors[clr.PlotHistogram] = ImVec4(0.00, 1.00, 1.00, 1.00)
colors[clr.PlotHistogramHovered] = ImVec4(0.00, 1.00, 1.00, 1.00)
colors[clr.TextSelectedBg] = ImVec4(0.00, 1.00, 1.00, 0.22)
colors[clr.ModalWindowDarkening] = ImVec4(0.04, 0.10, 0.09, 0.51)
end

function apply_custom_style2()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4

    style.WindowRounding = 2.0
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
    style.ChildWindowRounding = 2.0
    style.FrameRounding = 2.0
    style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
    style.ScrollbarSize = 13.0
    style.ScrollbarRounding = 0
    style.GrabMinSize = 8.0
    style.GrabRounding = 1.0

    colors[clr.FrameBg]                = ImVec4(0.48, 0.16, 0.16, 0.54)
    colors[clr.FrameBgHovered]         = ImVec4(0.98, 0.26, 0.26, 0.40)
    colors[clr.FrameBgActive]          = ImVec4(0.98, 0.26, 0.26, 0.67)
    colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
    colors[clr.TitleBgActive]          = ImVec4(0.48, 0.16, 0.16, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
    colors[clr.CheckMark]              = ImVec4(0.98, 0.26, 0.26, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.88, 0.26, 0.24, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.98, 0.26, 0.26, 1.00)
    colors[clr.Button]                 = ImVec4(0.98, 0.26, 0.26, 0.40)
    colors[clr.ButtonHovered]          = ImVec4(0.98, 0.26, 0.26, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.98, 0.06, 0.06, 1.00)
    colors[clr.Header]                 = ImVec4(0.98, 0.26, 0.26, 0.31)
    colors[clr.HeaderHovered]          = ImVec4(0.98, 0.26, 0.26, 0.80)
    colors[clr.HeaderActive]           = ImVec4(0.98, 0.26, 0.26, 1.00)
    colors[clr.Separator]              = colors[clr.Border]
    colors[clr.SeparatorHovered]       = ImVec4(0.75, 0.10, 0.10, 0.78)
    colors[clr.SeparatorActive]        = ImVec4(0.75, 0.10, 0.10, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.98, 0.26, 0.26, 0.25)
    colors[clr.ResizeGripHovered]      = ImVec4(0.98, 0.26, 0.26, 0.67)
    colors[clr.ResizeGripActive]       = ImVec4(0.98, 0.26, 0.26, 0.95)
    colors[clr.TextSelectedBg]         = ImVec4(0.98, 0.26, 0.26, 0.35)
    colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
    colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.ComboBg]                = colors[clr.PopupBg]
    colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
    colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
    colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end

function save1()
	mainIni.config.trans      =  trans.v 
	mainIni.config.arenda     =  skiparenda.v
	
	mainIni.config.famarenda  =  skipfamcar.v
	mainIni.config.servcheck  =  servcheck.v
	mainIni.config.carcheck   =  carcheck.v
	mainIni.config.pokazz      =  pokazz.v
	mainIni.config.pokaz      =  pokaz.v
	mainIni.config.prova      =  prova.v
	mainIni.config.trailerrr  =  trailerrr.v
	mainIni.config.zoneklad   =  treasurezone.v
	mainIni.config.trashWH    =  trashWH.v
	mainIni.config.wallhack   =	 wallhack.v
	mainIni.config.themergb   =  themergb.v
	mainIni.config.skill      =	 skill.v
	mainIni.config.kryjok     =  kryjok.v
	mainIni.config.nubaim     =  nubaim.v
	mainIni.config.AimSmooth     =  AimSmooth.v
	mainIni.config.aimfovik     =  aimfovik.v
	mainIni.config.bone     =  bone.v
	mainIni.config.aimteam     =  aimteam.v
	mainIni.config.checkObject     =  checkObject.v
	mainIni.config.checkVehicle     =  checkVehicle.v
	mainIni.config.checkBuild     =  checkBuild.v
	mainIni.config.checkBuild     =  checkBuild.v
	mainIni.config.maxDistAim     =  maxDistAim.v
	mainIni.config.Move1  =  Move1.v
	mainIni.config.Move2  =  Move2.v
	mainIni.config.Move3  =  Move3.v
    inicfg.save(mainIni, "[helper].ini")
end

function save2()
		mainIni.config.invz     =  invz.v
		mainIni.config.process = process.v
		mainIni.config.sped  = sped.v
		mainIni.config.waitt = waitt.v
	mainIni.config.invy    =  invy.v
	mainIni.config.invx     =  invx.v
	mainIni.config.spinner     =  spinner.v
	mainIni.config.speedspiner     =  speedspiner.v
	mainIni.config.pissat     =  pissat.v
	mainIni.config.invdist     =  invdist.v
	mainIni.config.blain      =  slider1.v
	mainIni.config.camdist    =  slider.v
    mainIni.config.rklad      =  rklad.v
	mainIni.config.sbivmyso   =  sbivmyso.v
	mainIni.config.rolen      =  rolen.v
	mainIni.config.renderdereva = renderdereva.v
	mainIni.config.rlen       =  rlen.v
	mainIni.config.rhlopok    =  rhlopok.v
	mainIni.config.rsem       =  rsem.v
	mainIni.config.rryda      =  rryda.v
    mainIni.config.rderevo    =  rderevo.v
	mainIni.config.rnw        =  rnw.v
	mainIni.config.rvagos     =  rvagos.v
	mainIni.config.boxmp      =  boxmp.v
	mainIni.config.rvetok     =  rvetok.v
    mainIni.config.roskolok   =  roskolok.v
    mainIni.config.rkypidon   =  rkypidon.v
	mainIni.config.motoban    =  motoban.v

	inicfg.save(mainIni, "[helper].ini")
end
