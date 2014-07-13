function checkUltimateDefense(Objid)
if (Objid ~= nil) then -- this cant be really 0, just a safety check
if (Objid:GotBuff(5044)) then -- checking if our target has buff id=5044 [s_npc_ultimate_defense]
Sleep(200); -- wait cycle until UltimateDefense has worn off, then continue attack
end;
end;
end;

function getSkillByName(Cname)
skillList = GetSkills(); -- lets get a list of our skills
for skill in skillList.list do -- lets loop thru the list
if skill.name == Cname then -- if skill name matches ours we return its struct
return skill
end;
end;
return nil
end;

MyID = GetMe():GetId(); -- our objid

SkillName1 = "Elemental Destruction"; -- proper skill name must match the skill name ingame (case sensitive)
MySkill1 = getSkillByName(SkillName1); -- our skill struct gets stored here
SkillName2 = "Elemental Crash"; -- proper skill name must match the skill name ingame (case sensitive)
MySkill2 = getSkillByName(SkillName2); -- our skill struct gets stored here
SkillName3 = "Elemental Spike"; -- proper skill name must match the skill name ingame (case sensitive)
MySkill3 = getSkillByName(SkillName3); -- our skill struct gets stored here

if (MySkill1 ~= nil) then -- if we mistyped the skill or the bot cant find it the script ends here
repeat
MyTargetID = GetMe():GetTarget(); -- checking if we have a target
if (MyTargetID ~= nil) then -- if we do THEN...
MyTargetData = GetUserById(MyTargetID); -- getting our targets data
checkUltimateDefense(MyTargetData);
Sleep(100);

if ((MyTargetData ~= nil) and (MyTargetData:GetTarget() == MyID) and (MyTargetData:IsMonster()) and (MySkill1 ~= nil)) then -- checking if our target is targeting us and its a monster
UseSkillRaw(MySkill1.skillId,false,false); -- using the skill we specified
checkUltimateDefense(MyTargetData);
Sleep(100);
if ((MyTargetData ~= nil) and (MyTargetData:GetTarget() == MyID) and (MyTargetData:IsMonster()) and (MySkill2 ~= nil)) then -- checking if our target is targeting us and its a monster
UseSkillRaw(MySkill2.skillId,false,false); -- using the skill we specified
checkUltimateDefense(MyTargetData);
Sleep(100);
if ((MyTargetData ~= nil) and (MyTargetData:GetTarget() == MyID) and (MyTargetData:IsMonster()) and (MySkill3 ~= nil)) then -- checking if our target is targeting us and its a monster
UseSkillRaw(MySkill3.skillId,false,false); -- using the skill we specified
checkUltimateDefense(MyTargetData);
Sleep(100);
end;
end;
end;

end;
Sleep(100);
until false;
end;