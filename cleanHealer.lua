ShowToClient("PURGE","AERO PURGE ON");
 
cleanseskillid = 11763; -- put here the cleanse skill Id atm its Radiant Purge
DebuffList = {11259,11260,11261,11262,11777,11029,11273,11296,11276,11047,11050,11055,11052,0539,10516,14639,14638,11048,10011,10012,10258,10269,10267,10769,10780,10801,11539}; -- put here the Debuff Skill Ids
 
function NeedCleanse(Tehuser) -- for long debuff list better this way so we wont ask GotBuff from l2 tower many times.
	local MyBuffs = {} ;
	for x=1,50 do
		local value = nil;
		value = Tehuser:GetBuffByIdx(x);
		if value ~= nil then
			MyBuffs[#MyBuffs+1] = value.skillId;
		end;
	end;
	for x=1,#DebuffList do
		for t=1,#MyBuffs do
			if (MyBuffs ~= nil) and (MyBuffs[t] == DebuffList[x]) then
				return true;
			end;
		end;
	end;
	return false;	
end;
 
 
repeat
me = GetMe();
if (me ~= nil) then
	if NeedCleanse(me) then
		if not me:IsAlikeDeath() then
			ClearTarget();
			TargetRaw(me:GetId());
			Sleep(500);
			UseSkillRaw(cleanseskillid,false,false);
			Sleep(500);
			ClearTarget();
			CancelTarget(false);
			Sleep(500);
		end;
		elseif not NeedCleanse(me) then
			myptlist = GetPartyList();
			for PMember in myptlist.list do
				if NeedCleanse(PMember) then
					if not PMember:IsAlikeDeath() and (PMember:GetDistance() < 1000) then
						if (me:GetTarget() ~= PMember:GetId()) then
							ClearTargets();
							Sleep(500);
							TargetRaw(PMember:GetId());
							Sleep(500);
						else
							UseSkillRaw(cleanseskillid,false,false);
							Sleep(500);
							ClearTargets();
							CancelTarget(false);
							Sleep(500);
						end;
					break;
				end;
			end;
		end;
	end;
end;
Sleep(500);
until false;