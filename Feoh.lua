---------------------------- NOTIFICATION ----------------------------------------------------
ShowToClient("SYS","Acest script a fost creat de Demonking");
----------------------------------------------------------------------------------------------
repeat
if (GetTarget() ~= nil) then
	if (GetTarget():IsMonster() == true) and (GetTarget():IsAlikeDeath() == false)
	and (GetMe():IsAlikeDeath() == false) then
--------------------------------------Feoh-----------------------------------------------------
		UseSkillRaw(11047, false, false); -- Devil's Curse
		Sleep(10)
		UseSkillRaw(11029, false, false); -- Death Breath
		Sleep(10)
		UseSkillRaw(11017, false, false); -- Elemental Crash
		Sleep(10)
		UseSkillRaw(11011, false, false); -- Elemental Spike
		Sleep(10)
		UseSkillRaw(11023, false, false); -- Elemental Destruction
		Sleep(10)
		UseSkillRaw(11050, false, false); -- Hell Binding
		Sleep(10)
		UseSkillRaw(11064, false, false); -- Ultimate Body To Mind
		Sleep(10)
		UseSkillRaw(11068, false, false); -- Double Casting
		Sleep(10)
		UseSkillRaw(11046, false, false); -- Wizard Spirit
		Sleep(10)
		UseSkillRaw(1914, false, false); -- Savage
		Sleep(10)
		--ClearTargets()
	end;
end;
Sleep(100);
until false; 