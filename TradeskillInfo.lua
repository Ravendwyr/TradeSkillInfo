TradeskillInfo = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceDB-2.0", "AceConsole-2.0", "AceHook-2.1", "FuBarPlugin-2.0")
TradeskillInfo.version = "1.0." .. string.sub("$Revision$", 12, -3);
TradeskillInfo.date = string.sub("$Date$", 8, 17);
TradeskillInfo:RegisterDB("TradeskillInfoDB")

local TradeskillInfo_Cosmos_Name_Text	 	= "TradeskillInfo";
local TradeskillInfo_Cosmos_Tooltip_Text 	= "Complete Tradeskill Info";
local TradeskillInfo_Source_Text		= "Source";
local TradeskillInfo_Vendorprice_Text		= "Vendor sell price";
local TradeskillInfo_ItemID_Text		= "ItemID";
local TradeskillInfo_Stacksize_Text		= "Stack size";
local TradeskillInfo_CombineProfit_MText	= "Combine profit";
local TradeskillInfo_CombineProfit_Desc_MText	= "Show cost of combine and profit";
local TradeskillInfo_CombineLevel_MText		= "Combine level";
local TradeskillInfo_CombineLevel_Desc_MText	= "Show skill level of the combines";
local TradeskillInfo_Source_MText		= "Source";
local TradeskillInfo_Source_Desc_MText		= "Show the source of the item";
local TradeskillInfo_UsedIn_MText		= "Used In";
local TradeskillInfo_UsedIn_Desc_MText		= "Show what tradeskill an item is used in in it\'s tooltip";
local TradeskillInfo_UsableBy_MText		= "Usable By";
local TradeskillInfo_UsableBy_Desc_MText	= "Show who can use an item in it\'s tooltip";
local TradeskillInfo_KnownBy_MText		= "Known By";
local TradeskillInfo_KnownBy_Desc_MText		= "Show who knows a recipe in it\'s tooltip";
local TradeskillInfo_LearnableBy_MText		= "Learnable By";
local TradeskillInfo_LearnableBy_Desc_MText	= "Show who can learn a recipe in it\'s tooltip";
local TradeskillInfo_WillBeAbleToLearn_MText	= "Will be able to learn";
local TradeskillInfo_WillBeAbleToLearn_Desc_MText = "Show who will be able to learn a recipe in it\'s tooltip";
local TradeskillInfo_Reagents_MText		= "Reagents";
local TradeskillInfo_Reagents_Desc_MText	= "Show what reagents a recipe takes at the trainer";
local TradeskillInfo_Config_MText		= "Config";
local TradeskillInfo_Config_Desc_MText		= "Show config screen";
local TradeskillInfo_Menu_MText			= "Menu";
local TradeskillInfo_Menu_Desc_MText		= "Show TradeskillInfo UI";
local TradeskillInfo_Banked_Text		= "Banked";
local TradeskillInfo_AltsHave_Text		= "Alts have";
local TradeskillInfo_ToggleGUI_Text		= "Toggle GUI";
local TradeskillInfo_ToggleGUI_Desc_Text	= "Toggle the TradeskillInfo GUI";
local TradeskillInfo_Options_Text		= "Options";
local TradeskillInfo_Options_Desc_Text		= "Toggle the TradeskillInfo Options Screen";
local TradeskillInfo_FoundUnknownSkill_Text	= "Found unknown skill";
local TradeskillInfo_FoundUnknownSource_Text	= "Found unknown source";
local TradeskillInfo_UnknownSource_Text		= "Unknown source. Please report it. Source=";
local TradeskillInfo_UnknownNPC_Text		= "Unknown NPC. Please report it. Source=";
local TradeskillInfo_CouldNotLoadUI_Text	= "Could not load the UI. Reason: ";
local TradeskillInfo_Search_Text		= "Search";

if GetLocale() == 'zhCN' then
	TradeskillInfo_Cosmos_Name_Text			= "商业技能百科";
	TradeskillInfo_Cosmos_Tooltip_Text		= "完整的商业技能百科资讯";
	TradeskillInfo_Source_Text			= "来源: ";
	TradeskillInfo_Vendorprice_Text			= "商人售价: ";
	TradeskillInfo_UsableBy_MText			= "可用: ";
	TradeskillInfo_ItemID_Text			= "物品ID: ";
	TradeskillInfo_Stacksize_Text			= "堆积: ";
	TradeskillInfo_CombineProfit_MText		= "制造成本";
	TradeskillInfo_CombineProfit_Desc_MText		= "显示制造成本和获利";
	TradeskillInfo_CombineLevel_MText		= "制造等级";
	TradeskillInfo_CombineLevel_Desc_MText		= "显示制造所需的技能等级";
	TradeskillInfo_Source_MText			= "来源";
	TradeskillInfo_Source_Desc_MText		= "显示物品的来源";
	TradeskillInfo_UsedIn_MText			= "用途";
	TradeskillInfo_UsedIn_Desc_MText		= "在物品的提示显示用於哪些商业技能";
	TradeskillInfo_UsableBy_MText			= "可用";
	TradeskillInfo_UsableBy_Desc_MText		= "在物品的提示中显示哪些角色可使用";
	TradeskillInfo_KnownBy_MText			= "已学";
	TradeskillInfo_KnownBy_Desc_MText		= "在配方的提示中显示哪些角色已经学会";
	TradeskillInfo_LearnableBy_MText		= "可学";
	TradeskillInfo_LearnableBy_Desc_MText		= "在配方的提示中显示哪些角色现在可以学习";
	TradeskillInfo_WillBeAbleToLearn_MText		= "将来可学";
	TradeskillInfo_WillBeAbleToLearn_Desc_MText	= "在配方的提示中显示哪些角色将来可以学习";
	TradeskillInfo_Reagents_MText			= "材料";
	TradeskillInfo_Reagents_Desc_MText		= "在训练师那显示配方需要的材料";
	TradeskillInfo_Config_MText			= "设定";
	TradeskillInfo_Config_Desc_MText		= "显示设定画面";
	TradeskillInfo_Menu_MText			= "浏览";
	TradeskillInfo_Menu_Desc_MText			= "显示商业技能百科浏览器";
	TradeskillInfo_Banked_Text			= "银行: ";
	TradeskillInfo_AltsHave_Text			= "其他角色拥有: ";
	TradeskillInfo_ToggleGUI_Text			= "开关介面";
	TradeskillInfo_ToggleGUI_Desc_Text		= "开关商业技能百科的介面";
	TradeskillInfo_Options_Text			= "设定";
	TradeskillInfo_Options_Desc_Text		= "开关商业技能百科的设定画面";
	TradeskillInfo_FoundUnknownSkill_Text		= "发现未知技能";
	TradeskillInfo_FoundUnknownSource_Text		= "发现未知来源";
	TradeskillInfo_UnknownSource_Text		= "未知来源。请回报它。来源 =";
	TradeskillInfo_UnknownNPC_Text			= "未知NPC。请回报它。来源 =";
	TradeskillInfo_CouldNotLoadUI_Text		= "无法载入UI。理由: ";
	TradeskillInfo_Search_Text			= "搜寻";
elseif GetLocale() == 'zhTW' then
	TradeskillInfo_Cosmos_Name_Text			= "商業技能百科";
	TradeskillInfo_Cosmos_Tooltip_Text		= "完整的商業技能百科資訊";
	TradeskillInfo_Source_Text			= "來源: ";
	TradeskillInfo_Vendorprice_Text			= "商人售價: ";
	TradeskillInfo_ItemID_Text			= "物品ID: ";
	TradeskillInfo_Stacksize_Text			= "堆積: ";
	TradeskillInfo_CombineProfit_MText		= "製造成本";
	TradeskillInfo_CombineProfit_Desc_MText		= "顯示製造成本和獲利";
	TradeskillInfo_CombineLevel_MText		= "製造等級";
	TradeskillInfo_CombineLevel_Desc_MText		= "顯示製造所需的技能等級";
	TradeskillInfo_Source_MText			= "來源";
	TradeskillInfo_Source_Desc_MText		= "顯示物品的來源";
	TradeskillInfo_UsedIn_MText			= "用途";
	TradeskillInfo_UsedIn_Desc_MText		= "在物品的提示顯示用於哪些商業技能";
	TradeskillInfo_UsableBy_MText			= "可用";
	TradeskillInfo_UsableBy_Desc_MText		= "在物品的提示中顯示哪些角色可使用";
	TradeskillInfo_KnownBy_MText			= "已學";
	TradeskillInfo_KnownBy_Desc_MText		= "在配方的提示中顯示哪些角色已經學會";
	TradeskillInfo_LearnableBy_MText		= "可學";
	TradeskillInfo_LearnableBy_Desc_MText		= "在配方的提示中顯示哪些角色現在可以學習";
	TradeskillInfo_WillBeAbleToLearn_MText		= "將來可學";
	TradeskillInfo_WillBeAbleToLearn_Desc_MText	= "在配方的提示中顯示哪些角色將來可以學習";
	TradeskillInfo_Reagents_MText			= "材料";
	TradeskillInfo_Reagents_Desc_MText		= "在訓練師那顯示配方需要的材料";
	TradeskillInfo_Config_MText			= "設定";
	TradeskillInfo_Config_Desc_MText		= "顯示設定畫面";
	TradeskillInfo_Menu_MText			= "瀏覽";
	TradeskillInfo_Menu_Desc_MText			= "顯示商業技能百科瀏覽器";
	TradeskillInfo_Banked_Text			= "銀行: ";
	TradeskillInfo_AltsHave_Text			= "其他角色擁有: ";
	TradeskillInfo_ToggleGUI_Text			= "開關介面";
	TradeskillInfo_ToggleGUI_Desc_Text		= "開關商業技能百科的介面";
	TradeskillInfo_Options_Text			= "設定";
	TradeskillInfo_Options_Desc_Text		= "開關商業技能百科的設定畫面";
	TradeskillInfo_FoundUnknownSkill_Text		= "發現未知技能";
	TradeskillInfo_FoundUnknownSource_Text		= "發現未知來源";
	TradeskillInfo_UnknownSource_Text		= "未知來源。請回報它。來源 =";
	TradeskillInfo_UnknownNPC_Text			= "未知NPC。請回報它。來源 =";
	TradeskillInfo_CouldNotLoadUI_Text		= "無法載入UI。理由: ";
	TradeskillInfo_Search_Text			= "搜尋";
