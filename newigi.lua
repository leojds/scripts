------------------- Plugin Configurations -------------------
Logger = false; -- true if you want to recieve messages of what buffer is trying to do.
DefaultWord = "buff" ; --By pming the buffer a message that contain this word the buffer will buff everything it got in the default list for its class.
AeoreHealerDefaultBufflist = {'Speed of Saha','Force of Saha','Critical of Saha','Power of Saha','Clarity of Saha','Resistance of Saha','Saha the Blessing'} ; 
IssEnchanterDefaultBufflist = {'harmony',11565,11566,'Guitar Melody','Drum Melody','Pipe Organ Melody','Horn Melody','Harp Melody','Lute Melody','Mental Protection','Prevailing Sonata','Daring Sonata','Refreshing Sonata','Healing Melody'} ; 
EvaSaintDefaultBufflist = {"wind walk","shield","might","resist shock","holy weapon","prophecy of water"} ; -- those interested in those classes buffs fill up the list for proper buffs. 
DoomCryerDefaultBufflist = {"chant of victory","chant of fury"} ; -- those interested in those classes buffs fill up the list for proper buffs. 
DominatorDefaultBufflist = {} ; -- empty if u interested in those classes buffs make ur own list 
ShillienSaintDefaultBufflist = {} ; -- empty if u interested in those classes buffs make ur own list 
UnknownDefaultBufflist = {"defense aura","attack aura"} ; -- if the class isnt mentioned above then this is the list that will be made upon pm "buff" or sell item
----
IssEnchanterSonatasPMList = {'sonatas','sonata'} ;
IssEnchanterSonatasList = {'Prevailing Sonata','Daring Sonata','Refreshing Sonata'} ;
 
 
----------- Selling Buff Config ---------------------------
AllowSignleBuffItemForSale = true;
SignleBuffItemForSale = "Wooden Arrow";
SignleBuffItemForSalePrice = 70000;
AllowItem10TimesForSale = false; 
Item10TimesForSale = "Soulshot: No Grade";
Item10TimesForSalePrice = 900000;
AllowLifeTimeItemForSale = false; 
LifeTimeItemForSale = "Suede";
LifeTimeItemForSalePrice = 10000000;
CancelOldStockSaveOnNewClientInjection = false; -- with this true obviously if guy bought many items he will lose the buffs for them when you log the buffer with new client.
MpPercentOver80BuffDelay = 30; --secs
MpPercentBetween50to80BuffDelay = 60; --secs
MpPercentBetween20to50BuffDelay = 120; --secs
MpPercentLessThan20BuffDelay = 150; --secs
 
ShopTitle = "Buy one item " .. tostring(SignleBuffItemForSalePrice/1000) .. "k to get buffs!!";
AnnounceInShout = true; -- Do you want people to know your buffer bot is available? if true then you need to adjust the following 2 settings aswell.
ShoutAnnouncement = "!WTS Iss Buffs (Buy Item) " .. tostring(SignleBuffItemForSalePrice/1000).. "k only /target me!" -- Chat that will be said every (ShoutDelay) minutes.
ShoutAnnouncementList = {"!WTS Iss Buffs (Buy Item) " .. tostring(SignleBuffItemForSalePrice/1000).. "k only /target me!","buy item to get buffs no scam","buy from me best buffer here","if you dont want to get scammed buy from me","+WTS Iss Buffs (Buy Item) " .. tostring(SignleBuffItemForSalePrice/1000).. "k only /target me!","!WTS Enchanted iss buffs /target me!","sell enchanted buffs and cheap here","buy buffs from best win over the rest!"} ;
ShoutDelay = 5 ; -- in minutes
UseShopDuo = false; -- keep it false only creator of the plugin knows how to use this.
------------------------------------------------------------
----------- The following are custom buff lists as you wish.
----------- for those buffs there wont be check for class pming the command will simpy make bot try to cast the corrispondent buff.
PMListForAllBuffs = {'all','mage','everything'} ; -- pms that indicate a request for buffing all possible buffs.
BuffsIntendedForAllBuffs = {'Speed of Saha','Force of Saha','Critical of Saha','Power of Saha','Clarity of Saha','Resistance of Saha','Saha the Blessing'} ; -- those are buffs set in case you request pm from PMListForAllBuffs 
---
Specific1 = {'tank'} ; -- Pms that indicate buffing some other category of buffs.
SpecificBuffList1 = {"Knight's Harmony"} ; -- those are buffs set in case you request pm from Specific1
---
---
Specific2 = {'mage','wizard','feoh'} ; -- pms that indicate buffing some other category of buffs.
SpecificBuffList2 = {"Wizard's Harmony"} ; -- those are buffs set in case you request pm from Specific2
---
---
Specific3 = {'dd','fighter','archer'} ; -- pms that indicate buffing some other category of buffs.
SpecificBuffList3 = {"Warrior's Harmony"} ; -- those are buffs set in case you request pm from Specific3
---
 
SingleBuffsAbbreviations = { cov="chant of victory" , bers="berserker spirit" , pow="prophecy of water", drum="Drum Melody"} ; -- Set here your personal abriviations for any buff you want, for example if you want to recieve chant of victory by pming cov instead of whole skill name.
 
AllowBuffIfRangeLessThan = 900; -- Set Here the maximum range allowed between buffer and player requesting buff to be listened to.
AnnounceToClan = true; -- Do you want people to know your buffer bot is available? if true then you need to adjust the following 2 settings aswell.
ClanAnnouncement = "@PM me buff if you want buffs im available at clan hall." -- Chat that will be said every (AnnouncementDelay) minutes.
AnnouncementDelay = 30 ;
----- Set Permissions for buffing -----
 
AllowClanMembers = 171; -- Set Here Clan Id whom members will be abllowed to get buffed with the buffer by request, 0 indicates disabled.
AllowAllianceMembers = 0; -- Set Here Alliance Id whom members will be abllowed to get buffed with the buffer by request, 0 indicates disabled.
AllowPartyMembers = true; -- Set here true, if you want bot to listen to party members request for buffs otherwise set false.
AllowNamesinList = {'TehKiller','danceratsu'} ; -- Set Here Names of players that will be allowed to get buffed by request.
 
