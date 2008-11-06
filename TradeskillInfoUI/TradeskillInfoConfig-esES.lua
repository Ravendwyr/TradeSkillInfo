-- $Revision: 72793 $
if GetLocale() ~= 'esES' then return end;

TradeskillInfo.options = {};
TradeskillInfo.options.CheckBoxes = {
	-- Item Tooltip
	["Fuente"] = { index=1, tooltipText="Muestra la fuente en el tooltip", var="TooltipSource"},
	["Utilizado en"] = { index=2, tooltipText="Muestra donde se utiliza en el tooltip", var="TooltipUsedIn"},
	["Utilizado por"] = { index=3, tooltipText="Muestra quien puede utilizar un elemento", var="TooltipUsableBy"},
	["Banco"] = { index=4, tooltipText="Muestra cuantos tienes en el banco (Req CharacterInfoStorage)", var="TooltipBankedAmount"},
	["Cantidad Alt"] = { index=8, tooltipText="Muestra cuantos tienes en el alt's  (Req CharacterInfoStorage)", var="TooltipAltAmount"},
	["Objeto ID"] = { index=9, tooltipText="Muestra el ID del objeto en el tooltip", var="TooltipID"},
	["Tamaño Pila"] = { index=10, tooltipText="Muestra el tamaño de la pila del elemento en el tooltip" , var="TooltipStack"},
	-- Recipe Tooltip
	["Fuente Receta"] = { index=13, tooltipText="Muestra la fuente en el tooltip", var="TooltipRecipeSource"},
	["Precio Receta"] = { index=14, tooltipText="Muestra el precio de venta del vendedor en el tooltip", var="TooltipRecipePrice"},
	["Aprendido"] = { index=5, tooltipText="Muestra si está aprendida la receta en el tooltip", var="TooltipKnownBy"},
	["Puede aprenderlo"] = { index=6, tooltipText="Muestra si puede aprender la receta en el tooltip", var="TooltipLearnableBy"},
	["Podrá aprenderlo"] = { index=7, tooltipText="Muestra si será capaz de aprender la receta en el tooltip", var="TooltipAvailableTo"},
	-- Tradeskill/Craft Frame
	["Habilidad necesaria"] = { index=11, tooltipText="Muestra habilidades necesarias", var="ShowSkillLevel"},
	["Coste Combinado"] = { index=12, tooltipText="Muestra el coste combinado", var="ShowSkillProfit"},
	-- Trainer
	["Reactivos Entrenador"] = { index=15, tooltipText="Muestra los reactivos de la receta en el tooltip del entrenador", var="TrainerReagents"},
	-- QuickSearch
	-- TradeSkillInfoUI
	["Búsqueda Rápida"] = { index=21, tooltipText="Activa la Búsqueda Rápida", var="QuickSearch"},
	["Guardar Posición Marco"] = { index=22, tooltipText="Recuerda la posición del marco del TradeskillInfoUI", var="SavePosition"},
	-- AH
	["Color Recetas"] = { index=31, tooltipText="Recetas de colores en la Casa de Subastas", var="ColorAHRecipes"},
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
	["Buscar con Botón Ratón"] = { index=1, tooltipText="El botón del ratón hace una búsqueda rápida", table={"Boton Izquierdo","Boton Derecho"}, var="SearchMouseButton" },
	["Buscar con Tecla Shift"] = { index=2, tooltipText="Presionar la tecla shift para hace una búsqueda rápida", table={"Shift","Control","Alt"}, var="SearchShiftKey" },
	["Estrato del Marco"] = { index=3, tooltipText="Establece el estrato del marco del TradeskillInfoUI", table={"BAJO","MEDIO","ALTO"}, var="FrameStrata" },
}
TradeskillInfo.options.Frames = {
	["TradeskillInfo_Tab1"] = "TradeskillInfoConfig_Sub1Frame",
	["TradeskillInfo_Tab2"] = "TradeskillInfoConfig_Sub2Frame",
	["TradeskillInfo_Tab3"] = "TradeskillInfoConfig_Sub3Frame",
	["TradeskillInfo_Tab4"] = "TradeskillInfoConfig_Sub4Frame",
}
TradeskillInfo.options.Labels = {
	["TradeskillInfo_Label1Text"] = "Tooltip Elemento",
	["TradeskillInfo_Label2Text"] = "Tooltip Receta",
	["TradeskillInfo_Label3Text"] = "Marco de Habilidades de Comercio",
	["TradeskillInfo_Label4Text"] = "Marco de Entrenador",
	["TradeskillInfo_Label5Text"] = "Búsqueda Rápida",
	["TradeskillInfo_Label6Text"] = "Casa de Subastas",
	["TradeskillInfo_Label32Text"] = "Puede Aprenderlo",
	["TradeskillInfo_Label33Text"] = "El jugador puede aprenderlo",
	["TradeskillInfo_Label34Text"] = "Podrá aprenderlo",
	["TradeskillInfo_Label35Text"] = "El jugador podrá aprenderlo",
	["TradeskillInfo_Label36Text"] = "No disponible o ya aprendido",
	["TradeskillInfo_Tab1"] = "Tooltip",
	["TradeskillInfo_Tab2"] = "Habilidades de Comercio",
	["TradeskillInfo_Tab3"] = "UI",
	["TradeskillInfo_Tab4"] = "Subasta",
	["TradeskillInfo_OkButton"] = "OK",
	["TradeskillInfoConfig_Title"] = "Configuración de Tradeskill Info",
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