elseif GetLocale() == 'deDE' then
	TradeskillInfo_Cosmos_Name_Text		= "TradeskillInfo";
	TradeskillInfo_Cosmos_Tooltip_Text  = "vollst\195\164ndige Datenbank der Berufsrezepte";
	TradeskillInfo_Source_Text 			= "Quelle: ";
	TradeskillInfo_Vendorprice_Text		= "Verkaufspreis: ";
	TradeskillInfo_UsedIn_MText			= "benutzt f\195\188r: ";
	TradeskillInfo_UsableBy_MText 		= "benutzbar von: ";
	TradeskillInfo_ItemID_Text 			= "ItemID: ";
	TradeskillInfo_Stacksize_Text  		= "Stapelgr\195\182\195\159e: ";
elseif GetLocale() == 'esES' then
	TradeskillInfo_Cosmos_Name_Text	 	= "Info Habilidad de Comercio (TradeskillInfo)";
	TradeskillInfo_Cosmos_Tooltip_Text 	= "Información Completa de Habilidad de Comercio";
	TradeskillInfo_Source_Text		= "Fuente";
	TradeskillInfo_Vendorprice_Text	 	= "Precio venta del vendedor";
	TradeskillInfo_ItemID_Text		= "ID del Objeto";
	TradeskillInfo_Stacksize_Text		= "Tamaño de la Pila";
	TradeskillInfo_CombineProfit_MText	= "Combinar beneficios";
	TradeskillInfo_CombineProfit_Desc_MText	= "Muestra coste de combinar y beneficios";
	TradeskillInfo_CombineLevel_MText	= "Nivel de combinar";
	TradeskillInfo_CombineLevel_Desc_MText	= "Muestra nivel de la habilidad a combinar";
	TradeskillInfo_Source_MText		= "Fuente";
	TradeskillInfo_Source_Desc_MText	= "Muestra la fuente del elemento";
	TradeskillInfo_UsedIn_MText		= "Utilizado En";
	TradeskillInfo_UsedIn_Desc_MText	= "Muestra en el tooltip en que Habilidades de Comercio es utilizado el elemento";
	TradeskillInfo_UsableBy_MText		= "Utilizable Por";
	TradeskillInfo_UsableBy_Desc_MText	= "Muestra en el tooltip quien puede utilizar este elemento";
	TradeskillInfo_KnownBy_MText		= "Aprendido Por";
	TradeskillInfo_KnownBy_Desc_MText	= "Muestra en el tooltip quien conoce esa receta";
	TradeskillInfo_LearnableBy_MText	= "Puede Aprenderlo";
	TradeskillInfo_LearnableBy_Desc_MText	= "Muestra en el tooltip quien puede aprender una receta";
	TradeskillInfo_WillBeAbleToLearn_MText	= "Podrá Aprenderlo";
	TradeskillInfo_WillBeAbleToLearn_Desc_MText = "Muestra en el tooltip quien podrá aprender una receta";
	TradeskillInfo_Reagents_MText		= "Reactivos";
	TradeskillInfo_Reagents_Desc_MText	= "Muestra que reactivos necesita del entrenador una receta";
	TradeskillInfo_Config_MText		= "Configurar";
	TradeskillInfo_Config_Desc_MText	= "Muestra la ventana de configuración";
	TradeskillInfo_Menu_MText		= "Menu";
	TradeskillInfo_Menu_Desc_MText		= "Muestra el UI de TradeSkillInfo";
	TradeskillInfo_Banked_Text		= "En el Banco";
	TradeskillInfo_AltsHave_Text		= "Tiene Alts";
	TradeskillInfo_ToggleGUI_Text		= "Alternar GUI";
	TradeskillInfo_ToggleGUI_Desc_Text	= "Alternar el GUI de TradeSkillInfo";
	TradeskillInfo_Options_Text		= "Opciones";
	TradeskillInfo_Options_Desc_Text	= "Alternar ventana de opciones de TradeSkillInfo";
	TradeskillInfo_FoundUnknownSkill_Text	= "Encontrada Habilidad Desconocida";
	TradeskillInfo_FoundUnknownSource_Text	= "Encontrada Fuente Desconocida";
	TradeskillInfo_UnknownSource_Text	= "Fuente Desconocida. Por favor, informa sobre esto. Fuente=";
	TradeskillInfo_UnknownNPC_Text		= "NPC Desconocido. Por favor, informa sobre esto. Fuente=";
	TradeskillInfo_CouldNotLoadUI_Text	= "No se pudo cargar el UI. Razón: ";
	TradeskillInfo_Search_Text		= "Buscar";
end

TradeskillInfo:RegisterDefaults('profile', {
	ShowSkillLevel = true,
	ShowSkillProfit = true,
	MoneyFormat = 3,
	TooltipSource = true,
	TooltipRecipeSource = true,
	TooltipRecipePrice = true,
	TooltipUsedIn = true,
	TooltipUsableBy = true,
	TooltipKnownBy = true,
	TooltipLearnableBy = true,
	TooltipAvailableTo = true,
	TooltipBankedAmount = true,
	TooltipAltAmount = true,
	TooltipID = false,
	TooltipStack = false,
	TrainerReagents = true,
	ColorSource = { r=0.75, g=0.75, b=0.25 },
	ColorRecipeSource = { r=0.75, g=0.75, b=0.25 },
	ColorRecipePrice = { r=1.0, g=1.0, b=1.0 },
	ColorUsedIn = { r=1.0, g=1.0, b=1.0 },
	ColorUsableBy = { r=1.0, g=1.0, b=1.0 },
	ColorKnownBy = { r=1.0, g=0.0, b=0.0 },
	ColorLearnableBy = { r=0.25, g=0.75, b=0.25 },
	ColorAvailableTo = { r=1.0, g=0.50, b=0.25 },
	ColorBankedAmount = { r=0.5, g=0.6, b=0.7 },
	ColorAltAmount = { r=0.5, g=0.6, b=0.7 },
	ColorTrainerReagents = { r=1.0, g=1.0, b=1.0 },
	ColorID = { r=0.75, g=0.5, b=0.5 },
	ColorStack = { r=1.0, g=1.0, b=1.0 },
	QuickSearch = true,
	SearchMouseButton = 2,
	SearchShiftKey = 1,
	ColorAHRecipes = true,
	AHColorLearnable = { r=1.0, g=1.0, b=1.0 },
	AHColorAltLearnable = { r=0.1, g=1.0, b=0.1 },
	AHColorWillLearn = { r=1.0, g=0.75, b=0.1 },
	AHColorAltWillLearn = { r=0.1, g=0.75, b=1.0 },
	AHColorUnavailable = { r=1.0, g=0.1, b=0.1 },
	SavePosition = true,
	FrameStrata = 1,
})

TradeskillInfo:RegisterDefaults('realm', {
	userdata = {}, -- Stores all known characters
--	userdata[playername].knownRecipes = {}, -- Stores all characters know recipes with difficulty
--	userdata[playername].skills = {}, -- Stores all characters skill level for tradeskills.
})
TradeskillInfo:RegisterDefaults('account', {
	difficulty = {}, -- Stores at what level difficulty is changed for all recipes.
})

BINDING_HEADER_TRADESKILLINFO = "Tradeskill Info";
BINDING_NAME_TOGGLE_TRADESKILLINFO = "Toggle Tradeskill Info Window";
BINDING_NAME_TOGGLE_TRADESKILLINFOCONFIG = "Toggle Tradeskill Info Config Window";

TradeskillInfo.vars = {};
TradeskillInfo.vars.MouseButtons = { "LeftButton", "RightButton" };
TradeskillInfo.vars.ShiftKeys = { IsShiftKeyDown, IsControlKeyDown, IsAltKeyDown };
TradeskillInfo.libs = {};
TradeskillInfo.libs.Abacus = Rock("LibAbacus-3.0");

local function getIdFromLink(link)
  if not link then return end
--  local _,_,id,name = strfind(link,"|Hitem:(%d+):.+%[(.+)%]")
  local _,_,id = strfind(link,"item:(%d+):")
  if not id then
--  	local _,_,id,name = strfind(link,"|Henchant:(%d+)|h%[(.+)%]")
  	local _,_,id = strfind(link,"enchant:(%d+)")
  	if id then return -tonumber(id) end
	else
		return tonumber(id)
	end
end

local function getNameFromLink(link)
	if not link then return end
  local _,_,name = strfind(link,"|Hitem:.+%[(.+)%]")
	return name
end

local function getItemLink(id,combineName)
	if id > 0 then
		local itemName,itemLink,itemQuality,itemTexture
		itemName,itemLink,itemQuality,_,_,_,_,_,_,itemTexture = GetItemInfo(id);
		if itemLink then
			local _, _, _, hexColor = GetItemQualityColor(itemQuality);
			return itemLink, itemQuality, "item:"..id..":0:0:0:0:0:0:0", itemTexture;
		else
			local _, _, _, hexColor = GetItemQualityColor(1);
			return nil, 1, "item:"..id..":0:0:0:0:0:0:0", "Interface\\Icons\\INV_Misc_QuestionMark.blp";
		end
	else
		if combineName then
			local _, _, _, hexColor = GetItemQualityColor(1);
			return hexColor.."|Henchant:"..-id.."|h["..combineName.."]|h|r", 1, "enchant:"..-id, "Interface\\Icons\\Spell_Holy_GreaterHeal.blp"
		else
			return nil, 1, "enchant:"..-id, "Interface\\Icons\\Spell_Holy_GreaterHeal.blp"
		end
	end
end

-- Splits a partioned string into a table with numbers
local function splitn(s,c)
	local r = {};
	for m,n in string.gmatch(s,"(%d+)(%"..c.."?)") do
		table.insert(r,tonumber(m))
		if n == '' then break end
	end
	return r;
end

-- Splits a partioned string into a table with strings
local function splits(s,c)
	local r = {};
	for m,n in string.gmatch(s,"([^"..c.."]*)(%"..c.."?)") do
		table.insert(r,m)
		if n == '' then break end
	end
	return r;
end

-- Combines a table into a partioned string
local function ICombineTable(t,c)
	local s = "";
	for i,d in ipairs(t) do
		if i == 1 then
			s = s .. d;
		else
			s = s .. c .. d;
		end
	end
	return s;
end

-- Combines a table into a partioned string
local function CombineTable(t,c)
	local s = "";
	for i,d in pairs(t) do
		if s == "" then
			s = s .. i .. d;
		else
			s = s .. c .. i .. d;
		end
	end
	return s;
end

