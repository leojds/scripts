ShowToClient("Aviso","Ativando o Guerreiro Tyrr...");

Eu = GetMe();


----------------------------------------------------------------------------------------------
----Apresentação
----------------------------------------------------------------------------------------------
if(Eu:GetClass() == 140) then
	ShowToClient("Aviso","Eu sou seu Tyrr Warrior.");
	Sleep(500);
elseif (Eu:GetClass() == 152) then
	ShowToClient("Aviso","Eu sou seu Tyrr Duelist.");
	Sleep(500);
elseif (Eu:GetClass() == 153) then
	ShowToClient("Aviso","Eu sou seu Tyrr Dreadnought.");
	Sleep(500);
elseif (Eu:GetClass() == 154) then
	ShowToClient("Aviso","Eu sou seu Tyrr Titan.");
	Sleep(500);
elseif (Eu:GetClass() == 155) then
	ShowToClient("Aviso","Eu sou seu Tyrr Grand Khavatari.");
	Sleep(500);
elseif (Eu:GetClass() == 156) then
	ShowToClient("Aviso","Eu sou seu Tyrr Maestro.");
	Sleep(500);
elseif (Eu:GetClass() == 157) then
	ShowToClient("Aviso","Eu sou seu Tyrr Doombringer.");
	Sleep(500);
end;

ShowToClient("Aviso","Comecando as atividades do dia... ;)");

----------------------------------------------------------------------------------------------
--FBC	- Feral Bear Cry
--FOC	- Feral Ogre Cry
--FPC	- Feral Puma Cry
--HC		- Hawk Cry
--FRC	- Feral Rabbit Cry
--CW		- Cry of the Wolf
--BST	- Bison Spirit Toten
--SS		- Spirit of the Slayer
--SH		- Spitit of the Hunter
----------------------------------------------------------------------------------------------
Toten = "HC";
Spirit = "SS";
TipoAtk = "S"; -- S-> Single; AOE-> Area;

function TBCry(tipos)
	local tipo = tipos;
	
	if(Eu:GetClass() == 155) then
		if (tipo == "FBC") then
			return 10291;    
		elseif (tipo == "FOC") then
			return 10292;    
		elseif (tipo == "FPC") then
			return 10293;  
		elseif (tipo == "HC") then
			return 10295;  
		elseif (tipo == "FRC") then
			return 10294;  
		elseif (tipo == "CW") then
			return 10294;  
		elseif (tipo == "BST") then
			return 10294;  
		end;
	else
		if((tipo ~= "BST") or (tipo == "CW")) then
			if (tipo == "FBC") then
				return 10291;    
			elseif (tipo == "FOC") then
				return 10292;    
			elseif (tipo == "FPC") then
				return 10293;  
			elseif (tipo == "HC") then
				return 10295;  
			elseif (tipo == "FRC") then
				return 10294;  
			end;
		else
			ShowToClient("Aviso","O Toten q foi solicitado pertence ao Tyrr Grand Khavatari...");
			ShowToClient("Aviso","Trocando pelo 'Hawk Cry'. Boa Sorte");
			return 10295; 
		end;
	end;
end;

function TBSpirit(tipos)
	local tipo = tipos;
	
	if (tipo == "SS") then
		return 10297;    
	elseif (tipo == "SH") then
		return 10296;    
	end;
end;

function BaixadoHPSkill(skill)
	local tipo = skill;
	
	if (Eu:GetHpPercent() < 70) then
		return tipo;    
	else
		return 0;
	end;
end;

function Distancia()
	return GetMe():GetRangeTo(GetTarget());
end;


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
				UseSkillRaw(10258, false, false); -- ArmorDestruction
				Sleep(500);
			end;
		end;
	end;
end;



