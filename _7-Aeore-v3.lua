---------------------------- NOTIFICATION ----------------------------------------------------
ShowToClient("Aviso","Ativando o Curandeiro Aeore...");

eu = GetMe();
	
----------------------------------------------------------------------------------------------
----Apresentação
----------------------------------------------------------------------------------------------
if(eu:GetClass() == 146) then
	ShowToClient("Aviso","Eu sou seu Aeore Healer");
	Sleep(500);
elseif (eu:GetClass() == 179) then
	ShowToClient("Aviso","Eu sou seu Aeore Cardinal.");
	Sleep(500);
elseif (eu:GetClass() == 180) then
	ShowToClient("Aviso","Eu sou seu Aeore Eva's Saint.");
	Sleep(500);
elseif (eu:GetClass() == 181) then
	ShowToClient("Aviso","Eu sou seu Aeore Shilen Saint.");
	Sleep(500);
end;

ShowToClient("Aviso","Comecando as atividades... ;)");

----------------------------------------------------------------------------------------------
----Funcoes
----------------------------------------------------------------------------------------------
lider = "Zamyad";

----------------------------------------------------------------------------------------------
--MA
----------------------------------------------------------------------------------------------
function MA()
	PlayerList = GetPlayerList();
	
	for user in PlayerList.list do
		if(user:GetName() == lider) then
			if(GetTarget():IsMonster() == false) and (GetTarget():IsAlikeDeath() == false) then
				Target(user);
				--Sleep(200);
				Command("/assist");
			end;
		end;
	end;
end;

----Reuso de Skills
function ReusoSkills(IdSkill) --Ataques do Adventure
	local skill = IdSkill;
	
	if(GetSkills():FindById(skill):CanBeUsed()) then
		return skill;
	else
		return 0;
	end;
end;

----------------------------------------------------------------------------------------------
--Retorna numeros de Mortos
----------------------------------------------------------------------------------------------
function NumeroDeMortos()
	PlayerList = GetPlayerList();
	local cont = 0;
	
	for user in PlayerList.list do
		if(user:IsMyPartyMember() == true)then
			if ((user:IsAlikeDeath() == true)) then
				cont = cont + 1;
			end;
		end;
	end;
	
	return cont;
end;

----------------------------------------------------------------------------------------------
--Retorna numeros de Feridos
----------------------------------------------------------------------------------------------
function NumeroDeFeridos()
	PlayerList = GetPlayerList();
	local cont = 0;
	
	for user in PlayerList.list do
		if(user:IsMyPartyMember() == true)then
			if ((user:GetHpPercent() <= 50)) then
				cont = cont + 1;
			end;
		end;
	end;
	
	return cont;
end;

----------------------------------------------------------------------------------------------
--Retorna Id da skill pelo nome
----------------------------------------------------------------------------------------------
function IdSkillPeloNome(nome)
	local skillList = GetSkills();
	
	for skill in skillList.list do
		if (skill.name == nome) then
			return skill.skillId;
		end;
	end;

	return "";
end;

----------------------------------------------------------------------------------------------
--Retorna Nome da skill pelo Id
----------------------------------------------------------------------------------------------
function NomeSkillPeloId(id)
	local skillList = GetSkills();
	
	for skill in skillList.list do
		if (skill.skillId == id) then
			return skill.name;
		end;
	end;

	return 0;
end;

----------------------------------------------------------------------------------------------
----Perde targer 
----------------------------------------------------------------------------------------------
function LimparTarget()
	if (eu ~= nil) and (eu:IsAlikeDeath() == false) and (GetTarget() ~= nil) and ((GetTarget():IsMonster()) 
			or not ((GetTarget():IsMyPartyMember()) or (GetTarget():IsMe()))) then
		ClearTargets();
		CancelTarget(false);
		CancelTarget(false);
		CancelTarget(false); 
	end;
end;

