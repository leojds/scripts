ShowToClient("Aviso","Ativando o Arqueiro Yul...");

eu = GetMe();
classe = eu:GetClass();

----------------------------------------------------------------------------------------------
----Apresentação
----------------------------------------------------------------------------------------------
if(classe == 142) then
	ShowToClient("Aviso","eu sou seu Yul Archer.");
	Sleep(500);
elseif (classe == 162) then
	ShowToClient("Aviso","eu sou seu Yul Sagittarius.");
	Sleep(500);
elseif (classe == 163) then
	ShowToClient("Aviso","eu sou seu Yul Moonlight Sentinel.");
	Sleep(500);
elseif (classe == 164) then
	ShowToClient("Aviso","eu sou seu Yul Ghost Sentinel.");
	Sleep(500);
elseif (classe == 165) then
	ShowToClient("Aviso","eu sou seu Yul Trickster.");
	Sleep(500);
end;

ShowToClient("Aviso","Comecando as atividades do dia... ;)");


----------------------------------------------------------------------------------------------
--Buffs proprios
----------------------------------------------------------------------------------------------
function YABuffs()
	if (eu:GotBuff(1933) == false) then
		UseSkillRaw(1933, false, false); -- YulAura
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
	if (ReusoSkills(1914) ~= 0) then
		UseSkillRaw(ReusoSkills(10783), false, false); -- Mind's Eye
		Sleep(500);
		UseSkillRaw(ReusoSkills(1914), false, false); -- Savage
		Sleep(500);
	end;
	if (eu:GotBuff(10779) == false) then
		UseSkillRaw(ReusoSkills(10779), false, false); -- Quick Fire
		Sleep(500);
	end;
	
end;

function YSBuffs()
	
end;

function YMSBuffs()
	
end;

function YGSBuffs()
	
end;

function YTBuffs()
	if (eu:GotBuff(10950) == false) then
		UseSkillRaw(ReusoSkills(10950), false, false); -- Stance
		Sleep(500);
	end;
	YABuffs();
end;

function YulBuffs()
	if (eu:GetClass() == 142) then		-- YulArcher
		YTBuffs();
	elseif (eu:GetClass() == 162) then	-- YulSagittarius
		
	elseif (eu:GetClass() == 163) then	-- YulMoonlightSentinel
		
	elseif (eu:GetClass() == 164) then	-- YulGhostSentinel
		
	elseif (eu:GetClass() == 165) then	-- YulTrickster
		YTBuffs();
	end;
end;

----------------------------------------------------------------------------------------------
--Defesas
----------------------------------------------------------------------------------------------
function YADefesa()
	if(eu:GetHpPercent() < 50)then	
		UseSkillRaw(ReusoSkills(10776), false, false); -- Disparition
		Sleep(500);
	end;
	if(eu:GetHpPercent() < 85)then
		UseSkillRaw(ReusoSkills(10793), false, false); -- Flash
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
