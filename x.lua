script_name("X")
script_authors("jjj")

require "lib.moonloader"
local key = require 'vkeys'
local imgui = require 'imgui'
local inicfg = require 'inicfg'
local encoding = require 'encoding'
local sampev = require 'lib.samp.events'

encoding.default = 'CP1251'
u8 = encoding.UTF8

-- Цвета
-- Красный {B22222}
-- Желтый {FFFF00}
-- Зеленый {006400}
-- Синий {4682B4}

local tag = "[X]"

function main()
    if not isSampLoaded() or not isSampfuncsLoaded() then return end
    while not isSampAvailable() do wait(100) end

    sampAddChatMessage("{4682B4}" .. tag .. " {FFFFFF}Скрипт успешно запущен.",-1)
    sampAddChatMessage("{4682B4}" .. tag .. " {FFFFFF}Версия: 0.1",-1)

    sampRegisterChatCommand("xmenu", cmd_xmenu)

    thread = lua_thread.create_suspended(thread_func)
    -- Блок после включения сампа
    while true do
        wait(0)
        
        if isKeyDown(VK_7) then
            sampShowDialog(10,"{4682B4}X {FFFFFF}| Главное меню","{4682B4}1 {FFFFFF}Журнал обновлений\n{4682B4}2 {FFFFFF}Настройки \n{4682B4}3 {FFFFFF}Контакты","Выбор","",2)
        end

        local result, button, list, imput = sampHasDialogRespond(10)
        if result then
            if button == 1 then
                if list == 0 then
                    sampShowDialog(11,"{4682B4}X {FFFFFF}| Журнал обновлений","24.07.2020\nxx.xx.xxxx\nxx.xx.xxxx","Выбор","Назад",2)
                elseif list == 1 then
                    sampShowDialog(12,"{4682B4}X {FFFFFF}| Настройки","-\n-\n-\n-","Выбор","Назад",2)
                elseif list == 2 then
                    sampShowDialog(13,"{4682B4}X {FFFFFF}| Контакты","{4682B4}Автор скрипта{FFFFFF}: Faust Van Helsing (jjj)\n{4682B4}VK{FFFFFF}: https://vk.com/canelhan","Назад","",0) 
                end    
            end
        end
    -- Бесконечный блок
    end
end
function cmd_xmenu(arg)
    sampAddChatMessage("Окей",-1)
end