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
        
    -- Бесконечный блок
    end
function cmd_xmenu(arg)
    sampAddChatMessage("Окей",-1)
end