function TradeskillInfo:OnInitialize()
	self:BuildWhereUsed();
--	self:BuildRecipeTable();
	self:RegisterChatCommand({"/TradeskillInfo", "/tsi"}, {
		desc = TradeskillInfo_Cosmos_Tooltip_Text,
		handler = TradeskillInfo,
		type = 'group',
		args = {
			profit = {
				name = TradeskillInfo_CombineProfit_MText,
				desc = TradeskillInfo_CombineProfit_Desc_MText,
				type = 'toggle',
				get = function() return self.db.profile.ShowSkillProfit end,
				set = function(val) self.db.profile.ShowSkillProfit = val end,
			},
			level = {
				name = TradeskillInfo_CombineLevel_MText,
				desc = TradeskillInfo_CombineLevel_Desc_MText,
				type = 'toggle',
				get = function() return self.db.profile.ShowSkillLevel end,
				set = function(val) self.db.profile.ShowSkillLevel = val end,
			},
			source = {
				name = TradeskillInfo_Source_MText,
				desc = TradeskillInfo_Source_Desc_MText,
				type = 'toggle',
				get = function() return self.db.profile.TooltipSource end,
				set = function(val) self.db.profile.TooltipSource = val end,
			},
			usedin = {
				name = TradeskillInfo_UsedIn_MText,
				desc = TradeskillInfo_UsedIn_Desc_MText,
				type = 'toggle',
				get = function() return self.db.profile.TooltipUsedIn end,
				set = function(val) self.db.profile.TooltipUsedIn = val end,
			},
			useableby = {
				name = TradeskillInfo_UsableBy_MText,
				desc = TradeskillInfo_UsableBy_Desc_MText,
				type = 'toggle',
				get = function() return self.db.profile.TooltipUsableBy end,
				set = function(val) self.db.profile.TooltipUsableBy = val end,
			},
			known = {
				name = TradeskillInfo_KnownBy_MText,
				desc = TradeskillInfo_KnownBy_Desc_MText,
				type = 'toggle',
				get = function() return self.db.profile.TooltipKnownBy end,
				set = function(val) self.db.profile.TooltipKnownBy = val end,
			},
			learn = {
				name = TradeskillInfo_LearnableBy_MText,
				desc = TradeskillInfo_LearnableBy_Desc_MText,
				type = 'toggle',
				get = function() return self.db.profile.TooltipLearnableBy end,
				set = function(val) self.db.profile.TooltipLearnableBy = val end,
			},
			willbe = {
				name = TradeskillInfo_WillBeAbleToLearn_MText,
				desc = TradeskillInfo_WillBeAbleToLearn_Desc_MText,
				type = 'toggle',
				get = function() return self.db.profile.TooltipAvailableTo end,
				set = function(val) self.db.profile.TooltipAvailableTo = val end,
			},
			reagents = {
				name = TradeskillInfo_Reagents_MText,
				desc = TradeskillInfo_Reagents_Desc_MText,
				type = 'toggle',
				get = function() return self.db.profile.TrainerReagents end,
				set = function(val) self.db.profile.TrainerReagents = val end,
			},
			config = {
				name = TradeskillInfo_Config_MText,
				desc = TradeskillInfo_Config_Desc_MText,
				type = 'execute',
				func = function() TradeskillInfo:Config_Toggle() end,
			},
			menu = {
				name = TradeskillInfo_Menu_MText,
				desc = TradeskillInfo_Menu_Desc_MText,
				type = 'execute',
				func = function() TradeskillInfo:UI_Toggle() end,
			},
		},
	});
	if ( EarthFeature_AddButton ) then   --add by Isler
		EarthFeature_AddButton(
			{
				id= "TradeskillInfo";
				name= TradeskillInfo_Cosmos_Name_Text;
				subtext= "TradeskillInfo";
				tooltip = TradeskillInfo_Cosmos_Tooltip_Text;
				icon= "Interface\\Icons\\INV_Elemental_Mote_Nether";
				callback= function() TradeskillInfo:UI_Toggle() end;
			}
		);
	end
end

function TradeskillInfo:InitPlayer()
	if not self.vars.playername then
		self.vars.playername = UnitName("player");
		if not self.db.realm.userdata[self.vars.playername] then
			self.db.realm.userdata[self.vars.playername] = {};
		end
		if not self.db.realm.userdata[self.vars.playername].knownRecipes then
			self.db.realm.userdata[self.vars.playername].knownRecipes = {};
		end
		if not self.db.realm.userdata[self.vars.playername].skills then
			self.db.realm.userdata[self.vars.playername].skills = {};
		end
	end
end

function TradeskillInfo:OnEnable()
	self:InitPlayer();
	self:HookTradeSkillUI();
	self:HookCraftUI();
	self:SecureHook("ContainerFrameItemButton_OnModifiedClick");
	self:SecureHook("BankFrameItemButtonGeneric_OnModifiedClick");
	self:SecureHook("MerchantItemButton_OnModifiedClick");
	self:SecureHook("ChatFrame_OnHyperlinkShow");
	self:HookAuctionUI();
	self:RegisterEvent("AceEvent_FullyInitialized","OnFullyInitialized")
	self:RegisterEvent("TRADE_SKILL_SHOW", "OnTradeShow");
	self:RegisterEvent("SKILL_LINES_CHANGED", "OnSkillUpdate");
	self:RegisterEvent("CRAFT_SHOW", "OnCraftShow");
	self:RegisterEvent("ADDON_LOADED", "OnAddonLoaded");
	self:UpdateSkills();
	self:UpdateSpecializations();
	self:HookTooltips();
end

function TradeskillInfo:OnDisable()
end

function TradeskillInfo:OnFullyInitialized()
	self:UpdateSkills();
	self:UpdateSpecializations();
end

function TradeskillInfo:OnAddonLoaded(addon)
	if addon == "Blizzard_AuctionUI" then
		self:HookAuctionUI();
	elseif addon == "Blizzard_TradeSkillUI" then
		self:HookTradeSkillUI();
	elseif addon == "Blizzard_CraftUI" then
		self:HookCraftUI();
	end
end

function TradeskillInfo:OnTradeShow()
	self:ScheduleEvent(self.UpdateKnownRecipes,1,self);
end

function TradeskillInfo:OnTradeUpdate()
	if (GetTradeSkillLine() ~= "UNKNOWN") then
		self:ScheduleEvent(self.UpdateKnownRecipes,1,self);
	end
end

function TradeskillInfo:OnSkillUpdate()
	if (GetTradeSkillLine() ~= "UNKNOWN") or
		(GetCraftDisplaySkillLine() ~= nil) then
		self:ScheduleEvent(self.UpdateKnownRecipes,1,self);
	end
end

function TradeskillInfo:OnCraftShow()
	self:ScheduleEvent(self.UpdateKnownRecipes,1,self);
end

function TradeskillInfo:OnCraftUpdate()
	if (GetCraftDisplaySkillLine() ~= nil) then
		self:ScheduleEvent(self.UpdateKnownRecipes,1,self);
	end
end

function TradeskillInfo:HookAuctionUI()
	if AuctionFrame then
		for j=1,8 do
			local button = getglobal("BrowseButton"..j.."Item");
			self:HookScript(button,"OnClick","AuctionItemButton_OnClick");
			button:RegisterForClicks("LeftButtonUp", "RightButtonUp");
		end
		self:SecureHook("AuctionFrameBrowse_Update");
	end
--    if Auc-Advanced and not self:IsHooked(Auc-Advanced, "lib.ListUpdate")
--        self:Hook (Auc-Advanced, "lib.ListUpdate")
--    end
end

function TradeskillInfo:GetExtraItemDetailText(something, tradeskill, skill_index)
--Thanks to nogudnik for providing this code!
    local skillName, skillType, numAvailable, isExpanded = GetTradeSkillInfo(skill_index);
    if ( skillType == "header" ) then return end
    if ( skill_index > GetNumTradeSkills() ) then return end

    local link = GetTradeSkillItemLink(skill_index);
    local itemId = getIdFromLink(link)
    local text = nil

    if self:CombineExists(itemId) then
        if self:ShowingSkillProfit() then
            -- Insert item value and reagent costs
            local value,cost,profit = self:GetCombineCost(itemId);
            text = string.format("s: %s - c: %s = p: %s",
                self:GetMoneyString(value), self:GetMoneyString(cost), self:GetMoneyString(profit));
        end
        if self:ShowingSkillLevel() then
            local sep = ""
            if text then sep = "\n" else text = "" end
            text = text .. sep .. self:GetColoredDifficulty(itemId)
        end
    end

    return text
end

function TradeskillInfo:HookTradeSkillUI()
    if TradeSkillFrame and not self:IsHooked("TradeSkillFrame_SetSelection") then
        self:SecureHook("TradeSkillFrame_SetSelection");
    end

    if Skillet and not self:IsHooked(Skillet, "GetExtraItemDetailText") then
        self:Hook(Skillet, "GetExtraItemDetailText")
    end
end
function TradeskillInfo:HookCraftUI()
	if CraftFrame and not self:IsHooked("CraftFrame_SetSelection") then
		self:SecureHook("CraftFrame_SetSelection");
	end
end

function TradeskillInfo:UpdateKnownRecipes()
	if not self.processingUpdates and
		(GetTradeSkillLine() ~= "UNKNOWN") or
		(GetCraftDisplaySkillLine() ~= nil) then
		self.processingUpdates = true;

		self:UpdateSkills();
		self:UpdateSpecializations();
		self:UpdateKnownTradeRecipes();
		self:UpdateKnownCraftRecipes();
		self.processingUpdates = false;
	end
end

function TradeskillInfo:UpdateSkills(startLine, endLine)
	local numSkills = GetNumSkillLines()
	if not startLine then
		self.db.realm.userdata[self.vars.playername].skills = {};
		startLine = 1;
		endLine = numSkills;
	end
	for i = startLine, endLine do
		local skillName, isHeader, isExpanded, skillRank, numTempPoints, skillModifier = GetSkillLineInfo(i)
		if isHeader and not isExpanded then
			ExpandSkillHeader(i);
			self:UpdateSkills(i+1, i+GetNumSkillLines()-numSkills);
			CollapseSkillHeader(i);
		elseif not isHeader and self.vars.skillnames[skillName] then
			self.db.realm.userdata[self.vars.playername].skills[self.vars.skillnames[skillName]] = skillRank;
		end
	end
end

