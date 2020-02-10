Bartender4Radial = {}
local SETTINGS_VERSION = 4

local function SetRadial(bar,radiusx,radiusy)
	local center = bar.buttons[1]
	local numButtons = bar.numbuttons -1
	
	local verticalGrowthMod = -1
	local horizontalGrowthMod = -1
	
	if bar:GetVGrowth() == "UP" then
		verticalGrowthMod = 1
	end
	
	
	

	radiusx = radiusx - center:GetWidth()/2 -4
	radiusy = radiusy - center:GetHeight() - 6

	for i=2, bar.numbuttons do
		local button = bar.buttons[i]
		local point, relativeTo = button:GetPoint(index)
		local xpos =  horizontalGrowthMod * math.cos(((i-1) /numButtons)*math.pi) * radiusx + radiusx
		local ypos =  math.sin(( (i-1) / numButtons)*math.pi)  * radiusy * verticalGrowthMod
		
		button:ClearAllPoints()
		button:SetPoint("CENTER",center,"CENTER",xpos,ypos)
	end
	
	
end

local function CreateResizer(bar)
  if not bar then return end
  if not string.find(bar:GetName(),"BT4Bar%d") then  return end
  
  local overlay = _G[bar:GetName().."Overlay"]
  if overlay.resizeButton then return end

  overlay:SetMinResize(50, 50)
  overlay.resizeButton = CreateFrame("Button",nil,overlay)
  --overlay:SetClampedToScreen(true)
  overlay.resizeButton:EnableMouse(true)
  overlay.resizeButton:SetSize(20,20)
  overlay.resizeButton:SetPoint("BOTTOMRIGHT",overlay,"BOTTOMRIGHT",-6,6)
  overlay.resizeButton.icon = overlay.resizeButton:CreateTexture(nil,"OVERLAY")
  overlay.resizeButton.icon:SetTexture("Interface\\CHATFRAME\\UI-ChatIM-SizeGrabber-Up")
  overlay.resizeButton.icon:SetAllPoints(overlay.resizeButton)
  overlay.resizeButton:SetHighlightTexture("Interface\\CHATFRAME\\UI-ChatIM-SizeGrabber-Highlight","ADD")
  overlay.resizeButton:SetPushedTexture("Interface\\CHATFRAME\\UI-ChatIM-SizeGrabber-Down")
  overlay.resizeButton:RegisterForDrag("LeftButton","RightButton")
  overlay.resizeButton:Show()
  
  overlay:HookScript("OnSizeChanged",function(self) 
      if self.resizeButton.isOrigin then
        SetRadial(bar,overlay:GetWidth()/2,overlay:GetHeight())
		Bartender4Radial:Save(bar,true)
		bar:AnchorOverlay()
      end
  end)
  
  overlay.resizeButton:SetScript("OnDragStart",function(self)
	  self.isOrigin = true;
      overlay:SetResizable(true) 
      overlay:StartSizing() 
	  
  end)
  
  overlay.resizeButton:SetScript("OnDragStop",function(self)
	overlay:StopMovingOrSizing()
	overlay:SetResizable(false) 
	bar:AnchorOverlay()
	
	local width,height = overlay:GetSize()
	if height < bar.buttons[1]:GetHeight() * 2 and self.isOrigin then 
		Bartender4Radial:Save(bar,false)
		bar:UpdateButtonLayout()
		
	end
	self.isOrigin = false;
  end)
end

local function BarUpdateHook(self)
	CreateResizer(self)
	local data = Bartender4Radial.db.profile.bars[self:GetName()]
	if data and data.enabled and self.buttons then
		if self:GetHGrowth() == "LEFT" then 
			self:SetHGrowth("RIGHT")
		end
		if self:GetRows() > 1 then 
			self:SetRows(1)
		end
		if self:GetPadding() ~= 0 then
			self:SetPadding(0)
		end
		SetRadial(self,data.width/2,data.height)
		self.overlay:SetSize(data.width,data.height)
	end
end

function Bartender4Radial:Save(bar,enabled)
	local profile = self.db.profile.bars
	local index = bar:GetName()
	
	if not profile[index] then
		profile[index] = {} 
	end
	profile[index].height = bar.overlay:GetHeight()
	profile[index].width = bar.overlay:GetWidth()
	profile[index].enabled = enabled
	
end

if IsAddOnLoaded("Bartender4") then
	local defaults = {
		profile = {
			version = 0,
			bars = {}
		}
	}
	
	Bartender4Radial.db = Bartender4.db:RegisterNamespace("Bartender4Radial",defaults)
	if Bartender4Radial.db.profile.version == 0 then Bartender4Radial.db.profile.version = SETTINGS_VERSION end
	
	if Bartender4Radial.db.profile.version ~= SETTINGS_VERSION then
		print("Settings Version Missmatch")
		Bartender4Radial.db.profile.version = SETTINGS_VERSION
		Bartender4Radial.db.profile.bars = {}
	end
	
	--
	hooksecurefunc(Bartender4.ButtonBar.prototype,"UpdateButtonLayout", BarUpdateHook);
	hooksecurefunc(Bartender4.ButtonBar.prototype,"ApplyConfig", BarUpdateHook);
else
	print("Bartender4 is not loaded")
end


SLASH_BARTENDER4RADIAL1 = '/bt4rad'
function SlashCmdList.BARTENDER4RADIAL(msg, editbox)
	if msg == "reset" then
		Bartender4Radial.db.profile.bars = {}
		for i=1,10 do
			local bar = _G["BT4Bar"..i]
			if bar then bar:UpdateButtonLayout() end
		end
	end
end




