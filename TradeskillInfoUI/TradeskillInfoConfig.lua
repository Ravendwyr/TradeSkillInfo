-- $Revision: 61 $
local L = AceLibrary("AceLocale-2.2"):new("TradeskillInfoUI")

TradeskillInfo.options = {};
TradeskillInfo.options.CheckBoxes = {
	-- Item Tooltip
	[L["Source"]] = { index=1, tooltipText=L["Show source in tooltip"], var="TooltipSource"},
	[L["Used in"]] = { index=2, tooltipText=L["Show used in in tooltip"], var="TooltipUsedIn"},
	[L["Usable by"]] = { index=3, tooltipText=L["Show who can use an item"], var="TooltipUsableBy"},
	[L["Banked"]] = { index=4, tooltipText=L["Show how many you have in the bank (Req CharacterInfoStorage)"], var="TooltipBankedAmount"},
	[L["Alt Amount"]] = { index=8, tooltipText=L["Show how many you have on alt's  (Req CharacterInfoStorage)"], var="TooltipAltAmount"},
	[L["ItemID"]] = { index=9, tooltipText=L["Show ItemID in tooltip"], var="TooltipID"},
	[L["Stack Size"]] = { index=10, tooltipText=L["Show item stack size in tooltip"], var="TooltipStack"},
	-- Recipe Tooltip
	[L["Recipe Source"]] = { index=13, tooltipText=L["Show source in tooltip"], var="TooltipRecipeSource"},
	[L["Recipe Price"]] = { index=14, tooltipText=L["Show vendor sell price in tooltip"], var="TooltipRecipePrice"},
	[L["Known by"]] = { index=5, tooltipText=L["Show known by in recipe tooltip"], var="TooltipKnownBy"},
	[L["Learnable by"]] = { index=6, tooltipText=L["Show learnable by in recipe tooltip"], var="TooltipLearnableBy"},
	[L["Will be learnable by"]] = { index=7, tooltipText=L["Show will be learnable by in recipe tooltip"], var="TooltipAvailableTo"},
	-- Tradeskill/Craft Frame
	[L["Skill required"]] = { index=11, tooltipText=L["Show skill required"], var="ShowSkillLevel"},
	[L["Combine cost"]] = { index=12, tooltipText=L["Show combine cost"], var="ShowSkillProfit"},
	-- Trainer
	[L["Trainer reagents"]] = { index=15, tooltipText=L["Show recipe reagents in tooltip at trainer"], var="TrainerReagents"},
	-- QuickSearch
	[L["Quick Search"]] = { index=21, tooltipText=L["Enable Quick Search"], var="QuickSearch"},
	-- TradeSkillInfoUI
	[L["Save Frame Position"]] = { index=22, tooltipText=L["Remember TradeskillInfoUI frame position"], var="SavePosition"},
	-- AH
	[L["Color Recipes"]] = { index=31, tooltipText=L["Color recipes in the Auction House"], var="ColorAHRecipes"},
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
	[L["Search Mouse Button"]] = { index=1, tooltipText=L["Mouse button that does a quick search"], table={L["LeftButton"],L["RightButton"]}, var="SearchMouseButton" },
	[L["Search Shift Key"]] = { index=2, tooltipText=L["Shift key to be held down for quick search"], table={"Shift","Control","Alt"}, var="SearchShiftKey" },
	[L["Frame Strata"]] = { index=3, tooltipText=L["Set TradeskillInfoUI frame strata"], table={L["LOW"],L["MEDIUM"],L["HIGH"]}, var="FrameStrata" },
}
TradeskillInfo.options.Frames = {
	["TradeskillInfo_Tab1"] = "TradeskillInfoConfig_Sub1Frame",
	["TradeskillInfo_Tab2"] = "TradeskillInfoConfig_Sub2Frame",
	["TradeskillInfo_Tab3"] = "TradeskillInfoConfig_Sub3Frame",
	["TradeskillInfo_Tab4"] = "TradeskillInfoConfig_Sub4Frame",
}
TradeskillInfo.options.Labels = {
	["TradeskillInfo_Label1Text"] = L["Item Tooltip"],
	["TradeskillInfo_Label2Text"] = L["Recipe Tooltip"],
	["TradeskillInfo_Label3Text"] = L["TradeSkill Frame"],
	["TradeskillInfo_Label4Text"] = L["Trainer Frame"],
	["TradeskillInfo_Label5Text"] = L["Quick Search"],
	["TradeskillInfo_Label6Text"] = L["Auction House"],
	["TradeskillInfo_Label32Text"] = L["You can learn"],
	["TradeskillInfo_Label33Text"] = L["An alt can learn"],
	["TradeskillInfo_Label34Text"] = L["You will be able to learn"],
	["TradeskillInfo_Label35Text"] = L["An alt will be able to learn"],
	["TradeskillInfo_Label36Text"] = L["Unavailable or already known"],
	["TradeskillInfo_Tab1"] = L["Tooltip"],
	["TradeskillInfo_Tab2"] = L["Tradeskill"],
	["TradeskillInfo_Tab3"] = "UI",
	["TradeskillInfo_Tab4"] = L["Auction"],
	["TradeskillInfo_OkButton"] = L["OK"],
	["TradeskillInfoConfig_Title"] = L["Tradeskill Info Config"],
}
TradeskillInfo.options.Sliders = {
	[L["UI Scale"]] = { index=1, tooltipText=L["Change scale of user interface"], min=0.5, max=2, step=0.05, var="UIScale" },
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
	
	--Sliders
	for key, value in pairs(self.options.Sliders) do
		local name = "TradeskillInfo_Slider"..value.index
		option = getglobal(name)
		option.var = value.var
		getglobal(name .. "Text"):SetText(key)
		getglobal(name .. "High"):SetText(string.format("%.2f", value.max))
		getglobal(name .. "Low"):SetText(string.format("%.2f", value.min))
		option:SetMinMaxValues(value.min, value.max)
		option:SetValueStep(value.step)
		option:SetValue(self.db.profile[value.var])
		if (value.tooltipText) then
				option.tooltipText = value.tooltipText
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

function TradeskillInfo:OptionsSliderValueChanged()	
	self.db.profile[this.var] = this:GetValue()
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

