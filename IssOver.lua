ShowToClient("SYS","Script Iss Dominator");
ArcherName = "Chariver" ;	--here write name of your Main to be heal
BuffSkillId = 11596; -- Healing Melody
----------------------------------------------------------------
BuffSkill = GetSkills():FindById(BuffSkillId);
WhoToBuff = nil;
--WhoToBuff = GetUserByName(ArcherName);

repeat
	if(GetUserByName(ArcherName) == nil)then
		ShowToClient("SYS","Your main char is out of range, w8ing on him");
		repeat
			Sleep(1000);
		until (GetUserByName(ArcherName) ~= nil);
		ShowToClient("SYS","Your main char is in range");
		WhoToBuff = GetUserByName(ArcherName);
	elseif(GetUserByName(ArcherName) ~= nil)then
		WhoToBuff = GetUserByName(ArcherName);
	end;
	
	if(WhoToBuff:GetBuff(11596) == false) then
		ShowToClient(WhoToBuff);
		Target(WhoToBuff);
		Sleep(200);
		UseSkill(BuffSkillId);
		ClearTargets();
	end;
	Sleep(500);
	
	if(WhoToBuff:GotBuff(11589) == false) or (WhoToBuff:GotBuff(11590) == false) or (WhoToBuff:GotBuff(11591) == false) or (WhoToBuff:GotBuff(11592) == false) or (WhoToBuff:GotBuff(11593) == false) or (WhoToBuff:GotBuff(11594) == false) then
		UseSkill(11589);
		UseSkill(11590);
		UseSkill(11591);
		UseSkill(11592);
		UseSkill(11593);
		UseSkill(11594);
			
	end;
	Sleep(500);
	
	if(WhoToBuff:GotBuff(11600) == false) or (WhoToBuff:GotBuff(11601) == false) or (WhoToBuff:GotBuff(11602) == false) then
--		UseSkill(11600);
--		UseSkill(11601);
--		UseSkill(11602);
		
	end;
	Sleep(500);
until false;