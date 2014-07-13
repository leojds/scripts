repeat
	--------------Elixir----------------
		if (GetMe():GotBuff(9198) == false) then
			ShowToClient("AUTO BUFF","Usando Elixir of Blessig");
			UseItem(32316);
			Sleep(3000);
		end;
		
Sleep(7000);
until false; 