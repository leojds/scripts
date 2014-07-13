---------------------------- NOTIFICATION ----------------------------------------------------
ShowToClient("Aviso","Ativando o Curandeiro Aeore...");

Eu = GetMe();
Quem = GetTarget();
	
----------------------------------------------------------------------------------------------
----Apresentação
----------------------------------------------------------------------------------------------
if(Eu:GetClass() == 146) then
	ShowToClient("Aviso","Eu sou seu Aeore Healer");
	Sleep(500);
elseif (Eu:GetClass() == 179) then
	ShowToClient("Aviso","Eu sou seu Aeore Cardinal.");
	Sleep(500);
elseif (Eu:GetClass() == 180) then
	ShowToClient("Aviso","Eu sou seu Aeore Eva's Saint.");
	Sleep(500);
elseif (Eu:GetClass() == 181) then
	ShowToClient("Aviso","Eu sou seu Aeore Shilen Saint.");
	Sleep(500);
end;

ShowToClient("Aviso","Comecando as atividades... ;)");

----------------------------------------------------------------------------------------------
----Funcoes
----------------------------------------------------------------------------------------------
MAName = "Zamyad";

----Reuso de Skills
function ReusoSkills(IdSkill) --Ataques do Adventure
	local skill = IdSkill;
	
	if(GetSkills():FindById(skill):CanBeUsed()) then
		return skill;
	else
		return 0;
	end;
end;

----Perde targer 
function LimparTarget()
	local me = GetMe();
	local MyTarget = GetTarget();
	if (me ~= nil) and (not me:IsAlikeDeath()) and (MyTarget ~= nil) and ((MyTarget:IsMonster()) 
			or not ((MyTarget:IsMyPartyMember()) or (MyTarget:IsMe()))) then
		ClearTargets();
		CancelTarget(false);
		CancelTarget(false);
		CancelTarget(false); 
	end;
end;

---- 
function ProcurarNaParty(buff)
	PlayerList = GetPlayerList();
	local skill = GetSkills():FindById(buff);
	local b = buff;
	
	for user in PlayerList.list do
		TargetRaw(user:GetId());
		Sleep(500);
		ShowToClient("Aviso","testando 1, 2, 3...");
			
		if (user:GotBuff(b) == false) then
			ShowToClient("Aviso","Procurando...");
			if(skill:CanBeUsed()) then
				UseSkillRaw(skill, false, false);
				Sleep(500);
				ClearTargets();
				Sleep(500);
			end;
		end;
	end;
end;

----Debuffs
function Debuffs(db)
	DebuffSkill = GetSkills():FindById(db);
	--PlayerList = GetPlayerList();
	--Tanker = {139,148,149,150,151}
	
				
	--for user in PlayerList.list do
	--	if(user:IsMyPartyMember() == true)then
	--		if (user:IsMyPartyMember()) then
	--			for i = 1, #Tanker do
	--				if(user:GetClass() == Tanker[i]) then
	--					Target(user);
	--					Sleep(500);
	--					Command("/assist");
	--					if (GetTarget():IsMonster() == true) and (GetTarget():IsAlikeDeath() == false) and (GetMe():IsAlikeDeath() == false) then
	--						ShowToClient("Aviso","axei...");
	--						if (GetTarget():GotBuff(DebuffSkillId) == true) then
	--							LimparTarget();
	--						elseif (GetTarget():GotBuff(DebuffSkillId) == false) then
	--							UseSkill(DebuffSkillId,false,false);
	--							Sleep(100);
	--							LimparTarget();
	--							Sleep(100);
	--						end;
	--					end;
	--				end;
	--			end;
	--		end;
	--	end;
	--end;
end;

