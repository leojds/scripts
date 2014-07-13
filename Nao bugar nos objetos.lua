ShowToClient("L2 TOWER", "Script - Desviar das pedras e arvores [LIGADO]")

DistanceToGoClose = 600;  -- Definir aqui a distância mínima de alvo que faria tentar chegar perto alvo.
CoordinateDeviationFromTarget = 100; -- Defina aqui o intervalo máximo que poderia ser escolhido por bot aleatoriamente ao tentar chegar perto de destino. 
MinimumMPPercentCheck = 1; -- Não chegue perto de destino se o MP é menos do que isso.
repeat
	if (IsPaused() == false) and (GetTarget() ~= nil) and (GetTarget():IsAlikeDeath() == false) and (GetMe() ~= nil)
	and (GetMe():GetMpPercent() > MinimumMPPercentCheck) and (GetDistanceVector(GetTarget():GetLocation(),GetMe():GetLocation())
	< 8000) and (GetDistanceVector(GetTarget():GetLocation(),GetMe():GetLocation()) > DistanceToGoClose) then
		loc =  GetTarget():GetLocation();
		lX = loc.X + math.random(-CoordinateDeviationFromTarget, CoordinateDeviationFromTarget);
		lY = loc.Y + math.random(-CoordinateDeviationFromTarget, CoordinateDeviationFromTarget);
		MoveToNoWait(lX, lY, loc.Z);
	end;
Sleep(1000);
until false;