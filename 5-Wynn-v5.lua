ShowToClient("Aviso","Ativando o Invocador Wynn...");

Eu = GetMe();
Alvo = GetTarget();

----------------------------------------------------------------------------------------------
----Apresentação
----------------------------------------------------------------------------------------------
if(Eu:GetClass() == 145) then
	ShowToClient("Aviso","Eu sou seu Wynn Summoner.");
	Sleep(500);
elseif (Eu:GetClass() == 176) then
	ShowToClient("Aviso","Eu sou seu Wynn Arcana Lord.");
	Sleep(500);
elseif (Eu:GetClass() == 177) then
	ShowToClient("Aviso","Eu sou seu Wynn Elemental Master.");
	Sleep(500);
elseif (Eu:GetClass() == 178) then
	ShowToClient("Aviso","Eu sou seu Wynn Spectral Master.");
	Sleep(500);
end;

ShowToClient("Aviso","Comecando as atividades do dia... ;)");

TipoAtk = "AOE"; -- S-> Single; AOE-> Area;
TSummon = "w"; -- Changes pet type to summon, (m: magic summons, t: tanking summons, w: warrior summons)
BeastSSSummon = true; -- Auto Shot summon (false/true)
BeastSS = "Beast Soulshot"; -- Shot name for pets
BeastSSMinCount = 5000; -- value * 1k to start shot summon
CrystalNameCount = "Crystal (R-grade)"; -- Crystal Name
ShotsActivated = false;
touch = 0;
power = 0;
bite = 0;
pouce = 0;
Aggression = 0;
Stun = 0;

------------------------------------------------------------------------------------------------------------
---Funcções Gerais
------------------------------------------------------------------------------------------------------------
----Reuso de Skills
function ReusoSkills(IdSkill)
	local skill = IdSkill;
	
	if(GetSkills():FindById(skill):CanBeUsed()) then
		return skill;
	else
		return 0;
	end;
end;

----------------------------------------------------------------------------------------------
----Perde targer 
----------------------------------------------------------------------------------------------
function LimparTarget()
	local me = GetMe();
	local MyTarget = GetTarget();
	if (me:IsAlikeDeath()) and (MyTarget ~= nil) and ((MyTarget:IsAlikeDeath())) then
		ClearTargets();
		CancelTarget(false);
		CancelTarget(false);
		CancelTarget(false); 
	end;
end;

----------------------------------------------------------------------------------------------
----Combo de skills
----------------------------------------------------------------------------------------------
function Combo()
	Alvo = GetTarget();
	combo = {
		10262,	--PowerBomber
		10266,	--GiantPunch
		10546,	--Uppercut
		11276,	--DimensionalBinding
		11050,	--HellBinding
		11051,	--HellBinding2
		11052,	--MassHellBinding
		11053	--MassHellBinding2
	}
	
	for cb = 1, #combo do
		if(GetTarget() ~= nil) then
			if(GetTarget():GotBuff(combo[cb]) == true) then
				UseSkillRaw(11259, false, false); -- MarkOfWeakness
				Sleep(500);
			end;
		end;
	end;
end;

---Quatidade de summons por classe
function QtdadeSummon()
	local me = GetMe();
	if ((Eu:GetClass() == 14) or (Eu:GetClass() == 96)) then
		return 1;
	 end;
	if ((Eu:GetClass() == 28) or (Eu:GetClass() == 104)) then
		return 1;
	 end;
	if ((Eu:GetClass() == 41) or (Eu:GetClass() == 111)) then
		return 1;
	 end;
	if (Eu:GetClass() == 177) then
		return 2;
	 end;
	if (Eu:GetClass() == 178) then
		return 2;
	end;
	if (Eu:GetClass() == 176) then
		return 2;
	end;
	return -1;
end;

--Qual summoner invocar
function TipoSummon(tipos)
	if (Eu:GetClass() == 177) then
		if (tipos == "m") then
			return 11331;
		elseif (tipos == "w") then
			return 11330;
		elseif (tipos == "t") then
			return 11329;
		end;
	 end;
	if (Eu:GetClass() == 178) then
		if (tipos == "m") then
			return 11340;
		elseif (tipos == "w") then
			return 11339;
		elseif (tipos == "t") then
			return 11338;    
		end;
	end;
	if (Eu:GetClass() == 176) then
		if (tipos == "m") then
			return 11323;    
		elseif (tipos == "w") then
			return 11322;    
		elseif (tipos == "t") then
			return 11320;    
		end;
	end;