function TradeskillInfo:UpdateSpecializations()
	local i = 1
	while true do
		local spellName = GetSpellName(i, BOOKTYPE_SPELL)
		if not spellName then do break end end
		if self.vars.specializationnames[spellName] then
			self.db.realm.userdata[self.vars.playername].skills[self.vars.specializationnames[spellName]] = 1;
		end
		i = i + 1
	end
end

function TradeskillInfo:MakeSpecialCase(id,itemName)
	if not self.vars.specialcases[id] then
		return id;
	end
	local spec=tostring(id)..'|'..itemName;
	for k,v in pairs(self.vars.specialcases) do
		if v==spec then
			return k
		end
	end
	return id;
end

function TradeskillInfo:GetSpecialCase(id,itemName)
	if id > 100 or not self.vars.specialcases[id] then
		return id,itemName;
	end
	_, _, id,itemName = string.find(self.vars.specialcases[id],"(%d+)|(.+)");
	return tonumber(id),itemName;
end

function TradeskillInfo:UpdateKnownTradeRecipes(startLine, endLine)
	local skillName, currentSkillLvl, _ = GetTradeSkillLine()
	if (skillName ~= "UNKNOWN") then
		local numSkills = GetNumTradeSkills();
		if not startLine then
			startLine = 1;
			endLine= numSkills;
		end
		local i;
		for i=startLine, endLine do
			local itemName, itemType, _,	isExpanded = GetTradeSkillInfo(i);
			if (itemType == "header" and not isExpanded) then
				ExpandTradeSkillSubClass(i);
				self:UpdateKnownTradeRecipes(i+1, i+GetNumTradeSkills()-numSkills);
				CollapseTradeSkillSubClass(i);
			elseif (itemType ~= "header" and (GetTradeSkillLine() == skillName)) then
				local link = GetTradeSkillItemLink(i);
				local id = getIdFromLink(link);
				local diff = self.vars.difficulty[itemType];
				id = self:MakeSpecialCase(id,itemName);
				if id then
					self.db.realm.userdata[self.vars.playername].knownRecipes[id] = diff;
					self:UpdateDifficultyData(id, diff, currentSkillLvl);
				else
					self:Print("UpdateKnownTradeRecipes startLine=%d endLine%d line=%d name=%s type=%s link=%s",startLine,endLine,i,itemName,itemType,link);
					return;
				end
			end
		end
	end
end

function TradeskillInfo:UpdateKnownCraftRecipes(startLine, endLine)
	local skillName, currentSkillLvl, _ = GetCraftDisplaySkillLine()
	if (skillName ~= nil) then
		if skillName ~= self.vars.tradeskills['D'] then return end  -- Only enchanting supported
		local numSkills = GetNumCrafts();
		if not startLine then
			startLine = 1;
			endLine= numSkills;
		end
		for i=startLine, endLine do
			local craftName, _, craftType, _,	isExpanded = GetCraftInfo(i);
			if (craftType == "header" and not isExpanded) then
				ExpandCraftSkillLine(i);
				self:UpdateKnownCraftRecipes(i+1, i+GetNumCrafts()-numSkills);
				CollapseCraftSkillLine(i);
			elseif (craftType ~= "header" and (GetCraftDisplaySkillLine() == skillName)) then
				local link = GetCraftItemLink(i);
				local id = getIdFromLink(link);
				local diff = self.vars.difficulty[craftType];
				if self.vars.enchantItems[id] then  -- Enchants that generate items are stored by there itemid
					id = self.vars.enchantItems[id];
				end
				self.db.realm.userdata[self.vars.playername].knownRecipes[id] = diff;
				self:UpdateDifficultyData(id, diff, currentSkillLvl);
			end
		end
	end
end

function TradeskillInfo:UpdateDifficultyData(id, difficulty, currentSkillLvl)
	-- Update global difficulty
	if not self.db.account.difficulty[id] then
		self.db.account.difficulty[id] = "0/0/0/"..self:GetCombineLevel(id);
	end
	local d = splitn(self.db.account.difficulty[id],'/');
	if d[difficulty] > currentSkillLvl or d[difficulty] == 0 then
		d[difficulty] = currentSkillLvl;
	end
	self.db.account.difficulty[id] = ICombineTable(d,'/');
	d = nil;
end

----------------------------------------------------------------------
-- TradeSkillFrame Hook to display recipe skill level and cost/profit
----------------------------------------------------------------------
function TradeskillInfo:TradeSkillFrame_SetSelection(id)
	local skillName, skillType, numAvailable, isExpanded = GetTradeSkillInfo(id);
	if ( skillType == "header" ) then return end
	if ( GetTradeSkillSelectionIndex() > GetNumTradeSkills() ) then return end

	local link = GetTradeSkillItemLink(TradeSkillFrame.selectedSkill);
	local itemId = getIdFromLink(link)
	if self:CombineExists(itemId) then

		if self:ShowingSkillLevel() then
			-- Insert skill required.
			local text = "";
			if TradeSkillRequirementLabel:IsVisible() then
				text = TradeSkillRequirementText:GetText() .. ", ";
			end
			local skillLineName = GetTradeSkillLine();
--			text = text .. "skill(" .. self:GetCombineLevel(itemId) .. ")"
			text = text .. self:GetColoredDifficulty(itemId)
			TradeSkillRequirementLabel:Show();
			TradeSkillRequirementText:SetText(text);
		end

		if self:ShowingSkillProfit() then
			-- Insert item value and reagent costs
			local value,cost,profit = self:GetCombineCost(itemId);
			TradeSkillReagentLabel:SetText(string.format("%s s: %s - c: %s = p: %s", SPELL_REAGENTS,
				self:GetMoneyString(value), self:GetMoneyString(cost), self:GetMoneyString(profit)));
		else
			--TradeSkillReagentLabel:SetText(SPELL_REAGENTS);
		end

	end
end

----------------------------------------------------------------------
-- CraftFrame Hook to display recipe skill level
----------------------------------------------------------------------
function TradeskillInfo:CraftFrame_SetSelection(id)
	if not id then return end
	local craftName, craftSubSpellName, craftType, numAvailable, isExpanded, trainingPointCost, requiredLevel = GetCraftInfo(id);
	if ( craftType == "header" ) then return end
	if ( GetCraftSelectionIndex() > GetNumCrafts() ) then return end

	local link = GetCraftItemLink(GetCraftSelectionIndex());
	local enchantId = getIdFromLink(link);
	if self:CombineExists(enchantId) then

		if self:ShowingSkillLevel() then
			local text = REQUIRES_LABEL .. " ";
			if CraftRequirements:GetText() and CraftRequirements:GetText() ~= "" then
				text = CraftRequirements:GetText() .. ", ";
			end
			text = text .. "skill(" ..self:GetCombineLevel(enchantId) .. ")"
			CraftRequirements:SetText(text);
		end
	end
end

----------------------------------------------------------------------
-- OnClick hooks
----------------------------------------------------------------------
function TradeskillInfo:ContainerFrameItemButton_OnModifiedClick(button, ignoreModifiers)
	local link = GetContainerItemLink(this:GetParent():GetID(),this:GetID())
	if self:Item_OnClick(button,link) then return end
end

function TradeskillInfo:BankFrameItemButtonGeneric_OnModifiedClick(button)
	local link = GetContainerItemLink(BANK_CONTAINER,this:GetID())
	if self:Item_OnClick(button,link) then return end
end

function TradeskillInfo:MerchantItemButton_OnModifiedClick(button)
	local link = GetMerchantItemLink(this:GetID())
	if self:Item_OnClick(button,link) then return end
end

function TradeskillInfo:ChatFrame_OnHyperlinkShow(link,text,button)
	if self:Item_OnClick(button,text) then return end
end

function TradeskillInfo:AuctionItemButton_OnClick(object,button)
	local offset = FauxScrollFrame_GetOffset(BrowseScrollFrame)
	local itemID = this:GetParent():GetID()+offset
	local link = GetAuctionItemLink("list",itemID)
	if self:Item_OnClick(arg1,link) then return end
	self.hooks[object].OnClick(object,button)
end

function TradeskillInfo:Item_OnClick(button,link)
	if self.db.profile.QuickSearch then
		if ( button == self.vars.MouseButtons[self.db.profile.SearchMouseButton] and
				 self.vars.ShiftKeys[self.db.profile.SearchShiftKey]() ) then
			local id = getIdFromLink(link);
			if not self:ComponentExists(id) then return end
			if self:LoadUI(true) then -- Have TradeskillInfoUI
				local name = getNameFromLink(link);
				TradeskillInfoUI:SetSearchText("id="..id.." "..name);
				TradeskillInfoUI:Frame_Show();
			else
				self:PrintWhereUsed(id);
			end
		end
	end
end

function TradeskillInfo:GetMoneyString(value)
	if (value == nil) then
		return "|cffffcc00??|r"; -- No price
	elseif ( self.db.profile.MoneyFormat == 1 ) then
		return self.libs.Abacus:FormatMoneyCondensed(value,true,true)
	elseif ( self.db.profile.MoneyFormat == 2 ) then
		return self.libs.Abacus:FormatMoneyShort(value,true,true)
	elseif ( self.db.profile.MoneyFormat == 3 ) then
		return self.libs.Abacus:FormatMoneyFull(value,true,true)
	else
		return self.libs.Abacus:FormatMoneyExtended(value,true,true)
	end
end

----------------------------------------------------------------------
-- Combine support functions
----------------------------------------------------------------------

function TradeskillInfo:Combines()
	return pairs(self.vars.combines);
end

function TradeskillInfo:CombineExists(id)
	if id and self.vars.combines[id] then return true end
end

function TradeskillInfo:GetCombine(id)
	if not self:CombineExists(id) then return end
	local combine = {};
	local found, _, skill, spec, level, components, recipe, yield, item = string.find(self.vars.combines[id],"%d*|?(%u)(%l*)(%d+)|([^|]+)[|]?(%d*)[|]?([^|]*)[|]?(%d*)");
	combine.skill = skill;
	combine.spec = spec;
	combine.level = tonumber(level);
	if recipe ~= "" then combine.recipe = tonumber(recipe) end
	if yield ~= "" then combine.yield = tonumber(yield) else combine.yield = 1 end
	if item ~= "" then combine.item = tonumber(item) end
	if combine.item then
		combine.link, combine.quality, combine.itemString, combine.texture = getItemLink(combine.item);
	else
		combine.link, combine.quality, combine.itemString, combine.texture = getItemLink(id);
	end
	combine.name = self:GetCombineName(id);
	return combine;
end

