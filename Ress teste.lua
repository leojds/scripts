ResSkillId = 11784; -- Angel's Resurrection
ResSkill = GetSkills():FindById(ResSkillId);
-----------------------------------------------------
ResSkillId = 11784; -- Blessed Resurrection
repeat
PlayerList = GetPlayerList(); 
for user in PlayerList.list do 
      if(user:IsAlikeDeath() == true)and
        (GetMe():GetRangeTo(user) < 900)then
    Target(user);
    Sleep(300);
    UseSkillRaw(11784, false, false); -- Angel's Resurrection
 
  end;
end;
until false;