end;

--
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

--Ativa os shots
function AtivarShots()
	MinhasSkills = GetSkills();
	items = GetInventory();
	
	--for i in items.list do
	--	if string.match(i.Name, "Spiritshot") or string.match(i.Name, "Soulshot") then
	--		ActivateSoulShot(i.displayId,true);
	--	end;
	--end;
	
	if BeastSSSummon then
		if (GetItemAmountByName(BeastSS) < BeastSSMinCount*1000) then
			if (GetItemAmountByName(BeastSS) == 0) then
				ShotsActivated = false;
			end;
			if (MinhasSkills:FindById(11316) ~= nil) and GetItemAmountByName(CrystalNameCount) > 0 and(MinhasSkills:FindById(11316):IsSkillAvailable()) then
				UseSkillRaw(ReusoSkills(11316),false,false);
				Sleep(500);
			end;
		end;
	end;
	
	if(ShotsActivated == false) then
		if(GetSummonCount() > 0) and (GetItemAmountByName(BeastSS) > 5) then
			ActivateSoulShot(ShotsDisId, true);
			ShotsActivated = true;
			Sleep(2*1000);
		end;
	end;
end;

--Conta os summons
function GetSummonCount()
	local petlistaround = GetPetList();
	local count = 0;
	
	for Apet in petlistaround.list do
		if (Apet:GetNickName() == Eu:GetName()) then
			count = count +1;
		end;
	end;
	return count;
end;

--Verifica Hp Summon
function VerificaHpSummon()
	local petlistaround = GetPetList();
	
	for Apet in petlistaround.list do
		if (Apet:GetNickName() == Eu:GetName()) then
			if(Apet:GetHpPercent() < 70) then
				UseSkillRaw(ReusoSkills(11269),false,false); 
				Sleep(500);
			end;
			if(Apet:GetHpPercent() < 50) then
				UseSkillRaw(ReusoSkills(11310),false,false); 
				Sleep(500);
			end;
		end;
	end;
end;
resp = 0;
--Checa Summons
function ChecarSummons()
	if(QtdadeSummon() == 0) then
		ShowToClient("Aviso","O Summoner nao possui tanker");
	end;
	if (GetSummonCount() < QtdadeSummon()) then
		if (GetSummonCount() == 0) then
			ShotsActivated = false;
		end;
		UseSkillRaw(ReusoSkills(TipoSummon(TSummon)),false,false); 
		Sleep(500);
		SummonBuffs();
		
		if (GetMe():GotBuff(11270) == false) then			-- Ultimate Tranfer Pain
			UseSkillRaw(11270, false, false); 
			Sleep(500);
			SummonBuffs();
			Sleep(500);
		end;
		if (GetMe():GotBuff(11288) == false) then
			UseSkillRaw(ReusoSkills(11288), false, false);	-- Ultimate Servitor Share
			Sleep(500);
			SummonBuffs();
			Sleep(500);
		end;
	end;
	
	AtivarShots();
end;

---Distancia do Summon para Target
function DistanciaST()
	local petlistaround = GetPetList();
		
	for Apet in petlistaround.list do
		if (Apet:GetNickName() == GetMe():GetName()) then
			return Apet:GetRangeTo(GetTarget());
		end;
	end;
end;

------------------------------------------------------------------------------------------------------------
---Buffs proprios
------------------------------------------------------------------------------------------------------------
---Summons
function SummonBuffs()
	if (Eu:GetClass() == 177) then
		UseSkillRaw(ReusoSkills(11348), false, false); -- Servitor Death Whisper
	end;
	if (Eu:GetClass() == 178) then
		UseSkillRaw(ReusoSkills(11349), false, false); -- Greater Servitor Might
	end;
	if (Eu:GetClass() == 176) then
		UseSkillRaw(ReusoSkills(11347), false, false); -- Greater Servitor Haste
	end;
end;

