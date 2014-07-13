--Dancer Script need to be active on BD client. REMEMBER your BD bot need to have "accept party invitation" from bot ON otherwise the party invitation will be denied!

ArcherName = "Nerthus" ;

--ShowToClient("Seguindo",ArcherName);
			
repeat
Archer = GetUserByName(ArcherName);
if (Archer ~= nil) then
    if Archer:IsMyPartyMember() then
	ShowToClient("Seguindo e bufando",ArcherName);
	--------------Harmony----------------
	--------------Knight-----------------
	--	if (Archer:GotBuff(11595) == false) then
	--	ShowToClient("Knight","");
	--		Sleep(5000);
	--	end;
	--------------Warrior-----------------
		if (Archer:GotBuff(11596) == false) then
			ShowToClient("Warrior","");
			Sleep(5000);
		end;
	--------------Wizard-----------------
	--	if (Archer:GotBuff(11597) == false) then
	--	ShowToClient("Wizard","");
	--		Sleep(5000);
	--	end;
	
	--------------Melody-----------------
		if (Archer:GotBuff(11589) == false) or (Archer:GotBuff(11590) == false) or (Archer:GotBuff(11591) == false) or (Archer:GotBuff(11592) == false) or (Archer:GotBuff(11593) == false) or (Archer:GotBuff(11594) == false) then
			ShowToClient("Melody","");
			Sleep(10000);
		end;
	
	-------------Resistes----------------
		if (Archer:GotBuff(11565) == false) or (Archer:GotBuff(11566) == false) or (Archer:GotBuff(11567) == false) then
			ShowToClient("Resistes","");
			Sleep(8000);
		end;
	
	------------Sonatas------------------
		if (Archer:GotBuff(11600) == false) or (Archer:GotBuff(11601) == false) or (Archer:GotBuff(11602) == false) then
			ShowToClient("Sonatas","");
			Sleep(8000);
		end;
		
--		Sleep(1000);
		Command('/leave');
		Sleep(4000);
    end;
end;

Sleep(1000);
until false; 