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
        
        if isKeyDown(VK_7) then
            sampShowDialog(10,"{4682B4}X {FFFFFF}| ������� ����","{4682B4}1 {FFFFFF}������ ����������\n{4682B4}2 {FFFFFF}��������� \n{4682B4}3 {FFFFFF}��������","�����","",2)
        end

        local result, button, list, imput = sampHasDialogRespond(10)
        if result then
            if button == 1 then
                if list == 0 then
                    sampShowDialog(11,"{4682B4}X {FFFFFF}| ������ ����������","24.07.2020\nxx.xx.xxxx\nxx.xx.xxxx","�����","�����",2)
                elseif list == 1 then
                    sampShowDialog(12,"{4682B4}X {FFFFFF}| ���������","-\n-\n-\n-","�����","�����",2)
                elseif list == 2 then
                    sampShowDialog(13,"{4682B4}X {FFFFFF}| ��������","{4682B4}����� �������{FFFFFF}: Faust Van Helsing (jjj)\n{4682B4}VK{FFFFFF}: https://vk.com/canelhan","�����","",0) 
                end    
            end
        end
    -- ����������� ����
    end
end
function cmd_xmenu(arg)
    sampAddChatMessage("����",-1)
end