script_name("New")
script_authors("jjj")

require "lib.moonloader"
local key = require 'vkeys'
local imgui = require 'imgui'
local inicfg = require 'inicfg'
local encoding = require 'encoding'
local sampev = require 'lib.samp.events'

encoding.default = 'CP1251'
u8 = encoding.UTF8

-- �����
-- ������� {B22222}
-- ������ {FFFF00}
-- ������� {006400}
-- ����� {4682B4}

local tag = "[X]"

function main()
    if not isSampLoaded() or not isSampfuncsLoaded() then return end
    while not isSampAvailable() do wait(100) end

    sampAddChatMessage("{4682B4}" .. tag .. " {FFFFFF}������ ������� �������.",-1)
    sampAddChatMessage("{4682B4}" .. tag .. " {FFFFFF}������: 0.1",-1)

    sampRegisterChatCommand("xmenu", cmd_xmenu)

    thread = lua_thread.create_suspended(thread_func)
    -- ���� ����� ��������� �����
    while true do
        wait(0)

        local result, button, list, input = sampHasDialogRespond(1)
        if result then
            if button == 1 then
                thread:run("2")
            else return end
        end
        -- ����������� ����
    end
end

function cmd_xmenu(arg)
    thread:run("1")
end

function thread_func(option)
    if option == "1" then
        sampShowDialog(1,"1","������ ������","����","",0)
    end
    if option == "2" then
        sampAddChatMessage("��� ����", -1)
    end
end