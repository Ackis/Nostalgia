--[[

************************************************************************

Nostalgia.lua

File date: @file-date-iso@ 
File revision: @file-revision@ 
Project revision: @project-revision@
Project version: @project-version@

Author: Ackis

************************************************************************

License:
	Please see LICENSE.txt

Documentation:
	Please see Docs\Documentation.txt for comprehensive documentation.

************************************************************************

--]]


Nostalgia = LibStub("AceAddon-3.0"):NewAddon("Nostalgia", "AceConsole-3.0", "AceEvent-3.0")

local MODNAME	= "Nostalgia"

local addon		= LibStub("AceAddon-3.0"):GetAddon(Nostalgia)

if (not LibStub:GetLibrary("AceLocale-3.0", true)) then
	addon:Print(format("%s is missing.  Addon cannot run.","AceLocale-3.0"))
	--@debug@
	addon:Print("You are using a svn version of ARL.  As per WowAce/Curseforge standard, svn externals are not setup.  You will have to install Ace3, Babble-Faction-3.0, Babble-Zone-3.0, Babble-Boss-3.0, LibAboutPanel, LibSharedMedia-3.0, LibBetterBlizzoptions and Astrolabe in order for the addon to function correctly.")
	--@end-debug@
	Nostalgia = nil
	return
end

local L			= LibStub("AceLocale-3.0"):GetLocale(MODNAME)

--[[

	Initialization functions

]]--

-- Description: 
-- Expected result:
-- Input: None
-- Output: None

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
-- Expected result:
-- Input: None
-- Output: None

function addon:OnEnable()


end

-- Description:
-- Expected result:
-- Input: None
-- Output: None

function addon:OnDisable()

end

--[[

	Event handling functions

]]--

-- Description: 
-- Expected result: 
-- Input: None
-- Output: None

function addon:ChatCommand(input)

end
