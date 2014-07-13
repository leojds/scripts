ShowToClient("Aviso","Ativando o Mago Feoh...");

eu = GetMe();
classe = eu:GetClass();

----------------------------------------------------------------------------------------------
----Apresentação
----------------------------------------------------------------------------------------------
if(classe == 143) then
	ShowToClient("Aviso","eu sou seu Feoh Wizard.");
	Sleep(500);
elseif (classe == 166) then
	ShowToClient("Aviso","eu sou seu Feoh Archmage.");
	Sleep(500);
elseif (classe == 167) then
	ShowToClient("Aviso","eu sou seu Feoh Soultaker.");
	Sleep(500);
elseif (classe == 168) then
	ShowToClient("Aviso","eu sou seu Feoh Mystic Muse.");
	Sleep(500);
elseif (classe == 169) then
	ShowToClient("Aviso","eu sou seu Feoh Storm Screamer.");
	Sleep(500);
elseif (classe == 170) then
	ShowToClient("Aviso","eu sou seu Feoh Soulhound.");
	Sleep(500);
end;

ShowToClient("Aviso","Comecando as atividades do dia... ;)");


----------------------------------------------------------------------------------------------
--Funções Gerais
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
--Stances
----------------------------------------------------------------------------------------------
--FiS	- Fire Stance
--WaS	- Water Stance
--WiS	- Wind Stance
--EaS	- Earth Stance
----------------------------------------------------------------------------------------------
stance = "WiS";
tipoAtk = "AOE";

----------------------------------------------------------------------------------------------
----Reuso de Skills
----------------------------------------------------------------------------------------------
function ReusoSkills(IdSkill)
	local skill = IdSkill;
	
	if(GetSkills():FindById(skill):CanBeUsed()) then
		return skill;
	else
		return 0;
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
				UseSkillRaw(10760, false, false); -- TornadoShot
				Sleep(500);
			end;
		end;
	end;
end;

----------------------------------------------------------------------------------------------
--Buffs proprios
----------------------------------------------------------------------------------------------
function FWBuffs()
	if (eu:GotBuff(1935) == false) then
		UseSkillRaw(1935, false, false); -- FeohAura
		Sleep(500);
	end;
	if (eu:GotBuff(1986) == false) then
		UseSkillRaw(1986, false, false); -- Dual Maximum HP
		Sleep(500);
	end;
	if (eu:GotBuff(YAStance(Stance)) == false) then
		UseSkillRaw(ReusoSkills(YAStance(Stance)), false, false); -- Stance
		Sleep(500);
	end;
	if (ReusoSkills(1914) ~= 0) and (ReusoSkills(11046) ~= 0) and (ReusoSkills(11068) ~= 0) then
		UseSkillRaw(ReusoSkills(1914), false, false); -- Savage
		Sleep(500);
		UseSkillRaw(ReusoSkills(11046), false, false); -- WizardSpirit
		Sleep(500);
		UseSkillRaw(ReusoSkills(11068), false, false); -- DoubleCasting
		Sleep(500);
	elseif (ReusoSkills(11046) ~= 0) and (ReusoSkills(11068) ~= 0) then
		UseSkillRaw(ReusoSkills(11046), false, false); -- WizardSpirit
		Sleep(500);
		UseSkillRaw(ReusoSkills(11068), false, false); -- DoubleCasting
		Sleep(500);
	else
		UseSkillRaw(ReusoSkills(11068), false, false); -- DoubleCasting
		Sleep(500);
	end;
	
end;

function FAMBuffs()
	
end;

function FSTBuffs()
	
end;

function FMMBuffs()
	
end;

function FSSBuffs()
	
end;

function FSHBuffs()
	FWBuffs();
end;

function FeohBuffs()
	if (eu:GetClass() == 143) then		-- FeohWizard
		
	elseif (eu:GetClass() == 166) then	-- FeohArchmage
		
	elseif (eu:GetClass() == 167) then	-- FeohSoultaker
		
	elseif (eu:GetClass() == 168) then	-- FeohMysticMuse
		
	elseif (eu:GetClass() == 169) then	-- FeohStormScreamer
		
	elseif (eu:GetClass() == 170) then	-- FeohSoulhound
		FSHBuffs();
	end;
end;

----------------------------------------------------------------------------------------------
--Defesas
----------------------------------------------------------------------------------------------
function FWDefesa()
	if(eu:GetMpPercent() < 90)then	
		UseSkillRaw(ReusoSkills(11064), false, false); -- UltimateBodyToMind
		Sleep(500);
	end;
	if(eu:GetHpPercent() < 40)then
		UseSkillRaw(ReusoSkills(11065), false, false); -- Arcane Barrier
		Sleep(500);
	end;
	if (eu:GetLevel() >= 87) then
		if(eu:GetHpPercent() < 70)then	
			UseSkillRaw(ReusoSkills(10775), false, false); -- Confiosion Decoy
			Sleep(500);
		end;		
	end;
	if(Distancia() < 100) then
		UseSkillRaw(ReusoSkills(10761), false, false); -- Bow Strick
		Sleep(500);
	end;
	if(Distancia() < 200) then
		UseSkillRaw(ReusoSkills(10770), false, false); -- Recoil Shot
		Sleep(500);
	end;
	if(eu:GetLevel() >= 89) then
		if(Distancia() < 200) then
			UseSkillRaw(ReusoSkills(10805), false, false); -- QuickCharge
			Sleep(500);
		end;
	end;
	
	
end;

