
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
	tooltip:SetText("TradeSkillInfo")
	tooltip:AddLine("|cff30e030" .. L["Left Click"] .. "|r: " .. L["Open main window"])
	tooltip:AddLine("|cff30e030" .. L["Right Click"] .. "|r: " .. L["Open configuration window"])
end