----------------------------------------------------------------------------------------------
----Curas
----------------------------------------------------------------------------------------------
function Curar(usuario, tipo, porcentagem, skill)
	if(tipo == "cp")then
		if(usuario:GotBuff(IdSkillPeloNome("Celestial Party Protection")) == false)then
			if(usuario:GetCpPercent() < porcentagem)then
				if(skill == "Brilliant Heal")then
					UseSkillRaw(ReusoSkills(IdSkillPeloNome(skill)), false, false);
					Sleep(500);
				else
					Target(usuario);
					UseSkillRaw(ReusoSkills(IdSkillPeloNome(skill)), false, false);
					Sleep(500);
				end;
			end;
		end;
	elseif(tipo == "hp")then
		if(usuario:GotBuff(IdSkillPeloNome("Celestial Party Protection")) == false)then
			if(usuario:GetHpPercent() < porcentagem)then
				if((skill == "Balance Heal") or (skill == "Brilliant Heal"))then
					UseSkillRaw(ReusoSkills(IdSkillPeloNome(skill)), false, false);
					Sleep(500);
				else
					Target(usuario);
					UseSkillRaw(ReusoSkills(IdSkillPeloNome(skill)), false, false);
					Sleep(500);
				end;
			end;
		elseif(skill == "Balance Heal") then
			UseSkillRaw(ReusoSkills(IdSkillPeloNome(skill)), false, false);
			Sleep(500);
		end;
	elseif(tipo == "mp")then
		if(usuario:GotBuff(IdSkillPeloNome("Celestial Party Protection")) == false)then
			if(usuario:GetMpPercent() < porcentagem)then
				if(skill == "Brilliant Recharge")then
					UseSkillRaw(ReusoSkills(IdSkillPeloNome(skill)), false, false);
					Sleep(500);
				else
					if((usuario:GetClass() ~= 146) and (usuario:GetClass() ~= 179) and 
					(usuario:GetClass() ~= 180) and (usuario:GetClass() ~= 181))then
						if(usuario:GotBuff(IdSkillPeloNome(skill)) == false)then
							Target(usuario);
							UseSkillRaw(ReusoSkills(IdSkillPeloNome(skill)), false, false);
							Sleep(500);
						end;
					else
						if(skill == "Mental Recharge")then
							Target(usuario);
							UseSkillRaw(ReusoSkills(IdSkillPeloNome(skill)), false, false);
							Sleep(500);
						elseif(skill == "Rebirth")then
							UseSkillRaw(ReusoSkills(IdSkillPeloNome(skill)), false, false);
							Sleep(500);
						end;
					end;
				end;
			end;
		else
			if((usuario:GetClass() ~= 146) and (usuario:GetClass() ~= 179) and 
			(usuario:GetClass() ~= 180) and (usuario:GetClass() ~= 181))then
				if(usuario:GotBuff(IdSkillPeloNome(skill)) == false)then
					Target(usuario);
					UseSkillRaw(ReusoSkills(IdSkillPeloNome(skill)), false, false);
					Sleep(500);
				end;
			end;
		end;
	end;
end;

----------------------------------------------------------------------------------------------
----Reuso de Skills
----------------------------------------------------------------------------------------------
function Distancia()
	return GetMe():GetRangeTo(GetTarget());
end;

----------------------------------------------------------------------------------------------
----Debuffs
----------------------------------------------------------------------------------------------
function Debuffs(skill)
	--if(GetTarget():GotBuff(IdSkillPeloNome(skill)) == false) and (GetTarget():IsAlikeDeath() == true)then
	--	MA();
	--	UseSkillRaw(ReusoSkills(IdSkillPeloNome(skill)), false, false);
	--end;
end;

----------------------------------------------------------------------------------------------
--Curas CP, HP e MP
----------------------------------------------------------------------------------------------
function AHCuras()
	PlayerList = GetPlayerList();
	
	for user in PlayerList.list do
		LimparTarget();
		if(user:IsMyPartyMember() == true)then
			if(user:GetCpPercent() < 90)then
				Curar(user, "cp", 75, "Panic Heal");
				Curar(user, "cp", 90, "Brilliant Heal");
			end;
			
			if(user:GetHpPercent() < 90)then
				Curar(user, "hp", 75, "Balance Heal");
				Curar(user, "hp", 90, "Brilliant Heal");
				Curar(user, "hp", 80, "Sustain");
				Curar(user, "hp", 50, "Progrssive Heal");
			end;
			
			if(user:GetMpPercent() < 97)then
				Curar(user, "mp", 97, "Radiant Recharge");
			end;
			
			if(eu:GetCpPercent() < 90)then
				Curar(eu, "cp", 75, "Panic Heal");
				Curar(eu, "cp", 90, "Brilliant Heal");
			end;
			
			if(eu:GetHpPercent() < 90)then
				Curar(eu, "hp", 75, "Balance Heal");
				Curar(eu, "hp", 90, "Brilliant Heal");
				Curar(eu, "hp", 80, "Sustain");
				Curar(eu, "hp", 50, "Progrssive Heal");
				Curar(eu, "hp", 80, "Fairy of Life");
				
				if((user:GetClass() ~= 150) and (user:GetClass() ~= 151))then
					if(ReusoSkills(IdSkillPeloNome(skill)) ~= 0)then
						if(user:GotBuff(IdSkillPeloNome("Fairy of Life")) == false)then
							Curar(user, "hp", 80, "Fairy of Life");
						end;
					end;
				end;
			end;
			
			if(eu:GetMpPercent() < 90)then
				Curar(eu, "mp", 75, "Rebirth");
			end;
			
		end;
	end;
end;

