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
lider = "Ashisvangh";

	
----------------------------------------------------------------------------------------------
--MA
----------------------------------------------------------------------------------------------
function MA()
	PlayerList = GetPlayerList();
	
	for user in PlayerList.list do
		if(user:GetName() == lider) then
			return user;
		else
			return nil;
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
			if ((user:GetHpPercent() <= 60)) then
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

	return 0;
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

	return "";
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
	if(usuario:IsAlikeDeath() == false) and (eu:IsAlikeDeath() == false)then
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
			elseif(skill == "Fairy of Life") or (skill == "Sustain") then	--
				Target(usuario);
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
				if((skill == "Radiant Recharge"))then
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
	end;
end;

----------------------------------------------------------------------------------------------
----Reuso de Skills
----------------------------------------------------------------------------------------------
function Distancia()
	return GetMe():GetRangeTo(GetTarget());
end;

----------------------------------------------------------------------------------------------
--Lista de debuffs
----------------------------------------------------------------------------------------------
debuffList = {
		IdSkillPeloNome("Sleep"), IdSkillPeloNome("Fatal Sleep"),
		IdSkillPeloNome("Mass Fatal Sleep"), IdSkillPeloNome("Stun"),
		IdSkillPeloNome("Fairy Curse Poison"), IdSkillPeloNome("Fairy Curse Gloom"),
		IdSkillPeloNome("Throw Dagger"), IdSkillPeloNome("Dark Paralysis"),
		IdSkillPeloNome("Poison"), IdSkillPeloNome("Deadly Poison"), 
		
	}
	
----------------------------------------------------------------------------------------------
----LimparDebuffs
----------------------------------------------------------------------------------------------
function LimparDebuffs(usuario)
	for i = 1, #debuffList do
		if(usuario:GotBuff(debuffList[i]) == true)then
			Target(usuario);
			UseSkillRaw(ReusoSkills(IdSkillPeloNome("Radiant Purg")), false, false);
			Sleep(500);
		end;
	end;
end;

----------------------------------------------------------------------------------------------
----Debuffs
----------------------------------------------------------------------------------------------
function Debuffs(skill)
	if(MA() ~= nil)then
		if(MA():GetTarget():GotBuff(skill) == false)then
			UseSkillRaw(ReusoSkills(IdSkillPeloNome(skill)), false, false);
			Sleep(500);
		end;
	end;
	
end;

----------------------------------------------------------------------------------------------
--Curas CP
----------------------------------------------------------------------------------------------
function AHCurasCP()
	PlayerList = GetPlayerList();
	
	for user in PlayerList.list do
		LimparTarget();
		if(user:IsMyPartyMember() == true)then
			if(user:GetCpPercent() < 90)then
				Curar(user, "cp", 75, "Panic Heal");
				Curar(user, "cp", 90, "Brilliant Heal");
			end;
			if(eu:GetCpPercent() < 90)then
				Curar(eu, "cp", 75, "Panic Heal");
				Curar(eu, "cp", 90, "Brilliant Heal");
			end;
			
		end;
	end;
	if(eu:GetCpPercent() < 90)then
		Curar(eu, "cp", 75, "Panic Heal");
		Curar(eu, "cp", 90, "Brilliant Heal");
	end;
			
end;

function ACCurasCP()
	PlayerList = GetPlayerList();
	
	for user in PlayerList.list do
		LimparTarget();
		if(user:IsMyPartyMember() == true)then
			if(user:GetHpPercent() < 90)then
				if(NumeroDeFeridos() > 3 )then
					Curar(user, "hp", 40, "Miraculous Benediction");
				end;
			end;
		end;
	end;
	AHCurasCP();
	LimparTarget();
end;

function AESCuras()
	AHCurasCP();
	LimparTarget();
end;

function ASSCurasCP()
	AHCurasCP();
	LimparTarget();
end;

