ShowToClient("Aviso","Ativando o Arqueiro Yul...");

Eu = GetMe();

----------------------------------------------------------------------------------------------
----Apresentação
----------------------------------------------------------------------------------------------
if(Eu:GetClass() == 142) then
	ShowToClient("Aviso","Eu sou seu Yul Archer.");
	Sleep(500);
elseif (Eu:GetClass() == 162) then
	ShowToClient("Aviso","Eu sou seu Yul Sagittarius.");
	Sleep(500);
elseif (Eu:GetClass() == 163) then
	ShowToClient("Aviso","Eu sou seu Yul Moonlight Sentinel.");
	Sleep(500);
elseif (Eu:GetClass() == 164) then
	ShowToClient("Aviso","Eu sou seu Yul Ghost Sentinel.");
	Sleep(500);
elseif (Eu:GetClass() == 165) then
	ShowToClient("Aviso","Eu sou seu Yul Trickster.");
	Sleep(500);
end;

ShowToClient("Aviso","Comecando as atividades do dia... ;)");

----------------------------------------------------------------------------------------------
--Stances
----------------------------------------------------------------------------------------------
--SS		- Sniper Stance
--DES	- Dead Eye Stance
--RFS	- Rapid Rire Stance
----------------------------------------------------------------------------------------------
lider = "Zamyad";
Stance = "SS";
TipoAtk = "AOE"; -- S-> Single; AOE-> Area;
AtivarSTHawk = "S"; --S->sim; N->nao
ponteiroStance = "";

----------------------------------------------------------------------------------------------
--Funções gerais
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
--MA
----------------------------------------------------------------------------------------------
function MA()
	PlayerList = GetPlayerList();
	
	for user in PlayerList.list do
		if(user:GetName() == lider) then
			if(GetTarget():IsMonster() == false) then
				Target(user);
				--Sleep(200);
				Command("/assist");
			end;
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
				UseSkillRaw(10760, false, false); -- TornadoShot
				Sleep(500);
			end;
		end;
	end;
end;

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
	
	for i in items.list do
		if string.match(i.Name, "Spiritshot") or string.match(i.Name, "Soulshot") then
			ActivateSoulShot(i.displayId,true)
		end;
	end;
	
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

	if not (ShotsActivated) and (GetSummonCount() > 0) and (GetItemAmountByName(BeastSS) > 5) then
		ActivateSoulShot(ShotsDisId, true);
		ShotsActivated = true;
		Sleep(2*1000);
	end;
end;

--Checa Summons
function ChecarSummons()
	if (GetSummonCount() < 1) then
		if (GetSummonCount() == 0) then
			ShotsActivated = false;
		end;
		UseSkillRaw(ReusoSkills(10787),false,false); 
		Sleep(500);
	end;
	AtivarShots();
end;

----Tipo de Stance
function YAStance(tipos)
	local tipo = tipos;
	if((Eu:GotBuff(10779) == true) and (ReusoSkills(10779) ~= 0)) then
		return 10757; 
	else
		if (tipo == "SS") then
			return 10759;    
		elseif (tipo == "DES") then
			return 10757;    
		elseif (tipo == "RFS") then
			return 10758;  
		end;
	end;
	
end;

----Reuso de Skills
function Distancia()
	return GetMe():GetRangeTo(GetTarget());
end;


----------------------------------------------------------------------------------------------
--Buffs proprios
----------------------------------------------------------------------------------------------
function YABuffs()
	if (Eu:GotBuff(1933) == false) then
		UseSkillRaw(1933, false, false); -- YulAura
		Sleep(500);
	end;
	if (Eu:GotBuff(1986) == false) then
		UseSkillRaw(1986, false, false); -- Dual Maximum HP
		Sleep(500);
	end;
	if (Eu:GotBuff(YAStance(Stance)) == false) then
		UseSkillRaw(ReusoSkills(YAStance(Stance)), false, false); -- Stance
		Sleep(500);
	end;
	if (ReusoSkills(1914) ~= 0) then
		UseSkillRaw(ReusoSkills(10783), false, false); -- Mind's Eye
		Sleep(500);
		UseSkillRaw(ReusoSkills(1914), false, false); -- Savage
		Sleep(500);
	end;
	if (Eu:GotBuff(10779) == false) then
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
	if (Eu:GotBuff(10950) == false) then
		UseSkillRaw(ReusoSkills(10950), false, false); -- Stance
		Sleep(500);
	end;
	YABuffs();
