ShowToClient("SYS","Script Ress Party Started");
ResSkillId = 11784;  -- Aoero Blessed Resurrection = 11784; Iss Angel's Resurrection = 11564;
-----------------------------------------------------------
PlayerList = GetPlayerList();
ResSkill = GetSkills():FindById(ResSkillId);
repeat
	if (GetMe():IsAlikeDeath() == true)then
			ShowToClient("SYS","Your char is dead, w8ing for res");
			Sleep(10000)
		repeat
			Sleep(1000);
		until (GetMe():IsAlikeDeath() == false);
			ShowToClient("SYS","Your char is now alive");
	end;
for user in PlayerList.list do
  if(user:IsMyPartyMember() == true)then
	if (user:IsMyPartyMember()) and (user:IsAlikeDeath() == true)and(ResSkill ~= nil) and(ResSkill:CanBeUsed()) then
			Target(user);
			Sleep(500);
			UseSkillRaw(ResSkillId, false, false);
			Sleep(500);
			ClearTargets();
			Sleep(500);
	end;
	end;
end;
Sleep(5000)
until false;
