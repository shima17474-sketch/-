local events = require("samp.events")

local tp = false
local tp_dist = 175
local waiting = 1000
local percent = 0
local font = renderCreateFont('NAMU PRO', 12, 4)
local incar, bar = false, true

function main()
    while not isSampAvailable() do wait(0) end
    sampRegisterChatCommand("tpz", function(args)
        lua_thread.create(function()
            local bool, bx,by,bz = getTargetBlipCoordinatesFixed()
            if tp then
                sampAddChatMessage('Ошибка. {6495ed}Уже телепортируемся.', -1)
                return
            end
            if args ~= nil and args:match('%w+ %d+') then
                local biber, dolik = args:match('(%w+) (%d+)')
                if biber == 'waiting' then
                    waiting = tonumber(dolik)
                    return sampAddChatMessage('Успешно. {6495ed}Задержка: '..waiting, -1)
                end
            elseif args == "view" then
                bar = not bar
                return
            elseif args == "" then
            elseif args == "cpm" then
                bool, bx,by,bz = SearchMarker()
            else
                sampAddChatMessage('Неизвестная команда! {6495ed}Используйте /tpz | /tpz cpm', -1)
                return
            end
            if bool then
                percent = 0
                tp = true
                if incar then
                    freezeCarPosition(storeCarCharIsInNoSave(PLAYER_PED), true)
                else
                    freezeCharPosition(PLAYER_PED, true)
                end
                local x, y, z = getCharCoordinates(PLAYER_PED)
                local nx, ny, nz = x,y,z
                local dist = getDistanceBetweenCoords2d(x,y,bx,by)
                local angle = -math.rad(getHeadingFromVector2d(bx - x, by - y))
                local data = samp_create_sync_data(incar and "vehicle" or "player")
                setCharCoordinates(PLAYER_PED, bx, by, bz)
                if dist > tp_dist then
                    for ds = dist-tp_dist, 0, -tp_dist do
                        data.moveSpeed = {0, 0, incar and -0.1 or -0.7}
                        for i = nz, -135, -25 do
                            data.position = {nx, ny, i}
                            data.send()
                            wait(50) -- 200 ms / 150ms
                        end
                        data.moveSpeed = {0, 0, 0}
                        nx, ny, nz = nx + math.sin(angle) * tp_dist, ny + math.cos(angle) * tp_dist, -60
                        data.position = {nx, ny, nz}
                        data.send()
                        percent = math.calculate(0,100,dist,0,ds)
                        wait(waiting)
                    end
                end
                data.moveSpeed = {0, 0, incar and -0.1 or -0.7}
                for i = nz, -135, -25 do
                    data.position = {nx, ny, i}
                    data.send()
                    wait(50)
                end
                data.position = {bx,by,bz}
                data.send()
                setCharCoordinates(PLAYER_PED, bx, by, bz)
                if incar then
                    freezeCarPosition(storeCarCharIsInNoSave(PLAYER_PED), false)
                else
                    freezeCharPosition(PLAYER_PED, false)
                end
                sampAddChatMessage('Успех. {6495ed}Телепортировались', -1)
                tp = false
            end
        end)
    end)
    while true do
        wait(0)
        incar = isCharInAnyCar(PLAYER_PED)
        if bar then
            if tp then
                renderFontDrawText(font, '{6495ed}| {ffffff}Teleporting:{6495ed} [' .. ("%0.1f"):format(percent) .. '%]\n| {ffffff}Wait:{6495ed} '..waiting, 10, 400, -1)
            else
                renderFontDrawText(font, '{6495ed}| {ffffff}Mode: {6495ed}'..(incar and 'Vehicle' or 'Onfoot')..'\n| {ffffff}Wait:{6495ed} '..waiting, 10, 400, -1)
            end
        end
    end
end

local function nop(data)
    if tp then return false end
end

events.onShowDialog = function(id)
    if tp and incar and id == 26263 then
        return false
    end
end

events.onSendPlayerSync = nop
events.onSendVehicleSync = nop

function SearchMarker()
    local isFind = false
    if not isFind then
        local ret_posX = 0.0
        local ret_posY = 0.0
        local ret_posZ = 0.0
        for id = 0, 31, 1 do
            local MarkerStruct = 0
            MarkerStruct = 0xC7F168 + id * 56
            local MarkerPosX = representIntAsFloat(readMemory(MarkerStruct + 0, 4, false))
            local MarkerPosY = representIntAsFloat(readMemory(MarkerStruct + 4, 4, false))
            local MarkerPosZ = representIntAsFloat(readMemory(MarkerStruct + 8, 4, false))
            if MarkerPosX ~= 0.0 or MarkerPosY ~= 0.0 or MarkerPosZ ~= 0.0 then
                ret_posX = MarkerPosX
                ret_posY = MarkerPosY
                ret_posZ = MarkerPosZ
                isFind = true
            end
        end
        return isFind, ret_posX, ret_posY, ret_posZ
    end
end

function getTargetBlipCoordinatesFixed()
    local bool, x, y, z = getTargetBlipCoordinates(); if not bool then return false end
    requestCollision(x, y); loadScene(x, y, z)
    local bool, x, y, z = getTargetBlipCoordinates()
    return bool, x, y, z
end

function samp_create_sync_data(sync_type, copy_from_player)
   local ffi = require 'ffi'
   local sampfuncs = require 'sampfuncs'
   local raknet = require 'samp.raknet'

   copy_from_player = copy_from_player or true
   local sync_traits = {
       player = {'PlayerSyncData', raknet.PACKET.PLAYER_SYNC, sampStorePlayerOnfootData},
       vehicle = {'VehicleSyncData', raknet.PACKET.VEHICLE_SYNC, sampStorePlayerIncarData},
       passenger = {'PassengerSyncData', raknet.PACKET.PASSENGER_SYNC, sampStorePlayerPassengerData},
       aim = {'AimSyncData', raknet.PACKET.AIM_SYNC, sampStorePlayerAimData},
       trailer = {'TrailerSyncData', raknet.PACKET.TRAILER_SYNC, sampStorePlayerTrailerData},
       unoccupied = {'UnoccupiedSyncData', raknet.PACKET.UNOCCUPIED_SYNC, nil},
       bullet = {'BulletSyncData', raknet.PACKET.BULLET_SYNC, nil},
       spectator = {'SpectatorSyncData', raknet.PACKET.SPECTATOR_SYNC, nil}
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
           end
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

function math.calculate(MinInt, MaxInt, MinFloat, MaxFloat, CurrentFloat)
    local res = CurrentFloat - MinFloat
    local res2 = MaxFloat - MinFloat
    local res3 = res / res2
    local res4 = res3 * (MaxInt - MinInt)
    return res4 + MinInt
end