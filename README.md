TradeSkill Info
===============


What it does
------------

TradeSkill Info is an addon that gives you all the information that you need about tradeskills, including the ones that your character cannot craft.


It can add the following information to the tooltip of an item:

* What tradeskills it is used in, and how many different recipes for that tradeskill it is used in.
* Which of your characters can use the item.
* Where the item comes from: bought from a vendor, dropped, disenchanted or crafted.


It can add the following information to the tooltip for recipes and crafted items:

* If any of your characters knows the recipe.
* If any of your characters are able to learn the recipe.
* If any of your characters will be able to learn the recipe in the future.
* Where the recipe comes from: bought from a vendor, quest reward, dropped or crafted.


In the tradeskill craft window it will show:

* The cost of the combine (auctioneer or vendor prices), how much the result sells for to a vendor and the profit/loss.
* At what skill levels the recipe will change to a different difficulty level.
    For example, "40/60/80/120" means the recipe is learnable at skill level 40, will turn yellow at 60, green at 80 and grey at 120.


TradeSkill Info also has it's own UI. It is opened with "/tsi" or by binding a key to it in the keybindings menu.

* QuickSearch an item in the inventory will open the UI and show all recipes that use that item.
    QuickSearch key-mouse combination is configurable.  The default setting is shift-rightclick.

* Right-clicking a reagent icon in the TradeSkill Info UI with the AuctionFrame open will do a search for that reagent in the auction house.

* Shift-clicking on the recipe name in the list will paste the recipe link into an open chat editbox.


In the UI you can browse all tradeskills in the game.

* Freetext search on recipe name and reagent names.
* Expand or collapse which tradeskills to show.
* Filter which recipes to show:
    * If your current character knows the recipe.
    * If your current character can learn the recipe now.
    * If your current character will be able to learn the recipe later.
    * If one of your other characters knows the recipe.
    * If one of your other characters can learn the recipe now.
    * If one of your other characters will be able to learn the recipe later.
    * If it is not known by any of your characters.


Recipe names are color coded in the UI.

* White: Current character knows the recipe.
* Light Green: Current character can learn the recipe now.
* Yellow: Current character will be able to learn the recipe later.
* Grey: One of your other characters knows the recipe.
* Dark Green: One of your other characters can learn the recipe now.
* Orange: One of your other characters will be able to learn the recipe later.
* Red: Not known by any of your characters.


For items not yet cached by your WoW client, the icon will appear as a red "?" and clicking on it will try and to request item data from the server.


What it does not do
-------------------

TradeSkill Info is only a browsing tool.  It will not assist you in crafting items, but there are a great selection of other addons that provide this functionality.


Known issues
------------

* The built-in database is mostly up-to-date, but some of the recipes will show incorrect ingredients (for example, showing Autumn's Glow as a reagent for Brilliant Scarlet Ruby).
* A couple of jewelcrafting and inscription recipes may appear more than once.  This is due to how Blizzard "recycled" the crafting spells.
* Enchanting scrolls have not been added yet.


Configuration
-------------

A graphical configuration window can be opened by typing "/tsi config", right-clicking on the provided LibDataBroker button or binding a key in the keybindings menu.

Almost everything can be turned on or off according to your needs and preferences.


Translations
------------

This addon was written in English but has been translated into other languages.  It should work for everyone but I cannot guarantee completeness or accuracy of the provided translations.


Feedback
--------

If you have any comments, bug reports or feature requests, please leave a comment here or open a ticket on [WoWace](http://www.wowace.com/addons/tradeskill-info/tickets/).


* * *


About the Author
----------------

This addon is being lovingly maintained by Ethan Centaurai, who currently lives in Manningree in south-east England.

* Visit my [blog](http://www.noblewolf.net/).
* Follow me on [Twitter](http://twitter.com/StevenBlanchard).
* Star me on [GitHub](https://github.com/EthanCentaurai).


Credits
-------

TradeSkill Info has been written and maintained by several authors over the years, including Dys, wmrojer and evenue.