end;

function YulBuffs()
	if (Eu:GetClass() == 142) then		-- YulArcher
		YTBuffs();
	elseif (Eu:GetClass() == 162) then	-- YulSagittarius
		
	elseif (Eu:GetClass() == 163) then	-- YulMoonlightSentinel
		
	elseif (Eu:GetClass() == 164) then	-- YulGhostSentinel
		
	elseif (Eu:GetClass() == 165) then	-- YulTrickster
		YTBuffs();
	end;
end;

----------------------------------------------------------------------------------------------
--Defesas
----------------------------------------------------------------------------------------------
function YADefesa()
	if(Eu:GetHpPercent() < 50)then	
		UseSkillRaw(ReusoSkills(10776), false, false); -- Disparition
		Sleep(500);
	end;
	if(Eu:GetHpPercent() < 85)then
		UseSkillRaw(ReusoSkills(10793), false, false); -- Flash
		Sleep(500);
	end;
	if (Eu:GetLevel() >= 87) then
		if(Eu:GetHpPercent() < 70)then	
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
	if(Eu:GetLevel() >= 89) then
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
	if (Eu:GetLevel() < 87) then
		if(Eu:GetHpPercent() < 70)then	
			UseSkillRaw(ReusoSkills(525), false, false); -- Decoy
			Sleep(500);
		end;		
	end;
	YADefesa();
end;

function YulDefesa()
	if (Eu:GetClass() == 142) then		-- YulArcher
		YTDefesa();
	elseif (Eu:GetClass() == 162) then	-- YulSagittarius
		
	elseif (Eu:GetClass() == 163) then	-- YulMoonlightSentinel
		
	elseif (Eu:GetClass() == 164) then	-- YulGhostSentinel
		
	elseif (Eu:GetClass() == 165) then	-- YulTrickster
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
	LimparTarget();
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
		if(Eu:GetMpPercent() > 30) then
			UseSkillRaw(10763, false, false); -- Pinpoint Shot
			Sleep(800);
		end;
		if(Eu:GetMpPercent() > 40) then
			UseSkillRaw(10762, false, false); -- Quick Shot
			Sleep(800);
		end;
		if(Eu:GetMpPercent() > 50) then
			UseSkillRaw(10769, false, false); -- Impact Shot
			Sleep(800);
		end;
		if(Eu:GetMpPercent() > 60) then
			UseSkillRaw(10780, false, false); -- Slow Shot
			Sleep(800);
		end;
	end;
	Command("/attack");
end;

function YSAtk()
	LimparTarget();
	YAAtk();
end;

function YMSAtk()
	LimparTarget();
	YAAtk();
end;

function YGSAtk()
	LimparTarget();
	YAAtk();
end;

function YTAtk()
	LimparTarget();
	YAAtk();
end;

function YulAtk()
	LimparTarget();
	Combo();
	
	if (Eu:GetClass() == 142) then		-- YulArcher
		YAAtk();
	elseif (Eu:GetClass() == 162) then	-- YulSagittarius
		YSAtk();
	elseif (Eu:GetClass() == 163) then	-- YulMoonlightSentinel
		YMSAtk();
	elseif (Eu:GetClass() == 164) then	-- YulGhostSentinel
		YGSAtk();
	elseif (Eu:GetClass() == 165) then	-- YulTrickster
		YTAtk();
	end;
end;

----------------------------------------------------------------------------------------------
----Acao
----------------------------------------------------------------------------------------------
function Acao()
	LimparTarget();
	Combo();
	YulBuffs();
	Sleep(200);
	Combo();
	ChecarSummons();
	Sleep(200);
	Combo();
	YulDefesa();
	Sleep(200);
	Combo();
	YulAtk();
	Sleep(200);
	Combo();
	SummonAtk();
	Sleep(200);
	Combo();
	Command("/attack");
	Sleep(200);
	Combo();
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
			LimparTarget();
			Acao();
			Sleep(100);
			Combo();
			Command("/attack");
			Sleep(200);
			Combo();
			Command("/summonattack");
			ClearTargets();
		end;
	end;
	Command("/target Large Cocoon");
	Command("/useskillforce multiple Arrow")
end;

-----------------------------------------------------------------------------------------------------
---execução do script
-----------------------------------------------------------------------------------------------------
repeat
	if not CheckIfRunning or not IsPaused() then
		LimparTarget();
		Main();
	end
	Sleep(100)	
until false
