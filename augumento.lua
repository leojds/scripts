ShowToClient("AUGMENT", "Iniciando...")	;
--How To Use!!
-- Start With Weapon you need to augment EQUIPPED!
-- Start With Helmet on your Char!.. IF YOU REMOVE HELMET THE AUGMENTATION WILL STOP (so you can interrupt the script anytime you want)
-- Choose The Next 4 variables Correctly (Write The Exact Names with Exact Capital Letters and Same Spaces!):
local lifestoneName = "Mid-grade Life Stone - Lv. 80";
local gemstoneName = "Gemstone (D-grade)";
local gemstone_count = 20;
--local npcName = "Pushkin"; --  only Pushkin(Giran)/ Wilbert(Aden) Supported!
local npcName = "Poitan";

 
------Dont Touch Under This Line---------
local AugStatus = 0;
local count = 0; 
AugStatusC = 0;
 
function getItemByName(name)
	local invList = GetInventory();
	for item in invList.list do
		if (item.Name == name) then
			return item;
		end;
	end;
end;
 
function openAugmentWindow(name)
	local target = GetTarget();
	if (target ~= nil) then
		if (target:GetName() ~= name) then
			Command("/target " .. name);
			Sleep(1000);
		end;
	else
		Command("/target " .. name);
		Sleep(1000);
	end;
 
	target = GetTarget();
	if (target ~= nil) and (target:GetName() == name) then
		if (name == "Wilbert") then
			Talk();
			ClickLinkAndWait("blacksmith_wilbert005.htm");
			Sleep(1000);
			ClickLinkAndWait("smelting_start.htm");
			Sleep(1000);
			QuestReply("menu_select?ask=-503&reply=100");
			Sleep(2000);
			return true;
		elseif (name == "Pushkin") then
			Talk();
			--Sleep(1000);
			ClickLinkAndWait("blacksmith_pushkin005.htm");
			Sleep(1000);
			ClickLinkAndWait("smelting_start.htm");
			Sleep(1000);
			QuestReply("menu_select?ask=-503&reply=100")
			Sleep(2000);
			return true;
		elseif (name == "Poitan") then
			Talk();
			--Sleep(1000);
			ClickLinkAndWait("blacksmith_poitan005.htm");
			Sleep(1000);
			ClickLinkAndWait("smelting_start.htm");
			Sleep(1000);
			QuestReply("menu_select?ask=-503&reply=100")
			Sleep(2000);
			return true;
		end;
	end;
	return false;
end;
 
function getItemByName(name)
	local invList = GetInventory();
	for item in invList.list do
		if (item.Name == name) then
			return item;
		end;
	end;
end;
 
function openAugmentCancelWindow(name)
	count = 2;
	target = GetTarget();
	if (target ~= nil) then
		if (target:GetName() ~= name) then
			Command("/target " .. name);
			Sleep(1000);
		end
	else
		Command("/target " .. name);
		Sleep(1000);
	end;
 
	target = GetTarget();
	if (target ~= nil) and (target:GetName() == name) then
		if (name == "Wilbert") then
			Talk();
			ClickLinkAndWait("blacksmith_wilbert005.htm");
			Sleep(1000);
			ClickLinkAndWait("smelting_break.htm");
			Sleep(1000);
			ClickLink("menu_select?ask=-503&reply=200");
			Sleep(10000);
			return true;
		elseif (name == "Pushkin") then
			Talk();
			ClickLinkAndWait("blacksmith_pushkin005.htm");
			Sleep(1000);
			ClickLinkAndWait("smelting_break.htm");
			Sleep(1000);
			QuestReply("menu_select?ask=-503&reply=200");
			Sleep(2000);
			return true;
		elseif (name == "Poitan") then
			Talk();
			ClickLinkAndWait("blacksmith_poitan005.htm");
			Sleep(1000);
			ClickLinkAndWait("smelting_break.htm");
			Sleep(1000);
			QuestReply("menu_select?ask=-503&reply=200");
			Sleep(2000);
			return true;
		end;
	end;
	return false;
end;
 
weaponId = GetMe():GetEquip_WeaponId();
 
if (weaponId == nil) or (weaponId == 0) then
	Sleep(10000);
	ShowToClient("AUGMENT", "You Dont have Any Weapon Equiped to augment!")	;