function AeoreCurasCP()
	LimparTarget();
	
	if (eu:GetClass() == 146) then		-- AeoreHealer
		AHCurasCP();
	elseif (eu:GetClass() == 179) then	-- AeoreCardinal
		ACCurasCP();
	elseif (eu:GetClass() == 180) then	-- AeoreEvasSaint
		AESCurasCP();
	elseif (eu:GetClass() == 181) then	-- AeoreShilenSaint
		ASSCurasCP();
	end;
end;

----------------------------------------------------------------------------------------------
--Curas HP
----------------------------------------------------------------------------------------------
function AHCurasHP()
	PlayerList = GetPlayerList();
	
	for user in PlayerList.list do
		LimparTarget();
		if(user:IsMyPartyMember() == true)then
			if(user:GetHpPercent() < 90)then
				Curar(user, "hp", 75, "Balance Heal");
				Curar(user, "hp", 90, "Brilliant Heal");
				Curar(user, "hp", 80, "Sustain");
				Curar(user, "hp", 50, "Progressive Heal");
				if((user:GetClass() ~= 150) and (user:GetClass() ~= 151))then
					if(ReusoSkills(IdSkillPeloNome("Fairy of Life")) ~= 0)then
						if(user:GotBuff(IdSkillPeloNome("Fairy of Life")) == false)then
							Curar(user, "hp", 80, "Fairy of Life");
						end;
					end;
				end;
			end;
			
			if(NumeroDeFeridos() > 3)then
				UseSkillRaw(ReusoSkills(IdSkillPeloNome("Summon Tree of Life")), false, false); -- CelestialPartyProtection
				Sleep(500);
			end;
			
			if(eu:GetHpPercent() < 90)then
				Curar(eu, "hp", 50, "Panic Heal");
				Curar(eu, "hp", 75, "Balance Heal");
				Curar(eu, "hp", 90, "Brilliant Heal");
				Curar(eu, "hp", 90, "Sustain");
				Curar(eu, "hp", 50, "Progressive Heal");
				
				if(ReusoSkills(IdSkillPeloNome("Fairy of Life")) ~= 0)then
					if(eu:GotBuff(IdSkillPeloNome("Fairy of Life")) == false)then
						Curar(eu, "hp", 85, "Sustain");
						Curar(eu, "hp", 85, "Fairy of Life");
					end;
				end;
			end;
		end;
	end;
	if(eu:GetHpPercent() < 90)then
		Curar(eu, "hp", 75, "Balance Heal");
		Curar(eu, "hp", 90, "Brilliant Heal");
		Curar(eu, "hp", 85, "Sustain");
		Curar(eu, "hp", 50, "Progressive Heal");
			
		if(ReusoSkills(IdSkillPeloNome("Fairy of Life")) ~= 0)then
			if(eu:GotBuff(IdSkillPeloNome("Fairy of Life")) == false)then
				Curar(eu, "hp", 85, "Sustain");
				Curar(eu, "hp", 85, "Fairy of Life");
			end;
		end;
	end;
	if(eu:GetHpPercent() < 70)then
		UseSkillRaw(ReusoSkills(IdSkillPeloNome("Summon Tree of Life")), false, false); -- CelestialPartyProtection
		Sleep(500);
	end;
end;

function ACCurasHP()
	PlayerList = GetPlayerList();
	
	for user in PlayerList.list do
		LimparTarget();
		if(user:IsMyPartyMember() == true)then
			if(user:GetHpPercent() < 90)then
				if(NumeroDeFeridos() >3 )then
					Curar(user, "hp", 40, "Miraculous Benediction");
				end;
			end;
			
		end;
	end;
	AHCurasHP();
end;

function AESCurasHP()
	AHCurasHP();
	LimparTarget();
end;

function ASSCurasHP()
	AHCurasHP();
	LimparTarget();
end;

function AeoreCurasHP()
	LimparTarget();
	
	if (eu:GetClass() == 146) then		-- AeoreHealer
		AHCurasHP();
	elseif (eu:GetClass() == 179) then	-- AeoreCardinal
		ACCurasHP();
	elseif (eu:GetClass() == 180) then	-- AeoreEvasSaint
		AESCurasHP();
	elseif (eu:GetClass() == 181) then	-- AeoreShilenSaint
		ASSCurasHP();
	end;
