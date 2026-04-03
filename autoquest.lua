local ev = require('lib.samp.events')
local imgui = require('imgui')
local encoding = require('encoding')

encoding.default = 'CP1251'
local u8 = encoding.UTF8

local menu = imgui.ImBool(false)
local tpCmd = imgui.ImBuffer(128)

local currentQuest = -1
local state = false
local altFlood = false
local dissync = false
local inDialog = false

function main()
    apply_custom_style()
    tpCmd.v = '/gtp'
    repeat wait(0) until isSampAvailable()
    sampRegisterChatCommand('aq', function() 
        menu.v = not menu.v
    end)
    while true do
        wait(0)
        imgui.Process = menu.v
        if state then
            if currentQuest == -1 and not dissync then
                local x, y, z = getCharCoordinates(PLAYER_PED)
                if getDistanceBetweenCoords3d(1773.2109, -1892.3126, 13.5514, x, y, z) > 50 then
                    setTargetBlipCoordinates(1773.2109, -1892.3126, 13.5514)
                    sampProcessChatInput(tpCmd.v)
                    wait(1000)
                elseif getDistanceBetweenCoords3d(1773.2109, -1892.3126, 13.5514, x, y, z) > 5 then
                    move(1773.2109, -1892.3126, 13.5514)
                elseif not inDialog then
                    sendPacket(true)
                end
            end
        end
    end
end

function imgui.OnDrawFrame()
    if menu.v then
        local xw, yw = getScreenResolution()
        local x, y = 500, 300
        imgui.SetNextWindowPos(imgui.ImVec2(xw / 2 - x / 2, yw / 2 - y / 2), imgui.Cond.FirstUseEver)
        imgui.SetNextWindowSize(imgui.ImVec2(x, y), imgui.Cond.FirstUseEver)
        imgui.Begin('AutoQuest', menu, imgui.WindowFlags.NoResize)
        if imgui.Button(u8(state and 'Завершить' or 'Начать'), imgui.ImVec2(-1, 30)) then
            state = not state
            if state and not select(1, getTargetBlipCoordinates()) then
                state = false
                sampAddChatMessage('Установите метку на карте (абсолютно любую)', -1)
            end
            inDialog = false
            dissync = false
            altFlood = false
            currentQuest = -1
        end
        imgui.PushItemWidth(200)
        imgui.InputText(u8'Команда телепорта по метке (с /)', tpCmd)
        imgui.PopItemWidth()
        imgui.End()
    end
end

function ev.onShowDialog(id, style, title, btn1, btn2, text)
    -- print(text)
    if title:find('Акции на') then return false end
    if state then
        if currentQuest == -1 then
            if id == 7681 then
                inDialog = true
                sampSendDialogResponse(id, 1, 1, '')
                return false
            elseif id == 7971 then
                local quests = mysplit(text, '\n')
                for k, quest in pairs(quests) do
                    if quest:find('В процессе') then
                        local name = quest:match('(.+) {6DA5EF}.+')
                        currentQuest = getQuestByName(name)
                        if currentQuest == nil then
                            currentQuest = -1
                            sampAddChatMessage('Неизвестный квест!', -1)
                        else
                            lua_thread.create(postProcessQuests)
                            break
                        end
                    elseif quest:find('Доступен') then
                        local name = quest:match('(.+) {6DA5EF}.+')
                        currentQuest = getQuestByName(name)
                        if currentQuest == nil then
                            currentQuest = -1
                            sampAddChatMessage('Неизвестный квест!', -1)
                        else
                            sampSendDialogResponse(id, 1, k - 1, '')
                            break
                        end
                    end 
                end
                return false
            end
        else
            if id == 7972 then
                sampSendDialogResponse(id, 1, 0, '')
                lua_thread.create(postProcessQuests)
                return false
            end
        end
        if currentQuest == 1 then
            if id == 147 then
                altFlood = false
                sampSendDialogResponse(id, 1, 0, '')
                return false
            end
            if id == 148 then
                sampSendDialogResponse(id, 1, 0, '1/1/1998')
                return false
            end
            if id == 0 then
                lua_thread.create(function() 
                    move(1538.2361, 1045.9617, 1033.8420)
                    wait(1000)
                    while getCharActiveInterior(PLAYER_PED) ~= 0 do
                        wait(0)
                    end
                    currentQuest = -1
                end)
            end
        end
    end