function TradeskillInfo:GetCombineName(id)
	local name
	if id > 0 then
		name = self:GetComponent(id);
	else
		if self.vars.enchants[id] then
			_,_,name = string.find(self.vars.enchants[id],"(.+)/");
		else
			name = ""
		end
	end
	if not name then name=tostring(id) end
	return name
end

function TradeskillInfo:GetCombineEnchantId(id)
	if not self:CombineExists(id) then return 0 end
	local enchantId
	if id > 0 then
		_,_,enchantId = string.find(self.vars.combines[id],"(%d*)|?%a+%d+");
	else
		enchantId = -1 * id
	end
	return tonumber(enchantId)
end

function TradeskillInfo:GetCombineLevel(id)
	if not self:CombineExists(id) then return 0 end
	local _,_,level = string.find(self.vars.combines[id],"%d*|?%a+(%d+)");
	return tonumber(level)
end

function TradeskillInfo:GetCombineSkill(id)
	if not self:CombineExists(id) then return end
	local _,_,skill,spec,level = string.find(self.vars.combines[id],"%d*|?(%u)(%l*)(%d+)");
	if not spec then spec = "" end
	return skill,spec,tonumber(level)
end

function TradeskillInfo:GetCombineRecipe(id)
	if not self:CombineExists(id) then return end
	local _, _, recipe = string.find(self.vars.combines[id],"%d*|?[^|]+|[^|]+[|]?(%d*)");
	if recipe and recipe ~= "" then recipe = tonumber(recipe) end
	if not self.vars.recipes[recipe] then recipe = "" end
	return recipe;
end

function TradeskillInfo:GetCombineYield(id)
	if not self:CombineExists(id) then return end
	local _, _, yield = string.find(self.vars.combines[id],"%d*|?[^|]+|[^|]+[|]?%d*[|]?([^|]*)");
	if yield and yield ~= "" then yield = tonumber(yield) else yield = 1 end
	return yield
end

function TradeskillInfo:GetCombineItem(id)
	if not self:CombineExists(id) then return end
	local _, _, item = string.find(self.vars.combines[id],"%d*|?[^|]+|[^|]+[|]?%d*[|]?[^|]*[|]?(%d*)");
	if item and item ~= "" then item = tonumber(item) else item = nil end
	return item
end

function TradeskillInfo:GetCombineComponents(id)
	if not self:CombineExists(id) then return end
	local components = {};
	local _, _, compstring = string.find(self.vars.combines[id],"%d*|?[^|]+|([^|]+)");
	for s in string.gmatch(compstring,"%S+") do
		local c = {};
		_,_,c.id,c.num = string.find(s,"(%d+):(%d+)");
		c.id = tonumber(c.id) or tonumber(s);
		c.num = tonumber(c.num) or 1;
		c.name,c.cost,c.source = self:GetComponent(c.id);
		c.link, c.quality, c.itemString, c.texture = getItemLink(c.id);
		table.insert(components,c);
	end
	return components;
end

function TradeskillInfo:GetCombineDescription(id)
	local description
	if id < 0 then
		if self.vars.enchants[id] then
			_,_,description = string.find(self.vars.enchants[id],"[^/]*/(.*)");
		end
	end
	return description
end

function TradeskillInfo:GetCombineTexture(id)
	if not self:CombineExists(id) then return end
	local combineLink,combineItemString,combineTexture
	local item = self:GetCombineItem(id);
	if item and item ~= "" then
		combineLink,_,combineItemString,combineTexture = getItemLink(tonumber(item));
	elseif id < 0 then
		local combineName = self:GetCombineName(id);
		combineLink,_,combineItemString,combineTexture = getItemLink(id,combineName);
	else
		combineLink,_,combineItemString,combineTexture = getItemLink(id);
	end
	return combineTexture,combineLink,combineItemString;
end

function TradeskillInfo:GetCombineAvailability(id)
	if not self:CombineExists(id) then return end
	local player,alt = 0,0;
	-- 0 = Unavailable, 1 = known, 2 = learnable, 3 = will be able to learn
	local combineSkill,combineSpec,combineLevel = self:GetCombineSkill(id);
	local playerSkillLevel = self:GetCharSkillLevel(self.vars.playername,combineSkill);
	local playerSpec = self:GetCharSkillLevel(self.vars.playername,combineSpec);
	if playerSkillLevel and (combineSpec=="" or playerSpec) then
		if playerSkillLevel >= combineLevel then
			if self:IsCombineKnowByChar(self.vars.playername,id) then
				player = 1;
			else
				player = 2;
			end
		else
			player = 3;
		end
	end

	for name in pairs(self.db.realm.userdata) do
		if name ~= self.vars.playername then
			local skillLevel = self:GetCharSkillLevel(name,combineSkill);
			local charSpec = self:GetCharSkillLevel(name,combineSpec);
			if skillLevel and (combineSpec=="" or charSpec) then
				if skillLevel >= combineLevel then
					if self:IsCombineKnowByChar(name,id) then
						alt = 1;
					elseif alt == 0 or alt == 3 then
						alt = 2;
					end
				elseif alt == 0 then
					alt = 3
				end
			end
		end
		if alt == 1 then break end
	end
	return player,alt
end

function TradeskillInfo:GetColoredDifficulty(id)
	if not self:CombineExists(id) then return "" end
	local s = "";
	if self.db.account.difficulty[id] then
		local d = splitn(self.db.account.difficulty[id],'/');
		for i,l in ipairs(d) do
			if i == 1 then
				s = self.vars.diffcolors[i]..d[i].."|r";
			else
				s = s.."/"..self.vars.diffcolors[i]..d[i].."|r";
			end
		end
	else
		local level = self:GetCombineLevel(id);
		local knownRecipes = self.db.realm.userdata[self.vars.playername].knownRecipes;
		if knownRecipes and
			 knownRecipes[id] then
			diff = knownRecipes[id];
			s = "skill("..self.vars.diffcolors[diff]..level.."|r)";
		else
			s = "skill("..level..")";
		end
	end
	return s
end

function TradeskillInfo:GetCombineCost(id)
	if not self:CombineExists(id) then return end
	local components = self:GetCombineComponents(id);
	local value = 0;
	local item = self:GetCombineItem(id);
	if item then
		_,value = self:GetComponent(item);
	elseif id > 0 then
		_,value = self:GetComponent(id)
	end
	local cost = 0;
	for _,c in ipairs(components) do
		cost = cost + c.cost * c.num
	end
	components = nil;
	return value, cost, value-cost;
end

function TradeskillInfo:PrintCombine(id)
	if not self:CombineExists(id) then return end
	local combine = self:GetCombine(id)
	local text = string.format("%s : %s(%d) %s ", combine.link or combine.name, self.vars.tradeskills[combine.skill], combine.level, self.vars.specializations[combine.spec] or "" );
	for i,c in ipairs(combine.components) do
		text = text .. string.format("x%d*%s ", c.num, c.link or c.name);
	end
	combine = nil;
	self:Print(text);
end

function TradeskillInfo:GetCombineFactionAvailable(id)
	if not self:CombineExists(id) then return end
	local rid = self:GetCombineRecipe(id);
	if rid and rid~="" then
		return self:GetRecipeFactionAvailable(rid);
	end
	return true;
end

----------------------------------------------------------------------
-- Component support functions
----------------------------------------------------------------------

function TradeskillInfo:Components()
	return pairs(self.vars.components)
end

function TradeskillInfo:ComponentExists(id)
	if id and self.vars.components[id] then return true end
end

function TradeskillInfo:GetIdFromName(name)
	for i,s in pairs(self.vars.components) do
		local _,_,n = string.find(s,"(.+)/%d+/%a+")
		if n == name then
			return i;
		end
	end
end

function TradeskillInfo:GetComponent(id)
	if not self:ComponentExists(id) then return end
	local _,_,name,cost,source = string.find(self.vars.components[id],"(.+)/(%d+)/(%a+)")
	return name,tonumber(cost),source
end

function TradeskillInfo:GetComponentSource(id, tooltip)
	if not self:ComponentExists(id) then return end
	local c = self.db.profile.ColorSource;
	local Ltext;
	local _,_,name,cost,source = string.find(self.vars.components[id],"(.+)/(%d+)/(%a+)")
	local ret
	for s in string.gmatch(source,"%u%l*") do
		if self.vars.sources[s] then
			local sourcename = self.vars.sources[s];
			if ret then
				Ltext = " ";
				ret = ret..", "..sourcename;
			else
				Ltext = TradeskillInfo_Source_Text;
				ret = sourcename;
			end
			if tooltip then
				tooltip:AddDoubleLine(Ltext, sourcename, c.r, c.g, c.b, c.r, c.g, c.b/1.2);
			end
		else
			self:Print(TradeskillInfo_FoundUnknownSource_Text,s);
		end
	end
	return ret
end

----------------------------------------------------------------------
-- Where Used
----------------------------------------------------------------------

function TradeskillInfo:PrintWhereUsed(id)
	if not self.vars.whereUsed[id] then
		self:Print("Not used in any know tradeskill");
		return
	end
	local skills = {}
	local num = 0;
	for s in string.gmatch(self.vars.whereUsed[id],"%S+") do
		num = num + 1;
    local _,_,skill,item = string.find(s, "(%u+)([-]?%d+)")
    if not skills[skill] then
    	skills[skill] = {}
    end
    table.insert(skills[skill],tonumber(item))
	end
	local name = self:GetComponent(id);
	self:Print("Found "..name.." in "..num.." combines");
	for n,s in pairs(skills) do
		self:Print(table.getn(s).." "..self.vars.tradeskills[n].." combines");
		for _,i in ipairs(s) do
			self:PrintCombine(i);
		end
	end
	skills = nil
end

function TradeskillInfo:GetUsedIn(id, tooltip)
	if not self.vars.whereUsedOverview[id] then return end
	local overview
	local Ltext, Rtext;
	local c = self.db.profile.ColorUsedIn;
	for s in string.gmatch(self.vars.whereUsedOverview[id],"%S+") do
		local _,_,skill,num = string.find(s, "(%u+)(%d+)")
		local skillname = self.vars.tradeskills[skill];
		if skillname then
			Rtext = skillname.." ("..tostring(num)..")";
			if not overview then
				overview = Rtext;
				Ltext = TradeskillInfo_UsedIn_MText;
			else
				overview = overview..", "..Rtext;
				Ltext = " ";
			end
			if tooltip then
				tooltip:AddDoubleLine(Ltext, Rtext, c.r, c.g, c.b, c.r, c.g, c.b/1.2);
