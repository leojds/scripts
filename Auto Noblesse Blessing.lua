ShowToClient("SYS","Auto Noblesse Blessing Ativado");
repeat
if
(GetMe():GotBuff(1323) == false) --Noblesse Blessing id
then
TargetMe();
UseSkill(1323);
Sleep(10000);
elseif 
(GetMe():GotBuff(1323) == true) 
then
Sleep(1000);
end;
until false;