end

function postProcessQuests()
    inDialog = false
    if currentQuest == 1 then
        wait(1000)
        setTargetBlipCoordinates(1495.0702, -1279.9265, 14.5749)
        sampProcessChatInput(tpCmd.v)
        wait(1000)
        if not state then return false end
        while getCharActiveInterior(PLAYER_PED) == 0 do
            wait(1000)
            if not state then return false end
            if getCharActiveInterior(PLAYER_PED) == 0 then
                setCharCoordinates(PLAYER_PED, 1495.0702, -1279.9265, 14.5749)
            end
        end
        wait(100)
        if not state then return false end
        move(1537.2668, 1112.2007, 1033.8420)
        wait(1000)
        if not state then return false end
        altFlood = true
        while altFlood do
            wait(0)
            if not state then return false end
            sendPacket(true)
        end
    end
end

function move(x, y, z)
    local px, py, pz = getCharCoordinates(PLAYER_PED)
    local step = 1
    dissync = true
    lua_thread.create(function() 
        while getDistanceBetweenCoords3d(px, py, pz, x, y, z) > step + 1 do
            if px < x then px = px + step else px = px - step end
            if py < y then py = py + step else py = py - step end
            if pz < z then pz = pz + step else pz = pz - step end
            sendPacket(false, px, py, pz)
            wait(10)
            if not state then dissync = false setCharCoordinates(PLAYER_PED, px, py, pz) return false end
        end
        setCharCoordinates(PLAYER_PED, x, y, z)
        dissync = false
        sampForceOnfootSync()
    end)
end

function getQuestByName(name)
    local quests = {
        ['Сделать паспорт'] = 1,
        ['Лучшая работа'] = 2,
        ['Нужно разгрузить вагоны!'] = 3,
        ['Время что-то получить'] = 4,
        ['Хватит сложной работы!'] = 5,
        ['Пора прощаться'] = 6,
    }
    return quests[name]
end

function onReceivePacket(id, bitStream)
    if state and (id == 32 or id == 33) then state = false end
end

function mysplit (inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end

function sendPacket(alt, x, y, z)
    if x == nil or y == nil or z == nil then
        x, y, z = getCharCoordinates(PLAYER_PED)
    end
    local bs = raknetNewBitStream()
    raknetBitStreamWriteInt8(bs, 207)
    raknetBitStreamWriteInt16(bs, 0)
    raknetBitStreamWriteInt16(bs, 0)
    raknetBitStreamWriteInt16(bs, alt and 1024 or 0)
    raknetBitStreamWriteFloat(bs, x)
    raknetBitStreamWriteFloat(bs, y)
    raknetBitStreamWriteFloat(bs, z)
    raknetBitStreamWriteFloat(bs, 0)
    raknetBitStreamWriteFloat(bs, 0)
    raknetBitStreamWriteFloat(bs, 0)
    raknetBitStreamWriteFloat(bs, 0)
    raknetBitStreamWriteInt8(bs, getCharHealth(PLAYER_PED))
    raknetBitStreamWriteInt8(bs, getCharArmour(PLAYER_PED))
    raknetBitStreamWriteInt8(bs, getCurrentCharWeapon(PLAYER_PED))
    raknetBitStreamWriteInt8(bs, 0)
    raknetBitStreamWriteFloat(bs, 0)
    raknetBitStreamWriteFloat(bs, 0)
    raknetBitStreamWriteFloat(bs, 0)
    raknetBitStreamWriteFloat(bs, 0.1)
    raknetBitStreamWriteFloat(bs, 0.1)
    raknetBitStreamWriteFloat(bs, -0.1)
    raknetBitStreamWriteInt16(bs, 0)
    raknetBitStreamWriteInt16(bs, 0)
    raknetBitStreamWriteInt16(bs, 0)
    raknetSendBitStreamEx(bs, 2, 8, 0)
    raknetDeleteBitStream(bs)
end

function apply_custom_style()
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