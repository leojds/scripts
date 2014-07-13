ShowToClient("Debuff","DeBUFF Script STARTed");

PowerLevelMasterName = "Zamyad"; -- Change this to your Main Nick
SCONFIG = L2TConfig.GetConfig();
local PartyLeaderName = L2TConfig.AssistSetting();
PartyLeaderName:SetName(PowerLevelMasterName);
SCONFIG.assist.players:Add(PartyLeaderName); 
SCONFIG.assist.option = L2TConfig.EAssistType.AT_NEAREST_TARGET;
SCONFIG.assist.range = 3000;
 
--* CONFIG *--
DebuffSkillId = 11777; -- Mark of Lumi
DebuffSkill = GetSkills():FindById(DebuffSkillId);	-- Find Skill By ID
MPWhenStop = 30; -- Mark of Lumi MP% cut off 
HPMob = 1; -- Mobs about this HP% will be debuff
 
--* MAIN LOOP *--
repeat
if (GetMe():IsUsingMagic() == false) then
	if (GetTarget() ~= nil) then
		if (GetTarget():IsMonster() == true) and (GetTarget():IsAlikeDeath() == false) and (GetMe():GetMpPercent() > MPWhenStop) and (GetMe():IsAlikeDeath() == false) then
			if (GetTarget():GotBuff(DebuffSkillId) == true) then
				ClearTargets();
				Sleep(100)
				CancelTarget(false);
				Sleep(100);
			elseif (GetTarget():GotBuff(DebuffSkillId) == false) and (GetTarget():GetHpPercent() > HPMob) then
				UseSkill(DebuffSkillId,false,false);
				Sleep(100);
				ClearTargets();
				Sleep(100)
				CancelTarget(false);
				Sleep(100);
			end;
		end;
	end;
end;
Sleep(100);
until false;