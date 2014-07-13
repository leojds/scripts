--Dancer Script need to be active on BD client. REMEMBER your BD bot need to have "accept party invitation" from bot ON otherwise the party invitation will be denied!

ArcherName = "Nospheratus" ;

repeat
Archer = GetUserByName(ArcherName);
if (Archer ~= nil) then
    if Archer:IsMyPartyMember() then
        if (Archer:GotBuff(11524) == false) or (Archer:GotBuff(11518) == false) then
            Sleep(500);
            Command("/useskill Warrior's Harmony")
            Sleep(1000);
            UseSkillRaw(11565, false, false);
            Sleep(1000);
            UseSkillRaw(11566, false, false);
            Sleep(1000);
            Command("/useskill Guitar Melody")
            Sleep(1000);
            Command("/useskill Drum Melody")
            Sleep(1000);
            Command("/useskill Pipe Organ Melody")
            Sleep(1000);
            Command("/useskill Horn Melody")
            Sleep(1000);
            Command("/useskill Harp Melody")
            Sleep(1000);
            Command("/useskill Lute Melody")
            Sleep(1000);        
            Command("/useskill Elemental Protection")
            Sleep(1000);        
            Command("/useskill Divine Protectionn")
            Sleep(1000);        
            Command("/useskill Mental Protection")
            Sleep(1000);        
            Command("/useskill Noblesse Blessing")
            Sleep(500);
        end;
        if (Archer:GotBuff(11529) == false) then
            Command("/useskill Prevailing Sonata")
            Sleep(1000);
            Command("/useskill Daring Sonata")
            Sleep(1000);
            Command("/useskill Refreshing Sonata")
            Sleep(4000); 
        end;
			Command('/leave');
            Sleep(5000);
    end;
end;
Sleep(1000);
until false; 