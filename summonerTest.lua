ShowToClient("Auras","ON");
me = GetMe();

TankAura = true; -- Auto Tank Aura (false/true)(enables auto Rage aura, etc)
AutoSSR = false; -- Auto Shot Use (false/true)
CubicSummon = true; -- Auto Summon Cubic (atm only for dark elf tank)
TankAuraSkillId = 10030; -- 10028:Rage, 10032:Iron, 10030:Challenge (find id of skill for tank auras)
TankAuraSkill = GetSkills():FindById(TankAuraSkillId);    -- TankAura Find Skill By ID
DualHPSkillId = 1986; -- Dual Maximum HP
DualHPSkill = GetSkills():FindById(DualHPSkillId);    -- Dual Maximum HP Find Skill By ID

WynPetSummon = true; -- Auto Summon Pets & Shots (false/true)
WhenManaPercentIsOver = 50; -- Transfer Pain (101 to not use, 0 to use all time)
SummonType = "m"; -- Changes pet type to summon, (m: magic summons, t: tanking summons, w: warrior summons)

BeastSSSummon = true; -- Auto Shot summon (false/true)
BeastSS = "Beast Soulshot"; -- Shot name for pets
BeastSSMinCount = 5000; -- value * 1k to start shot summon
CrystalNameCount = "Crystal (R-grade)"; -- Crystal Name


-- if you want you servitors to use any particular skill they have otherwise set it -1, for list of servitor/pets skill Ids check each class description
if (me:GetClass() == 177) then -- Wynn Elemental Master
	PetActionID = -1; -- Merrow (1130 Unicorn's Aggression, 1131 Unicorn's Stun), Magnus (1132 Unicorn's Bite, 1133 Unicorn's Pounce), Seraphim (1134 Unicorn's Touch, 1135 Unicorn's Power)

elseif (me:GetClass() == 178) then -- Wynn Spectral Master
	PetActionID = -1; -- Nightshade (1136 Phantom Aggression, 1137 Phantom Stun), Spectral Lord (1138 Phantom Bite, 1139 Phantom Pounce), Soulless (1140 Phantom Touch, 1141 Phantom Power)

elseif (me:GetClass() == 176) then -- Wynn Arcana Lord
	PetActionID = -1; -- Kai the Cat (1124 Feline Aggression, 1125 Feline Stun), Feline King (1126 Feline Bite, 1127 Feline Pounce), Feline Queen (1128 Feline Touch, 1129 Feline Power)
end;


function SummonPetsType(tips)
	local me = GetMe();
	if (me:GetClass() == 177) then
		if (tips == "m") then
		return 11331;
		elseif (tips == "w") then
		return 11330;
		elseif (tips == "t") then
		return 11329;
		end;
	 end;
	if (me:GetClass() == 178) then
		if (tips == "m") then
		return 11340;
		elseif (tips == "w") then
		return 11339;
		elseif (tips == "t") then
		return 11338;    
		end;
	end;
	if (me:GetClass() == 176) then
		if (tips == "m") then
		return 11323;    
		elseif (tips == "w") then
		return 11322;    
		elseif (tips == "t") then
		return 11320;    
		end;
	end;
	return -1;
end;


function isTransferPainNeedActivation()
    if (me:GetMpPercent() > WhenManaPercentIsOver) then
	return true;
    end;
	return false;
end;


function GetItemAmountByName(name)
	local invList = GetInventory();
	for item in invList.list do
		if (item.Name == name) then
			ShotsDisId = item.displayId;
			return item.ItemNum;
	end;
		end;

	return 0;
end;


function GetSummonCount()
	local petlistaround = GetPetList();
	local count = 0;

	for Apet in petlistaround.list do
		if (Apet:GetNickName() == me:GetName()) then
			count = count +1;
		end;
	end;
	return count;
end;


function ActivateShots()
	items = GetInventory();
	for i in items.list do
		if string.match(i.Name, "Spiritshot") or string.match(i.Name, "Soulshot") then
			ActivateSoulShot(i.displayId,true)
		end;
	end;
