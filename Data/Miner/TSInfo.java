import java.net.*;
import java.io.*;
import java.util.*;
import org.json.*;

class Item
{
	public int id;
	public int spell;
	public String skill;
	public String reagents;
	public int recipe;
	public int yield;
	public int itemid;

	public Item()
	{
		id = 0;
		spell = 0;
		skill = "";
		reagents = "";
		recipe = 0;
		yield = 0;
		itemid = 0;
	}

	public String toString() {
		if (skill.length() > 1) {
//			String temp = "\t[" + id + "] = \"" + (spell != 0 ? spell + "|" : "") + skill + "|" + reagents;
			String temp = "\t[" + spell + "] = \"" + id + "|" + skill + "|" + reagents;

			if (itemid != 0) {
				return temp + "|" + (recipe != 0 ? recipe : "") + "|" + (yield != 0 ? yield : "") + "|" + itemid + "\",\n";
			}
			if (yield != 0) {
				return temp + "|" + (recipe != 0 ? recipe : "") + "|" + yield + "\",\n";
			}
			if (recipe != 0) {
				return temp + "|" + recipe + "\",\n";
			}

			return temp + "\",\n";
		}
		return "";
	}
}


class Recipe
{
	public int id;
	public Object result;
	public String source;
	public String price;
	public String factionrank;

	public Recipe(int id, Object result, String source)
	{
		this.id = id;
		this.result = result;
		this.source = source;
		price = "";
		factionrank = "";
	}

	public String toString() {
//		return "\t[" + id + "] = \"" + result + "|" + source + "|" + price + "|" + factionrank + "\",";
		return "\t[" + id + "] = \"" + result + "|" + source + "\",";
	}
}


public class TSInfo
{
	public ArrayList combines;
	public Map<Integer, String> components;
	public ArrayList recipes;
	public ArrayList spells;

	public TSInfo()
	{
		combines = new ArrayList();
		components = new HashMap<Integer, String>();
		recipes = new ArrayList();
		spells = new ArrayList();
	}

	public Item getItem(int id)
	{
		for (Object entry : combines) {
			if (entry instanceof Item) {
				Item item = (Item)entry;
				if (item.id == id || item.itemid == id) {
					return item;
				}
			}
		}
		return null;
	}

	public Item getSpellItem(int spell)
	{
		for (Object entry : combines) {
			if (entry instanceof Item) {
				Item item = (Item)entry;
				if (spell > 0 && item.spell == spell) {
					return item;
				}
				if (spell < 0 && item.id == spell) {
					return item;
				}
			}
		}
		return null;
	}

	public void addCombine(Item newItem)
	{
		int id = newItem.id;
		Item oldItem = getItem(id);
		if (oldItem == null) {
			combines.add(newItem);
			return;
		}
	}

	public int getId(JSONObject obj) throws JSONException
	{
		return obj != null ? obj.getInt("id") : 0;
	}

	public int getProfessionId(String profession)
	{
		switch (profession) {
			case "Alchemy"        : return 171;
			case "Blacksmithing"  : return 164;
			case "Cooking"        : return 185;
			case "Enchanting"     : return 333;
			case "Engineering"    : return 202;
			case "First Aid"      : return 129;
			case "Inscription"    : return 773;
			case "Jewelcrafting"  : return 755;
			case "Leatherworking" : return 165;
			case "Mining"         : return 186;
			case "Tailoring"      : return 197;
		}
		return 0;
	}

//	public String getSkill(JSONObject obj) throws JSONException
	public String getSkill(String profession)
	{
		String temp = "";
//		switch (obj.getString("school")) {
		switch (profession) {
			case "Alchemy"        : temp = "A"; break;
			case "Blacksmithing"  : temp = "B"; break;
			case "Cooking"        : temp = "W"; break;
			case "Enchanting"     : temp = "D"; break;
			case "Engineering"    : temp = "E"; break;
			case "First Aid"      : temp = "X"; break;
			case "Inscription"    : temp = "I"; break;
			case "Jewelcrafting"  : temp = "J"; break;
			case "Leatherworking" : temp = "L"; break;
			case "Mining"         : temp = "Y"; break;
			case "Tailoring"      : temp = "T"; break;
		}
		return temp;
	}

	public int getRecipe(JSONArray arr) throws JSONException
	{
		if (arr != null) {
			JSONObject recipe = arr.optJSONObject(0);
			if (recipe != null) {
				return recipe.optInt("id");
			}
		}
		return 0;
	}

