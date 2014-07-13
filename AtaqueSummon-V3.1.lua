ShowToClient("Aviso","Summoner Ataque ON");
me = GetMe();

WynPetSummon = true; -- Auto Summon Pets & Shots (false/true)
WhenManaPercentIsOver = 50; -- Transfer Pain (101 to not use, 0 to use all time)
TSummon = "w"; -- Changes pet type to summon, (m: magic summons, t: tanking summons, w: warrior summons)
RequiredSummonsCount = 2; -- Number on servitor needed, if you cant have more than 1 servitor then you need to change it to 1.

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


--function ReusoSkills(IdSkill) --Ataques do Adventure
--	local skill = IdSkill;
--	return GetSkills():FindById(skill):CanBeUsed();
--end;

function ReusoSkills(IdSkill) --Ataques do Adventure
	local skill = IdSkill;
	if(GetSkills():FindById(skill):CanBeUsed()) then
		return skill;
	else
		return 0;
	end;
end;

function TipoSummon(tipos)
	local me = GetMe();
	if (me:GetClass() == 176) then
		if (tipos == "m") then
			return 11322;    
		elseif (tipos == "w") then
			return 11321;    
		elseif (tipos == "t") then
			return 11320;    
		end;
	end;
	if (me:GetClass() == 177) then
		if (tipos == "m") then
			return 11331;
		elseif (tipos == "w") then
			return 11330;
		elseif (tipos == "t") then
			return 11329;
		end;
	 end;
	if (me:GetClass() == 178) then
		if (tipos == "m") then
			return 11340;
		elseif (tipos == "w") then
			return 11339;
		elseif (tipos == "t") then
			return 11338;    
		end;
	end;
	
	return -1;
end;

function SummonBuffs()
	local me = GetMe();
	
	if (me:GetClass() == 177) then
		UseSkillRaw(ReusoSkills(11348), false, false); -- Servitor Death Whisper
	end;
	if (me:GetClass() == 178) then
		UseSkillRaw(ReusoSkills(11349), false, false); -- Greater Servitor Might
	end;
	if (me:GetClass() == 176) then
		UseSkillRaw(ReusoSkills(11347), false, false); -- Greater Servitor Haste
	end;
end;

function SummonSkillAtk(tipos)
	local me = GetMe();
	
	if (me:GetClass() == 177) then
		if (tipos == "m") then
			return 1134;
		elseif (tipos == "w") then
			return 0;
		elseif (tipos == "t") then
			return 0;
		end;
	 end;
	if (me:GetClass() == 178) then
		if (tipos == "m") then
			return 1140;
		elseif (tipos == "w") then
			return 0;
		elseif (tipos == "t") then
			return 0;    
		end;
	end;
	if (me:GetClass() == 176) then
		if (tipos == "m") then
			return 1128;    
		elseif (tipos == "w") then
			return 0;    
		elseif (tipos == "t") then
			return 0;    
		end;
	end;
	return -1;
end;

function SummonAtk(tipos)
	local smType = tipos;
	target = GetTarget();
	if (target ~= nil) and (me ~= nil) and target:IsMonster() and (GetSummonCount() > 0) and (target:GetDistance() < 4000) then --and (ScriptTargetId == 0)
		if not (target:IsAlikeDeath()) then
			if (SummonSkillAtk(smType) > 0) then
				Action(SummonSkillAtk(smType),false,false);
				Sleep(150);
				Action(22, false, false);
			end;
			Action(22, false, false);
			Sleep(150);
			elseif (ScriptTargetId == target:GetId()) then
				ClearTargets();
		end;
	end;
end;

function SummonerRage()
	local me = GetMe();
	if (me:GetClass() == 177) then
		UseSkillRaw(ReusoSkills(11353), false, false); -- Elemental Rage
		Sleep(800);
	 end;
	if (me:GetClass() == 178) then
		UseSkillRaw(ReusoSkills(11356), false, false); -- Spectral Rage
		Sleep(800);
	end;
	if (me:GetClass() == 176) then
		UseSkillRaw(ReusoSkills(11350), false, false); -- Arcana Rage
		Sleep(800);
	end;
end;