end;

----------------------------------------------------------------------------------------------
--Curas MP
----------------------------------------------------------------------------------------------
function AHCurasMP()
	PlayerList = GetPlayerList();
	
	for user in PlayerList.list do
		LimparTarget();
		if(user:IsMyPartyMember() == true)then
			if(user:GetMpPercent() < 97)then
				Curar(user, "mp", 97, "Radiant Recharge");
			end;
			
			if(eu:GetLevel() >= 91)then
				Curar(user, "mp", 85, "Brilliant Recharge");
			end;
			
			if(eu:GetMpPercent() < 20)then
				Curar(eu, "mp", 15, "Rebirth");
			end;
			
		end;
	end;
	if(eu:GetMpPercent() < 15)then
		Curar(eu, "mp", 10, "Rebirth");
	end;
			
end;

function ACCurasMP()
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
	AHCurasMP();
end;

function AESCurasMP()
	LimparTarget();
	AHCurasMP();
end;

function ASSCurasMP()
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
	AHCurasMP();
end;

function AeoreCurasMP()
	LimparTarget();
	
	if (eu:GetClass() == 146) then		-- AeoreHealer
		AHCurasMP();
	elseif (eu:GetClass() == 179) then	-- AeoreCardinal
		ACCurasMP();
	elseif (eu:GetClass() == 180) then	-- AeoreEvasSaint
		AESCurasMP();
	elseif (eu:GetClass() == 181) then	-- AeoreShilenSaint
		ASSCurasMP();
	end;
end;

----------------------------------------------------------------------------------------------
----AeoreCuras
----------------------------------------------------------------------------------------------
function AeoreCuras()
	PlayerList = GetPlayerList();
	
	if(eu:GetCpPercent() < 90)then
		AeoreCurasCP();
	end;
	
	if(eu:GetHpPercent() < 90)then
		AeoreCurasHP();
	end;
	
	if(eu:GetMpPercent() < 20)then
		AeoreCurasMP();
	end;
	--LimparDebuffs(eu);
	
	for user in PlayerList.list do
		if(user:IsMyPartyMember() == true)then
			if(user:GetCpPercent() < 90)then
				AeoreCurasCP();
			end;
			
			if(user:GetHpPercent() < 90)then
				AeoreCurasHP();
			end;
			
			if(user:GetMpPercent() < 97)then
				AeoreCurasMP();
			end;
			--LimparDebuffs(user);
			
		end;
	end;
	LimparTarget();
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
		if((ReusoSkills(IdSkillPeloNome("Celestial Party Protection")) == 0))then
			UseSkillRaw(ReusoSkills(IdSkillPeloNome("Disparition")), false, false); -- Disparition
			Sleep(500);
		end;
	end;
	
	if(eu:GetHpPercent() < 70) and (ReusoSkills(IdSkillPeloNome("Disparition")) == 0)then
		UseSkillRaw(ReusoSkills(IdSkillPeloNome("Giant's Favor")), false, false); -- Giant'sFavor
		Sleep(500);
	end;
	
	if(eu:GetHpPercent() < 70) and (ReusoSkills(IdSkillPeloNome("Disparition")) == 0) and (ReusoSkills(IdSkillPeloNome("Giant's Favor")) == 0)then
		UseSkillRaw(ReusoSkills(IdSkillPeloNome("Crystal Regeneration")), false, false); -- Giant'sFavor
		Sleep(500);
	end;
	
	AeoreCuras();
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
	AeoreCuras();
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
	Debuffs("Dark Devour");		--DarkDevour
	Debuffs("Dark Backfire");	--DarkBackfire
	AeoreCuras();
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
	Ress();
	AeoreBuffs();
	AeoreDefesa();
	AeoreCuras();
	LimparTarget();
		
	--AeoreAtk();
end;

-----------------------------------------------------------------------------------------------------
---função principal
-----------------------------------------------------------------------------------------------------
function Main()
	--ShowToClient("Aviso","Disparition = "..IdSkillPeloNome("Disparition"));
	--Ress();
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
