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

        if isKeyJustPressed(VK_7) then -- ���� ����� ������ ������� 7, �� ������ ��������� ��������
            sampShowDialog(1, "�������� ����","1\n2\n3", "1 ������", "0 ������", 2) -- ������ ��������� ������, ����� ��� 1 id
        end
        local result, button, list, input = sampHasDialogRespond(1) -- �������� ���������� � �������
            if result then -- ���� ������ �������...
                if button == 1 and list == 0 then -- ���� ������ ������ 1 � ������ ����� 0 ��...
                    sampAddChatMessage("������0", -1) end -- ������� "������0" ��������
                if button == 1 and list == 1 then -- ���� ������ ������ 1 � ������ ����� 1 ��...
                    sampAddChatMessage("������1", -1) end -- ������� "������1" ��������
                if button == 1 and list == 2 then -- ���� ������ ������ 1 � ������ ����� 2 ��...
                    sampAddChatMessage("������2", -1) end -- ������� "������2" ��������
            end
        end
    end
function cmd_xmenu(arg)
    sampAddChatMessage("����",-1)
end