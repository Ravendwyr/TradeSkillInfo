
local L = LibStub("AceLocale-3.0"):GetLocale("TradeskillInfo")
local LDB = LibStub("LibDataBroker-1.1", true)

if LDB then
	local Broker = LDB:NewDataObject("TradeSkillInfo")

	Broker.type = "launcher"
	Broker.text = "TradeSkill Info"
	Broker.icon = "Interface\\Icons\\INV_Elemental_SpiritOfHarmony_2"

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
end
