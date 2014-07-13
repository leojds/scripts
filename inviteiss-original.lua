--Archer Script need to be active on Archer client.
DancerName= "Daemoni"
repeat
if (GetMe():GotBuff(11524) == false) or (GetMe():GotBuff(11518) == false) or (GetMe():GotBuff(11532) == false) then
    Command('/invite ' .. DancerName);
    Sleep(30000);
end;
Sleep(1000);
until false; 