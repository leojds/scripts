--Archer Script need to be active on Archer client.
shots = "Crystal (R-grade)"
CharName = "Zahthara"

repeat
if (GetMe():GotBuff(99) == false) then
    Sleep(500);
    Command("/useskill Rapid Shot")
    Sleep(1000);
end;
if (GetMe():GotBuff(10759) == false) then
    Sleep(500);
    Command("/useskill Sniper Stance")
    Sleep(500);
    Command("/useskill Hawk Eye")
    Sleep(1000);
end;
if (GetMe():GotBuff(1933) == false) then
    Sleep(500);
    Command("/useskill Yul Aura")
    Sleep(1000);
end;

Sleep(3000);		
until false; 