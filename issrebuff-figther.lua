--Dancer Script need to be active on BD client. REMEMBER your BD bot need to have "accept party invitation" from bot ON otherwise the party invitation will be denied!

ArcherName = "Tishtar" ;

repeat
	Archer = GetUserByName(ArcherName);
	if (Archer ~= nil) then
		if Archer:IsMyPartyMember() then
		--------------Harmony----------------
			if (Archer:GotBuff(11524) == false) then
				Sleep(5000);
			end;
		
		--------------Melody-----------------
			if (Archer:GotBuff(11522) == false) or (Archer:GotBuff(11518) == false) or (Archer:GotBuff(11519) == false) or (Archer:GotBuff(11520) == false) or (Archer:GotBuff(11517) == false) or (Archer:GotBuff(11521) == false) then
				Sleep(10000);
			end;
		
		-------------Resistes----------------
			if (Archer:GotBuff(11565) == false) or (Archer:GotBuff(11566) == false) or (Archer:GotBuff(11567) == false) then
				Sleep(8000);
			end;
		
		------------Sonatas------------------
			--if (Archer:GotBuff(11529) == false) or (Archer:GotBuff(11530) == false) or (Archer:GotBuff(11532) == false) then
			--	Sleep(8000);
			--end;
			
		------------Dances------------------
			if (Archer:GotBuff(11610) == false) or (Archer:GotBuff(11611) == false) or (Archer:GotBuff(11612) == false) then
				Sleep(8000);
			end;
		
		------------Songs------------------
			--if (GetMe():GotBuff(11529) == false) or (GetMe():GotBuff(11530) == false) or (GetMe():GotBuff(11532) == false) then
			--	Sleep(8000);
			--end;
			
	--		Sleep(1000);
			Command('/leave');
			Sleep(4000);
		end;
	end;

Sleep(5000);
until false; 