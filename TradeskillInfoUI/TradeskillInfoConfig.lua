-- $Revision: 61 $

TradeskillInfo.options = {};
TradeskillInfo.options.CheckBoxes = {
	-- Item Tooltip
	["Source"] = { index=1, tooltipText="Show source in tooltip", var="TooltipSource"},
	["Used in"] = { index=2, tooltipText="Show used in in tooltip", var="TooltipUsedIn"},
	["Usable by"] = { index=3, tooltipText="Show who can use an item", var="TooltipUsableBy"},
	["Banked"] = { index=4, tooltipText="Show how many you have in the bank (Req CharacterInfoStorage)", var="TooltipBankedAmount"},
	["Alt Amount"] = { index=8, tooltipText="Show how many you have on alt's  (Req CharacterInfoStorage)", var="TooltipAltAmount"},
	["ItemID"] = { index=9, tooltipText="Show ItemID in tooltip", var="TooltipID"},
	["Stack Size"] = { index=10, tooltipText="Show item stack size in tooltip" , var="TooltipStack"},
	-- Recipe Tooltip
	["Recipe Source"] = { index=13, tooltipText="Show source in tooltip", var="TooltipRecipeSource"},
	["Recipe Price"] = { index=14, tooltipText="Show vendor sell price in tooltip", var="TooltipRecipePrice"},
	["Known by"] = { index=5, tooltipText="Show known by in recipe tooltip", var="TooltipKnownBy"},
	["Learnable by"] = { index=6, tooltipText="Show learnable by in recipe tooltip", var="TooltipLearnableBy"},
	["Will be learnable by"] = { index=7, tooltipText="Show will be learnable by in recipe tooltip", var="TooltipAvailableTo"},
	-- Tradeskill/Craft Frame
	["Skill required"] = { index=11, tooltipText="Show skill required", var="ShowSkillLevel"},
	["Combine cost"] = { index=12, tooltipText="Show combine cost", var="ShowSkillProfit"},
	-- Trainer
	["Trainer reagents"] = { index=15, tooltipText="Show recipe reagents in tooltip at trainer", var="TrainerReagents"},
	-- QuickSearch
	-- TradeSkillInfoUI
	["Quick Search"] = { index=21, tooltipText="Enable Quick Search", var="QuickSearch"},
	["Save Frame Position"] = { index=22, tooltipText="Remember TradeskillInfoUI frame position", var="SavePosition"},
	-- AH
	["Color Recipes"] = { index=31, tooltipText="Color recipes in the Auction House", var="ColorAHRecipes"},
}
TradeskillInfo.options.ColorSwatches = {
	{ index=1, var="ColorSource" },
	{ index=2, var="ColorUsedIn" },
	{ index=3, var="ColorUsableBy" },
	{ index=4, var="ColorBankedAmount" },
	{ index=9, var="ColorID" },
	{ index=10, var="ColorStack" },
	{ index=13, var="ColorRecipeSource" },
	{ index=14, var="ColorRecipePrice" },
	{ index=5, var="ColorKnownBy" },
	{ index=6, var="ColorLearnableBy" },
	{ index=7, var="ColorAvailableTo" },
	{ index=8, var="ColorAltAmount" },
	{ index=15, var="ColorTrainerReagents" },
	{ index=32, var="AHColorLearnable"},
	{ index=33, var="AHColorAltLearnable"},
	{ index=34, var="AHColorWillLearn"},
	{ index=35, var="AHColorAltWillLearn"},
	{ index=36, var="AHColorUnavailable"},
}
TradeskillInfo.options.Selections = {
	["Search Mouse Button"] = { index=1, tooltipText="Mouse button that does a quick search", table={"LeftButton","RightButton"}, var="SearchMouseButton" },
	["Search Shift Key"] = { index=2, tooltipText="Shift key to be held down for quick search", table={"Shift","Control","Alt"}, var="SearchShiftKey" },
	["Frame Strata"] = { index=3, tooltipText="Set TradeskillInfoUI frame strata", table={"LOW","MEDIUM","HIGH"}, var="FrameStrata" },
}
TradeskillInfo.options.Frames = {
	["TradeskillInfo_Tab1"] = "TradeskillInfoConfig_Sub1Frame",
	["TradeskillInfo_Tab2"] = "TradeskillInfoConfig_Sub2Frame",
	["TradeskillInfo_Tab3"] = "TradeskillInfoConfig_Sub3Frame",
	["TradeskillInfo_Tab4"] = "TradeskillInfoConfig_Sub4Frame",
}
TradeskillInfo.options.Labels = {
	["TradeskillInfo_Label1Text"] = "Item Tooltip",
	["TradeskillInfo_Label2Text"] = "Recipe Tooltip",
	["TradeskillInfo_Label3Text"] = "TradeSkill Frame",
	["TradeskillInfo_Label4Text"] = "Trainer Frame",
	["TradeskillInfo_Label5Text"] = "Quick Search",
	["TradeskillInfo_Label6Text"] = "Auction House",
	["TradeskillInfo_Label32Text"] = "You can learn",
	["TradeskillInfo_Label33Text"] = "An alt can learn",
	["TradeskillInfo_Label34Text"] = "You will be able to learn",
	["TradeskillInfo_Label35Text"] = "An alt will be able to learn",
	["TradeskillInfo_Label36Text"] = "Unavailable or already known",
	["TradeskillInfo_Tab1"] = "Tooltip",
	["TradeskillInfo_Tab2"] = "Tradeskill",
	["TradeskillInfo_Tab3"] = "UI",
	["TradeskillInfo_Tab4"] = "Auction",
	["TradeskillInfo_OkButton"] = "OK",
	["TradeskillInfoConfig_Title"] = "Tradeskill Info Config",
}

