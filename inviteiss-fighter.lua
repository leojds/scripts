--Archer Script need to be active on Archer client.
--DancerName= "ChamHau"
DancerName= "AhuraMazda"
repeat

	--------------Harmony----------------
	--------------Knight-----------------
	--	if (GetMe():GotBuff(11523) == false) then
	--		Command('/invite ' .. DancerName);
	--		Sleep(8000);
	--	end;
	--------------Warrior-----------------
		if (GetMe():GotBuff(11524) == false) then
			Command('/invite ' .. DancerName);
			Sleep(8000);
		end;
	--------------Wizard-----------------
	--	if (GetMe():GotBuff(11525) == false) then
	--		Command('/invite ' .. DancerName);
	--		Sleep(8000);
	--	end;
	
	
	--------------Melody-----------------
		if (GetMe():GotBuff(9227) == false) then
			if (GetMe():GotBuff(11522) == false) or (GetMe():GotBuff(11518) == false) or (GetMe():GotBuff(11519) == false) or (GetMe():GotBuff(11520) == false) or (GetMe():GotBuff(11517) == false) or (GetMe():GotBuff(11521) == false) then
				Command('/invite ' .. DancerName);
				Sleep(8000);
			end;
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
		--if (GetMe():GotBuff(11529) == false) or (GetMe():GotBuff(11530) == false) or (GetMe():GotBuff(11532) == false) then
		--	Command('/invite ' .. DancerName);
		--	Sleep(6000);
		--end;
		
	------------Dances------------------
		if (GetMe():GotBuff(11610) == false) or (GetMe():GotBuff(11611) == false) or (GetMe():GotBuff(11612) == false) then
			Command('/invite ' .. DancerName);
			Sleep(6000);
		end;
		
	------------Songs------------------
		--if (GetMe():GotBuff(11529) == false) or (GetMe():GotBuff(11530) == false) or (GetMe():GotBuff(11532) == false) then
		--	Command('/invite ' .. DancerName);
		--	Sleep(6000);
		--end;
		
Sleep(7000);
until false; 