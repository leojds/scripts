ShowToClient("Aviso","Ativando o Encantador Iss...");

Eu = GetMe();


----------------------------------------------------------------------------------------------
----Apresentação
----------------------------------------------------------------------------------------------
if(Eu:GetClass() == 144) then
	ShowToClient("Aviso","Eu sou seu Iss Enchanter.");
	Sleep(500);
elseif (Eu:GetClass() == 171) then
	ShowToClient("Aviso","Eu sou seu Iss Hierophant.");
	Sleep(500);
elseif (Eu:GetClass() == 172) then
	ShowToClient("Aviso","Eu sou seu Iss Sword Muse.");
	Sleep(500);
elseif (Eu:GetClass() == 173) then
	ShowToClient("Aviso","Eu sou seu Iss Spectral Dancer.");
	Sleep(500);
elseif (Eu:GetClass() == 174) then
	ShowToClient("Aviso","Eu sou seu Iss Dominator.");
	Sleep(500);
elseif (Eu:GetClass() == 175) then
	ShowToClient("Aviso","Eu sou seu Iss Doomcryer.");
	Sleep(500);
end;

ShowToClient("Aviso","Comecando as atividades do dia... ;)");

-- With safeCode isn't supposed to stop script on possible errors, but 
-- will just silently pause working till cause of error go away
local safeCode = false

-- Distance to search for party members to buff
local SearchDistance = 1500

-- Check if L2Tower is running (not paused)
local CheckIfRunning = true

local Names = {
	Leader = "GeniusMS",
	Iss = "AhuraMazda",
	Kick = "P2",
}
-- Will it work with entering/leaving party?
-- Well it's not really just for OOP anymore, but name remained :)
-- Notes: 
--  * If you run script on character specified as "Leader",
--     then Leader will invite buffer when buffs are needed,
--  * Leader will kick player specified as "Kick" if party is full
--  * Unless you set OOPForcePartyLeave buffer will not leave party
--     if it is not full, meaning either of: 
--        - party is not full,
--        - Kick is in party,
--        - there is no Kick within SearchDistance,
local OOPMode = false
-- How long after last buffing will we leave the party?
local LeaveAfterBuffsTimeout = 3*1000 -- 4 sec
local OOPForcePartyLeave = false
-- Should it follow player specified as Leader? Will follow even if
-- Leader is not member of your party.
local OOPFollowLeader = false
-- Not really distance, for now just random point within half of 
-- this distance from leader. Will make it better in final release.
local OOPFollowDistance = 400
-- Should it assist player specified as Leader?
-- Made it because L2Tower assist is buggy.
-- Won't assist if Leader is not in same party as we are.
local OOPAssistLeader = false
-- Irrelevant for user, will throw info into chat if enabled
local debugmode = false

----------------------------------------------------------------------------------------------
----Harmony
----------------------------------------------------------------------------------------------
function Harmony(harmony)
	if(Eu:GetClass() == 144) then
		if(harmony == "knight") then
			return 11523;
		elseif (harmony == "warrior") then
			return 11524;
		elseif(harmony == "wizard") then
			return 11525;
		end;
	elseif (Eu:GetClass() == 171) then
		if(harmony == "knight") then
			return 11523;
		elseif (harmony == "warrior") then
			return 11524;
		elseif(harmony == "wizard") then
			return 11525;
		end;
	elseif (Eu:GetClass() == 172) then
		if(harmony == "knight") then
			return 11523;
		elseif (harmony == "warrior") then
			return 11524;
		elseif(harmony == "wizard") then
			return 11525;
		end;
	elseif (Eu:GetClass() == 173) then
		if(harmony == "knight") then
			return 11523;
		elseif (harmony == "warrior") then
			return 11524;
		elseif(harmony == "wizard") then
			return 11525;
		end;
	elseif (Eu:GetClass() == 174) then
		if(harmony == "knight") then
			return 11595;
		elseif (harmony == "warrior") then
			return 11596;
		elseif(harmony == "wizard") then
			return 11597;
		end;
	elseif (Eu:GetClass() == 175) then
		if(harmony == "knight") then
			return 11523;
		elseif (harmony == "warrior") then
			return 11524;
		elseif(harmony == "wizard") then
			return 11525;
		end;
	end;
end;

----------------------------------------------------------------------------------------------
----Melodia
----------------------------------------------------------------------------------------------
function Melodia(melodia)
	if(Eu:GetClass() == 144) then
		if(melodia == "lute") then
			return 11522;
		elseif (melodia == "drum") then
			return 11518;
		elseif(melodia == "pipe") then
			return 11519;
		elseif (melodia == "horn") then
			return 11517;
		elseif (melodia == "guitar") then
			return 11520;
		elseif(melodia == "harp") then
			return 11521;
		end;
	elseif (Eu:GetClass() == 171) then
		if(melodia == "lute") then
			return 11522;
		elseif (melodia == "drum") then
			return 11518;
		elseif(melodia == "pipe") then
			return 11519;
		elseif (melodia == "horn") then
			return 11517;
		elseif (melodia == "guitar") then
			return 11520;
		elseif(melodia == "harp") then
			return 11521;
		end;
	elseif (Eu:GetClass() == 172) then
		if(melodia == "lute") then
			return 11522;
		elseif (melodia == "drum") then
			return 11518;
		elseif(melodia == "pipe") then
			return 11519;
		elseif (melodia == "horn") then
			return 11517;
		elseif (melodia == "guitar") then
			return 11520;
		elseif(melodia == "harp") then
			return 11521;
		end;
	elseif (Eu:GetClass() == 173) then
		if(melodia == "lute") then
			return 11522;
		elseif (melodia == "drum") then
			return 11518;
		elseif(melodia == "pipe") then
			return 11519;
		elseif (melodia == "horn") then
			return 11517;
		elseif (melodia == "guitar") then
			return 11520;
		elseif(melodia == "harp") then
			return 11521;
		end;
	elseif (Eu:GetClass() == 174) then
		if(melodia == "lute") then
			return 11594;
		elseif (melodia == "drum") then
			return 11590;
		elseif(melodia == "pipe") then
			return 11591;
		elseif (melodia == "horn") then
			return 11589;
		elseif (melodia == "guitar") then
			return 11592;
		elseif(melodia == "harp") then
			return 11593;
		end;
	elseif (Eu:GetClass() == 175) then
		if(melodia == "lute") then
			return 11522;
		elseif (melodia == "drum") then
			return 11518;
		elseif(melodia == "pipe") then
			return 11519;
		elseif (melodia == "horn") then
			return 11517;
		elseif (melodia == "guitar") then
			return 11520;
		elseif(melodia == "harp") then
			return 11521;
		end;
	end;