function SummonerBuffs()
	if (GetMe():GotBuff(11288) == false) then
		UseSkillRaw(ReusoSkills(11288), false, false); -- Ultimate Servitor Share
		Sleep(500);
		SummonBuffs();
		Sleep(1000);
	end;
	if (GetMe():GotBuff(11270) == false) then
		UseSkillRaw(ReusoSkills(11270), false, false); -- Ultimate Servitor Share
		Sleep(500);
		SummonBuffs();
		Sleep(1000);
	end;
	if (GetMe():GotBuff(1937) == false) then
		UseSkillRaw(1937, false, false); -- Wynn Aura
		Sleep(1000);
	end;
	if (GetMe():GotBuff(1986) == false) then
		UseSkillRaw(1986, false, false); -- Dual Maximum HP
		Sleep(1000);
	end;
	if (GetMe():GotBuff(1914) == false) then
		UseSkillRaw(ReusoSkills(1914), false, false); -- Savage
		Sleep(1000);
	end;
end;

function SummonerMarks()
	UseSkillRaw(ReusoSkills(11259), false, false); -- Mark of Weakness
	Sleep(500);
	UseSkillRaw(ReusoSkills(11260), false, false); -- Mark of Void
	Sleep(800);
	UseSkillRaw(ReusoSkills(11261), false, false); -- Mark of Plague
	Sleep(800);
	UseSkillRaw(ReusoSkills(11262), false, false); -- Mark of Trick
	Sleep(800);
end;

function SummonerAtkM()
	UseSkillRaw(ReusoSkills(11298), false, false); -- Mark of Fire
	Sleep(500);
	UseSkillRaw(ReusoSkills(11271), false, false); -- Mark Retriever
	Sleep(500);
	--UseSkillRaw(ReusoSkills(11263), false, false); -- Invoke
	--Sleep(500);
	UseSkillRaw(ReusoSkills(11276), false, false); -- Dimensional Binding
	Sleep(500);
end;

function SummonerAtk()
	SummonerRage();
	Sleep(800);
	SummonerMarks();
	Sleep(800);
	SummonerAtkM();
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

function ChecaSummons()
	if (GetSummonCount() < RequiredSummonsCount) then
		if (GetSummonCount() == 0) then
			ShotsActivated = false;
		end;
		UseSkillRaw(TipoSummon(TSummon),false,false); 
		Sleep(500);
		SummonBuffs();
		Sleep(500);
		SummonerBuffs();
		Sleep(500);
	end;
end;

function ActivateShots()
	items = GetInventory();
	for i in items.list do
		if string.match(i.Name, "Spiritshot") or string.match(i.Name, "Soulshot") then
			ActivateSoulShot(i.displayId,true)
		end;
	end;
end;

function CrafitandoBeastShots()
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
end;

function AtivandoBeastShots()
	CrafitandoBeastShots();
	
	if not (ShotsActivated) and (GetSummonCount() > 0) and (GetItemAmountByName(BeastSS) > 5) then
		ActivateSoulShot(ShotsDisId, true);
		ShotsActivated = true;
		Sleep(2*1000);
	end;
end;

function AtivandoShots()
	AtivandoBeastShots();
	
	
end;


-----------------------------------------------------------------------------------------------------
---função principal
-----------------------------------------------------------------------------------------------------
function Main()
	
	me = GetMe();
	MySkills = GetSkills();
	target = GetTarget();

	-------------------------------------------------------------------------
	--					Checa Summons
	-------------------------------------------------------------------------
	ChecaSummons();
	SummonerBuffs();


	-------------------------------------------------------------------------
	--					Checa Beast's Soulshots
	-------------------------------------------------------------------------
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

	-------------------------------------------------------------------------
	--					Checa ataque e target do Summon
	-------------------------------------------------------------------------
	if (target ~= nil) and (me ~= nil) and target:IsMonster() and (GetSummonCount() > 0) and (target:GetDistance() < 1000) then
		if not (target:IsAlikeDeath()) then
			SummonAtk(TipoSummon);
		end;
	end;

	-------------------------------------------------------------------------
	--					Checa ataque e target do Summoner
	-------------------------------------------------------------------------
	if (GetTarget() ~= nil) then
		if (GetTarget():IsMonster() == true) and (GetTarget():IsAlikeDeath() == false)
		and (GetMe():IsAlikeDeath() == false) then
			SummonerAtk();
			Sleep(800);
		end;
	end;
end;

-----------------------------------------------------------------------------------------------------
---execução do script
-----------------------------------------------------------------------------------------------------
repeat
	if not CheckIfRunning or not IsPaused() then
		Main()		
	end
	Sleep(100)	
until false
