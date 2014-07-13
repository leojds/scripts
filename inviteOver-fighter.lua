--Archer Script need to be active on Archer client.
--DancerName= "ChamHau"
DancerName= "ChamHau"
repeat
--if (GetMe():GotBuff(11524) == false) or (GetMe():GotBuff(11532) == false) then
--if (GetMe():GotBuff(11524) == false) or (GetMe():GotBuff(11522) == false) or (GetMe():GotBuff(11520) == false) or (GetMe():GotBuff(11532) == false) then
--    Command('/invite ' .. DancerName);
--    Sleep(30000);
--end;

	--------------Harmony----------------
	--------------Knight-----------------
	--	if (GetMe():GotBuff(11595) == false) then
	--		Command('/invite ' .. DancerName);
	--		Sleep(8000);
	--	end;
	--------------Warrior-----------------
		if (GetMe():GotBuff(11596) == false) then
			Command('/invite ' .. DancerName);
			Sleep(8000);
		end;
	--------------Wizard-----------------
	--	if (GetMe():GotBuff(11597) == false) then
	--		Command('/invite ' .. DancerName);
	--		Sleep(8000);
	--	end;
	
	--------------Melody-----------------
		if (GetMe():GotBuff(11589) == false) or (GetMe():GotBuff(11590) == false) or (GetMe():GotBuff(11591) == false) or (GetMe():GotBuff(11592) == false) or (GetMe():GotBuff(11593) == false) or (GetMe():GotBuff(11594) == false) then
				Command('/invite ' .. DancerName);
				Sleep(8000);
		end;
--		if (GetMe():GotBuff(11522) == false) or (GetMe():GotBuff(11518) == false) or (GetMe():GotBuff(11519) == false) or (GetMe():GotBuff(11520) == false) or (GetMe():GotBuff(11517) == false) or (GetMe():GotBuff(11521) == false) then
--			Command('/invite ' .. DancerName);
--			Sleep(8000);
--		end;
	
	-------------Resistes----------------
		if (GetMe():GotBuff(11565) == false) or (GetMe():GotBuff(11566) == false) or (GetMe():GotBuff(11567) == false) then
			Command('/invite ' .. DancerName);
			Sleep(6000);
		end;
	
	------------Sonatas------------------
		if (GetMe():GotBuff(11600) == false) or (GetMe():GotBuff(11601) == false) or (GetMe():GotBuff(11602) == false) then
			Sleep(1000);
			if (GetMe():GotBuff(11600) == false) or (GetMe():GotBuff(11601) == false) or (GetMe():GotBuff(11602) == false) then
				Command('/invite ' .. DancerName);
				Sleep(6000);
			end;
		end;
		
Sleep(5000);
until false; 