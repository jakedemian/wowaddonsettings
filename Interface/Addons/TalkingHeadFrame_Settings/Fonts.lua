--[=[ 

	Author: Klynk

--]=]

local AddOn_Name, AddOn_Data = ...;

AddOn_Data.LSM = LibStub("LibSharedMedia-3.0");

AddOn_Data.Fonts = AddOn_Data.LSM.MediaTable.font;


AddOn_Data.FontFlags = {
	["None"] = "", 
	["Outline"] = "OUTLINE",
	["Thick Outline"] = "THICKOUTLINE",
};