---Summoner
function WSBuffs()
	if (GetMe():GotBuff(11270) == false) then			-- Ultimate Tranfer Pain
		UseSkillRaw(11270, false, false); 
		Sleep(500);
		SummonBuffs();
		Sleep(500);
	end;
	if (GetMe():GotBuff(11288) == false) then
		UseSkillRaw(ReusoSkills(11288), false, false);	-- Ultimate Servitor Share
		Sleep(500);
		SummonBuffs();
		Sleep(500);
	end;
	if (Eu:GotBuff(1986) == false) then
		UseSkillRaw((1986), false, false);				-- Dual Maximum HP
		Sleep(500);
	end;
	if (Eu:GotBuff(1937) == false) then
		UseSkillRaw((1937), false, false);				-- WynnAura
		Sleep(500);
	end;
	if (Eu:GotBuff(1914) == false) then
		UseSkillRaw(ReusoSkills(1914), false, false);	-- Savage
		Sleep(500);
	end;
	
end;

function WALBuffs()
	WSBuffs();
end;

function WEMBuffs()
	WSBuffs();
end;

function WSMBuffs()
	WSBuffs();
end;

function WynnBuffs()
	if (Eu:GetClass() == 145) then		-- WynnSummoner
		WSBuffs();
	elseif (Eu:GetClass() == 176) then	-- WynnArcanaLord
		WALBuffs();
	elseif (Eu:GetClass() == 177) then	-- WynnElementalMaster
		WEMBuffs();
	elseif (Eu:GetClass() == 178) then	-- WynnSpectralMaster
		WSMBuffs();
	end;
end;

------------------------------------------------------------------------------------------------------------
---Desefa
------------------------------------------------------------------------------------------------------------
function WSDefesa()
	VerificaHpSummon();
end;

function WALDefesa()
	WSDefesa();
end;

function WEMDefesa()
	WSDefesa();
end;

function WSMDefesa()
	WSDefesa();
end;

function WynnDefesa()
	if (Eu:GetClass() == 145) then		-- WynnSummoner
		WSDefesa();
	elseif (Eu:GetClass() == 176) then	-- WynnArcanaLord
		WALDefesa();
	elseif (Eu:GetClass() == 177) then	-- WynnElementalMaster
		WEMDefesa();
	elseif (Eu:GetClass() == 178) then	-- WynnSpectralMaster
		WSMDefesa();
	end;
end;

------------------------------------------------------------------------------------------------------------
---Ataque
------------------------------------------------------------------------------------------------------------
---Ataque do Summon
function SummonSkillAtk(tipos)
	if (Eu:GetClass() == 176) then
		if (tipos == "m") then
			touch	= 1;
			power	= 2;   
		elseif (tipos == "w") then
			bite = 3;
			pouce = 4;   
		elseif (tipos == "t") then
			Aggression = 5;
			Stun = 6;    
		end;
	end;
	if (Eu:GetClass() == 177) then
		if (tipos == "m") then
			touch	= 1;
			power	= 2;   
		elseif (tipos == "w") then
			bite = 3;
			pouce = 4;   
		elseif (tipos == "t") then
			Aggression = 5;
			Stun = 6;    
		end;
	 end;
	if (Eu:GetClass() == 178) then
		if (tipos == "m") then
			touch	= 1;
			power	= 2;   
		elseif (tipos == "w") then
			bite = 3;
			pouce = 4;   
		elseif (tipos == "t") then
			Aggression = 5;
			Stun = 6;    
		end;
	end;
	
end;

function SummonAtk(tipos)
	local smType = tipos;
	SummonSkillAtk(smType);
	target = GetTarget();
	
	if (GetTarget() ~= nil) and GetTarget():IsMonster() and (GetSummonCount() > 0) 
	and (GetTarget():GetDistance() < 4000) then --and (ScriptTargetId == 0)
		if not (GetTarget():IsAlikeDeath()) then
			if(smType == "m") then
				if(TipoAtk == "S") then
					Command("/useshortcut 5 "..touch);
					--Action(touch,false,false);
					Sleep(150);
				elseif(TipoAtk == "AOE") then
					Command("/useshortcut 5 "..touch);
					--Action(touch,false,false);
					Sleep(150);
					Command("/useshortcut 5 "..power);
					--Action(power,false,false);
					Sleep(150);
				end;
				Action(22, false, false);
			elseif(smType == "w") then
				if(DistanciaST() < 155) then
					Command("/useshortcut 5 "..bite);
					--Action(bite,false,false);
					Sleep(150);
				elseif(DistanciaST() > 155 and DistanciaST() < 900) then
					Command("/useshortcut 5 "..pouce);
					--Action(pouce,false,false);
					Sleep(150);
				end;
				Action(22, false, false);
			end;
			Action(22, false, false);
		elseif (GetTarget():IsAlikeDeath()) then
			ClearTargets();
		end;
	end;