end;

----------------------------------------------------------------------------------------------
----Sonats
----------------------------------------------------------------------------------------------
function Sonata(sonata)
	if(Eu:GetClass() == 144) then
		if(sonata == "prevailing") then
			return 11529;
		elseif (sonata == "daring") then
			return 11530;
		elseif(sonata == "refreshing") then
			return 11532;
		end;
	elseif (Eu:GetClass() == 171) then
		if(sonata == "prevailing") then
			return 11529;
		elseif (sonata == "daring") then
			return 11530;
		elseif(sonata == "refreshing") then
			return 11532;
		end;
	elseif (Eu:GetClass() == 172) then
		if(sonata == "prevailing") then
			return 11607;
		elseif (sonata == "daring") then
			return 11608;
		elseif(sonata == "refreshing") then
			return 11609;
		end;
	elseif (Eu:GetClass() == 173) then
		if(sonata == "prevailing") then
			return 11610;
		elseif (sonata == "daring") then
			return 11611;
		elseif(sonata == "refreshing") then
			return 11612;
		end;
	elseif (Eu:GetClass() == 174) then
		if(sonata == "prevailing") then
			return 11600;
		elseif (sonata == "daring") then
			return 11601;
		elseif(sonata == "refreshing") then
			return 11602;
		end;
	elseif (Eu:GetClass() == 175) then
		if(sonata == "prevailing") then
			return 11529;
		elseif (sonata == "daring") then
			return 11530;
		elseif(sonata == "refreshing") then
			return 11532;
		end;
	end;
end;