--	MoneyFormat = 3,
function TradeskillInfo:Config_Init()
	self:ToggleTab("TradeskillInfoConfig_Sub1Frame");
	if oSkin and oSkin.applySkin then
		oSkin:applySkin(TradeskillInfoConfigFrame);
	end
end

function TradeskillInfo:Config_Show()
	ShowUIPanel(TradeskillInfoConfigFrame);
end

function TradeskillInfo:Config_Hide()
	HideUIPanel(TradeskillInfoConfigFrame);
end

function TradeskillInfo:ConfigFrame_OnShow()
	-- Labels
	for key,value in pairs(self.options.Labels) do
		text = getglobal(key);
		if text then
			text:SetText(value);
		end
	end
	
	for key in pairs(self.options.Frames) do
		tab = getglobal(key);
		if tab then
			PanelTemplates_TabResize(tab, -17);
		end
	end
	
	-- Checkboxes
	for key, value in pairs(self.options.CheckBoxes) do
		option = getglobal("TradeskillInfo_Option"..value.index);
		text = getglobal("TradeskillInfo_Option"..value.index.."Text");
		if (option) then
			text:SetText(key);
			option.var = value.var;
			option:SetChecked(self.db.profile[value.var]);
			if (value.tooltipText) then
				option.tooltipText = value.tooltipText;
			end
		end
	end

	-- Color Swatches
	for key, value in pairs(self.options.ColorSwatches) do
		frame = getglobal("TradeskillInfo_Color"..value.index);
		swatch = getglobal("TradeskillInfo_Color"..value.index.."NormalTexture");
		if frame then
			sColor = self.db.profile[value.var];
			frame.r = sColor.r;
			frame.g = sColor.g;
			frame.b = sColor.b;
			local i = value.index;
			local k = value.var;
			frame.swatchFunc = function() self:Config_SetColor(i, k) end;
			frame.cancelFunc = function(x) self:Config_CancelColor(i, k, x) end;
			swatch:SetVertexColor(sColor.r,sColor.g,sColor.b);
		end
	end

	--Dropdowns
	for key, value in pairs(self.options.Selections) do
		option1 = getglobal("TradeskillInfo_Selection"..value.index);
		option2 = getglobal("TradeskillInfo_Selection"..value.index.."Label");
		if option1 then
			option1.var = value.var;
			option1.lookup = value.table;
			getvalue = self.db.profile[value.var];
			UIDropDownMenu_SetSelectedID(option1, getvalue);
			UIDropDownMenu_SetText(option1, value.table[getvalue]);
			option1.tooltipText = value.tooltipText;
			option2:SetText(key);
		end
	end