----------------------------------------------------------------------------------------------
--Buffs proprios
----------------------------------------------------------------------------------------------
function AHBuffs()
	if (Eu:GotBuff(1939) == false) then
		UseSkillRaw(1939, false, false); -- AeoreAura
		Sleep(500);
	end;
	if (Eu:GotBuff(1986) == false) then
		UseSkillRaw(1986, false, false); -- Dual Maximum HP
		Sleep(500);
	end;
	if (Eu:GotBuff(11826) == false) then
		TargetRaw(Eu:GetId());
		UseSkillRaw(ReusoSkills(11826), false, false); -- Emblem of Salvation
		Sleep(500);
		ClearTargets();
		Sleep(500);
	end;
	
end;

function ACBuffs()
	AHBuffs();
	if (Eu:GotBuff(11851) == false) then
		UseSkillRaw(ReusoSkills(11851), false, false); -- DivinePrayer
		Sleep(500);
	end;
end;

function AESBuffs()
	AHBuffs();
	if (Eu:GotBuff(11854) == false) then
		UseSkillRaw(ReusoSkills(11854), false, false); -- MassManaGain
		Sleep(500);
	end;
end;

function ASSBuffs()
	AHBuffs();
	if (Eu:GotBuff(11854) == false) then
		UseSkillRaw(ReusoSkills(11854), false, false); -- MassManaGain
		Sleep(500);
	end;
	--ProcurarNaParty(11854);
end;

function AeoreBuffs()
	if (Eu:GetClass() == 146) then		-- AeoreHealer
		AHBuffs();
	elseif (Eu:GetClass() == 179) then	-- AeoreCardinal
		ACBuffs();
	elseif (Eu:GetClass() == 180) then	-- AeoreEvasSaint
		AESBuffs();
	elseif (Eu:GetClass() == 181) then	-- AeoreShilenSaint
		ASSBuffs();
	end;
end;

----------------------------------------------------------------------------------------------
--Ressureição
----------------------------------------------------------------------------------------------
function Ress()
	PlayerList = GetPlayerList();
	ResSkill = GetSkills():FindById(11784);
	
	repeat
		if (GetMe():IsAlikeDeath() == true)then
				ShowToClient("Aviso","Estou morto, esperando pelo res.");
				Sleep(10000)
			repeat
				Sleep(1000);
			until (GetMe():IsAlikeDeath() == false);
			ShowToClient("Aviso","Estou vivo denovo. ;)");
		end;
		for user in PlayerList.list do
		  if(user:IsMyPartyMember() == true)then
			if (user:IsMyPartyMember()) and (user:IsAlikeDeath() == true)and(ResSkill ~= nil) and(ResSkill:CanBeUsed()) then
				Target(user);
				Sleep(500);
				UseSkillRaw(ReusoSkills(11784), false, false);
				Sleep(500);
				ClearTargets();
				Sleep(500);
			end;
		end;
	end;
	
	Sleep(5000)
	until false;
end;

----------------------------------------------------------------------------------------------
----Ataque
----------------------------------------------------------------------------------------------
function AHAtk()
	Debuffs(11777);	--MarkOfLumi
	Sleep(500);
	Debuffs(11780);	--DarkDevour
	Sleep(500);
	Debuffs(11781);	--DarkDevour
	Sleep(500);
	Debuffs(11769);	--DarckBackfire
	Sleep(500);
end;

function ACAtk()
	AHAtk();
end;

function AESAtk()
	AHAtk();
end;

function ASSAtk()
	AHAtk();
end;

function AeoreAtk()
	if (Eu:GetClass() == 146) then		-- AeoreHealer
		AHAtk();
	elseif (Eu:GetClass() == 179) then	-- AeoreCardinal
		ACAtk();
	elseif (Eu:GetClass() == 180) then	-- AeoreEvasSaint
		AESAtk();
	elseif (Eu:GetClass() == 181) then	-- AeoreShilenSaint
		ASSAtk();
	end;
end;

----------------------------------------------------------------------------------------------
----Acao
----------------------------------------------------------------------------------------------
function Acao()
	AeoreBuffs();
	Debuffs(11777)
	AeoreAtk();
end;

-----------------------------------------------------------------------------------------------------
---função principal
-----------------------------------------------------------------------------------------------------
function Main()
	Ress();
	Acao();
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