function ACCuras()
	PlayerList = GetPlayerList();
	
	for user in PlayerList.list do
		LimparTarget();
		if(user:IsMyPartyMember() == true)then
			if(user:GetCpPercent() < 90)then
				
			end;
			
			if(user:GetHpPercent() < 90)then
				if(NumeroDeFeridos() >3 )then
					Curar(user, "hp", 40, "Miraculous Benediction");
				end;
			end;
			
			if(user:GetMpPercent() < 97)then
				
			end;
			
		end;
	end;
	AHCuras();
end;

function AESCuras()
	LimparTarget();
	AHCuras();
end;

function ASSCuras()
	PlayerList = GetPlayerList();
	
	for user in PlayerList.list do
		LimparTarget();
		if(user:IsMyPartyMember() == true)then
			if(user:GetCpPercent() < 90)then
				
			end;
			
			if(user:GetHpPercent() < 90)then
				
			end;
			
			if(user:GetMpPercent() < 97)then
				Curar(user, "mp", 10, "Mental Recharge");
			end;
			
		end;
	end;
	AHCuras();
end;

function AeoreCuras()
	LimparTarget();
	
	if (eu:GetClass() == 146) then		-- AeoreHealer
		AHCuras();
	elseif (eu:GetClass() == 179) then	-- AeoreCardinal
		ACCuras();
	elseif (eu:GetClass() == 180) then	-- AeoreEvasSaint
		AESCuras();
	elseif (eu:GetClass() == 181) then	-- AeoreShilenSaint
		ASSCuras();
	end;
end;

----------------------------------------------------------------------------------------------
--Defesa
----------------------------------------------------------------------------------------------
function AHDefesa()
	PlayerList = GetPlayerList();
	
	for user in PlayerList.list do
		if(user:IsMyPartyMember() == true)then
			if(eu:GetLevel() >= 87)then
				if(user:GetHpPercent() < 70)then
					UseSkillRaw(ReusoSkills(IdSkillPeloNome("Celestial Party Protection")), false, false); -- CelestialPartyProtection
					Sleep(500);
				end;
			end;
		end;
	end;
	
	if(eu:GetHpPercent() < 70)then
		UseSkillRaw(ReusoSkills(IdSkillPeloNome("Celestial Party Protection")), false, false); -- CelestialPartyProtection
		Sleep(500);
	end;
				
	if(eu:GetHpPercent() < 70)then
		UseSkillRaw(ReusoSkills(IdSkillPeloNome("Disparition") and (ReusoSkills(IdSkillPeloNome("Celestial Party Protection")) == 0)), false, false); -- Disparition
		Sleep(500);
	end;
	
	if(eu:GetHpPercent() < 70) and (ReusoSkills(IdSkillPeloNome("Disparition")) == 0)then
		UseSkillRaw(ReusoSkills(IdSkillPeloNome("Giant's Favor")), false, false); -- Giant'sFavor
		Sleep(500);
	end;
	
end;

function ACDefesa()
	AHDefesa();
end;

function AESDefesa()
	AHDefesa();
end;

function ASSDefesa()
	AHDefesa();
end;

function AeoreDefesa()
	AeoreCuras();
	
	if (eu:GetClass() == 146) then		-- AeoreHealer
		AHDefesa();
	elseif (eu:GetClass() == 179) then	-- AeoreCardinal
		ACDefesa();
	elseif (eu:GetClass() == 180) then	-- AeoreEvasSaint
		AESDefesa();
	elseif (eu:GetClass() == 181) then	-- AeoreShilenSaint
		ASSDefesa();
	end;
end;

----------------------------------------------------------------------------------------------
--Buffs proprios
----------------------------------------------------------------------------------------------
function AHBuffs()
	PlayerList = GetPlayerList();
	
	if (eu:GotBuff(1939) == false) then
		UseSkillRaw(1939, false, false); -- AeoreAura
		Sleep(500);
	end;
	if (eu:GotBuff(1986) == false) then
		UseSkillRaw(1986, false, false); -- Dual Maximum HP
		Sleep(500);
	end;
	if (eu:GotBuff(11826) == false) then
		Target(eu);
		UseSkillRaw(ReusoSkills(11826), false, false); -- Emblem of Salvation
		Sleep(500);
		ClearTargets();
		Sleep(500);
	end;
	
	for user in PlayerList.list do
		if(user:IsMyPartyMember() == true)then
			if (user:GotBuff(IdSkillPeloNome("Noblesse Blessing")) == false) then
				Target(user);
				UseSkillRaw(ReusoSkills(IdSkillPeloNome("Noblesse Blessing")), false, false); -- NoblesseBlessing
				Sleep(500);
			end;
			if (eu:GotBuff(IdSkillPeloNome("Noblesse Blessing")) == false) then
				Target(eu);
				UseSkillRaw(ReusoSkills(IdSkillPeloNome("Noblesse Blessing")), false, false); -- NoblesseBlessing
				Sleep(500);
			end;
		end;
	end;
	