end

function TradeskillInfo:ConfigFrame_OnHide()
end

function TradeskillInfo:OptionsCheckButtonOnClick()
	self.db.profile[this.var] = this:GetChecked() or false;
end

function TradeskillInfo:OptionsRadioButtonOnClick()
end

----------------------
--change tabs
function TradeskillInfo:ConfigTabClick()
	self:ToggleTab(self.options.Frames[this:GetName()]);
	PlaySound("igCharacterInfoTab");
end

----------------------
--change tabs
function TradeskillInfo:ToggleTab(frameName)
	local key, value
	for key, value in pairs(self.options.Frames) do
		if ( value == frameName ) then
			getglobal(value):Show();
			PanelTemplates_SelectTab(getglobal(key));
			getglobal(key):LockHighlight();
		else
			getglobal(value):Hide();
			PanelTemplates_DeselectTab(getglobal(key));
			getglobal(key):UnlockHighlight();
		end	
	end
end

----------------------
--Open the color selector using show/hide
function TradeskillInfo:OpenColorPicker(button)
	--CloseMenus();
	if ( not button ) then
		button = this;
	end
	ColorPickerFrame.func = button.swatchFunc;
	ColorPickerFrame:SetColorRGB(button.r, button.g, button.b);
	ColorPickerFrame.previousValues = {r = button.r, g = button.g, b = button.b, opacity = button.opacity};
	ColorPickerFrame.cancelFunc = button.cancelFunc;
	ColorPickerFrame:Show();
end

----------------------
--Sets the colors of the config from a color swatch
function TradeskillInfo:Config_SetColor(index,key)
	local r,g,b = ColorPickerFrame:GetColorRGB();
	local color = self.db.profile[key];
	local swatch = getglobal("TradeskillInfo_Color"..index.."NormalTexture");
	local frame = getglobal("TradeskillInfo_Color"..index);
	swatch:SetVertexColor(r,g,b);
	frame.r, frame.g, frame.b = r,g,b;
	color.r, color.g, color.b = r,g,b;
end
----------------------
-- Cancels the color selection
function TradeskillInfo:Config_CancelColor(index, key, prev)
	local r,g,b = prev.r, prev.g, prev.b;
	local color = self.db.profile[key];
	local swatch = getglobal("TradeskillInfo_Color"..index.."NormalTexture");
	local frame = getglobal("TradeskillInfo_Color"..index);
	swatch:SetVertexColor(r, g, b);
	frame.r, frame.g, frame.b = r,g,b;
	color.r, color.g, color.b = r,g,b;
end

---------------------
--Init a Dropdown
function TradeskillInfo:DropDown_Initialize()
	local info = {};
	for index, value in pairs(TradeskillInfo.options.Selections) do
		if (this:GetName() == "TradeskillInfo_Selection"..value.index.."Button") then
			for key, name in pairs(value.table) do
				info = {};
				info.text = name;
				info.func = function(self, x) TradeskillInfo:DropDown_OnClick(self, x) end;
				info.arg1 = value.index;
				UIDropDownMenu_AddButton(info);
			end
			break;
		end
	end
end

---------------------
-- Dropdown Onclick
function TradeskillInfo:DropDown_OnClick(obj, list)
	local ddl = getglobal("TradeskillInfo_Selection"..list);
	UIDropDownMenu_SetSelectedID(ddl, this:GetID());
--	if (ddl.SCTTable) then
--		self.db.profile[SCT.FRAMES_DATA_TABLE][ddl.SCTTable][ddl.SCTVar] = this:GetID();
--	else
		self.db.profile[ddl.var] = this:GetID();
--	end
end