--				tooltip:Show();
			end
		else
			self:Print(TradeskillInfo_FoundUnknownSkill_Text,s);
		end
	end
	return overview;
end

function TradeskillInfo:BuildWhereUsed()
	self.vars.whereUsed = {};
	for i,_ in pairs(self.vars.combines) do
		local skill,spec,level = self:GetCombineSkill(i);
		local components = self:GetCombineComponents(i);
		for _,c in ipairs(components) do
			if not self.vars.whereUsed[c.id] then
				self.vars.whereUsed[c.id]=skill..tostring(i);
			else
				self.vars.whereUsed[c.id]=self.vars.whereUsed[c.id].." "..skill..tostring(i);
			end
		end
		components = nil
	end

	self.vars.whereUsedOverview = {}
	for i,_ in pairs(self.vars.whereUsed) do
		local skills = self:GetItemUseCount(i);
		local overview
		for s,n in pairs(skills) do
	    if not overview then
	    	overview = s..n;
	    else
	    	overview = overview.." "..s..tostring(n);
	    end
	  end
		self.vars.whereUsedOverview[i] = overview;
	end
end

local function AddTable(tbl1,tbl2)
	for i,v in pairs(tbl2) do
		if tbl1[i] then
			tbl1[i] = tbl1[i] + v;
		else
			tbl1[i] = v;
		end
	end
end

function TradeskillInfo:GetItemUseCount(item,deep)
	if not deep then deep = 1 end
	local skills = {};
	if self.vars.whereUsed[item] and deep < 5 then
		for s in string.gmatch(self.vars.whereUsed[item],"%S+") do
			local _,_,skill,item2 = string.find(s, "(%u)([-]?%d+)");
			if skill then
				AddTable(skills,{[skill]=1});
				local skills2 = self:GetItemUseCount(tonumber(item2),deep+1);
				AddTable(skills,skills2);
			end
		end
	end
	return skills
end

function TradeskillInfo:GetItemUsedIn(item,use)
	if not use then use = {} end
	if self.vars.whereUsed[item] then
		for s in string.gmatch(self.vars.whereUsed[item],"%S+") do
			local _,_,skill,item2 = string.find(s,"(%u)([-]?%d+)");
			item2 = tonumber(item2);
			if not use[item2] then
				use[item2] = true;
				self:GetItemUsedIn(item2,use);
			end
		end
	end
	return use
end

----------------------------------------------------------------------
--- Recipe functions
----------------------------------------------------------------------

--function TradeskillInfo:BuildRecipeTable()
--	self.vars.recipes = {};
--	self.db.account.recipes = {};
--	for i,_ in pairs(self.vars.combines) do
--		local recipe = self:GetCombineRecipe(i);
--		if recipe then
--			self.vars.recipes[recipe] = tostring(i);
--		end
--	end
--end

function TradeskillInfo:GetRecipeItem(recipe)
	if not self.vars.recipes[recipe] then return end
	local _, _, item = string.find(self.vars.recipes[recipe],"([-]?%d+)|");
	return tonumber(item);
end

function TradeskillInfo:GetRecipeSources(recipe,opposing, tooltip, ShowRecipeSource, ShowRecipePrice)
	if not self.vars.recipes[recipe] then return end
	local found, _, sources,price,level = string.find(self.vars.recipes[recipe],"[^|]+|(%w+)[|]?(%d*)[|]?(%d*)");
	if not found then return end
	local c = self.db.profile.ColorRecipeSource;
	local Ltext, Rtext = "";
	if price == "" then price = nil else price = tonumber(price) end
	local uf = UnitFactionGroup("player")
	local res = ""
	local number_found = 0;
	for s,n in string.gmatch(sources,"(%u%l*)(%d*)") do
		if (s=="V" or s=="Q" or s=="D") and n~="" then
			local found,_,vname,znr,fnr,pos,note = string.find(self.vars.vendors[tonumber(n)],"([^|]+)|(%d+)|(%d+)[|]?([^|]*)[|]?([^|]*)");
			if found then
				if opposing or (uf=="Horde" and fnr~="1") or (uf=="Alliance" and fnr~="2") then
					number_found = number_found + 1;
					local zone = self.vars.zones[tonumber(znr)];
					local faction = self.vars.factions[tonumber(fnr)];
					if res ~= "" then
						Ltext = " ";
						res = res..", ";
					else
						Ltext = TradeskillInfo_Source_Text;
					end
					if note ~= "" then
						note = " "..note
					end
					if pos ~= "" then
						local found, _, x, y = string.find(pos,"([%d%.]+),([%d%.]+)");
						if found then
							zone = zone or ""
							pos = " |cFF0066FF|Htsicoord:"..zone..":"..x..":"..y..":"..vname.."|h("..x..", "..y..")|h|r"
						else
							pos = " ("..pos..")"
						end
					end
					Rtext = self.vars.sources[s]..": "..vname..", "..zone..pos..note
					if level ~= "" then
						local rep = getglobal("FACTION_STANDING_LABEL"..level);
						Rtext = Rtext.." "..faction.."-"..rep;
					end
					res = res .. Rtext;
					if tooltip and ShowRecipeSource then
						tooltip:AddDoubleLine(Ltext, Rtext, c.r, c.g, c.b, c.r, c.g, c.b/1.5);
					end
				end
			else
				self:Print(TradeskillInfo_UnknownNPC_Text,s);
			end
		elseif self.vars.sources[s] then
			local _,_,f = string.find(s,"%u(%l*)")
			if opposing or (uf=="Horde" and f~="a") or (uf=="Alliance" and f~="h") then
				number_found = number_found + 1;
				if res ~= "" then
					Ltext = " ";
					res = res..", ";
				else
					Ltext = TradeskillInfo_Source_Text;
				end
				Rtext = self.vars.sources[s];
				res = res..Rtext;
				if tooltip then
					tooltip:AddDoubleLine(Ltext, Rtext, c.r, c.g, c.b, c.r, c.g, c.b/1.5);
				end
			end
		else
			self:Print(TradeskillInfo_UnknownSource_Text,s);
		end
	end
	if price and tooltip and ShowRecipePrice then
		local c = self.db.profile.ColorRecipePrice;
		tooltip:AddDoubleLine(TradeskillInfo_Vendorprice_Text, self:GetMoneyString(price), c.r, c.g, c.b, c.r, c.g, c.b);
	end
	number_found = number_found * 10;
	return number_found,res,price
end

-- Returns true if the recipe is available to this players faction
function TradeskillInfo:GetRecipeFactionAvailable(recipe)
	if not self.vars.recipes[recipe] then return end
	local found, _, sources = string.find(self.vars.recipes[recipe],"[^|]+|(%w+)");
	if not found then return end
	local uf = UnitFactionGroup("player")
	for s,n in string.gmatch(sources,"(%u%l*)(%d*)") do
		if (s=="V" or s=="Q") and n~="" then
			local found,_,fnr = string.find(self.vars.vendors[tonumber(n)],"[^|]+|[^|]+|(%d+)");
			if found then
				if (uf=="Horde" and fnr~="1") or (uf=="Alliance" and fnr~="2") then
					return true;
				end
			end
		else
			local _,_,f = string.find(s,"%u(%l*)")
			if (uf=="Horde" and f~="a") or (uf=="Alliance" and f~="h") then
				return true;
			end
		end
	end
end

function TradeskillInfo:GetRecipeKnownBy(recipe)
	local item = self:GetRecipeItem(recipe);
	local res;
	if item then
		res = self:GetCombineKnownBy(item);
	end
	return res
end

function TradeskillInfo:GetRecipeLearnableBy(recipe)
	local item = self:GetRecipeItem(recipe);
	local res;
	if item then
		res = self:GetCombineLearnableBy(item);
	end
	return res
end

function TradeskillInfo:GetRecipeAvailableTo(recipe)
	local item = self:GetRecipeItem(recipe);
	local res;
	if item then
		res = self:GetCombineAvailableTo(item);
	end
	return res
end

----------------------------------------------------------------
--  Saved Skills and Known Combines functions
----------------------------------------------------------------

function TradeskillInfo:GetChars()
	local chars = {};
	for n,_ in pairs(self.db.realm.userdata) do
		table.insert(chars,n);
	end
	return chars;
end

function TradeskillInfo:Chars()
	return pairs(self.db.realm.userdata);
end

function TradeskillInfo:GetAltChars()
	local chars = {};
	for n,_ in pairs(self.db.realm.userdata) do
		if n ~= self.vars.playername then
			table.insert(chars,n);
		end
	end
	return chars;
end

function TradeskillInfo:AltChars()
	return function()
		local name = next(self.db.realm.userdata);
		if name == self.vars.playername then
			name = next(self.db.realm.userdata);
		end
		if name then
			return name;
		else
			return nil;
		end
	end, nil, nil
end

function TradeskillInfo:GetCharSkillLevel(name,skill)
	return self.db.realm.userdata[name].skills[skill]
end

function TradeskillInfo:GetCharSkills(name)
	local skills = {};
	for skill,level in pairs(self.db.realm.userdata[name].skills) do
		skills[skill] = level;
	end
	return skills;
end

function TradeskillInfo:CharSkills(name)
	return pairs(self.db.realm.userdata[name].skills);
end

function TradeskillInfo:IsCombineKnowByChar(name,id)
	return self.db.realm.userdata[name].knownRecipes[id];
end

function TradeskillInfo:GetCombineKnownBy(id, tooltip)
	local text
	local c = self.db.profile.ColorKnownBy;
	local Ltext, Rtext;
	for name in pairs(self.db.realm.userdata) do
		local known = self:IsCombineKnowByChar(name,id);
		if known then
			Rtext = self.vars.diffcolors[known]..name.."|r";
			if text then
				Ltext = " ";
				text = text..", "..Rtext;
			else
				Ltext = TradeskillInfo_KnownBy_MText;
				text = Rtext;
			end
			if tooltip then
				tooltip:AddDoubleLine(Ltext, Rtext, c.r, c.g, c.b, c.r, c.g, c.b/1.2);
			end
		end
	end
	return text;
end

function TradeskillInfo:IsCombineLearnableByChar(name,id)
	local combineSkill,combineSpec,combineLevel = self:GetCombineSkill(id);
	local charLevel = self:GetCharSkillLevel(name,combineSkill);
	local charSpec = self:GetCharSkillLevel(name,combineSpec);
	if charLevel and charLevel >= combineLevel and not self:IsCombineKnowByChar(name,id) and (combineSpec=="" or charSpec) then
		return charLevel;
	end