end;

function ACBuffs()
	PlayerList = GetPlayerList();
	
	for user in PlayerList.list do
		if(user:IsMyPartyMember() == true)then
			if (user:GotBuff(IdSkillPeloNome("Divine Prayer")) == false) then
				UseSkillRaw(ReusoSkills(IdSkillPeloNome("Divine Prayer")), false, false); -- DivinePrayer
				Sleep(500);
			end;
		end;
	end;
	AHBuffs();
end;

function AESBuffs()
	PlayerList = GetPlayerList();
	
	for user in PlayerList.list do
		if(user:IsMyPartyMember() == true)then
			if (eu:GotBuff(IdSkillPeloNome("Mass Mana Gain")) == false) then
				UseSkillRaw(ReusoSkills(IdSkillPeloNome("Mass Mana Gain")), false, false); -- MassManaGain
				Sleep(500);
			end;
		end;
	end;
	AHBuffs();
end;

function ASSBuffs()
	PlayerList = GetPlayerList();
	
	for user in PlayerList.list do
		if(user:IsMyPartyMember() == true)then
			if (user:GotBuff(IdSkillPeloNome("Mass Mana Gain")) == false) then
				UseSkillRaw(ReusoSkills(IdSkillPeloNome("Mass Mana Gain")), false, false); -- MassManaGain
				Sleep(500);
			end;
		end;
	end;
	AHBuffs();
end;

function AeoreBuffs()
	AeoreCuras();
	
	if (eu:GetClass() == 146) then		-- AeoreHealer
		AHBuffs();
	elseif (eu:GetClass() == 179) then	-- AeoreCardinal
		ACBuffs();
	elseif (eu:GetClass() == 180) then	-- AeoreEvasSaint
		AESBuffs();
	elseif (eu:GetClass() == 181) then	-- AeoreShilenSaint
		ASSBuffs();
	end;
end;

----------------------------------------------------------------------------------------------
--Ressureição
----------------------------------------------------------------------------------------------
function Ress()
	PlayerList = GetPlayerList();
	ResSkill = GetSkills():FindById(11784);
	
	if (eu:IsAlikeDeath() == true)then
		ShowToClient("Aviso","Estou morto, esperando pelo res.");
		Sleep(10000)
		repeat
			Sleep(1000);
		until (eu:IsAlikeDeath() == false);
		ShowToClient("Aviso","Estou vivo denovo. ;)");
	end;
	
	for user in PlayerList.list do
		if(user:IsMyPartyMember() == true)then
			if (user:IsMyPartyMember()) and (user:IsAlikeDeath() == true)and(ResSkill ~= nil) and(ResSkill:CanBeUsed()) then
				if((NumeroDeMortos() >= 3) and 
				(ReusoSkills(IdSkillPeloNome("Party Resurrection")) ~= 0) and
				(Distancia() <= 500) and (eu:GetLevel() >= 89)) then
					UseSkillRaw(ReusoSkills(IdSkillPeloNome("Party Resurrection")), false, false);
					Sleep(500);
					ClearTargets();
					Sleep(500);
				else
					Target(user);
					Sleep(500);
					UseSkillRaw(ReusoSkills(IdSkillPeloNome("Blessed Resurrection")), false, false);
					Sleep(500);
					ClearTargets();
					Sleep(500);
				end;
				
			end;
		end;
	end;
	AeoreCuras();
	
	Sleep(5000);
end;

----------------------------------------------------------------------------------------------
----Ataque
----------------------------------------------------------------------------------------------
function AHAtk()
	Debuffs("Mark of Lumi");	--MarkOfLumi
	Sleep(500);
	Debuffs("Dark Devour");	--DarkDevour
	Sleep(500);
	Debuffs("Dark Backfire");	--DarkBackfire
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
	AeoreCuras();
	
	if (eu:GetClass() == 146) then		-- AeoreHealer
		AHAtk();
	elseif (eu:GetClass() == 179) then	-- AeoreCardinal
		ACAtk();
	elseif (eu:GetClass() == 180) then	-- AeoreEvasSaint
		AESAtk();
	elseif (eu:GetClass() == 181) then	-- AeoreShilenSaint
		ASSAtk();
	end;
end;

----------------------------------------------------------------------------------------------
----Acao
----------------------------------------------------------------------------------------------
function Acao()
	--AeoreAtk();
	AeoreCuras();
	AeoreBuffs();
	AeoreDefesa();
	--AeoreAtk();
end;

-----------------------------------------------------------------------------------------------------
---função principal
-----------------------------------------------------------------------------------------------------
function Main()
	Ress();
	Acao();
	--ShowToClient("Aviso","Fairy of Life = "..IdSkillPeloNome("Fairy of Life"));
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
