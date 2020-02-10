--[=[ 

	Author: Klynk
	
	Custom DropDownMenu to prevent tainting.

--]=]

local AddOn_Name, AddOn_Data = ...;

local currently_open_drop_down_frame = nil;

function AddOn_Data.CreateDropDownMenu(frame_name, point, parent, relative_point, offset_x, offset_y, width, height, menu_item_width, menu_item_height, menu_items)

	local frame = CreateFrame("Button", frame_name, parent);
	frame:SetWidth(width);
	frame:SetHeight(height);
	frame:SetPoint(point, parent, relative_point, offset_x, offset_y);
	
	local texture_height = height * 2.533;
	local texture_width = width - 15;
	
	frame.TextureMiddle = frame:CreateTexture(nil, "BACKGROUND");
	frame.TextureMiddle:SetTexCoord(0.1953125, 0.8046875, 0, 1)
	frame.TextureMiddle:SetSize(texture_width, texture_height);
	frame.TextureMiddle:SetPoint("CENTER", frame, "CENTER", 0, 0);
	frame.TextureMiddle:SetTexture("Interface\\Glues\\CharacterCreate\\CharacterCreate-LabelFrame");
	
	frame.TextureLeft = frame:CreateTexture(nil, "BACKGROUND");
	frame.TextureLeft:SetTexCoord(0, 0.1953125, 0, 1);
	frame.TextureLeft:SetSize(25, texture_height);
	frame.TextureLeft:SetPoint("RIGHT", frame.TextureMiddle, "LEFT", 0, 0);
	frame.TextureLeft:SetTexture("Interface\\Glues\\CharacterCreate\\CharacterCreate-LabelFrame");
	
	frame.TextureRight = frame:CreateTexture(nil, "BACKGROUND");
	frame.TextureRight:SetTexCoord(0.8046875, 1, 0, 1)
	frame.TextureRight:SetSize(25, texture_height);
	frame.TextureRight:SetPoint("LEFT", frame.TextureMiddle, "RIGHT", 0, 0);
	frame.TextureRight:SetTexture("Interface\\Glues\\CharacterCreate\\CharacterCreate-LabelFrame");
	
	local NormalTexture = frame:CreateTexture("$parentNormalTexture", "ARTWORK");
	NormalTexture:SetSize(height * 0.95, height * 0.95);
	NormalTexture:SetPoint("RIGHT", frame.TextureRight, "RIGHT", -16, 2);
	NormalTexture:SetTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Up");
	frame:SetNormalTexture(NormalTexture);
	
	local PushedTexture = frame:CreateTexture("$parentPushedTexture", "ARTWORK");
	PushedTexture:SetSize(height * 0.95, height * 0.95);
	PushedTexture:SetPoint("RIGHT", frame.TextureRight, "RIGHT", -16, 2);
	PushedTexture:SetTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Down");
	frame:SetPushedTexture(PushedTexture);
	
	local HighlightTexture = frame:CreateTexture("$parentHighlightTexture", "HIGHLIGHT")
	HighlightTexture:SetPoint("CENTER", NormalTexture, "CENTER", 0, 0);
	HighlightTexture:SetSize(height * 0.95, height * 0.95);
	HighlightTexture:SetTexture("Interface\\Buttons\\UI-Common-MouseHilight")
	frame:SetHighlightTexture(HighlightTexture, "ADD");

	local value_frame = CreateFrame("Frame", frame_name .. ".ValueFrame", frame);
	value_frame:SetWidth(texture_width - (height * 0.95) + 7);
	value_frame:SetHeight(height * 0.5);
	value_frame:SetPoint("LEFT", frame, "LEFT", 9, 0);
	
	frame.ValueTexture = value_frame:CreateTexture(nil, "ARTWORK");
	frame.ValueTexture:SetTexture(nil);
	frame.ValueTexture:SetAllPoints(value_frame);
	
	frame.ValueText = value_frame:CreateFontString();
	frame.ValueText:SetPoint("LEFT", value_frame, "LEFT", 2, 2);
	frame.ValueText:SetWidth(value_frame:GetWidth() - 2);
	frame.ValueText:SetHeight(value_frame:GetHeight());
	frame.ValueText:SetJustifyV("CENTER");
	frame.ValueText:SetJustifyH("LEFT");
	
	frame.OnDropDown = function() end
	
	local drop_down_frame = CreateFrame("Frame", frame_name .. ".DropDownFrame", UIParent); -- , frame), fixes problem where the frame is clipped in scroll frames.
	drop_down_frame:Hide();
	drop_down_frame:SetWidth(menu_item_width + 25);
	drop_down_frame:SetHeight(((menu_item_height + 1) * menu_items) + 10);
	drop_down_frame:SetFrameStrata("DIALOG");
	drop_down_frame:SetPoint("TOP", frame, "BOTTOM", 0, 0);
	drop_down_frame:EnableMouseWheel(true);
	drop_down_frame:SetBackdrop({ bgFile = "Interface\\CHARACTERFRAME\\UI-Party-Background", 
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
			tile = nil,
			tileSize = 0,
			edgeSize = 14,
			insets = { left = 3, right = 3, top = 3, bottom = 3 }});
			
	local scroll_slider = CreateFrame("Slider", frame_name .. ".DropDownFrame.Slider", drop_down_frame, "OptionsSliderTemplate")
	scroll_slider:SetWidth(10)
	scroll_slider:SetHeight((menu_item_height + 1) * menu_items)
	scroll_slider:SetOrientation("VERTICAL")
	scroll_slider:SetPoint("RIGHT", drop_down_frame, "RIGHT", -7, 0);
	scroll_slider:SetMinMaxValues(0, 0);
	scroll_slider:SetValue(0);
	getglobal(scroll_slider:GetName() .. "Low"):SetText();
	getglobal(scroll_slider:GetName() .. "High"):SetText(); 
	getglobal(scroll_slider:GetName() .. "Text"):SetText();
	
	local table_position = 1;
	local DropDownMenuTable = {};
	
	local button_table = {};
	local total_buttons = 0;
	local current_line = 0;
	
	local function AddElement(Text, Font, Size, Flag, Texture, Function)
		
		if(not DropDownMenuTable[table_position]) then
			DropDownMenuTable[table_position] = {};
		end
		
		DropDownMenuTable[table_position].Enabled = true;
		DropDownMenuTable[table_position].Text = Text;
		DropDownMenuTable[table_position].Font = Font;
		DropDownMenuTable[table_position].Size = Size;
		DropDownMenuTable[table_position].Flag = Flag;
		DropDownMenuTable[table_position].Texture = Texture;
		if(DropDownMenuTable[table_position].Function) then DropDownMenuTable[table_position].OldFunction = DropDownMenuTable[table_position].Function; end
		DropDownMenuTable[table_position].Function = Function;
		
		table_position = table_position + 1;
		
	end
	
	local function Scroll(line)
	
		if(line > total_buttons - menu_items) then line = total_buttons - menu_items; end
		if(line < 0) then line = 0; end
	
		if(line ~= current_line) then
		
			scroll_slider:SetValue(line + 1);
	
			local visible_count = 0;
		
			for i = 0, total_buttons - 1 do
			
				button_table[i]:Hide();
				
				if(i >= line and visible_count < menu_items) then
				
					button_table[i]:SetPoint("TOPLEFT", drop_down_frame, "TOPLEFT", 5, (((menu_item_height + 1) * visible_count) * -1) - 5)
					button_table[i]:Show();
					visible_count = visible_count + 1;
				
				end
			
			end
			
			current_line = line;
		
		end
	
	end
	
	local function HideDropDownMenuFrame()
	
		drop_down_frame:Hide();
	
	end
	
	local function ShowDropDownMenuFrame()
	
		if(drop_down_frame:IsVisible() == false) then
		
			if(currently_open_drop_down_frame) then currently_open_drop_down_frame:Hide(); end
			currently_open_drop_down_frame = drop_down_frame;
			
			for key, value in pairs(DropDownMenuTable) do
				value.Enabled = false;
			end
			
			table_position = 1;
			if(frame.OnDropDown) then frame.OnDropDown(); end
		
			local item_count = 0;
			local line = 0;
	
			for key, value in pairs(DropDownMenuTable) do
			
				if(value.Enabled == true) then
			
					-- Create a new button.
					if(not button_table[item_count]) then
					
						button_table[item_count] = CreateFrame("Button", frame_name .. ".DropDownMenuButton" .. item_count, drop_down_frame);
						button_table[item_count]:SetHeight(menu_item_height);
						button_table[item_count]:SetWidth(menu_item_width);
						
						local ButtonHighlightTexture = button_table[item_count]:CreateTexture("$parentHighlightTexture", "HIGHLIGHT")
						ButtonHighlightTexture:SetPoint("CENTER", button_table[item_count], "CENTER", 0, 0);
						ButtonHighlightTexture:SetSize(menu_item_width, menu_item_height);
						ButtonHighlightTexture:SetTexture("Interface\\FriendsFrame\\UI-FriendsFrame-HighlightBar")
						button_table[item_count]:SetHighlightTexture(ButtonHighlightTexture, "ADD");
						
						button_table[item_count].Background = button_table[item_count]:CreateTexture(nil, "BACKGROUND")
						button_table[item_count].Background:SetAllPoints(button_table[item_count]);
						
						button_table[item_count].Selected = button_table[item_count]:CreateTexture(nil, "ARTWORK")
						button_table[item_count].Selected:SetAllPoints(button_table[item_count]);
						button_table[item_count].Selected:SetBlendMode("ADD")
						
						button_table[item_count].Text = button_table[item_count]:CreateFontString();
						button_table[item_count].Text:SetPoint("LEFT", button_table[item_count], "LEFT", 5, 0)
						button_table[item_count].Text:SetWidth(menu_item_width - 5)
						button_table[item_count].Text:SetHeight(menu_item_height - 5)
						button_table[item_count].Text:SetJustifyV("CENTER");
						button_table[item_count].Text:SetJustifyH("LEFT");
					
					end
					
					button_table[item_count].Background:SetTexture(value.Texture);
					button_table[item_count]:SetPoint("TOPLEFT", drop_down_frame, "TOPLEFT", 5, (((menu_item_height + 1) * item_count) * -1) - 5)
					if(not value.OldFunction or value.OldFunction ~= value.Function) then -- Saves RAM with anon functions.
						button_table[item_count]:SetScript("OnClick", function() HideDropDownMenuFrame(); value.Function(); end)
					end
					
					button_table[item_count].Text:SetFont(value.Font, value.Size, value.Flag);
					button_table[item_count].Text:SetText();
					
					if(frame.ValueText:GetText() == value.Text) then
						button_table[item_count].Background:SetVertexColor(0, 0, 1);
						button_table[item_count].Selected:SetTexture("Interface\\FriendsFrame\\UI-FriendsFrame-HighlightBar-Blue");
						line = floor(item_count - (menu_items/2));
					else
						button_table[item_count].Background:SetVertexColor(1, 1, 1);
						button_table[item_count].Selected:SetTexture();
					end
					
					button_table[item_count].Text:SetText(value.Text);
					
					button_table[item_count]:Hide();
					
					if(item_count < menu_items) then
						button_table[item_count]:Show();
					end
				
					item_count = item_count + 1;
				
				end
			
			end
			
			current_line = 0;
			total_buttons = item_count;
			scroll_slider:SetMinMaxValues(1, math.max(item_count - menu_items + 1, 1));

			Scroll(line);
			
			-- Trim the window height if there are less than 'menu_items' elements in the list.
			if(total_buttons < menu_items) then
				drop_down_frame:SetHeight(((menu_item_height + 1) * total_buttons) + 10);
				scroll_slider:SetHeight((menu_item_height + 1) * total_buttons)
			else
				drop_down_frame:SetHeight(((menu_item_height + 1) * menu_items) + 10);
				scroll_slider:SetHeight((menu_item_height + 1) * menu_items)
			end
			
			-- Hide the scroll bar and trim window width when there is not enough items to enable scrolling.
			if(total_buttons > menu_items) then
				scroll_slider:Show();
				drop_down_frame:SetWidth(menu_item_width + 25);
			else
				scroll_slider:Hide();
				drop_down_frame:SetWidth(menu_item_width + 10);
			end
			
			drop_down_frame:Show();
		
		end
	
	end
	
	frame.AddElement = AddElement;
	frame:SetScript("OnClick", function() if(drop_down_frame:IsVisible() == false) then ShowDropDownMenuFrame(); else HideDropDownMenuFrame(); end end)
	frame:SetScript("OnHide", function() HideDropDownMenuFrame(); end);
	drop_down_frame:SetScript("OnMouseWheel", function(self, delta)
	
		delta = delta * 3;
		Scroll(current_line + (delta * -1));
	
	end);
	scroll_slider:SetScript("OnValueChanged", function() Scroll(floor(scroll_slider:GetValue()) - 1) end);
	
	return frame;

end