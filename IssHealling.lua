ShowToClient("SYS","Script OOP Heal Melody Started");
CharNameToHeal = "Nerthus";	--here write name of your Main to be heal
HPWhenHeal = 65;
HealInRange =  900;
HealSkillId = 11570; -- Healing Melody
----------------------------------------------------------------
WhoToHeal = nil;
HealSkill = GetSkills():FindById(HealSkillId);
repeat
-----------
	if(GetUserByName(CharNameToHeal) == nil)then
		ShowToClient("SYS","Your main char is out of range, w8ing on him");
		repeat
			Sleep(1000);
		until (GetUserByName(CharNameToHeal) ~= nil);
		ShowToClient("SYS","Your main char is in range");
		WhoToHeal = GetUserByName(CharNameToHeal);
	elseif(GetUserByName(CharNameToHeal) ~= nil)then
		WhoToHeal = GetUserByName(CharNameToHeal);
	end;
----------
	if(WhoToHeal:GetHpPercent() < HPWhenHeal) and 
		(GetMe():GetRangeTo(WhoToHeal) < HealInRange) and
		(HealSkill ~= nil) and (HealSkill:CanBeUsed())then
		Target(WhoToHeal);
		Sleep(200);
		UseSkill(HealSkillId);
		ClearTargets();
	end;
	Sleep(500);
until false;