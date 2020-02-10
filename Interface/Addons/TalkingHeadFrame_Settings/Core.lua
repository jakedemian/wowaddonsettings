--[=[ 

	Author: Klynk

--]=]

local AddOn_Name, AddOn_Data = ...;

-- Event handler table.
local OnEvent = {};

-- TalkingHeadFrame hook variables.
local AddOn_Loaded, Hooked = false, false;

-- Frames.
local SettingsFrame, TalkingHeadDragFrame, TalkingHeadDragAnchorFrame;

-- Font function table, to reduce amount of anon function creations.
-- Currently reduces the RAM usage of the dropdown menu by ~250 times, depending on list size.
local FontFunctions = { Title = { Font = {}, Outline = {} }, Text = { Font = {}, Outline = {} } };

-- Used to determine font dummy frame visibility state.
local FontSettingOpen = false;

-- Sorts the table alphabetically.
-- Author: Michal Kottman
-- Source: http://stackoverflow.com/questions/15706270/sort-a-table-in-lua
local function SPairs(t, order)
    -- collect the keys
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end

    -- if order function given, sort by it by passing the table and keys a, b,
    -- otherwise just sort the keys 
    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end

    -- return the iterator function
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end

-- Checks if the specified font exists.
local function FontExists(font, dopcall)

	if(true) then return true; end -- Temporary fix.

	if(not dopcall) then return pcall(FontExists, font, true); end
	
	TalkingHeadDragAnchorFrame.TestFont:SetFont(AddOn_Data.Fonts[AddOn_Data.LSM.DefaultMedia.font], 1, "OUTLINE");
	TalkingHeadDragAnchorFrame.TestFont:SetFont(font, 1, "OUTLINE");
	TalkingHeadDragAnchorFrame.TestFont:SetText("test");
	TalkingHeadDragAnchorFrame.TestFont:SetText();
	if(not font or (TalkingHeadDragAnchorFrame.TestFont:GetFont() or ""):lower() ~= (font or ""):lower()) then
		_ = nil + nil; -- force error to make life simpler.
	end
	
end

-- Hides/shows font dummy frame.
local function UpdateDummyFrameVisibility()
	if(Hooked and AddOn_Loaded) then
		if(TalkingHeadFrame:IsVisible()) then
			TalkingHeadDragFrame.TextDummyFrame:Hide();
		else
			if(FontSettingOpen) then
				TalkingHeadDragFrame.TextDummyFrame:Show();
			else
				TalkingHeadDragFrame.TextDummyFrame:Hide();
			end
		end
	else
		if(FontSettingOpen) then
			TalkingHeadDragFrame.TextDummyFrame:Show();
		else
			TalkingHeadDragFrame.TextDummyFrame:Hide();
		end
	end
end

-- Applies the font settings.
local function THFUpdateFont()
	TalkingHeadDragFrame.TextDummyFrame.Ttitle:SetFont(AddOn_Data.Fonts[THF_DB.TitleFont], THF_DB.TitleSize, AddOn_Data.FontFlags[THF_DB.TitleFlag]);
	TalkingHeadDragFrame.TextDummyFrame.Text:SetFont(AddOn_Data.Fonts[THF_DB.TextFont], THF_DB.TextSize, AddOn_Data.FontFlags[THF_DB.TextFlag]);
	
	if(Hooked and AddOn_Loaded) then
		TalkingHeadFrame.TextFrame.Text:SetFont(AddOn_Data.Fonts[THF_DB.TextFont], THF_DB.TextSize, AddOn_Data.FontFlags[THF_DB.TextFlag]);
		TalkingHeadFrame.NameFrame.Name:SetFont(AddOn_Data.Fonts[THF_DB.TitleFont], THF_DB.TitleSize, AddOn_Data.FontFlags[THF_DB.TitleFlag]);
	end
end

-- Updates the scale of TalkingHeadFrame.
local function THFUpdateScale()
	if(Hooked and AddOn_Loaded) then
		TalkingHeadFrame:SetScale(THF_DB.Scale);
	end
end

-- Updates the click through setting of TalkingHeadFrame.
local function THFUpdateClickThrough()
	if(Hooked and AddOn_Loaded) then
		if(TalkingHeadDragFrame:IsVisible()) then
			if(TalkingHeadFrame:IsMouseEnabled()) then TalkingHeadFrame:EnableMouse(false); end
		else
			if(TalkingHeadFrame:IsMouseEnabled() ~= (not THF_DB.ClickThrough)) then
				TalkingHeadFrame:EnableMouse(not THF_DB.ClickThrough);
			end
		end
	end
end

-- Applies the enabled setting to TalkingHeadFrame.
local function THFUpdateVisibility()
	if(Hooked and AddOn_Loaded) then
		if(TalkingHeadFrame:IsVisible() and THF_DB.Disabled) then
			TalkingHeadFrame.MainFrame.CloseButton:GetScript("OnClick")();
		end
	end
end

-- Updates the position of TalkingHeadFrame.
local function THFUpdatePosition()
	if(Hooked and AddOn_Loaded) then
		local Point, Anchor, RelativePoint, PosX, PosY = TalkingHeadFrame:GetPoint();
		if(TalkingHeadDragFrame:IsVisible()) then
			if(TalkingHeadFrame:GetNumPoints() ~= 1 or Point ~= "CENTER" or Anchor ~= TalkingHeadDragFrame or RelativePoint ~= "CENTER" or PosX ~= 0 or PosY ~= 0) then
				TalkingHeadFrame:ClearAllPoints();
				TalkingHeadFrame:SetPoint("CENTER", TalkingHeadDragFrame, "CENTER", 0, 0);
			end
		else
			if(TalkingHeadFrame:GetNumPoints() ~= 1 or Point ~= "CENTER" or Anchor ~= TalkingHeadDragAnchorFrame or RelativePoint ~= "CENTER" or PosX ~= 0 or PosY ~= 0) then
				TalkingHeadFrame:ClearAllPoints();
				TalkingHeadFrame:SetPoint("CENTER", TalkingHeadDragAnchorFrame, "CENTER", 0, 0);
			end
		end
	end
