--[[
Components
[itemid] = "source"
Source
	V = Vendor (Only items with unlimited supply)
	D = Dropped
	C = Crafted
	M = Mined
	H = Herbalism
	S = Skinned
	F = Fished
	E = Disenchanted
	G = Gathered (No skill required)
	P = Pickpocketed
]]--


local components = {

}
--[[
Recipes
[recipeid]#|source|price|level
# = combine id
source
	D = Drop
	V = Vendor
	Q = Quest
	# index to table vendors
Price = Vendor sell price (Optional)
Level = faction rank needed (Optional)
]]--
local recipes = {

}

local function merge(t1, t2)
	local k,v
	for k,v in pairs(t2) do
		t1[k] = v
	end
end

merge(TradeskillInfo.vars.components, components)
merge(TradeskillInfo.vars.recipes, recipes)
