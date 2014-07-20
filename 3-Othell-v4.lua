ShowToClient("Aviso","Ativando o Trapaceiro Othell...");

Eu = GetMe();


----------------------------------------------------------------------------------------------
----Apresentação
----------------------------------------------------------------------------------------------
if(Eu:GetClass() == 141) then
	ShowToClient("Aviso","Eu sou seu Othell Rogue.");
	Sleep(500);
elseif (Eu:GetClass() == 158) then
	ShowToClient("Aviso","Eu sou seu Othell Adventurer.");
	Sleep(500);
elseif (Eu:GetClass() == 159) then
	ShowToClient("Aviso","Eu sou seu Othell Wind Rider.");
	Sleep(500);
elseif (Eu:GetClass() == 160) then
	ShowToClient("Aviso","Eu sou seu Othell Ghost Hunter.");
	Sleep(500);
elseif (Eu:GetClass() == 161) then
	ShowToClient("Aviso","Eu sou seu Othell Fortune Seeker.");
	Sleep(500);
end;

ShowToClient("Aviso","Comecando as atividades do dia... ;)");
----------------------------------------------------------------------------------------------
TipoAtk = "AOE"; -- S-> Single; AOE-> Area;

----------------------------------------------------------------------------------------------
----Reuso de Skills
----------------------------------------------------------------------------------------------
function ReusoSkills(IdSkill) --Ataques do Adventure
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
----Distâncias
----------------------------------------------------------------------------------------------
function Distancia()
	return GetMe():GetRangeTo(GetTarget());
end;


----------------------------------------------------------------------------------------------
----Combo de skills
----------------------------------------------------------------------------------------------
function Combo()
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
				UseSkillRaw(10509, false, false);	-- HeartBreaker
				Sleep(500);
			end;
		end;
	end;
end;

function ORAtk() --Ataques do Othell Rogue
	local Alvo = GetTarget();
	local MP = 20;
	
	LimparTarget();
	UseSkillRaw(ReusoSkills(10508), false, false); -- Blood Stab
	Sleep(500);
	UseSkillRaw(ReusoSkills(10510), false, false); -- Chain Blow
	Sleep(500);
	
	if(Eu:GetMpPercent() > MP)then	-- Reverse
		UseSkillRaw(ReusoSkills(10511), false, false);
		Sleep(500);
	end;
	if(Eu:GetMpPercent() > (MP+15))then	
		UseSkillRaw(ReusoSkills(10509), false, false);	-- Heart Breaker
		Sleep(500);
	end;
	if(Eu:GetMpPercent() > (MP+30))then	
		UseSkillRaw(ReusoSkills(10526), false, false); -- Mischief
		Sleep(500);
	end;
	if(Eu:GetMpPercent() > (MP+35))then	
		UseSkillRaw(ReusoSkills(10514), false, false); -- DarkParalyse
		Sleep(500);
	end;
	if(Eu:GetMpPercent() > (MP+40))then	
		UseSkillRaw(ReusoSkills(10539), false, false); -- Throw Dagger
		Sleep(500);
	end;
	if(Eu:GetMpPercent() > (MP+45))then	
		UseSkillRaw(ReusoSkills(10540), false, false); -- ThrowSand
		Sleep(500);
	end;
	if(Eu:GetLevel() >= 89) then
		UseSkillRaw(ReusoSkills(10546), false, false); -- Uppercut
		Sleep(500);
	end;
	if(Eu:GetLevel() >= 90) then
		UseSkillRaw(ReusoSkills(10532), false, false); -- CloneAttack
		Sleep(500);
	end;
	if(TipoAtk == "AOE") then
		if(Distancia() < 200) then
			if(Eu:GetLevel() >= 87) then
				UseSkillRaw(ReusoSkills(10513), false, false); -- RazorRain
				Sleep(500);
			end;
			if(Eu:GetMpPercent() > (MP+20))then	
				UseSkillRaw(ReusoSkills(10512), false, false); -- Dagger Explosion
				Sleep(500);
			end;
		end;
		
	end;
	Combo();
	
end;

function OAAtk() --Ataques do Adventure
	ORAtk();
end;

function OWRAtk()--Ataques do Wind Rider
	ORAtk();
end;

function OGHAtk()--Ataques do Ghost Hunter
	ORAtk();
end;

function OFSAtk() --Ataques do Fortune Seeker
	if(TipoAtk == "AOE") then
		UseSkillRaw(10700, false, false); -- Mug
		Sleep(1500);
		if(ReusoSkills(10700) == 0) then
			UseSkillRaw(10702, false, false); -- Plunder
			Sleep(1500);
			ORAtk();
		end;
		UseSkillRaw(10700, false, false); -- Mug
		Sleep(1500);
	else
		UseSkillRaw(10702, false, false); -- Plunder
		Sleep(1000);
		ORAtk();
	end;
end;

----------------------------------------------------------------------------------------------
----Buffs por classe
----------------------------------------------------------------------------------------------
function ORBuffs() -- Othell Rogue
	if (GetMe():GotBuff(1931) == false) then
		UseSkillRaw(1931, false, false); -- OthellAura
		Sleep(500);
	end;
	if (GetMe():GotBuff(1986) == false) then
		UseSkillRaw(1986, false, false); -- Dual Maximum HP
		Sleep(500);
	end;
	if (GetMe():GotBuff(10525) == false) then
		UseSkillRaw(ReusoSkills(10525), false, false); -- ShadowDash
		Sleep(500);
	end;
