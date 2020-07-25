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

        if isKeyJustPressed(VK_7) then -- если будет нажата клавиша 7, то скрипт продолжит действие
            sampShowDialog(1, "Название окна","1\n2\n3", "1 кнопка", "0 кнопка", 2) -- создаём локальный диалог, задаём ему 1 id
        end
        local result, button, list, input = sampHasDialogRespond(1) -- получаем информацию с диалога
            if result then -- если диалог активен...
                if button == 1 and list == 0 then -- если нажата кнопка 1 и строка равна 0 то...
                    sampAddChatMessage("строка0", -1) end -- выводим "строка0" локально
                if button == 1 and list == 1 then -- если нажата кнопка 1 и строка равна 1 то...
                    sampAddChatMessage("строка1", -1) end -- выводим "строка1" локально
                if button == 1 and list == 2 then -- если нажата кнопка 1 и строка равна 2 то...
                    sampAddChatMessage("строка2", -1) end -- выводим "строка2" локально
            end
        end
    end
function cmd_xmenu(arg)
    sampAddChatMessage("Окей",-1)
end