
local L = LibStub("AceLocale-3.0"):GetLocale("TradeskillInfo")
local Broker = LibStub("LibDataBroker-1.1"):NewDataObject("TradeSkillInfo")

Broker.type = "launcher"
Broker.text = "TradeSkillInfo"
Broker.icon = "Interface\\Icons\\INV_Elemental_Mote_Nether"

Broker.OnClick = function(frame, button)
	if button == "LeftButton" then
		TradeskillInfo:UI_Toggle()
	elseif button == "RightButton" then
		TradeskillInfo:ConfigToggle()
	end
end

Broker.OnTooltipShow = function(tooltip)
	tooltip:AddLine("TradeSkill Info")
	tooltip:AddLine(L["Left Click"] .. ": " .. L["Open main window"] .. ".", 0, 1, 0)
	tooltip:AddLine(L["Right Click"] .. ": " .. L["Open configuration window"] .. ".", 0, 1, 0)
end
