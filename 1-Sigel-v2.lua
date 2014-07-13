---------------------------- NOTIFICATION ----------------------------------------------------
ShowToClient("Aviso","Ativando o Cavaleiro Sigel...");

Eu = GetMe();
Alvo = GetTarget();

----------------------------------------------------------------------------------------------
----Apresentação
----------------------------------------------------------------------------------------------
if(Eu:GetClass() == 139) then
	ShowToClient("Aviso","Eu sou seu Sigel Knightr.");
	Sleep(500);
elseif (Eu:GetClass() == 148) then
	ShowToClient("Aviso","Eu sou seu Sigel Phoenix Knight.");
	Sleep(500);
elseif (Eu:GetClass() == 149) then
	ShowToClient("Aviso","Eu sou seu Sigel Hell Knight.");
	Sleep(500);
elseif (Eu:GetClass() == 150) then
	ShowToClient("Aviso","Eu sou seu Sigel Evas Templar.");
	Sleep(500);
elseif (Eu:GetClass() == 151) then
	ShowToClient("Aviso","Eu sou seu Sigel Shillien Templar.");
	Sleep(500);
end;

ShowToClient("Aviso","Comecando as atividades do dia... ;)");

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
				UseSkillRaw(10008, false, false); -- ShieldCharge
				Sleep(500);
			end;
		end;
	end;
end;

----------------------------------------------------------------------------------------------
--Buffs proprios
----------------------------------------------------------------------------------------------
function SKBuffs()
	
end;

function SPKBuffs()
	
end;

function SHKBuffs()
	
end;

function SETBuffs()
	
end;

function SSTBuffs()
	
end;

function SigelBuffs()
	if (eu:GetClass() == 139) then		-- SigelKight
		
	elseif (eu:GetClass() == 148) then	-- SigelPhenixKnight
		
	elseif (eu:GetClass() == 149) then	-- SigelHellKnight
		
	elseif (eu:GetClass() == 150) then	-- SigelEvasTemplar
		
	elseif (eu:GetClass() == 151) then	-- SigelShilenTemplar
		
	end;
end;

----------------------------------------------------------------------------------------------
--Defesas
----------------------------------------------------------------------------------------------
function SHDefesa()
	
end;

function SPKDefesa()
	
end;

function SHKDefesa()
	
end;

function SETDefesa()
	
end;

function SSTDefesa()
	
end;

function SigelDefesa()
	if (eu:GetClass() == 139) then		-- SigelKight
		
	elseif (eu:GetClass() == 148) then	-- SigelPhenixKnight
		
	elseif (eu:GetClass() == 149) then	-- SigelHellKnight
		
	elseif (eu:GetClass() == 150) then	-- SigelEvasTemplar
		
	elseif (eu:GetClass() == 151) then	-- SigelShilenTemplar
		
	end;
end;

----------------------------------------------------------------------------------------------
----Ataque
----------------------------------------------------------------------------------------------
function SKAtk()
	
end;

function SPKAtk()
	
end;

function SHKAtk()
	
end;

function SETAtk()
	
end;

function SSTAtk()
	
end;

function SigelAtk()
	Combo();
	
	if (eu:GetClass() == 139) then		-- SigelKight
		
	elseif (eu:GetClass() == 148) then	-- SigelPhenixKnight
		
	elseif (eu:GetClass() == 149) then	-- SigelHellKnight
		
	elseif (eu:GetClass() == 150) then	-- SigelEvasTemplar
		
	elseif (eu:GetClass() == 151) then	-- SigelShilenTemplar
		
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
	
	--TyrrBuffs();	--usar skills de self buff
	
-----------------------------------------------------------------------------------------------------
---Regra de ataque
-----------------------------------------------------------------------------------------------------
	if (GetTarget() ~= nil) then
		if (GetTarget():IsMonster() == true) and (Eu:IsAlikeDeath() == false) then
			Combo();
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
