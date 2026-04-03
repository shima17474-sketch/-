local ev = require 'samp.events'
local boolshit = false
local tag = '{ff8000}HueShot v1.2{ffffff}| '
local vkeys = require 'vkeys'

function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then return end
    while not isSampAvailable() do wait(100) end
    sampAddChatMessage(tag .. 'Каршот включен. Авторы: cheremuxa, Justie, Joni Scripts', -1)
    sampAddChatMessage(tag .. 'Команды скрипта: {00ff00}/unlock [id] {ffffff}| {00ff00}/hr', -1)
    sampRegisterChatCommand('unlock', function(arg)
        if #arg ~= 0 then
            _, handle = sampGetCarHandleBySampVehicleId(tonumber(arg))
            lockCarDoors(handle, false)
            sampAddChatMessage(tag .. 'Т/С {00ff00}разблокировано. {ffffff}Важно сесть на пассажирское место.', -1)
        else
            sampAddChatMessage(tag .. 'Вы неверно ввели ID машины.', -1)
        end
    end)
    sampRegisterChatCommand('hr', function()
        if isCharInAnyCar(playerPed) then
            boolshit = not boolshit
            if boolshit then
                sampAddChatMessage(tag .. 'ВКЛЮЧЕНО! Гайд по управлению: ', -1)
                sampAddChatMessage(tag .. 'W - Вперед', -1)
                sampAddChatMessage(tag .. 'S - Назад', -1)
                sampAddChatMessage(tag .. 'A - Влево', -1)
                sampAddChatMessage(tag .. 'D - Вправо', -1)
                sampAddChatMessage(tag .. 'Пробел - Остановить машину', -1)
            else
                sampAddChatMessage(tag .. 'ВЫКЛЮЧЕНО!', -1)
            end
        else
            boolshit = false
            sampAddChatMessage(tag .. 'Я не могу включиться т.к вы не находитесь в машине.', -1)
        end
    end)
    while true do
        wait(0)
        if not sampIsChatInputActive() and not sampIsDialogActive() and boolshit and isCharInAnyCar(playerPed) then
            mycar = storeCarCharIsInNoSave(playerPed)
            local aCX, aCY, _ = getActiveCameraCoordinates()
            local aPX, aPY, _ = getActiveCameraPointAt()
            local angle = getHeadingFromVector2d(aPX - aCX, aPY - aCY)
            if not isKeyDown(vkeys.VK_A) and not isKeyDown(vkeys.VK_D) then
                setCarHeading(mycar, angle)
            end
            if isKeyDown(vkeys.VK_W) then
                setCarForwardSpeed(mycar, 31)
                setCarCollision(mycar, false)
            else
                setCarCollision(mycar, true)
            end
            if isKeyDown(vkeys.VK_S) then
                setCarForwardSpeed(mycar, -31)
                setCarCollision(mycar, false)
            else
                setCarCollision(mycar, true)
            end
            if isKeyDown(vkeys.VK_A) then
                setCarHeading(mycar, angle+90)
                setCarForwardSpeed(mycar, 31)
                setCarCollision(mycar, false)
            else
                setCarCollision(mycar, true)
            end
            if isKeyDown(vkeys.VK_D) then
                setCarHeading(mycar, angle-90)
                setCarForwardSpeed(mycar, 31)
                setCarCollision(mycar, false)
            else
                setCarCollision(mycar, true)
            end
            if wasKeyPressed(vkeys.VK_LSHIFT) then
                bx, by, bz = getCarCoordinates(mycar)
                fz = getGroundZFor3dCoord(bx, by, bz)
                setCarCoordinates(mycar, bx, by, bz+1.2)
            end
        end
        if isCharOnFoot(playerPed) and boolshit then
            boolshit = false
            sampAddChatMessage(tag .. 'Вы вышли из машины, скрипт выключен.', -1)
        end
    end
end

function ev.onSendVehicleSync(data)
   if data.moveSpeed.x > 0.4 and boolshit then
        data.moveSpeed.x = 0.2
        printStringNow('~g~Fixed MS:X', 300)
    end
    if data.moveSpeed.x < -0.2 and boolshit then
        data.moveSpeed.x = -0.1
        printStringNow('~g~Fixed MS:X', 300)
    end
    if data.moveSpeed.y > 0.4 and boolshit then
        data.moveSpeed.y = 0.2
        printStringNow('~g~Fixed MS:Y', 300)
    end
    if data.moveSpeed.y < -0.2 and boolshit then
        data.moveSpeed.y = -0.1
        printStringNow('~g~Fixed MS:Y', 300)
    end
    if data.moveSpeed.z > 0.4 and boolshit then
        data.moveSpeed.z = 0.2
        printStringNow('~g~Fixed MS:Z', 300)
    end
    if data.moveSpeed.z < -0.2 and boolshit then
        data.moveSpeed.z = -0.1
        printStringNow('~g~Fixed MS:Z', 300)
    end
end

function ev.onSetPlayerPos()
    if boolshit and isCharInAnyCar(playerPed) then
        return false
    end
end

function ev.onRemovePlayerFromVehicle()
    if isCharInAnyCar(playerPed) and boolshit then
        return false
    end
end