-- "Wizard", "Warrior" and "Knight" stand for type of Harmony to use,
local ClassesContainer = {
	Magic = {
		Buffer = {
			{ 17, "Wizard"},	-- Prophet
			{ 21, "Warrior"},	-- Swordsinger
			{ 34, "Warrior"},	-- Bladedancer
			{ 49, "Wizard" },	-- Orc Mystic
			{ 50, "Wizard" },	-- Orc Shaman
			{ 51, "Warrior" },	-- Overlord
			{ 52, "Wizard" },	-- Warcryer
			{ 98, "Wizard" },	-- Hierophant
			{ 100, "Warrior" },	-- Sword Muse
			{ 107, "Warrior" },	-- Spectral Dancer
			{ 115, "Warrior" },	-- Dominator
			{ 116, "Wizard" },	-- Doomcryer
			{ 144, "Knight"},	-- Iss Enchanter
			{ 171, "Knight" },	-- IssHierophant
			{ 172, "Wizard"},	-- IssSwordMuse
			{ 173, "Wizard"},	-- IssSpectralDancer
			{ 174, "Knight" },	-- IssDominator
			{ 175, "Knight" },	-- IssDoomcryer{ 17, "Wizard"},	-- Prophet
			{ 17, "NBlessing"},	-- Prophet
			{ 21, "NBlessing"},	-- Swordsinger
			{ 34, "NBlessing"},	-- Bladedancer
			{ 49, "NBlessing" },	-- Orc Mystic
			{ 50, "NBlessing" },	-- Orc Shaman
			{ 51, "NBlessing" },	-- Overlord
			{ 52, "NBlessing" },	-- Warcryer
			{ 98, "NBlessing" },	-- Hierophant
			{ 100, "NBlessing" },	-- Sword Muse
			{ 107, "NBlessing" },	-- Spectral Dancer
			{ 115, "NBlessing" },	-- Dominator
			{ 116, "NBlessing" },	-- Doomcryer
			{ 144, "NBlessing"},	-- Iss Enchanter
			{ 171, "NBlessing" },	-- IssHierophant
			{ 172, "NBlessing"},	-- IssSwordMuse
			{ 173, "NBlessing"},	-- IssSpectralDancer
			{ 174, "NBlessing" },	-- IssDominator
			{ 175, "NBlessing" },	-- IssDoomcryer{ 17, "Wizard"},	-- Prophet
			
		},
		Healer = {
			{ 15, "Wizard"},	-- Cleric
			{ 16, "Wizard"},	-- Bishop
			{ 29, "Wizard"},	-- Elven Oracle
			{ 30, "Wizard"},	-- Elven Elder
			{ 97, "Wizard"},	-- Cardinal
			{ 42, "Wizard" },	-- Shillien Oracle
			{ 43, "Wizard" },	-- Shillien Elder
			{ 105, "Wizard" },	-- Eva's Saint
			{ 112, "Wizard" },	-- Shillien Saint
			{ 146, "Wizard" },	-- Aeore Healer
			{ 179, "Wizard" },	-- AeoreCardinal
			{ 180, "Wizard" },	-- AeoreEvasSaint
			{ 181, "Wizard" },	-- AeoreShillienSaint	
			{ 15, "NBlessing"},	-- Cleric
			{ 16, "NBlessing"},	-- Bishop
			{ 29, "NBlessing"},	-- Elven Oracle
			{ 30, "NBlessing"},	-- Elven Elder
			{ 97, "NBlessing"},	-- Cardinal
			{ 42, "NBlessing" },	-- Shillien Oracle
			{ 43, "NBlessing" },	-- Shillien Elder
			{ 105, "NBlessing" },	-- Eva's Saint
			{ 112, "NBlessing" },	-- Shillien Saint
			{ 146, "NBlessing" },	-- Aeore Healer
			{ 179, "NBlessing" },	-- AeoreCardinal
			{ 180, "NBlessing" },	-- AeoreEvasSaint
			{ 181, "NBlessing" },	-- AeoreShillienSaint	
			
		},
		Nuker = {
			{ 10, "Wizard"},	-- Human Mystic
			{ 11, "Wizard"},	-- Human Wizard
			{ 12, "Wizard"},	-- Sorceror
			{ 13, "Wizard"},	-- Necromancer
			{ 25, "Wizard"},	-- Elven Mystic
			{ 26, "Wizard"},	-- Elven Wizard
			{ 27, "Wizard"},	-- Spellsinger
			{ 38, "Wizard" },	-- Dark Mystic
			{ 39, "Wizard" },	-- Dark Wizard
			{ 40, "Wizard" },	-- Spellhowler
			{ 94, "Wizard" },	-- Archmage
			{ 95, "Wizard" },	-- Soultaker
			{ 103, "Wizard" },	-- Mystic Muse
			{ 110, "Wizard" },	-- Storm Screamer
			{ 143, "Wizard" },	-- Feoh Wizard
			{ 166, "Wizard" },	-- FeohArchmage
			{ 167, "Wizard" },	-- FeohSoultaker
			{ 168, "Wizard" },	-- FeohMysticMuse
			{ 169, "Wizard" },	-- FeohStormScreamer
			{ 170, "Wizard" },	-- FeohSoulhound
			{ 10, "NBlessing"},	-- Human Mystic
			{ 11, "NBlessing"},	-- Human Wizard
			{ 12, "NBlessing"},	-- Sorceror
			{ 13, "NBlessing"},	-- Necromancer
			{ 25, "NBlessing"},	-- Elven Mystic
			{ 26, "NBlessing"},	-- Elven Wizard
			{ 27, "NBlessing"},	-- Spellsinger
			{ 38, "NBlessing" },	-- Dark Mystic
			{ 39, "NBlessing" },	-- Dark Wizard
			{ 40, "NBlessing" },	-- Spellhowler
			{ 94, "NBlessing" },	-- Archmage
			{ 95, "NBlessing" },	-- Soultaker
			{ 103, "NBlessing" },	-- Mystic Muse
			{ 110, "NBlessing" },	-- Storm Screamer
			{ 143, "NBlessing" },	-- Feoh Wizard
			{ 166, "NBlessing" },	-- FeohArchmage
			{ 167, "NBlessing" },	-- FeohSoultaker
			{ 168, "NBlessing" },	-- FeohMysticMuse
			{ 169, "NBlessing" },	-- FeohStormScreamer
			{ 170, "NBlessing" },	-- FeohSoulhound
			
		},
		Summoner = {
			{ 14, "Wizard"},	-- Warlock
			{ 28, "Knight"},	-- Elemental Summoner
			{ 41, "Wizard" },	-- Phantom Summoner
			{ 96, "Wizard" },	-- Arcana Lord
			{ 104, "Knight" },	-- Elemental Master
			{ 111, "Wizard" },	-- Spectral Master
				-- We try to determine Wynn Summoner's Harmony dynamically
				-- if there is no 'nil' then it will not dynamically assign
				-- and use whatever stands here instead, so you can force
				-- different buff or put it manually if dynamical doesn't work
			{ 145, "Warrior"},	-- Wynn Summoner
			{ 176, "Warrior"},	-- WynnArcanaLord
			{ 177, "Warrior"},	-- WynnElementalMaster
			{ 178, "Warrior"},	-- WynnSpectralMaster
			{ 14, "NBlessing"},	-- Warlock
			{ 28, "NBlessing"},	-- Elemental Summoner
			{ 41, "NBlessing" },	-- Phantom Summoner
			{ 96, "NBlessing" },	-- Arcana Lord
			{ 104, "NBlessing" },	-- Elemental Master
			{ 111, "NBlessing" },	-- Spectral Master
				-- We try to determine Wynn Summoner's Harmony dynamically
				-- if there is no 'nil' then it will not dynamically assign
				-- and use whatever stands here instead, so you can force
				-- different buff or put it manually if dynamical doesn't work
			{ 145, "NBlessing"},	-- Wynn Summoner
			{ 176, "NBlessing"},	-- WynnArcanaLord
			{ 177, "NBlessing"},	-- WynnElementalMaster
			{ 178, "NBlessing"},	-- WynnSpectralMaster
			
		},
		
	},
	Physical = {
		Warrior = {
			{ 0, "Warrior"},	-- Human Fighter
			{ 1, "Warrior"},	-- Warrior
			{ 2, "Warrior"},	-- Gladiator
			{ 3, "Warrior"},	-- Warlord
			{ 18, "Warrior"},	-- Elven Fighter
			{ 19, "Warrior"},	-- Elven Knight
			{ 31, "Warrior"},	-- Dark Fighter
			{ 44, "Warrior" },	-- Orc Fighter
			{ 45, "Warrior" },	-- Orc Raider
			{ 46, "Warrior" },	-- Destroyer
			{ 47, "Warrior" },	-- Monk
			{ 48, "Warrior" },	-- Tyrant
			{ 53, "Warrior" },	-- Dwarven Fighter
			{ 56, "Warrior" },	-- Artisan
			{ 57, "Warrior" },	-- Warsmith
			{ 88, "Warrior"},	-- Duelist
			{ 89, "Warrior" },	-- Dreadnought
			{ 113, "Warrior" },	-- Titan
			{ 114, "Warrior" },	-- Grand Khavatari
			{ 118, "Warrior" },	-- Maestro
			{ 123, "Warrior" },	-- Male Soldier
			{ 124, "Warrior" },	-- Female Soldier
			{ 125, "Warrior" },	-- Dragoon
			{ 126, "Warrior" },	-- Warder
			{ 127, "Warrior" },	-- Berserker
			{ 128, "Warrior" },	-- Male Soul Breaker
			{ 129, "Warrior" },	-- Female Soul Breaker
			{ 131, "Warrior" },	-- Doombringer
			{ 132, "Warrior" },	-- Male Soul Hound
			{ 133, "Warrior" },	-- Female Soul Hound
			{ 135, "Warrior" },	-- Inspector
			{ 136, "Warrior" },	-- Judicator
			{ 140, "Warrior" },	-- Tyrr Warrior
			{ 152, "Warrior" },	-- TyrrDuelist
			{ 153, "Knight" },	-- TyrrDreadnought
			{ 154, "Warrior" },	-- TyrrTitan
			{ 155, "Warrior" },	-- TyrrGrandKhavatari
			{ 156, "Warrior" },	-- TyrrMaestro
			{ 157, "Warrior" },	-- TyrrDoombringer
			{ 0, "NBlessing"},	-- Human Fighter
			{ 1, "NBlessing"},	-- Warrior
			{ 2, "NBlessing"},	-- Gladiator
			{ 3, "NBlessing"},	-- Warlord
			{ 18, "NBlessing"},	-- Elven Fighter
			{ 19, "NBlessing"},	-- Elven Knight
			{ 31, "NBlessing"},	-- Dark Fighter
			{ 44, "NBlessing" },	-- Orc Fighter
			{ 45, "NBlessing" },	-- Orc Raider
			{ 46, "NBlessing" },	-- Destroyer
			{ 47, "NBlessing" },	-- Monk
			{ 48, "NBlessing" },	-- Tyrant
			{ 53, "NBlessing" },	-- Dwarven Fighter
			{ 56, "NBlessing" },	-- Artisan
			{ 57, "NBlessing" },	-- Warsmith
			{ 88, "NBlessing"},	-- Duelist
			{ 89, "NBlessing" },	-- Dreadnought
			{ 113, "NBlessing" },	-- Titan
			{ 114, "NBlessing" },	-- Grand Khavatari
			{ 118, "NBlessing" },	-- Maestro
			{ 123, "NBlessing" },	-- Male Soldier
			{ 124, "NBlessing" },	-- Female Soldier
			{ 125, "NBlessing" },	-- Dragoon
			{ 126, "NBlessing" },	-- Warder
			{ 127, "NBlessing" },	-- Berserker
			{ 128, "NBlessing" },	-- Male Soul Breaker
			{ 129, "NBlessing" },	-- Female Soul Breaker
			{ 131, "NBlessing" },	-- Doombringer
			{ 132, "NBlessing" },	-- Male Soul Hound
			{ 133, "NBlessing" },	-- Female Soul Hound
			{ 135, "NBlessing" },	-- Inspector
			{ 136, "NBlessing" },	-- Judicator
			{ 140, "NBlessing" },	-- Tyrr Warrior
			{ 152, "NBlessing" },	-- TyrrDuelist
			{ 153, "NBlessing" },	-- TyrrDreadnought
			{ 154, "NBlessing" },	-- TyrrTitan
			{ 155, "NBlessing" },	-- TyrrGrandKhavatari
			{ 156, "NBlessing" },	-- TyrrMaestro
			{ 157, "NBlessing" },	-- TyrrDoombringer
			
			
		},
		Dagger = {
			{ 7, 	"Warrior"},		-- Rogue
			{ 8, 	"Warrior"},		-- Treasure Hunter
			{ 22, 	"Warrior"},		-- Elven Scout
			{ 23, 	"Warrior"},		-- Plainswalker
			{ 35, 	"Warrior"},		-- Assassin
			{ 36, 	"Warrior"},		-- Abyss Walker
			{ 54, 	"Warrior" },	-- Scavenger
			{ 55, 	"Warrior" },	-- Bounty Hunter
			{ 93, 	"Warrior"},		-- Adventurer
			{ 101, 	"Warrior" },	-- Wind Rider
			{ 108, 	"Warrior" },	-- Ghost Hunter
			{ 117, 	"Warrior"},		-- Fortune Seeker
			{ 141, 	"Warrior" },	-- Othell Rogue
			{ 158, 	"Warrior" },	-- OthellAdventurer
			{ 159, 	"Warrior" },	-- OthellWindRider
			{ 160, 	"Warrior" },	-- OthellGhostHunter
			{ 161, 	"Warrior" },	-- OthellFortuneSeeker
			{ 7, 	"NBlessing"},	-- Rogue
			{ 8, 	"NBlessing"},	-- Treasure Hunter
			{ 22, 	"NBlessing"},	-- Elven Scout
			{ 23, 	"NBlessing"},	-- Plainswalker
			{ 35, 	"NBlessing"},	-- Assassin
			{ 36, 	"NBlessing"},	-- Abyss Walker
			{ 54, 	"NBlessing" },	-- Scavenger
			{ 55, 	"NBlessing" },	-- Bounty Hunter
			{ 93, 	"NBlessing"},	-- Adventurer
			{ 101, 	"NBlessing" },	-- Wind Rider
			{ 108, 	"NBlessing" },	-- Ghost Hunter
			{ 117, 	"NBlessing"},	-- Fortune Seeker
			{ 141, 	"NBlessing" },	-- Othell Rogue
			{ 158, 	"NBlessing" },	-- OthellAdventurer
			{ 159, 	"NBlessing" },	-- OthellWindRider
			{ 160, 	"NBlessing" },	-- OthellGhostHunter
			{ 161, 	"NBlessing" },	-- OthellFortuneSeeker
			
		},
		Archer = {
			{ 9, 	"Warrior"},		-- Hawkeye
			{ 24, 	"Warrior"},		-- Silver Ranger
			{ 37, 	"Warrior"},		-- Phantom Ranger
			{ 92, 	"Warrior" },	-- Sagittarius
			{ 102, 	"Warrior" },	-- Moonlight Sentinel
			{ 109, 	"Warrior" },	-- Ghost Sentinel
			{ 130, 	"Warrior" },	-- Arbalester
			{ 134, 	"Warrior" },	-- Trickster
			{ 142, 	"Warrior" },	-- Yul Archer
			{ 162, 	"Warrior" },	-- YulSagittarius
			{ 163, 	"Warrior" },	-- YulMoonlightSentinel
			{ 164, 	"Warrior" },	-- YulGhostSentinel
			{ 165, 	"Warrior" },	-- YulTrickster
			{ 9, 	"NBlessing"},	-- Hawkeye
			{ 24, 	"NBlessing"},	-- Silver Ranger
			{ 37, 	"NBlessing"},	-- Phantom Ranger
			{ 92, 	"NBlessing" },	-- Sagittarius
			{ 102, 	"NBlessing" },	-- Moonlight Sentinel
			{ 109, 	"NBlessing" },	-- Ghost Sentinel
			{ 130, 	"NBlessing" },	-- Arbalester
			{ 134, 	"NBlessing" },	-- Trickster
			{ 142, 	"NBlessing" },	-- Yul Archer
			{ 162, 	"NBlessing" },	-- YulSagittarius
			{ 163, 	"NBlessing" },	-- YulMoonlightSentinel
			{ 164, 	"NBlessing" },	-- YulGhostSentinel
			{ 165, 	"NBlessing" },	-- YulTrickster
			
		},
		
	},
	Tank = {
		Knight = {
			{ 4, 	"Warrior"},		-- Human Knight
			{ 5, 	"Knight"},		-- Paladin
			{ 6, 	"Knight"},		-- Dark Avenger
			{ 20, 	"Knight"},		-- Temple Knight
			{ 32, 	"Warrior"},		-- Palus Knight
			{ 33, 	"Knight"},		-- Shillien Knight
			{ 90, 	"Knight" },		-- Phoenix Knight
			{ 91, 	"Knight" },		-- Hell Knight
			{ 99, 	"Knight" },		-- Eva's Templar
			{ 106, 	"Knight" },		-- Shillien Templar
			{ 139, 	"Knight" },		-- Sigel Knight
			{ 148, 	"Knight" },		-- SigelPhoenixKnight
			{ 149, 	"Knight" },		-- SigelHellKnight
			{ 150, 	"Knight" },		-- SigelEvasTemplar
			{ 151, 	"Knight" },		-- SigelShillienTemplar
			{ 4, 	"NBlessing"},	-- Human Knight
			{ 5, 	"NBlessing"},	-- Paladin
			{ 6, 	"NBlessing"},	-- Dark Avenger
			{ 20, 	"NBlessing"},	-- Temple Knight
			{ 32, 	"NBlessing"},	-- Palus Knight
			{ 33, 	"NBlessing"},	-- Shillien Knight
			{ 90, 	"NBlessing" },	-- Phoenix Knight
			{ 91, 	"NBlessing" },	-- Hell Knight
			{ 99, 	"NBlessing" },	-- Eva's Templar
			{ 106, 	"NBlessing" },	-- Shillien Templar
			{ 139, 	"NBlessing" },	-- Sigel Knight
			{ 148, 	"NBlessing" },	-- SigelPhoenixKnight
			{ 149, 	"NBlessing" },	-- SigelHellKnight
			{ 150, 	"NBlessing" },	-- SigelEvasTemplar
			{ 151, 	"NBlessing" },	-- SigelShillienTemplar
			
		},
	},
}

