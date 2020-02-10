-------------------
-- More Information
-------------------

SLASH_LockItems1 = '/li';

SlashCmdList['LockItems'] = function(msg, editbox)

    -- How do I do this again?
    print('|cFFFF8400[LockItems] |cFFFFFF00Pick up an item, then press |cFF00FFFFCTRL+T |cFFFFFF00to lock/unlock it.');
    -- Oh yes.

end

---------------
-- Load Message
---------------

C_Timer.After( 3 , function()

        local LILoaded;
        local Prefix = '|cFFFF8400[LockItems] ';

        LILoaded = Prefix .. '|cFFFFFF00loaded. ';
        LILoaded = LILoaded .. '|cFFFFFF00Type |cFF00FFFF/li |cFFFFFF00for more information.\n';
        DEFAULT_CHAT_FRAME:AddMessage( LILoaded, 1.0, 1.0, 0.0, nil, true );

        -------------------
        -- Toggle Item Lock
        -------------------

        local btn = CreateFrame("BUTTON", "ToggleItemLockButton")
        SetBindingClick("CTRL-T", btn:GetName())
        btn:SetScript("OnClick", function(self, button, down)

            if ( LockedItems == nil ) then
                LockedItems = {}
            end

            -- /lookathand
            if ( CursorHasItem() ) then

                local infoType, info1, info2 = GetCursorInfo()

                -- What the... Is it a spell? Is it a macro? Is it money? Is it a merchant item?
                if ( infoType == "item" ) then

                    -- No! It's an item! DA DA DA DAAAAAAA!
                    -- Is the item in my [Big Bag of Locked Items]?
                    if ( LockedItems[info1] ) then

                        local itemPosition = nil

                        -- It is! How did it get there?
                        -- Now to get rid of this pesky bugger.
                        -- /dropkeys
                        -- Oh FFS! Where did they go?!
                        for k, v in ipairs(LockedItems) do

                            -- Is this them? It's been like 3 hours now.
                            -- I need to put a light on these things. I meant to do it sooner but I've been doing stuff... THINGS!
                            -- /breathe
                            -- They have to be here somewhere...
                            if v == info1 then

                                -- YES! I F**KING TOLD YOU I'D FIND THEM!
                                itemPosition = k
                                -- You didn't believe me! F**K YOU!

                            end
                        end

                        -- Right, now... GET OUT OF MY LIFE!
                        -- /leftyloosy
                        LockedItems[info1] = nil

                        -- /checklock
                        -- Is... Is that it now?
                        print("|cFFFF8400[LockItems] |cFFFFFF00Item |cFF00FFFFunlocked.")
                        -- Woop Woop!

                        -- Wait a min-
                        if merchantOpen == true then
                            ShowItems()
                            HideItems()
                        end
                        -- Oh, there you are!

                        -- Now, why did I let you go? DUN DUN DUNNNNNNNN
                        -- SEASON 2 COMING SOON!

                    else

                        -- You're not going anywhere...
                        LockedItems[info1] = true

                        -- Wait a min-
                        if merchantOpen == true then
                            ShowItems()
                            HideItems()
                        end
                        -- Oh, there you are!

                        -- /rightytighty
                        -- Still alive in there?
                        -- /poke
                        print("|cFFFF8400[LockItems] |cFFFFFF00Item |cFF00FFFFlocked.")
                        -- Yeah, just you wait...

                        -- SEASON 2 COMING SOON!

                    end

                end

            else

                -- /puthandbackinpocket
                print("|cFFFF8400[LockItems] |cFFFFFF00Pick an item up before locking/unlocking.")

            end

        end)

    end)

-------------------
-- Get Your Fade On
-------------------

lockedItemsFrame = CreateFrame("Frame", nil, UIParent)
lockedItemsFrame:RegisterEvent("MERCHANT_SHOW")
lockedItemsFrame:RegisterEvent("BAG_OPEN")
lockedItemsFrame:RegisterEvent("ITEM_LOCK_CHANGED")
lockedItemsFrame:RegisterEvent("MERCHANT_CLOSED")