	public void readFromBuffed(String profession)
	{
		String prefix = "var bt = new Btabs(";
		String suffix = ");bt.init();</script>";
		try
		{
			URL url = new URL("http://wowdata.getbuffed.com/spell/profession/" + getProfessionId(profession));
			URLConnection bc = url.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(bc.getInputStream()));
//			BufferedWriter out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File("Buffed-" + profession))));

			spells.clear();
			String line;
			while ((line = in.readLine()) != null) {
				if (line.startsWith(prefix) && line.endsWith(suffix)) {
					combines.add("\n--[[ " + profession + " ]]--\n");
					recipes.add("\n--[[ " + profession + " ]]--");
					JSONArray jArray = new JSONArray(line.substring(prefix.length(), line.length() - suffix.length()));
					if (jArray.length() > 0) {
						JSONObject jObject = jArray.optJSONObject(0);
						if (jObject != null) {
							JSONArray rows = jObject.optJSONArray("rows");
							if (rows != null) {
								for (int i = 0; i < rows.length(); i++) {
									JSONObject row = rows.getJSONObject(i);
//									out.write(row + "\n");
/*
									int id = getId(row.optJSONObject("p"));
									if (id != 0) {
										Item item = new Item();
										item.id = id;
										item.spell = row.getInt("id");
										item.skill = getSkill(row);
										item.recipe = getRecipe(row.optJSONArray("rec"));
										addCombine(item);
										if (item.recipe > 0) {
											recipes.add(new Recipe(item.recipe, item.spell));
										}
									}
*/
									String name = row.getString("n");
									if (!name.contains("UNUSED")) {
										Item item = new Item();
										item.id = getId(row.optJSONObject("p"));
										item.spell = row.getInt("id");
										spells.add(item);
									}
								}
							}
						}
					}
					break;
				}
			}
			in.close();
//			out.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}


// Components
// [itemid] = "source"
// Source
//  V = Vendor(5)
//  D = Dropped(2)
//  C = Crafted(1)
//  M = Mined
//  H = Herbalism
//  S = Skinned
//  F = Fished(16)
//  E = Disenchanted
//  G = Gathered
//  P = Pickpocketed(21)

// 1 Crafted
// 2 Dropped
// 4 Quest Reward
// 5 Vendor
// 6 Trainer
// 7 Discovery
// 10 Starter Recipe
// 12 Achievement Reward
// 16 Fished
// 21 Pickpocketed


	public void readFromWowHead(String profession)
	{
		String prefix = "new Listview(";
		String suffix = "});";
		String offset = "data: ";
/*
		try
		{
			URL url = new URL("http://www.wowhead.com/skill=" + getProfessionId(profession));
			URLConnection bc = url.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(bc.getInputStream()));
//			BufferedWriter out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File("WoWhead-" + profession))));

			String line;
			while ((line = in.readLine()) != null) {
				if (line.startsWith(prefix) && line.endsWith(suffix)) {
					int index = line.indexOf(offset);
					if (index != -1) {
						line = line.substring(index + offset.length(), line.length() - suffix.length());
						JSONArray rows = new JSONArray(line);
						for (int i = 0; i < rows.length(); i++) {
							JSONObject row = rows.getJSONObject(i);
//							out.write(row + "\n");
							int id = row.optInt("id");
							Item item = getSpellItem(id);
							if (item != null) {
								JSONArray reagents = row.optJSONArray("reagents");
								if (reagents != null) {
									String re = "";
									for (int j = 0; j < reagents.length(); j++) {
										JSONArray obj = reagents.getJSONArray(j);

										int component = obj.getInt(0);
										int amount = obj.getInt(1);

										components.put(component, "V");

										re = re + component + ":" + amount + " ";
									}

//									String re = reagents.toString();

//									re = re.replace("[[", "");
//									re = re.replace("]]", "");
//									re = re.replace("],[", " ");
//									re = re.replace(",", ":");

									item.reagents = re.trim();
								}
								JSONArray colors = row.optJSONArray("colors");
								if (colors != null) {
									int orange = colors.getInt(0);
									int yellow = colors.getInt(1);
									int green  = colors.getInt(2);
									int grey   = colors.getInt(3);

									if (green == 0) { green = grey; }
									if (yellow == 0) { yellow = green; }
									if (orange == 0) { orange = yellow; }

									item.skill = item.skill + orange + "/" + yellow + "/" + green + "/" + grey;
								}
								JSONArray creates = row.optJSONArray("creates");
								if (creates != null) {
									item.yield = creates.optInt(1);
								}
							}
						}
					}
					break;
				}
			}
			in.close();
//			out.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
*/
		try
		{
			int current = 0;
			int total = spells.size();
			
			for (Object temp : spells) {
				if (temp instanceof Item) {
					Item entry = (Item)temp;
					
					Thread.sleep(25);
					
					current = current + 1;
					System.out.println("  Scanning " + current + " of " + total + ". (" + entry.spell + ")\r");
					
					URL url = new URL("http://www.wowhead.com/spell=" + entry.spell);
					URLConnection bc = url.openConnection();
					BufferedReader in = new BufferedReader(new InputStreamReader(bc.getInputStream()));
//					BufferedWriter out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File("WoWhead-" + entry.spell))));
					
					Item item = new Item();
					item.id = entry.id;
					item.spell = entry.spell;
					item.skill = getSkill(profession);
					
					String line;
					
					while ((line = in.readLine()) != null) {
						if (line.startsWith(prefix) && line.endsWith(suffix)) {
							int index = line.indexOf(offset);
							
							if (index != -1) {
								JSONArray rows;
								JSONObject row;
								
								// recipe data
								if (line.contains("id: 'recipes'")) {
//									System.out.println("'recipes' exists for " + entry.spell);
									
									line = line.substring(index + offset.length(), line.length() - suffix.length());
									rows = new JSONArray(line);
									row = rows.getJSONObject(0);
									
//									out.write("recipes        " + row + "\n");
									
									item.spell = row.getInt("id");
									
									JSONArray reagents = row.optJSONArray("reagents");
									if (reagents != null) {
										String re = "";
										for (int j = 0; j < reagents.length(); j++) {
											JSONArray obj = reagents.getJSONArray(j);
											
											int component = obj.getInt(0);
											int amount = obj.getInt(1);
											
											// TODO: get component source instead of defaulting to "vendor"
											components.put(component, "V");
											
											re = re + component + ":" + amount + " ";
										}
										
//										String re = reagents.toString();
										
//										re = re.replace("[[", "");
//										re = re.replace("]]", "");
//										re = re.replace("],[", " ");
//										re = re.replace(",", ":");
										
										item.reagents = re.trim();
									}
									
									JSONArray colors = row.optJSONArray("colors");
									if (colors != null) {
										int orange = colors.getInt(0);
										int yellow = colors.getInt(1);
										int green  = colors.getInt(2);
										int grey   = colors.getInt(3);
										
										if (green == 0) { green = grey; }
										if (yellow == 0) { yellow = green; }
										if (orange == 0) { orange = yellow; }
										
										item.skill = item.skill + orange + "/" + yellow + "/" + green + "/" + grey;
									}
									
									JSONArray creates = row.optJSONArray("creates");
									if (creates != null) {
//										item.id    = creates.optInt(0);
										item.yield = creates.getInt(1);
									}
								}
								
								// the item that teaches the recipe
								if (line.contains("id: 'taught-by-item'")) {
//									System.out.println("'taught-by-item' exists for " + entry.spell);
									
									line = line.substring(index + offset.length(), line.length() - suffix.length());
									rows = new JSONArray(line);
									row = rows.getJSONObject(0);
									
//									out.write("taught-by-item " + row + "\n");
									
									item.recipe = row.optInt("id");
									
									JSONArray sources = row.optJSONArray("source");
									if (sources != null) {
										String source = "";
										switch (sources.getInt(0)) {
											case 1  : source = "C"; break; // crafted by a player
											case 2  : source = "D"; break; // dropped as loot
											case 4  : source = "Q"; break; // quest reward
											case 5  : source = "V"; break; // bought from vendor
											case 6  : source = "T"; break; // learned from trainer
											case 10 : source = "R"; break; // starter recipe
											case 12 : source = "A"; break; // achievement reward
											case 16 : source = "F"; break; // fished up
											case 21 : source = "P"; break; // pickpocketed
										}
										if (item.recipe > 0) {
											recipes.add(new Recipe(item.recipe, item.spell, source));
										}
									}
								}
								addCombine(item);
							}
//							break;
						}
					}
					in.close();
//					out.close();
				}
			}
			
			System.out.println("  Done!                            \n");
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	public void writeToFile(String filename)
	{
		try
		{
			BufferedWriter out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File(filename))));

			out.write("\nTradeskillInfo.vars.specialcases = {\n");
//			for (Object item : specialcases) {
//				out.write(item + "\n");
//			}
			out.write("}\n");

			out.write("\nTradeskillInfo.vars.combines = {\n");
			for (Object item : combines) {
				out.write(item + "");
			}
			out.write("}\n");

			out.write("\nTradeskillInfo.vars.components = {\n");
			for (Map.Entry<Integer, String> entry : components.entrySet())
			{
				out.write("\t[" + entry.getKey() + "] = \"" + entry.getValue() + "\",\n");
			}
			out.write("}\n");

			out.write("\nTradeskillInfo.vars.recipes = {\n");
			for (Object item : recipes) {
				out.write(item + "\n");
			}
			out.write("}\n");

			out.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}


	public static void main(String argv[])
	{
		long starttime = System.currentTimeMillis();

		System.out.println("Beginning scan...");
		TSInfo tsi = new TSInfo();

		String[] professions = {
			"Alchemy",
			"Blacksmithing",
			"Cooking",
			"Enchanting",
			"Engineering",
			"First Aid",
			"Inscription",
			"Jewelcrafting",
			"Leatherworking",
			"Mining",
			"Tailoring",
		};

		for (String profession : professions) {
			System.out.println("Scanning " + profession + "...");
			tsi.readFromBuffed(profession);
			tsi.readFromWowHead(profession);
		}

		System.out.println("Saving data to Data.lua...");
		tsi.writeToFile("../Data.lua");

		long difftime = System.currentTimeMillis() - starttime;
		System.out.println("Scan completed in " + difftime / 1000 + " seconds.");
	}
}
