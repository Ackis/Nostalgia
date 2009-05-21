--[[

************************************************************************

Nostalgia.lua

File date: @file-date-iso@ 
Project version: @project-version@

Author: Ackis

************************************************************************

--]]


Nostalgia = LibStub("AceAddon-3.0"):NewAddon("Nostalgia", "AceConsole-3.0", "AceEvent-3.0")

local MODNAME	= "Nostalgia"

local addon		= LibStub("AceAddon-3.0"):GetAddon(Nostalgia)

local PlaySoundFile = PlaySoundFile

local cpath = "Sound\\Creature\\"

if (not LibStub:GetLibrary("AceLocale-3.0", true)) then
	addon:Print(format("%s is missing.  Addon cannot run.","AceLocale-3.0"))
	--@debug@
	addon:Print("You are using a svn version of ARL.  As per WowAce/Curseforge standard, svn externals are not setup.  You will have to install Ace3, Babble-Faction-3.0, Babble-Zone-3.0, Babble-Boss-3.0, LibAboutPanel, LibSharedMedia-3.0, LibBetterBlizzoptions and Astrolabe in order for the addon to function correctly.")
	--@end-debug@
	Nostalgia = nil
	return
end

local L			= LibStub("AceLocale-3.0"):GetLocale(MODNAME)

-- Data structure containing all the sound files for boss encounters
-- Bossname[Soundtype][Soundfile]
-- Soundtype list:
--		1 - Random shouts throughout the instance
--		2 - Random shouts during the fight
--		3 - Shouts on a players death
--		4 - Pre-fight speech
--		5 - Phase chage speech
--		6 - Post-fight speech

local soundlist = {
	["YoggSaron"] = {
		[1] = {
			[1] = "UR_FemaleYogg_Prefight01.wav",
			[2] = "UR_FemaleYogg_Prefight02.wav",
		},
		[2] = {
		},
		[3] = {
		},
		[4] = {
			[1] = "UR_FemaleYogg_Prefight01.wav",
			[2] = "UR_FemaleYogg_Prefight02.wav",
			[3] = "UR_FemaleYogg_Aggro01.wav",
			[4] = "UR_FemaleYogg_Help01.wav",
			[5] = "UR_FemaleYogg_Help02.wav",
			[6] = "UR_FemaleYogg_Insanity01.wav",
			[7] = "UR_FemaleYogg_Prefight01.wav",
			[8] = "UR_FemaleYogg_Prefight02.wav",
			[9] = "UR_FemaleYogg_Slay01.wav",
			[10] = "UR_FemaleYogg_Slay02.wav",
			[11] = "UR_FemaleYogg_Special01.wav",
			[12] = "UR_FemaleYogg_Special02.wav",
			[13] = "UR_YoggSaron_PhaseTwo01.wav",
			[14] = "UR_YoggSaron_PhaseThree01.wav",
			[15] = "UR_YoggSaron_Death01.wav",
			[16] = "UR_YoggSaron_Insanity01.wav",
			[17] = "UR_YoggSaron_Insanity02.wav",
			[18] = "UR_YoggSaron_Slay01.wav",
			[19] = "UR_YoggSaron_Slay02.wav",
			[20] = "UR_YoggSaron_Tentacle01.wav",
			[21] = "UR_YoggSaron_YSVisOne01.wav",
			[22] = "UR_YoggSaron_YSVisOne02.wav",
			[23] = "UR_YoggSaron_YSVisOne03.wav",
			[24] = "UR_YoggSaron_YSVisThree01.wav",
			[25] = "UR_YoggSaron_YSVisThree02.wav",
			[26] = "UR_YoggSaron_YSVisTwo03.wav",
		},
		[5] = {
		},
		[6] = {
		},
	},
}

--[[

	Initialization functions

]]--

-- Description: 

function addon:OnInitialize()

	-- Set default options, which are to include everything in the scan
	local defaults = {
		profile = {
			}
		}

	addon.db = LibStub("AceDB-3.0"):New("ARLDB2",defaults)

	if (not addon.db) then
		self:Print("Error: Database not loaded correctly.  Please exit out of WoW and delete the ARL database file (AckisRecipeList.lua) found in: \\World of Warcraft\\WTF\\Account\\<Account Name>>\\SavedVariables\\")
		return
	end

	-- Register slash commands
	self:RegisterChatCommand("nostalgia", "ChatCommand")

end

-- Description:

function addon:OnEnable()


end

-- Description:

function addon:OnDisable()

end

--[[

	Event handling functions

]]--

-- Description: 

function addon:ChatCommand(input)

end

--[[

	Functionality

]]--

-- Description: Plays the specified boss, and their specific sounds
--/script Nostalgia:PlayBoss("YoggSaron",1)
function addon:PlayBoss(bossname, bosstype)

	-- No boss in the database
	if (not soundlist[bossname]) then
		self:Print("Boss not found.")
	-- Boss in the database but we didn't specify a type
	elseif (not bosstype) then

	-- Boss in the database and we only want to play a specific type
	else
		-- Scan all the sounds
		for i in pairs(soundlist[bossname][bosstype]) do
			local soundpath = cpath .. bossname .. "\\" .. i
			PlaySoundFile(soundpath)
		end
	end

end