----------------------------------------------------------------------------------------------
----Buffs por classe
----------------------------------------------------------------------------------------------
function TWBuffs() -- Tyrr Warrior
	if (Eu:GotBuff(1929) == false) then
		UseSkillRaw(1929, false, false); -- TyrrAura
		Sleep(500);
	end;
	if (Eu:GotBuff(1986) == false) then
		UseSkillRaw(1986, false, false); -- Dual Maximum HP
		Sleep(500);
	end;
	if (Eu:GotBuff(TBCry(Toten)) == false) then
		UseSkillRaw(ReusoSkills(TBCry(Toten)), false, false); -- Toten
		Sleep(500);
	end;
	if (Eu:GotBuff(TBSpirit(Spirit)) == false) then
		UseSkillRaw(ReusoSkills(TBSpirit(Spirit)), false, false); -- Spirit
		Sleep(500);
	end;
	if (Eu:GetLevel() >= 93) then
		if (Eu:GotBuff(10270) == false) then
			UseSkillRaw(ReusoSkills(10270), false, false); -- SecondWind
			Sleep(500);
		end;
	end;
	if (Eu:GotBuff(10276) == false) then
		UseSkillRaw(ReusoSkills(10276), false, false); -- ForceOfNature
		Sleep(500);
	end;
	if (Eu:GotBuff(1914) == false) then
		UseSkillRaw(ReusoSkills(1914), false, false); -- Savage
		Sleep(500);
	end;
	if (Eu:GotBuff(10289) == false) then
		UseSkillRaw(ReusoSkills(10289), false, false); -- Boost
		Sleep(500);
	end;
	
end;

function TDuelBuffs() -- Tyrr Duelist
	if (Eu:GotBuff(10274) == false) then
		UseSkillRaw(BaixadoHPSkill(ReusoSkills(10274)), false, false); -- Berserker
		Sleep(500);
	end;
	TWBuffs();
end;

function TDoomBuffs() -- Tyrr Doombringer
	if (Eu:GotBuff(10274) == false) then
		UseSkillRaw(BaixadoHPSkill(ReusoSkills(10274)), false, false); -- Berserker
		Sleep(500);
	end;
	if (Eu:GetLevel() < 93) then
		if (Eu:GotBuff(20006) == false) then
			UseSkillRaw(ReusoSkills(20006), false, false); -- SoulRoar
			Sleep(500);
		end;
	end;
	TWBuffs();
	
end;

function TGKhaBuffs() -- Tyrr Grand Khavatari
	if (Eu:GotBuff(10274) == false) then
		UseSkillRaw(BaixadoHPSkill(ReusoSkills(10274)), false, false); -- Berserker
		Sleep(500);
	end;
	TWBuffs();
end;

function TTitaBuffs() -- Tyrr Titan
	TWBuffs();
end;

function TMaesBuffs() -- Tyrr Maestro
	if (Eu:GotBuff(10274) == false) then
		UseSkillRaw(BaixadoHPSkill(ReusoSkills(10274)), false, false); -- Berserker
		Sleep(500);
	end;
	TWBuffs();
end;

function TDreaBuffs() -- Tyrr Dreadnought
	if (Eu:GotBuff(10274) == false) then
		UseSkillRaw(BaixadoHPSkill(ReusoSkills(10274)), false, false); -- Berserker
		Sleep(500);
	end;
	TWBuffs();
end;

function TyrrBuffs()
	if (Eu:GetClass() == 140) then	-- Tyrr Warrior
		TWBuffs();
	elseif (Eu:GetClass() == 152) then	-- -- Tyrr Duelist
		TDuelBuffs();
	elseif (Eu:GetClass() == 153) then	-- Tyrr Dreadnought
		TDreaBuffs();
	elseif (Eu:GetClass() == 154) then	-- Tyrr Titan
		TTitaBuffs();
	elseif (Eu:GetClass() == 155) then	-- Tyrr Grand Khavatari
		TGKhaBuffs();
	elseif (Eu:GetClass() == 156) then	-- Tyrr Maestro
		TMaesBuffs();
	elseif (Eu:GetClass() == 157) then	-- Tyrr Doombringer
		TDoomBuffs();
	end;
end;

----------------------------------------------------------------------------------------------
----Ataque por classe
----------------------------------------------------------------------------------------------
function Destruction()
	if(GetTarget() ~= nil) then
		if(GetTarget():GotBuff(10258) == false) then
			UseSkillRaw(ReusoSkills(10258), false, false); -- ArmorDestruction
			Sleep(500);
		end;
	end;
end;

