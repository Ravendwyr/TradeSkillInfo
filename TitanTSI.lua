
TITAN_TSI_ID = "TSI";

function TitanPanelTSIButton_OnLoad()
if IsAddOnLoaded("Titan") then 
            this.registry = { 
            id = TITAN_TSI_ID,
            menuText = "TradeSkillInfo", 
            category = "Information",
            tooltipTitle = "TradeSkillInfo",
            tooltipTextFunction = "TitanPanelTSIButton_GetTooltipText", 
            icon = "Interface\\Icons\\INV_Elemental_Mote_Nether",
            iconWidth = 16,
            iconButtonWidth = 16,	
        };
    end
end

function TitanPanelTSI_OnClick(button)
	if ( button == "LeftButton" ) then
		TradeskillInfo:UI_Toggle()
	elseif ( button == "RightButton" ) then
		TradeskillInfo:Config_Toggle()
	end
end

function TitanPanelTSIButton_GetTooltipText()
    local text = "Left click = TSI, Right = Config";
    return text;
end