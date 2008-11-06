-- $Revision: 57445 $
if GetLocale() ~= 'zhCN' then return end;

TradeskillInfo.options = {};
TradeskillInfo.options.CheckBoxes = {
	["来源"] = { index=1, tooltipText="在鼠标提示中显示物品来源", var="TooltipSource"},
	["用途"] = { index=2, tooltipText="在鼠标提示中显示物品用途", var="TooltipUsedIn"},
	["可用"] = { index=3, tooltipText="在鼠标提示中显示哪些人可使用指定的物品", var="TooltipUsableBy"},
	["库存"] = { index=4, tooltipText="在鼠标提示中显示在银行的物品库存数量 (需配合CharacterInfoStorage)", var="TooltipBankedAmount"},
	["玩家其它人物库存"] = { index=8, tooltipText="在鼠标提示中显示其它人物银行的物品库存数量 (需配合CharacterInfoStorage)", var="TooltipAltAmount"},
	["物品ID"] = { index=9, tooltipText="在鼠标提示中显示物品ID", var="TooltipID"},
	["叠堆数量"] = { index=10, tooltipText="在鼠标提示中显示物品的叠堆最大数量" , var="TooltipStack"},
	-- Recipe Tooltip
	["配方来源"] = { index=13, tooltipText="在鼠标提示中显示配方的来源", var="TooltipRecipeSource"},
	["配方售价"] = { index=14, tooltipText="在鼠标提示中显示配方的售价", var="TooltipRecipePrice"},
	["已经学会"] = { index=5, tooltipText="在鼠标提示中显示哪些人已经学会指定的配方", var="TooltipKnownBy"},
	["现在可学"] = { index=6, tooltipText="在鼠标提示中显示哪些人现在可以学习指定的配方", var="TooltipLearnableBy"},
	["未来可学"] = { index=7, tooltipText="在鼠标提示中显示哪些人未来可以学习指定的配方", var="TooltipAvailableTo"},
	-- Tradeskill/Craft Frame
	["制造等级"] = { index=11, tooltipText="显示制造需要的技能等级", var="ShowSkillLevel"},
	["制造成本"] = { index=12, tooltipText="显示制造成本", var="ShowSkillProfit"},
	-- Trainer
	["配方材料"] = { index=15, tooltipText="在鼠标提示中显示配方需要的材料", var="TrainerReagents"},
	-- QuickSearch
	-- TradeSkillInfoUI
	["快速查询"] = { index=21, tooltipText="启用快速查找", var="QuickSearch"},
	["储存窗口位置"] = { index=22, tooltipText="记住专业技能资料库的界面位置", var="SavePosition"},
	-- AH
	["配方着色"] = { index=31, tooltipText="为拍卖行的配方着色", var="ColorAHRecipes"},
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
	["鼠标按键"] = { index=1, tooltipText="快速查找使用的鼠标按键", table={"左键","右键"}, var="SearchMouseButton" },
	["辅助按键"] = { index=2, tooltipText="快速查找使用的辅助按键", table={"Shift","Control","Alt"}, var="SearchShiftKey" },
	["窗口优先度"] = { index=3, tooltipText="设定窗口的优先级", table={"低","中","高"}, var="FrameStrata" },
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
	["TradeskillInfo_Label3Text"] = "技能窗口",
	["TradeskillInfo_Label4Text"] = "训练师窗口",
	["TradeskillInfo_Label5Text"] = "快速查询",
	["TradeskillInfo_Label6Text"] = "拍卖场",
	["TradeskillInfo_Label32Text"] = "现在可学",
	["TradeskillInfo_Label33Text"] = "其它人物现在可学",
	["TradeskillInfo_Label34Text"] = "将来可学",
	["TradeskillInfo_Label35Text"] = "其它人物将来可学",
	["TradeskillInfo_Label36Text"] = "已经学会或不可学",
	["TradeskillInfo_Tab1"] = "提示",
	["TradeskillInfo_Tab2"] = "商业技能",
	["TradeskillInfo_Tab3"] = "UI",
	["TradeskillInfo_Tab4"] = "拍卖",
	["TradeskillInfo_OkButton"] = "确定",
	["TradeskillInfoConfig_Title"] = "专业技能资料库设定",
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

