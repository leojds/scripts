---------------------------- NOTIFICATION ----------------------------------------------------
ShowToClient("SYS","Ativando Othell...");
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----Ataques por classe
----------------------------------------------------------------------------------------------
function ReusoSkills(IdSkill) --Ataques do Adventure
	local skill = IdSkill;
	return GetSkills():FindById(skill):CanBeUsed();
end;

function ORAtk() --Ataques do Othell Rogue
	local Eu = GetMe();
	local MP = 20;
	
	UseSkillRaw(10508, false, false); -- Blood Stab
	Sleep(800);
	UseSkillRaw(10510, false, false); -- Chain Blow
	Sleep(800);
	
	if(Eu:GetHpPercent() > MP)then	-- Reverse
		UseSkillRaw(10511, false, false);
		Sleep(800);
	end;
	if(Eu:GetHpPercent() > (MP+15))then	
		UseSkillRaw(10509, false, false);	-- Heart Breaker
		Sleep(800);
		UseSkillRaw(10512, false, false); -- Dagger Explosion
		Sleep(800);
	end;
	if(Eu:GetHpPercent() > (MP+20))then	
		UseSkillRaw(10512, false, false); -- Dagger Explosion
		Sleep(800);
	end;
	if(Eu:GetHpPercent() > (MP+35))then	
		UseSkillRaw(10526, false, false); -- Mischief
		Sleep(800);
	end;
	if(Eu:GetHpPercent() > (MP+40))then	
		UseSkillRaw(10539, false, false); -- Throw Dagger
		Sleep(800);
	end;
end;

function OAAtk() --Ataques do Adventure
	
end;

function OWRAtk()--Ataques do Wind Rider
	
end;

function OGHAtk()--Ataques do Ghost Hunter
	
end;

function OFSAtk() --Ataques do Fortune Seeker
	UseSkillRaw(10702, false, false); -- Plunder
	Sleep(800);
	UseSkillRaw(10700, false, false); -- Mug
	Sleep(800);
end;


----------------------------------------------------------------------------------------------
----Buffs por classe
----------------------------------------------------------------------------------------------
function ORBuffs() -- Othell Rogue
	if (GetMe():GotBuff(1931) == false) then
		UseSkillRaw(1931, false, false); -- OthellAura
		Sleep(800);
	end;
	if (GetMe():GotBuff(1986) == false) then
		UseSkillRaw(1986, false, false); -- Dual Maximum HP
		Sleep(1000);
	end;
	if (GetMe():GotBuff(10525) == false) then
		if(ReusoSkills(10525)) then
			UseSkillRaw(10525, false, false); -- ShadowDash
			Sleep(800);
		end;
	end;
end;

function OABuffs() -- Othell Adventure
	if (GetMe():GotBuff(10559) == false) then
		if(ReusoSkills(10559)) then
			UseSkillRaw(10559, false, false); -- ElusiveMirage
			Sleep(800);
		end;
	end;
	if (GetMe():GotBuff(10560) == false) then
		if(ReusoSkills(10560)) then
			UseSkillRaw(10525, false, false); -- MaximumBlow
			Sleep(800);
		end;
	end;
end;

function OWRBuffs() -- Othell Wind Rider
	if (GetMe():GotBuff(410) == false) then
		if(ReusoSkills(410)) then
			UseSkillRaw(410, false, false); -- MortalStrike
			Sleep(800);
		end;
	end;
	if (GetMe():GotBuff(10606) == false) then
		if(ReusoSkills(10606)) then
			UseSkillRaw(10606, false, false); -- ShadowDodge
			Sleep(800);                       
		end;
	end;
end;

function OGHBuffs() -- Othell Ghost Hunter
	if (GetMe():GotBuff(410) == false) then
		if(ReusoSkills(410)) then
			UseSkillRaw(410, false, false); -- MortalStrike
			Sleep(800);
		end;
	end;
	if (GetMe():GotBuff(10653) == false) then
		if(ReusoSkills(10653)) then
			UseSkillRaw(10653, false, false); -- MeleeReflect
			Sleep(800);
		end;
	end;
end;

function OFSBuffs() -- Othell Fortune Seeker
	
end;


----------------------------------------------------------------------------------------------
----Funções de ataque
----------------------------------------------------------------------------------------------
function OthellAtk()
	local me = GetMe();
	
	if (me:GetClass() == 141) then	-- Othell Rogue
		ORAtk();
	end;
	if (me:GetClass() == 158) then	-- OthellAdventurer
		OAAtk();
		ORAtk();
	end;
	if (me:GetClass() == 159) then	-- OthellWinRider
		OWRtk();
		ORAtk();
	end;
	if (me:GetClass() == 160) then	-- OthellGhostHunter
		OGHtk();
		ORAtk();
	end;
	if (me:GetClass() == 161) then	-- OthellFortuneSeeker
		OFSAtk();
		ORAtk();
	end;
end;


----------------------------------------------------------------------------------------------
----Funções de defesa
----------------------------------------------------------------------------------------------
function OthellDefesa()
	local Eu = GetMe();
	local HP = 51;
	
	if(Eu:GetHpPercent() < HP)then
		if(ReusoSkills(10520)) then
			UseSkillRaw(10520, false, false); -- MeleeReflect
			Sleep(800);
		end;
	end;
	if(Eu:GetHpPercent() < (HP+15))then	-- Angel of Death
		if(ReusoSkills(10531)) then
			UseSkillRaw(10531, false, false); -- MeleeReflect
			Sleep(800);
		end;
	end;
	if(Eu:GetHpPercent() < (HP+30))then	-- Disparition
		if(ReusoSkills(1912)) then
			UseSkillRaw(1912, false, false); -- MeleeReflect
			Sleep(800);
		end;
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



-----------------------------------------------------------------------------------------------------
---função principal
-----------------------------------------------------------------------------------------------------
function Main()
	
	OthellBuffs();	--usar skills de self buff
	OthellDefesa();	--verifica hp para usar defesas
	------------------------------------------------------------------------------------------------
	---Regra de ataque
	------------------------------------------------------------------------------------------------
	if (GetTarget() ~= nil) then
		if (GetTarget():IsMonster() == true) and (GetTarget():IsAlikeDeath() == false)
		and (GetMe():IsAlikeDeath() == false) then
			UseSkillRaw(10516, false, false); -- ShadowChase
			Sleep(800);
			OthellAtk();
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