end;

--Ataque Summoner
function Marks()
	UseSkillRaw(ReusoSkills(11259), false, false); -- Mark of Weakness
	Sleep(500);
	UseSkillRaw(ReusoSkills(11260), false, false); -- Mark of Void
	Sleep(500);
	UseSkillRaw(ReusoSkills(11261), false, false); -- Mark of Plague
	Sleep(500);
	UseSkillRaw(ReusoSkills(11262), false, false); -- Mark of Trick
	Sleep(500);
end;

function WSAtk()
	Combo();
	if (GetTarget() ~= nil) and (Eu ~= nil) and GetTarget():IsMonster() and (GetSummonCount() > 0) 
	and (GetTarget():GetDistance() < 1000) then
		if not (GetTarget():IsAlikeDeath()) then
			SummonAtk(TSummon);
			Command("/summonattack");
		end;
	end;
	if(TipoAtk == "S") then
		Marks();
		UseSkillRaw(ReusoSkills(11298), false, false); -- Mark of Fire
		Sleep(500);
		if(Eu:GetLevel() >= 93) then
			UseSkillRaw(ReusoSkills(11276), false, false); -- Dimensional Binding
			Sleep(500);
		end;
		UseSkillRaw(ReusoSkills(11271), false, false); -- Mark Retriever
	elseif(TipoAtk == "AOE") then
		Marks();
		UseSkillRaw(ReusoSkills(11263), false, false); -- Invoke
		Sleep(500);
		UseSkillRaw(ReusoSkills(11298), false, false); -- Mark of Fire
		Sleep(500);
		if(Eu:GetLevel() >= 93) then
			UseSkillRaw(ReusoSkills(11276), false, false); -- Dimensional Binding
			Sleep(500);
		end;
		UseSkillRaw(ReusoSkills(11271), false, false); -- Mark Retriever
	end;
end;

function WALAtk()
	WSAtk();
	UseSkillRaw(ReusoSkills(11350), false, false); -- Arcana Rage
	Sleep(800);
end;

function WEMAtk()
	WSAtk();
	UseSkillRaw(ReusoSkills(11353), false, false); -- Elemental Rage
	Sleep(500);
end;

function WSMAtk()
	WSAtk();
	UseSkillRaw(ReusoSkills(11356), false, false); -- Spectral Rage
	Sleep(500);
end;

function WynnAtk()
	Combo();
	
	if (Eu:GetClass() == 145) then		-- WynnSummoner
		WSAtk();
	elseif (Eu:GetClass() == 176) then	-- WynnArcanaLord
		WALAtk();
	elseif (Eu:GetClass() == 177) then	-- WynnElementalMaster
		WEMAtk();
	elseif (Eu:GetClass() == 178) then	-- WynnSpectralMaster
		WSMAtk();
	end;
end;
------------------------------------------------------------------------------------------------------------
----Acao
------------------------------------------------------------------------------------------------------------
function Acao()
	LimparTarget();
	WynnBuffs();
	Sleep(200);
	Combo();
	WynnDefesa();
	Sleep(200);
	Combo();
	SummonAtk(TSummon);
	Sleep(200);
	Combo();
	WynnAtk();
	Sleep(200);
	Combo();
	AtivarShots();
	Command("/summonattack");
	Sleep(200);
end;



---- MAIN ----
function Main()
	LimparTarget();
	ChecarSummons();
	Sleep(200);
	
	
	if (GetTarget() ~= nil) then
		if(GetTarget():IsAlikeDeath() == true) then
			ClearTargets();
		else
			if (GetTarget():IsMonster() == true) and (GetTarget():IsAlikeDeath() == false)
			and (Eu:IsAlikeDeath() == false) then
				LimparTarget();
				Acao();
				Sleep(200);
				Combo();
				Command("/pickup");
				Sleep(500);
			end;
		end;
	end;
end;

repeat

	if not CheckIfRunning or not IsPaused() then
		LimparTarget();
		Main();
	end
	Sleep(100)
	
until false;