------------------- End of Configuration --------------------
nomplist = {"#Will Buff Shortly, need bit more mp.","#Just sec need little more mp.","#I will buff in a bit just waiting mp regen a bit."};
shortlylist = {"#Will Buff Shortly, need to see if anyone else need buffs as-well.","#I'll buff in a bit, waiting other guy.","#Give me sec to see if anyone else need buffs.","#will buff in a moment","#wait sec I will buff shortly","#just 30 seconds to see if anyone else need need to buy","#will buff in few seconds"};
leavepartylist = {"You have party, Please leave it.","Leave your party so I can invite you.","You already in party, please leave it so I can buff you.","Please leave your party for buffs."};
leaveptbblist = {"#good luck","#GL","#gl <img src="images/smilies/smile.gif" style="vertical-align: middle;" border="0" alt="Smile" title="Smile" />","#gl","#cya around","#ty"};
RecruitInGeneralChat = {"selling iss buffs, buy item quick will start buffing in secs","buffing in bit buy item quick if you want buffs","buffing shortly, your last chance to buy an item to get buffs before I start buffing","buy item for iss buffs asap imma start buffing in matter of seconds","I will buff in seconds your last chance to buy an item."};
buff = 0;
PmPing = true;
BuffEnabled = false;
SellingEnabled = false;
ChatSpamIgnore = false;
CheckStandUp = false;
WasPaused = false;
LastAnnouncement = os.time();
LastShoutAnnouncement = os.time();
LaunchSkill = true;
BlockBuff = false;
SetBuffSellShopstamp = GetTime();
invitetimestamp = GetTime();
standStampdelay = GetTime();
targetStampdelay = GetTime();
generalrecruitstamp = GetTime();
delayformoreinvitesStamp = 0;
delayformisstarget = 0;
DelayDecision = GetTime();
mpshout = GetTime();
lastrequest = GetTime();
KeepTryingShop = false;
queueanswer = false;
requestfullbuff = false;
requeststand = false;
requestshop = false;
keeptryingStamp = GetTime();
playersinstock = {} ;
buffstock = {} ;
ptlist = {} ;
lastpmleaveptnamelist = {} ;
templist = {} ;
autoinvitename = '';
lastrequestskilluse = GetTime();
ShopLocation = FVector();
requestopenshopafterdelay = false;
openshopstamp = GetTime();
PreAwakeMageClasses = {10,11,12,13,14,15,16,17,25,26,27,28,29,30,38,39,40,42,43,49,50,51,52,94,95,97,9&#8203;8,103,104,105,110,112,115,116} ;
PreAwakeTankClasses = {20,33,90,91,99,106} ; -- might need moving to warriors coz mostly they do solo
replyto = '';
LeavptStamp = GetTime();
leavepartyongoing = false;
RecruitInGeneralChatAnnouncebol = false;
 
firsttimeopenshop = true;
StartPming = false;
ShopInfoPms = '';
 
function LoadFile(filename) --function that uses filename file to obtain player stock.
	local file = io.open(GetDir() .. filename, "r")
	if (file == nil) then -- then create a file
 file = io.open(GetDir() .. filename, "w")	
	else	
 for line in file:lines() do
 local i = 1;
 local found = false;	
 while (i<=17) do 
 if (string.sub(line,i,i) == "_") and (found == false) then
 if tonumber(string.sub(line,i+1,string.len(line))) ~= nil then
 table.insert(playersinstock,string.sub(line,1,i-1));
 table.insert(buffstock,tonumber(string.sub(line,i+1,string.len(line))));
 found = true;
 end;
 end;
 i=i+1;
 end;
 end;
	end;
	file:close();	
	return temptable;	
end;
 
function UpdateStockFile(thefile,playerlist,stocklist)
	local file = io.open(GetDir() .. thefile, "w+")
	for x,oneinfo in ipairs(playerlist) do
 file:write(oneinfo .. "_" .. tostring(stocklist[x]) .. "\n");
	end;
	file:close();
end;
 
function OnCreate()
	this:RegisterCommand("buff", CommandChatType.CHAT_ALLY, CommandAccessLevel.ACCESS_ME); 
	this:RegisterCommand("sellbuffs", CommandChatType.CHAT_ALLY, CommandAccessLevel.ACCESS_ME); 
	this:RegisterCommand("announcebuffer", CommandChatType.CHAT_ALLY, CommandAccessLevel.ACCESS_ME);
	this:RegisterCommand("grant", CommandChatType.CHAT_ALLY, CommandAccessLevel.ACCESS_ME);
	this:RegisterCommand("freebuff", CommandChatType.CHAT_ALLY, CommandAccessLevel.ACCESS_ME);
	this:RegisterCommand("adenagain", CommandChatType.CHAT_ALLY, CommandAccessLevel.ACCESS_ME);
	this:RegisterCommand("selldelay", CommandChatType.CHAT_ALLY, CommandAccessLevel.ACCESS_ME);
	this:RegisterCommand("templistdump", CommandChatType.CHAT_ALLY, CommandAccessLevel.ACCESS_ME);
end;
 
function OnCommand_selldelay(vCommandChatType, vNick, vCommandParam)
	if (vCommandParam:GetCount() == 1) then
 if tonumber(vCommandParam:GetParam(0):GetStr(true)) then
 local x = tonumber(vCommandParam:GetParam(0):GetStr(true));
 
 if (MpPercentOver80BuffDelay + x > 0) then
 MpPercentOver80BuffDelay = MpPercentOver80BuffDelay + x; --secs
 else
 MpPercentOver80BuffDelay = 0; --secs
 end;
 if (MpPercentBetween50to80BuffDelay + x > 0) then
 MpPercentBetween50to80BuffDelay = MpPercentBetween50to80BuffDelay + x; --secs
 else
 MpPercentBetween50to80BuffDelay = 0; --secs
 end; 
 if (MpPercentBetween20to50BuffDelay + x > 0) then
 MpPercentBetween20to50BuffDelay = MpPercentBetween20to50BuffDelay + x; --secs
 else
 MpPercentBetween20to50BuffDelay = 0; --secs
 end; 
 if (MpPercentLessThan20BuffDelay + x > 0) then
 MpPercentLessThan20BuffDelay = MpPercentLessThan20BuffDelay + x; --secs
 else
 MpPercentLessThan20BuffDelay = 0; --secs
 end;
 ShowToClient("Buff Seller","The Delays Got Changed by " .. tostring(x) .. " seconds.");
 end;
	end;
end;
 
function OnCommand_templistdump(vCommandChatType, vNick, vCommandParam)
	for x,y in ipairs(templist) do
 ShowToClient(tostring(x),tostring(y));
	end;
end;
 
function OnCommand_freebuff(vCommandChatType, vNick, vCommandParam)
	local luckyguy = GetTarget();
	if (luckyguy ~= nil) and (luckyguy:IsPlayer()) and (luckyguy:GetName() ~= "") then
 ManualyAddValue(luckyguy:GetName(),1);	
	else
 ShowToClient("Error","You need Player on Target for this Action.");
	end;
end;
function OnCommand_adenagain(vCommandChatType, vNick, vCommandParam)
	AdenaGainBySelling();
end;
 
function AdenaGainBySelling()
	if (SellingEnabled == true) then
 local CurrentAdena = GetInventory():FindByDisplayId(57);
 if (CurrentAdena ~= nil) and (StartAdena ~= nil) then
 ShowToClient("Buff Sell","Since Start of buff selling you have obtained " .. tostring(CurrentAdena.ItemNum-StartAdena) .. " Adena.");
 else
 ShowToClient("Buff Sell","No Adena in Inventory.");
 end;
	end;
end;
 
function OnCommand_grant(vCommandChatType, vNick, vCommandParam)
	if (vCommandParam:GetCount() == 2) then
 if tonumber(vCommandParam:GetParam(1):GetStr(true)) then
 ManualyAddValue(vCommandParam:GetParam(0):GetStr(true),tonumber(vCommandParam:Ge&#8203;tParam(1):GetStr(true)));
 end;
	end;
end;
 
function ManualyAddValue(Name,amountdiff)
	FindPlayerAndUpdateTheStock(Name,amountdiff,SignleBuffItemForSale,true);
	UpdateStockFile("PlayersItemBuyStock" .. GetMe():GetName() .. ".txt",playersinstock,buffstock);
end;
 
function OnCommand_announcebuffer(vCommandChatType, vNick, vCommandParam)
	if AnnounceToClan == true then
 LastAnnouncement = os.time();
 Command(ClanAnnouncement);
	end;
	if (SellingEnabled == true) then
 LastShoutAnnouncement = os.time();
 Command(ShoutAnnouncement);
	end;
end;
 
function OnCommand_sellbuffs(vCommandChatType, vNick, vCommandParam)
	if (SellingEnabled == false) then
 if (GetMe():IsSiting()) then
 ShowToClient("Buff By PM","You need to be standing to do this action.");
 elseif (SCONFIG == nil) then
 LastShoutAnnouncement = os.time();
 ShowToClient("Buff By PM","Selling buffs mode on.");
 playersinstock = {} ;
 buffstock = {} ;
 LoadMemory();
 local StartAdenaM = GetInventory():FindByDisplayId(57);
 if (StartAdenaM ~= nil) then
 StartAdena = (GetInventory():FindByDisplayId(57)).ItemNum;
 else
 StartAdena = 0;
 end;
 
 SetBuffSellShop();
 else
 ShowToClient("Buff By PM","You Need Premium Account to support Private Shop functions.");
 end;
	else
 if (requeststand == false) then
 GetShopManager():StandIfHaveShop();
 if (Logger == true) then
 ShowToClient("Loger","StandFromShop Request Sent.");
 end;
 requeststand = true;
 requestshop = false;
 AddToLogFile("ItemBuyLogger.txt","Standing Up from shop");
 end;
 AdenaGainBySelling();
 SellingEnabled = false;
 ShowToClient("Buff By PM","Selling buffs mode off.");
	end;
end;
 
function OnCommand_buff(vCommandChatType, vNick, vCommandParam)
	if (BuffEnabled == false) then
 BuffEnabled = true;
 LastAnnouncement = os.time();
 ShowToClient("Buff By PM","Enabled.");
	else
 BuffEnabled = false;
 ShowToClient("Buff By PM","Disabled.");
	end;
end;
 
function SetBuffSellShop()
	AddToLogFile("ItemBuyLogger.txt","SetBuffSellShop start");
	SetBuffSellShopstamp = GetTime();
	if (PmPing == true) then 
 local itemtosell = 0;
 local gotitemstoopenshop = false;	
 if (SellingEnabled == false) then
 ShopLocation = GetMe():GetLocation();
 else
 if (GetDistanceVector(GetMe():GetLocation(),ShopLocation) > 100) and (GetDistanceVector(GetMe():GetLocation(),ShopLocation) < 6000) then
 MoveToNoWait(ShopLocation);
 end;
 end;
 if (firsttimeopenshop == true) or (UseShopDuo == false) then
 --Command("/vendor");
 GetShopManager():Clear();
 GetShopManager():SetShopType(Shop.SHOP_SELL);
 GetShopManager():SetTitle(ShopTitle);
 if (AllowSignleBuffItemForSale == true) then
 itemtosell = getItemByName(SignleBuffItemForSale);
 if (itemtosell ~= nil) then
 GetShopManager():AddItemByID(itemtosell,itemquantity,SignleBuffItemForSalePrice)&#8203;; 
 gotitemstoopenshop = true;
 else
 ShowToClient("Auto Buffer",SignleBuffItemForSale .. " is not available for sale.");
 end;
 end;
 if (AllowItem10TimesForSale == true) then
 itemtosell = getItemByName(Item10TimesForSale);
 if (itemtosell ~= nil) then
 GetShopManager():AddItemByID(itemtosell,itemquantity,Item10TimesForSalePrice); 
 gotitemstoopenshop = true;	
 else
 ShowToClient("Auto Buffer",Item10TimesForSale .. " is not available for sale.");
 end;
 end; 
 if (AllowLifeTimeItemForSale == true) then
 itemtosell = getItemByName(LifeTimeItemForSale);
 if (itemtosell ~= nil) then
 GetShopManager():AddItemByID(itemtosell,itemquantity,LifeTimeItemForSalePrice); 
 gotitemstoopenshop = true;	
 else
 ShowToClient("Auto Buffer",LifeTimeItemForSale .. " is not available for sale.");
 end;
 end; 
 if (gotitemstoopenshop == true) then
 if (GetDistanceVector(GetMe():GetLocation(),ShopLocation) < 100) then
 SellingEnabled = true;	
 GetShopManager():MakeShop();
 firsttimeopenshop = false;
 requestShopInDelay = false;
 requeststand = false;
 requestshop = true;	
 else
 requestShopInDelay = true;
 end;
 else
 BuffEnabled = true;
 SellingEnabled = false;
 ShowToClient("Auto Buffer","No Valid Items for sale.");
 end;
 else 
 ObjectId = getItemIdByName(SignleBuffItemForSale);
 if (ObjectId ~= nil) then
 if (GetDistanceVector(GetMe():GetLocation(),ShopLocation) < 100) then
 ShopInfoPms = 'shop info,' .. tostring(ObjectId) .. "," .. tostring(itemquantity) .. ',' .. tostring(SignleBuffItemForSalePrice); 
 StartPming = true; 
 requestShopInDelay = false;
 requeststand = false;
 requestshop = true;
 else
 requestShopInDelay = true;
 end;
 else
 BuffEnabled = true;
 SellingEnabled = false;
 ShowToClient("Auto Buffer","No Valid Items for sale.");
 end;
 end;
	else
 requestShopInDelay = true;
	end;
	AddToLogFile("ItemBuyLogger.txt","SetBuffSellShop end");
end;
 
function DelaySetShop()
	AddToLogFile("ItemBuyLogger.txt","DelaySetShop start");
	SetBuffSellShopstamp = GetTime();
	if (GetDistanceVector(GetMe():GetLocation(),ShopLocation) < 100) and (PmPing == true) then
 if (firsttimeopenshop == true) or (UseShopDuo == false) then
 SellingEnabled = true;	
 SetBuffSellShop();
 requestShopInDelay = false;
 else
 ObjectId = getItemIdByName(SignleBuffItemForSale);
 if (ObjectId ~= nil) then
 ShopInfoPms = 'shop info,' .. tostring(ObjectId) .. "," .. tostring(itemquantity) .. ',' .. tostring(SignleBuffItemForSalePrice); 
 StartPming = true; 
 requestShopInDelay = false;
 requestshop = true;
 end; 
 end;
	elseif (GetDistanceVector(GetMe():GetLocation(),ShopLocation) > 100) and (GetDistanceVector(GetMe():GetLocation(),ShopLocation) < 6000) then
 MoveToNoWait(ShopLocation);
	else
 if (PmPing == false) then
 if (SetBuffSellShopstamp + 5000 < GetTime()) then
 ShowToClient("Error","Char hasnt recieved his own pm yet. (delayed)");
 end;
 else
 ShowToClient("Error","You Are Far Far from shop spot..");
 end;
	end;
	AddToLogFile("ItemBuyLogger.txt","DelaySetShop end");
end;
 
function InsertIntoTempTable(BuffList) -- inserting the skills that need to be buffed into temporary array to be used.
	if (BuffList ~= nil) then
 templist = {} ;
 for a,b in ipairs(BuffList) do
 table.insert(templist,b)
 end;
	else
 ShowToClient("Auto Buffer","BuffList is invalid!.");
	end;
end;
 
function AddIntoTempTable(BuffList) -- inserting the skills that need to be buffed into temporary array to be used.
	if (BuffList ~= nil) then
 for a,b in ipairs(BuffList) do
 table.insert(templist,b)
 end;
	else
 ShowToClient("Auto Buffer","BuffList is invalid!.");
	end;
end; 
 
function FindTargetAndCleanItFromList(playername)
	AddToLogFile("ItemBuyLogger.txt","FindTargetAndCleanItFromList start");
	local foundfullbuff = false;
	local TargetSpot = 0;
	local EndSpot = 0;
 
	for x,y in ipairs(templist) do
 if (y == "fullbuff") then
 foundfullbuff = true;
 end;
 if (string.sub(y,1,8) == "/target ") and (string.sub(y,9,string.len(y)) == playername) then
 TargetSpot = x;
 end;
 if (TargetSpot ~= 0) and (y == "end") then
 EndSpot = x;
 break;
 end;	
	end;
 
 if (TargetSpot ~= 0) and (EndSpot ~= 0) then
 for t=TargetSpot,EndSpot,1 do
 table.remove(templist,TargetSpot);
 end;
 if (foundfullbuff == true) then
 BuffsIntendedForDefaultBuffs = GetMyBuffList();
 AdditionDefaultProcedure(BuffsIntendedForDefaultBuffs);
 if (GetMe():GetClass() == L2Class.CLASS_IssEnchanter) then
 RemoveLastInListWithValueIfAvailable(templist,"harmony")
 end;
 end;
 end;
 SendPM(playername,"You Didn't Accept pt Invitation ill buf without you now, pm me buff when rdy to join");
	if (Logger == true) then
 ShowToClient("Logger","Cleanining Requested because Player Didn't Accept pt Invitation");
	end;
	AddToLogFile("ItemBuyLogger.txt","FindTargetAndCleanItFromList end");
end;
 
function CleanListUntilNextTarget()
	AddToLogFile("ItemBuyLogger.txt","CleanListUntilNextTarget start");
	local foundfullbuff = false;	
	for x,y in ipairs(templist) do
 if (y == "fullbuff") then
 foundfullbuff = true;
 end;
 if (x > 1) and (y == "end") then
 for t=2,x,1 do
 table.remove(templist,2);
 end;
 if (foundfullbuff == true) then
 BuffsIntendedForDefaultBuffs = GetMyBuffList();
 AdditionDefaultProcedure(BuffsIntendedForDefaultBuffs);
 if (GetMe():GetClass() == L2Class.CLASS_IssEnchanter) then
 RemoveLastInListWithValueIfAvailable(templist,"harmony")
 end;
 end;
 end; 
	end;
	SendPM(string.sub(templist[1],9,string.len(templist[1])),"You are far, pm me buff when you are closer and need it.");
	if (Logger == true) then
 ShowToClient("Logger","Cleanining Coz Unavailability on Targeting");
	end;
	LaunchSkill = true;
	AddToLogFile("ItemBuyLogger.txt","CleanListUntilNextTarget end");
end;
 
function RequestSkillUseFromList(skilllist) -- this function request useskill for the first skill in array skilllist, and removes it from that array.
	AddToLogFile("ItemBuyLogger.txt","RequestSkillUseFromList start");
 if (skilllist ~= nil) then
 if (skilllist[1] ~= nil) then
 if (Logger == true) then
 ShowToClient("Buffer Proccessing",tostring(skilllist[1]));
 end;
 LaunchSkill = false;
 if (string.sub(skilllist[1],1,8) == "/target ") then
 newMember = nil;
 if (tonumber(string.sub(skilllist[1],9,string.len(skilllist[1]))) ~= nil) then
 newMember = GetUserById(tonumber(string.sub(skilllist[1],9,string.len(skilllist[1]))));
 end;
 if (newMember == nil) then
 newMember = GetUserByName(string.sub(skilllist[1],9,string.len(skilllist[1])));
 end;
 if (newMember ~= nil) then
 if (GetMe():GetRangeTo(newMember) < AllowBuffIfRangeLessThan) then
 if (newMember:GetId() ~= GetMe():GetTarget()) then
 ClearTargets();
 TargetRaw(newMember:GetId());
 MySupposedCurrentTarget = newMember:GetName();
 end;
 targetStampdelay = GetTime();
 local newMemberPet = GetUserPet(newMember);
 if (newMemberPet ~= nil) and (newMember:IsPetOrSummon() == false) then
 Removefromlistifavailable(templist,"leavept");
 Removefromlistifavailable(templist,"shop");
 if (GetMe():GetClass() == L2Class.CLASS_IssEnchanter) then -- for iss
 AddIntoTempTable({"/target " .. tostring(newMemberPet:GetId()),"Warrior's Harmony","end"});
 if (SellingEnabled == true) then
 AddIntoTempTable({"leavept","shop"});
 end; 
 else 
 AddIntoTempTable({"/target " .. tostring(newMemberPet:GetId())});
 AddIntoTempTable(BuffsIntendedForDefaultBuffs);
 AddIntoTempTable({"end"});
 if (SellingEnabled == true) then
 AddIntoTempTable({"leavept","shop"});
 end; 
 end; 
 end;
 else
 ShowToClient("Loger","Player Detected but is far!");
 CleanListUntilNextTarget();
 end;
 else
 CleanListUntilNextTarget();
 end;
 LaunchSkill = true;
 elseif (skilllist[1] == "decreasestock") then
 if ((GetTarget() ~= nil) and (GetTarget():GetName() == MySupposedCurrentTarget)) then 
 FindPlayerAndUpdateTheStock(GetTarget():GetName(),-1,SignleBuffItemForSale,false);
 UpdateStockFile("PlayersItemBuyStock" .. GetMe():GetName() .. ".txt",playersinstock,buffstock);
 end;
 LaunchSkill = true;
 elseif (skilllist[1] == "leavept") then
 Command(ChooseRandomValueFromTable(leaveptbblist));	
 Command("/leave");
 LaunchSkill = true;
 elseif (skilllist[1] == "fullbuff") then
 requestfullbuff = false;
 LaunchSkill = true;
 elseif (skilllist[1] == "delay") then
 LaunchSkill = true;
 elseif (skilllist[1] == "end") then
 LaunchSkill = true;
 elseif (skilllist[1] == "shop") then	
 PmPing = false;
 SetBuffSellShopstamp = GetTime();
 SendPM(GetMe():GetName(),"done");
 SetBuffSellShop();
 LaunchSkill = true;
 buff = 0;
 templist = {};
 lastpmleaveptnamelist = {} ;
 requestfullbuff = false;
 elseif (skilllist[1] == "harmony") then
 if ((GetTarget() ~= nil) and (GetTarget():GetName() ~= MySupposedCurrentTarget)) or (GetTarget() == nil) then
 delayformisstarget = delayformisstarget +1;
 if (delayformisstarget > 4) then
 CleanListUntilNextTarget();
 delayformisstarget = 0;
 end;
 elseif (GetSkills():FindById(11523) ~= nil) and ((GetTarget():GetClass() == L2Class.CLASS_SigelKnight) or CheckIfInsideList(GetTarget():GetClass(),PreAwakeTankClasses)) then --
 if (GetSkills():FindById(11523):IsSkillAvailable() == true) then
 UseSkillRaw(11523,false,false);
 delayformisstarget = 0;
 else
 table.insert(templist,1,11523);
 end;
 elseif (GetSkills():FindById(11525) ~= nil) and (((GetTarget():GetClass() == L2Class.CLASS_IssEnchanter) and (GetTarget():GetId() == GetMe():GetId())) or (GetTarget():GetClass() == L2Class.CLASS_AeoreHealer) or (GetTarget():GetClass() == L2Class.CLASS_FeohWizard) or CheckIfInsideList(GetTarget():GetClass(),PreAwakeMageClasses)) then --
 if (GetSkills():FindById(11525):IsSkillAvailable() == true) then
 UseSkillRaw(11525,false,false); 
 delayformisstarget = 0;
 else
 table.insert(templist,1,11525);
 end;
 elseif (GetSkills():FindById(11524) ~= nil) then -- by default warrior harmony.
 if (GetSkills():FindById(11524):IsSkillAvailable() == true) then
 UseSkillRaw(11524,false,false);
 delayformisstarget = 0;
 else
 table.insert(templist,1,11524);
 end;
 else
 delayformisstarget = 0;
 LaunchSkill = true;
 end;	
 elseif (type(skilllist[1]) == "number") then
 if ((GetTarget() ~= nil) and (GetTarget():GetName() ~= MySupposedCurrentTarget)) or (GetTarget() == nil) then
 delayformisstarget = delayformisstarget +1;
 if (delayformisstarget > 4) then
 CleanListUntilNextTarget();
 delayformisstarget = 0;
 end;
 else
 delayformisstarget = 0;
 if (GetSkills():FindById(skilllist[1]) ~= nil) then
 if (GetSkills():FindById(skilllist[1]):IsSkillAvailable() == true) then
 UseSkillRaw(skilllist[1],false,false);
 else
 ShowToClient("Buffer Proccessing","Skill on Cooldown so delay in place.");
 table.insert(templist,1,skilllist[1]);
 end;
 else
 ShowToClient("Error","Skill Id" .. tostring(skilllist[1]) .. " not available!");
 SkillLaunchMissRisk = false;
 LaunchSkill = true;
 end;
 end;
 else
 if ((GetTarget() ~= nil) and (GetTarget():GetName() ~= MySupposedCurrentTarget)) or (GetTarget() == nil) then
 delayformisstarget = delayformisstarget +1;
 if (delayformisstarget > 4) then
 CleanListUntilNextTarget();
 delayformisstarget = 0;
 end;
 else
 delayformisstarget = 0;
 Command("/useskill " .. skilllist[1]);
 if (SkillLaunchMissRisk == true) then
 SkillLaunchMissRisk = false;
 LaunchSkill = true;
 end;
 end;
 end;
 lastrequestskilluse = GetTime();
 table.remove(templist,1);
 else
 LaunchSkill = true;
 ClearTargets();
 CancelTarget(false);
 if (WasPaused == false) then
 SetPause(false);
 end;
 buff = 0;
 end;
 else
 LaunchSkill = true;
 buff = 0;
 end;
	AddToLogFile("ItemBuyLogger.txt","RequestSkillUseFromList end");
end;
 
function isFirstinlisttargetting()
	if (templist[1] ~= nil) then 
 if (string.sub(templist[1],1,8) == "/target ") then
 return true;
 end;
	end;
	return false;
end;
 
function OnLTick500ms() -- this function is called every half second.
	if ((SellingEnabled == true) or (BuffEnabled == true)) and (GetMe() ~= nil) then
 AddToLogFile("ItemBuyLogger.txt","OnLTick500ms start");
 if (buff ~= 3) then
 DelayForRegroup();
 end;
 AddToLogFile("ItemBuyLogger.txt","OnLTick500ms afterdelaycheck");
 if (ptlist[1]~= nil) then
 AddToLogFile("ItemBuyLogger.txt","OnLTick500ms ptlist");
 local usercheck = GetUserByName(ptlist[1]);
 if (usercheck == nil) then
 invitecount = 0;
 if (ptlist[2] ~= nil) then
 table.insert(ptlist,ptlist[1]);
 else
 FindTargetAndCleanItFromList(ptlist[1]);
 table.remove(templist,1);
 end;
 table.remove(ptlist,1); 
 else
 if (invitetimestamp +10000 < GetTime()) and (invitecount <= 5) then
 if (usercheck:IsMyPartyMember() == false) and (usercheck:GetId() ~= GetMe():GetId()) then
 autoinvitename = usercheck:GetName();
 Command("/invite " .. usercheck:GetName());
 invitetimestamp = GetTime();
 invitecount = invitecount+1;
 end;
 elseif (invitecount > 5) and (usercheck:IsMyPartyMember() == false) then
 invitecount = 0;
 if (ptlist[2] ~= nil) then
 table.insert(ptlist,ptlist[1]);
 else
 FindTargetAndCleanItFromList(usercheck:GetName());
 table.remove(templist,1);
 end;
 table.remove(ptlist,1);
 end;
 if (usercheck:IsMyPartyMember() == true) or (usercheck:GetId() == GetMe():GetId()) then
 invitecount = 0;
 table.remove(ptlist,1);
 end;
 end;
 elseif (standStampdelay + 5500 < GetTime()) and (CheckStandUp == false) and ((targetStampdelay + 2000 < GetTime()) or ((GetTarget() ~= nil) and (MySupposedCurrentTarget == GetTarget():GetName()) ) ) and (BlockBuff == false) and (GetMe():IsSiting() == false) then --(((standStampdelay + 5000 < GetTime())) or ((GetTarget() ~= nil) and (MySupposedCurrentTarget == GetTarget():GetName()) ) )
 AddToLogFile("ItemBuyLogger.txt","OnLTick500ms buffing proc");
 if (buff == 1) then
 ClearTargets();
 CancelTarget(false);
 buff = 2;
 elseif (isFirstinlisttargetting()) or (buff == 2) then
 buff = 3;
 RequestSkillUseFromList(templist);
 elseif (buff == 3) and (GetMe():IsUsingMagic() == false) and (LaunchSkill == true) and (lastrequest +600 < GetTime()) then
 RequestSkillUseFromList(templist);
 lastrequest = GetTime();
 end;
 end;
	end;
 
	if (StartPming == true) then 
 if (ShopInfoPms ~= '') then
 AddToLogFile("ItemBuyLogger.txt","OnLTick500ms l2phx request open shop");
 SendPM(GetMe():GetName(),ShopInfoPms);
 requeststand = false;
 ShopInfoPms = '';	
 else
 SellingEnabled = true;
 StartPming = false;
 end;
	end;
 
	if (CheckStandUp == true) and (GetMe() ~= nil) and (GetMe():IsSiting() == false) then
 CheckStandUp = false;
 standStampdelay = GetTime();
 ShowToClient("Buffer log","My Pt Members Count: " .. tostring(NumberOfElementsInList(ptlist) + GetMyPtMembersCount()));
	end;
end;
 
function FindPlayerAndUpdateTheStock(BuyerName,theammontupdate,itemtype,manually)
	AddToLogFile("ItemBuyLogger.txt","FindPlayerAndUpdateTheStock start");
	local value = 0;
	local change = 0; 
	if itemtype == LifeTimeItemForSale then
 value = 10000*theammontupdate;
	elseif itemtype == Item10TimesForSale then
 value = 10*theammontupdate;
	elseif itemtype == SignleBuffItemForSale then
 value = theammontupdate;
	end;
	if (manually == false) then
 change = 1;
	end;
	if CheckIfInsideList(BuyerName,playersinstock) then
 for x,y in ipairs(playersinstock) do
 if (y == BuyerName) then
 buffstock[x]=buffstock[x]+value;
 if ((buffstock[x] > 1) or ((buffstock[x] > 0) and (manually == true))) and not (value < 0) then
 if (theammontupdate == 1) and (manually == true) then
 SendPM(BuyerName,"Congratulation! You have won one Free Buff! find me and pm me buff anytime you want to use it.");
 else
 SendPM(BuyerName,"You have " ..tostring(buffstock[x]-change) .. " more buffs in stock, find me and pm me buff anytime you want to use it.");
 end;
 end;
 end;
 end;
	else
 table.insert(playersinstock,BuyerName);
 table.insert(buffstock,value);
 if (value > 1) or ((value > 0) and (manually == true)) then
 if (theammontupdate == 1) and (manually == true) then
 SendPM(BuyerName,"Congratulation! You have won one Free Buff! find me and pm me buff anytime you want to use it.");
 else
 SendPM(BuyerName,"You have " ..tostring(value-change) .. " more buffs in stock, find me and pm me buff anytime you want to use it.");
 end;
 end;
	end;
	AddToLogFile("ItemBuyLogger.txt","FindPlayerAndUpdateTheStock end");
end;
 
function Removefromlistifavailable(list,thevalue)
	AddToLogFile("ItemBuyLogger.txt","Removefromlistifavailable");
	for x,y in ipairs(list) do
 if (y == thevalue) then
 table.remove(list,x);
 end;
	end;
end;
 
function RemoveLastInListWithValueIfAvailable(list,thevalue)
	local position = nil;
	for x,y in ipairs(list) do
 if (y == thevalue) then
 position = x;
 end;
	end;
	if (position ~= nil) then
 AddToLogFile("ItemBuyLogger.txt","RemoveLastInListWithValueIfAvailable");
 table.remove(list,position);
	end;
end;
 
function GetMyPtMembersCount()
	local myptlist = GetPartyList():GetCount();
	local count = 0;
	if (tonumber(myptlist) ~= nil) then
 count = myptlist;
	end;
	AddToLogFile("ItemBuyLogger.txt","GetMyPtMembersCount, count:" ..tostring(count));
	return count;
end;
 
function DelayForRegroup()
	if (delayformoreinvitesStamp ~= 0) then
 if (GetMe():GetMpPercent() > 80) then
 DelayDecision = GetTime() + MpPercentOver80BuffDelay * 1000 ;
 elseif (GetMe():GetMpPercent() > 50) then
 DelayDecision = GetTime() + MpPercentBetween50to80BuffDelay * 1000 ;
 elseif (GetMe():GetMpPercent() > 20) then
 DelayDecision = GetTime() + MpPercentBetween20to50BuffDelay * 1000 ;
 else
 DelayDecision = GetTime() + MpPercentLessThan20BuffDelay * 1000 ;
 end; 
	end;
	AddToLogFile("ItemBuyLogger.txt","DelayForRegroup start");
	delayformoreinvitesStamp = 0;
	if (DelayDecision > GetTime()) and (GetMyPtMembersCount() < 4) then
 if (mpshout + 60000 < GetTime()) and (GetMyPtMembersCount() >= 1) and (SellingEnabled == true) then
 Command(ChooseRandomValueFromTable(shortlylist));	
 mpshout = GetTime();
 end;	
 BlockBuff = true;
	elseif (GetMe():GetMp() <= 1350) and (GetMe():GetMpPercent() <= 40) and (GetMe():GetClass() == L2Class.CLASS_IssEnchanter) then --and (NumberOfElementsInList(ptlist) + GetMyPtMembersCount() < 5)	
 if (mpshout + 60000 < GetTime()) and (GetMyPtMembersCount() >= 1) and (SellingEnabled == true) then
 Command(ChooseRandomValueFromTable(nomplist));	
 mpshout = GetTime();
 end;
 BlockBuff = true; 
	elseif (BlockBuff == true) then
 if (SellingEnabled == true) and (buff == 1) and (ptlist[1] == nil) then 
 if (requeststand == false) then
 GetShopManager():StandIfHaveShop();
 if (Logger == true) then
 ShowToClient("Loger","StandFromShop Request Sent.");
 end;
 requeststand = true;
 CheckStandUp = true;
 requestshop = false;
 AddToLogFile("ItemBuyLogger.txt","Standing Up from shop delay end");
 end;	
 BlockBuff = false;
 end;
 if (SellingEnabled == false) then
 BlockBuff = false;
 end;
	end;
	AddToLogFile("ItemBuyLogger.txt","DelayForRegroup end");
end;
 
function ChooseRandomValueFromTable(list)
	local count = 0;
	for i,v in ipairs(list) do
 count = i;
	end;
	if (count ~= 0) then
 AddToLogFile("ItemBuyLogger.txt","ChooseRandomValueFromTable");
 return list[math.ceil(math.random(1,count))];
	end;
	AddToLogFile("ItemBuyLogger.txt","ChooseRandomValueFromTable but nil!!!");
end;
 
function LeaveParty()
	Command("/leave");
end;
 
function RecruitInGeneralChatAnnounce()
	if (generalrecruitstamp + 10000 < GetTime()) then
 AddToLogFile("ItemBuyLogger.txt","RecruitInGeneralChat");
 Command(ChooseRandomValueFromTable(RecruitInGeneralChat));
 generalrecruitstamp = GetTime();
	end;
end;
 
function OnChatSystemMessage(id, msg)
	local sysmsg = msg;
	local messid = id;
	if (messid == 46) and ((SellingEnabled == true) or (BuffEnabled == true)) then --you use xxx skill
 LaunchSkill = true;
 SkillLaunchMissRisk = false;
	end;
	if (messid == 160) and ((SellingEnabled == true) or (BuffEnabled == true)) then --member of another pt 
 AddToLogFile("ItemBuyLogger.txt","member of another pt");
 if (ptlist[1] ~= nil) and (invitecount <= 1) then
 if (autoinvitename ~= '') and (invitetimestamp < GetTime()+ 10000) and (CheckIfInsideList(autoinvitename,lastpmleaveptnamelist) == false) then
 SendPM(autoinvitename,ChooseRandomValueFromTable(leavepartylist));
 table.insert(lastpmleaveptnamelist,autoinvitename);
 end;
 end;
	end;
 
	if (messid == 2411) and ((SellingEnabled == true) or (BuffEnabled == true)) then --member of another pt 
 AddToLogFile("ItemBuyLogger.txt","member on auto reject invite");
 if (ptlist[1] ~= nil) and (invitecount <= 1) then
 if (autoinvitename ~= '') and (invitetimestamp < GetTime()+ 10000) and (CheckIfInsideList(autoinvitename,lastpmleaveptnamelist) == false) then
 SendPM(autoinvitename,"You need to remove the auto party invite refusal.");
 table.insert(lastpmleaveptnamelist,autoinvitename);
 end;
 end;
	end;	
 
	if (messid == 107) and ((SellingEnabled == true) or (BuffEnabled == true)) then --somone joined pt.
 AddToLogFile("ItemBuyLogger.txt","someone joined pt");
 if ((DelayDecision - 7000 > GetTime()) or (DelayDecision < GetTime()) ) and (mpshout +10000 < GetTime()) and (BlockBuff == true) then
 if (math.random(0,100) < 80) then
 Command(ChooseRandomValueFromTable(shortlylist));
 end;
 mpshout = GetTime();
 if (DelayDecision - 15000 >= GetTime()) and (SellingEnabled == true) then
 RecruitInGeneralChatAnnouncebol = true;
 end;
 elseif (GetMe():GetMp() <= 1350) and (mpshout +10000 < GetTime()) and (BlockBuff == true) then
 Command(ChooseRandomValueFromTable(nomplist));
 mpshout = GetTime();
 end;
	end;
	if (messid == 1135) and (SellingEnabled == true) then --engaged in combat cant open store
 requestopenshopafterdelay = true;
 openshopstamp = GetTime()+ 50000;
	end;
	if (SellingEnabled == true) then
 if (messid == 380) then --item got purchased (id == 378) or (id == 379) maybe unused
 i=1;
 firstspace = false;
 secondspace = false;
 BuyerName = nil;
 while (i<=17) do 
 if (string.sub(msg,i,i) == " ") then 
 BuyerName = string.sub(msg,1,i-1);
 invitecount = 0;
 AddToLogFile("ItemBuyLogger.txt","ShopInfo, Start");
 if (buff == 0) then
 if (IsPaused() == false) then
 WasPaused = false;
 else
 WasPaused = true;
 end;
 SetPause(true);
 templist = {};
 requestfullbuff = false;
 lastpmleaveptnamelist = {} ;
 if (GetMe():GetClass() == L2Class.CLASS_IssEnchanter) then
 if (GetMe():GotBuff(11525) == false) then
 AddIntoTempTable({"/target " .. GetMe():GetName(),"harmony"});
 elseif (GetMe():GotBuff(11529) == false) then
 AddIntoTempTable({"/target " .. GetMe():GetName()});
 end;
 if (GetMe():GotBuff(11529) == false) then
 AddIntoTempTable({"Prevailing Sonata"});
 end;
 AddIntoTempTable({"end"});
 end;
 end;
 if (requestfullbuff == false) then 
 delayformoreinvitesStamp = GetTime();
 AddIntoTempTable({"/target " .. BuyerName});
 BuffsIntendedForDefaultBuffs = GetMyBuffList();
 AddIntoTempTable(BuffsIntendedForDefaultBuffs);
 AddIntoTempTable({"fullbuff"});
 requestfullbuff = true;
 AddIntoTempTable({"end","leavept","decreasestock","shop"});
 elseif (requestfullbuff == true) and (GetUserByName(BuyerName)~= nil) and (GetUserByName(BuyerName):IsMyPartyMember() == false) then
 Removefromlistifavailable(templist,"leavept");
 Removefromlistifavailable(templist,"shop");
 if (GetMe():GetClass() == L2Class.CLASS_IssEnchanter) then -- for iss
 AddIntoTempTable({"/target " .. BuyerName,"harmony","end","leavept","decreasestock","shop"});
 else -- for target buffs
 AddIntoTempTable({"/target " .. BuyerName});
 AddIntoTempTable(BuffsIntendedForDefaultBuffs);
 AddIntoTempTable({"end","leavept","decreasestock","shop"});
 end;
 end;
 AddToLogFile("ItemBuyLogger.txt","ShopInfo, before ptlist");
 if (GetMe():GetClass() == L2Class.CLASS_IssEnchanter) or (GetMe():GetClass() == L2Class.CLASS_Doomcryer) or (GetMe():GetClass() == L2Class.CLASS_Dominator) then 
 table.insert(ptlist,BuyerName);
 end;
 if (SellingEnabled == true) and (buff == 1) and (NumberOfElementsInList(ptlist) + GetMyPtMembersCount() > 4) then 
 if (requeststand == false) then
 requestshop = false;
 GetShopManager():StandIfHaveShop();
 if (Logger == true) then
 ShowToClient("Loger","StandFromShop Request Sent.");
 end;
 CheckStandUp = true;
 requeststand = true; 
 if Logger == true then
 ShowToClient("Logger","Standing Up coz party reached 5+");
 AddToLogFile("ItemBuyLogger.txt","Standing Up coz party reached 5+");
 end;
 end;
 end;
 AddToLogFile("ItemBuyLogger.txt","ShopInfo, after ptlist");
 tempname = BuyerName;
 buff = 1;	
 if (firstspace == false) then
 u = 1;
 while (u<=6) do
 if (string.sub(msg,i+11+u,i+11+u) == " ") then
 BuyAmount = tonumber(string.sub(msg,i+11,i+10+u));
 ItemName = string.sub(string.sub(msg,i+12+u), 1,string.len(string.sub(msg,i+12+u))-4);
 FindPlayerAndUpdateTheStock(BuyerName,BuyAmount,ItemName,false);
 UpdateStockFile("PlayersItemBuyStock" .. GetMe():GetName() .. ".txt",playersinstock,buffstock); 
 ShowToClient("Buff Sell","Player: " .. BuyerName .. " has bought " .. tostring(BuyAmount) .. " " .. ItemName .. ".");
 AddToLogFile("ItemBuyLogger.txt","ShopInfo, end");
 break;
 end;
 u=u+1;
 end;
 end;
 firstspace = true;
 break;
 end;
 i=i+1;
 end;
 end;	
	end;
end;
 
function getItemByName(name)
	local invList = GetInventory();
 for item in invList.list do
 if item.Name == name then
 itemquantity = item.ItemNum;
 return item.displayId;
 end;
 end;
	return nil;
end;
 
function getItemIdByName(name)
	local invList = GetInventory();
 for item in invList.list do
 if item.Name == name then
 itemquantity = item.ItemNum;
 return item.objectId;
 end;
 end;
	return nil;
end;
 
function OnLTick1s()
	if (LastAnnouncement + AnnouncementDelay * 60 < os.time()) and (BuffEnabled == true) and (AnnounceToClan == true) then
 LastAnnouncement = os.time();
 Command(ClanAnnouncement);
	elseif (SellingEnabled == true) and (LastShoutAnnouncement + ShoutDelay * 60 < os.time()) and (AnnounceInShout == true) then
 LastShoutAnnouncement = os.time();
 if (GetMe():GetName() == "BlackHouse") then
 ShoutDelay = 1 ; -- in minutes
 ShoutAnnouncement = ChooseRandomValueFromTable(ShoutAnnouncementList);
 end;
 Command(ShoutAnnouncement);
	elseif (queueanswer == true) and (AnswerStamp < GetTime()) then
 SendPM(replyto,Answer);
 queueanswer = false;
	elseif (RecruitInGeneralChatAnnouncebol == true) then
 RecruitInGeneralChatAnnouncebol = false;
 RecruitInGeneralChatAnnounce();
	elseif (requestShopInDelay == true) then
 DelaySetShop();
	elseif (requestopenshopafterdelay == true) and (openshopstamp < GetTime()) and (SellingEnabled == true) then
 requestopenshopafterdelay = false;
 SetBuffSellShop();
	elseif (leavepartyongoing == true) and (LeavptStamp < GetTime()) then
 leavepartyongoing = false;
 LeaveParty();
	elseif (requestshop == true) and (requestopenshopafterdelay == false) and (GetMe() ~= nil) and (GetMe():GetShopStatus() ~= 1) and (SetBuffSellShopstamp + 30000 < GetTime()) and (GetMe():IsSiting() == false) and (requestShopInDelay == false) then
 ShowToClient("Error","for some reason shop didnt open , so reopening it based on delay time!");
 MoveToNoWait(ShopLocation);
 SendPM(GetMe():GetName(),"done");
 SetBuffSellShop();
 LaunchSkill = true;
 buff = 0;
 templist = {};
 lastpmleaveptnamelist = {} ;
 requestfullbuff = false;
	end;
 
	if (lastrequestskilluse +10000 < GetTime()) and (buff == 3) and (LaunchSkill == false) then
 LaunchSkill = true;
	end;
end;
 
function GotItemsinStock(User)
	for x,y in ipairs(playersinstock) do
 if (y == User) then
 if (tonumber(buffstock[x]) ~= nil) and (buffstock[x] > 0) then
 return true;
 end;
 end;
	end;
	return false;
end;
 
function GotExtraItemsinStock(User)
	for x,y in ipairs(playersinstock) do
 if (y == User) then
 if (tonumber(buffstock[x]) ~= nil) and (buffstock[x] > 1) then
 return true;
 end;
 end;
	end;
	return false;
end;
 
function isUserGotPermission(UserNameS) -- function return true if the player (name) who is requesting to be buffed is one of the players inside allowed categories.
	local UserinL = GetUserByName(UserNameS);
	if CheckIfInsideList(UserNameS,AllowNamesinList) then
 return true;
	elseif (UserinL ~= nil) and (UserinL:IsMyPartyMember() == true) and (AllowPartyMembers == true) then
 return true;
	elseif (UserinL ~= nil) and (AllowAllianceMembers ~= 0) and (UserinL:GetAllianceId() == AllowAllianceMembers) then
 return true;
	elseif (UserinL ~= nil) and (AllowClanMembers ~= 0) and (UserinL:GetClanId() == AllowClanMembers) then
 return true;
	elseif GotItemsinStock(UserNameS) then
 return true;
	end; 
	return false;
end;
 
function CheckIfInsideList(Smsg,Rmsglist) -- function return true if variable Smsg is available in Rmsglist array.
	AddToLogFile("ItemBuyLogger.txt","CheckifinList, Smg:" .. Smsg);
	if (Rmsglist ~= nil) then
 for x,y in ipairs(Rmsglist) do
 if (y == Smsg) then
 return true;
 end;
 end;
	end;
	AddToLogFile("ItemBuyLogger.txt","CheckifinList, done returning false");
	return false;	
end;
 
function NumberOfElementsInList(Rmsglist) -- function return true if variable Smsg is available in Rmsglist array.
	local count = 0;
	if (Rmsglist ~= nil) and (Rmsglist[1]~= nil) then
 for x,y in ipairs(Rmsglist) do
 count = x;
 if (Rmsglist[x] == nil) or (Rmsglist[x] == "") or (type(Rmsglist[x]) ~= "string") then
 ShowToClient("error","counted nil");
 end;
 end;
	end;
	AddToLogFile("ItemBuyLogger.txt","NumberOfElementsInList, count:" .. tostring(count));
	return count;
end;
 
function SkillRealName(skillnameM) -- function which converts the skill abreviation to its real name.
	AddToLogFile("ItemBuyLogger.txt","SkillRealName, skillnameM:" .. skillnameM);
	for k,v in ipairs(SingleBuffsAbbreviations) do 
 if (k == skillnameM) then
 return v;
 end;
	end;
	return skillnameM;
end;
 
function GetMyBuffList()
	if (GetMe():GetClass() == L2Class.CLASS_AeoreHealer) then
 return AeoreHealerDefaultBufflist;
	elseif (GetMe():GetClass() == L2Class.CLASS_IssEnchanter) then
 return IssEnchanterDefaultBufflist;
	elseif (GetMe():GetClass() == L2Class.CLASS_EvaSaint) then
 return EvaSaintDefaultBufflist;
	elseif (GetMe():GetClass() == L2Class.CLASS_Doomcryer) then
 return DoomCryerDefaultBufflist;
	elseif (GetMe():GetClass() == L2Class.CLASS_Dominator) then
 return DominatorDefaultBufflist;
	elseif (GetMe():GetClass() == L2Class.CLASS_ShillienSaint) then
 return ShillienSaintDefaultBufflist;
	else
 return UnknownDefaultBufflist;
	end;
end;
 
function FindSubStringInString(thesub,thestring) -- build it myself the lua built-in one is not working exactly as needed.
	for x = 1, 1 + string.len(thestring)-string.len(thesub),1 do
 if (string.sub(thestring,x,x+string.len(thesub)-1) == thesub) then
 return true;
 end;
	end;
	return false;
end;
 
function OnChatUserMessage(chatType, nick, msg)
	local UserRawName = nick;
	local TalkingUser = GetUserByName(UserRawName);
	if (UserRawName == GetMe():GetName()) and (msg == "done") then
 PmPing = true;
	elseif ((BuffEnabled == true) or (SellingEnabled == true)) and (TalkingUser ~= nil) then
 myself = GetMe();
 if (chatType == 2) and (SellingEnabled == true) and (ChatSpamIgnore == false) and (myself:GetRangeTo(TalkingUser) < AllowBuffIfRangeLessThan) and (isUserGotPermission(UserRawName) == false) and (UserRawName ~= replyto) then
 Message = string.lower(msg); -- Converts message to lower case letters.
 Message = Message:gsub("^%s*(.-)%s*$", "%1"); -- Trimming message of spaces on start.
 if (Message == "pt") or (Message == "buff") or (Message == "party") or (Message == "party me") or (Message == "buff me") or (Message == "pt me") or (Message == "buffs pls") or (Message == "buff pls") or (Message == "buff me pliz") or (Message == "buff me plis") or (Message == "buff me plz") or (Message == "inv me") or (Message == "invite me") or (Message == "buff plz") or (Message == "buff please") then
 Answer = "buy an item from me to get";
 replyto = UserRawName;
 AnswerStamp = GetTime() + 7000;
 queueanswer = true;
 elseif (Message == "how much?") or (Message == "price?") or (Message == "cost?") or (Message == "how much adena?") or (Message == "how much cost?") then
 Answer = tostring(SignleBuffItemForSalePrice) .. " adena for one buff.";
 replyto = UserRawName;
 AnswerStamp = GetTime() + 5000;
 queueanswer = true; 
 elseif FindSubStringInString("on?",Message) or FindSubStringInString("here?",Message) or FindSubStringInString("here ?",Message) or FindSubStringInString("on ?",Message) then --if (string.find(Message,"on?")) or (string.find(Message,"here?")) then -- or (string.find(Message,"on ?")) or (string.find(Message,"here ?"))
 Answer = "y";
 replyto = UserRawName;
 AnswerStamp = GetTime() + 5000;
 queueanswer = true;	
 elseif FindSubStringInString("hi",Message) or FindSubStringInString("hello",Message) or FindSubStringInString("hey",Message) then
 Answer = "hi";
 replyto = UserRawName;
 AnswerStamp = GetTime() + 5000;
 queueanswer = true;	
 end;
 elseif (ChatSpamIgnore == false) and (myself:GetRangeTo(TalkingUser) < AllowBuffIfRangeLessThan) and (isUserGotPermission(UserRawName) == true) then	--and (buff == 0)	
 Message = string.lower(msg); -- Converts message to lower case letters.
 Message = Message:gsub("^%s*(.-)%s*$", "%1"); -- Trimming message of spaces on start.
 tempname = UserRawName;
 ChatSpamIgnore = true;
 if (chatType == 2) or ((chatType == L2ChatType.CHAT_CLAN) and FindSubStringInString(DefaultWord,Message) and FindSubStringInString(myself:GetName(),Message) ) or ((FindSubStringInString(DefaultWord,Message)) and (chatType == 0) and (myself:GetRangeTo(TalkingUser) < 150) and (UserRawName ~= myself:GetName())) then
 if (chatType == 2) and (FindSubStringInString("on?",Message) or FindSubStringInString("here?",Message) or FindSubStringInString("here ?",Message) or FindSubStringInString("on ?",Message)) then --if (string.find(Message,"on?")) or (string.find(Message,"here?")) then -- or (string.find(Message,"on ?")) or (string.find(Message,"here ?"))
 Answer = "y";
 replyto = UserRawName;
 AnswerStamp = GetTime() + 5000;
 queueanswer = true;
 end;
 if FindSubStringInString(DefaultWord,Message) and (NumberOfElementsInList(ptlist) + GetMyPtMembersCount() <= 6) then
 if (chatType == 2) and (FindSubStringInString("hi",Message) or FindSubStringInString("hello",Message) or FindSubStringInString("hey",Message)) then
 Answer = "hi";
 replyto = UserRawName;
 AnswerStamp = GetTime() + 5000;
 queueanswer = true;	
 end;
 FullBuffRequest(tempname);
 elseif (CheckIfInsideList(Message,PMListForAllBuffs)) then
 AddToQueue();
 if (guyinqueue == false) then
 AddIntoTempTable(BuffsIntendedForAllBuffs);
 AddIntoTempTable({"end"});
 if (SellingEnabled == true) then
 AddIntoTempTable({"shop"});
 end;
 end;
 elseif (CheckIfInsideList(Message,IssEnchanterSonatasPMList)) then
 AddToQueue();
 if (guyinqueue == false) then
 AddIntoTempTable(IssEnchanterSonatasList);
 AddIntoTempTable({"end"});
 if (SellingEnabled == true) then
 AddIntoTempTable({"shop"});
 end;
 end;
 elseif (CheckIfInsideList(Message,Specific1)) then
 AddToQueue();
 if (guyinqueue == false) then
 AddIntoTempTable(SpecificBuffList1);
 AddIntoTempTable({"end"});
 if (SellingEnabled == true) then
 AddIntoTempTable({"shop"});
 end;
 end;
 elseif (CheckIfInsideList(Message,Specific2)) then
 AddToQueue();
 if (guyinqueue == false) then
 AddIntoTempTable(SpecificBuffList2);
 AddIntoTempTable({"end"});
 if (SellingEnabled == true) then
 AddIntoTempTable({"shop"});
 end;
 end;
 elseif (CheckIfInsideList(Message,Specific3)) then
 AddToQueue();
 if (guyinqueue == false) then
 AddIntoTempTable(SpecificBuffList3);
 AddIntoTempTable({"end"});
 if (SellingEnabled == true) then
 AddIntoTempTable({"shop"});
 end;
 end;
 elseif (SellingEnabled == false) then
 AddToQueue();
 AddIntoTempTable({SkillRealName(Message)});
 AddIntoTempTable({"end"});
 SkillLaunchMissRisk = true;
 end;
 end;
 
 if (chatType == L2ChatType.CHAT_PARTY) then
 if (myself:GetClass() == L2Class.CLASS_IssEnchanter) then
 if FindSubStringInString("wizard",Message) then
 leavepartyongoing = false;
 AddIntoTempTable({"delay"}); -- for cooldown reasons.
 AddIntoTempTable({"/target " .. tempname});	
 invitecount = 0;
 table.insert(ptlist,tempname);
 if (buff == 0) then
 buff = 1;
 end;
 AdditionDefaultProcedure({11525});
 end;
 if FindSubStringInString("warrior",Message) then
 leavepartyongoing = false;
 AddIntoTempTable({"delay"});
 AddIntoTempTable({"/target " .. tempname});
 invitecount = 0;
 table.insert(ptlist,tempname);
 if (buff == 0) then
 buff = 1;
 end;
 AdditionDefaultProcedure({11524});
 end;
 if FindSubStringInString("knight",Message) then
 leavepartyongoing = false;
 AddIntoTempTable({"delay"});
 AddIntoTempTable({"/target " .. tempname});	
 invitecount = 0;
 table.insert(ptlist,tempname);
 if (buff == 0) then
 buff = 1;
 end;
 AdditionDefaultProcedure({11523});
 end;
 
 
 
 if (string.sub(Message,1,4) == "inv ") then
 AdressedMember = GetFirstWord(string.sub(Message,5,string.len(Message)));
 if (AdressedMember ~= nil) and (GetUserByNameDisregardingCaps(AdressedMember) ~= nil) and GotExtraItemsinStock(UserRawName) then
 AddIntoTempTable({"/target " .. tempname});	
 AdditionDefaultProcedure({"decreasestock"});
 FullBuffRequest(AdressedMember);
 end;
 end;
 
 if (string.sub(Message,1,7) == "invite ") then
 AdressedMember = GetFirstWord(string.sub(Message,8,string.len(Message)));
 if (AdressedMember ~= nil) and (GetUserByNameDisregardingCaps(AdressedMember) ~= nil) and (GotExtraItemsinStock(UserRawName)) then
 AddIntoTempTable({"/target " .. UserRawName});	
 AdditionDefaultProcedure({"decreasestock"});
 FullBuffRequest(AdressedMember);
 end;
 end; 
 end;
 end;
 ChatSpamIgnore = false;
 end;
	end;	
end;
 
function GetFirstWord(thestring)
	refinedstring = thestring:gsub("^%s*(.-)%s*$", "%1"); -- Trimming message of spaces on start.
	for r = 1,string.len(refinedstring),1 do
 if (string.sub(refinedstring,r,r) == " ") then
 return string.sub(refinedstring,1,r-1);
 elseif (refinedstring ~= "") and (refinedstring ~= " ") then
 return refinedstring;
 end;
	end;
end;
 
function AdditionDefaultProcedure(mainadd)
	Removefromlistifavailable(templist,"leavept");
	Removefromlistifavailable(templist,"shop");
	AddIntoTempTable(mainadd);
	AddIntoTempTable({"end"});
	if (SellingEnabled == true) then
 AddIntoTempTable({"leavept","shop"});
	end;
end;
 
function GetUserByNameDisregardingCaps(name)
	local tempuser = GetUserByName(AdressedMember);
	if (GetUserByName(AdressedMember) ~= nil) then
 return tempuser;
	end;
	local players = GetPlayerList();
	for player in players.list do
 if (string.lower(player:GetName()) == string.lower(name)) then
 return player;
 end;
	end;	
end;
 
function AddToQueue()
	guyinqueue = false;
	if (SellingEnabled == true) and (buff == 0) then	-- need to know which one read the item 
 delayformoreinvitesStamp = GetTime();
 templist = {};
	end;
 
	if (CheckIfInsideList(tempname,ptlist) == true) or ((GetUserByName(tempname) ~= nil) and (GetUserByName(tempname):IsMyPartyMember() == true)) then
 guyinqueue = true;
	end;
 
	if (buff <= 1) and (guyinqueue == false) then
 if (buff == 0) then
 if (IsPaused() == false) then
 WasPaused = false;
 else
 WasPaused = true;
 end;
 lastpmleaveptnamelist = {} ;
 requestfullbuff = false;	
 SetPause(true);
 templist = {};
 
 if (myself:GetClass() == L2Class.CLASS_IssEnchanter) then
 if (myself:GotBuff(11525) == false) then
 AddIntoTempTable({"/target " .. myself:GetName(),"harmony"});
 elseif (myself:GotBuff(11529) == false) then
 AddIntoTempTable({"/target " .. myself:GetName()});
 end;
 
 if (myself:GotBuff(11529) == false) then
 AddIntoTempTable({"Prevailing Sonata"});
 end; 
 end;
 end;
 AddIntoTempTable({"/target " .. tempname});
 if (myself:GetClass() == L2Class.CLASS_IssEnchanter) or (myself:GetClass() == L2Class.CLASS_Doomcryer) or (myself:GetClass() == L2Class.CLASS_Dominator) then 
 invitecount = 0;
 table.insert(ptlist,tempname);
 end;
 buff = 1;
	end; 
end;
 
function LoadMemory()
	if (CancelOldStockSaveOnNewClientInjection == true) then
 local file = io.open(GetDir() .. "PlayersItemBuyStock" .. GetMe():GetName() .. ".txt", "r");
 if (file == nil) then -- then create a file
 file = io.open(GetDir() .. "PlayersItemBuyStock" .. GetMe():GetName() .. ".txt", "w");
 else
 file:close();
 file = io.open(GetDir() .. "PlayersItemBuyStock" .. GetMe():GetName() .. ".txt", "w+");
 end;
 file:close();
	else
 LoadFile("PlayersItemBuyStock" .. GetMe():GetName() .. ".txt");
	end;
end;
 
function AddToLogFile(thefile,thevalue)
	if (Logger == true) then
 local file = io.open(GetDir() .. thefile, "a+")
 file:write(thevalue .. "\n");
 file:close();
	end;
end;
 
function GetUserPet(theuser)
	local petlistaround = GetPetList();
	local thepet = nil;	
	for Apet in petlistaround.list do
 if (Apet:GetNickName() == theuser:GetName()) and (Apet:IsSummon() == false) then
 thepet = Apet;
 end;
	end;
	return thepet;
end;
 
function OnTeleportToLocation(user, oldLocation, newLocation)
	if user:IsMe() and (SellingEnabled == true) then
 ShowToClient("Attention","This char was teleported while on auto sell buffs, which could be made by GM that is checking if your bot is auto, to prevent any suspecious behaviour auto sellbuff is disabled now.");
 SellingEnabled = false;
 AddToLogFile("ItemBuyLogger.txt","Got Teleported While on auto sell buffs.");
	end;
end;
 
function FullBuffRequest(username)
	tempname = username;
	AddToQueue();
	if (guyinqueue == false) and (buff < 2) and (requestfullbuff == false) then
 if (requestfullbuff == false) then
 Removefromlistifavailable(templist,"leavept");
 Removefromlistifavailable(templist,"shop");
 end;
 BuffsIntendedForDefaultBuffs = GetMyBuffList();
 AddIntoTempTable(BuffsIntendedForDefaultBuffs);
 AddIntoTempTable({"fullbuff"});
 requestfullbuff = true;
 AddIntoTempTable({"end"});
 if (SellingEnabled == true) then
 AddIntoTempTable({"leavept","decreasestock","shop"});
 end;
 
	elseif (guyinqueue == false) and (buff < 2) and (requestfullbuff == true) then
 if (myself:GetClass() == L2Class.CLASS_IssEnchanter) or (myself:GetClass() == L2Class.CLASS_Doomcryer) or (myself:GetClass() == L2Class.CLASS_Dominator) then 
 invitecount = 0;	
 table.insert(ptlist,tempname);
 end;
 Removefromlistifavailable(templist,"leavept");
 Removefromlistifavailable(templist,"shop");
 if (myself:GetClass() == L2Class.CLASS_IssEnchanter) then -- for iss
 AddIntoTempTable({"harmony","end"});
 if (SellingEnabled == true) then
 AddIntoTempTable({"leavept"});
 AddIntoTempTable({"decreasestock","shop"});
 end;
 else -- for target buffs
 AddIntoTempTable({"/target " .. tempname});
 AddIntoTempTable(BuffsIntendedForDefaultBuffs);
 AddIntoTempTable({"end"});
 if (SellingEnabled == true) then
 AddIntoTempTable({"leavept"});
 AddIntoTempTable({"decreasestock","shop"});
 end;
 end;
	end;
end;