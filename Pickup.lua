PickupAfter = true
Range = 1000
-- time which needs to pass before item (exact one laying on the ground) is added 
-- to blacklist (is ignored for BlacklistExpireTime)
TimeLimit = 10 * 10000 -- 4 sec
BlacklistExpireTime = 10*60*1000 -- 10 min
-- How often do we repeat action and check if time limit wasn't reached?
CheckTreshold = 333

-- if GetJustPickups is set to true it will only pick up items from Pickups table,
-- otherwise it will pickup all items except those in Ignores table,
-- Table Entries can be either exact names (string) or Ids (number)
------
-- so basically GetJustPickups on false with empty "Ignores" stands for
-- picking up everything
GetJustPickups = false
Ignores = {
   
}
Pickups = { 
	57, -- Adena's display Id
	19447,--	Blessed Scroll: Enchant Weapon (R-grade)
	19448,--	Blessed Scroll: Enchant Armor (R-grade)


   "Greater Herb of Life", -- full name for the herb
   "Greater Herb of Mana", -- full name for the herb
}

function IsHere(item,i)
	local nitem = GetItemManager():GetByIdx(i)
	if (item ~= nil and nitem ~= nil and
		item:GetId() == nitem:GetId() and 
		nitem:GetQuantity() > 0) then
		return true
	else
		return false
	end
end

function TabContains(tab,item)
   if item then
      local id = item:GetId()
      local name = item:GetName()
      for i=1,#tab do
         if type(tab[i]) == "number" and tab[i] == id or
            type(tab[i]) == "string" and tab[i] == name then
            return true
         end
      end
   end
   return false
end

Blacklist = { }

function BlacklistAdd( bl, value )
   local t = GetTime
   if t and value then
      local e = { }
      e.Time = t
      e.Value = value
      table.insert(bl, e)
   end
end

function BlacklistCleanUp( bl, maxDiff)
	local t = GetTime()
	for i=1,#bl do
		if not bl.Time or t - bl.Time > maxDiff then
			table.remove(bl,i)
		end
	end
end

function IsBlacklisted( bl, value )
	for i=1,#bl do
		if bl.Value == value then
			return true
		end
	end
	return false
end

function FindBestItem()
	local bestrange = 9999
	local ritem = nil
	local ridx = nil
	for i=1,GetItemManager():GetCount() do
		local item = GetItemManager():GetByIdx(i)
		if item ~= nil and not IsBlacklisted(Blacklist, item:GetId()) then
			local r = item:GetRangeTo(GetMe())
         if item:GetName() ~= nil and 
            item:GetQuantity() > 0 and
            r < Range and
            r < bestrange and 
            (GetJustPickups and TabContains(Pickups,item) or not TabContains(Ignores,item) ) then
				ritem = item
				ridx = i
				bestrange = r
			end
		end
	end
	if ( ritem ~= nil and ridx ~= nil ) then
		return ritem, ridx
	else
		return nil
	end
end

function MyPickup(item,idx)
	local itemId = item:GetId()
	local itemLoc = item:GetLocation()
	local itemName = item:GetName()
	local me = GetMe()
	
	local status = IsPaused()
	SetPause(true)
	
	local c = 0
	while IsHere(item,idx) do
		if me and item:GetRangeTo(me) > 50 then
			MoveTo(itemLoc, 40)
		else
			Command("/pickup")
			Command("/pickup")
			Command("/pickup")
			Command("/pickup")
		end
		Sleep(CheckTreshold)
		c = c + 1
		if ( c > TimeLimit/CheckTreshold ) then 
			BlacklistAdd(Blacklist,itemId)
			break
		end
	end
	
	--SetPause(status)
end

repeat
	BlacklistCleanUp(Blacklist, BlacklistExpireTime)
	local item,idx = FindBestItem()
   local tar = GetTarget()
	if (not tar or tar:GetHp() == 0 or not PickupAfter) and item ~= nil and idx ~= nil then
		MyPickup(item,idx)
	end
	
	Sleep(500)
until false