end

function TradeskillInfo:GetCombineLearnableBy(id, tooltip)
	local text
	local c = self.db.profile.ColorLearnableBy;
	local Ltext, Rtext;
	for name,userdata in pairs(self.db.realm.userdata) do
		local charLevel = self:IsCombineLearnableByChar(name,id);
		if charLevel then
			Rtext = name.." ("..charLevel..")";
			if text then
				Ltext = " ";
				text = text..", "..Rtext;
			else
				Ltext = TradeskillInfo_LearnableBy_MText;
				text = Rtext;
			end
			if tooltip then
				tooltip:AddDoubleLine(Ltext, Rtext, c.r, c.g, c.b, c.r, c.g, c.b/1.2);
			end
		end
	end
	return text;
end

function TradeskillInfo:IsCombineAvailableToChar(name,id)
	local combineSkill,combineSpec,combineLevel = self:GetCombineSkill(id);
	local charLevel = self:GetCharSkillLevel(name,combineSkill);
	local charSpec = self:GetCharSkillLevel(name,combineSpec);
	if charLevel and charLevel < combineLevel and (combineSpec=="" or charSpec) then
		return charLevel;
	end
end

function TradeskillInfo:GetCombineAvailableTo(id, tooltip)
	local text
	local c = self.db.profile.ColorAvailableTo;
	local Ltext, Rtext;
	for name,userdata in pairs(self.db.realm.userdata) do
		local charLevel = self:IsCombineAvailableToChar(name,id)
		if charLevel then
			Rtext = name.." ("..charLevel..")";
			if text then
				Ltext = " ";
				text = text..", "..Rtext;
			else
				Ltext = TradeskillInfo_WillBeAbleToLearn_MText;
				text = Rtext;
			end
			if tooltip then
				tooltip:AddDoubleLine(Ltext, Rtext, c.r, c.g, c.b, c.r, c.g, c.b/1.2);
			end
		end
	end
	return text;
end

function TradeskillInfo:GetItemUsableByChar(name,id,deep)
	if not deep then deep = 1 end
	local num = 0;
	if self.vars.whereUsed[id] and deep < 5 then
		for s in string.gmatch(self.vars.whereUsed[id],"%S+") do
			local _,_,skill,combine = string.find(s, "(%u)([-]?%d+)");
			local known = self:IsCombineKnowByChar(name,tonumber(combine));
			if known then
				num = num + 1 + self:GetItemUsableByChar(name,tonumber(combine),deep+1)
			end
		end
	end
	return num
end

function TradeskillInfo:GetItemUsableBy(id, tooltip)
	if not self.vars.whereUsed[id] then return end
	local text
	local c = self.db.profile.ColorUsableBy;
	local Ltext, Rtext;
	for name,userdata in pairs(self.db.realm.userdata) do
		local num = self:GetItemUsableByChar(name,id);
		if num > 0 then
			rText = name.." ("..num..")";
			if text then
				Ltext = " ";
				text = text..", "..rText;
			else
				Ltext = TradeskillInfo_UsableBy_MText;
				text = rText;
			end
			if tooltip then
				tooltip:AddDoubleLine(Ltext, rText, c.r, c.g, c.b, c.r, c.g, c.b/1.2);
			end
		end
	end
	return text;
end

----------------------------------------------------------------
--  Tooltip Functions
----------------------------------------------------------------

function TradeskillInfo:HookTooltips()
	self:SecureHook(GameTooltip, "SetBagItem");
	self:SecureHook(GameTooltip, "SetInventoryItem");
	self:SecureHook(GameTooltip, "SetLootItem");
	self:SecureHook(GameTooltip, "SetHyperlink");
	self:SecureHook(GameTooltip, "SetCraftItem");
	self:SecureHook(GameTooltip, "SetTradeSkillItem");
	self:SecureHook(GameTooltip, "SetMerchantItem");
	self:SecureHook(GameTooltip, "SetAuctionItem");
	self:SecureHook(GameTooltip, "SetTrainerService");
	self:SecureHook(GameTooltip, "SetGuildBankItem");
	self:SecureHook("SetItemRef");
end

--- Hooks for tooltips

function TradeskillInfo:SetItemRef(link, text, button)
--	if IsControlKeyDown() or IsShiftKeyDown() then return end
	if ( IsModifiedClick() ) then return end
    local id = getIdFromLink(link);
	if id then
		self:AddToTooltip(ItemRefTooltip,id);
	end
end

function TradeskillInfo:SetBagItem(tooltip, bag, slot)
	local link = GetContainerItemLink(bag, slot);
	local id = getIdFromLink(link);
	self:AddToTooltip(tooltip, id);
end

function TradeskillInfo:SetGuildBankItem(tooltip, tab, slot)
	local link = GetGuildBankItemLink(tab, slot);
	local id = getIdFromLink(link);
	self:AddToTooltip(tooltip, id);
end

function TradeskillInfo:SetInventoryItem(tooltip, unit, slot, nameOnly)
	if slot > 39 and slot < 68 then
		local link = GetContainerItemLink(BANK_CONTAINER, slot-39)
		local id = getIdFromLink(link);
		self:AddToTooltip(tooltip, id);
	end
end

function TradeskillInfo:SetLootItem(tooltip, index)
	local link = GetLootSlotLink(index);
	local id = getIdFromLink(link);
	self:AddToTooltip(tooltip, id);
end

function TradeskillInfo:SetHyperlink(tooltip, link)
	local id = getIdFromLink(link)
	self:AddToTooltip(tooltip, id);
end

function TradeskillInfo:SetCraftItem(tooltip, itemIndex, reagentIndex)
	local link
	if reagentIndex then
		link = GetCraftReagentItemLink(itemIndex, reagentIndex);
	else
		link = GetCraftItemLink(itemIndex);
	end
	local id = getIdFromLink(link)
	self:AddToTooltip(tooltip, id);
end

function TradeskillInfo:SetTradeSkillItem(tooltip, itemIndex, reagentIndex)
	local link
	if reagentIndex then
		link = GetTradeSkillReagentItemLink(itemIndex, reagentIndex);
	else
		link = GetTradeSkillItemLink(itemIndex);
	end
	local id = getIdFromLink(link)
	self:AddToTooltip(tooltip, id);
end

function TradeskillInfo:SetMerchantItem(tooltip, index)
	local link = GetMerchantItemLink(index);
	local id = getIdFromLink(link);
	self:AddToTooltip(tooltip, id);
end

function TradeskillInfo:SetAuctionItem(tooltip, type, index)
	local link = GetAuctionItemLink(type, index);
	local id = getIdFromLink(link);
	self:AddToTooltip(tooltip, id);
end

function TradeskillInfo:SetTrainerService(tooltip, selectedService)
	local name = getglobal(tooltip:GetName().."TextLeft1"):GetText();
	if category ~= "header" then
		local id = self:GetIdFromName(name);
		if id then
			self:AddToTooltip(tooltip, id);
			self:AddReagentsToTooltip(tooltip, id);
		end
	end
end

---- Processing of tooltips

function TradeskillInfo:AddToTooltip(tooltip, id)
	self:AddUsedInToTooltip(tooltip, id);
	self:AddUsableByToTooltip(tooltip, id);
	self:AddSourceToTooltip(tooltip, id);
	self:AddRecipeKnownByToTooltip(tooltip, id);
	self:AddBankedAmountToTooltip(tooltip, id);
	self:AddAltAmountToTooltip(tooltip, id);
	self:AddIdToTooltip(tooltip, id);
	self:AddStackToTooltip(tooltip, id);
	tooltip:Show();
end

function TradeskillInfo:AddSourceToTooltip(tooltip, id)
	if self:ShowingTooltipSource() then
		local source = self:GetComponentSource(id, tooltip);
	end
	if self:ShowingTooltipRecipeSource() or self:ShowingTooltipRecipePrice() then
		_, source, price = self:GetRecipeSources(id, nil, tooltip, self:ShowingTooltipRecipeSource(), self:ShowingTooltipRecipePrice());
	end
end

function TradeskillInfo:AddUsedInToTooltip(tooltip, id)
	if self:ShowingTooltipUsedIn() then
		local usedIn = self:GetUsedIn(id, tooltip);
	end
end

function TradeskillInfo:AddUsableByToTooltip(tooltip, id)
	if self:ShowingTooltipUsableBy() then
		local usableBy = self:GetItemUsableBy(id, tooltip);
	end
end

function TradeskillInfo:AddRecipeKnownByToTooltip(tooltip, id)
	id = self:GetRecipeItem(id);
	if id then
		if self:ShowingTooltipKnownBy() then
			local knownBy = self:GetCombineKnownBy(id, tooltip)
		end
		if self:ShowingTooltipLearnableBy() then
			local learnableBy = self:GetCombineLearnableBy(id, tooltip)
		end
		if self:ShowingTooltipAvailableTo() then
			local availableTo = self:GetCombineAvailableTo(id, tooltip)
		end
	end
end

function TradeskillInfo:AddBankedAmountToTooltip(tooltip, id)
	if self:ShowingTooltipBankedAmount() and CharacterInfoStorage then
		local amount = CharacterInfoStorage:GetNumItemsBank(self.vars.playername,id);
		if amount > 0 then
			local c = self.db.profile.ColorBankedAmount;
			tooltip:AddDoubleLine(TradeskillInfo_Banked_Text, tostring(amount), c.r, c.g, c.b, c.r, c.g, c.b);
		end
	end
end

function TradeskillInfo:AddAltAmountToTooltip(tooltip, id)
	if self:ShowingTooltipAltAmount() and CharacterInfoStorage then
		local chars = CharacterInfoStorage:GetCharacters();
		local c = self.db.profile.ColorAltAmount;
		local Ltext, Rtext;
		local text = "";
		for _,name in ipairs(chars) do
			if name ~= self.vars.playername then
				local amount = CharacterInfoStorage:GetNumItems(name,id);
				if amount > 0 then
					Rtext = name.." ("..tostring(amount)..")";
					if text ~= "" then
						Ltext = " ";
						text = text..", ";
					else
						Ltext = TradeskillInfo_AltsHave_Text;
					end
					text = text..Rtext;
					if tooltip then
						tooltip:AddDoubleLine(Ltext, Rtext, c.r, c.g, c.b, c.r, c.g, c.b/1.2);
					end
				end
			end
		end
	end
end