function YSDefesa()
	
end;

function YMSDefesa()
	
end;

function YGSDefesa()
	
end;

function YTDefesa()
	if (eu:GetLevel() < 87) then
		if(eu:GetHpPercent() < 70)then	
			UseSkillRaw(ReusoSkills(525), false, false); -- Decoy
			Sleep(500);
		end;		
	end;
	YADefesa();
end;

function YulDefesa()
	if (eu:GetClass() == 142) then		-- YulArcher
		YTDefesa();
	elseif (eu:GetClass() == 162) then	-- YulSagittarius
		
	elseif (eu:GetClass() == 163) then	-- YulMoonlightSentinel
		
	elseif (eu:GetClass() == 164) then	-- YulGhostSentinel
		
	elseif (eu:GetClass() == 165) then	-- YulTrickster
		YTDefesa();
	end;
end;

----------------------------------------------------------------------------------------------
----Ataque
----------------------------------------------------------------------------------------------
function Bullseye()
	if(GetTarget() ~= nil) then
		if(GetTarget():GotBuff(10801) == false) then
			UseSkillRaw(ReusoSkills(10801), false, false); -- Bullseye
			Sleep(500);
		end;
	end;
end;

function SummonAtk()
	if (GetTarget() ~= nil) and GetTarget():IsMonster() and (GetSummonCount() > 0) 
	and (GetTarget():GetDistance() < 4000) then --and (ScriptTargetId == 0)
		if not (GetTarget():IsAlikeDeath()) then
			Command("/useshortcut 5 1");
			--Action(touch,false,false);
			Sleep(150);
			Command("/useshortcut 5 2");
			--Action(touch,false,false);
			Sleep(150);
			Command("/useshortcut 5 3");
			--Action(power,false,false);
			Sleep(150);
			Action(22, false, false);
			Sleep(200);
			Command("/summonattack");
		elseif (GetTarget():IsAlikeDeath()) then
			ClearTargets();
		end;
	end;
end;

function YAAtk()
	--UseSkillRaw(10801, false, false); -- Bullseye
	--Sleep(800)
	Bullseye();
	Combo();
	
	if(TipoAtk == "S") then
		UseSkillRaw(10763, false, false); -- Pinpoint Shot
		Sleep(800);
		UseSkillRaw(10762, false, false); -- Quick Shot
		Sleep(800);
		UseSkillRaw(10769, false, false); -- Impact Shot
		Sleep(800);
		UseSkillRaw(10780, false, false); -- Slow Shot
		Sleep(800);
	elseif(TipoAtk == "AOE") then
		UseSkillRaw(10772, false, false); -- Heavy Arrow Rain
		Sleep(800)
		UseSkillRaw(10771, false, false); -- Multiple Arrow
		Sleep(800)	
		UseSkillRaw(10760, false, false); -- Tornado Shot
		Sleep(800)
		if(eu:GetMpPercent() > 30) then
			UseSkillRaw(10763, false, false); -- Pinpoint Shot
			Sleep(800);
		end;
		if(eu:GetMpPercent() > 40) then
			UseSkillRaw(10762, false, false); -- Quick Shot
			Sleep(800);
		end;
		if(eu:GetMpPercent() > 50) then
			UseSkillRaw(10769, false, false); -- Impact Shot
			Sleep(800);
		end;
		if(eu:GetMpPercent() > 60) then
			UseSkillRaw(10780, false, false); -- Slow Shot
			Sleep(800);
		end;
	end;
	Command("/attack");
end;

function YSAtk()
	YAAtk();
end;

function YMSAtk()
	YAAtk();
end;

function YGSAtk()
	YAAtk();
end;

function YTAtk()
	YAAtk();
end;

function YulAtk()
	Combo();
	
	if (eu:GetClass() == 142) then		-- YulArcher
		YAAtk();
	elseif (eu:GetClass() == 162) then	-- YulSagittarius
		YSAtk();
	elseif (eu:GetClass() == 163) then	-- YulMoonlightSentinel
		YMSAtk();
	elseif (eu:GetClass() == 164) then	-- YulGhostSentinel
		YGSAtk();
	elseif (eu:GetClass() == 165) then	-- YulTrickster
		YTAtk();
	end;
end;

----------------------------------------------------------------------------------------------
----Acao
----------------------------------------------------------------------------------------------
function Acao()
	YulBuffs();
	Sleep(200);
	ChecarSummons();
	Sleep(200);
	YulDefesa();
	Sleep(200);
	Combo();
	YulAtk();
	Sleep(200);
	SummonAtk();
	Sleep(200);
	Command("/attack");
	Sleep(200);
	Command("/summonattack");
end;
-----------------------------------------------------------------------------------------------------
---função principal
-----------------------------------------------------------------------------------------------------
function Main()
-----------------------------------------------------------------------------------------------------
---Regra de ataque
-----------------------------------------------------------------------------------------------------
	if (GetTarget() ~= nil) then
		if (GetTarget():IsMonster() == true) and (GetMe():IsAlikeDeath() == false) then
			Acao();
			Sleep(100);
			Command("/attack");
			Sleep(200);
			Command("/summonattack");
		elseif(GetTarget():IsAlikeDeath() == true) then
			ClearTargets();
		end;
	end;
end;

-----------------------------------------------------------------------------------------------------
---execução do script
-----------------------------------------------------------------------------------------------------
repeat
	if not CheckIfRunning or not IsPaused() then
		Main();
	end
	Sleep(100)	
until false