--[[
	-- If there are multiple values with same name it means it will search for the most nested one (the one furthest to right)
	-- Buff template:
local BuffsContainer = {
	-- static minimum time left when we will rebuff, searchest for the most nested one
	MinTimeLeft = 1000,
	-- dynamic minimum time left when we will rebuff, 
	-- Length * multiplier determines when we will rebuff, 
	-- so 30 min with 0.1 multiplier makes it rebuffing at 3 min left on buff
	LengthToMinTimeLeftMultiplier = 1/5, 
	SomeGroupedUpBuffs = {
		SomeBuffName = {
			MinTimeLeft = nil,
			LengthToMinTimeLeftMultiplier = nil,
			-- maximum length of buff in milliseconds
			Length = 300000, -- this makes 300 sec = 5 min
			-- Skill Ids which can apply this buff
			Skills = {
				12345,
				67890,
			},
			-- Ids of skills that apply same buff effect (so we don't try cast buff if we cannot override),
			-- Must contain also all Skills Ids,
			-- Basically it checks if target holds any of Buffs, if it doesn't it tries to use any of Skills to apply them
			Buffs = {
				12345,
				67890,
				54321,
			},
		},
	},
]]

local BuffsContainer = {
	MinTimeLeft = 1000,
	LengthToMinTimeLeftMultiplier = 1/5,
	Melody = {
		MinTimeLeft = nil,
		LengthToMinTimeLeftMultiplier = nil,
		Length = 1800000, -- 30 min
		Horn = {
			MinTimeLeft = nil,
			LengthToMinTimeLeftMultiplier = nil,
			Length = nil,
			Skills = { Melodia("horn") },
			NeedTarget = false,
			Buffs = {
				9198,	-- Elixir: Horn Melody
				9218,	-- Elixir of Blessing - Horn Melody
				9227,	-- Mentor's Poem of Horn
				9273,	-- Horn Melody - PC Cafe
				9280,	-- Horn Melody - Heavenly Cocktail
				9331,	-- Horn Melody - Refined Cocktail
				11517,	-- Horn Melody
				11589,	-- Horn Frenzy
				14738,	-- Olympiad - Horn Melody
				14779,	-- Master's Blessing - Horn Melody
				14791,	-- Master's Blessing - Horn Melody (Range)
			},
		},
		Drum = {
			MinTimeLeft = nil,
			LengthToMinTimeLeftMultiplier = nil,
			Length = nil,
			Skills = { Melodia("drum") },
			NeedTarget = false,
			Buffs = {
				9199,	-- Elixir: Drum Melody
				9219,	-- Elixir of Blessing - Drum Melody
				9228,	-- Mentor's Poem of Drum
				9274,	-- Drum Melody - PC Cafe
				9281,	-- Drum Melody - Heavenly Cocktail
				9332,	-- Drum Melody - Refined Cocktail
				11518,	-- Drum Melody
				11590,	-- Drum Frenzy
				14739,	-- Olympiad - Drum Melody
				14780,	-- Master's Blessing - Drum Melody
				14792,	-- Master's Blessing - Drum Melody (Range)
				22213,	-- Mysterious Scroll - Drum Melody
			},
		},
		PipeOrgan = {
			MinTimeLeft = nil,
			LengthToMinTimeLeftMultiplier = nil,
			Length = nil,
			Skills = { Melodia("pipe") },
			NeedTarget = false,
			Buffs = {
				9201,	-- Elixir: Pipe Organ Melody
				9221,	-- Elixir of Blessing - Pipe Organ Melody
				9230,	-- Mentor's Poem of Organ
				9276,	-- Pipe Organ Melody - PC Cafe
				9283,	-- Pipe Organ Melody - Heavenly Cocktail
				9334,	-- Pipe Organ Melody - Refined Cocktail
				11519,	-- Pipe Organ Melody
				11591,	-- Pipe Organ Frenzy
				14607,	-- Cry of Fate - Pipe Organ Melody
				14693,	-- Cry of Fate - Pipe Organ Melody
				14740,	-- Olympiad - Pipe Organ Melody
				14781,	-- Master's Blessing - Pipe Organ Melody
				14793,	-- Master's Blessing - Pipe Organ Melody (Range)
				23364,	-- Tree's Blessing - Pipe Organ Melody
				23365,	-- Tree's Blessing - Pipe Organ Melody
				23366,	-- Tree's Blessing - Pipe Organ Melody
				23367,	-- Tree's Blessing - Pipe Organ Melody
				23368,	-- Tree's Blessing - Pipe Organ Melody
			},
		},
		Guitar = {
			MinTimeLeft = nil,
			LengthToMinTimeLeftMultiplier = nil,
			Length = nil,
			Skills = { Melodia("guitar") },
			NeedTarget = false,
			Buffs = {
				9202,	-- Elixir: Guitar Melody
				9222,	-- Elixir of Blessing - Guitar Melody
				9231,	-- Mentor's Poem of Guitar
				9277,	-- Guitar Melody - PC Cafe
				9284,	-- Guitar Melody - Heavenly Cocktail
				9335,	-- Guitar Melody - Refined Cocktail
				11520,	-- Guitar Melody
				11592,	-- Guitar Frenzy
				14741,	-- Olympiad - Guitar Melody
				14782,	-- Master's Blessing - Guitar Melody
				14794,	-- Master's Blessing - Guitar Melody (Range)
				23369,	-- Tree's Blessing - Guitar Melody
				23370,	-- Tree's Blessing - Guitar Melody
				23371,	-- Tree's Blessing - Guitar Melody
				23372,	-- Tree's Blessing - Guitar Melody
				23373,	-- Tree's Blessing - Guitar Melody
			},
		},
		Harp = {
			MinTimeLeft = nil,
			LengthToMinTimeLeftMultiplier = nil,
			Length = nil,
			Skills = { Melodia("harp") },
			NeedTarget = false,
			Buffs = {
				9203,	-- Elixir: Harp Melody
				9223,	-- Elixir of Blessing - Harp Melody
				9232,	-- Mentor's Poem of Harp
				9278,	-- Harp Melody - PC Cafe
				9285,	-- Harp Melody - Heavenly Cocktail
				9336,	-- Harp Melody - Refined Cocktail
				11521,	-- Harp Melody
				11593,	-- Harp Frenzy
				14742,	-- Olympiad - Harp Melody
				14783,	-- Master's Blessing - Harp Melody
				14795,	-- Master's Blessing - Harp Melody (Range)
				23374,	-- Tree's Blessing - Harp Melody
				23375,	-- Tree's Blessing - Harp Melody
				23376,	-- Tree's Blessing - Harp Melody
				23377,	-- Tree's Blessing - Harp Melody
				23378,	-- Tree's Blessing - Harp Melody
			},
		},
		Lute = {
			MinTimeLeft = nil,
			LengthToMinTimeLeftMultiplier = nil,
			Length = nil,
			Skills = { Melodia("lute") },
			NeedTarget = false,
			Buffs = {
				9200,	-- Elixir: Lute Melody
				9220,	-- Elixir of Blessing - Lute Melody
				9229,	-- Mentor's Poem of Lute
				9275,	-- Lute Melody - PC Cafe
				9282,	-- Lute Melody - Heavenly Cocktail
				9333,	-- Lute Melody - Refined Cocktail
				11522,	-- Lute Melody
				11594,	-- Lute Fenzy
				14743,	-- Olympiad - Lute Melody
				14784,	-- Master's Blessing - Lute Melody
				14796,	-- Master's Blessing - Lute Melody (Range)
				23359,	-- Tree's Blessing - Lute Melody
				23360,	-- Tree's Blessing - Lute Melody
				23361,	-- Tree's Blessing - Lute Melody
				23362,	-- Tree's Blessing - Lute Melody
				23363,	-- Tree's Blessing - Lute Melody
			},
		},
	},
	Sonata = {
		MinTimeLeft = nil,
		LengthToMinTimeLeftMultiplier = nil,
		Length = 350000, -- 5 min
		Prevailing = {
			MinTimeLeft = nil,
			LengthToMinTimeLeftMultiplier = nil,
			Length = nil,
			Skills = { Sonata("prevailing") },
			NeedTarget = false,
			Buffs = {
				11529,	-- Prevailing Sonata
				11607,	-- Prevailing Song
				11610,	-- Prevailing Dance
				11600,	-- Frenzy Prevailing
				14993,	-- Master's Blessing - Prevailing Sonata
				14996,	-- Master's Blessing - Prevailing Sonata (range)
			},
		},
		Daring = {
			MinTimeLeft = nil,
			LengthToMinTimeLeftMultiplier = nil,
			Length = nil,
			Skills = { Sonata("daring") },
			NeedTarget = false,
			Buffs = {
				11530,	-- Daring Sonata
				11608,	-- Daring Song
				11611,	-- Daring Dance
				11601,	-- Frenzy Daring
				14994,	-- Master's Blessing - Daring Sonata
				14997,	-- Master's Blessing - Daring Sonata (range)
			},
		},
		Refreshing = {
			MinTimeLeft = nil,
			LengthToMinTimeLeftMultiplier = nil,
			Length = nil,
			Skills = { Sonata("refreshing") },
			NeedTarget = false,
			Buffs = {
				11532,	-- Daring Sonata
				11609,	-- Daring Song
				11612,	-- Daring Dance
				11602,	-- Frenzy Daring
				14995,	-- Master's Blessing - Refreshing Sonata
				14998,	-- Master's Blessing - Refreshing Sonata (range
			},
		},
	},
	Protection = {
		MinTimeLeft = nil,
		LengthToMinTimeLeftMultiplier = nil,
		Length = 1800000, -- 30 min
		Elemental = {
			MinTimeLeft = nil,
			LengthToMinTimeLeftMultiplier = nil,
			Skills = { 11565 },
			NeedTarget = false,
			Buffs = {
				1352,	-- Elemental Protection
				11565,	-- Elemental Protection
				11790,	-- Superior Elemental Protection
				23247,	-- Master's Blessing - Elemental Protection
				23295,	-- Master's Blessing - Elemental Protection
			},
		},
		Divine = {
			MinTimeLeft = nil,
			LengthToMinTimeLeftMultiplier = nil,
			Skills = { 11566, 803 },
			NeedTarget = false,
			Buffs = {
				11566,	-- Divine Protection
				1353,	-- Divine Protection
				803,	-- Healer Ability - Divine Protection
			},
		},
		Mental = {
			MinTimeLeft = nil,
			LengthToMinTimeLeftMultiplier = nil,
			Skills = { 11567 },
			NeedTarget = false,
			Buffs = {
				11567,	-- Mental Protection
			},
		},
	},
	Harmony = {
		MinTimeLeft = nil,
		Length = 1800000, -- 30 min
		Knight = {
			MinTimeLeft = nil,
			LengthToMinTimeLeftMultiplier = nil,
			Length = nil,
			Skills = { Harmony("knight") },
			NeedTarget = true,
			Buffs = {
				9376,	-- Mentor Guardian's Harmony
				11523,	-- Knight's Harmony
				14744,	-- Olympiad - Guardian's Harmony
				14785,	-- Master's Blessing - Guardian's Harmony
				14797,	-- Master's Blessing - Guardian's Harmony (Range)
			},
		},
		Warrior = {
			MinTimeLeft = nil,
			LengthToMinTimeLeftMultiplier = nil,
			Length = nil,
			Skills = { Harmony("warrior") },
			NeedTarget = true,
			Buffs = {
				9378,	-- Mentor's Berserker's Harmony
				11524,	-- Warrior's Harmony
				14745,	-- Olympiad - Berserker's Harmony
				14786,	-- Master's Blessing - Berserker's Harmony
				14798,	-- Master's Blessing - Berserker's Harmony (Range)
			},
		},
		Wizard = {
			MinTimeLeft = nil,
			LengthToMinTimeLeftMultiplier = nil,
			Length = nil,
			Skills = { Harmony("wizard") },
			NeedTarget = true,   
			Buffs = {
				9377,	-- Mentor's Magician's Harmony
				11525,	-- Wizard's Harmony
				14746,	-- Olympiad - Magician's Harmony
				14787,	-- Master's Blessing - Magician's Harmony
				14799,	-- Master's Blessing - Magician's Harmony (Range)
			},
		},
		NBlessing = {
			MinTimeLeft = nil,
			LengthToMinTimeLeftMultiplier = nil,
			Length = nil,
			Skills = { 1323 },
			NeedTarget = true,   
			Buffs = {
				1323,	-- Nobless Blessing
			},
		},
	},
	
}

function GetRebuffTimeLeft( buffsC, skillId)
	if buffsC and tar and skillId or not safeCode then
		if type(buffsC) == "table" then
			for Type,vT in pairs(buffsC) do
				if type(vT) == "table" then
					for lBuff,vlB in pairs(vT) do
						if type(vlB) == "table" then
							for i=1,#vlB.Skills do
								if vlB.Skills[i] == skillId then
									local l = vlB.Length or vT.Length or 0
									local m = vlB.LengthToMinTimeLeftMultiplier or vT.LengthToMinTimeLeftMultiplier or buffsC.LengthToMinTimeLeftMultiplier or 0
									local mtl = vlB.MinTimeLeft or vT.MinTimeLeft or buffsC.MinTimeLeft or 0
									return math.max(l * m, mtl)
								end
							end
						end
					end
				end
			end
		end
	end
	return nil
end

function GetHarmonyType( classesC, tar )
	if tar and classesC or not safeCode then
		if type(classesC) == "table" then
			for Type,vT in pairs(classesC) do
				if type(vT) == "table" then
					for SubType,vS in pairs(vT) do
						if type(vS) == "table" then
							for i=1,#vS do
								c = tar:GetClass()
								if c == vS[i][1] then
									harmony = vS[i][2]
									if c == 145 and not harmony then	-- Wynn Summoner
										harmony = DetermineWynnHarmony( tar:GetName() )
										return harmony
									end
									return harmony
								end
							end
						end
					end
				end
			end
		end
	end
	return nil
end

function PetBelongsToParty( pet )
	if pet then
		party = GetPartyList()
		for p in party.list do
			if p:GetName() == pet:GetMasterName() then
				return true
			end
		end
	end
	return false
end

function DetermineWynnHarmony( name )
	local bearCount = 0 	-- 14929	Armored Bear
	local cougarCount = 0 	-- 14930	Saber Tooth Cougar
	local soulReaperCount = 0	-- 14931	Soul Reaper
	if name then
		pets = GetPetList()
		for p in pets.list do
			if PetBelongsToParty(p) then
				id = p:GetNpcId()
				if id == 14929 then
					bearCount = bearCount + 1
				elseif id == 14930 then
					cougarCount = cougarCount + 1
				elseif id == 14931 then
					soulReaperCount = soulReaperCount + 1
				end
			end
		end
	end
	if bearCount > 0 then
		return "Knight"
	elseif cougarCount > soulReaperCount then
		return "Warrior"
	elseif cougarCount > soulReaperCount then
		return "Wizard"
	end
end

function BuffInfo( buffsC, tar, skillId )
	if buffsC and tar and skillId or not safeCode then
		if type(buffsC) == "table" then
			for Type,vT in pairs(buffsC) do
				if type(vT) == "table" then
					for lBuff,vlB in pairs(vT) do
						if type(vlB) == "table" then
							for i=1,#vlB.Skills do
								if vlB.Skills[i] == skillId then
									if type(vlB.Buffs) == "table" then
										timeLeft = 86400000
										for j=1,#vlB.Buffs do
											buff = tar:GetBuff(vlB.Buffs[j])
											if buff then
												timeLeft = buff.endTime - GetTime()
												return true, vlB.NeedTarget, vlB.Buffs[j], timeLeft
											end
										end
										return false, vlB.NeedTarget, nil, nil
									end
								end
							end
						end
					end
				end
			end
		end
	end
	return false
end

function CastBuff( skills, buffsC, tar, id, dist, justCheck )
	if skills and buffsC and tar and tar:GetHp() ~= 0 and id and dist or not safeCode then
		local hasBuff, needTarget, _, timeLeft = BuffInfo( buffsC, tar, id )
		local rtl = GetRebuffTimeLeft( buffsC, id)
		if not hasBuff or rtl and timeLeft and timeLeft <= rtl and timeLeft > 0 then
			if debugmode then ShowToClient(tar:GetName(), ""..tostring(hasBuff).." "..rtl.." "..tostring(timeLeft)) end
			if justCheck then
				return true
			end
			local skill = skills:FindById(id)
			if skill and skill:CanBeUsed() then
				for d=dist-50,50,-100 do
					if not tar or tar:GetHpPercent() == 0 then
						return false
					end
					if tar:GetDistance() > dist or not tar:CanSeeMe() then
						loc = tar:GetLocation()
						MoveTo(loc.X, loc.Y, loc.Z, d)
						tar = GetUserById(tar:GetId())
					end
				end
				if needTarget then
					Target(tar)
					for i=1,5 do
						myTar = GetTarget()
						if myTar and myTar:GetId() == tar:GetId() then
							if debugmode then ShowToClient(tar:GetName(), ""..id) end
							UseSkillRaw(id,false,false)
							return true
						end
						Sleep(100)
					end
				else
					if debugmode then ShowToClient(tar:GetName(), ""..id) end
					UseSkillRaw(id,false,false)
					return true
				end
			end
		end
	end
	return false
end

function BuffHarmony( skills, buffsC, classesC, tar, justCheck )
	if skills and buffsC and classesC and tar and harmonies or not safeCode then
		local ht = GetHarmonyType(classesC, tar)
		if ht or not safeCode then
			local harmony = buffsC.Harmony[ht]
			for i=1,#harmony.Skills do
				if CastBuff( skills, buffsC, tar, harmony.Skills[i], 900, justCheck ) then
					return true
				end
			end
		end
	end
	return false
end

local LastBuffTime = GetTime()
function BuffTarget( skills, buffsC, classesC, tar, justCheck )
	if skills and buffsC and classesC and tar or not safeCode then
		if type(buffsC) == "table" then
			for BT,vBT in pairs(buffsC) do
				if BT == "Harmony" then
					if BuffHarmony( skills, buffsC, classesC, tar, justCheck ) then
						LastBuffTime = GetTime()
						return true
					end
				else
					if type(vBT) == "table" then
						for kB,vB in pairs(vBT) do
							if type(vB) == "table" and type(vB.Skills) == "table" then
								for i=1,#vB.Skills do
									if CastBuff( skills, buffsC, tar, vB.Skills[i], 900, justCheck ) then
										LastBuffTime = GetTime()
										return true
									end
								end
							end
						end
					end
				end
			end
		end
	end
	return false
end

function BuffParty( skills, buffsC, classesC, distance, justCheck, names )
	if skills and buffsC and classesC and distance and (names or not justCheck) or not safeCode then
		local me = GetMe()
		if BuffTarget( skills, buffsC, classesC, me, justCheck ) then
			return true
		end
		local party = GetPartyList()
		for p in party.list do
			if not (names and not (justCheck and p:GetName() == names.Kick)) and p:GetDistance() < distance and 
				BuffTarget( skills, buffsC, classesC, p, justCheck ) then
				return true
			end
		end
	end
	return false
end

function PartyNeedBuffs( skills, buffsC, classesC, distance, justCheck, names )
	return BuffParty( skills, buffsC, classesC, distance, true, names )
end


----------------------------------------------------------------------
-------------------------- OOP Mode PART -----------------------------
----------------------------------------------------------------------
function GetPartyCount()
	party = GetPartyList()
	local i = 0
	for p in party.list do
		i = i+1
	end
	return i
end

function RandomizeLocation( loc, xSpread, ySpread, zSpread )
	if loc then
		math.randomseed(GetTime())
		math.random()
		local x = loc.X
		local y = loc.Y
		local z = loc.Z
		x = x - ( xSpread / 2 )
		y = y - ( ySpread / 2 )
		z = z - ( zSpread / 2 )
		
		x = x + math.random(xSpread)
		y = y + math.random(ySpread)
		z = z + math.random(zSpread)
		
		return x, y, z
	end
end

function BuffPartyAndLeave( skills, buffsC, classesC, distance, names )
	if PartyNeedBuffs( skills, buffsC, classesC, distance ) then
		BuffParty( skills, buffsC, classesC, distance )
	elseif GetPartyMaster() then
		local shouldLeave = false
		local pc = 0
		if not OOPForcePartyLeave then
			local kick = GetUserByName(names.Kick)
			shouldLeave = kick and kick:GetDistance() < distance
			local party = GetPartyList()
			for p in party.list do
				pc = pc + 1
				if names.Kick == p:GetName() then
					shouldLeave = nil
					break
				end
			end
		end
		if (OOPForcePartyLeave or shouldLeave or pc == 4) and GetTime() - LastBuffTime > LeaveAfterBuffsTimeout then
			LeaveParty()
		end
	end
end

function Kick( names )
	local me = GetMe()
	if me and names and names.Leader == me:GetName() and names.Kick or not safeCode then
		if GetPartyCount() == 3 then
			Command("/dismiss " .. names.Kick)
			return true
		end
	end
	return false
end

function Invite( names )
	if me and names and names.Leader == me:GetName() and names.Iss or not safeCode then
	tar = GetPlayerList():GetByName(names.Iss)
		if tar and not tar:IsMyPartyMember() then
			if Kick(names) then
				Sleep(1500)
			end
			if GetPartyCount() == 3 then
				return false
			end
			Command("/invite ".. names.Iss)
			return true
		end
	end
	return false
end

function Reinvite( names )
	if me and names and names.Leader == me:GetName() and names.Kick or not safeCode then
		tar = GetPlayerList():GetByName(names.Kick)
		if tar and not tar:IsMyPartyMember() then
			Command("/invite ".. names.Kick)
		end
	end
end
----------------------------------------------------------------------
----------------------- End of OOP Mode PART -------------------------
----------------------------------------------------------------------
function GetTargetById( id )
	local users = GetUsersList()
end


function Main()
	local me = GetMe()
	if me then
		if OOPMode and me:GetName() == Names.Leader then
			if PartyNeedBuffs(GetSkills(), BuffsContainer, ClassesContainer, SearchDistance) then
				Invite(Names)
			else
				Reinvite(Names)
			end
		elseif me:GetName() == Names.Iss or not OOPMode then		    
			--if me:GetClass() ~= 173 then
			--	ShowToClient("", "You are not Iss!")
			--	return false
			--end
			local leader = GetPlayerList():GetByName(Names.Leader)
			if leader and OOPMode then
				-- Assisting
				local pm = GetPartyMaster()
				local lid = leader:GetId()
				local lt = GetUserById(leader:GetTarget())
				local chk = OOPAssistLeader and lt and not lt:IsFriend()
				if (leader:IsMyPartyMemberMaster() or leader:IsMyPartyMember()) and chk then
					--Target(lt)
				end
				-- Following
				if not pm or OOPFollowLeader and not chk then
					--Target(lid)
					local tar = GetTarget()
					if OOPFollowLeader and tar and tar:GetId() == lid and tar:GetDistance() > OOPFollowDistance then
						local x,y,z = RandomizeLocation(tar:GetLocation(),OOPFollowDistance,OOPFollowDistance,0)
						MoveTo(x,y,z, OOPFollowDistance)
					end
				end
				return BuffPartyAndLeave(GetSkills(), BuffsContainer, ClassesContainer, SearchDistance, Names)
			else
				return BuffParty(GetSkills(), BuffsContainer, ClassesContainer, SearchDistance)								
			end			
		end
	end
	return false	
end

repeat

	if not CheckIfRunning or not IsPaused() then
		Main();
		ClearTargets();
	end
	Sleep(900)	
until false