function TradeskillInfo:AddReagentsToTooltip(tooltip, id)
	if self:ShowingTrainerReagents() then
		local components = self:GetCombineComponents(id);
		if components then
			local c = self.db.profile.ColorTrainerReagents;
			local Ltext, Rtext;
			local text
			for _,c in ipairs(components) do
				if not c.quality then c.quality = 1 end
				local _, _, _, hexColor = GetItemQualityColor(c.quality);
				Rtext = c.num.."*"..hexColor..c.name.."|r";
				if not text then
					Ltext = TradeskillInfo_Reagents_MText;
					text = Rtext;
				else
					Ltext = " ";
					text = text..", "..Rtext;
				end
				if tooltip then
					tooltip:AddDoubleLine(Ltext, Rtext, c.r, c.g, c.b, c.r, c.g, c.b/1.2);
				end
			end
		end
		components = nil;
	end
end

function TradeskillInfo:AddIdToTooltip(tooltip, id)
	if self:ShowingTooltipID() then
		if id then
			local c = self.db.profile.ColorID;
			tooltip:AddDoubleLine(TradeskillInfo_ItemID_Text, tostring(id), c.r, c.g, c.b, c.r, c.g, c.b);
		end
	end
end

function TradeskillInfo:AddStackToTooltip(tooltip, id)
	if self:ShowingTooltipStack() then
		if id then
			local stack
			_,_,_,_,_,_,_, stack = GetItemInfo(id);
			if stack and stack > 1 then
				local c = self.db.profile.ColorStack;
				tooltip:AddDoubleLine(TradeskillInfo_Stacksize_Text, tostring(stack), c.r, c.g, c.b, c.r, c.g, c.b);
			end
		end
	end
end


----------------------------------------------------------------------
-- Parse enchant tooltips to store information
----------------------------------------------------------------------
--do
--	local enchants
--	local index
--	function TradeskillInfo:ParseEnchantTooltip()
--		self.db.account.enchantdescriptions = {};
--		enchants = {};
--		index = 0;
--		for i in pairs(self.vars.enchants) do
--			table.insert(enchants,i);
--		end
--		self:ScheduleEvent(self.SetEnchantTooltip,1,self);
--	end
--
--	function TradeskillInfo:SetEnchantTooltip()
--		index = index + 1;
--		if enchants[index] then
--			GameTooltip:SetOwner(UIParent);
--			GameTooltip:SetHyperlink("enchant:"..-enchants[index]);
--			self:ScheduleEvent(self.ReadEnchantTooltip,1,self);
--		end
--	end
--
--	function TradeskillInfo:ReadEnchantTooltip()
--		local enchantname = GameTooltipTextLeft1:GetText();
--		local enchantdescription = GameTooltipTextLeft5:GetText();
--		if not enchantname then enchantname="" end
--		if not enchantdescription then enchantdescription="" end
--		self.db.account.enchantdescriptions[enchants[index]] = enchantname.."/"..enchantdescription;
--		GameTooltip:Hide();
--		self:ScheduleEvent(self.SetEnchantTooltip,1,self);
--	end
--end

----------------------------------------------------------------------
-- UI Load and Toggle
----------------------------------------------------------------------

function TradeskillInfo:LoadUI(quiet)
	if not IsAddOnLoaded("TradeskillInfoUI") then
		loaded,reason = LoadAddOn("TradeskillInfoUI");
		if not loaded then
			if not quiet then self:Print(TradeskillInfo_CouldNotLoadUI_Text,reason) end
		else
			self:Config_Init();
		end
		return loaded
	end
	return true
end

function TradeskillInfo:UI_Toggle()
	if self:LoadUI() then
		TradeskillInfoUI:Frame_Toggle();
	end
end

function TradeskillInfo:Config_Toggle()
	if self:LoadUI() then
		if TradeskillInfoConfigFrame:IsVisible() then
			self:Config_Hide();
		else
			self:Config_Show();
		end
	end
end

----------------------------------------------------------------------
-- Auction House
----------------------------------------------------------------------
function TradeskillInfo:AuctionFrameBrowse_Update()
	if not self:ColoringAHRecipes() then return end
	local offset = FauxScrollFrame_GetOffset(BrowseScrollFrame);

	for i=1, NUM_BROWSE_TO_DISPLAY do
		local index = offset + i;
		local button = getglobal("BrowseButton"..i);
		if button:IsVisible() then
			local iconTexture
			local recipeLink
			if button.Icon then  -- cached or from Auc-Advanced Compact-UI
				iconTexture = button.Icon
			else
				button.Icon = getglobal("BrowseButton"..i.."ItemIconTexture"); -- cache the icon texture
				iconTexture = button.Icon
			end
			if button.id then     -- contains real index when sorted in Compact-UI level
				index = button.id
			end
			local recipeLink = GetAuctionItemLink("list", index)
			local recipeId = getIdFromLink(recipeLink);
			local id = self:GetRecipeItem(recipeId);
			--self:Print("Item: %d(%d) %d %s",i,index,recipeId,recipeLink);
			if id then
				local you,alt = self:GetCombineAvailability(id);
				--self:Print("recipe: %s you %d alt %d",id,you,alt);
				-- 0 = Unavailable, 1 = known, 2 = learnable, 3 = will be able to learn
				if you == 2 then
					local c = self.db.profile.AHColorLearnable;
					iconTexture:SetVertexColor(c.r, c.g, c.b);
				elseif alt == 2 then
					local c = self.db.profile.AHColorAltLearnable;
					iconTexture:SetVertexColor(c.r, c.g, c.b);
				elseif you == 3 then
					local c = self.db.profile.AHColorWillLearn;
					iconTexture:SetVertexColor(c.r, c.g, c.b);
				elseif alt == 3 then
					local c = self.db.profile.AHColorAltWillLearn;
					iconTexture:SetVertexColor(c.r, c.g, c.b);
				else
					local c = self.db.profile.AHColorUnavailable;
					iconTexture:SetVertexColor(c.r, c.g, c.b);
				end
--				local knownBy = self:GetCombineKnownBy(id)
--				local learnableBy = self:GetCombineLearnableBy(id)
--				local availableTo = self:GetCombineAvailableTo(id)
--				if learnableBy then
--					iconTexture:SetVertexColor(1.0, 0.1, 0.1);
--				elseif availableTo then
--					iconTexture:SetVertexColor(1.0, 0.1, 0.1);
--				elseif knownBy then
--					iconTexture:SetVertexColor(1.0, 0.1, 0.1);
--				end
			elseif button.id then  -- button.id is set only by Compact-UI; we need to fix texture colors.
				local _, _, _, _, canUse =  GetAuctionItemInfo("list", index);
				if ( not canUse ) then
					iconTexture:SetVertexColor(1.0, 0.1, 0.1);  -- item is not usable
				else
					iconTexture:SetVertexColor(1.0, 1.0, 1.0);  -- usable, non-recipe item
				end
			end
		end
	end
end
----------------------------------------------------------------------
-- Property functions
----------------------------------------------------------------------

function TradeskillInfo:ShowingSkillLevel()
	return self.db.profile.ShowSkillLevel;
end

function TradeskillInfo:ShowingSkillProfit()
	return self.db.profile.ShowSkillProfit;
end

function TradeskillInfo:ShowingTooltipUsedIn()
	return self.db.profile.TooltipUsedIn;
end

function TradeskillInfo:ShowingTooltipSource()
	return self.db.profile.TooltipSource;
end

function TradeskillInfo:ShowingTooltipRecipeSource()
	return self.db.profile.TooltipRecipeSource;
end

function TradeskillInfo:ShowingTooltipRecipePrice()
	return self.db.profile.TooltipRecipePrice;
end

function TradeskillInfo:ShowingTooltipKnownBy()
	return self.db.profile.TooltipKnownBy;
end

function TradeskillInfo:ShowingTooltipLearnableBy()
	return self.db.profile.TooltipLearnableBy;
end

function TradeskillInfo:ShowingTooltipAvailableTo()
	return self.db.profile.TooltipAvailableTo;
end

function TradeskillInfo:ShowingTrainerReagents()
	return self.db.profile.TrainerReagents;
end

function TradeskillInfo:ShowingTooltipUsableBy()
	return self.db.profile.TooltipUsableBy;
end

function TradeskillInfo:ShowingTooltipID()
	return self.db.profile.TooltipID;
end

function TradeskillInfo:ShowingTooltipStack()
	return self.db.profile.TooltipStack;
end

function TradeskillInfo:ColoringAHRecipes()
	return self.db.profile.ColorAHRecipes;
end

function TradeskillInfo:ShowingTooltipBankedAmount()
	return self.db.profile.TooltipBankedAmount;
end

function TradeskillInfo:ShowingTooltipAltAmount()
	return self.db.profile.TooltipAltAmount;
end

--[[ FuBar Stuff --]]
TradeskillInfo.title = "TSI"
TradeskillInfo.hasIcon = "Interface\\Icons\\INV_Elemental_Mote_Nether"
TradeskillInfo.hasNoColor = true
TradeskillInfo.hideWithoutStandby = true
TradeskillInfo.independentProfile = true
TradeskillInfo.cannotDetachTooltip = true

TradeskillInfo.OnMenuRequest = {
	type = "group",
	handler = TradeskillInfo,
	args = {
		GUI_Display = {
			type = "execute",
			name = TradeskillInfo_ToggleGUI_Text,
			desc = TradeskillInfo_ToggleGUI_Desc_Text,
            func  = function() TradeskillInfo:UI_Toggle() end,
		},
		GUI_Config = {
			type = "execute",
			name = TradeskillInfo_Options_Text,
			desc = TradeskillInfo_Options_Desc_Text,
			func  = function() TradeskillInfo:Config_Toggle() end,
		},
	},
}
function TradeskillInfo:OnDoubleClick()
TradeskillInfo:UI_Toggle()
end
function TradeskillInfo:OnClick()
TradeskillInfo:UI_Toggle()
end

function TradeskillInfo.LinksMenu(link)
	if not TradeskillInfo.db.profile.QuickSearch then return end
	local _,_,item = string.find(link,":(%d+):");
	if self:LoadUI(true) then -- Have TradeskillInfoUI
		TradeskillInfoUI:SetSearchText("id="..item.." "..name);
		TradeskillInfoUI:Search_OnClick();
		TradeskillInfoUI:Frame_Show()
	else
	end
end

if Links then
	Links:AddToMenu("TSI: "..TradeskillInfo_Search_Text,
	function (_, _, link)
		TradeskillInfo.LinksMenu(link)
	end)
end