end;

ShotsActivatedPlayer = false;
ShotsActivated = false;

---- MAIN ----
repeat    
me = GetMe();
MySkills = GetSkills();
target = GetTarget();
if (me ~= nil) then
    if not (me:IsAlikeDeath()) then
		if not (ShotsActivatedPlayer) then
			if AutoSSR then
				ActivateShots()
			end;
			ShotsActivatedPlayer = true;
		end;
---- AEORE ----
		if (me:GetClass() == 179) or (me:GetClass() == 180) or (me:GetClass() == 181) then
			if not me:GotBuff(1939) or not me:GotBuff(DualHPSkillId) then
				if (MySkills:FindById(1939) ~= nil) and not me:GotBuff(1939) then
					UseSkillRaw(1939,false,false);
					Sleep(2500);
				end;
				if (DualHPSkill ~= nil) and not me:GotBuff(DualHPSkillId) then
					UseSkillRaw(DualHPSkillId,false,false);
					Sleep(2500);
				end;
			end;
		end;
---- SIGEL ----
if (me:GetClass() == 148) or (me:GetClass() == 149) or (me:GetClass() == 150) or (me:GetClass() == 151) then
if CubicSummon then
if not me:HaveCubic(16) then
if (MySkills:FindById(10043) ~= nil) then
UseSkillRaw(10043,false,false); -- Summon Knight Cubic
Sleep(1000);
end;
end;
if (me:GetClass() == 151) then
if not me:HaveCubic(21) then
if (MySkills:FindById(10080) ~= nil) then
UseSkillRaw(10080,false,false); -- Summon Hex Cubic
Sleep(1500);
end;
end;
if not me:HaveCubic(20) then
if (MySkills:FindById(10079) ~= nil) then
UseSkillRaw(10079,false,false); -- Summon Phantom Cubic
Sleep(1500);
end;
end;
end;
end;

if not me:GotBuff(1927) or not me:GotBuff(TankAuraSkillId) or not me:GotBuff(DualHPSkillId) then
if (MySkills:FindById(1927) ~= nil) and not me:GotBuff(1927) then
UseSkillRaw(1927,false,false);
Sleep(2500);
end;
if TankAura then
if (TankAuraSkill ~= nil) and not me:GotBuff(TankAuraSkillId) then
UseSkillRaw(TankAuraSkillId,false,false);
Sleep(2500);
end;
end;
if (DualHPSkill ~= nil) and not me:GotBuff(DualHPSkillId) then
UseSkillRaw(DualHPSkillId,false,false);
Sleep(2500);
end;
end;
end;
---- WYNN ----
if (me:GetClass() == 176) or (me:GetClass() == 177) or (me:GetClass() == 178) then
	if not me:GotBuff(1937) or not me:GotBuff(DualHPSkillId) then
		if (MySkills:FindById(1937) ~= nil) and not me:GotBuff(1937) then
			UseSkillRaw(1937,false,false);
			Sleep(2500);
		end;
		if (DualHPSkill ~= nil) and not me:GotBuff(DualHPSkillId) then
			UseSkillRaw(DualHPSkillId,false,false);
			Sleep(2500);
		end;
	end;

	if WynPetSummon then
		if not me:GotBuff(11270) then
			if isTransferPainNeedActivation() then
				if (MySkills:FindById(11270) ~= nil) and not me:GotBuff(11270) then
					UseSkillRaw(11270,false,false);
					Sleep(4*1000);
				end;
			end;
		end;
		if (GetSummonCount() < 2) then
			if (GetSummonCount() == 0) then
				ShotsActivated = false;
			end;
			if (SummonPetsType(SummonType) > 0) then
				UseSkillRaw(SummonPetsType(SummonType),false,false);
				Sleep(1000*2);
			end;
		end;
		if BeastSSSummon then
			if (GetItemAmountByName(BeastSS) < BeastSSMinCount*1000) then
				if (GetItemAmountByName(BeastSS) == 0) then
					ShotsActivated = false;
				end;
				if (MySkills:FindById(11316) ~= nil) and GetItemAmountByName(CrystalNameCount) > 0 and(MySkills:FindById(11316):IsSkillAvailable()) then
					UseSkillRaw(11316,false,false);
					Sleep(5000);
				end;
			end;
		end;
		if not (ShotsActivated) and (GetSummonCount() > 0) and (GetItemAmountByName(BeastSS) > 5) then
			ActivateSoulShot(ShotsDisId, true);
			ShotsActivated = true;
			Sleep(2*1000);
		end;
		if (target ~= nil) and (me ~= nil) and target:IsMonster() and (GetSummonCount() > 0) and (target:GetDistance() < 1000) then
			if not (target:IsAlikeDeath()) then
				if (PetActionID > 0) then
					Action(PetActionID,false,false);
					Sleep(2*1000);
				end;
			end;
		end;
	end;
