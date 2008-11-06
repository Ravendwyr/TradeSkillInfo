-- $Revision: 70018 $
if GetLocale() ~= 'zhTW' then return end;

TradeskillInfo.options = {};
TradeskillInfo.options.CheckBoxes = {
	-- Item Tooltip
	["來源"] = { index=1, tooltipText="在滑鼠提示中顯示物品來源", var="TooltipSource"},
	["用途"] = { index=2, tooltipText="在滑鼠提示中顯示物品用途", var="TooltipUsedIn"},
	["可用"] = { index=3, tooltipText="在滑鼠提示中顯示哪些人可使用指定的物品", var="TooltipUsableBy"},
	["庫存"] = { index=4, tooltipText="在滑鼠提示中顯示在銀行的物品庫存數量 (需配合 CharacterInfoStorage)", var="TooltipBankedAmount"},
	["玩家其它人物庫存"] = { index=8, tooltipText="在滑鼠提示中顯示其它人物銀行的物品庫存數量 (需配合 CharacterInfoStorage)", var="TooltipAltAmount"},
	["物品ID"] = { index=9, tooltipText="在滑鼠提示中顯示物品 ID", var="TooltipID"},
	["疊堆數量"] = { index=10, tooltipText="在滑鼠提示中顯示物品的疊堆最大數量" , var="TooltipStack"},
	-- Recipe Tooltip
	["配方來源"] = { index=13, tooltipText="在滑鼠提示中顯示配方的來源", var="TooltipRecipeSource"},
	["配方售價"] = { index=14, tooltipText="在滑鼠提示中顯示配方的售價", var="TooltipRecipePrice"},
	["已經學會"] = { index=5, tooltipText="在滑鼠提示中顯示哪些人已經學會指定的配方", var="TooltipKnownBy"},
	["現在可學"] = { index=6, tooltipText="在滑鼠提示中顯示哪些人現在可以學習指定的配方", var="TooltipLearnableBy"},
	["未來可學"] = { index=7, tooltipText="在滑鼠提示中顯示哪些人未來可以學習指定的配方", var="TooltipAvailableTo"},
	-- Tradeskill/Craft Frame
	["製造等級"] = { index=11, tooltipText="顯示製造需要的技能等級", var="ShowSkillLevel"},
	["製造成本"] = { index=12, tooltipText="顯示製造成本", var="ShowSkillProfit"},
	-- Trainer
	["配方材料"] = { index=15, tooltipText="在滑鼠提示中顯示配方需要的材料", var="TrainerReagents"},
	-- QuickSearch
	-- TradeSkillInfoUI
	["快速查詢"] = { index=21, tooltipText="啟用快速查找", var="QuickSearch"},
	["儲存視窗位置"] = { index=22, tooltipText="記住專業技能資料庫的界面位置", var="SavePosition"},
	-- AH
	["配方著色"] = { index=31, tooltipText="為拍賣行的配方著色", var="ColorAHRecipes"},
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
	["滑鼠按鍵"] = { index=1, tooltipText="快速查找使用的滑鼠按鍵", table={"左鍵","右鍵"}, var="SearchMouseButton" },
	["輔助按鍵"] = { index=2, tooltipText="快速查找使用的輔助按鍵", table={"Shift","Control","Alt"}, var="SearchShiftKey" },
	["視窗優先度"] = { index=3, tooltipText="設定視窗的優先級", table={"低","中","高"}, var="FrameStrata" },
}
TradeskillInfo.options.Frames = {
	["TradeskillInfo_Tab1"] = "TradeskillInfoConfig_Sub1Frame",
	["TradeskillInfo_Tab2"] = "TradeskillInfoConfig_Sub2Frame",
	["TradeskillInfo_Tab3"] = "TradeskillInfoConfig_Sub3Frame",
	["TradeskillInfo_Tab4"] = "TradeskillInfoConfig_Sub4Frame",
}
TradeskillInfo.options.Labels = {
	["TradeskillInfo_Label1Text"] = "物品提示",
	["TradeskillInfo_Label2Text"] = "配方提示",
	["TradeskillInfo_Label3Text"] = "技能視窗",
	["TradeskillInfo_Label4Text"] = "訓練師視窗",
	["TradeskillInfo_Label5Text"] = "快速查詢",
	["TradeskillInfo_Label6Text"] = "拍賣場",
	["TradeskillInfo_Label32Text"] = "現在可學",
	["TradeskillInfo_Label33Text"] = "其它人物現在可學",
	["TradeskillInfo_Label34Text"] = "將來可學",
	["TradeskillInfo_Label35Text"] = "其它人物將來可學",
	["TradeskillInfo_Label36Text"] = "已經學會或不可學",
	["TradeskillInfo_Tab1"] = "提示",
	["TradeskillInfo_Tab2"] = "商業技能",
	["TradeskillInfo_Tab3"] = "UI",
	["TradeskillInfo_Tab4"] = "拍賣",
	["TradeskillInfo_OkButton"] = "確定",
	["TradeskillInfoConfig_Title"] = "專業技能資料庫設定",
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
			PanelTemplates_TabResize(-17, tab);
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
			UIDropDownMenu_SetText(value.table[getvalue], option1);
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
				info.func = function(x) self:DropDown_OnClick(x) end;
				info.arg1 = value.index;
				UIDropDownMenu_AddButton(info);
			end
			break;
		end
	end
end

---------------------
-- Dropdown Onclick
function TradeskillInfo:DropDown_OnClick(list)
	local ddl = getglobal("TradeskillInfo_Selection"..list);
	UIDropDownMenu_SetSelectedID(ddl, this:GetID());
--	if (ddl.SCTTable) then
--		self.db.profile[SCT.FRAMES_DATA_TABLE][ddl.SCTTable][ddl.SCTVar] = this:GetID();
--	else
		self.db.profile[ddl.var] = this:GetID();
--	end
end