end

-- Applies the strata setting to TalkingHeadFrame.
local function THFUpdateStrata()
	if(Hooked and AddOn_Loaded) then
		if(THF_DB.LowerStrata and not TalkingHeadDragFrame:IsVisible()) then
			if(TalkingHeadFrame:GetFrameStrata() ~= "BACKGROUND") then
				TalkingHeadFrame:SetFrameStrata("BACKGROUND");
			end
		else
			if(TalkingHeadFrame:GetFrameStrata() ~= "HIGH") then
				TalkingHeadFrame:SetFrameStrata("HIGH");
			end
		end
	end
end

-- Applies all of the settings to TalkingHeadFrame.
local function THFOnShow()
	THFUpdateScale();
	THFUpdatePosition();
	THFUpdateClickThrough();
	THFUpdateFont();
	THFUpdateStrata();
	THFUpdateVisibility();
	UpdateDummyFrameVisibility();
end

-- Hooks the OnShow script for TalkingHeadFrame.
local function HookTHF()
	if not Hooked and TalkingHeadFrame then
		TalkingHeadFrame:HookScript("OnShow", THFOnShow);
		TalkingHeadFrame:HookScript("OnHide", UpdateDummyFrameVisibility);
		hooksecurefunc(TalkingHeadFrame, "SetPoint", THFUpdatePosition);
		hooksecurefunc(TalkingHeadFrame, "SetParent", THFUpdatePosition);
		hooksecurefunc(TalkingHeadFrame, "EnableMouse", THFUpdateClickThrough);
		hooksecurefunc(TalkingHeadFrame, "SetFrameStrata", THFUpdateStrata);
		Hooked = true;
		THFOnShow();
	end
end

-- Fires when the talking head appears.
OnEvent["TALKINGHEAD_REQUESTED"] = function(self, ...)
	HookTHF();
end

-- Fires when the addon variables have been loaded.
OnEvent["ADDON_LOADED"] = function(self, ...)
	if(not AddOn_Loaded and AddOn_Name == ...) then
		THF_DB = THF_DB or {};
		
		-- Load or use default values
		THF_DB.X = THF_DB.X or 0;
		THF_DB.Y = THF_DB.Y or 0;
		THF_DB.Scale = THF_DB.Scale or 1;
		THF_DB.Point = THF_DB.Point or "CENTER";
		THF_DB.RelativePoint = THF_DB.RelativePoint or "CENTER";
		THF_DB.ClickThrough = THF_DB.ClickThrough or false;
		THF_DB.Disabled = THF_DB.Disabled or false;
		THF_DB.LowerStrata = THF_DB.LowerStrata or false;
		THF_DB.TextFont = THF_DB.TextFont or AddOn_Data.LSM.DefaultMedia.font;
		THF_DB.TextSize = THF_DB.TextSize or 16;
		THF_DB.TextFlag = THF_DB.TextFlag or "None";
		THF_DB.TitleFont = THF_DB.TitleFont or AddOn_Data.LSM.DefaultMedia.font;
		THF_DB.TitleSize = THF_DB.TitleSize or 22;
		THF_DB.TitleFlag = THF_DB.TitleFlag or "None";
		
		-- Reset the font if its not found.
		if(not AddOn_Data.Fonts[THF_DB.TitleFont] or not FontExists(AddOn_Data.Fonts[THF_DB.TitleFont])) then THF_DB.TitleFont = AddOn_Data.LSM.DefaultMedia.font; end
		if(not AddOn_Data.Fonts[THF_DB.TextFont] or not FontExists(AddOn_Data.Fonts[THF_DB.TextFont])) then THF_DB.TextFont = AddOn_Data.LSM.DefaultMedia.font; end
		
		-- Initialize control values.
		SettingsFrame.Tabs.General.CBEnable:SetChecked(not THF_DB.Disabled);
		SettingsFrame.Tabs.General.CBClickThrough:SetChecked(THF_DB.ClickThrough);
		SettingsFrame.Tabs.General.CBLowerStrata:SetChecked(THF_DB.LowerStrata);
		SettingsFrame.Tabs.General.ScaleSlider:SetValue(THF_DB.Scale * 100);
		getglobal(SettingsFrame.Tabs.General.ScaleSlider:GetName() .. 'Text'):SetText(format("|cffffff00Scale: %.0f%%|r", SettingsFrame.Tabs.General.ScaleSlider:GetValue()));
		SettingsFrame.Tabs.TextFont.TextSize:SetValue(THF_DB.TextSize);
		getglobal(SettingsFrame.Tabs.TextFont.TextSize:GetName() .. 'Text'):SetText(format("%.0f", THF_DB.TextSize));
		SettingsFrame.Tabs.TitleFont.TitleSize:SetValue(THF_DB.TitleSize);
		getglobal(SettingsFrame.Tabs.TitleFont.TitleSize:GetName() .. 'Text'):SetText(format("%.0f", THF_DB.TitleSize));
		SettingsFrame.Tabs.TitleFont.DDMTitleFont.ValueText:SetFont(AddOn_Data.Fonts[THF_DB.TitleFont], 13, "OUTLINE");
		SettingsFrame.Tabs.TitleFont.DDMTitleFont.ValueText:SetText(THF_DB.TitleFont);
		SettingsFrame.Tabs.TitleFont.DDMTitleOutline.ValueText:SetText(THF_DB.TitleFlag);
		SettingsFrame.Tabs.TextFont.DDMTextFont.ValueText:SetFont(AddOn_Data.Fonts[THF_DB.TextFont], 13, "OUTLINE");
		SettingsFrame.Tabs.TextFont.DDMTextFont.ValueText:SetText(THF_DB.TextFont);
		SettingsFrame.Tabs.TextFont.DDMTextOutline.ValueText:SetText(THF_DB.TextFlag);
		THFUpdateFont(); -- apply font settings to dummy frame.
		
		-- Set the scale for the drag frame & settings frame.
		TalkingHeadDragFrame:SetScale(THF_DB.Scale);
		SettingsFrame:SetScale(1 / THF_DB.Scale);
		
		-- Set the location of the drag frame.
		TalkingHeadDragAnchorFrame:ClearAllPoints();
		TalkingHeadDragAnchorFrame:SetPoint(THF_DB.Point, UIParent, THF_DB.RelativePoint, THF_DB.X, THF_DB.Y);
		
		-- Set the addon loaded flag.
		AddOn_Loaded = true;
		
		-- Fire the on show function in case the frame is already displayed.
		THFOnShow();
	end
