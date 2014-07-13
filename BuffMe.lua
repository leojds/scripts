--Archer Script need to be active on Archer client.
shots = "Crystal (R-grade)"
CharName = "Nerthus"

repeat
if (GetMe():GotBuff(11288) == false) then
    Sleep(500);
    Command("/useskill Ultimate Servitor Share")
    Sleep(500);
    Command("/useskill Servitor Death Whisper")
    Sleep(500);
    Command("/useskill Greater Servitor Might")
    Sleep(1000);
end;
if (GetMe():GotBuff(11270) == false) then
    Sleep(500);
    Command("/useskill Ultimate Transfer Pain")
    Sleep(500);
    Command("/useskill Servitor Death Whisper")
    Sleep(500);
    Command("/useskill Greater Servitor Might")
    Sleep(1000);
end;
if (GetMe():GotBuff(1937) == false) then
    Sleep(500);
    Command("/useskill Wynn Aura")
    Sleep(1000);
end;
if (GetMe():GotBuff(1986) == false) then
    Sleep(500);
    Command("/useskill Dual Maximum HP")
    Sleep(1000);
end;
Sleep(1000);

function GetItemAmountByName(name)
	local invList = GetInventory();
	for item in invList.list do
		if (item.Name == name) then
			--ShowToClient("AUTO CRAFT","Verificando se possui CR");
			ShotsDisId = item.displayId;
			return item.ItemNum;
		end;
	end;
	return 0;
end; 

if (GetItemAmountByName(shots) > 0) then
	if (GetSkills():FindById(11316) ~= nil) then
		--ShowToClient("AUTO CRAFT","Fazendo Beast Soulshots");
		Command("/useskill Summon Soulshots")
        --UseSkill(11316);
		Sleep(5000);
	end;
end;
Sleep(3000);		
until false; 