merchantOpen = false

function eventHandler(self, event, ...)

    -- Hello good shopkeeper!
    -- /wave
    if ( event == "MERCHANT_SHOW") then

        -- Show me your wares!
        merchantOpen = true

    end

    -- I really need to tidy this place up
    if ( event == "ITEM_LOCK_CHANGED" and not CursorHasItem() ) then

        if ( merchantOpen == true ) then

            -- Can you give me just a sec?
            ShowItems()
            HideItems()
            -- Okay, I'm ready now. Thanks for waiting!

        end

    end

    if ( event == "MERCHANT_SHOW" or event == "BAG_OPEN" ) then

        if merchantOpen == true then

            -- Uh Uh Uh! You didn't say the magic word!
            HideItems()

        end

    elseif event == "MERCHANT_CLOSED" then

        merchantOpen = false

        -- Dodgy b*****d! I'll keep you safe little ones.
        ShowItems()

    end

end

lockedItemsFrame:SetScript("OnEvent", eventHandler)

------------------------------------------------------------------------------
-- The parts you'll be tempted to steal but won't, cause you're not like that.
------------------------------------------------------------------------------

HideItems = function ()
    C_Timer.After( .01 , function()
        local editbox=ChatEdit_ChooseBoxForSend(DEFAULT_CHAT_FRAME)
        if ( LockedItems ~= nil ) then
            for k, v in pairs(LockedItems) do
                if AdiBagsContainer1 ~= nil then
                    local childFrames = { AdiBagsContainer1:GetChildren() };
                    for _, child in ipairs(childFrames) do
                        if(child:GetName() ~= nil) then
                            if strmatch(child:GetName(), "AdiBagsItemContainer") then
                                local subchildFrames = { child:GetChildren() };

                                for _, child in ipairs(subchildFrames) do
                                    if child.itemId ~= nil then
                                        if k == child.itemId then
                                            ChatEdit_ActivateChat(editbox)
                                            editbox:SetText("/run " .. child:GetName() .. ":SetAlpha(.25)")
                                            ChatEdit_OnEnterPressed(editbox)
                                        end
                                    end
                                end
                            end
                        end
                    end
                else
                    for i = 0, 5, 1 do
                        for j = 1, GetContainerNumSlots(i) do
                            if GetContainerItemID(i, j) ~= nil then
                                if k == GetContainerItemID(i, j) then
                                    ChatEdit_ActivateChat(editbox)
                                    editbox:SetText("/run ContainerFrame" .. i + 1 .. "Item" .. GetContainerNumSlots(i) - (j - 1) .. ":SetAlpha(.25)")
                                    ChatEdit_OnEnterPressed(editbox)
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
end

ShowItems = function ()

    local editbox=ChatEdit_ChooseBoxForSend(DEFAULT_CHAT_FRAME)
    if AdiBagsContainer1 ~= nil then
        local childFrames = { AdiBagsContainer1:GetChildren() };
        local sections = {};

        for _, child in ipairs(childFrames) do

            if(child:GetName() ~= nil) then
                if strmatch(child:GetName(), "AdiBagsItemContainer") then
                    local subchildFrames = { child:GetChildren() };

                    for _, child in ipairs(subchildFrames) do
                        if child.itemId ~= nil then
                            ChatEdit_ActivateChat(editbox)
                            editbox:SetText("/run " .. child:GetName() .. ":SetAlpha(1)")
                            ChatEdit_OnEnterPressed(editbox)
                        end
                    end
                end
            end
        end
    else
        for i = 0, 5, 1 do
            for j = 1, GetContainerNumSlots(i) do
                ChatEdit_ActivateChat(editbox)
                editbox:SetText("/run ContainerFrame" .. i + 1 .. "Item" .. GetContainerNumSlots(i) - (j - 1) .. ":SetAlpha(1)")
                ChatEdit_OnEnterPressed(editbox)
            end
        end
    end
end