function TWAtk()
	if(Distancia() > 200) then
		UseSkillRaw(ReusoSkills(10263), false, false); -- Hurricane Blaster
		Sleep(500);
	end;
	if(TipoAtk == "S") then
		if(Distancia() > 200) then
			UseSkillRaw(ReusoSkills(10267), false, false); -- Hurricane Rush
			Sleep(500);
		end;
		if(Distancia() > 200) then
			UseSkillRaw(ReusoSkills(10267), false, false); -- Hurricane Rush
			Sleep(500);
		end;
		Destruction();
		UseSkillRaw(ReusoSkills(10260), false, false); -- MegaStrick
		Sleep(500);
		UseSkillRaw(ReusoSkills(10262), false, false); -- PowerBomber
		Sleep(500);
		UseSkillRaw(ReusoSkills(10273), false, false); -- LightningDisarm
		Sleep(500);
		
	elseif(TipoAtk == "AOE") then
		if(Distancia() > 200) then
			UseSkillRaw(ReusoSkills(10269), false, false); -- JumpAttack
			Sleep(500);
		end;
		if(Distancia() < 150) then
			Destruction();
			UseSkillRaw(ReusoSkills(10265), false, false); -- Eruption
			Sleep(500);
			UseSkillRaw(ReusoSkills(10266), false, false); -- GiantPunch
			Sleep(500);
			UseSkillRaw(ReusoSkills(10262), false, false); -- PowerBomber
			Sleep(500);
			Combo();
			UseSkillRaw(ReusoSkills(10288), false, false); -- HurricaneStorm
			Sleep(500);
			UseSkillRaw(ReusoSkills(10260), false, false); -- MegaStrick
			Sleep(500);
			UseSkillRaw(ReusoSkills(10273), false, false); -- LightningDisarm
			Sleep(7000);
		end;
	end;
end;

function TDuelAtk()
	TWAtk();
end;

function TDreaAtk()
	TWAtk();
end;

function TTitaAtk()
	TWAtk();
end;

function TGKhaAtk()
	TWAtk();
end;

function TMaesAtk()
	TWAtk();
end;

function TDoomAtk()
	if(TipoAtk == "AOE") then
		if(Distancia() > 200) then
			UseSkillRaw(ReusoSkills(10263), false, false); -- Hurricane Blaster
			Sleep(500);
		end;
		if(Distancia() > 150) then
			UseSkillRaw(ReusoSkills(793), false, false); -- Rush Impact
			Sleep(500);
		end;
	else
		if(Distancia() > 200) then
			UseSkillRaw(ReusoSkills(10263), false, false); -- Hurricane Blaster
			Sleep(500);
		end;
	end;
	TWAtk();
end;

function TyrrAtk()
	if (Eu:GetClass() == 140) then	-- Tyrr Warrior
		TWAtk();
	elseif (Eu:GetClass() == 152) then	-- -- Tyrr Duelist
		TDuelAtk();
	elseif (Eu:GetClass() == 153) then	-- Tyrr Dreadnought
		TDreaAtk();
	elseif (Eu:GetClass() == 154) then	-- Tyrr Titan
		TTitaAtk();
	elseif (Eu:GetClass() == 155) then	-- Tyrr Grand Khavatari
		TGKhaAtk();
	elseif (Eu:GetClass() == 156) then	-- Tyrr Maestro
		TMaesAtk();
	elseif (Eu:GetClass() == 157) then	-- Tyrr Doombringer
		TDoomAtk();
	end;
end;

----------------------------------------------------------------------------------------------
----Acao
----------------------------------------------------------------------------------------------
function Acao()
	TyrrBuffs();
	Sleep(200);
	Combo();
	TyrrAtk();
	Sleep(200);
	Combo();
	Destruction();
	Command("/attack");
end;

-----------------------------------------------------------------------------------------------------
---função principal
-----------------------------------------------------------------------------------------------------
function Main()
	
	--TyrrBuffs();	--usar skills de self buff
	
-----------------------------------------------------------------------------------------------------
---Regra de ataque
-----------------------------------------------------------------------------------------------------
	if (GetTarget() ~= nil) then
		if (GetTarget():IsMonster() == true) and (Eu:IsAlikeDeath() == false) and (GetTarget():IsAlikeDeath() == false) then
			Acao();
			Sleep(100);
			Combo();
			Command("/attack");
			ClearTargets();
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
