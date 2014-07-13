---------------------------- NOTIFICATION ----------------------------------------------------
ShowToClient("SYS","Ataque do summon");

----------------------------------------------------------------------------------------------
repeat
if (GetTarget() ~= nil) then
	if (GetTarget():IsMonster() == true) and (GetTarget():IsAlikeDeath() == false)
	and (GetMe():IsAlikeDeath() == false) then
--------------------------------------Feoh-----------------------------------------------------
		UseSkillRaw(11259, false, false); -- Mark of Weakness
		Sleep(800)
		UseSkillRaw(11261, false, false); -- Mark of Plague
		Sleep(800)
		UseSkillRaw(11262, false, false); -- Mark of Trick
		Sleep(800)
		UseSkillRaw(11260, false, false); -- Mark of Void
		Sleep(800)
		UseSkillRaw(11298, false, false); -- Mark of Fire
		Sleep(800)
		UseSkillRaw(11353, false, false); -- Elemental Rage
		Sleep(800)
		UseSkillRaw(11356, false, false); -- Spectral Rage
		Sleep(800)
		--ClearTargets()
	end;
end;
Sleep(100);
until false; 