end;
---- FEOH ----
if (me:GetClass() == 166) or (me:GetClass() == 167) or (me:GetClass() == 168) or (me:GetClass() == 169) or (me:GetClass() == 170) then
if not me:GotBuff(1935) or not me:GotBuff(DualHPSkillId) then
if (MySkills:FindById(1935) ~= nil) and not me:GotBuff(1935) then
UseSkillRaw(1935,false,false);
Sleep(2500);
end;
if (DualHPSkill ~= nil) and not me:GotBuff(DualHPSkillId) then
UseSkillRaw(DualHPSkillId,false,false);
Sleep(2500);
end;
end;
end;


---- OTHELL ----
if (me:GetClass() == 158) or (me:GetClass() == 159) or (me:GetClass() == 160) or (me:GetClass() == 161) then
if not me:GotBuff(1931) or not me:GotBuff(DualHPSkillId) then
if (MySkills:FindById(1931) ~= nil) and not me:GotBuff(1931) then
UseSkillRaw(1931,false,false);
Sleep(2500);
end;
if (DualHPSkill ~= nil) and not me:GotBuff(DualHPSkillId) then
UseSkillRaw(DualHPSkillId,false,false);
Sleep(2500);
end;
end;
end;
---- YUL ----
if (me:GetClass() == 162) or (me:GetClass() == 163) or (me:GetClass() == 164) or (me:GetClass() == 165)then
if not me:GotBuff(1933) or not me:GotBuff(DualHPSkillId) then
if (MySkills:FindById(1933) ~= nil) and not me:GotBuff(1933) then
UseSkillRaw(1933,false,false);
Sleep(2500);
end;
if (DualHPSkill ~= nil) and not me:GotBuff(DualHPSkillId) then
UseSkillRaw(DualHPSkillId,false,false);
Sleep(2500);
end;
end;
end;
---- TYRR ----
if (me:GetClass() == 152) or (me:GetClass() == 153) or (me:GetClass() == 154) or (me:GetClass() == 155) or (me:GetClass() == 156) or (me:GetClass() == 157) then
if not me:GotBuff(1929) or not me:GotBuff(DualHPSkillId) then
if (MySkills:FindById(1929) ~= nil) and not me:GotBuff(1929) then
UseSkillRaw(1929,false,false);
Sleep(2500);
end;

if (DualHPSkill ~= nil) and not me:GotBuff(DualHPSkillId) then
UseSkillRaw(DualHPSkillId,false,false);
Sleep(2500);
end;
end;
end;
---- ISS ----
if (me:GetClass() == 171) or (me:GetClass() == 172) or (me:GetClass() == 173) or (me:GetClass() == 174) or (me:GetClass() == 175) then
if not me:GotBuff(DualHPSkillId) then
if (DualHPSkill ~= nil) and not me:GotBuff(DualHPSkillId) then
UseSkillRaw(DualHPSkillId,false,false);
Sleep(2500);
end;
end;
end;
    elseif me:IsAlikeDeath() then
Sleep(10*1000)
repeat
Sleep(1000);
until (me:IsAlikeDeath() == false);
ShotsActivatedPlayer = false;
    end;
end;

Sleep(3*1000);
until false;