end

-- Sets tooltip for any frame based control, only call after OnLeave & OnEnter have been set (if at all).
local function SetToolTip(frame, title, text)
	if(text or title) then
		frame:HookScript("OnLeave", function(self)
			GameTooltip:Hide();
		end);
		frame:HookScript("OnEnter", function(self)
			GameTooltip:Hide();
			GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
			if(not title) then
				GameTooltip:SetText(text, 1, 1, 1);
			else
				GameTooltip:SetText(title);
				GameTooltip:AddLine(text, 1, 1, 1);
			end
			GameTooltip:Show();
		end);
	end

end

-- Initializes the addon & variables.
local function Initialize()
	-- Event frame
	local frame = CreateFrame("Frame");
	frame:SetScript("OnEvent", function(self, event, ...) OnEvent[event](self, ...); end);
	for event, func in pairs(OnEvent) do
		frame:RegisterEvent(event);
	end
	
	-- Anchor frame.
	TalkingHeadDragAnchorFrame = CreateFrame("Frame", nil, UIParent);
	TalkingHeadDragAnchorFrame:Show();
	TalkingHeadDragAnchorFrame:SetWidth(1);
	TalkingHeadDragAnchorFrame:SetHeight(1);
	TalkingHeadDragAnchorFrame:EnableMouse(true);
	TalkingHeadDragAnchorFrame:SetMovable(true);
	TalkingHeadDragAnchorFrame:SetUserPlaced(false);
	TalkingHeadDragAnchorFrame:RegisterForDrag("LeftButton");
	TalkingHeadDragAnchorFrame:ClearAllPoints();
	TalkingHeadDragAnchorFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0);
	
	TalkingHeadDragAnchorFrame.TestFont = TalkingHeadDragAnchorFrame:CreateFontString();
	TalkingHeadDragAnchorFrame.TestFont:ClearAllPoints();
	TalkingHeadDragAnchorFrame.TestFont:SetPoint("CENTER", 0, 0);
	TalkingHeadDragAnchorFrame.TestFont:SetFont(AddOn_Data.Fonts[AddOn_Data.LSM.DefaultMedia.font], 14, "OUTLINE");
	--TalkingHeadDragAnchorFrame.TestFont:SetText("<TEST>");
	--TalkingHeadDragAnchorFrame.TestFont:Show();
	
	-- Drag frame
	TalkingHeadDragFrame = CreateFrame("Frame", nil, TalkingHeadDragAnchorFrame);
	TalkingHeadDragFrame:Hide();
	TalkingHeadDragFrame:SetBackdrop({ bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", 
		edgeFile = nil,
		tile = nil,
		tileSize = 0,
		edgeSize = 0,
		insets = { left = 0, right = 0, top = 0, bottom = 0 }});
	TalkingHeadDragFrame:SetFrameStrata("HIGH");
	TalkingHeadDragFrame:EnableMouse(true);
	TalkingHeadDragFrame:SetMovable(true);
	TalkingHeadDragFrame:SetUserPlaced(false);
	TalkingHeadDragFrame:RegisterForDrag("LeftButton");
	TalkingHeadDragFrame.THFText = TalkingHeadDragFrame:CreateFontString();
	TalkingHeadDragFrame.THFText:SetFont(AddOn_Data.Fonts[AddOn_Data.LSM.DefaultMedia.font], 38, "OUTLINE");
	TalkingHeadDragFrame.THFText:SetPoint("CENTER", 0, 0);
	TalkingHeadDragFrame.THFText:SetText("(TalkingHeadFrame)");
	TalkingHeadDragFrame.MoveText = TalkingHeadDragFrame:CreateFontString();
	TalkingHeadDragFrame.MoveText:SetFont(AddOn_Data.Fonts[AddOn_Data.LSM.DefaultMedia.font], 14, "OUTLINE");
	TalkingHeadDragFrame.MoveText:SetPoint("CENTER", 0, 35);
	TalkingHeadDragFrame.MoveText:SetText("(Click & Drag To Move)");
	TalkingHeadDragFrame:SetWidth(543); -- 570
	TalkingHeadDragFrame:SetHeight(128); -- 150
	TalkingHeadDragFrame:ClearAllPoints();
	TalkingHeadDragFrame:SetPoint("CENTER", TalkingHeadDragAnchorFrame, "CENTER", 0, 0);
	TalkingHeadDragFrame:SetScript("OnShow", THFOnShow);
	TalkingHeadDragFrame:SetScript("OnHide", THFOnShow);
	TalkingHeadDragFrame:SetScript("OnMouseDown", function(self, ...)
		THF_DB.Point, _, THF_DB.RelativePoint, THF_DB.X, THF_DB.Y = TalkingHeadDragAnchorFrame:GetPoint();
		TalkingHeadDragAnchorFrame:StartMoving();
		THFUpdatePosition();
	end);
	TalkingHeadDragFrame:SetScript("OnMouseUp", function(self, ...)
		TalkingHeadDragAnchorFrame:StopMovingOrSizing();
		THF_DB.Point, _, THF_DB.RelativePoint, THF_DB.X, THF_DB.Y = TalkingHeadDragAnchorFrame:GetPoint();
		THFUpdatePosition();
	end);	
	
	-- Dummy frame for text settings, when the TalkingHeadFrame is hidden.
	TalkingHeadDragFrame.TextDummyFrame = CreateFrame("Frame", nil, TalkingHeadDragFrame);
	TalkingHeadDragFrame.TextDummyFrame:SetBackdrop({ bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", 
		edgeFile = nil,
		tile = nil,
		tileSize = 0,
		edgeSize = 0,
		insets = { left = 0, right = 0, top = 0, bottom = 0 }});
	TalkingHeadDragFrame.TextDummyFrame:SetWidth(543); -- 570
	TalkingHeadDragFrame.TextDummyFrame:SetHeight(128); -- 150
	TalkingHeadDragFrame.TextDummyFrame:SetPoint("CENTER", 0, 0);
	TalkingHeadDragFrame.TextDummyFrame:Hide();
	
	-- Dummy title
	TalkingHeadDragFrame.TextDummyFrame.Ttitle = TalkingHeadDragFrame.TextDummyFrame:CreateFontString();
	TalkingHeadDragFrame.TextDummyFrame.Ttitle:SetFont("Fonts\\MORPHEUS.ttf", 22, "OUTLINE");
	TalkingHeadDragFrame.TextDummyFrame.Ttitle:SetPoint("TOPLEFT", 145, -16);
	TalkingHeadDragFrame.TextDummyFrame.Ttitle:SetText("|cffffff00Name Font: Flower|r");
	--TalkingHeadDragFrame.TextDummyFrame.Ttitle:SetSize(408, 1);
	TalkingHeadDragFrame.TextDummyFrame.Ttitle:SetWidth(408);
	TalkingHeadDragFrame.TextDummyFrame.Ttitle:SetJustifyH("LEFT");
	TalkingHeadDragFrame.TextDummyFrame.Ttitle:SetJustifyV("MIDDLE");
	TalkingHeadDragFrame.TextDummyFrame.Ttitle:SetWordWrap(true);
	TalkingHeadDragFrame.TextDummyFrame.Ttitle:SetNonSpaceWrap(true);
	
	-- Dummy text
	TalkingHeadDragFrame.TextDummyFrame.Text = TalkingHeadDragFrame.TextDummyFrame:CreateFontString();
	TalkingHeadDragFrame.TextDummyFrame.Text:SetFont(AddOn_Data.Fonts[AddOn_Data.LSM.DefaultMedia.font], 16, "OUTLINE");
	TalkingHeadDragFrame.TextDummyFrame.Text:SetPoint("TOPLEFT", TalkingHeadDragFrame.TextDummyFrame.Ttitle, "BOTTOMLEFT", 0, -3);
	TalkingHeadDragFrame.TextDummyFrame.Text:SetText("Text Font: The four main parts of a flower are generally defined by their positions on the receptacle and not by their function. Many flowers lack some parts or parts may be modified into other functions and/or look (...)");
	--TalkingHeadDragFrame.TextDummyFrame.Text:SetSize(378, 114);
	TalkingHeadDragFrame.TextDummyFrame.Text:SetWidth(378);
	TalkingHeadDragFrame.TextDummyFrame.Text:SetJustifyH("LEFT");
	TalkingHeadDragFrame.TextDummyFrame.Text:SetJustifyV("TOP");
	TalkingHeadDragFrame.TextDummyFrame.Text:SetWordWrap(true);
	TalkingHeadDragFrame.TextDummyFrame.Text:SetNonSpaceWrap(true);
	
	-- Settings frame.
	SettingsFrame = CreateFrame("Frame", "TalkingHeadDragFrame", TalkingHeadDragFrame);
	SettingsFrame:Show();
	SettingsFrame:SetBackdrop({ bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", 
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
			tile = nil,
			tileSize = 0,
			edgeSize = 14,
			insets = { left = 3, right = 3, top = 3, bottom = 3 }});
	SettingsFrame:SetHeight(167);
	SettingsFrame:SetWidth(250);
	SettingsFrame:SetFrameStrata("HIGH");
	SettingsFrame:EnableMouse(true);
	SettingsFrame:ClearAllPoints();
	SettingsFrame:SetPoint("TOP", TalkingHeadDragFrame, "BOTTOM", 0, -5)
	
	-- Font string: addon title
	SettingsFrame.Ttitle = SettingsFrame:CreateFontString();
	SettingsFrame.Ttitle:SetFont(AddOn_Data.Fonts[AddOn_Data.LSM.DefaultMedia.font], 16, "OUTLINE");
	SettingsFrame.Ttitle:SetPoint("TOP", 0, -6);
	SettingsFrame.Ttitle:SetText("|cffffff00TalkingHeadFrame|r |cff00ffffSettings|r");
	
	SettingsFrame.TabButtons = {};
	
	local function ResetTabs()
		for key, value in pairs(SettingsFrame.TabButtons) do
			value:GetFontString():SetTextColor(1, 1, 1);
		end
		for key, value in pairs(SettingsFrame.Tabs) do
			value:Hide();
		end
	end
	
	-- General tab button.
	SettingsFrame.TabButtons.General = CreateFrame("Button", nil, SettingsFrame, "UIPanelButtonTemplate");
	SettingsFrame.TabButtons.General:SetPoint("TOPLEFT", 10, -28);
	SettingsFrame.TabButtons.General:SetHeight(23);
	SettingsFrame.TabButtons.General:SetWidth(75);
	SettingsFrame.TabButtons.General:GetFontString():SetFont(AddOn_Data.Fonts[AddOn_Data.LSM.DefaultMedia.font], 12, "OUTLINE");
	SettingsFrame.TabButtons.General:GetFontString():SetTextColor(0, 1, 1)
	SettingsFrame.TabButtons.General:SetText("General");
	SettingsFrame.TabButtons.General:SetScript("OnClick", function()
		ResetTabs();
		SettingsFrame.TabButtons.General:GetFontString():SetTextColor(0, 1, 1);
		SettingsFrame.Tabs.General:Show();
		FontSettingOpen = false;
		UpdateDummyFrameVisibility();
	end);
	
	-- Text font tab button.
	SettingsFrame.TabButtons.TextFont = CreateFrame("Button", nil, SettingsFrame, "UIPanelButtonTemplate");
	SetToolTip(SettingsFrame.TabButtons.TextFont, "Text Font", "Set the font & size for the talk text.");
	SettingsFrame.TabButtons.TextFont:SetPoint("TOPLEFT", 88, -28);
	SettingsFrame.TabButtons.TextFont:SetHeight(23);
	SettingsFrame.TabButtons.TextFont:SetWidth(75);
	SettingsFrame.TabButtons.TextFont:GetFontString():SetFont(AddOn_Data.Fonts[AddOn_Data.LSM.DefaultMedia.font], 12, "OUTLINE");
	SettingsFrame.TabButtons.TextFont:GetFontString():SetTextColor(1, 1, 1)
	SettingsFrame.TabButtons.TextFont:SetText("Text Font");
	SettingsFrame.TabButtons.TextFont:SetScript("OnClick", function()
		ResetTabs();
		SettingsFrame.TabButtons.TextFont:GetFontString():SetTextColor(0, 1, 1);
		SettingsFrame.Tabs.TextFont:Show();
		FontSettingOpen = true;
		UpdateDummyFrameVisibility();
	end);
	
	-- Name font tab button.
	SettingsFrame.TabButtons.TitleFont = CreateFrame("Button", nil, SettingsFrame, "UIPanelButtonTemplate");
	SetToolTip(SettingsFrame.TabButtons.TitleFont, "Name Font", "Set the font & size for the npc/object name text.");
	SettingsFrame.TabButtons.TitleFont:SetPoint("TOPLEFT", 166, -28);
	SettingsFrame.TabButtons.TitleFont:SetHeight(23);
	SettingsFrame.TabButtons.TitleFont:SetWidth(75);
	SettingsFrame.TabButtons.TitleFont:GetFontString():SetFont(AddOn_Data.Fonts[AddOn_Data.LSM.DefaultMedia.font], 12, "OUTLINE");
	SettingsFrame.TabButtons.TitleFont:GetFontString():SetTextColor(1, 1, 1)
	SettingsFrame.TabButtons.TitleFont:SetText("Name Font");
	SettingsFrame.TabButtons.TitleFont:SetScript("OnClick", function()
		ResetTabs();
		SettingsFrame.TabButtons.TitleFont:GetFontString():SetTextColor(0, 1, 1);
		SettingsFrame.Tabs.TitleFont:Show();
		FontSettingOpen = true;
		UpdateDummyFrameVisibility();
	end);
	
	SettingsFrame.Tabs = {};
	
	-- General tab.
	SettingsFrame.Tabs.General = CreateFrame("Frame", nil, SettingsFrame);
	SettingsFrame.Tabs.General:Show();
	SettingsFrame.Tabs.General:SetHeight(1);
	SettingsFrame.Tabs.General:SetWidth(1);
	SettingsFrame.Tabs.General:SetPoint("TOPLEFT", 0, -70);
	
	-- Slider: scale
	SettingsFrame.Tabs.General.ScaleSlider = CreateFrame("Slider", "THFSettingsFrameScaleSlider", SettingsFrame.Tabs.General, "OptionsSliderTemplate");
	--SetToolTip(SettingsFrame.Tabs.General.ScaleSlider, "Scale", "Magnify or shrink the TalkingHeadFrame."); -- Blocks the slider at the moment
	SettingsFrame.Tabs.General.ScaleSlider:SetWidth(210);
	SettingsFrame.Tabs.General.ScaleSlider:SetHeight(16);
	SettingsFrame.Tabs.General.ScaleSlider:SetPoint("TOPLEFT", 18, 0);
	SettingsFrame.Tabs.General.ScaleSlider:SetOrientation("HORIZONTAL");
	getglobal(SettingsFrame.Tabs.General.ScaleSlider:GetName() .. 'Low'):SetText();
	getglobal(SettingsFrame.Tabs.General.ScaleSlider:GetName() .. 'High'):SetText();
	getglobal(SettingsFrame.Tabs.General.ScaleSlider:GetName() .. 'Text'):SetFont(AddOn_Data.Fonts[AddOn_Data.LSM.DefaultMedia.font], 14, "OUTLINE");
	SettingsFrame.Tabs.General.ScaleSlider:SetMinMaxValues(40, 200);
	SettingsFrame.Tabs.General.ScaleSlider:SetValue(100);
	getglobal(SettingsFrame.Tabs.General.ScaleSlider:GetName() .. 'Text'):SetText(format("|cffffff00Scale: %.0f%%|r", SettingsFrame.Tabs.General.ScaleSlider:GetValue()));
	SettingsFrame.Tabs.General.ScaleSlider:SetScript("OnValueChanged", function()
		getglobal(SettingsFrame.Tabs.General.ScaleSlider:GetName() .. 'Text'):SetText(format("|cffffff00Scale: %.0f%%|r", SettingsFrame.Tabs.General.ScaleSlider:GetValue()));
		THF_DB.Scale = SettingsFrame.Tabs.General.ScaleSlider:GetValue() / 100;
		TalkingHeadDragFrame:SetScale(THF_DB.Scale);
		SettingsFrame:SetScale(1 / THF_DB.Scale);
		THFUpdateScale();
		THFUpdatePosition();
	end);
	
	-- Check button: enable
	SettingsFrame.Tabs.General.CBEnable = CreateFrame("CheckButton", "THFSettingsFrameCBEnable", SettingsFrame.Tabs.General, "UICheckButtonTemplate");
	SettingsFrame.Tabs.General.CBEnable:SetWidth(25);
	SettingsFrame.Tabs.General.CBEnable:SetHeight(25);
	SetToolTip(SettingsFrame.Tabs.General.CBEnable, "Enable", "Untick to have the TalkingHeadFrame never show.");
	getglobal(SettingsFrame.Tabs.General.CBEnable:GetName() .. "Text"):SetFont(AddOn_Data.Fonts[AddOn_Data.LSM.DefaultMedia.font], 14, "OUTLINE");
	getglobal(SettingsFrame.Tabs.General.CBEnable:GetName() .. "Text"):SetText("Enabled")
	SettingsFrame.Tabs.General.CBEnable:SetPoint("TOPLEFT", 18, -15)
	SettingsFrame.Tabs.General.CBEnable:SetScript("PostClick", function()
		THF_DB.Disabled = not SettingsFrame.Tabs.General.CBEnable:GetChecked();
		THFUpdateVisibility();
	end);
	
	-- Check button: click through
	SettingsFrame.Tabs.General.CBClickThrough = CreateFrame("CheckButton", "THFSettingsFrameCBClickThrough", SettingsFrame.Tabs.General, "UICheckButtonTemplate");
	SettingsFrame.Tabs.General.CBClickThrough:SetWidth(25);
	SettingsFrame.Tabs.General.CBClickThrough:SetHeight(25);
	SetToolTip(SettingsFrame.Tabs.General.CBClickThrough, "Click Through", "Allows you to interact with stuff behind the TalkingHeadFrame.");
	getglobal(SettingsFrame.Tabs.General.CBClickThrough:GetName() .. "Text"):SetFont(AddOn_Data.Fonts[AddOn_Data.LSM.DefaultMedia.font], 14, "OUTLINE");
	getglobal(SettingsFrame.Tabs.General.CBClickThrough:GetName() .. "Text"):SetText("Click Through")
	SettingsFrame.Tabs.General.CBClickThrough:SetPoint("TOPLEFT", 18, -40)
	SettingsFrame.Tabs.General.CBClickThrough:SetScript("PostClick", function()
		THF_DB.ClickThrough = SettingsFrame.Tabs.General.CBClickThrough:GetChecked();
		THFUpdateClickThrough();
	end);
	
	-- Check button: lower frame strata
	SettingsFrame.Tabs.General.CBLowerStrata = CreateFrame("CheckButton", "THFSettingsFrameCBLowerStrata", SettingsFrame.Tabs.General, "UICheckButtonTemplate");
	SettingsFrame.Tabs.General.CBLowerStrata:SetWidth(25);
	SettingsFrame.Tabs.General.CBLowerStrata:SetHeight(25);
	SetToolTip(SettingsFrame.Tabs.General.CBLowerStrata, "Lower Frame Strata", "TalkingHeadFrame will now appear behind the majority of other AddOns.");
	getglobal(SettingsFrame.Tabs.General.CBLowerStrata:GetName() .. "Text"):SetFont(AddOn_Data.Fonts[AddOn_Data.LSM.DefaultMedia.font], 14, "OUTLINE");
	getglobal(SettingsFrame.Tabs.General.CBLowerStrata:GetName() .. "Text"):SetText("Lower Frame Strata")
	SettingsFrame.Tabs.General.CBLowerStrata:SetPoint("TOPLEFT", 18, -65)
	SettingsFrame.Tabs.General.CBLowerStrata:SetScript("PostClick", function()
		THF_DB.LowerStrata = SettingsFrame.Tabs.General.CBLowerStrata:GetChecked();
		THFUpdateStrata();
	end);
	
	-- Text font tab.
	SettingsFrame.Tabs.TextFont = CreateFrame("Frame", nil, SettingsFrame);
	SettingsFrame.Tabs.TextFont:Hide();
	SettingsFrame.Tabs.TextFont:SetHeight(1);
	SettingsFrame.Tabs.TextFont:SetWidth(1);
	SettingsFrame.Tabs.TextFont:SetPoint("TOPLEFT", 0, -70);
	
	-- Slider: text size.
	SettingsFrame.Tabs.TextFont.TextSize = CreateFrame("Slider", "THFTextSizeSlider", SettingsFrame.Tabs.TextFont, "OptionsSliderTemplate");
	SettingsFrame.Tabs.TextFont.TextSize:SetWidth(210);
	SettingsFrame.Tabs.TextFont.TextSize:SetHeight(16);
	SettingsFrame.Tabs.TextFont.TextSize:SetPoint("TOPLEFT", 18, 0);
	SettingsFrame.Tabs.TextFont.TextSize:SetOrientation("HORIZONTAL");
	getglobal(SettingsFrame.Tabs.TextFont.TextSize:GetName() .. 'Low'):SetText();
	getglobal(SettingsFrame.Tabs.TextFont.TextSize:GetName() .. 'High'):SetText();
	getglobal(SettingsFrame.Tabs.TextFont.TextSize:GetName() .. 'Text'):SetFont(AddOn_Data.Fonts[AddOn_Data.LSM.DefaultMedia.font], 14, "OUTLINE");
	SettingsFrame.Tabs.TextFont.TextSize:SetMinMaxValues(6, 42);
	SettingsFrame.Tabs.TextFont.TextSize:SetValue(22);
	getglobal(SettingsFrame.Tabs.TextFont.TextSize:GetName() .. 'Text'):SetText("22");
	SettingsFrame.Tabs.TextFont.TextSize:SetScript("OnValueChanged", function()
		THF_DB.TextSize = SettingsFrame.Tabs.TextFont.TextSize:GetValue();
		getglobal(SettingsFrame.Tabs.TextFont.TextSize:GetName() .. 'Text'):SetText(format("%.0f", THF_DB.TextSize));
		THFUpdateFont();
	end);
	
	-- Text font.
	SettingsFrame.Tabs.TextFont.DDMTextFont = AddOn_Data.CreateDropDownMenu("THFTextFontDropDownMenu", "TOPLEFT", SettingsFrame.Tabs.TextFont, "TOPLEFT", 20, -25, 205, 25, 250, 20, 10);
	SettingsFrame.Tabs.TextFont.DDMTextFont.ValueText:SetFont(AddOn_Data.Fonts[AddOn_Data.LSM.DefaultMedia.font], 14, "OUTLINE");
	SettingsFrame.Tabs.TextFont.DDMTextFont.ValueText:SetText(AddOn_Data.LSM.DefaultMedia.font);
	SettingsFrame.Tabs.TextFont.DDMTextFont.OnDropDown = function()
	
		for key, value in SPairs(AddOn_Data.Fonts) do
			
			if(FontExists(AddOn_Data.Fonts[key])) then
			
				if(not FontFunctions.Text.Font[key]) then -- Create function if it does not exist.
					FontFunctions.Text.Font[key] = function()
						SettingsFrame.Tabs.TextFont.DDMTextFont.ValueText:SetFont(AddOn_Data.Fonts[key], 13, "OUTLINE");
						SettingsFrame.Tabs.TextFont.DDMTextFont.ValueText:SetText(key);
						THF_DB.TextFont = key;
						THFUpdateFont();
					end
				end
				
				SettingsFrame.Tabs.TextFont.DDMTextFont.AddElement(
					key,
					AddOn_Data.Fonts[key],
					13,
					"OUTLINE",
					nil,
					FontFunctions.Text.Font[key]);
					
			end

		end
	
	end
	
	-- Text outline.
	SettingsFrame.Tabs.TextFont.DDMTextOutline = AddOn_Data.CreateDropDownMenu("THFTextOutlineDropDownMenu", "TOPLEFT", SettingsFrame.Tabs.TextFont, "TOPLEFT", 20, -60, 205, 25, 150, 20, 10);
	SettingsFrame.Tabs.TextFont.DDMTextOutline.ValueText:SetFont(AddOn_Data.Fonts[AddOn_Data.LSM.DefaultMedia.font], 14, "OUTLINE");
	SettingsFrame.Tabs.TextFont.DDMTextOutline.ValueText:SetText("None");
	SettingsFrame.Tabs.TextFont.DDMTextOutline.OnDropDown = function()
	
		for key, value in SPairs(AddOn_Data.FontFlags) do
			
			if(not FontFunctions.Text.Outline[key]) then -- Create function if it does not exist.
				FontFunctions.Text.Outline[key] = function()
					SettingsFrame.Tabs.TextFont.DDMTextOutline.ValueText:SetText(key);
					THF_DB.TextFlag = key;
					THFUpdateFont();
				end
			end
			
			SettingsFrame.Tabs.TextFont.DDMTextOutline.AddElement(
				key,
				AddOn_Data.Fonts[AddOn_Data.LSM.DefaultMedia.font],
				13,
				"OUTLINE",
				nil,
				FontFunctions.Text.Outline[key]);

		end
	
	end
	
	-- Title font tab.
	SettingsFrame.Tabs.TitleFont = CreateFrame("Frame", nil, SettingsFrame);
	SettingsFrame.Tabs.TitleFont:Hide();
	SettingsFrame.Tabs.TitleFont:SetHeight(1);
	SettingsFrame.Tabs.TitleFont:SetWidth(1);
	SettingsFrame.Tabs.TitleFont:SetPoint("TOPLEFT", 0, -70);
	
	-- Slider: title size.
	SettingsFrame.Tabs.TitleFont.TitleSize = CreateFrame("Slider", "THFTitleSizeSlider", SettingsFrame.Tabs.TitleFont, "OptionsSliderTemplate");
	SettingsFrame.Tabs.TitleFont.TitleSize:SetWidth(210);
	SettingsFrame.Tabs.TitleFont.TitleSize:SetHeight(16);
	SettingsFrame.Tabs.TitleFont.TitleSize:SetPoint("TOPLEFT", 18, 0);
	SettingsFrame.Tabs.TitleFont.TitleSize:SetOrientation("HORIZONTAL");
	getglobal(SettingsFrame.Tabs.TitleFont.TitleSize:GetName() .. 'Low'):SetText();
	getglobal(SettingsFrame.Tabs.TitleFont.TitleSize:GetName() .. 'High'):SetText();
	getglobal(SettingsFrame.Tabs.TitleFont.TitleSize:GetName() .. 'Text'):SetFont(AddOn_Data.Fonts[AddOn_Data.LSM.DefaultMedia.font], 14, "OUTLINE");
	SettingsFrame.Tabs.TitleFont.TitleSize:SetMinMaxValues(6, 42);
	SettingsFrame.Tabs.TitleFont.TitleSize:SetValue(22);
	getglobal(SettingsFrame.Tabs.TitleFont.TitleSize:GetName() .. 'Text'):SetText("22");
	SettingsFrame.Tabs.TitleFont.TitleSize:SetScript("OnValueChanged", function()
		THF_DB.TitleSize = SettingsFrame.Tabs.TitleFont.TitleSize:GetValue();
		getglobal(SettingsFrame.Tabs.TitleFont.TitleSize:GetName() .. 'Text'):SetText(format("%.0f", THF_DB.TitleSize));
		THFUpdateFont();
	end);
	
	-- Title font.
	SettingsFrame.Tabs.TitleFont.DDMTitleFont = AddOn_Data.CreateDropDownMenu("THFTitleFontDropDownMenu", "TOPLEFT", SettingsFrame.Tabs.TitleFont, "TOPLEFT", 20, -25, 205, 25, 250, 20, 10);
	SettingsFrame.Tabs.TitleFont.DDMTitleFont.ValueText:SetFont(AddOn_Data.Fonts[AddOn_Data.LSM.DefaultMedia.font], 14, "OUTLINE");
	SettingsFrame.Tabs.TitleFont.DDMTitleFont.ValueText:SetText(AddOn_Data.LSM.DefaultMedia.font);
	SettingsFrame.Tabs.TitleFont.DDMTitleFont.OnDropDown = function()
	
		for key, value in SPairs(AddOn_Data.Fonts) do
		
			if(FontExists(AddOn_Data.Fonts[key])) then
				
				if(not FontFunctions.Title.Font[key]) then -- Create function if it does not exist.
					FontFunctions.Title.Font[key] = function()
						SettingsFrame.Tabs.TitleFont.DDMTitleFont.ValueText:SetFont(AddOn_Data.Fonts[key], 13, "OUTLINE");
						SettingsFrame.Tabs.TitleFont.DDMTitleFont.ValueText:SetText(key);
						THF_DB.TitleFont = key;
						THFUpdateFont();
					end
				end
				
				SettingsFrame.Tabs.TitleFont.DDMTitleFont.AddElement(
					key,
					AddOn_Data.Fonts[key],
					13,
					"OUTLINE",
					nil,
					FontFunctions.Title.Font[key]);
					
			end

		end
	
	end
	
	-- Title outline.
	SettingsFrame.Tabs.TitleFont.DDMTitleOutline = AddOn_Data.CreateDropDownMenu("THFTitleOutlineDropDownMenu", "TOPLEFT", SettingsFrame.Tabs.TitleFont, "TOPLEFT", 20, -60, 205, 25, 150, 20, 10);
	SettingsFrame.Tabs.TitleFont.DDMTitleOutline.ValueText:SetFont(AddOn_Data.Fonts[AddOn_Data.LSM.DefaultMedia.font], 14, "OUTLINE");
	SettingsFrame.Tabs.TitleFont.DDMTitleOutline.ValueText:SetText("None");
	SettingsFrame.Tabs.TitleFont.DDMTitleOutline.OnDropDown = function()
	
		for key, value in SPairs(AddOn_Data.FontFlags) do
			
			if(not FontFunctions.Title.Outline[key]) then -- Create function if it does not exist.
				FontFunctions.Title.Outline[key] = function()
					SettingsFrame.Tabs.TitleFont.DDMTitleOutline.ValueText:SetText(key);
					THF_DB.TitleFlag = key;
					THFUpdateFont();
				end
			end
			
			SettingsFrame.Tabs.TitleFont.DDMTitleOutline.AddElement(
				key,
				AddOn_Data.Fonts[AddOn_Data.LSM.DefaultMedia.font],
				13,
				"OUTLINE",
				nil,
				FontFunctions.Title.Outline[key]);

		end
	
	end
	
	-- Slash command handler.
	SLASH_TALKINGHEADFRAME1 = "/thf";
	SLASH_TALKINGHEADFRAME2 = "/talkingheadframe";
	SlashCmdList["TALKINGHEADFRAME"] = function(msg, editbox)
		local lower_msg = msg:lower();
		
		if(lower_msg == "reset") then
			THF_DB.X = 0;
			THF_DB.Y = 0;
			THF_DB.Point = "CENTER";
			THF_DB.RelativePoint = "CENTER";
			TalkingHeadDragAnchorFrame:ClearAllPoints();
			TalkingHeadDragAnchorFrame:SetPoint(THF_DB.Point, UIParent, THF_DB.RelativePoint, THF_DB.X, THF_DB.Y);
			THFOnShow();
		else
			if(TalkingHeadDragFrame:IsVisible()) then
				TalkingHeadDragFrame:Hide();
			else
				TalkingHeadDragFrame:Show();
			end
		end
	end
end

-- Everything loaded, initialize addon & variables.
Initialize();