else
	weapon = GetInventory():FindById(weaponId);
	if (weapon ~= nil) and ((weapon.RefineryOp2 ~= 0) or (weapon.RefineryOp1 ~= 0)) then
		Sleep(10000);
		ShowToClient("AUGMENT", "You Must Start With Non Augmented weapon!") ;
	else
		repeat
			Sleep(8000);
			if (weapon.RefineryOp2 == 0) and (weapon.RefineryOp1 == 0) then
				AugStatus = 0;
				lifestone = getItemByName(lifestoneName);	
				gemstone = getItemByName(gemstoneName);
				if (lifestone == nil) then
					Sleep(10000);
					ShowToClient("AUGMENT", "sem life stones.");
					break;
				end;
				if (gemstone == nil) then
					Sleep(10000);
					ShowToClient("AUGMENT", "sem gemstones.");
					AugStatus = 1;
					break;
				end;
				if (gemstone.ItemNum < gemstone_count) then
					Sleep(10000);
					ShowToClient("AUGMENT", "Gemstones insuficiente.");
					AugStatus = 1;
					break;
				end;				
 
				ShowToClient("AUGMENT", "Augmenting ..");
				AugStatusC = AugStatusC+1;
				GetAugmentManager():setItemId(weaponId);
				GetAugmentManager():setLifeStoneId(lifestone.objectId);
				GetAugmentManager():setGemstoneId(gemstone.objectId, gemstone_count);
				GetAugmentManager():Augment();	
				if (openAugmentWindow(npcName) == false) then
					Sleep(10000);
					ShowToClient("AUGMENT", "NPC nao encontrado.");
					AugStatus = 1;
					break;
				end;
				repeat
					Sleep(3000);
					weapon = GetInventory():FindById(weaponId);
				until weapon.RefineryOp1 ~= 0
 
				if (weapon == nil) then
					Sleep(10000);
					ShowToClient("AUGMENT", "A arma nao foi encontrada...");
					AugStatus = 1;
					break;
				else
 
					if (GetAugmentManager():KeepAugment(weapon.RefineryOp2) == true) or (GetAugmentManager():KeepAugment(weapon.RefineryOp1) == true) then
						ShowToClient("AUGMENT", "Congratulation! You have achieved a desired augment!")
						AugStatus = 1;
					else
						ShowToClient("AUGMENT", "Obtendo augment inutil ...")
					end;
				end;
				count = 1;
				if (GetMe():GetEquip_HelmId() == 0) then
					ShowToClient("AUGMENT", "Augmentation Stoped Manualy by removing helment.");
					AugStatus = 1;
					break;							
				end;
			else
				Sleep(3000);
				ShowToClient("AUGMENT", "Cancelando Augment...");
				weapon = GetInventory():FindById(weaponId);
				if weapon == nil then
					ShowToClient("AUGMENT", "Weapon for cancel not detected.");
					count = 3
					AugStatus = 1;
					break;
				end;
				if (count == 1) then
					GetAugmentManager():setItemId(weaponId);
					GetAugmentManager():AugmentCancel();
					count = 2;
				end;
				Sleep(500);
 
				if (count == 2) and (openAugmentCancelWindow(npcName) == false) then
					Sleep(10000);
					ShowToClient("AUGMENT", "The NPC Dialog Is not Working Properly.");
					count = 3
					AugStatus = 1;
					break;
				end;
 
				repeat
					Sleep(3000);
					weapon = GetInventory():FindById(weaponId);
				until weapon.RefineryOp1 == 0
 
				if not (weapon.RefineryOp1 == 0 and weapon.RefineryOp2 == 0) then
					Sleep(10000);
					ShowToClient("AUGMENT", "Augment Canceling Failed.");
					AugStatus = 1;
					break;				
				end;
				if (GetMe():GetEquip_HelmId() == 0) then
					Sleep(10000);
					ShowToClient("AUGMENT", "Augmentation Stoped Manualy by removing helment.");
					AugStatus = 1;
					break;							
				end;
			end;
		until weapon == nil or AugStatus == 1 ;
		ShowToClient("AUGMENT","Have Fun!");
	end;
end;