end;

function OABuffs() -- Othell Adventure
	if (GetMe():GotBuff(10559) == false) then
		UseSkillRaw(ReusoSkills(10559), false, false); -- ElusiveMirage
		Sleep(500);
	end;
	if (GetMe():GotBuff(10560) == false) then
		UseSkillRaw(ReusoSkills(10560), false, false); -- MaximumBlow
		Sleep(500);
	end;
end;

function OWRBuffs() -- Othell Wind Rider
	if (GetMe():GotBuff(410) == false) then
		UseSkillRaw(ReusoSkills(410), false, false); -- MortalStrike
		Sleep(500);
	end;
	if (GetMe():GotBuff(10606) == false) then
		UseSkillRaw(ReusoSkills(10606), false, false); -- ShadowDodge
		Sleep(500); 
	end;
end;

function OGHBuffs() -- Othell Ghost Hunter
	if (GetMe():GotBuff(410) == false) then
		UseSkillRaw(ReusoSkills(410), false, false); -- MortalStrike
		Sleep(500);
	end;
	if (GetMe():GotBuff(10656) == false) then
		UseSkillRaw(ReusoSkills(10656), false, false); -- CriticalProwess
		Sleep(500);
	end;
	if (GetMe():GotBuff(10653) == false) then
		UseSkillRaw(ReusoSkills(10653), false, false); -- MeleeReflect
		Sleep(500);
	end;
end;

function OFSBuffs() -- Othell Fortune Seeker
	
end;


----------------------------------------------------------------------------------------------
----Funções de ataque
----------------------------------------------------------------------------------------------
function OthellAtk()
	local me = GetMe();
	LimparTarget();
	Combo();
	
	if (me:GetClass() == 141) then	-- Othell Rogue
		ORAtk();
	end;
	if (me:GetClass() == 158) then	-- OthellAdventurer
		OAAtk();
	end;
	if (me:GetClass() == 159) then	-- OthellWinRider
		OWRAtk();
	end;
	if (me:GetClass() == 160) then	-- OthellGhostHunter
		OGHAtk();
	end;
	if (me:GetClass() == 161) then	-- OthellFortuneSeeker
		OFSAtk();
	end;
end;


----------------------------------------------------------------------------------------------
----Funções de defesa
----------------------------------------------------------------------------------------------
function OthellDefesa()
	local Eu = GetMe();
	local HP = 51;
	
	if(Eu:GetHpPercent() < HP)then
		UseSkillRaw(ReusoSkills(10520), false, false); -- MeleeReflect
		Sleep(500);
	end;
	if(Eu:GetHpPercent() < (HP+15))then	-- Angel of Death
		UseSkillRaw(ReusoSkills(10531), false, false); -- MeleeReflect
		Sleep(500);
	end;
	if(Eu:GetHpPercent() < (HP+30))then	-- Disparition
		UseSkillRaw(ReusoSkills(1912), false, false); -- MeleeReflect
		Sleep(500);
	end;
end;


----------------------------------------------------------------------------------------------
----Funções de buffs
----------------------------------------------------------------------------------------------
function OthellBuffs()
	local me = GetMe();
	
	if (me:GetClass() == 141) then	-- Othell Rogue
		ORBuffs();
	end;
	if (me:GetClass() == 158) then	-- OthellAdventurer
		ORBuffs();
		OABuffs();
	end;
	if (me:GetClass() == 159) then	-- OthellWinRider
		ORBuffs();
		OWRBuffs();
	end;
	if (me:GetClass() == 160) then	-- OthellGhostHunter
		ORBuffs();
		OGHBuffs();
	end;
	if (me:GetClass() == 161) then	-- OthellFortuneSeeker
		ORBuffs();
		OFSBuffs();
	end;
end;

----------------------------------------------------------------------------------------------
----Acao
----------------------------------------------------------------------------------------------
function Acao()
	LimparTarget();
	OthellBuffs();	--usar skills de self buff
	Sleep(200);
	Combo();
	OthellDefesa();	--verifica hp para usar defesas
	Sleep(200);
	Combo();
	UseSkillRaw(ReusoSkills(10516), false, false); -- ShadowChase
	Sleep(500);
	Combo();
	OthellAtk();
	Sleep(100);
	Combo();
	Command("/attack");
end;

-----------------------------------------------------------------------------------------------------
---função principal
-----------------------------------------------------------------------------------------------------
function Main()
	
	------------------------------------------------------------------------------------------------
	---Regra de ataque
	------------------------------------------------------------------------------------------------
	if (GetTarget() ~= nil) then
		if (GetTarget():IsMonster() == true) and (GetMe():IsAlikeDeath() == false) and (GetTarget():IsAlikeDeath() == false) then
			LimparTarget();
			Acao();
			Combo();
			LimparTarget();
			ClearTargets();
		else
			Command("/pickup");
			Sleep(500);
		end;
	end;
	LimparTarget();
	
end;

-----------------------------------------------------------------------------------------------------
---execução do script
-----------------------------------------------------------------------------------------------------
repeat
	if not CheckIfRunning or not IsPaused() then
		LimparTarget();
		Main();
	end
	Sleep(100);
until false
