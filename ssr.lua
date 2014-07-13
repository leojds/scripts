function getItemByName(name)
	invList = GetInventory();
	for item in invList.list do
		if item.Name == name then
			return item.ItemNum
		end
	end
return 1;
end
 
while (getItemByName('Soulstone') > 79) and (getItemByName('Crystal (R-grade)') > 1)  do
CraftItem(22433); --steel recipe id / recipe mast exist!!
Sleep(400);    --anty-kick
end;