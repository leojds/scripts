ShowToClient("AUTO BUFF","NORMAL MODE ON");


-- CONFIG --
PPName = "AhuraMazda"; 			-- Your ISS name, he will accept party from DD (IMPORTANT: MyISS is not equal myISS, so write like u writed nick in game)
DDName = "Ghosh"; 			-- Your DD name (IMPORTANT: MyDD is not equal MyDD, so write like u writed nick in game)
HarmonyID = 11524; 			-- 11524 Warrior's Harmony, 11525 Wizard's Harmony, 11523 Knight's Harmony (copy harmony id, if u will set in party buffs warriors harmony, then there set that too, wizard in party buffs, than set here too, if u dont do it correct ur ISS will stay in party)
WhoToInv = nil; 




function checkbuff()
	if(GetMe():GotBuff(11524) == false)		-- 11524 Warrior's Harmony, 11525 Wizard's Harmony, 11523 Knight's Harmony, 11595	Knight's Frenzied Harmony, 11596	Warrior's Frenzied Harmony, 11597	Wizard's Frenzied Harmony
	or (GetMe():GotBuff(11517) == false)	-- Horn Melody
	or (GetMe():GotBuff(11518) == false)	-- Drum Melody
	or (GetMe():GotBuff(11519) == false)	-- Pipe Organ Melody
	or (GetMe():GotBuff(11520) == false)	-- Guitar Melody
	or (GetMe():GotBuff(11521) == false)	-- Harp Melody
	or (GetMe():GotBuff(11522) == false)	-- Lute Melody
	or (GetMe():GotBuff(11565) == false)	-- Elemental Resistance
	or (GetMe():GotBuff(11566) == false)	-- Holy Attack Resistance
	or (GetMe():GotBuff(11567) == false)	-- Mental Attack Resistance
	--or (GetMe():GotBuff(11529) == false)	-- Prevailing Sonata
	--or (GetMe():GotBuff(11530) == false)	-- Daring Sonata
	--or (GetMe():GotBuff(11532) == false)	-- Refreshing Sonata
	or (GetMe():GotBuff(11610) == false)	-- Prevailing Dance
	or (GetMe():GotBuff(11611) == false)	-- Daring Dance
	or (GetMe():GotBuff(11612) == false)	-- Refreshing Dance
	--or (GetMe():GotBuff(11607) == false)	-- Prevailing Song
	--or (GetMe():GotBuff(11608) == false)	-- Daring Song
	--or (GetMe():GotBuff(11609) == false)	-- Refreshing Song
	--or (GetMe():GotBuff(11600) == false)	-- Frenzied Prevailing Sonata
	--or (GetMe():GotBuff(11601) == false)	-- Frenzied Daring Sonata
	--or (GetMe():GotBuff(11602) == false)	-- Frenzied Refreshing Sonata
	then
		return true;
	end;
return false;

	
end;
 
	
	
	
repeat 
	if(GetUserByName(PPName) == nil)then
		repeat
			Sleep(1000);
		until (GetUserByName(PPName) ~= nil);
			WhoToInv = GetUserByName(PPName);

	elseif(GetUserByName(PPName) ~= nil)then
		WhoToInv = GetUserByName(PPName);
	end;

		if (checkbuff()== true) then
			Sleep(100);
				while (WhoToInv:IsMyPartyMember()== false) do
					Command("/invite "..PPName); 
					Sleep(450);
		end;



	repeat 
		Sleep(100);
 
	until ((GetMe():GotBuff(HarmonyID)) 
	and (GetMe():GotBuff(11517)) 
	and (GetMe():GotBuff(11518)) 
	and (GetMe():GotBuff(11519)) 
	and (GetMe():GotBuff(11520)) 
	and (GetMe():GotBuff(11521)) 
	and (GetMe():GotBuff(11522)) 
	and (GetMe():GotBuff(11565)) 
	and (GetMe():GotBuff(11566)) 
	and (GetMe():GotBuff(11567)) 
	and (GetMe():GotBuff(11529)) 
	and (GetMe():GotBuff(11530)) 
	and (GetMe():GotBuff(11532)) ) 
	and (WhoToInv:IsMyPartyMember() == true);
 
		Sleep(1500);
		Command("/dismiss "..PPName); 
		Sleep(400);
	end;
	
	Sleep(1000);
until false;