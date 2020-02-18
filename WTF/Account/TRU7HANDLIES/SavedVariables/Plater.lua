
PlaterDB = {
	["profileKeys"] = {
		["Ahriak - Area 52"] = "Default",
		["Dulgan - Kilrogg"] = "Default",
		["Fhaykum - Area 52"] = "Default",
		["Rotrin - Area 52"] = "Default",
		["Thartuk - Area 52"] = "MyNewProfile",
	},
	["profiles"] = {
		["Default"] = {
			["non_targeted_alpha_enabled"] = true,
			["use_health_animation"] = true,
			["script_data"] = {
				{
					["Enabled"] = true,
					["Revision"] = 156,
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)    \n    --change the nameplate color to this if allowed\n    envTable.CanChangeNameplateColor = false --change to true to change the color\n    envTable.NameplateColor = \"pink\"\n    envTable.NameplateSizeOffset = 6 --increase the nameplate height by this value\n    envTable.GlowAlpha = 0.5 --amount of alpha in the outside glow effect\n    \n    --create a glow effect around the nameplate\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (unitFrame.healthBar, envTable.NameplateColor)\n    envTable.glowEffect:SetOffset (-27, 25, 9, -11)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() --\n    \n    --set the glow effect alpha\n    envTable.glowEffect:SetAlpha (envTable.GlowAlpha)\n    \nend\n\n--[=[\nUsing spellIDs for multi-language support\n\n135029 - A Knot of Snakes (Temple of Sethraliss)\n135388 - A Knot of Snakes (Temple of Sethraliss)\n134612 - Grasping Tentacles (Shrine of the Storm)\n133361 - Wasting Servant (Waycrest Manor)\n136330 - Soul Thorns (Waycrest Manor)\n130896 - Blackout Barrel (Freehold)\n129758 - Irontide Grenadier (Freehold)\n131009 - Spirit of Gold (Atal`Dazar)\n--]=]",
					["Icon"] = 135996,
					["Author"] = "Izimode-Azralon",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \nend\n\n\n",
					["ScriptType"] = 3,
					["Time"] = 1537884697,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can change the nameplate color\n    if (envTable.CanChangeNameplateColor) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n",
					["Name"] = "Unit - Important [Plater]",
					["PlaterCore"] = 1,
					["SpellIds"] = {
					},
					["Desc"] = "Highlight a nameplate of an important Add. Add the unit name or NpcID into the trigger box to add more.",
					["NpcNames"] = {
						"135029", -- [1]
						"134388", -- [2]
						"134612", -- [3]
						"133361", -- [4]
						"136330", -- [5]
						"130896", -- [6]
						"129758", -- [7]
						"Healing Tide Totem", -- [8]
						"131009", -- [9]
					},
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Hide()\n    \n    --restore the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)    \n    \nend\n\n\n",
				}, -- [1]
				{
					["Enabled"] = true,
					["Revision"] = 399,
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self)\n    \nend",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
					["Author"] = "Tercioo-Sylvanas",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.buffIconGlow:Show()\n    \nend",
					["ScriptType"] = 1,
					["Time"] = 1539013601,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \n    \nend",
					["Name"] = "Aura - Buff Alert [Plater]",
					["PlaterCore"] = 1,
					["SpellIds"] = {
						275826, -- [1]
						272888, -- [2]
						272659, -- [3]
						267901, -- [4]
						267830, -- [5]
						265393, -- [6]
					},
					["Desc"] = "Add the buff name in the trigger box.",
					["NpcNames"] = {
					},
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.buffIconGlow:Hide()\n    \nend",
				}, -- [2]
				{
					["Enabled"] = true,
					["Revision"] = 391,
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    local CONFIG_BACKGROUND_FLASH_DURATION = 0.8 --0.8\n    local CONFIG_BORDER_GLOW_ALPHA = 0.3 --0.3\n    local CONFIG_SHAKE_DURATION = 0.2 --0.2\n    local CONFIG_SHAKE_AMPLITUDE = 5 --5\n    \n    --create a glow effect in the border of the cast bar\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (self)\n    envTable.glowEffect:SetOffset (-32, 30, 7, -9)\n    envTable.glowEffect:SetAlpha (CONFIG_BORDER_GLOW_ALPHA)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() \n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+40, self:GetHeight()+20, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, 1)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, CONFIG_SHAKE_DURATION, CONFIG_SHAKE_AMPLITUDE, 35, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))    \n    \n    \n    --update the config for the flash here so it wont need a /reload\n    fadeIn:SetDuration (CONFIG_BACKGROUND_FLASH_DURATION/2)\n    fadeOut:SetDuration (CONFIG_BACKGROUND_FLASH_DURATION/2)    \n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = CONFIG_SHAKE_AMPLITUDE\n    envTable.FrameShake.OriginalDuration = CONFIG_SHAKE_DURATION  \n    \nend",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
					["Author"] = "Bombad�o-Azralon",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    \n    envTable.BackgroundFlash:Play()\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \nend\n\n\n",
					["ScriptType"] = 2,
					["Time"] = 1561923707,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Name"] = "Cast - Very Important [Plater]",
					["PlaterCore"] = 1,
					["SpellIds"] = {
						257785, -- [1]
						267237, -- [2]
						266951, -- [3]
						267273, -- [4]
						267433, -- [5]
						263066, -- [6]
						255577, -- [7]
						255371, -- [8]
					},
					["Desc"] = "Highlight a very important cast applying several effects into the Cast Bar. Add spell in the Add Trigger field.",
					["NpcNames"] = {
					},
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Hide()\n    \n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame:StopFrameShake (envTable.FrameShake)    \n    \nend\n\n\n",
				}, -- [3]
				{
					["Enabled"] = true,
					["Revision"] = 324,
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = 3\n    envTable.GlowAlpha = .45\n    envTable.ShowArrow = true\n    envTable.ArrowAlpha = .45    \n    envTable.HealthBarColor = \"orange\"\n    \n    --custom frames\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (unitFrame.healthBar)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() \n    envTable.glowEffect:SetOffset (-27, 25, 6, -8)\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 32\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\CastingBar\\UI-CastingBar-Spark]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = 8\n    envTable.topArrow.height = 8\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
					["Icon"] = 2175503,
					["Author"] = "Bombad�o-Azralon",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 32\n    \n    envTable.glowEffect.Texture:SetAlpha (envTable.GlowAlpha)\n    \n    \nend\n\n\n\n\n\n\n",
					["ScriptType"] = 2,
					["Time"] = 1540663131,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-16, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0.016\n    \n    --update the health bar color coloring from yellow to red\n    --Plater.SetNameplateColor (unitFrame, max (envTable._CastPercent/100, .66), abs (envTable._CastPercent/100 - 1), 0, 1)\n    \n    Plater.SetNameplateColor (unitFrame, envTable.HealthBarColor)\n    envTable.glowEffect.Texture:SetAlpha (envTable.GlowAlpha)\n    \nend\n\n\n",
					["Name"] = "Explosion Affix M+ [Plater]",
					["PlaterCore"] = 1,
					["SpellIds"] = {
						240446, -- [1]
						273577, -- [2]
					},
					["Desc"] = "Apply several animations when the explosion orb cast starts on a Mythic Dungeon with Explosion Affix",
					["NpcNames"] = {
					},
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.glowEffect:Hide()\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
				}, -- [4]
				{
					["Enabled"] = true,
					["Revision"] = 232,
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --creates a glow around the icon\n    envTable.debuffIconGlow = envTable.debuffIconGlow or Plater.CreateIconGlow (self)\n    \nend\n\n\n",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
					["Author"] = "Tercioo-Sylvanas",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.debuffIconGlow:Show()\n    \nend\n\n\n",
					["ScriptType"] = 1,
					["Time"] = 1538429739,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Name"] = "Aura - Debuff Alert [Plater]",
					["PlaterCore"] = 1,
					["SpellIds"] = {
					},
					["Desc"] = "Add the debuff name in the trigger box.",
					["NpcNames"] = {
					},
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.debuffIconGlow:Hide()\n    \nend\n\n\n",
				}, -- [5]
				{
					["Enabled"] = true,
					["Revision"] = 574,
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --https://www.wowhead.com/spell=253583/fiery-enchant\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    \n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = \"darkorange\"\n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = 0.4\n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = 5\n    \n    \n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, 0.2, 5, 35, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()        \n    \nend\n\n\n",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
					["Author"] = "Tercioo-Sylvanas",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \nend\n\n\n\n\n\n\n\n\n",
					["ScriptType"] = 2,
					["Time"] = 1561924439,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Name"] = "Cast - Big Alert [Plater]",
					["PlaterCore"] = 1,
					["SpellIds"] = {
						258153, -- [1]
						258313, -- [2]
						257069, -- [3]
						274569, -- [4]
						278020, -- [5]
						261635, -- [6]
						272700, -- [7]
						280404, -- [8]
						268030, -- [9]
						265368, -- [10]
						263891, -- [11]
						264520, -- [12]
						265407, -- [13]
						278567, -- [14]
						278602, -- [15]
						258128, -- [16]
						257791, -- [17]
						258938, -- [18]
						265089, -- [19]
						272183, -- [20]
						256060, -- [21]
						257397, -- [22]
						257899, -- [23]
						269972, -- [24]
						270901, -- [25]
						270492, -- [26]
						268129, -- [27]
						268709, -- [28]
						263215, -- [29]
						268797, -- [30]
						262540, -- [31]
						262554, -- [32]
						253517, -- [33]
						255041, -- [34]
						252781, -- [35]
						250368, -- [36]
						258777, -- [37]
					},
					["Desc"] = "Flash, Bounce and Red Color the CastBar border when when an important cast is happening. Add spell in the Add Trigger field.",
					["NpcNames"] = {
					},
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end    \n    \n    --restore the cast bar to its original height\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n        envTable.OriginalHeight = nil\n    end\n    \n    --stop the camera shake\n    unitFrame:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \nend\n\n\n\n\n\n",
				}, -- [6]
				{
					["Enabled"] = true,
					["Revision"] = 376,
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    \n    --flash duration\n    local CONFIG_FLASH_DURATION = 0.6\n    \n    --manually create a new texture for the flash animation\n    if (not envTable.SmallFlashTexture) then\n        envTable.SmallFlashTexture = envTable.SmallFlashTexture or Plater:CreateImage (unitFrame.castBar)\n        envTable.SmallFlashTexture:SetColorTexture (1, 1, 1)\n        envTable.SmallFlashTexture:SetAllPoints()\n    end\n    \n    --manually create a flash animation using the framework\n    if (not envTable.SmallFlashAnimationHub) then \n        \n        local onPlay = function()\n            envTable.SmallFlashTexture:Show()\n        end\n        \n        local onFinished = function()\n            envTable.SmallFlashTexture:Hide()\n        end\n        \n        local animationHub = Plater:CreateAnimationHub (envTable.SmallFlashTexture, onPlay, onFinished)\n        Plater:CreateAnimation (animationHub, \"Alpha\", 1, CONFIG_FLASH_DURATION/2, 0, .6)\n        Plater:CreateAnimation (animationHub, \"Alpha\", 2, CONFIG_FLASH_DURATION/2, 1, 0)\n        \n        envTable.SmallFlashAnimationHub = animationHub\n    end\n    \n    \n    \nend\n\n\n\n\n\n\n\n",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
					["Author"] = "Tercioo-Sylvanas",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.SmallFlashAnimationHub:Play()\n    \nend\n\n\n",
					["ScriptType"] = 2,
					["Time"] = 1539201768,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \nend\n\n\n",
					["Name"] = "Cast - Small Alert [Plater]",
					["PlaterCore"] = 1,
					["SpellIds"] = {
						275192, -- [1]
						265912, -- [2]
						274438, -- [3]
						268317, -- [4]
						268375, -- [5]
						276767, -- [6]
						264105, -- [7]
						265876, -- [8]
						270464, -- [9]
						266106, -- [10]
						272180, -- [11]
						278961, -- [12]
						278755, -- [13]
						265468, -- [14]
						256405, -- [15]
						256897, -- [16]
						264101, -- [17]
						280604, -- [18]
						268702, -- [19]
						281621, -- [20]
						262515, -- [21]
						255824, -- [22]
						253583, -- [23]
						250096, -- [24]
					},
					["Desc"] = "Flashes the Cast Bar when a spell in the trigger list is Cast. Add spell in the Add Trigger field.",
					["NpcNames"] = {
					},
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.SmallFlashAnimationHub:Stop()\n    \nend\n\n\n",
				}, -- [7]
				{
					["Enabled"] = true,
					["Revision"] = 106,
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --color to set the nameplate\n    envTable.NameplateColor = \"gray\"\n    \nend\n\n\n",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_invalid",
					["Author"] = "Izimode-Azralon",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["ScriptType"] = 1,
					["Time"] = 1538256464,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --only change the nameplate color in combat\n    if (InCombatLockdown()) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n\n\n",
					["Name"] = "Aura - Invalidate Unit [Plater]",
					["PlaterCore"] = 1,
					["SpellIds"] = {
						261265, -- [1]
						261266, -- [2]
						271590, -- [3]
					},
					["Desc"] = "When an aura makes the unit invulnarable and you don't want to attack it. Add spell in the Add Trigger field.",
					["NpcNames"] = {
					},
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
				}, -- [8]
				{
					["Enabled"] = true,
					["Revision"] = 59,
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings:\n    do\n        \n        --change the nameplate color to this color\n        --can use color names: \"red\", \"yellow\"\n        --can use color hex: \"#FF0000\", \"#FFFF00\"\n        --con use color table: {1, 0, 0}, {1, 1, 0}\n        \n        envTable.Color = \"green\"\n        \n        --if true, it'll replace the health info with the unit name\n        envTable.ReplaceHealthWithName = false\n        \n        --use flash when the unit is shown in the screen\n        envTable.FlashNameplate = true\n        \n    end\n    \n    --private:\n    do\n        --create a flash for when the unit if shown\n        envTable.smallFlash = envTable.smallFlash or Plater.CreateFlash (unitFrame.healthBar, 0.15, 1, envTable.Color)\n        \n    end\n    \nend\n\n--[=[\n\nNpc IDS:\n\n141851: Spawn of G'Huun on Mythic Dungeons\n\n\n--]=]\n\n\n\n\n",
					["Icon"] = 135024,
					["Author"] = "Izimode-Azralon",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can flash the nameplate\n    if (envTable.FlashNameplate) then\n        envTable.smallFlash:Play()\n    end\n    \nend\n\n\n\n\n\n\n\n\n",
					["ScriptType"] = 3,
					["Time"] = 1543253273,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --adjust the nameplate color\n    Plater.SetNameplateColor (unitFrame, envTable.Color)\n    \n    --check if can replace the health amount with the unit name\n    if (envTable.ReplaceHealthWithName) then\n        \n        local healthPercent = format (\"%.1f\", unitFrame.healthBar.CurrentHealth / unitFrame.healthBar.CurrentHealthMax *100)\n        \n        unitFrame.healthBar.lifePercent:SetText (unitFrame.namePlateUnitName .. \"  (\" .. healthPercent  .. \"%)\")\n        \n    end\n    \nend\n\n\n",
					["Name"] = "Color Change [Plater]",
					["PlaterCore"] = 1,
					["SpellIds"] = {
					},
					["Desc"] = "Add a unitID or unit name in 'Add Trigger' entry. See the constructor script for options.",
					["NpcNames"] = {
						"141851", -- [1]
					},
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --make plater refresh the nameplate color\n    Plater.RefreshNameplateColor (unitFrame)\n    \n        envTable.smallFlash:Stop()\n    \nend\n\n\n",
				}, -- [9]
				{
					["Enabled"] = true,
					["Revision"] = 157,
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (require a /reload after editing any setting)\n    do\n        --blink and glow\n        envTable.BlinkEnabled = true --set to 'false' to disable blinks\n        envTable.GlowEnabled = true --set to 'false' to disable glows\n        envTable.ChangeNameplateColor = true; --set to 'true' to enable nameplate color change\n        envTable.TimeLeftToBlink = 4.5; --in seconds, affects the blink effect only\n        envTable.BlinkSpeed = 1.0; --time to complete a blink loop\n        envTable.BlinkColor = \"white\"; --color of the blink\n        envTable.BlinkMaxAlpha = 0.50; --max transparency in the animation loop (1.0 is full opaque)\n        envTable.NameplateColor = \"darkred\"; --nameplate color if ChangeNameplateColor is true\n        \n        --text color\n        envTable.TimerColorEnabled = true --set to 'false' to disable changes in the color of the time left text\n        envTable.TimeLeftWarning = 8.0; --in seconds, affects the color of the text\n        envTable.TimeLeftCritical = 3.0; --in seconds, affects the color of the text    \n        envTable.TextColor_Warning = \"yellow\"; --color when the time left entered in a warning zone\n        envTable.TextColor_Critical = \"red\"; --color when the time left is critical\n        \n        --list of spellIDs to ignore\n        envTable.IgnoredSpellID = {\n            [12] = true, --use a simple comma here\n            [13] = true,\n        }\n    end\n    \n    \n    --private\n    do\n        envTable.blinkTexture = Plater:CreateImage (self, \"\", 1, 1, \"overlay\")\n        envTable.blinkTexture:SetPoint ('center', 0, 0)\n        envTable.blinkTexture:Hide()\n        \n        local onPlay = function()\n            envTable.blinkTexture:Show() \n            envTable.blinkTexture.color = envTable.BlinkColor\n        end\n        local onStop = function()\n            envTable.blinkTexture:Hide()  \n        end\n        envTable.blinkAnimation = Plater:CreateAnimationHub (envTable.blinkTexture, onPlay, onStop)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 1, envTable.BlinkSpeed / 2, 0, envTable.BlinkMaxAlpha)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 2, envTable.BlinkSpeed / 2, envTable.BlinkMaxAlpha, 0)\n        \n        envTable.glowEffect = envTable.glowEffect or Plater.CreateIconGlow (self)\n        --envTable.glowEffect:Show() --envTable.glowEffect:Hide()\n        \n    end\n    \nend\n\n\n\n\n",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_blink",
					["Author"] = "Izimode-Azralon",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.blinkTexture:SetSize (self:GetSize())\n    \nend\n\n\n",
					["ScriptType"] = 1,
					["Time"] = 1547991413,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    local timeLeft = envTable._RemainingTime\n    \n    --check if the spellID isn't being ignored\n    if (envTable.IgnoredSpellID [envTable._SpellID]) then\n        return\n    end\n    \n    --check the time left and start or stop the blink animation and also check if the time left is > zero\n    if ((envTable.BlinkEnabled or envTable.GlowEnabled) and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftToBlink) then\n            --blink effect\n            if (envTable.BlinkEnabled) then\n                if (not envTable.blinkAnimation:IsPlaying()) then\n                    envTable.blinkAnimation:Play()\n                end\n            end\n            --glow effect\n            if (envTable.GlowEnabled) then\n                envTable.glowEffect:Show()\n            end\n            --nameplate color\n            if (envTable.ChangeNameplateColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n            end\n        else\n            --blink effect\n            if (envTable.blinkAnimation:IsPlaying()) then\n                envTable.blinkAnimation:Stop()\n            end\n            --glow effect\n            if (envTable.GlowEnabled and envTable.glowEffect:IsShown()) then\n                envTable.glowEffect:Hide()\n            end\n        end\n    end\n    \n    --timer color\n    if (envTable.TimerColorEnabled and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftCritical) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Critical)\n        elseif (timeLeft < envTable.TimeLeftWarning) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Warning)        \n        else\n            Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\n        end\n    end\n    \nend",
					["Name"] = "Aura - Blink by Time Left [Plater]",
					["PlaterCore"] = 1,
					["SpellIds"] = {
					},
					["Desc"] = "Blink, change the number and nameplate color. Add the debuffs int he trigger box. Set settings on constructor script.",
					["NpcNames"] = {
					},
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.blinkAnimation:Stop()\n    envTable.blinkTexture:Hide()\n    envTable.blinkAnimation:Stop()\n    envTable.glowEffect:Stop()\n    Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\nend\n\n\n",
				}, -- [10]
				{
					["Enabled"] = false,
					["Revision"] = 45,
					["ConstructorCode"] = "--gray lines are comments and doesn't affect the code\n\n--1) add the aura you want by typing its name or spellID into the \"Add Trigger\" and click the \"Add\" button.\n--2) the border will use the default color set below, to a custom color type aura name and the color you want in the BorderColorByAura table.\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --default color if the aura name isn't found in the Color By Aura table below\n    envTable.DefaultBorderColor = \"orange\"\n    \n    --transparency, affect all borders\n    envTable.BorderAlpha = 1.0\n    \n    --add the aura name and the color, \n    envTable.BorderColorByAura = {\n        \n        --examples:\n        --[\"Aura Name\"] = \"yellow\", --using regular aura name | using the name of the color\n        --[\"aura name\"] = \"#FFFF00\", --using lower case in the aura name |using html #hex for the color\n        --[54214] = {1, 1, 0}, --using the spellID instead of the name | using rgb table (0 to 1) for the color\n        --color table uses zero to one values: 255 = 1.0, 127 = 0.5, orange color = {1, 0.7, 0}\n        \n        --add your custom border colors below:\n        \n        [\"Aura Name\"] = {1, .5, 0}, --example to copy/paste\n        \n    }\n    \n    \nend\n\n\n\n\n",
					["Icon"] = 133006,
					["Author"] = "Izimode-Azralon",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the aura name in lower case\n    local auraLowerName = string.lower (envTable._SpellName)\n    \n    --attempt to get a custom color added by the user in the constructor script\n    local hasCustomBorderColor = envTable.BorderColorByAura [auraLowerName] or envTable.BorderColorByAura [envTable._SpellName] or envTable.BorderColorByAura [envTable._SpellID]\n    \n    --save the custom color\n    envTable.CustomBorderColor = hasCustomBorderColor\n    \nend\n\n\n",
					["ScriptType"] = 1,
					["Time"] = 1543680853,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the custom color added by the user or the default color\n    local color = envTable.CustomBorderColor or envTable.DefaultBorderColor\n    --parse the color since it can be a color name, hex or color table\n    local r, g, b = DetailsFramework:ParseColors (color)\n    \n    --set the border color\n    self:SetBackdropBorderColor (r, g, b, envTable.BorderAlpha)\n    \nend\n\n\n\n\n",
					["Name"] = "Aura - Border Color [Plater]",
					["PlaterCore"] = 1,
					["SpellIds"] = {
					},
					["Desc"] = "Add a border to an aura icon. Add the aura into the Add Trigger entry. You can customize the icon color at the constructor script.",
					["NpcNames"] = {
					},
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --reset the border color\n    self:SetBackdropBorderColor (0, 0, 0, 0)\n    \nend\n\n\n",
				}, -- [11]
				{
					["Enabled"] = true,
					["Revision"] = 131,
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount = Plater:CreateLabel (unitFrame, \"\", 16, \"silver\");\n    envTable.EnergyAmount:SetPoint (\"bottom\", unitFrame, \"top\", 0, 18);\nend\n\n--[=[\n\n\n--]=]",
					["Icon"] = 136048,
					["Author"] = "Celian-Sylvanas",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Show()\nend\n\n\n",
					["ScriptType"] = 3,
					["Time"] = 1539015649,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount.text = \"\" .. UnitPower (unitId);\nend\n\n\n",
					["Name"] = "UnitPower [Plater]",
					["PlaterCore"] = 1,
					["SpellIds"] = {
					},
					["Desc"] = "Show the energy amount above the nameplate",
					["NpcNames"] = {
						"Guardian of Yogg-Saron", -- [1]
					},
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Hide()\nend\n\n\n",
				}, -- [12]
				{
					["Enabled"] = true,
					["Revision"] = 171,
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.movingArrow = envTable.movingArrow or Plater:CreateImage (self, [[Interface\\PETBATTLES\\PetBattle-StatIcons]], 16, self:GetHeight(), \"background\", {0, 15/32, 18/32, 30/32})\n    \n    envTable.movingArrow:SetAlpha (0.275)\n    --envTable.movingArrow:SetDesaturated (true)\n    \n    envTable.movingAnimation = envTable.movingAnimation or Plater:CreateAnimationHub (envTable.movingArrow, \n        function() \n            envTable.movingArrow:Show() \n            envTable.movingArrow:SetPoint(\"left\", 0, 0)\n        end, \n        function() envTable.movingArrow:Hide() end)\n    \n    envTable.movingAnimation:SetLooping (\"REPEAT\")\n    \n    local animation = Plater:CreateAnimation (envTable.movingAnimation, \"translation\", 1, 0.2, self:GetWidth()-16, 0)\n    \n    \n    \nend\n\n\n",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
					["Author"] = "Izimode-Azralon",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.movingAnimation:Play()\nend\n\n\n",
					["ScriptType"] = 2,
					["Time"] = 1539201849,
					["UpdateCode"] = "		function (self, unitId, unitFrame, envTable)\n			\n		end\n	",
					["Name"] = "Cast - Frontal Cone [Plater]",
					["PlaterCore"] = 1,
					["SpellIds"] = {
						255952, -- [1]
						257426, -- [2]
						274400, -- [3]
						272609, -- [4]
						269843, -- [5]
						269029, -- [6]
						272827, -- [7]
						269266, -- [8]
						263912, -- [9]
						264923, -- [10]
						258864, -- [11]
						256955, -- [12]
						265540, -- [13]
						260793, -- [14]
						270003, -- [15]
						270507, -- [16]
						257337, -- [17]
						268415, -- [18]
						275907, -- [19]
						268865, -- [20]
						260669, -- [21]
						260280, -- [22]
						253239, -- [23]
						265541, -- [24]
						250258, -- [25]
					},
					["Desc"] = "Does an animation for casts that affect the frontal area of the enemy. Add spell in the Add Trigger field.",
					["NpcNames"] = {
					},
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.movingAnimation:Stop()\nend\n\n\n",
				}, -- [13]
				{
					["Enabled"] = true,
					["Revision"] = 190,
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.BuffFrame, \"top\", 0, 10);    \n    \n    envTable.FixateIcon = Plater:CreateImage (unitFrame, 236188, 16, 16, \"overlay\");\n    envTable.FixateIcon:SetPoint (\"bottom\", envTable.FixateTarget, \"top\", 0, 4);    \n    \nend\n\n\n\n\n\n\n\n\n",
					["Icon"] = 1029718,
					["Author"] = "Celian-Sylvanas",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Show();\n    envTable.FixateIcon:Show();\n    \nend\n\n\n",
					["ScriptType"] = 1,
					["Time"] = 1539187387,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    local targetName = UnitName (unitId .. \"target\");\n    if (targetName) then\n        local _, class = UnitClass (unitId .. \"target\");\n        targetName = Plater.SetTextColorByClass (unitId .. \"target\", targetName);\n        envTable.FixateTarget.text = targetName;\n    end    \nend\n\n\n",
					["Name"] = "Fixate [Plater]",
					["PlaterCore"] = 1,
					["SpellIds"] = {
						272584, -- [1]
						244653, -- [2]
					},
					["Desc"] = "Show above the nameplate who is the player fixated",
					["NpcNames"] = {
					},
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n\n",
				}, -- [14]
				{
					["Enabled"] = true,
					["Revision"] = 194,
					["ConstructorCode"] = "--todo: add npc ids for multilanguage support\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.TextAboveNameplate = \"** On You **\"\n    envTable.NameplateColor = \"green\"\n    \n    --label to show the text above the nameplate\n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.healthBar, \"top\", 0, 30);\n    \n    --the spell casted by the npc in the trigger list needs to be in the list below as well\n    local spellList = {\n        [268074] = \"Dark Purpose\", --G'huun Mythic Add\n        [260954] = \"Iron Gaze\", --Sergeant Bainbridge - Siege of Boralus\n        [257739] = \"Blind Rage\", --Blacktooth Scrapper - Freehold\n        [257314] = \"Black Powder Bomb\", --Irontide Grenadier - Freehold\n        [266107] = \"Thirst For Blood\", --Feral Bloodswarmer - The Underrot\n        [257582] = \"Raging Gaze\", --Earthrager - The MOTHERLODE!!\n        [262377] = \"Seek and Destroy\", --Crawler Mine - The MOTHERLODE!!\n        [257407] = \"Pursuit\", --Rezan - Atal'Dazar\n        --[] = \"\" --       \n        \n    }\n    \n    --build the list with localized spell names\n    envTable.FixateDebuffs = {}\n    for spellID, enUSSpellName in pairs (spellList) do\n        local localizedSpellName = GetSpellInfo (spellID)\n        envTable.FixateDebuffs [localizedSpellName or enUSSpellName] = true\n    end\n    \n    --debug - smuggled crawg\n    envTable.FixateDebuffs [\"Jagged Maw\"] = true\n    \nend\n\n--[=[\nNpcIDs:\n136461: Spawn of G'huun (mythic uldir G'huun)\n\n--]=]\n\n\n\n\n",
					["Icon"] = 841383,
					["Author"] = "Tecno-Azralon",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["ScriptType"] = 3,
					["Time"] = 1543250950,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --swap this to true when it is fixated\n    local isFixated = false\n    \n    --check the debuffs the player has and see if any of these debuffs has been placed by this unit\n    for debuffId = 1, 40 do\n        local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (\"player\", debuffId)\n        \n        --cancel the loop if there's no more debuffs on the player\n        if (not name) then \n            break \n        end\n        \n        --check if the owner of the debuff is this unit\n        if (envTable.FixateDebuffs [name] and caster and UnitIsUnit (caster, unitId)) then\n            --the debuff the player has, has been placed by this unit, set the name above the unit name\n            envTable.FixateTarget:SetText (envTable.TextAboveNameplate)\n            envTable.FixateTarget:Show()\n            Plater.SetNameplateColor (unitFrame,  envTable.NameplateColor)\n            isFixated = true\n            \n            if (not envTable.IsFixated) then\n                envTable.IsFixated = true\n                Plater.FlashNameplateBody (unitFrame, \"fixate\", .2)\n            end\n        end\n        \n    end\n    \n    --check if the nameplate color is changed but isn't fixated any more\n    if (not isFixated and envTable.IsFixated) then\n        --refresh the nameplate color\n        Plater.RefreshNameplateColor (unitFrame)\n        --reset the text\n        envTable.FixateTarget:SetText (\"\")\n        \n        envTable.IsFixated = false\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					["Name"] = "Fixate On You [Plater]",
					["PlaterCore"] = 1,
					["SpellIds"] = {
						"spawn of g'huun", -- [1]
						"smuggled crawg", -- [2]
						"sergeant bainbridge", -- [3]
						"blacktooth scrapper", -- [4]
						"irontide grenadier", -- [5]
						"feral bloodswarmer", -- [6]
						"earthrager", -- [7]
						"crawler mine", -- [8]
						"rezan", -- [9]
					},
					["Desc"] = "When an enemy places a debuff and starts to chase you. This script changes the nameplate color and place your name above the nameplate as well.",
					["NpcNames"] = {
						"smuggled crawg", -- [1]
						"sergeant bainbridge", -- [2]
						"blacktooth scrapper", -- [3]
						"irontide grenadier", -- [4]
						"feral bloodswarmer", -- [5]
						"earthrager", -- [6]
						"crawler mine", -- [7]
						"rezan", -- [8]
						"136461", -- [9]
					},
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:SetText (\"\")\n    envTable.FixateTarget:Hide()\n    \n    envTable.IsFixated = false\n    \n    Plater.RefreshNameplateColor (unitFrame)\nend\n\n\n",
				}, -- [15]
			},
			["target_indicator"] = "Ornament",
			["hook_data"] = {
				{
					["Enabled"] = false,
					["Revision"] = 50,
					["HooksTemp"] = {
					},
					["Author"] = "Kastfall-Azralon",
					["Desc"] = "Easy way to change the color of an unit. Open the constructor script and follow the examples.",
					["Hooks"] = {
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --list of npcs and their colors, can be inserted:\n    --name of the unit\n    --name of the unit in lower case\n    --npcID of the unit\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    \n    envTable.NpcColors = {\n        \n        --examples, using the unit name in lower case, regular unit name and the unitID:\n        \n        [\"Thunderlord Windreader\"] = \"red\", --using regular mob name and color it as red\n        [\"thunderlord crag-leaper\"] = {1, 1, 0}, --using lower case and coloring it yellow\n        [75790] = \"#00FF00\", --using the ID of the unit and using green as color\n        \n        --insert the new mobs here:\n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n    } --close custom color bracket\n    \nend\n\n\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --attempt to get the color from the unit color list\n    local color = envTable.NpcColors [unitFrame.namePlateUnitNameLower] or envTable.NpcColors [unitFrame.namePlateUnitName] or envTable.NpcColors [unitFrame.namePlateNpcId]\n    \n    --if the color exists, set the health bar color\n    if (color) then\n        Plater.SetNameplateColor (unitFrame, color)\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n",
					},
					["Time"] = 1547392935,
					["PlaterCore"] = 1,
					["Name"] = "Color Automation [Plater]",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["role"] = {
						},
					},
					["Icon"] = "Interface\\AddOns\\Plater\\images\\color_bar",
					["LastHookEdited"] = "",
				}, -- [1]
				{
					["Enabled"] = false,
					["Revision"] = 59,
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Change the nameplate color when a nameplate does not have the auras set in the constructor script.",
					["Hooks"] = {
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    --Important: lines starting with double dashes are comments and are not part of the script\n    \n    --set this to true if you are not using threat colors in the health bar\n    envTable.ForceRefreshNameplateColor = true\n    \n    --if the unit does not have any of the following auras, it will be painted with the color listed below\n    --list of spells to track, can be the spell name (case-sensitive) or the spellID\n    envTable.TrackingAuras = {\n        --[\"Nightblade\"] = true, --this is an example using the spell name\n        --[195452] = true, --this is an example using the spellID\n        \n    }\n    \n    --which color the nameplate wil be changed\n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    --you may also use /plater colors\n    envTable.NameplateColor = \"pink\"\n    \nend",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --do nothing if the player isn't in combat\n    if (not Plater.IsInCombat()) then\n        return \n    end\n    \n    --do nothing if the unit isn't in combat\n    if (not unitFrame.InCombat) then\n        return\n    end\n    \n    --do nothing if the unit is the player it self\n    if (unitFrame.IsSelf) then\n        return\n    end\n    \n    --check the auras\n    local hasAura = false\n    \n    for auraName, _ in pairs (envTable.TrackingAuras) do\n        if (Plater.NameplateHasAura (unitFrame, auraName)) then\n            hasAura = true\n            break\n        end\n    end\n    \n    if (not hasAura) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    else\n        if (envTable.ForceRefreshNameplateColor) then\n            Plater.RefreshNameplateColor (unitFrame) \n        end\n    end    \n    \nend",
					},
					["Time"] = 1554138845,
					["PlaterCore"] = 1,
					["Name"] = "Don't Have Aura [Plater]",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["role"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["Icon"] = 136207,
					["LastHookEdited"] = "",
				}, -- [2]
				{
					["Enabled"] = false,
					["Revision"] = 176,
					["HooksTemp"] = {
					},
					["Author"] = "Tecno-Azralon",
					["Desc"] = "Add another border with more customizations. This border can also be manipulated by other scripts.",
					["Hooks"] = {
						["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --run constructor!\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    if (envTable.IsEnabled) then\n        if (unitFrame.IsSelf) then\n            if (envTable.ShowOnPersonalBar) then\n                envTable.BorderFrame:Show()\n            else\n                envTable.BorderFrame:Hide() \n            end\n        else\n            envTable.BorderFrame:Show()\n        end   \n    end\n    \nend   \n\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BorderFrame:Hide()\n    \nend\n\n\n",
						["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BorderFrame:Hide()\n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --border color\n    local borderColor = \"yellow\"\n    \n    --size of the border\n    local borderSize = 1\n    \n    --transparency\n    local borderAlpha = 1\n    \n    --enabled (set to false it you only want to use the extra border in other scripts)\n    local isEnabled = true\n    \n    --export border (allow the border to be used by other scripts)\n    --other scripts can use:\n    --unitFrame.healthBar.extraBorder:Show()\n    --unitFrame.healthBar.extraBorder:SetVertexColor (r, g, b)\n    --unitFrame.healthBar.extraBorder:SetBorderSizes (borderSize)\n    local canExportBorder = true\n    \n    --do not add the border to personal bar\n    local noPersonalBar = true\n    \n    --private\n    do\n        \n        local newBorder = CreateFrame (\"frame\", nil, unitFrame.healthBar, \"NamePlateFullBorderTemplate\")\n        envTable.BorderFrame = newBorder\n        \n        newBorder:SetBorderSizes (borderSize, borderSize, borderSize, borderSize)\n        newBorder:UpdateSizes()\n        \n        local r, g, b = DetailsFramework:ParseColors (borderColor)\n        newBorder:SetVertexColor (r, g, b, borderAlpha)\n        \n        envTable.ShowOnPersonalBar = not noPersonalBar\n        \n        if (canExportBorder) then\n            unitFrame.healthBar.extraBorder = newBorder\n        end\n        \n        if (not isEnabled) then\n            envTable.IsEnabled = false\n        else\n            envTable.IsEnabled = true\n        end\n    end\n    \nend\n\n\n",
					},
					["Time"] = 1547409079,
					["PlaterCore"] = 1,
					["Name"] = "Extra Border [Plater]",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["race"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["Icon"] = 133689,
					["LastHookEdited"] = "",
				}, -- [3]
				{
					["Enabled"] = false,
					["Revision"] = 73,
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Hide neutral units, show when selected, see the constructor script for options.",
					["Hooks"] = {
						["Leave Combat"] = "function (self, unitId, unitFrame, envTable)\n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat) then\n            envTable.HideNameplate (unitFrame)\n        end\n    end\nend\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end\n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat and InCombatLockdown()) then\n            return\n        end\n        \n        envTable.HideNameplate (unitFrame)\n    end\n    \nend\n\n\n\n\n\n\n",
						["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat and InCombatLockdown()) then\n            return\n        end\n        \n        --check the unit reaction\n        if (unitFrame.namePlateIsTarget) then\n            envTable.ShowNameplate (unitFrame)\n            \n        else\n            envTable.HideNameplate (unitFrame)\n            \n        end    \n    end\n    \nend\n\n\n\n\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        envTable.ShowNameplate (unitFrame)\n    end\n    \nend\n\n\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when plater finishes an update on the nameplate\n    --check within the envTable if the healthBar of this nameplate should be hidden\n    if (envTable.IsHidden) then\n        if (unitFrame.healthBar:IsShown()) then\n            envTable.HideNameplate (unitFrame)\n        end\n    end\n    \nend\n\n\n\n\n",
						["Enter Combat"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat) then\n            envTable.ShowNameplate (unitFrame)\n        end\n    end\nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.OnlyInOpenWorld = true;\n    envTable.ShowInCombat = true;\n    \n    --consts\n    envTable.REACTION_NEUTRAL = 4;\n    \n    --functions to hide and show the healthBar\n    function envTable.HideNameplate (unitFrame)\n        Plater.HideHealthBar (unitFrame)\n        Plater.DisableHighlight (unitFrame)\n        envTable.IsHidden = true\n    end\n    \n    function envTable.ShowNameplate (unitFrame)\n        Plater.ShowHealthBar (unitFrame)\n        Plater.EnableHighlight (unitFrame)\n        envTable.IsHidden = false\n    end\n    \nend\n\n\n\n\n",
					},
					["Time"] = 1541606242,
					["PlaterCore"] = 1,
					["Name"] = "Hide Neutral Units [Plater]",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["race"] = {
						},
					},
					["Icon"] = 1990989,
					["LastHookEdited"] = "",
				}, -- [4]
				{
					["Enabled"] = true,
					["Revision"] = 55,
					["HooksTemp"] = {
					},
					["Author"] = "Kastfall-Azralon",
					["Desc"] = "Script for Stormwall Blockade encounter on Battle for Dazzar'alor",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.TemptingSiren) then\n        \n        if (envTable.Colors.TemptingSiren) then\n            Plater.SetNameplateColor (unitFrame, envTable.Colors.TemptingSiren)\n        end\n        \n    end\n    \n    \nend\n\n\n\n\n\n\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.TemptingSiren) then\n        \n        if (envTable.NameplateHeight.TemptingSiren) then\n            \n            Plater.SetNameplateSize (unitFrame, nil, envTable.NameplateHeight.TemptingSiren)\n            \n        end\n        \n    end    \n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --nameplate colors for unit\n    envTable.Colors = {}\n    envTable.Colors.TemptingSiren = \"orange\"\n    \n    --npcID\n    envTable.NpcIDs = {}\n    envTable.NpcIDs.TemptingSiren = 146436\n    \n    --nameplate height for each unit\n    envTable.NameplateHeight = {}\n    envTable.NameplateHeight.TemptingSiren = 18\n    \n    \n    \nend\n\n\n",
					},
					["Time"] = 1548117267,
					["PlaterCore"] = 1,
					["Name"] = "Stormwall Encounter [Plater]",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["role"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
							2280, -- [1]
							["Enabled"] = true,
						},
						["spec"] = {
						},
					},
					["Icon"] = "Interface\\AddOns\\Plater\\images\\encounter_stormwall_blockade",
					["LastHookEdited"] = "",
				}, -- [5]
				{
					["Enabled"] = true,
					["Revision"] = 220,
					["HooksTemp"] = {
					},
					["Author"] = "Kastfall-Azralon",
					["Desc"] = "Script for the Jaina encounter on Battle for Dazzar'alor",
					["Hooks"] = {
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --Unexploded Ordinance\n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.UnexplodedOrdinance) then\n        \n        --make the life percent be bigger than the regular size\n        --so it's better to see the health percent of the barrel\n        local currentSize = Plater.db.profile.plate_config.enemynpc.percent_text_size\n        Plater:SetFontSize (unitFrame.healthBar.lifePercent, currentSize + envTable.UnexplodedOrdinanceTextSizeIncrease)\n    end\n    \n    if (envTable.IncreaseSize [unitFrame.namePlateNpcId]) then\n        local currentHeight = unitFrame.healthBar:GetHeight()\n        Plater.SetNameplateSize (unitFrame, nil, currentHeight + envTable.IncreaseSize [unitFrame.namePlateNpcId])\n    end\n    \nend\n\n\n\n\n\n\n",
						["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    if (envTable.UnexplodedOrdinanceCast and envTable._SpellID == envTable.UnexplodedOrdinanceSpellID) then\n        Plater.SetCastBarSize (unitFrame, nil, envTable.UnexplodedOrdinanceCastBarHeight)\n        Plater:SetFontSize (unitFrame.castBar.percentText, envTable.UnexplodedOrdinanceTimerSize)\n    end\nend\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    --reset the health percent text size\n    local currentSize = Plater.db.profile.plate_config.enemynpc.percent_text_size\n    Plater:SetFontSize (unitFrame.healthBar.lifePercent, currentSize)    \n    \nend\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --Override the color\n    if (envTable.Colors [unitFrame.namePlateNpcId]) then\n        Plater.SetNameplateColor (unitFrame, envTable.Colors [unitFrame.namePlateNpcId])\n    end    \n    \n    --Show the name of the unit in the Ice Block nameplate\n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.IceBlock) then\n        --find which player this block are holding\n        for i = 1, GetNumGroupMembers() do\n            local unit = \"raid\" .. i\n            if (UnitExists (unit)) then\n                for debuffId = 1, 40 do\n                    local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (unit, debuffId)\n                    \n                    --cancel the loop if there's no more debuffs on the player\n                    if (not name) then \n                        break \n                    end                    \n                    \n                    --check if who casted this debuff is the unit shown on this nameplate\n                    if (UnitIsUnit (caster or \"\", unitId)) then\n                        local unitName = UnitName (unit)\n                        \n                        --color the text by the class\n                        unitName = Plater.SetTextColorByClass (unit, unitName)\n                        \n                        --add the role icon\n                        if (Details) then\n                            local role = UnitGroupRolesAssigned (unit)\n                            unitName = Details:AddRoleIcon (unitName, role, 12)\n                        end\n                        \n                        unitFrame.unitName:SetText (unitName)\n                        unitFrame.castBar.Text:SetText (unitName)\n                        break\n                    end\n                    \n                end\n            else\n                break\n            end\n        end\n    end\nend",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --nameplate colors for unit\n    envTable.Colors = {}\n    envTable.Colors [148631] = \"orange\" --Unexploded Ordinance\n    envTable.Colors [148522] = \"white\" --Ice Block\n    \n    --increase the nameplate height for these units\n    envTable.IncreaseSize = {}\n    envTable.IncreaseSize [148522] = 4 --Ice Block (increase in 4 pixels)\n    \n    --increase the size of the life percent for the nameplate of the barrel\n    envTable.UnexplodedOrdinanceTextSizeIncrease = 3\n    \n    --increase the castbar size for the unexploded ordinance explosion cast\n    envTable.UnexplodedOrdinanceCast = true\n    envTable.UnexplodedOrdinanceSpellID = 288221 --12058 --(debug)\n    envTable.UnexplodedOrdinanceCastBarHeight = 18\n    envTable.UnexplodedOrdinanceTimerSize = 18\n    \n    --npcIDs\n    envTable.NpcIDs = {}\n    envTable.NpcIDs.UnexplodedOrdinance = 148631\n    envTable.NpcIDs.IceBlock = 148522\nend\n\n--tests 126023 --harbor saurid - dazar'alor harbor\n--tests 3127 venomtail scorpid - durotar\n--tests 12058 dustwind storm witch - durotar\n--Load Condition: EncounterID 2281\n\n\n",
						["Cast Stop"] = "function (self, unitId, unitFrame, envTable)\n    if (envTable.UnexplodedOrdinanceCast and envTable._SpellID == envTable.UnexplodedOrdinanceSpellID) then\n        Plater.SetCastBarSize (unitFrame)\n        Plater:SetFontSize (unitFrame.castBar.percentText, Plater.db.profile.plate_config.enemynpc.spellpercent_text_size)\n    end\nend\n\n\n",
					},
					["Time"] = 1548612537,
					["PlaterCore"] = 1,
					["Name"] = "Jaina Encounter [Plater]",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
							2281, -- [1]
							["Enabled"] = true,
						},
						["role"] = {
						},
					},
					["Icon"] = "Interface\\AddOns\\Plater\\images\\encounter_jaina",
					["LastHookEdited"] = "",
				}, -- [6]
				{
					["Enabled"] = false,
					["Revision"] = 84,
					["HooksTemp"] = {
					},
					["Author"] = "Ahwa-Azralon",
					["Desc"] = "Add extra effects to execute range. See the constructor script for options.",
					["Hooks"] = {
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --execute detection, if true the script will handle the execute percent\n    --while false Plater will automatically trigger the execute range\n    --you only want to set this to true in case of Plater not detecting the execute range correctly\n    envTable.UseCustomExecutePercent = false\n    --execute percent, if not detecting automatic, this is the percent to active the execute range\n    --use from zero to one, 0.20 is equal to 20% of the unit life\n    envTable.ExecutePercent = 0.20\n    \n    --allow this script to change the nameplate color when the unit is in execute range\n    envTable.CanChangeColor = true\n    --change the health bar color to this color when the unit is in execute range\n    --color can be set as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}\n    envTable.ExecuteColor = \"green\"\n    \n    --border color\n    envTable.CanChangeBorderColor = false\n    envTable.BorderColor = \"red\"\n    \n    --hide the default health divisor and the health execute indicator\n    envTable.HideHealthDivisor = false\n    --if not hidden, adjust the health divisor settings and the health execute indicator\n    envTable.HealthDivisorAlpha = 0.5\n    envTable.HealthDivisorColor = \"white\"\n    envTable.HealthExecuteIndicatorAlpha = 0.15\n    envTable.HealthExecuteIndicatorColor = \"darkred\"\n    \n    \n    --private (internal functions)\n    do\n        function envTable.UnitInExecuteRange (unitFrame)\n            --check if can change the execute color\n            if (envTable.CanChangeColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.ExecuteColor)\n            end\n            \n            if (envTable.CanChangeBorderColor) then\n                Plater.SetBorderColor (unitFrame, envTable.BorderColor)\n            end\n            \n            if (envTable.HideHealthDivisor) then\n                unitFrame.healthBar.healthCutOff:Hide() \n                unitFrame.healthBar.executeRange:Hide()\n                \n            else\n                envTable.UpdateHealthDivisor (unitFrame)\n                \n            end\n        end\n        \n        function envTable.UpdateHealthDivisor (unitFrame)\n            local healthBar = unitFrame.healthBar\n            \n            healthBar.healthCutOff:Show()\n            healthBar.healthCutOff:SetVertexColor (DetailsFramework:ParseColors (envTable.HealthDivisorColor))\n            healthBar.healthCutOff:SetAlpha (envTable.HealthDivisorAlpha)\n            \n            healthBar.executeRange:Show()\n            healthBar.executeRange:SetVertexColor (DetailsFramework:ParseColors (envTable.HealthExecuteIndicatorColor))\n            healthBar.executeRange:SetAlpha (envTable.HealthExecuteIndicatorAlpha)\n            \n            if (envTable.UseCustomExecutePercent) then\n                healthBar.healthCutOff:ClearAllPoints()\n                healthBar.executeRange:ClearAllPoints()\n                \n                healthBar.healthCutOff:SetSize (healthBar:GetHeight(), healthBar:GetHeight())\n                healthBar.healthCutOff:SetPoint (\"center\", healthBar, \"left\", healthBar:GetWidth() * envTable.ExecutePercent, 0)\n                \n                healthBar.executeRange:SetTexCoord (0, envTable.ExecutePercent, 0, 1)\n                healthBar.executeRange:SetHeight (healthBar:GetHeight())\n                healthBar.executeRange:SetPoint (\"left\", healthBar, \"left\", 0, 0)\n                healthBar.executeRange:SetPoint (\"right\", healthBar.healthCutOff, \"center\")\n            end\n            \n        end\n    end\n    \nend",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (envTable.UseCustomExecutePercent) then\n        \n        --manual detection\n        local healthBar = unitFrame.healthBar\n        if (healthBar.CurrentHealth / healthBar.CurrentHealthMax <= envTable.ExecutePercent) then\n            envTable.UnitInExecuteRange (unitFrame)\n        end        \n        \n    else\n        \n        --auto detection\n        if (unitFrame.InExecuteRange) then\n            envTable.UnitInExecuteRange (unitFrame)\n        end\n        \n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n",
					},
					["Time"] = 1547406548,
					["PlaterCore"] = 1,
					["Name"] = "Execute Range [Plater]",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["role"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["Icon"] = 135358,
					["LastHookEdited"] = "",
				}, -- [7]
				{
					["Enabled"] = false,
					["Revision"] = 88,
					["HooksTemp"] = {
					},
					["Author"] = "Kastfall-Azralon",
					["Desc"] = "Function Plater.UpdatePlateSize from Plater.lua exported to scritps.",
					["Hooks"] = {
						["Nameplate Added"] = "\n\n-- exported function Plater.UpdatePlateSize() from Plater.lua\n--this is for advanced users which wants to reorder the nameplate frame at their desire\n\n\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --check if there's a type of unit on this nameplate\n    local plateFrame = unitFrame:GetParent()\n    if (not plateFrame.actorType) then\n        return\n    end\n    \n    --get all the frames and cache some variables\n    local ACTORTYPE_ENEMY_PLAYER = \"enemyplayer\"\n    local profile = Plater.db.profile\n    local DB_PLATE_CONFIG = profile.plate_config\n    local isInCombat = Plater.IsInCombat()\n    local actorType = plateFrame.actorType\n    \n    local unitFrame = plateFrame.unitFrame\n    local healthBar = unitFrame.healthBar\n    local castBar = unitFrame.castBar\n    local powerBar = unitFrame.powerBar\n    local buffFrame1 = unitFrame.BuffFrame\n    local buffFrame2 = unitFrame.BuffFrame2\n    \n    --use in combat bars when in pvp\n    if (plateFrame.actorType == ACTORTYPE_ENEMY_PLAYER) then\n        if ((Plater.ZoneInstanceType == \"pvp\" or Plater.ZoneInstanceType == \"arena\") and DB_PLATE_CONFIG.player.pvp_always_incombat) then\n            isInCombat = true\n        end\n    end\n    \n    --get the config for this actor type\n    local plateConfigs = DB_PLATE_CONFIG [actorType]\n    --get the config key based if the player is in combat\n    local castBarConfigKey, healthBarConfigKey, manaConfigKey = Plater.GetHashKey (isInCombat)\n    \n    --get the width and height from what the user set in the options panel\n    local healthBarWidth, healthBarHeight = unitFrame.customHealthBarWidth or plateConfigs [healthBarConfigKey][1], unitFrame.customHealthBarHeight or plateConfigs [healthBarConfigKey][2]\n    local castBarWidth, castBarHeight = unitFrame.customCastBarWidth or plateConfigs [castBarConfigKey][1], unitFrame.customCastBarHeight or plateConfigs [castBarConfigKey][2]\n    local powerBarWidth, powerBarHeight = unitFrame.customPowerBarHeight or plateConfigs [manaConfigKey][1], unitFrame.customPowerBarHeight or plateConfigs [manaConfigKey][2]\n    \n    --calculate the offset for the cast bar, this is done due to the cast bar be anchored to topleft and topright\n    local castBarOffSetX = (healthBarWidth - castBarWidth) / 2\n    local castBarOffSetY = plateConfigs.castbar_offset\n    \n    --calculate offsets for the power bar\n    local powerBarOffSetX = (healthBarWidth - powerBarWidth) / 2\n    local powerBarOffSetY = 0\n    \n    --calculate the size deviation for pets\n    local unitType = Plater.GetUnitType (plateFrame)\n    if (unitType == \"pet\") then\n        healthBarHeight = healthBarHeight * Plater.db.profile.pet_height_scale\n        healthBarWidth = healthBarWidth * Plater.db.profile.pet_width_scale\n        \n    elseif (unitType == \"minus\") then\n        healthBarHeight = healthBarHeight * Plater.db.profile.minor_height_scale\n        healthBarWidth = healthBarWidth * Plater.db.profile.minor_width_scale\n    end\n    \n    --unit frame - is set to be the same size as the plateFrame\n    unitFrame:ClearAllPoints()\n    unitFrame:SetAllPoints()\n    \n    --calculates the health bar anchor points\n    --it will always be placed in the center of the nameplate area (where it accepts mouse clicks) \n    local xOffSet = (plateFrame:GetWidth() - healthBarWidth) / 2\n    local yOffSet = (plateFrame:GetHeight() - healthBarHeight) / 2\n    \n    --set the health bar point\n    healthBar:ClearAllPoints()\n    PixelUtil.SetPoint (healthBar, \"topleft\", unitFrame, \"topleft\", xOffSet + profile.global_offset_x, -yOffSet + profile.global_offset_y)\n    PixelUtil.SetPoint (healthBar, \"bottomright\", unitFrame, \"bottomright\", -xOffSet + profile.global_offset_x, yOffSet + profile.global_offset_y)\n    \n    --set the cast bar point and size\n    castBar:ClearAllPoints()\n    PixelUtil.SetPoint (castBar, \"topleft\", healthBar, \"bottomleft\", castBarOffSetX, castBarOffSetY)\n    PixelUtil.SetPoint (castBar, \"topright\", healthBar, \"bottomright\", -castBarOffSetX, castBarOffSetY)\n    PixelUtil.SetHeight (castBar, castBarHeight)\n    PixelUtil.SetSize (castBar.Icon, castBarHeight, castBarHeight)\n    PixelUtil.SetSize (castBar.BorderShield, castBarHeight * 1.4, castBarHeight * 1.4)\n    \n    --set the power bar point and size\n    powerBar:ClearAllPoints()\n    PixelUtil.SetPoint (powerBar, \"topleft\", healthBar, \"bottomleft\", powerBarOffSetX, powerBarOffSetY)\n    PixelUtil.SetPoint (powerBar, \"topright\", healthBar, \"bottomright\", -powerBarOffSetX, powerBarOffSetY)\n    PixelUtil.SetHeight (powerBar, powerBarHeight)\n    \n    --power bar are hidden by default, show it if there's a custom size for it\n    if (unitFrame.customPowerBarWidth and unitFrame.customPowerBarHeight) then\n        powerBar:SetUnit (unitFrame.unit)\n    end\n    \n    --aura frames\n    buffFrame1:ClearAllPoints()\n    PixelUtil.SetPoint (buffFrame1, \"bottom\", unitFrame, \"top\", profile.aura_x_offset,  plateConfigs.buff_frame_y_offset + profile.aura_y_offset)\n    \n    buffFrame2:ClearAllPoints()\n    PixelUtil.SetPoint (buffFrame2, \"bottom\", unitFrame, \"top\", profile.aura2_x_offset,  plateConfigs.buff_frame_y_offset + profile.aura2_y_offset)    \n    \nend\n\n\n",
					},
					["Time"] = 1548077443,
					["PlaterCore"] = 1,
					["Name"] = "Reorder Nameplate [Plater]",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["race"] = {
						},
					},
					["Icon"] = 574574,
					["LastHookEdited"] = "",
				}, -- [8]
				{
					["Enabled"] = false,
					["Revision"] = 222,
					["HooksTemp"] = {
					},
					["Author"] = "Kastfall-Azralon",
					["Desc"] = "Change the nameplate color if the unit is attacking a specific unit like Monk's Ox Statue or Druid's Treants. You may edit which units it track in the constructor script.",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the GUID of the target of the unit\n    local targetGUID = UnitGUID (unitId .. \"target\")\n    \n    if (targetGUID) then\n        \n        --get the npcID of the target\n        local npcID = Plater.GetNpcIDFromGUID (targetGUID)\n        --check if the npcID of this unit is in the npc list \n        if (envTable.ListOfNpcs [npcID]) then\n            Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [npcID])\n            \n        else\n            --check if the name of ths unit is in the list\n            local unitName = UnitName (unitId .. \"target\")\n            if (envTable.ListOfNpcs [unitName]) then\n                Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])\n                \n            else\n                --check if the name of the unit in lower case is in the npc list\n                unitName = string.lower (unitName)\n                if (envTable.ListOfNpcs [unitName]) then\n                    Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])                \n                    \n                end\n            end\n        end\n        \n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --list of npcs and their colors, can be inserted:\n    --name of the unit\n    --name of the unit in lower case\n    --npcID of the unit\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    \n    envTable.ListOfNpcs = {\n        [61146] = \"olive\", --monk statue npcID\n        [103822] = \"olive\", --druid treant npcID\n        \n    }\n    \n    \nend\n\n\n\n\n",
					},
					["Time"] = 1547993111,
					["PlaterCore"] = 1,
					["Name"] = "Attacking Specific Unit [Plater]",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["role"] = {
						},
					},
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_attacking_unit",
					["LastHookEdited"] = "",
				}, -- [9]
				{
					["Enabled"] = true,
					["Revision"] = 37,
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Tint nameplates of Reaping Soul units (Mythic Dungeon Affix) depending on its target and role of the player",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --can detect the reaping souls aggro?\n    if (envTable.detectAggro and Plater.IsInCombat()) then\n        \n        --is this npc a reaping soul?\n        if (envTable.npcIDs [unitFrame.namePlateNpcId]) then\n            \n            --check if the mob is attacking the player\n            if (UnitIsUnit (unitFrame.targetUnitID, \"player\")) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateAggroColor)\n                \n            else\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateNoAggroColor)\n            end\n            \n        end\n        \n    end\n    \nend",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when the nameplate is added and the npcID matches, cache the color for the nameplate\n    if (envTable.detectAggro) then\n        if (envTable.npcIDs [unitFrame.namePlateNpcId]) then\n            local profile = Plater.db.profile\n            local role = Plater:GetPlayerRole()\n            \n            if (role == \"TANK\") then\n                envTable.NameplateAggroColor = profile.tank.colors.aggro\n                envTable.NameplateNoAggroColor = profile.tank.colors.noaggro\n            else\n                envTable.NameplateAggroColor = profile.dps.colors.aggro\n                envTable.NameplateNoAggroColor = profile.dps.colors.noaggro\n            end\n            \n        end\n    end\n    \n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --npcs affected by this script\n    \n    envTable.npcIDs = {\n        [148716] = true, --risen soul\n        [148893] = true, --tormented soul\n        [148894] = true, --lost soul\n        \n        [127278] = true, --skittering feeder (tests and debug, also need to disable the load conditions)\n    }\n    \n    --detect aggro, if true it will see which group member the soul is attacking and override the color\n    envTable.detectAggro = true\n    \n    \nend\n\n\n",
					},
					["Time"] = 1549827281,
					["PlaterCore"] = 1,
					["Name"] = "M+ Bwonsamdi Reaping",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
							["Enabled"] = true,
							["party"] = true,
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
							[117] = true,
							["Enabled"] = true,
						},
						["encounter_ids"] = {
						},
						["race"] = {
						},
					},
					["Icon"] = 2446016,
					["LastHookEdited"] = "",
				}, -- [10]
				{
					["Enabled"] = false,
					["Revision"] = 189,
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Show combo points above the nameplate for Druid Feral and Rogues.",
					["Hooks"] = {
						["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --run constructor!\n    --constructor is executed only once when any script of the hook runs.\n    \nend\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if need update the amount of combo points shown\n    if (envTable.LastPlayerTalentUpdate > envTable.LastUpdate) then\n        envTable.UpdateComboPointAmount()\n    end    \n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        envTable.UpdateComboPoints()\n        \n    else\n        envTable.ComboPointFrame:Hide()\n    end    \n    \nend\n\n\n",
						["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if this nameplate is the current target\n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        \n    else\n        envTable.ComboPointFrame:Hide()\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Player Power Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.UpdateComboPoints()\n    end\n    \n    \nend\n\n\n\n\n\n\n",
						["Player Talent Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the amount of comboo points shown when the player changes talents or specialization\n    envTable.UpdateComboPointAmount()\n    \n    --save the time of the last talent change\n    envTable.LastPlayerTalentUpdate = GetTime()\n    \n    \nend\n\n\n",
						["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    local anchors = {\n        {\"bottom\", unitFrame.healthBar, \"top\", 0, 24},\n    }\n    \n    local sizes = {\n        width = 12,\n        height = 12,\n        scale = 1,\n    }\n    \n    local textures = {\n        backgroundTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        backgroundTexCoords = {78/128, 98/128, 21/64, 41/64},\n        \n        comboPointTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        comboPointTexCoords = {100/128, 120/128, 21/64, 41/64},\n    }\n    \n    local frameLevel = 1000\n    local frameStrata = \"high\"    \n    \n    --private\n    do\n        --store combo points frames on this table\n        envTable.ComboPoints = {}\n        --save when the player changed talents or spec\n        envTable.LastPlayerTalentUpdate = GetTime()\n        --save when this nameplate got a combo point amount and alignment update        \n        \n        --build combo points frame anchor (combo point are anchored to this)\n        if (not unitFrame.PlaterComboPointFrame) then\n            local hostFrame = CreateFrame (\"frame\", nil, unitFrame)\n            hostFrame.ComboPointFramesPool = {}\n            unitFrame.PlaterComboPointFrame = hostFrame\n            envTable.ComboPointFrame = hostFrame\n            \n            --DetailsFramework:ApplyStandardBackdrop (envTable.ComboPointFrame) --debug anchor size\n            \n            --animations\n            local onPlayShowAnimation = function (animation)\n                --stop the hide animation if it's playing\n                if (animation:GetParent():GetParent().HideAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().HideAnimation:Stop()\n                end\n                \n                animation:GetParent():Show()\n            end\n            \n            local onPlayHideAnimation = function (animation)\n                --stop the show animation if it's playing\n                if (animation:GetParent():GetParent().ShowAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().ShowAnimation:Stop()\n                end\n            end        \n            local onStopHideAnimation = function (animation)\n                animation:GetParent():Hide()       \n            end\n            \n            local createAnimations = function (comboPoint)\n                --on show\n                comboPoint.ShowAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayShowAnimation, nil)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 1, 0.1, 0, 0, 1, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"alpha\", 1, 0.1, .5, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 2, 0.1, 1.2, 1.2, 1, 1)\n                \n                --on hide\n                comboPoint.HideAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayHideAnimation, onStopHideAnimation)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"scale\", 1, 0.1, 1, 1, 0, 0)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"alpha\", 1, 0.1, 1, 0)\n            end\n            \n            --build combo point frame        \n            for i =1, 10 do \n                local f = CreateFrame (\"frame\", nil, envTable.ComboPointFrame)\n                f:SetSize (sizes.width, sizes.height)\n                tinsert (envTable.ComboPoints, f)\n                tinsert (unitFrame.PlaterComboPointFrame.ComboPointFramesPool, f)\n                \n                local backgroundTexture = f:CreateTexture (nil, \"background\")\n                backgroundTexture:SetTexture (textures.backgroundTexture)\n                backgroundTexture:SetTexCoord (unpack (textures.backgroundTexCoords))\n                backgroundTexture:SetSize (sizes.width, sizes.height)\n                backgroundTexture:SetPoint (\"center\")\n                \n                local comboPointTexture = f:CreateTexture (nil, \"artwork\")\n                comboPointTexture:SetTexture (textures.comboPointTexture)\n                comboPointTexture:SetTexCoord (unpack (textures.comboPointTexCoords))\n                \n                comboPointTexture:SetSize (sizes.width, sizes.height)\n                comboPointTexture:SetPoint (\"center\")\n                comboPointTexture:Hide()            \n                \n                f.IsActive = false\n                \n                f.backgroundTexture = backgroundTexture\n                f.comboPointTexture = comboPointTexture\n                \n                createAnimations (f)\n            end\n            \n        else\n            envTable.ComboPointFrame = unitFrame.PlaterComboPointFrame\n            envTable.ComboPointFrame:SetScale (sizes.scale)\n            envTable.ComboPoints = unitFrame.PlaterComboPointFrame.ComboPointFramesPool\n            \n        end            \n        \n        envTable.ComboPointFrame:SetFrameLevel (frameLevel)\n        envTable.ComboPointFrame:SetFrameStrata (frameStrata)\n        \n        function envTable.UpdateComboPoints()\n            local comboPoints = UnitPower (\"player\", Enum.PowerType.ComboPoints)\n            \n            for i = 1, envTable.TotalComboPoints do\n                local thisComboPoint = envTable.ComboPoints [i]\n                \n                if (i <= comboPoints ) then\n                    --combo point enabled\n                    if (not thisComboPoint.IsActive) then\n                        thisComboPoint.ShowAnimation:Play()\n                        thisComboPoint.IsActive = true\n                        \n                    end\n                    \n                else\n                    --combo point disabled\n                    if (thisComboPoint.IsActive) then\n                        thisComboPoint.HideAnimation:Play()\n                        thisComboPoint.IsActive = false\n                        \n                    end\n                end\n            end\n            \n            \n        end\n        \n        function envTable.UpdateComboPointAmount()\n            local namePlateWidth = Plater.db.profile.plate_config.enemynpc.health_incombat[1]\n            local comboPoints = UnitPowerMax (\"player\", Enum.PowerType.ComboPoints)\n            local reservedSpace = namePlateWidth / comboPoints\n            \n            --store the total amount of combo points\n            envTable.TotalComboPoints = comboPoints\n            \n            --update anchor frame\n            envTable.ComboPointFrame:SetWidth (namePlateWidth)\n            envTable.ComboPointFrame:SetHeight (20)\n            envTable.ComboPointFrame:ClearAllPoints()\n            for i = 1, #anchors do\n                local anchor = anchors[i]\n                envTable.ComboPointFrame:SetPoint (unpack (anchor))\n            end        \n            \n            --\n            for i = 1, #envTable.ComboPoints do\n                envTable.ComboPoints[i]:Hide()\n                envTable.ComboPoints[i]:ClearAllPoints()\n            end\n            \n            for i = 1, comboPoints do\n                local comboPoint = envTable.ComboPoints[i]\n                comboPoint:SetPoint (\"left\", envTable.ComboPointFrame, \"left\", reservedSpace * (i-1), 0)\n                comboPoint:Show()\n            end\n            \n            envTable.LastUpdate = GetTime()\n            \n            envTable.UpdateComboPoints()\n        end\n        \n        --initialize\n        envTable.UpdateComboPointAmount()\n        envTable.ComboPointFrame:Hide()\n    end\n    \n    \nend",
					},
					["Time"] = 1548354524,
					["PlaterCore"] = 1,
					["Name"] = "Combo Points [Plater]",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
							["Enabled"] = true,
							["DRUID"] = true,
							["ROGUE"] = true,
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["race"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
							[103] = true,
							["Enabled"] = true,
						},
					},
					["Icon"] = 135426,
					["LastHookEdited"] = "",
				}, -- [11]
				{
					["Enabled"] = false,
					["Revision"] = 182,
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Show how many raid members are targeting the unit",
					["Hooks"] = {
						["Leave Combat"] = "function (self, unitId, unitFrame, envTable)\n    envTable.CanShow = false;\n    envTable.TargetAmount:SetText (\"\")\nend\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when a nameplate is added to the screen check if the player is in combat\n    if (InCombatLockdown()) then\n        --player is in combat, check if can check amount of targets\n        envTable.CanShow = envTable.CanShowTargetAmount();\n        \n    else\n        envTable.CanShow = false; \n    end\n    \n    envTable.TargetAmount:SetText (\"\");\n    \nend",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.TargetAmount:SetText (\"\");\n    envTable.CanShow = false;\n    \nend\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --if the script is allowed to show the amount of targets\n    --also check if the unit is in combat\n    if (envTable.CanShow and UnitAffectingCombat (unitId)) then\n        \n        --check if can update the amount of targets following the cooldown set in the constructor script\n        --by default Plater updates the nameplate every 250ms, by default the cooldown is 2, so it'll update the amuont of target every 1/2 of a second\n        envTable.UpdateCooldown = envTable.UpdateCooldown + 1\n        if (envTable.UpdateCooldown < envTable.UpdateInterval) then\n            return\n        else\n            \n            --reset the cooldown interval to check the amount of target again\n            envTable.UpdateCooldown = 0\n            \n            --get the amount of targets\n            local amount;\n            if (envTable.InRaid) then\n                amount = envTable.NumTargetsInRaid (unitFrame)      \n                \n            elseif (envTable.InParty) then\n                amount = envTable.NumTargetsInParty (unitFrame)   \n                \n            else\n                envTable.TargetAmount:SetText (\"\")\n                return\n            end\n            \n            --update the amount text\n            if (amount == 0) then\n                envTable.TargetAmount:SetText (\"\")\n            else\n                envTable.TargetAmount:SetText (amount)\n            end\n            \n        end\n    end\nend\n\n\n",
						["Enter Combat"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can show the amount of targets\n    envTable.CanShow = envTable.CanShowTargetAmount();\n    \n    if (not envTable.CanShow) then\n        envTable.TargetAmount:SetText (\"\") \n    end\nend\n\n\n\n\n",
						["Constructor"] = "--all gray text like this are comments and do not run as code\n--build the settings and basic functions for the hook\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --declare setting variables:\n    local textColor = \"orange\";\n    local textSize = 12;\n    \n    local showInRaid = true;\n    local showInDungeon = true;\n    local showInArena = false;\n    local showInBattleground = false;\n    local showInOpenWorld = true;\n    \n    envTable.UpdateInterval = 2; --each 2 updates in the nameplate it'll update the amount of targets\n    \n    local anchor = {\n        side = 6, --1 = topleft 2 = left 3 = bottomleft 4 = bottom 5 = bottom right 6 = right 7 = topright 8 = top\n        x = 4, --x offset\n        y = 0, --y offset\n    };\n    \n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------\n    \n    \n    --frames:\n    \n    --create the text that will show the amount of people targeting the unit\n    if (not  unitFrame.healthBar.TargetAmount) then\n        envTable.TargetAmount = Plater:CreateLabel (unitFrame.healthBar, \"\", textSize, textColor);\n        Plater.SetAnchor (envTable.TargetAmount, anchor);\n        unitFrame.healthBar.TargetAmount = envTable.TargetAmount\n    end\n    \n    --in case Plater wipes the envTable\n    envTable.TargetAmount = unitFrame.healthBar.TargetAmount\n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------           \n    --private variables (they will be used in the other scripts within this hook)\n    envTable.CanShow = false;\n    envTable.UpdateCooldown = 0;\n    envTable.InRaid = false;\n    envTable.InParty = false;\n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------           \n    --functions\n    \n    --update the InRaid or InParty proprieties\n    function envTable.UpdateGroupType()\n        if (IsInRaid()) then\n            envTable.InRaid = true;\n            envTable.InParty = false;     \n            \n        elseif (IsInGroup()) then\n            envTable.InRaid = false;\n            envTable.InParty = true;   \n            \n        else\n            envTable.InRaid = false;            \n            envTable.InParty = false;\n        end\n    end\n    \n    --this function controls if the amount of targets can show following the settings in the top of this script\n    function envTable.CanShowTargetAmount()\n        \n        local _, instanceType, difficultyID, _, _, _, _, instanceMapID, instanceGroupSize = GetInstanceInfo()\n        \n        if (showInRaid and instanceType == \"raid\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInDungeon and instanceType == \"party\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInArena and instanceType == \"arena\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInBattleground and instanceType == \"pvp\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInOpenWorld and instanceType == \"none\") then\n            envTable.UpdateGroupType()\n            if (envTable.InRaid or envTable.InParty) then\n                return true\n            end\n        end\n        \n        return false\n    end\n    \n    --get the amount of player targetting the unit in raid or party\n    function envTable.NumTargetsInRaid (unitFrame)\n        local amount = 0\n        for i = 1, GetNumGroupMembers() do\n            local unit = \"raid\" .. i .. \"target\"\n            if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n                amount = amount + 1\n            end\n        end\n        \n        return amount\n    end\n    \n    function envTable.NumTargetsInParty()\n        local amount = 0\n        for i = 1, GetNumGroupMembers() - 1 do\n            local unit = \"party\" .. i .. \"target\"\n            if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n                amount = amount + 1\n            end\n        end\n        \n        local unit = \"playertarget\"\n        if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n            amount = amount + 1\n        end        \n        \n        return amount\n    end\n    \nend",
					},
					["Time"] = 1548278227,
					["PlaterCore"] = 1,
					["Name"] = "Players Targeting a Target [Plater]",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["role"] = {
						},
					},
					["Icon"] = 1966587,
					["LastHookEdited"] = "",
				}, -- [12]
				{
					["Enabled"] = false,
					["Revision"] = 93,
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Changes the target color to the color set in the constructor script.",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend",
						["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --usage: color name e.g \"red\" \"yellow\"; color table e.g {1, 0, 0} {1, 1, 0}; hex string e.g. \"#FF0000\" \"FFFF00\"\n    \n    envTable.TargetColor = \"purple\"\n    --envTable.TargetColor = \"#FF00FF\"\n    --envTable.TargetColor = {252/255, 0/255, 254/255}\n    \n    function envTable.UpdateColor (unitFrame)\n        --do not change the color of the personal bar\n        if (not unitFrame.IsSelf) then\n            \n            --if this nameplate the current target of the player?\n            if (unitFrame.namePlateIsTarget) then\n                Plater.SetNameplateColor (unitFrame, envTable.TargetColor)  --rgb\n            else\n                --refresh the nameplate color\n                Plater.RefreshNameplateColor (unitFrame)\n            end\n        end\n    end\n    \nend\n\n\n\n\n",
					},
					["Time"] = 1552354619,
					["PlaterCore"] = 1,
					["Name"] = "Current Target Color [Plater]",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["role"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["Icon"] = 878211,
					["LastHookEdited"] = "",
				}, -- [13]
				{
					["Enabled"] = false,
					["Revision"] = 272,
					["HooksTemp"] = {
					},
					["Author"] = "Ditador-Azralon",
					["Desc"] = "Reorder buffs and debuffs following the settings set in the constructor.",
					["Hooks"] = {
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --ATTENTION: after enabling this script, you may have to adjust the anchor point at the Buff Settings tab\n    \n    --space between each aura icon\n    envTable.padding = 2\n    \n    --space between each row of icons\n    envTable.rowPadding = 12\n    \n    --amount of icons in the row, it'll breakline and start a new row after reach the threshold\n    envTable.maxAurasPerRow = 5\n    \n    --stack auras of the same name that arent stacked by default from the game\n    envTable.consolidadeRepeatedAuras = true    \n    \n    --which auras goes first, assign a value (any number), bigger value goes first\n    envTable.priority = {\n        [\"Vampiric Touch\"] = 50,\n        [\"Shadow Word: Pain\"] = 22,\n        [\"Mind Flay\"] = 5,\n    }\n    \nend \n\n\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    local auraContainers = {unitFrame.BuffFrame.PlaterBuffList}\n\n    if (Plater.db.profile.buffs_on_aura2) then\n        auraContainers [2] = unitFrame.BuffFrame2.PlaterBuffList\n    end\n    \n    for containerID = 1, #auraContainers do\n        \n        local auraContainer = auraContainers [containerID]\n        local aurasShown = {}\n        local aurasDuplicated = {}\n        \n        --build the list of auras shown in the buff frame and check for each aura priority\n        --also check if the consolidate (stack) auras with the same name is enabled\n        for index, auraIcon in ipairs (auraContainer) do\n            if (auraIcon:IsShown()) then\n                if (envTable.consolidadeRepeatedAuras) then\n                    --is this aura already shown?\n                    local iconShownIndex = aurasDuplicated [auraIcon.SpellName]\n                    if (iconShownIndex) then\n                        --get the table with information about the shown icon\n                        local auraShownTable = aurasShown [iconShownIndex]\n                        --get the icon already in the table\n                        local icon = auraShownTable[1]\n                        --increase the amount of stacks\n                        auraShownTable[3] = auraShownTable[3] + 1\n                        \n                        --check if the remaining time of the icon already added in the table is lower than the current\n                        if (auraIcon.RemainingTime > icon.RemainingTime) then\n                            --replace the icon for the icon with bigger duration\n                            auraShownTable[1] = auraIcon\n                            icon:Hide()\n                        else\n                            auraIcon:Hide()\n                        end\n                    else    \n                        local priority = envTable.priority[auraIcon.SpellName] or envTable.priority[auraIcon.spellId] or 1\n                        tinsert (aurasShown, {auraIcon, priority, 1}) --icon frame, priority, stack amount\n                        aurasDuplicated [auraIcon.SpellName] = #aurasShown\n                    end\n                else\n                    --not stacking similar auras\n                    local priority = envTable.priority[auraIcon.SpellName] or envTable.priority[auraIcon.spellId] or 1\n                    tinsert (aurasShown, {auraIcon, priority})\n                    \n                end           \n            end\n        end\n        \n        --sort auras by priority\n        table.sort (aurasShown, DetailsFramework.SortOrder2)\n        \n        local growDirection\n        if (containerID == 1) then --debuff container\n            growDirection = Plater.db.profile.aura_grow_direction\n            --force to grow to right if it is anchored to center\n            if (growDirection == 2) then\n                growDirection = 3\n            end\n            -- \"Left\", \"Center\", \"Right\" - 1  2  3\n            \n        elseif (containerID == 2) then --buff container\n            growDirection = Plater.db.profile.aura2_grow_direction\n            --force to grow to left if it is anchored to center\n            if (growDirection == 2) then\n                growDirection = 1\n            end\n            \n        end\n        \n        local padding = envTable.padding\n        local framersPerRow = envTable.maxAurasPerRow + 1\n        \n        --first icon is where the row starts\n        local firstIcon = aurasShown[1] and aurasShown[1][1]\n        \n        if (firstIcon) then\n            local anchorPoint = firstIcon:GetParent() --anchor point is the BuffFrame\n            anchorPoint:SetSize (1, 1)\n            \n            firstIcon:ClearAllPoints()\n            firstIcon:SetPoint (\"center\", anchorPoint, \"center\", 0, 5)\n            \n            --check the consolidaded stacks, this is not the regular buff stacks\n            local firstIconStacks = aurasShown[1][3]\n            if (firstIconStacks and firstIconStacks > 1) then\n                firstIcon.StackText:SetText (firstIconStacks)\n                firstIcon.StackText:Show()\n            end\n            \n            --> left to right\n            if (growDirection == 3) then\n                --> iterate among all aura icons\n                for i = 2, #aurasShown do\n                    local auraIcon = aurasShown [i][1]\n                    auraIcon:ClearAllPoints()\n                    \n                    if (i == framersPerRow) then\n                        auraIcon:SetPoint (\"bottomleft\", firstIcon, \"topleft\", 0, envTable.rowPadding)\n                        framersPerRow = framersPerRow + framersPerRow\n                        \n                    else\n                        auraIcon:SetPoint (\"topleft\", aurasShown [i-1][1], \"topright\", padding, 0)\n                    end\n                    \n                    local stacks = aurasShown[i][3]\n                    if (stacks and stacks > 1) then\n                        auraIcon.StackText:SetText (stacks)\n                        auraIcon.StackText:Show()\n                    end\n                end        \n                \n                --right to left\n            elseif (growDirection == 1) then\n                --> iterate among all aura icons\n                for i = 2, #aurasShown do\n                    local auraIcon = aurasShown [i][1]\n                    auraIcon:ClearAllPoints()\n                    \n                    if (i == framersPerRow) then\n                        auraIcon:SetPoint (\"bottomright\", firstIcon, \"topright\", 0, envTable.rowPadding)\n                        framersPerRow = framersPerRow + framersPerRow\n                        \n                    else\n                        auraIcon:SetPoint (\"topright\", aurasShown [i-1][1], \"topleft\", -padding, 0)\n                    end\n                    \n                    local stacks = aurasShown[i][3]\n                    if (stacks and stacks > 1) then\n                        auraIcon.StackText:SetText (stacks)\n                        auraIcon.StackText:Show()\n                    end\n                    \n                end                    \n            end\n            \n        end\n    end\nend\n\n\n",
					},
					["Time"] = 1553450957,
					["PlaterCore"] = 1,
					["Name"] = "Aura Reorder [Plater]",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["race"] = {
						},
					},
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_reorder",
					["LastHookEdited"] = "",
				}, -- [14]
			},
			["first_run3"] = true,
			["transparency_behavior"] = 3,
			["target_shady_alpha"] = 0.5976743698120117,
			["spell_animations"] = false,
			["ui_parent_scale_tune"] = 1.562500034924597,
			["health_statusbar_bgcolor"] = {
				0.1137254901960784, -- [1]
				0.1137254901960784, -- [2]
				0.1137254901960784, -- [3]
				0.8900000005960464, -- [4]
			},
			["spell_animations_scale"] = 1.251752853393555,
			["aura_timer_text_anchor"] = {
				["y"] = -4.155016899108887,
				["side"] = 11,
			},
			["use_ui_parent"] = true,
			["aura_tracker"] = {
				["buff_tracked"] = {
					[209859] = true,
				},
			},
			["script_auto_imported"] = {
				["Cast - Small Alert"] = 4,
				["Aura - Invalidate Unit"] = 1,
				["Aura - Buff Alert"] = 4,
				["Unit - Important"] = 5,
				["Explosion Affix M+"] = 3,
				["Cast - Very Important"] = 2,
				["Aura Border Color"] = 1,
				["Color Change"] = 1,
				["Aura - Debuff Alert"] = 3,
				["Cast - Frontal Cone"] = 2,
				["Fixate"] = 3,
				["Aura - Blink Time Left"] = 1,
				["Unit Power"] = 1,
				["Cast - Big Alert"] = 5,
				["Fixate On You"] = 2,
			},
			["aura_timer_text_size"] = 7,
			["update_throttle"] = 0.05000000074505806,
			["number_region_first_run"] = true,
			["extra_icon_auras"] = {
				277242, -- [1]
			},
			["npc_cache"] = {
				[69134] = {
					"Kazra'jin", -- [1]
					"Throne of Thunder", -- [2]
				},
				[69390] = {
					"Zandalari Storm-Caller", -- [1]
					"Throne of Thunder", -- [2]
				},
				[34775] = {
					"Demolisher", -- [1]
					"Isle of Conquest", -- [2]
				},
				[36950] = {
					"Skybreaker Marine", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[45266] = {
					"Twilight Dark Mender", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[111354] = {
					"Taintheart Befouler", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[76811] = {
					"Bellows Operator", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[93955] = {
					"Delusional Zealot", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[133345] = {
					"Feckless Assistant", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[136160] = {
					"King Dazar", -- [1]
					"Kings' Rest", -- [2]
				},
				[111355] = {
					"Taintheart Tormenter", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[76812] = {
					"Security Guard", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[138464] = {
					"Ashvane Deckhand", -- [1]
					"Siege of Boralus", -- [2]
				},
				[34776] = {
					"Siege Engine", -- [1]
					"Isle of Conquest", -- [2]
				},
				[131812] = {
					"Heartsbane Soulcharmer", -- [1]
					"Waycrest Manor", -- [2]
				},
				[94724] = {
					"Bryanda", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[138465] = {
					"Ashvane Cannoneer", -- [1]
					"Siege of Boralus", -- [2]
				},
				[82698] = {
					"Night-Twisted Devout", -- [1]
					"Highmaul", -- [2]
				},
				[88967] = {
					"Training Dummy", -- [1]
					"FW Horde Garrison Level 3", -- [2]
				},
				[158168] = {
					"Dark Disciple", -- [1]
					"Halls of Origination", -- [2]
				},
				[77325] = {
					"Blackhand", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[75406] = {
					"Slagna", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[155098] = {
					"Rexxar", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[92038] = {
					"Salivating Bloodthirster", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[69905] = {
					"Gurubashi Berserker", -- [1]
					"Throne of Thunder", -- [2]
				},
				[54543] = {
					"Time-Twisted Drake", -- [1]
					"End Time", -- [2]
				},
				[134629] = {
					"Scaled Krolusk Rider", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[141282] = {
					"Kul Tiran Footman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[151773] = {
					"Junkyard D.0.G.", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[93830] = {
					"Iron Dragoon", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[161241] = {
					"Voidweaver Mal'thir", -- [1]
					"Kings' Rest", -- [2]
				},
				[92039] = {
					"Bleeding Grunt", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[141283] = {
					"Kul Tiran Halberd", -- [1]
					"Siege of Boralus", -- [2]
				},
				[69906] = {
					"Zandalari High Priest", -- [1]
					"Throne of Thunder", -- [2]
				},
				[61644] = {
					"Dark Shaman Researcher", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[37144] = {
					"Skybreaker Marksman", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[53648] = {
					"Inferno Hawk", -- [1]
					"Firelands", -- [2]
				},
				[136934] = {
					"Weapons Tester", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[76815] = {
					"Primal Elementalist", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[131817] = {
					"Cragmaw the Infested", -- [1]
					"The Underrot", -- [2]
				},
				[161243] = {
					"Samh'rek, Beckoner of Chaos", -- [1]
					"Waycrest Manor", -- [2]
				},
				[141285] = {
					"Kul Tiran Marksman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[131818] = {
					"Marked Sister", -- [1]
					"Waycrest Manor", -- [2]
				},
				[129526] = {
					"Bilge Rat Swabby", -- [1]
					"Freehold", -- [2]
				},
				[80526] = {
					"Stubborn Ironhoof", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[161244] = {
					"Blood of the Corruptor", -- [1]
					"Kings' Rest", -- [2]
				},
				[152033] = {
					"Inconspicuous Plant", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[131819] = {
					"Coven Diviner", -- [1]
					"Waycrest Manor", -- [2]
				},
				[92041] = {
					"Bleeding Darkcaster", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[155872] = {
					"Trapped Saurok", -- [1]
					"Mogu'shan Scenario", -- [2]
				},
				[90378] = {
					"Kilrogg Deadeye", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[129527] = {
					"Bilge Rat Buccaneer", -- [1]
					"Freehold", -- [2]
				},
				[19668] = {
					"Shadowfiend", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[161502] = {
					"Ravenous Fleshfiend", -- [1]
					"Kings' Rest", -- [2]
				},
				[76945] = {
					"Ironcrusher", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[131821] = {
					"Faceless Maiden", -- [1]
					"Waycrest Manor", -- [2]
				},
				[156641] = {
					"Enthralled Weaponsmith", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[54161] = {
					"Flame Archon", -- [1]
					"Firelands", -- [2]
				},
				[126969] = {
					"Trothak", -- [1]
					"Freehold", -- [2]
				},
				[69909] = {
					"Amani'shi Flame Chanter", -- [1]
					"Throne of Thunder", -- [2]
				},
				[92554] = {
					"Mek'barash", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[156642] = {
					"Enthralled Laborer", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[76946] = {
					"Faultline", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[131823] = {
					"Sister Malady", -- [1]
					"Waycrest Manor", -- [2]
				},
				[158690] = {
					"Cultist Tormenter", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[79505] = {
					"Solar Flare", -- [1]
					"Skyreach", -- [2]
				},
				[135406] = {
					"Animated Gold", -- [1]
					"Kings' Rest", -- [2]
				},
				[69910] = {
					"Drakkari Frost Warden", -- [1]
					"Throne of Thunder", -- [2]
				},
				[131824] = {
					"Sister Solena", -- [1]
					"Waycrest Manor", -- [2]
				},
				[129529] = {
					"Blacktooth Scrapper", -- [1]
					"Freehold", -- [2]
				},
				[131825] = {
					"Sister Briar", -- [1]
					"Waycrest Manor", -- [2]
				},
				[3637] = {
					"Deviate Guardian", -- [1]
					"Wailing Caverns", -- [2]
				},
				[133361] = {
					"Wasting Servant", -- [1]
					"Waycrest Manor", -- [2]
				},
				[150249] = {
					"Pistonhead Scrapper", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[94859] = {
					"Armored Skullsmasher", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[93068] = {
					"Xhul'horac", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[151785] = {
					"Void-Twisted Wyrmkiller", -- [1]
					"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
				},
				[462] = {
					"Carrion Bird", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[150250] = {
					"Pistonhead Blaster", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[153065] = {
					"Voidbound Ravager", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[137713] = {
					"Big Money Crab", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[150251] = {
					"Pistonhead Mechanic", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[127484] = {
					"Jes Howlis", -- [1]
					"Tol Dagor", -- [2]
				},
				[161510] = {
					"Mindrend Tentacle", -- [1]
					"Kings' Rest", -- [2]
				},
				[137458] = {
					"Rotting Spore", -- [1]
					"The Underrot", -- [2]
				},
				[49813] = {
					"Evolved Drakonaar", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[37595] = {
					"Darkfallen Blood Knight", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[134388] = {
					"A Knot of Snakes", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[131318] = {
					"Elder Leaxa", -- [1]
					"The Underrot", -- [2]
				},
				[150253] = {
					"Weaponized Crawler", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[127485] = {
					"Bilge Rat Looter", -- [1]
					"Tol Dagor", -- [2]
				},
				[134389] = {
					"Venomous Ophidian", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[129788] = {
					"Irontide Bonesaw", -- [1]
					"Freehold", -- [2]
				},
				[137204] = {
					"Hoodoo Hexer", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[137716] = {
					"Bottom Feeder", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[150254] = {
					"Scraphound", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[134390] = {
					"Sand-crusted Striker", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[53140] = {
					"Son of Flame", -- [1]
					"Firelands", -- [2]
				},
				[157419] = {
					"Void-Twisted Whelp", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[84499] = {
					"Entanglement", -- [1]
					"The Everbloom", -- [2]
				},
				[37532] = {
					"Frostwing Whelp", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[95630] = {
					"Construct Peacekeeper", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[156653] = {
					"Coagulated Horror", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[126847] = {
					"Captain Raoul", -- [1]
					"Freehold", -- [2]
				},
				[94607] = {
					"Gorebound Cauterizer", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[80534] = {
					"Ornery Ironhoof", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[156143] = {
					"Voidcrazed Hulk", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[93968] = {
					"Shadowfel Warden", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[126848] = {
					"Captain Eudora", -- [1]
					"Freehold", -- [2]
				},
				[76057] = {
					"Carrion Worm", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[127488] = {
					"Ashvane Flamecaster", -- [1]
					"Tol Dagor", -- [2]
				},
				[138489] = {
					"Shadow of Zul", -- [1]
					"Kings' Rest", -- [2]
				},
				[162030] = {
					"Darkwhisper Ritualist", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[156145] = {
					"Burrowing Appendage", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[95632] = {
					"Sargerei Enforcer", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[77337] = {
					"Aknor Steelbringer", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[156146] = {
					"Voidbound Shieldbearer", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[78233] = {
					"Darkshard Crystalback", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[70557] = {
					"Zandalari Prophet", -- [1]
					"Throne of Thunder", -- [2]
				},
				[91539] = {
					"Fel Raven", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[81432] = {
					"Grom'kar Technician", -- [1]
					"Iron Docks", -- [2]
				},
				[53206] = {
					"Hell Hound", -- [1]
					"Firelands", -- [2]
				},
				[127106] = {
					"Irontide Officer", -- [1]
					"Freehold", -- [2]
				},
				[37022] = {
					"Blighted Abomination", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[80409] = {
					"Markog Aba'dir", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[142587] = {
					"Devouring Maggot", -- [1]
					"Waycrest Manor", -- [2]
				},
				[135167] = {
					"Spectral Berserker", -- [1]
					"Kings' Rest", -- [2]
				},
				[131585] = {
					"Enthralled Guard", -- [1]
					"Waycrest Manor", -- [2]
				},
				[91540] = {
					"Illusionary Outcast", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[37662] = {
					"Darkfallen Commander", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[141565] = {
					"Kul Tiran Footman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[131586] = {
					"Banquet Steward", -- [1]
					"Waycrest Manor", -- [2]
				},
				[156406] = {
					"Voidbound Honor Guard", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[78491] = {
					"Brackenspore", -- [1]
					"Highmaul", -- [2]
				},
				[94995] = {
					"Graggra", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[125828] = {
					"Galdrelin", -- [1]
					"Atal'Dazar", -- [2]
				},
				[141566] = {
					"Scrimshaw Gutter", -- [1]
					"Siege of Boralus", -- [2]
				},
				[131587] = {
					"Bewitched Captain", -- [1]
					"Waycrest Manor", -- [2]
				},
				[91541] = {
					"Shadowfel Warden", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[137473] = {
					"Guard Captain Atu", -- [1]
					"Kings' Rest", -- [2]
				},
				[102672] = {
					"Nythendra", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[80411] = {
					"Iron Marksman", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[76829] = {
					"Slag Elemental", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[137474] = {
					"King Timalji", -- [1]
					"Kings' Rest", -- [2]
				},
				[49817] = {
					"Bound Inferno", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[95636] = {
					"Sargerei Adjutant", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[93717] = {
					"Volatile Firebomb", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[81819] = {
					"Everbloom Naturalist", -- [1]
					"The Everbloom", -- [2]
				},
				[78237] = {
					"Phemos", -- [1]
					"Highmaul", -- [2]
				},
				[154619] = {
					"Watcher Aum-ka", -- [1]
					"Halls of Origination", -- [2]
				},
				[76446] = {
					"Shadowmoon Enslaver", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[86809] = {
					"Grom'kar Incinerator", -- [1]
					"Iron Docks", -- [2]
				},
				[91543] = {
					"Corrupted Talonpriest", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[67235] = {
					"Shadowfiend", -- [1]
					"Isle of Conquest", -- [2]
				},
				[161273] = {
					"Abyssal Spawn", -- [1]
					"Chamber of Heart - Scenario", -- [2]
				},
				[81820] = {
					"Everbloom Mender", -- [1]
					"The Everbloom", -- [2]
				},
				[78238] = {
					"Pol", -- [1]
					"Highmaul", -- [2]
				},
				[139269] = {
					"Gloom Horror", -- [1]
					"Waycrest Manor", -- [2]
				},
				[133384] = {
					"Merektha", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[95638] = {
					"Sargerei Bannerman", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[37664] = {
					"Darkfallen Archmage", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[83612] = {
					"Skulloc", -- [1]
					"Iron Docks", -- [2]
				},
				[126983] = {
					"Harlan Sweete", -- [1]
					"Freehold", -- [2]
				},
				[127111] = {
					"Irontide Oarsman", -- [1]
					"Freehold", -- [2]
				},
				[131850] = {
					"Maddened Survivalist", -- [1]
					"Waycrest Manor", -- [2]
				},
				[54552] = {
					"Time-Twisted Breaker", -- [1]
					"End Time", -- [2]
				},
				[78623] = {
					"Cho'gall", -- [1]
					"Highmaul", -- [2]
				},
				[127879] = {
					"Shieldbearer of Zul", -- [1]
					"Atal'Dazar", -- [2]
				},
				[83613] = {
					"Koramar", -- [1]
					"Iron Docks", -- [2]
				},
				[36961] = {
					"Skybreaker Sergeant", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[45213] = {
					"Sinestra", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[123402] = {
					"Garothi Decimator", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[152834] = {
					"Azerite Skitterer", -- [1]
					"The Maelstrom - Heart of Azeroth", -- [2]
				},
				[156161] = {
					"Inquisitor Gnshal", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[150276] = {
					"Heavy Scrapbot", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[37665] = {
					"Darkfallen Lieutenant", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[75426] = {
					"Bloodmaul Overseer", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[157441] = {
					"Void Wraith", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[151812] = {
					"Detect-o-Bot", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[94617] = {
					"Glynevere", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[54553] = {
					"Time-Twisted Seer", -- [1]
					"End Time", -- [2]
				},
				[94873] = {
					"Felfire Flamebelcher", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[74787] = {
					"Slave Watcher Crushto", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[137484] = {
					"King A'akul", -- [1]
					"Kings' Rest", -- [2]
				},
				[134158] = {
					"Shadow-Borne Champion", -- [1]
					"Kings' Rest", -- [2]
				},
				[128649] = {
					"Sergeant Bainbridge", -- [1]
					"Siege of Boralus", -- [2]
				},
				[137485] = {
					"Bloodsworn Agent", -- [1]
					"Kings' Rest", -- [2]
				},
				[37026] = {
					"Skybreaker Sorcerer", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[94618] = {
					"Cattwen", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[84767] = {
					"Twisted Abomination", -- [1]
					"The Everbloom", -- [2]
				},
				[53786] = {
					"Blazing Monstrosity", -- [1]
					"Firelands", -- [2]
				},
				[137486] = {
					"Queen Patlaa", -- [1]
					"Kings' Rest", -- [2]
				},
				[95642] = {
					"Korvos", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[138254] = {
					"Irontide Powdershot", -- [1]
					"Siege of Boralus", -- [2]
				},
				[83616] = {
					"Zoggosh", -- [1]
					"Iron Docks", -- [2]
				},
				[2630] = {
					"Earthbind Totem", -- [1]
					"Isle of Conquest", -- [2]
				},
				[137487] = {
					"Skeletal Hunting Raptor", -- [1]
					"Kings' Rest", -- [2]
				},
				[69927] = {
					"Zandalari Prelate", -- [1]
					"Throne of Thunder", -- [2]
				},
				[131858] = {
					"Thornguard", -- [1]
					"Waycrest Manor", -- [2]
				},
				[138255] = {
					"Ashvane Spotter", -- [1]
					"Siege of Boralus", -- [2]
				},
				[52571] = {
					"Majordomo Staghelm", -- [1]
					"Firelands", -- [2]
				},
				[129802] = {
					"Earthrager", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[136976] = {
					"T'zala", -- [1]
					"Kings' Rest", -- [2]
				},
				[128651] = {
					"Hadal Darkfathom", -- [1]
					"Siege of Boralus", -- [2]
				},
				[153097] = {
					"Voidbound Shaman", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[61463] = {
					"Slagmaw", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[90270] = {
					"Ancient Enforcer", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[78116] = {
					"Water Elemental", -- [1]
					"Waycrest Manor", -- [2]
				},
				[43296] = {
					"Chimaeron", -- [1]
					"Blackwing Descent", -- [2]
				},
				[74790] = {
					"Gug'rokk", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[49821] = {
					"Bound Zephyr", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[81315] = {
					"Iron Crack-Shot", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[69161] = {
					"Demossauro", -- [1]
					"Isle of Conquest", -- [2]
				},
				[77477] = {
					"Marak the Blooded", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[77605] = {
					"Whirling Dervish", -- [1]
					"Skyreach", -- [2]
				},
				[75814] = {
					"Bloodmaul Earthbreaker", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[90271] = {
					"Ancient Harbinger", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[84386] = {
					"Spore Image", -- [1]
					"The Everbloom", -- [2]
				},
				[129548] = {
					"Blacktooth Brute", -- [1]
					"Freehold", -- [2]
				},
				[80676] = {
					"Iron Flametwister", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[131863] = {
					"Raal the Gluttonous", -- [1]
					"Waycrest Manor", -- [2]
				},
				[87841] = {
					"Grom'kar Firemender", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[139284] = {
					"Plague Doctor", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[61528] = {
					"Lava Guard Gordoth", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[131864] = {
					"Gorak Tul", -- [1]
					"Waycrest Manor", -- [2]
				},
				[68139] = {
					"Suffering Soul Fragment", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[136470] = {
					"Refreshment Vendor", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[80677] = {
					"Iron Journeyman", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[80805] = {
					"Makogg Emberblade", -- [1]
					"Iron Docks", -- [2]
				},
				[41570] = {
					"Magmaw", -- [1]
					"Blackwing Descent", -- [2]
				},
				[133912] = {
					"Bloodsworn Defiler", -- [1]
					"The Underrot", -- [2]
				},
				[83620] = {
					"Bloodmaul Earthbreaker", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[94239] = {
					"Omnus", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[127119] = {
					"Freehold Deckhand", -- [1]
					"Freehold", -- [2]
				},
				[48415] = {
					"Twilight Spitecaller", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[136984] = {
					"Reban", -- [1]
					"Kings' Rest", -- [2]
				},
				[79015] = {
					"Ko'ragh", -- [1]
					"Highmaul", -- [2]
				},
				[158478] = {
					"Corruption Tumor", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[83621] = {
					"Bloodmaul Magma Binder", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[89890] = {
					"Fel Lord Zakuun", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[135706] = {
					"Bilge Rat Looter", -- [1]
					"Tol Dagor", -- [2]
				},
				[70060] = {
					"Shadowed Voodoo Spirit", -- [1]
					"Throne of Thunder", -- [2]
				},
				[80423] = {
					"Thunderlord Beast-Tender", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[80551] = {
					"Shard of Tectus", -- [1]
					"Highmaul", -- [2]
				},
				[92961] = {
					"Gorebound Brute", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[150292] = {
					"Mechagon Cavalry", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[83622] = {
					"Bloodmaul Ogre Mage", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[93985] = {
					"Corrupted Talonpriest", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[78121] = {
					"Gorian Warmage", -- [1]
					"Highmaul", -- [2]
				},
				[150293] = {
					"Mechagon Prowler", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[132126] = {
					"Gilded Priestess", -- [1]
					"Atal'Dazar", -- [2]
				},
				[70445] = {
					"Stormbringer Draz'kil", -- [1]
					"Throne of Thunder", -- [2]
				},
				[80808] = {
					"Neesa Nox", -- [1]
					"Iron Docks", -- [2]
				},
				[46753] = {
					"Al'Akir", -- [1]
					"Throne of the Four Winds", -- [2]
				},
				[134174] = {
					"Shadow-Borne Witch Doctor", -- [1]
					"Kings' Rest", -- [2]
				},
				[93858] = {
					"Hulking Berserker", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[134686] = {
					"Mature Krolusk", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[47265] = {
					"Twilight Whelp", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[150295] = {
					"Tank Buster MK1", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[129553] = {
					"Dinomancer Kish'o", -- [1]
					"Atal'Dazar", -- [2]
				},
				[83624] = {
					"Bloodmaul Enforcer", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[136735] = {
					"Ashvane Marine", -- [1]
					"Tol Dagor", -- [2]
				},
				[75820] = {
					"Vengeful Magma Elemental", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[150297] = {
					"Mechagon Renormalizer", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[84520] = {
					"Pitwarden Gwarnok", -- [1]
					"Iron Docks", -- [2]
				},
				[161812] = {
					"Faceless Ruiner", -- [1]
					"Chamber of Heart - Scenario", -- [2]
				},
				[152089] = {
					"Thrall", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[87719] = {
					"Ogron Hauler", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[161813] = {
					"K'thir Assassin", -- [1]
					"Chamber of Heart - Scenario", -- [2]
				},
				[127124] = {
					"Freehold Barhand", -- [1]
					"Freehold", -- [2]
				},
				[76205] = {
					"Blooded Bladefeather", -- [1]
					"Skyreach", -- [2]
				},
				[134691] = {
					"Static-charged Dervish", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[53791] = {
					"Blazing Monstrosity", -- [1]
					"Firelands", -- [2]
				},
				[76973] = {
					"Hans'gar", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[49825] = {
					"Bound Deluge", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[95652] = {
					"Grand Corruptor U'rogg", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[136483] = {
					"Ashvane Deckhand", -- [1]
					"Siege of Boralus", -- [2]
				},
				[135204] = {
					"Spectral Hex Priest", -- [1]
					"Kings' Rest", -- [2]
				},
				[151836] = {
					"Void Horror", -- [1]
					"Emerald Dream - HoA Scenario", -- [2]
				},
				[54431] = {
					"Echo of Baine", -- [1]
					"End Time", -- [2]
				},
				[138019] = {
					"Kul Tiran Vanguard", -- [1]
					"Siege of Boralus", -- [2]
				},
				[54687] = {
					"Time-Twisted Footman", -- [1]
					"End Time", -- [2]
				},
				[151325] = {
					"Alarm-o-Bot", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[76974] = {
					"Franzok", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[145185] = {
					"Gnomercy 4.U.", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[131112] = {
					"Cutwater Striker", -- [1]
					"Tol Dagor", -- [2]
				},
				[80557] = {
					"Mote of Tectus", -- [1]
					"Highmaul", -- [2]
				},
				[161562] = {
					"General Shar'az", -- [1]
					"Halls of Origination", -- [2]
				},
				[81197] = {
					"Iron Raider", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[77231] = {
					"Enforcer Sorka", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[153119] = {
					"Lesser Void Elemental", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[137511] = {
					"Bilge Rat Cutthroat", -- [1]
					"Siege of Boralus", -- [2]
				},
				[54432] = {
					"Murozond", -- [1]
					"End Time", -- [2]
				},
				[52577] = {
					"Left Foot", -- [1]
					"Firelands", -- [2]
				},
				[82733] = {
					"Night-Twisted Shadowsworn", -- [1]
					"Highmaul", -- [2]
				},
				[91305] = {
					"Fel Iron Summoner", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[130582] = {
					"Despondent Scallywag", -- [1]
					"Tol Dagor", -- [2]
				},
				[153377] = {
					"Goop", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[155680] = {
					"Deephive Summoner", -- [1]
					"Mogu'shan Scenario", -- [2]
				},
				[36969] = {
					"Skybreaker Rifleman", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[90410] = {
					"Felfire Crusher", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[129559] = {
					"Cutwater Duelist", -- [1]
					"Freehold", -- [2]
				},
				[152866] = {
					"Hardened Azerite", -- [1]
					"The Maelstrom - Heart of Azeroth", -- [2]
				},
				[125977] = {
					"Reanimation Totem", -- [1]
					"Atal'Dazar", -- [2]
				},
				[43686] = {
					"Ignacious", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[78001] = {
					"Cloudburst Totem", -- [1]
					"Waycrest Manor", -- [2]
				},
				[78641] = {
					"Night-Twisted Faithful", -- [1]
					"Highmaul", -- [2]
				},
				[80816] = {
					"Ahri'ok Dugru", -- [1]
					"Iron Docks", -- [2]
				},
				[137516] = {
					"Ashvane Invader", -- [1]
					"Siege of Boralus", -- [2]
				},
				[155684] = {
					"Depthcaller Xith'el", -- [1]
					"Mogu'shan Scenario", -- [2]
				},
				[137517] = {
					"Ashvane Destroyer", -- [1]
					"Siege of Boralus", -- [2]
				},
				[133935] = {
					"Animated Guardian", -- [1]
					"Kings' Rest", -- [2]
				},
				[68151] = {
					"Essence of Order", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[155685] = {
					"Deephive Soldier", -- [1]
					"Mogu'shan Scenario", -- [2]
				},
				[43687] = {
					"Feludius", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[112162] = {
					"Grisly Trapper", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[112290] = {
					"Horrid Eagle", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[135472] = {
					"Zanazal the Wise", -- [1]
					"Kings' Rest", -- [2]
				},
				[154663] = {
					"Gnome-Eating Droplet", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[54690] = {
					"Time-Twisted Priest", -- [1]
					"End Time", -- [2]
				},
				[83761] = {
					"Ogron Laborer", -- [1]
					"Iron Docks", -- [2]
				},
				[75829] = {
					"Nhallish", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[137521] = {
					"Irontide Powdershot", -- [1]
					"Siege of Boralus", -- [2]
				},
				[69944] = {
					"Sand Elemental", -- [1]
					"Throne of Thunder", -- [2]
				},
				[84401] = {
					"Swift Sproutling", -- [1]
					"The Everbloom", -- [2]
				},
				[152874] = {
					"Vez'okk the Lightless", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[153130] = {
					"Greater Void Elemental", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[53795] = {
					"Egg Pile", -- [1]
					"Firelands", -- [2]
				},
				[135475] = {
					"Kula the Butcher", -- [1]
					"Kings' Rest", -- [2]
				},
				[43688] = {
					"Arion", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[83762] = {
					"Grom'kar Deckhand", -- [1]
					"Iron Docks", -- [2]
				},
				[54435] = {
					"Ahriak", -- [1]
					"End Time", -- [2]
				},
				[54691] = {
					"Time-Twisted Sorceress", -- [1]
					"End Time", -- [2]
				},
				[133430] = {
					"Venture Co. Mastermind", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[75191] = {
					"Bloodmaul Slaver", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[46951] = {
					"Chosen Warrior", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[83763] = {
					"Grom'kar Technician", -- [1]
					"Iron Docks", -- [2]
				},
				[61408] = {
					"Adarogg", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[76087] = {
					"Defense Construct", -- [1]
					"Skyreach", -- [2]
				},
				[133943] = {
					"Minion of Zul", -- [1]
					"Kings' Rest", -- [2]
				},
				[94894] = {
					"Keen-Eyed Gronnstalker", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[53732] = {
					"Unbound Smoldering Elemental", -- [1]
					"Firelands", -- [2]
				},
				[133432] = {
					"Venture Co. Alchemist", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[43689] = {
					"Terrastra", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[133944] = {
					"Aspix", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[45992] = {
					"Valiona", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[83892] = {
					"Life Warden Gola", -- [1]
					"The Everbloom", -- [2]
				},
				[70587] = {
					"Shale Stalker", -- [1]
					"Throne of Thunder", -- [2]
				},
				[155951] = {
					"Ruffer", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[93616] = {
					"Dreadstalker", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[46952] = {
					"Chosen Seer", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[83893] = {
					"Earthshaper Telu", -- [1]
					"The Everbloom", -- [2]
				},
				[149555] = {
					"Abomination", -- [1]
					"Isle of Conquest", -- [2]
				},
				[155952] = {
					"Suffer", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[136250] = {
					"Hoodoo Hexer", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[37229] = {
					"Frostwarden Sorceress", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[111528] = {
					"Deathroot Ancient", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[95280] = {
					"Kaz'rogal", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[133436] = {
					"Venture Co. Skyscorcher", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[45993] = {
					"Theralion", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[83894] = {
					"Dulhu", -- [1]
					"The Everbloom", -- [2]
				},
				[38125] = {
					"Ymirjar Deathbringer", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[54693] = {
					"Time-Twisted Rifleman", -- [1]
					"End Time", -- [2]
				},
				[53094] = {
					"Patriarch Fire Turtle", -- [1]
					"Firelands", -- [2]
				},
				[47017] = {
					"Fire Elemental", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[47081] = {
					"Elemental Firelord", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[86326] = {
					"Breaker Ritualist", -- [1]
					"Highmaul", -- [2]
				},
				[61666] = {
					"Corrupted Houndmaster", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[14465] = {
					"Alliance Battle Standard", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[95282] = {
					"Azgalor", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[75452] = {
					"Bonemaw", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[151096] = {
					"Hati", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[86071] = {
					"Rokkaa", -- [1]
					"Highmaul", -- [2]
				},
				[75964] = {
					"Ranjit", -- [1]
					"Skyreach", -- [2]
				},
				[53095] = {
					"Matriarch Fire Turtle", -- [1]
					"Firelands", -- [2]
				},
				[53223] = {
					"Flamewaker Beast Handler", -- [1]
					"Firelands", -- [2]
				},
				[135234] = {
					"Diseased Mastiff", -- [1]
					"Waycrest Manor", -- [2]
				},
				[129699] = {
					"Ludwig Von Tortollan", -- [1]
					"Freehold", -- [2]
				},
				[135235] = {
					"Spectral Beastmaster", -- [1]
					"Kings' Rest", -- [2]
				},
				[75198] = {
					"Bloodmaul Geomancer", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[148797] = {
					"Magus of the Dead", -- [1]
					"Isle of Conquest", -- [2]
				},
				[86073] = {
					"Lokk", -- [1]
					"Highmaul", -- [2]
				},
				[75966] = {
					"Defiled Spirit", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[86329] = {
					"Breaker Ritualist", -- [1]
					"Highmaul", -- [2]
				},
				[52648] = {
					"Boris", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[151613] = {
					"Anti-Personnel Squirrel", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[136005] = {
					"Rowdy Reveler", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[53096] = {
					"Fire Turtle Hatchling", -- [1]
					"Firelands", -- [2]
				},
				[61412] = {
					"Dark Shaman Koranthal", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[155708] = {
					"Tentacle", -- [1]
					"Mogu'shan Scenario", -- [2]
				},
				[90296] = {
					"Soulbound Construct", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[86330] = {
					"Breaker Ritualist", -- [1]
					"Highmaul", -- [2]
				},
				[136006] = {
					"Rowdy Reveler", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[37232] = {
					"Nerub'ar Broodling", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[135239] = {
					"Spectral Witch Doctor", -- [1]
					"Kings' Rest", -- [2]
				},
				[45676] = {
					"Faceless Guardian", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[84028] = {
					"Siegemaster Rokra", -- [1]
					"Iron Docks", -- [2]
				},
				[151872] = {
					"Grip of Horror", -- [1]
					"Emerald Dream - HoA Scenario", -- [2]
				},
				[135241] = {
					"Bilge Rat Pillager", -- [1]
					"Siege of Boralus", -- [2]
				},
				[61029] = {
					"Primal Fire Elemental", -- [1]
					"Isle of Conquest", -- [2]
				},
				[83389] = {
					"Ironwing Flamespitter", -- [1]
					"Iron Docks", -- [2]
				},
				[128551] = {
					"Irontide Mastiff", -- [1]
					"Freehold", -- [2]
				},
				[77504] = {
					"Slag Behemoth", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[94008] = {
					"Dark Devourer", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[75713] = {
					"Shadowmoon Bone-Mender", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[76097] = {
					"Solar Familiar", -- [1]
					"Skyreach", -- [2]
				},
				[133963] = {
					"Test Subject", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[53545] = {
					"Molten Spewer", -- [1]
					"Firelands", -- [2]
				},
				[130087] = {
					"Irontide Raider", -- [1]
					"Tol Dagor", -- [2]
				},
				[93625] = {
					"Phantasmal Resonance", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[93881] = {
					"Contracted Engineer", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[81983] = {
					"Verdant Mandragora", -- [1]
					"The Everbloom", -- [2]
				},
				[94777] = {
					"Morkronn", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[70341] = {
					"Tormented Spirit", -- [1]
					"Throne of Thunder", -- [2]
				},
				[135245] = {
					"Bilge Rat Demolisher", -- [1]
					"Siege of Boralus", -- [2]
				},
				[87229] = {
					"Iron Blood Mage", -- [1]
					"Highmaul", -- [2]
				},
				[75459] = {
					"Plagued Bat", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[134990] = {
					"Charged Dust Devil", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[81984] = {
					"Gnarlroot", -- [1]
					"The Everbloom", -- [2]
				},
				[43119] = {
					"Spirit of Angerforge", -- [1]
					"Blackwing Descent", -- [2]
				},
				[138061] = {
					"Venture Co. Longshoreman", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[134991] = {
					"Sandfury Stonefist", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[10404] = {
					"Pustulating Horror", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[152135] = {
					"Void-Twisted Spellweaver", -- [1]
					"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
				},
				[83392] = {
					"Rampaging Clefthoof", -- [1]
					"Iron Docks", -- [2]
				},
				[45870] = {
					"Anshal", -- [1]
					"Throne of the Four Winds", -- [2]
				},
				[157253] = {
					"Ka'zir", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[127019] = {
					"Training Dummy", -- [1]
					"Freehold", -- [2]
				},
				[131666] = {
					"Coven Thornshaper", -- [1]
					"Waycrest Manor", -- [2]
				},
				[94779] = {
					"Sovokk", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[157254] = {
					"Tek'ris", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[134993] = {
					"Mchimba the Embalmer", -- [1]
					"Kings' Rest", -- [2]
				},
				[131667] = {
					"Soulbound Goliath", -- [1]
					"Waycrest Manor", -- [2]
				},
				[42800] = {
					"Golem Sentry", -- [1]
					"Blackwing Descent", -- [2]
				},
				[134994] = {
					"Spectral Headhunter", -- [1]
					"Kings' Rest", -- [2]
				},
				[47150] = {
					"Earth Ravager", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[158279] = {
					"Haywire Clockwork Rocket Bot", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[159303] = {
					"Monstrous Behemoth", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[131669] = {
					"Jagged Hound", -- [1]
					"Waycrest Manor", -- [2]
				},
				[133972] = {
					"Heavy Cannon", -- [1]
					"Tol Dagor", -- [2]
				},
				[45871] = {
					"Nezir", -- [1]
					"Throne of the Four Winds", -- [2]
				},
				[81603] = {
					"Champion Druna", -- [1]
					"Iron Docks", -- [2]
				},
				[135764] = {
					"Explosive Totem", -- [1]
					"Kings' Rest", -- [2]
				},
				[152396] = {
					"Guardian of Azeroth", -- [1]
					"Isle of Conquest", -- [2]
				},
				[159305] = {
					"Maddened Conscript", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[155723] = {
					"Swarmguard Kzaz", -- [1]
					"Mogu'shan Scenario", -- [2]
				},
				[135765] = {
					"Torrent Totem", -- [1]
					"Kings' Rest", -- [2]
				},
				[36724] = {
					"Servant of the Throne", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[47087] = {
					"Azureborne Destroyer", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[47151] = {
					"Wind Breaker", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[133463] = {
					"Venture Co. War Machine", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[90432] = {
					"Felfire Flamebelcher", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[61672] = {
					"Dark Shaman Acolyte", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[89] = {
					"Infernal", -- [1]
					"Isle of Conquest", -- [2]
				},
				[158284] = {
					"Craggle Wobbletop", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[134232] = {
					"Hired Assassin", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[48047] = {
					"Twilight Whelp", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[75976] = {
					"Low-Born Arakkoa", -- [1]
					"Skyreach", -- [2]
				},
				[158285] = {
					"Tinkered Shieldbot", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[158286] = {
					"Reprogrammed Warbot", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[79303] = {
					"Adorned Bladetalon", -- [1]
					"Skyreach", -- [2]
				},
				[42802] = {
					"Drakonid Slayer", -- [1]
					"Blackwing Descent", -- [2]
				},
				[36725] = {
					"Nerub'ar Broodkeeper", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[36853] = {
					"Sindragosa", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[47152] = {
					"Twilight Elementalist", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[80071] = {
					"Bladespire Sorcerer", -- [1]
					"Highmaul", -- [2]
				},
				[69964] = {
					"Kanrethad Ebonlocke", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[68173] = {
					"Freed Imp", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[139097] = {
					"Sandswept Marksman", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[131677] = {
					"Heartsbane Runeweaver", -- [1]
					"Waycrest Manor", -- [2]
				},
				[75210] = {
					"Bloodmaul Warder", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[48048] = {
					"Twilight Whelp", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[90435] = {
					"Kormrok", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[68174] = {
					"Unbound Nightlord", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[91331] = {
					"Archimonde", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[75211] = {
					"Magma Lord", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[42803] = {
					"Drakeadon Mongrel", -- [1]
					"Blackwing Descent", -- [2]
				},
				[136541] = {
					"Bile Oozeling", -- [1]
					"Waycrest Manor", -- [2]
				},
				[94018] = {
					"Shadow Burster", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[81864] = {
					"Dreadpetal", -- [1]
					"The Everbloom", -- [2]
				},
				[151638] = {
					"Crazed Earth Rager", -- [1]
					"Neltharion's Lair - HoA Scenario", -- [2]
				},
				[75979] = {
					"Exhumed Spirit", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[68175] = {
					"Unbound Bonemender", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[157268] = {
					"Crawling Corruption", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[135007] = {
					"Orb Guardian", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[135263] = {
					"Ashvane Spotter", -- [1]
					"Siege of Boralus", -- [2]
				},
				[153942] = {
					"Annihilator Lak'hal", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[128434] = {
					"Feasting Skyscreamer", -- [1]
					"Atal'Dazar", -- [2]
				},
				[81737] = {
					"Unchecked Growth", -- [1]
					"The Everbloom", -- [2]
				},
				[153943] = {
					"Decimator Shiq'voth", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[68176] = {
					"Unbound Centurion", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[88902] = {
					"Mol'dana Two-Blade", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[128435] = {
					"Toxic Saurid", -- [1]
					"Atal'Dazar", -- [2]
				},
				[53167] = {
					"Unbound Pyrelord", -- [1]
					"Firelands", -- [2]
				},
				[36855] = {
					"Lady Deathwhisper", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[94916] = {
					"Fel Touched Seer", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[76877] = {
					"Gruul", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[131685] = {
					"Runic Disciple", -- [1]
					"Waycrest Manor", -- [2]
				},
				[138338] = {
					"Reanimated Guardian", -- [1]
					"The Underrot", -- [2]
				},
				[48050] = {
					"Twilight Whelp", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[162647] = {
					"Willing Sacrifice", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[77006] = {
					"Corpse Skitterling", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[152669] = {
					"Void Globule", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[136549] = {
					"Ashvane Cannoneer", -- [1]
					"Siege of Boralus", -- [2]
				},
				[157275] = {
					"Darkwhisper Disciple", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[43125] = {
					"Spirit of Moltenfist", -- [1]
					"Blackwing Descent", -- [2]
				},
				[41270] = {
					"Onyxia", -- [1]
					"Blackwing Descent", -- [2]
				},
				[53616] = {
					"Kar the Everburning", -- [1]
					"Firelands", -- [2]
				},
				[137830] = {
					"Pallid Gorger", -- [1]
					"Waycrest Manor", -- [2]
				},
				[130485] = {
					"Mechanized Peacekeeper", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[132713] = {
					"Mogul Razdunk", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[139110] = {
					"Spark Channeler", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[127799] = {
					"Dazar'ai Honor Guard", -- [1]
					"Atal'Dazar", -- [2]
				},
				[151649] = {
					"Defense Bot Mk I", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[133482] = {
					"Crawler Mine", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[75857] = {
					"Unstable Magma Elemental", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[43126] = {
					"Spirit of Thaurissan", -- [1]
					"Blackwing Descent", -- [2]
				},
				[152162] = {
					"Void-Twisted Skystriker", -- [1]
					"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
				},
				[134251] = {
					"Seneschal M'bara", -- [1]
					"Kings' Rest", -- [2]
				},
				[53617] = {
					"Molten Erupter", -- [1]
					"Firelands", -- [2]
				},
				[80719] = {
					"Iron Smith", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[129208] = {
					"Dread Captain Lockwood", -- [1]
					"Siege of Boralus", -- [2]
				},
				[113088] = {
					"Corrupted Feeler", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[52530] = {
					"Alysrazor", -- [1]
					"Firelands", -- [2]
				},
				[74579] = {
					"Molten Elemental", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[78801] = {
					"Darkshard Acidback", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[130488] = {
					"Mech Jockey", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[46965] = {
					"Cho'gall", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[90316] = {
					"Shadow-Lord Iskar", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[61678] = {
					"Corrupted Reaver", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[70230] = {
					"Zandalari Blade Initiate", -- [1]
					"Throne of Thunder", -- [2]
				},
				[85711] = {
					"Aquatic Technician", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[151144] = {
					"Hati", -- [1]
					"Isle of Conquest", -- [2]
				},
				[94283] = {
					"Shadow Infuser", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[76116] = {
					"Diving Chakram Spinner", -- [1]
					"Skyreach", -- [2]
				},
				[158565] = {
					"Naros", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[86607] = {
					"Iron Flame Technician", -- [1]
					"Highmaul", -- [2]
				},
				[161124] = {
					"Urg'roth, Breaker of Heroes", -- [1]
					"Kings' Rest", -- [2]
				},
				[83025] = {
					"Grom'kar Battlemaster", -- [1]
					"Iron Docks", -- [2]
				},
				[94284] = {
					"Fiery Enkindler", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[43128] = {
					"Spirit of Anvilrage", -- [1]
					"Blackwing Descent", -- [2]
				},
				[158567] = {
					"Tormented Kor'kron Annihilator", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[94924] = {
					"Iron Peon", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[83026] = {
					"Siegemaster Olugar", -- [1]
					"Iron Docks", -- [2]
				},
				[131445] = {
					"Block Warden", -- [1]
					"Tol Dagor", -- [2]
				},
				[69465] = {
					"Jin'rokh the Breaker", -- [1]
					"Throne of Thunder", -- [2]
				},
				[94285] = {
					"Fel Extractor", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[134005] = {
					"Shalebiter", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[86609] = {
					"Iron Warmaster", -- [1]
					"Highmaul", -- [2]
				},
				[78549] = {
					"Gorian Reaver", -- [1]
					"Highmaul", -- [2]
				},
				[153196] = {
					"Scrapbone Grunter", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[78933] = {
					"Herald of Sunrise", -- [1]
					"Skyreach", -- [2]
				},
				[141938] = {
					"Ashvane Sniper", -- [1]
					"Siege of Boralus", -- [2]
				},
				[87761] = {
					"Dungeoneer's Training Dummy", -- [1]
					"FW Horde Garrison Level 3", -- [2]
				},
				[43129] = {
					"Spirit of Shadowforge", -- [1]
					"Blackwing Descent", -- [2]
				},
				[141939] = {
					"Ashvane Spotter", -- [1]
					"Siege of Boralus", -- [2]
				},
				[37116] = {
					"Skybreaker Sorcerer", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[83028] = {
					"Grom'kar Deadeye", -- [1]
					"Iron Docks", -- [2]
				},
				[129214] = {
					"Coin-Operated Crowd Pummeler", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[144244] = {
					"The Platinum Pummeler", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[129598] = {
					"Freehold Pack Mule", -- [1]
					"Freehold", -- [2]
				},
				[42362] = {
					"Drakonid Drudge", -- [1]
					"Blackwing Descent", -- [2]
				},
				[60849] = {
					"Jade Serpent Statue", -- [1]
					"Isle of Conquest", -- [2]
				},
				[93392] = {
					"Captured Prisoner", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[81750] = {
					"Bloodmaul Ogron", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[43130] = {
					"Spirit of Burningeye", -- [1]
					"Blackwing Descent", -- [2]
				},
				[144246] = {
					"K.U.-J.0.", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[86612] = {
					"Spore Shooter", -- [1]
					"Highmaul", -- [2]
				},
				[80599] = {
					"Night-Twisted Earthwarper", -- [1]
					"Highmaul", -- [2]
				},
				[105419] = {
					"Dire Basilisk", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[37501] = {
					"Nerub'ar Champion", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[134012] = {
					"Taskmaster Askari", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[144248] = {
					"Head Machinist Sparkflux", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[129600] = {
					"Bilge Rat Brinescale", -- [1]
					"Freehold", -- [2]
				},
				[144249] = {
					"Omega Buster", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[157811] = {
					"Lilliam Sparkspindle", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[53494] = {
					"Baleroc", -- [1]
					"Firelands", -- [2]
				},
				[94802] = {
					"Voidscribe Aathalos", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[157812] = {
					"Billibub Cogspinner", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[37502] = {
					"Nerub'ar Webweaver", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[132481] = {
					"Kul Tiran Vanguard", -- [1]
					"Siege of Boralus", -- [2]
				},
				[106317] = {
					"Storm Totem", -- [1]
					"Isle of Conquest", -- [2]
				},
				[131009] = {
					"Spirit of Gold", -- [1]
					"Atal'Dazar", -- [2]
				},
				[157813] = {
					"Sprite Jumpsprocket", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[135552] = {
					"Deathtouched Slaver", -- [1]
					"Waycrest Manor", -- [2]
				},
				[129602] = {
					"Irontide Enforcer", -- [1]
					"Freehold", -- [2]
				},
				[91349] = {
					"Mannoroth", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[46842] = {
					"Pulsing Twilight Egg", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[77404] = {
					"The Butcher", -- [1]
					"Highmaul", -- [2]
				},
				[158327] = {
					"Crackling Shard", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[76253] = {
					"Dread Raven Hatchling", -- [1]
					"Skyreach", -- [2]
				},
				[94804] = {
					"Shambling Hulk", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[79068] = {
					"Iron Grunt", -- [1]
					"Highmaul", -- [2]
				},
				[150396] = {
					"Aerial Unit R-21/X", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[152699] = {
					"Voidbound Berserker", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[87768] = {
					"Night-Twisted Fanatic", -- [1]
					"Highmaul", -- [2]
				},
				[106319] = {
					"Ember Totem", -- [1]
					"Isle of Conquest", -- [2]
				},
				[90199] = {
					"Gorefiend", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[150397] = {
					"King Mechagon", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[150142] = {
					"Scrapbone Trashtosser", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[126918] = {
					"Irontide Crackshot", -- [1]
					"Freehold", -- [2]
				},
				[150143] = {
					"Scrapbone Grinder", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[94806] = {
					"Fel Hellweaver", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[81117] = {
					"Karnor the Cruel", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[134024] = {
					"Devouring Maggot", -- [1]
					"Waycrest Manor", -- [2]
				},
				[75360] = {
					"Searing Ember", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[41918] = {
					"Animated Bone Warrior", -- [1]
					"Blackwing Descent", -- [2]
				},
				[126919] = {
					"Irontide Stormcaller", -- [1]
					"Freehold", -- [2]
				},
				[52409] = {
					"Ragnaros", -- [1]
					"Firelands", -- [2]
				},
				[152704] = {
					"Crawling Corruption", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[135049] = {
					"Dreadwing Raven", -- [1]
					"Waycrest Manor", -- [2]
				},
				[99541] = {
					"Risen Skulker", -- [1]
					"Isle of Conquest", -- [2]
				},
				[150146] = {
					"Scrapbone Shaman", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[87515] = {
					"Iron Flame Binder", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[87771] = {
					"Slagshop Worker", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[128967] = {
					"Ashvane Sniper", -- [1]
					"Siege of Boralus", -- [2]
				},
				[135562] = {
					"Venomous Ophidian", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[94808] = {
					"Hellfire Guardian", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[84957] = {
					"Putrid Pyromancer", -- [1]
					"The Everbloom", -- [2]
				},
				[62005] = {
					"Beast", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[79200] = {
					"Blackrock Forge Specialist", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[54073] = {
					"Flamewaker Hound Master", -- [1]
					"Firelands", -- [2]
				},
				[93913] = {
					"Fel Scorcher", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[135052] = {
					"Blight Toad", -- [1]
					"Waycrest Manor", -- [2]
				},
				[157825] = {
					"Crazed Tormenter", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[136076] = {
					"Agitated Nimbus", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[70245] = {
					"Training Dummy", -- [1]
					"Throne of Thunder", -- [2]
				},
				[161408] = {
					"Malicious Growth", -- [1]
					"Kings' Rest", -- [2]
				},
				[128969] = {
					"Ashvane Commander", -- [1]
					"Siege of Boralus", -- [2]
				},
				[82400] = {
					"Ogron Brute", -- [1]
					"Highmaul", -- [2]
				},
				[70246] = {
					"Spirit Flayer", -- [1]
					"Throne of Thunder", -- [2]
				},
				[137614] = {
					"Demolishing Terror", -- [1]
					"Siege of Boralus", -- [2]
				},
				[154758] = {
					"Toxic Monstrosity", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[69351] = {
					"Greater Cave Bat", -- [1]
					"Throne of Thunder", -- [2]
				},
				[137103] = {
					"Blood Visage", -- [1]
					"The Underrot", -- [2]
				},
				[133007] = {
					"Unbound Abomination", -- [1]
					"The Underrot", -- [2]
				},
				[138281] = {
					"Faceless Corruptor", -- [1]
					"The Underrot", -- [2]
				},
				[76132] = {
					"Soaring Chakram Master", -- [1]
					"Skyreach", -- [2]
				},
				[131383] = {
					"Sporecaller Zancha", -- [1]
					"The Underrot", -- [2]
				},
				[134284] = {
					"Fallen Deathspeaker", -- [1]
					"The Underrot", -- [2]
				},
				[133870] = {
					"Diseased Lasher", -- [1]
					"The Underrot", -- [2]
				},
				[133685] = {
					"Befouled Spirit", -- [1]
					"The Underrot", -- [2]
				},
				[133663] = {
					"Fanatical Headhunter", -- [1]
					"The Underrot", -- [2]
				},
				[131436] = {
					"Chosen Blood Matron", -- [1]
					"The Underrot", -- [2]
				},
				[131402] = {
					"Underrot Tick", -- [1]
					"The Underrot", -- [2]
				},
				[150154] = {
					"Saurolisk Bonenipper", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[161815] = {
					"K'thir Voidcaller", -- [1]
					"Chamber of Heart - Scenario", -- [2]
				},
				[157483] = {
					"Ysedra the Darkener", -- [1]
					"Halls of Origination", -- [2]
				},
				[69352] = {
					"Vampiric Cave Bat", -- [1]
					"Throne of Thunder", -- [2]
				},
				[158171] = {
					"Faceless Destroyer", -- [1]
					"Halls of Origination", -- [2]
				},
				[157709] = {
					"Dreliana", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[37534] = {
					"Spinestalker", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[129227] = {
					"Azerokk", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[157137] = {
					"Terror Tendril", -- [1]
					"Halls of Origination", -- [2]
				},
				[37531] = {
					"Frostwarden Handler", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[37228] = {
					"Frostwarden Warrior", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[133852] = {
					"Living Rot", -- [1]
					"The Underrot", -- [2]
				},
				[53691] = {
					"Shannox", -- [1]
					"Firelands", -- [2]
				},
				[155706] = {
					"Yox'ith", -- [1]
					"Mogu'shan Scenario", -- [2]
				},
				[78948] = {
					"Tectus", -- [1]
					"Highmaul", -- [2]
				},
				[155930] = {
					"Deephive Chosen", -- [1]
					"Mogu'shan Scenario", -- [2]
				},
				[37571] = {
					"Darkfallen Advisor", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[87520] = {
					"Animated Slag", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[130635] = {
					"Stonefury", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[80048] = {
					"Vul'gor", -- [1]
					"Highmaul", -- [2]
				},
				[152836] = {
					"Azerite Borer", -- [1]
					"The Maelstrom - Heart of Azeroth", -- [2]
				},
				[69791] = {
					"Xuenray", -- [1]
					"Isle of Conquest", -- [2]
				},
				[37955] = {
					"Blood-Queen Lana'thel", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[88288] = {
					"Dungeoneer's Training Dummy", -- [1]
					"FW Horde Garrison Level 3", -- [2]
				},
				[127490] = {
					"Knight Captain Valyri", -- [1]
					"Tol Dagor", -- [2]
				},
				[155657] = {
					"Huffer", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[37663] = {
					"Darkfallen Noble", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[76518] = {
					"Ritual of Bones", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[83390] = {
					"Thunderlord Wrangler", -- [1]
					"Iron Docks", -- [2]
				},
				[91103] = {
					"Felfire Demolisher", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[37782] = {
					"Flesh-eating Insect", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[37217] = {
					"Precious", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[36829] = {
					"Deathspeaker High Priest", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[87521] = {
					"Iron Slag-Shaper", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[69388] = {
					"Zandalari Spear-Shaper", -- [1]
					"Throne of Thunder", -- [2]
				},
				[53116] = {
					"Unbound Blazing Elemental", -- [1]
					"Firelands", -- [2]
				},
				[71529] = {
					"Demossauro", -- [1]
					"Isle of Conquest", -- [2]
				},
				[53244] = {
					"Flamewaker Trainee", -- [1]
					"Firelands", -- [2]
				},
				[34778] = {
					"Flame Turret", -- [1]
					"Isle of Conquest", -- [2]
				},
				[69132] = {
					"High Priestess Mar'li", -- [1]
					"Throne of Thunder", -- [2]
				},
				[150159] = {
					"King Gobbamak", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[37148] = {
					"Skybreaker Summoner", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[82532] = {
					"Krush", -- [1]
					"Highmaul", -- [2]
				},
				[36612] = {
					"Lord Marrowgar", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[93023] = {
					"Siegemaster Mar'tak", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[37016] = {
					"Skybreaker Luminary", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[3671] = {
					"Lady Anacondra", -- [1]
					"Wailing Caverns", -- [2]
				},
				[158092] = {
					"Fallen Heartpiercer", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[150160] = {
					"Scrapbone Bully", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[5053] = {
					"Deviate Crocolisk", -- [1]
					"Wailing Caverns", -- [2]
				},
				[79462] = {
					"Blinding Solar Flare", -- [1]
					"Skyreach", -- [2]
				},
				[47086] = {
					"Crimsonborne Firestarter", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[128455] = {
					"T'lonja", -- [1]
					"Atal'Dazar", -- [2]
				},
				[37038] = {
					"Vengeful Fleshreaper", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[163978] = {
					"Darkwhisper Cultist", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[90284] = {
					"Iron Reaver", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[69899] = {
					"Farraki Sand Conjurer", -- [1]
					"Throne of Thunder", -- [2]
				},
				[134041] = {
					"Infected Peasant", -- [1]
					"Waycrest Manor", -- [2]
				},
				[68204] = {
					"Unbound Rogue", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[151658] = {
					"Strider Tonk", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[37021] = {
					"Skybreaker Vicar", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[41442] = {
					"Atramedes", -- [1]
					"Blackwing Descent", -- [2]
				},
				[90269] = {
					"Tyrant Velhari", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[152722] = {
					"Fallen Voidspeaker", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[69131] = {
					"Frost King Malakk", -- [1]
					"Throne of Thunder", -- [2]
				},
				[91520] = {
					"Adjunct Kuroh", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[79463] = {
					"Radiant Supernova", -- [1]
					"Skyreach", -- [2]
				},
				[81638] = {
					"Aqueous Globule", -- [1]
					"The Everbloom", -- [2]
				},
				[36805] = {
					"Deathspeaker Servant", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[126928] = {
					"Irontide Corsair", -- [1]
					"Freehold", -- [2]
				},
				[135322] = {
					"The Golden Serpent", -- [1]
					"Kings' Rest", -- [2]
				},
				[137625] = {
					"Demolishing Terror", -- [1]
					"Siege of Boralus", -- [2]
				},
				[86372] = {
					"Melded Berserker", -- [1]
					"The Everbloom", -- [2]
				},
				[82534] = {
					"Spike", -- [1]
					"Highmaul", -- [2]
				},
				[68205] = {
					"Unbound Succubus", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[81114] = {
					"Gronnling Laborer", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[143985] = {
					"Absorb-o-Tron", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[34777] = {
					"Siege Turret", -- [1]
					"Isle of Conquest", -- [2]
				},
				[152718] = {
					"Alleria Windrunner", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[137626] = {
					"Demolishing Terror", -- [1]
					"Siege of Boralus", -- [2]
				},
				[79208] = {
					"Blackrock Enforcer", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[84399] = {
					"Vicious Mandragora", -- [1]
					"The Everbloom", -- [2]
				},
				[132056] = {
					"Venture Co. Skyscorcher", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[87780] = {
					"Slagshop Brute", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[81767] = {
					"Bloodmaul Flamespeaker", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[156818] = {
					"Wrathion", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[122963] = {
					"Rezan", -- [1]
					"Atal'Dazar", -- [2]
				},
				[129232] = {
					"Mogul Razdunk", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[92514] = {
					"Shao'ghun", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[76266] = {
					"High Sage Viryx", -- [1]
					"Skyreach", -- [2]
				},
				[68206] = {
					"Unbound Shivarra", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[74475] = {
					"Magmolatus", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[5925] = {
					"Grounding Totem", -- [1]
					"Isle of Conquest", -- [2]
				},
				[93154] = {
					"Gorebound Crone", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[76906] = {
					"Operator Thogar", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[100497] = {
					"Ursoc", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[1860] = {
					"Jhazdok", -- [1]
					"Isle of Conquest", -- [2]
				},
				[105427] = {
					"Skyfury Totem", -- [1]
					"Isle of Conquest", -- [2]
				},
				[36678] = {
					"Professor Putricide", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[10741] = {
					"Cat", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[130896] = {
					"Blackout Barrel", -- [1]
					"Freehold", -- [2]
				},
				[6498] = {
					"Devilsaur", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[76306] = {
					"Grand Defense Construct", -- [1]
					"Skyreach", -- [2]
				},
				[36998] = {
					"Skybreaker Protector", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[150222] = {
					"Gunker", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[37126] = {
					"Sister Svalna", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[123476] = {
					"Hulking Demolisher", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[53630] = {
					"Unstable Pyrelord", -- [1]
					"Firelands", -- [2]
				},
				[53694] = {
					"Riplimb", -- [1]
					"Firelands", -- [2]
				},
				[417] = {
					"Khuunam", -- [1]
					"Isle of Conquest", -- [2]
				},
				[155797] = {
					"Animated Guardian", -- [1]
					"Mogu'shan Scenario", -- [2]
				},
				[34802] = {
					"Glaive Thrower", -- [1]
					"Isle of Conquest", -- [2]
				},
				[150168] = {
					"Toxic Monstrosity", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[76806] = {
					"Heart of the Mountain", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[79466] = {
					"Initiate of the Rising Sun", -- [1]
					"Skyreach", -- [2]
				},
				[157333] = {
					"Darkwhisper Cultist", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[87910] = {
					"Gorian Rune-Mender", -- [1]
					"Highmaul", -- [2]
				},
				[90272] = {
					"Ancient Sovereign", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[122965] = {
					"Vol'kaal", -- [1]
					"Atal'Dazar", -- [2]
				},
				[100576] = {
					"Nightmare Image", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[42180] = {
					"Toxitron", -- [1]
					"Blackwing Descent", -- [2]
				},
				[133379] = {
					"Adderis", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[74349] = {
					"Bloodmaul Magma Binder", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[94947] = {
					"Fel-Starved Trainee", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[24207] = {
					"Army of the Dead", -- [1]
					"Isle of Conquest", -- [2]
				},
				[93156] = {
					"Eredar Faithbreaker", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[135329] = {
					"Matron Bryndle", -- [1]
					"Waycrest Manor", -- [2]
				},
				[75193] = {
					"Bloodmaul Overseer", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[151639] = {
					"Crazed Gyreworm", -- [1]
					"Neltharion's Lair - HoA Scenario", -- [2]
				},
				[140447] = {
					"Demolishing Terror", -- [1]
					"Siege of Boralus", -- [2]
				},
				[79467] = {
					"Adept of the Dawn", -- [1]
					"Skyreach", -- [2]
				},
				[53119] = {
					"Flamewaker Forward Guard", -- [1]
					"Firelands", -- [2]
				},
				[36807] = {
					"Deathspeaker Disciple", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[76376] = {
					"Skyreach Arcanologist", -- [1]
					"Skyreach", -- [2]
				},
				[111004] = {
					"Gelatinized Decay", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[131492] = {
					"Devout Blood Priest", -- [1]
					"The Underrot", -- [2]
				},
				[76141] = {
					"Araknath", -- [1]
					"Skyreach", -- [2]
				},
				[37127] = {
					"Ymirjar Frostbinder", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[123478] = {
					"Antoran Felguard", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[53631] = {
					"Cinderweb Spiderling", -- [1]
					"Firelands", -- [2]
				},
				[84841] = {
					"Iron Dockworker", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[80875] = {
					"Bombsquad", -- [1]
					"Iron Docks", -- [2]
				},
				[139425] = {
					"Crazed Incubator", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[45699] = {
					"Twilight Shadow Mender", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[158588] = {
					"Gamon", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[54015] = {
					"Majordomo Staghelm", -- [1]
					"Firelands", -- [2]
				},
				[95813] = {
					"Weaponlord Mehlkhior", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[54143] = {
					"Molten Flamefather", -- [1]
					"Firelands", -- [2]
				},
				[157337] = {
					"Spawn of Shad'har", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[46083] = {
					"Drakeadon Mongrel", -- [1]
					"Blackwing Descent", -- [2]
				},
				[153755] = {
					"Naeno Megacrash", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[44164] = {
					"Raptor", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[153141] = {
					"Endless Hunger Totem", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[94693] = {
					"Siegeworks Technician", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[130435] = {
					"Addled Thug", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[152988] = {
					"Faceless Shadowcaller", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[153244] = {
					"Oblivion Elemental", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[157594] = {
					"Lesser Void Elemental", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[137029] = {
					"Ordnance Specialist", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[130437] = {
					"Mine Rat", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[82528] = {
					"Gorian Arcanist", -- [1]
					"Highmaul", -- [2]
				},
				[154524] = {
					"K'thir Mindcarver", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[79469] = {
					"Whirling Dervish", -- [1]
					"Skyreach", -- [2]
				},
				[53120] = {
					"Flamewaker Pathfinder", -- [1]
					"Firelands", -- [2]
				},
				[36808] = {
					"Deathspeaker Zealot", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[61658] = {
					"Mature Flame Hound", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[122968] = {
					"Yazma", -- [1]
					"Atal'Dazar", -- [2]
				},
				[92391] = {
					"Gorebound Bloodletter", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[76143] = {
					"Rukhran", -- [1]
					"Skyreach", -- [2]
				},
				[90409] = {
					"Gorebound Felcaster", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[138369] = {
					"Footbomb Hooligan", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[144286] = {
					"Asset Manager", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[82519] = {
					"Highmaul Conscript", -- [1]
					"Highmaul", -- [2]
				},
				[158169] = {
					"Devout Disciple", -- [1]
					"Halls of Origination", -- [2]
				},
				[132491] = {
					"Kul Tiran Marksman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[45700] = {
					"Twilight Portal Shaper", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[53695] = {
					"Rageface", -- [1]
					"Firelands", -- [2]
				},
				[152479] = {
					"Void-Twisted Whelp", -- [1]
					"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
				},
				[137478] = {
					"Queen Wasi", -- [1]
					"Kings' Rest", -- [2]
				},
				[76444] = {
					"Subjugated Soul", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[119990] = {
					"Wolf", -- [1]
					"Isle of Conquest", -- [2]
				},
				[42768] = {
					"Maimgor", -- [1]
					"Blackwing Descent", -- [2]
				},
				[122969] = {
					"Zanchuli Witch-Doctor", -- [1]
					"Atal'Dazar", -- [2]
				},
				[43735] = {
					"Elementium Monstrosity", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[129366] = {
					"Bilge Rat Buccaneer", -- [1]
					"Siege of Boralus", -- [2]
				},
				[152009] = {
					"Malfunctioning Scrapbot", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[49826] = {
					"Bound Rumbler", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[94563] = {
					"Gorebound Fanatic", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[94733] = {
					"Felfire Demolisher", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[86684] = {
					"Feral Lasher", -- [1]
					"The Everbloom", -- [2]
				},
				[153760] = {
					"Enthralled Footman", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[137989] = {
					"Embalming Fluid", -- [1]
					"Kings' Rest", -- [2]
				},
				[81318] = {
					"Iron Gunnery Sergeant", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[144293] = {
					"Waste Processing Unit", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[61245] = {
					"Capacitor Totem", -- [1]
					"Isle of Conquest", -- [2]
				},
				[53121] = {
					"Flamewaker Cauterizer", -- [1]
					"Firelands", -- [2]
				},
				[53185] = {
					"Flamewaker Overseer", -- [1]
					"Firelands", -- [2]
				},
				[139790] = {
					"Stag", -- [1]
					"Isle of Conquest", -- [2]
				},
				[122970] = {
					"Shadowblade Stalker", -- [1]
					"Atal'Dazar", -- [2]
				},
				[135759] = {
					"Earthwall Totem", -- [1]
					"Kings' Rest", -- [2]
				},
				[129367] = {
					"Bilge Rat Tempest", -- [1]
					"Siege of Boralus", -- [2]
				},
				[144294] = {
					"Mechagon Tinkerer", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[151752] = {
					"Voidswarm", -- [1]
					"Emerald Dream - HoA Scenario", -- [2]
				},
				[80422] = {
					"Iron Marksman", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[54445] = {
					"Echo of Jaina", -- [1]
					"End Time", -- [2]
				},
				[78832] = {
					"Grom'kar Man-at-Arms", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[158452] = {
					"Mindtwist Tendril", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[127479] = {
					"The Sand Queen", -- [1]
					"Tol Dagor", -- [2]
				},
				[81305] = {
					"Fleshrender Nok'gar", -- [1]
					"Iron Docks", -- [2]
				},
				[144295] = {
					"Mechagon Mechanic", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[47161] = {
					"Twilight Brute", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[75506] = {
					"Shadowmoon Loyalist", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[93435] = {
					"Felfire Transporter", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[94185] = {
					"Vanguard Akkelion", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[122971] = {
					"Dazar'ai Juggernaut", -- [1]
					"Atal'Dazar", -- [2]
				},
				[94697] = {
					"Siegeworks Technician", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[139946] = {
					"Heart Guardian", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[144296] = {
					"Spider Tank", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[74355] = {
					"Captured Miner", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[121564] = {
					"Stagatha", -- [1]
					"Waycrest Manor", -- [2]
				},
				[93233] = {
					"Lord Aram'el", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[93162] = {
					"Umbral Supplicant", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[87989] = {
					"Forgemistress Flamehand", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[155094] = {
					"Mechagon Trooper", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[69916] = {
					"Gurubashi Berserker", -- [1]
					"Throne of Thunder", -- [2]
				},
				[129547] = {
					"Blacktooth Knuckleduster", -- [1]
					"Freehold", -- [2]
				},
				[128652] = {
					"Viq'Goth", -- [1]
					"Siege of Boralus", -- [2]
				},
				[156577] = {
					"Therum Deepforge", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[44600] = {
					"Halfus Wyrmbreaker", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[157603] = {
					"Void Globule", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[122972] = {
					"Dazar'ai Augur", -- [1]
					"Atal'Dazar", -- [2]
				},
				[43324] = {
					"Cho'gall", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[129369] = {
					"Irontide Raider", -- [1]
					"Siege of Boralus", -- [2]
				},
				[144298] = {
					"Defense Bot Mk III", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[74356] = {
					"Captured Miner", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[158056] = {
					"Rat", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[112153] = {
					"Dire Shaman", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[157604] = {
					"Crawling Corruption", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[144299] = {
					"Workshop Defender", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[42767] = {
					"Ivoroc", -- [1]
					"Blackwing Descent", -- [2]
				},
				[139949] = {
					"Plague Doctor", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[3636] = {
					"Deviate Ravager", -- [1]
					"Wailing Caverns", -- [2]
				},
				[3640] = {
					"Evolving Ectoplasm", -- [1]
					"Wailing Caverns", -- [2]
				},
				[93931] = {
					"Gorebound Felcaster", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[157349] = {
					"Void Boar", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[163746] = {
					"Walkie Shockie X1", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[151579] = {
					"Shield Generator", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[38154] = {
					"Warhawk", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[129370] = {
					"Irontide Waveshaper", -- [1]
					"Siege of Boralus", -- [2]
				},
				[144300] = {
					"Mechagon Citizen", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[74357] = {
					"Captured Miner", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[132530] = {
					"Kul Tiran Vanguard", -- [1]
					"Siege of Boralus", -- [2]
				},
				[3680] = {
					"Serpentbloom Snake", -- [1]
					"Wailing Caverns", -- [2]
				},
				[85225] = {
					"Gorian Sorcerer", -- [1]
					"Highmaul", -- [2]
				},
				[84990] = {
					"Addled Arcanomancer", -- [1]
					"The Everbloom", -- [2]
				},
				[81522] = {
					"Witherbark", -- [1]
					"The Everbloom", -- [2]
				},
				[36811] = {
					"Deathspeaker Attendant", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[144301] = {
					"Living Waste", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[77428] = {
					"Imperator Mar'gok", -- [1]
					"Highmaul", -- [2]
				},
				[75509] = {
					"Sadana Bloodfury", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[53187] = {
					"Flamewaker Animator", -- [1]
					"Firelands", -- [2]
				},
				[157607] = {
					"Faceless Shadowcaller", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[86256] = {
					"Gorian High Sorcerer", -- [1]
					"Highmaul", -- [2]
				},
				[37003] = {
					"Skybreaker Vindicator", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[129371] = {
					"Riptide Shredder", -- [1]
					"Siege of Boralus", -- [2]
				},
				[127757] = {
					"Reanimated Honor Guard", -- [1]
					"Atal'Dazar", -- [2]
				},
				[76884] = {
					"Cruelfang", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[53635] = {
					"Cinderweb Drone", -- [1]
					"Firelands", -- [2]
				},
				[157608] = {
					"Faceless Willbreaker", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[130011] = {
					"Irontide Buccaneer", -- [1]
					"Freehold", -- [2]
				},
				[53222] = {
					"Flamewaker Centurion", -- [1]
					"Firelands", -- [2]
				},
				[45703] = {
					"Faceless Minion", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[76307] = {
					"Grand Defense Construct", -- [1]
					"Skyreach", -- [2]
				},
				[144303] = {
					"G.U.A.R.D.", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[129552] = {
					"Monzumi", -- [1]
					"Atal'Dazar", -- [2]
				},
				[77557] = {
					"Admiral Gar'an", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[81779] = {
					"Ogron Mauler", -- [1]
					"Highmaul", -- [2]
				},
				[92142] = {
					"Blademaster Jubei'thos", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[129372] = {
					"Blacktar Bomber", -- [1]
					"Siege of Boralus", -- [2]
				},
				[84978] = {
					"Bloodmaul Enforcer", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[92526] = {
					"Zerik'shekor", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[130012] = {
					"Irontide Ravager", -- [1]
					"Freehold", -- [2]
				},
				[133836] = {
					"Reanimated Guardian", -- [1]
					"The Underrot", -- [2]
				},
				[111333] = {
					"Taintheart Trickster", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[162238] = {
					"Darkwhisper Cultist", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[157610] = {
					"K'thir Dominator", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[87448] = {
					"Ironworker", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[79093] = {
					"Skyreach Sun Talon", -- [1]
					"Skyreach", -- [2]
				},
				[150190] = {
					"HK-8 Aerial Oppression Unit", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[130522] = {
					"Freehold Shipmate", -- [1]
					"Freehold", -- [2]
				},
				[94816] = {
					"Togdrov", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[3840] = {
					"Druid of the Fang", -- [1]
					"Wailing Caverns", -- [2]
				},
				[53188] = {
					"Flamewaker Subjugator", -- [1]
					"Firelands", -- [2]
				},
				[161437] = {
					"Explosive Scarab", -- [1]
					"Kings' Rest", -- [2]
				},
				[152987] = {
					"Faceless Willbreaker", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[37004] = {
					"Skybreaker Dreadblade", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[92527] = {
					"Dag'gorath", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[37132] = {
					"Ymirjar Battle-Maiden", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[76407] = {
					"Ner'zhul", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[92911] = {
					"Hulking Berserker", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[157356] = {
					"Extractor Thelsara", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[133835] = {
					"Feral Bloodswarmer", -- [1]
					"The Underrot", -- [2]
				},
				[93295] = {
					"Darkcaster Adept", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[76865] = {
					"Beastlord Darmac", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[81269] = {
					"Warden Thul'tok", -- [1]
					"Highmaul", -- [2]
				},
				[130909] = {
					"Fetid Maggot", -- [1]
					"The Underrot", -- [2]
				},
				[130653] = {
					"Wanton Sapper", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[77559] = {
					"Solar Magnifier", -- [1]
					"Skyreach", -- [2]
				},
				[77687] = {
					"Grom'kar Man-at-Arms", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[92144] = {
					"Dia Darkwhisper", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[93615] = {
					"Felborne Overfiend", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[87619] = {
					"Gorian Warden", -- [1]
					"Highmaul", -- [2]
				},
				[76145] = {
					"Grand Defense Construct", -- [1]
					"Skyreach", -- [2]
				},
				[86185] = {
					"Night-Twisted Supplicant", -- [1]
					"Highmaul", -- [2]
				},
				[129758] = {
					"Irontide Grenadier", -- [1]
					"Freehold", -- [2]
				},
				[88818] = {
					"Security Guard", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[68476] = {
					"Horridon", -- [1]
					"Throne of Thunder", -- [2]
				},
				[76309] = {
					"Grand Defense Construct", -- [1]
					"Skyreach", -- [2]
				},
				[81297] = {
					"Dreadfang", -- [1]
					"Iron Docks", -- [2]
				},
				[87411] = {
					"Workshop Guardian", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[81270] = {
					"Gorian Guardsman", -- [1]
					"Highmaul", -- [2]
				},
				[118244] = {
					"Spirit Beast", -- [1]
					"Isle of Conquest", -- [2]
				},
				[129231] = {
					"Rixxa Fluxflame", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[85748] = {
					"Iron Mauler", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[134157] = {
					"Shadow-Borne Warrior", -- [1]
					"Kings' Rest", -- [2]
				},
				[53224] = {
					"Flamewaker Taskmaster", -- [1]
					"Firelands", -- [2]
				},
				[141495] = {
					"Kul Tiran Footman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[144160] = {
					"Chopper Redhook", -- [1]
					"Siege of Boralus", -- [2]
				},
				[150195] = {
					"Gnome-Eating Slime", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[37133] = {
					"Ymirjar Warlord", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[134331] = {
					"King Rahu'ai", -- [1]
					"Kings' Rest", -- [2]
				},
				[92913] = {
					"Gorebound Berserker", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[95408] = {
					"Anetheron", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[76146] = {
					"Grand Defense Construct", -- [1]
					"Skyreach", -- [2]
				},
				[132532] = {
					"Kul Tiran Marksman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[43122] = {
					"Spirit of Corehammer", -- [1]
					"Blackwing Descent", -- [2]
				},
				[127503] = {
					"Overseer Korgus", -- [1]
					"Tol Dagor", -- [2]
				},
				[127381] = {
					"Silt Crab", -- [1]
					"Tol Dagor", -- [2]
				},
				[130655] = {
					"Bobby Howlis", -- [1]
					"Tol Dagor", -- [2]
				},
				[93952] = {
					"Fel Raven", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[136391] = {
					"Heart Guardian", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[151476] = {
					"Blastatron X-80", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[82039] = {
					"Rockspine Stinger", -- [1]
					"The Everbloom", -- [2]
				},
				[94832] = {
					"Gorebound Assassin", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[76154] = {
					"Skyreach Raven Whisperer", -- [1]
					"Skyreach", -- [2]
				},
				[131847] = {
					"Waycrest Reveler", -- [1]
					"Waycrest Manor", -- [2]
				},
				[75272] = {
					"Bloodmaul Ogre Mage", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[88820] = {
					"Furnace Engineer", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[133389] = {
					"Galvazzt", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[150165] = {
					"Slime Elemental", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[93298] = {
					"Shadowheart Fiend", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[130400] = {
					"Irontide Crusher", -- [1]
					"Freehold", -- [2]
				},
				[81272] = {
					"Gorian Runemaster", -- [1]
					"Highmaul", -- [2]
				},
				[134599] = {
					"Imbued Stormcaller", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[150169] = {
					"Toxic Lurker", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[53619] = {
					"Druid of the Flame", -- [1]
					"Firelands", -- [2]
				},
				[131670] = {
					"Heartsbane Vinetwister", -- [1]
					"Waycrest Manor", -- [2]
				},
				[135192] = {
					"Honored Raptor", -- [1]
					"Kings' Rest", -- [2]
				},
				[137405] = {
					"Gripping Terror", -- [1]
					"Siege of Boralus", -- [2]
				},
				[135366] = {
					"Blacktooth Arsonist", -- [1]
					"Tol Dagor", -- [2]
				},
				[92146] = {
					"Gurtogg Bloodboil", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[37134] = {
					"Ymirjar Huntress", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[153526] = {
					"Aqir Swarmer", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[88821] = {
					"Bellows Operator", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[78714] = {
					"Kargath Bladefist", -- [1]
					"Highmaul", -- [2]
				},
				[84983] = {
					"Spore Image", -- [1]
					"The Everbloom", -- [2]
				},
				[157700] = {
					"Agustus Moulaine", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[135846] = {
					"Sand-Crusted Striker", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[95602] = {
					"Mystic Velruun", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[154550] = {
					"Amathet Sun Priest", -- [1]
					"Halls of Origination", -- [2]
				},
				[150712] = {
					"Trixie Tazer", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[76778] = {
					"Life-Pact Familiar", -- [1]
					"Skyreach", -- [2]
				},
				[77182] = {
					"Oregorger", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[153527] = {
					"Aqir Swarmleader", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[45872] = {
					"Rohash", -- [1]
					"Throne of the Four Winds", -- [2]
				},
				[76102] = {
					"Air Familiar", -- [1]
					"Skyreach", -- [2]
				},
				[90485] = {
					"Felfire Artillery", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[68096] = {
					"Ashtongue Primalist", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[60932] = {
					"ash", -- [1]
					"Isle of Conquest", -- [2]
				},
				[75975] = {
					"Skyreach Overlord", -- [1]
					"Skyreach", -- [2]
				},
				[129373] = {
					"Dockhound Packmaster", -- [1]
					"Siege of Boralus", -- [2]
				},
				[84984] = {
					"Spore Image", -- [1]
					"The Everbloom", -- [2]
				},
				[86072] = {
					"Oro", -- [1]
					"Highmaul", -- [2]
				},
				[154555] = {
					"Amathet Artificer", -- [1]
					"Halls of Origination", -- [2]
				},
				[95603] = {
					"Mystic Aaran", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[42764] = {
					"Pyrecraw", -- [1]
					"Blackwing Descent", -- [2]
				},
				[41378] = {
					"Maloriak", -- [1]
					"Blackwing Descent", -- [2]
				},
				[53127] = {
					"Fire Scorpion", -- [1]
					"Firelands", -- [2]
				},
				[77692] = {
					"Kromog", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[153022] = {
					"Snang", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[156089] = {
					"Aqir Venomweaver", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[37007] = {
					"Deathbound Ward", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[74366] = {
					"Forgemaster Gog'duh", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[160183] = {
					"Void Fanatic", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[53575] = {
					"Lava Wielder", -- [1]
					"Firelands", -- [2]
				},
				[82682] = {
					"Archmage Sol", -- [1]
					"The Everbloom", -- [2]
				},
				[157368] = {
					"Velinaria", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[84985] = {
					"Spore Image", -- [1]
					"The Everbloom", -- [2]
				},
				[151739] = {
					"Ma'haat the Indomitable", -- [1]
					"Neltharion's Lair - HoA Scenario", -- [2]
				},
				[85241] = {
					"Night-Twisted Brute", -- [1]
					"Highmaul", -- [2]
				},
				[93813] = {
					"Contracted Engineer", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[154554] = {
					"Amathet Guardian", -- [1]
					"Halls of Origination", -- [2]
				},
				[83578] = {
					"Ogron Laborer", -- [1]
					"Iron Docks", -- [2]
				},
				[136643] = {
					"Azerite Extractor", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[53639] = {
					"Flamewaker Cauterizer", -- [1]
					"Firelands", -- [2]
				},
				[153531] = {
					"Aqir Bonecrusher", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[139422] = {
					"Scaled Krolusk Tamer", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[78077] = {
					"Volatile Anomaly", -- [1]
					"Highmaul", -- [2]
				},
				[129550] = {
					"Bilge Rat Padfoot", -- [1]
					"Freehold", -- [2]
				},
				[68098] = {
					"Ashtongue Worker", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[154552] = {
					"Amathet Zealot", -- [1]
					"Halls of Origination", -- [2]
				},
				[76104] = {
					"Monstrous Corpse Spider", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[83623] = {
					"Bloodmaul Warder", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[153532] = {
					"Aqir Mindhunter", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[135365] = {
					"Matron Alma", -- [1]
					"Waycrest Manor", -- [2]
				},
				[131527] = {
					"Lord Waycrest", -- [1]
					"Waycrest Manor", -- [2]
				},
				[130404] = {
					"Vermin Trapper", -- [1]
					"Freehold", -- [2]
				},
				[69455] = {
					"Zandalari Water-Binder", -- [1]
					"Throne of Thunder", -- [2]
				},
				[150547] = {
					"Scrapbone Grunter", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[53128] = {
					"Giant Fire Scorpion", -- [1]
					"Firelands", -- [2]
				},
				[75209] = {
					"Molten Earth Elemental", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[36880] = {
					"Decaying Colossus", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[151742] = {
					"Void-Twisted Invader", -- [1]
					"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
				},
				[75899] = {
					"Possessed Soul", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[41376] = {
					"Nefarian", -- [1]
					"Blackwing Descent", -- [2]
				},
				[113113] = {
					"Essence of Nightmare", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[53141] = {
					"Molten Surger", -- [1]
					"Firelands", -- [2]
				},
				[53640] = {
					"Flamewaker Sentinel", -- [1]
					"Firelands", -- [2]
				},
				[84859] = {
					"Iron Cleaver", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[81985] = {
					"Everbloom Tender", -- [1]
					"The Everbloom", -- [2]
				},
				[93303] = {
					"Slavering Hound", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[135971] = {
					"Faithless Conscript", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[131785] = {
					"Buzzing Drone", -- [1]
					"Tol Dagor", -- [2]
				},
				[80708] = {
					"Iron Taskmaster", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[130661] = {
					"Venture Co. Earthshaper", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[134600] = {
					"Sandswept Marksman", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[127486] = {
					"Ashvane Officer", -- [1]
					"Tol Dagor", -- [2]
				},
				[75715] = {
					"Reanimated Ritual Bones", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[76094] = {
					"Sun Trinket", -- [1]
					"Skyreach", -- [2]
				},
				[135975] = {
					"Off-Duty Laborer", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[152835] = {
					"Crystalized Azerite", -- [1]
					"The Maelstrom - Heart of Azeroth", -- [2]
				},
				[95613] = {
					"Binder Hallaani", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[153401] = {
					"K'thir Dominator", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[76310] = {
					"Grand Defense Construct", -- [1]
					"Skyreach", -- [2]
				},
				[84860] = {
					"Iron Earthbinder", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[80400] = {
					"Iron Assembly Warden", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[136330] = {
					"Soul Thorns", -- [1]
					"Waycrest Manor", -- [2]
				},
				[54920] = {
					"Infinite Suppressor", -- [1]
					"End Time", -- [2]
				},
				[127315] = {
					"Reanimation Totem", -- [1]
					"Atal'Dazar", -- [2]
				},
				[78583] = {
					"Dominator Turret", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[158437] = {
					"Fallen Taskmaster", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[134602] = {
					"Shrouded Fang", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[81279] = {
					"Grom'kar Flameslinger", -- [1]
					"Iron Docks", -- [2]
				},
				[137969] = {
					"Interment Construct", -- [1]
					"Kings' Rest", -- [2]
				},
				[127482] = {
					"Sewer Vicejaw", -- [1]
					"Tol Dagor", -- [2]
				},
				[137233] = {
					"Plague Toad", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[45261] = {
					"Twilight Shadow Knight", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[138247] = {
					"Irontide Marauder", -- [1]
					"Siege of Boralus", -- [2]
				},
				[70276] = {
					"No'ku Stormsayer", -- [1]
					"Throne of Thunder", -- [2]
				},
				[81780] = {
					"Guard Captain Thag", -- [1]
					"Highmaul", -- [2]
				},
				[86275] = {
					"Gorian Enforcer", -- [1]
					"Highmaul", -- [2]
				},
				[84989] = {
					"Infested Icecaller", -- [1]
					"The Everbloom", -- [2]
				},
				[61056] = {
					"Primal Earth Elemental", -- [1]
					"Isle of Conquest", -- [2]
				},
				[111856] = {
					"Guardian Gorroc", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[144071] = {
					"Irontide Waveshaper", -- [1]
					"Siege of Boralus", -- [2]
				},
				[136139] = {
					"Mechanized Peacekeeper", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[89011] = {
					"Rylak Skyterror", -- [1]
					"Iron Docks", -- [2]
				},
				[45687] = {
					"Twilight-Shifter", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[157609] = {
					"K'thir Mindcarver", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[26125] = {
					"Battaker", -- [1]
					"Isle of Conquest", -- [2]
				},
				[130521] = {
					"Freehold Deckhand", -- [1]
					"Freehold", -- [2]
				},
				[135048] = {
					"Gorestained Piglet", -- [1]
					"Waycrest Manor", -- [2]
				},
				[135699] = {
					"Ashvane Jailer", -- [1]
					"Tol Dagor", -- [2]
				},
				[138187] = {
					"Grotesque Horror", -- [1]
					"The Underrot", -- [2]
				},
				[129640] = {
					"Snarling Dockhound", -- [1]
					"Siege of Boralus", -- [2]
				},
				[83697] = {
					"Grom'kar Deckhand", -- [1]
					"Iron Docks", -- [2]
				},
				[159425] = {
					"Occult Shadowmender", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[130024] = {
					"Soggy Shiprat", -- [1]
					"Freehold", -- [2]
				},
				[42649] = {
					"Drakonid Chainwielder", -- [1]
					"Blackwing Descent", -- [2]
				},
				[158146] = {
					"Fallen Riftwalker", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[76814] = {
					"Flamebender Ka'graz", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[36626] = {
					"Festergut", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[157605] = {
					"Burrowing Appendage", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[135470] = {
					"Aka'ali the Conqueror", -- [1]
					"Kings' Rest", -- [2]
				},
				[53115] = {
					"Molten Lord", -- [1]
					"Firelands", -- [2]
				},
				[92523] = {
					"Vazeel'fazag", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[48436] = {
					"Twilight Drake", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[43127] = {
					"Spirit of Ironstar", -- [1]
					"Blackwing Descent", -- [2]
				},
				[135258] = {
					"Irontide Marauder", -- [1]
					"Siege of Boralus", -- [2]
				},
				[86526] = {
					"Grom'kar Chainmaster", -- [1]
					"Iron Docks", -- [2]
				},
				[78932] = {
					"Driving Gale-Caller", -- [1]
					"Skyreach", -- [2]
				},
				[53642] = {
					"Cinderweb Spinner", -- [1]
					"Firelands", -- [2]
				},
				[154744] = {
					"Toxic Monstrosity", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[130025] = {
					"Irontide Thug", -- [1]
					"Tol Dagor", -- [2]
				},
				[78978] = {
					"Darkshard Gnasher", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[111858] = {
					"Guardian Rurson", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[135254] = {
					"Irontide Raider", -- [1]
					"Tol Dagor", -- [2]
				},
				[70236] = {
					"Zandalari Storm-Caller", -- [1]
					"Throne of Thunder", -- [2]
				},
				[131849] = {
					"Crazed Marksman", -- [1]
					"Waycrest Manor", -- [2]
				},
				[53087] = {
					"Right Foot", -- [1]
					"Firelands", -- [2]
				},
				[75652] = {
					"Void Spawn", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[69639] = {
					"Humming Crystal", -- [1]
					"Throne of Thunder", -- [2]
				},
				[37970] = {
					"Prince Valanar", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[92330] = {
					"Soul of Socrethar", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[154347] = {
					"Void-Twisted Corruptor", -- [1]
					"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
				},
				[76292] = {
					"Skyreach Shield Construct", -- [1]
					"Skyreach", -- [2]
				},
				[95640] = {
					"Sargerei Soul Cleaver", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[91241] = {
					"Doom Lord", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[94604] = {
					"Gorebound Corruptor", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[130026] = {
					"Bilge Rat Seaspeaker", -- [1]
					"Tol Dagor", -- [2]
				},
				[93308] = {
					"Portal Guardian", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[44687] = {
					"Proto-Behemoth", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[80822] = {
					"Night-Twisted Berserker", -- [1]
					"Highmaul", -- [2]
				},
				[36627] = {
					"Rotface", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[135231] = {
					"Spectral Brute", -- [1]
					"Kings' Rest", -- [2]
				},
				[127480] = {
					"Stinging Parasite", -- [1]
					"Tol Dagor", -- [2]
				},
				[77700] = {
					"Shadowmoon Exhumer", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[102392] = {
					"Resonance Totem", -- [1]
					"Isle of Conquest", -- [2]
				},
				[151754] = {
					"Void Haunt", -- [1]
					"Emerald Dream - HoA Scenario", -- [2]
				},
				[37011] = {
					"The Damned", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[67977] = {
					"Tortos", -- [1]
					"Throne of Thunder", -- [2]
				},
				[86611] = {
					"Mind Fungus", -- [1]
					"Highmaul", -- [2]
				},
				[135240] = {
					"Soul Essence", -- [1]
					"Waycrest Manor", -- [2]
				},
				[81806] = {
					"Gorian Royal Guardsman", -- [1]
					"Highmaul", -- [2]
				},
				[151798] = {
					"Vexiona", -- [1]
					"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
				},
				[130027] = {
					"Ashvane Marine", -- [1]
					"Tol Dagor", -- [2]
				},
				[151755] = {
					"Shadehound", -- [1]
					"Emerald Dream - HoA Scenario", -- [2]
				},
				[45267] = {
					"Twilight Phase-Twister", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[81283] = {
					"Grom'kar Footsoldier", -- [1]
					"Iron Docks", -- [2]
				},
				[91646] = {
					"Grim Collaborator", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[122967] = {
					"Priestess Alun'za", -- [1]
					"Atal'Dazar", -- [2]
				},
				[79852] = {
					"Oshir", -- [1]
					"Iron Docks", -- [2]
				},
				[151657] = {
					"Bomb Tonk", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[135761] = {
					"Thundering Totem", -- [1]
					"Kings' Rest", -- [2]
				},
				[141284] = {
					"Kul Tiran Wavetender", -- [1]
					"Siege of Boralus", -- [2]
				},
				[48049] = {
					"Twilight Whelp", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[94861] = {
					"Grim Ambusher", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[70153] = {
					"Fungal Growth", -- [1]
					"Throne of Thunder", -- [2]
				},
				[53793] = {
					"Harbinger of Flame", -- [1]
					"Firelands", -- [2]
				},
				[135474] = {
					"Thistle Acolyte", -- [1]
					"Waycrest Manor", -- [2]
				},
				[130436] = {
					"Off-Duty Laborer", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[130028] = {
					"Ashvane Priest", -- [1]
					"Tol Dagor", -- [2]
				},
				[88589] = {
					"Boar", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[54923] = {
					"Infinite Warden", -- [1]
					"End Time", -- [2]
				},
				[137940] = {
					"Safety Shark", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[76267] = {
					"Solar Zealot", -- [1]
					"Skyreach", -- [2]
				},
				[75451] = {
					"Defiled Spirit", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[106321] = {
					"Tailwind Totem", -- [1]
					"Isle of Conquest", -- [2]
				},
				[155656] = {
					"Misha", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[161895] = {
					"Thing From Beyond", -- [1]
					"Tol Dagor", -- [2]
				},
				[36948] = {
					"Muradin Bronzebeard", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[37012] = {
					"Ancient Skeletal Soldier", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[45264] = {
					"Twilight Crossfire", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[129517] = {
					"Reanimated Raptor", -- [1]
					"Atal'Dazar", -- [2]
				},
				[69078] = {
					"Sul the Sandcrawler", -- [1]
					"Throne of Thunder", -- [2]
				},
				[61657] = {
					"Adolescent Flame Hound", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[58959] = {
					"Piptoc", -- [1]
					"Isle of Conquest", -- [2]
				},
				[69792] = {
					"Xuenray", -- [1]
					"Isle of Conquest", -- [2]
				},
				[53134] = {
					"Ancient Core Hound", -- [1]
					"Firelands", -- [2]
				},
				[131545] = {
					"Lady Waycrest", -- [1]
					"Waycrest Manor", -- [2]
				},
				[95614] = {
					"Binder Eloah", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[91648] = {
					"Somber Guardian", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[155953] = {
					"C'Thuffer", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[134616] = {
					"Krolusk Pup", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[140787] = {
					"Ember Elemental", -- [1]
					"Isle of Conquest", -- [2]
				},
				[52498] = {
					"Beth'tilac", -- [1]
					"Firelands", -- [2]
				},
				[37972] = {
					"Prince Keleseth", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[133593] = {
					"Expert Technician", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[82533] = {
					"Smash", -- [1]
					"Highmaul", -- [2]
				},
				[137591] = {
					"Healing Tide Totem", -- [1]
					"Kings' Rest", -- [2]
				},
				[74927] = {
					"Unstable Slag", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[134617] = {
					"Krolusk Hatchling", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[151859] = {
					"Tomb Scarab", -- [1]
					"Halls of Origination", -- [2]
				},
				[37017] = {
					"Skybreaker Assassin", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[154727] = {
					"Sun Prophet Tenhamen", -- [1]
					"Halls of Origination", -- [2]
				},
				[158158] = {
					"Forge-Guard Hurrul", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[91521] = {
					"Vindicator Bramu", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[162764] = {
					"Twisted Appendage", -- [1]
					"Waycrest Manor", -- [2]
				},
				[34793] = {
					"Catapult", -- [1]
					"Isle of Conquest", -- [2]
				},
				[136665] = {
					"Ashvane Spotter", -- [1]
					"Tol Dagor", -- [2]
				},
				[126832] = {
					"Skycap'n Kragg", -- [1]
					"Freehold", -- [2]
				},
				[90114] = {
					"Iron Dragoon", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[37025] = {
					"Stinky", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[37027] = {
					"Skybreaker Hierophant", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[45265] = {
					"Twilight Soul Blade", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[61705] = {
					"Corrupted Flamecaller", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[151659] = {
					"Rocket Tonk", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[37813] = {
					"Deathbringer Saurfang", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[37023] = {
					"Plague Scientist", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[76809] = {
					"Foreman Feldspar", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[157904] = {
					"Aqir Scarab", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[53901] = {
					"Unstable Magma", -- [1]
					"Firelands", -- [2]
				},
				[91522] = {
					"Protector Bajunt", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[37666] = {
					"Darkfallen Tactician", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[134364] = {
					"Faithless Tender", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[155090] = {
					"Anodized Coilbearer", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[83846] = {
					"Yalnu", -- [1]
					"The Everbloom", -- [2]
				},
				[75786] = {
					"Roltall", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[37973] = {
					"Prince Taldaram", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[127497] = {
					"Ashvane Warden", -- [1]
					"Tol Dagor", -- [2]
				},
				[152833] = {
					"Azerite Giant", -- [1]
					"The Maelstrom - Heart of Azeroth", -- [2]
				},
				[37868] = {
					"Risen Archmage", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[52558] = {
					"Lord Rhyolith", -- [1]
					"Firelands", -- [2]
				},
				[18131] = {
					"Nether Ray", -- [1]
					"Isle of Conquest", -- [2]
				},
				[37533] = {
					"Rimefang", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[76810] = {
					"Furnace Engineer", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[37098] = {
					"Val'kyr Herald", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[36597] = {
					"The Lich King", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[68129] = {
					"Ashtongue Shaman", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[68140] = {
					"Hungering Soul Fragment", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
			},
			["spell_animation_list"] = {
				[206930] = {
					{
						["scale_upY"] = 1.100000023841858,
						["scale_upX"] = 1.100000023841858,
						["scale_downX"] = 0.8999999761581421,
						["scale_downY"] = 0.8999999761581421,
					}, -- [1]
				},
				[155166] = {
					{
						["scaleY"] = 0.5999984741210938,
						["fade_out"] = 0.009999999776482582,
						["amplitude"] = 0.449999988079071,
						["duration"] = 0.199999988079071,
						["scaleX"] = 0.2000007629394531,
					}, -- [1]
				},
				[222024] = {
					nil, -- [1]
					{
						["amplitude"] = 1.799999952316284,
						["fade_out"] = 0.01999999955296516,
					}, -- [2]
				},
				[55090] = {
					{
						["fade_out"] = 0.1799999922513962,
						["duration"] = 0.07999999821186066,
						["frequency"] = 4.099999904632568,
					}, -- [1]
				},
				[85948] = {
					{
						["duration"] = 0.1200000047683716,
					}, -- [1]
				},
				[49998] = {
					{
						["fade_out"] = 0.01999999955296516,
						["amplitude"] = 1.799999952316284,
						["fade_in"] = 0.009999999776482582,
						["duration"] = 0.1299999952316284,
						["scaleX"] = 0.09999847412109375,
					}, -- [1]
				},
			},
			["saved_cvars"] = {
				["ShowClassColorInNameplate"] = "1",
				["nameplateOverlapV"] = "1.1",
				["ShowNamePlateLoseAggroFlash"] = "1",
				["nameplateShowEnemyMinus"] = "1",
				["nameplatePersonalShowAlways"] = "0",
				["nameplateMotionSpeed"] = "0.05",
				["nameplateSelfTopInset"] = "0.5",
				["nameplateShowFriendlyTotems"] = "0",
				["nameplateShowEnemyMinions"] = "1",
				["nameplateShowFriendlyPets"] = "0",
				["nameplateShowFriendlyNPCs"] = "0",
				["nameplateSelectedScale"] = "1.502991437912",
				["nameplatePersonalShowInCombat"] = "1",
				["nameplatePersonalShowWithTarget"] = "0",
				["nameplateShowSelf"] = "0",
				["nameplateShowFriendlyMinions"] = "0",
				["nameplateResourceOnTarget"] = "0",
				["nameplateMotion"] = "1",
				["nameplateSelfAlpha"] = "1",
				["nameplateMinScale"] = "1",
				["nameplateMaxDistance"] = "100",
				["nameplateOtherTopInset"] = "0.085",
				["nameplateSelfScale"] = "1",
				["nameplateSelfBottomInset"] = "0.2",
				["NamePlateHorizontalScale"] = "1",
				["nameplateShowFriendlyGuardians"] = "0",
				["nameplateOccludedAlphaMult"] = "1",
				["nameplateShowAll"] = "1",
				["nameplatePersonalHideDelaySeconds"] = "0.2",
				["nameplateGlobalScale"] = "1",
				["NamePlateVerticalScale"] = "1",
			},
			["border_color"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				0.8400000035762787, -- [4]
			},
			["target_highlight_height"] = 14.63406085968018,
			["border_thickness"] = 1.001471042633057,
			["OptionsPanelDB"] = {
				["PlaterOptionsPanelFrame"] = {
					["scale"] = 1,
				},
			},
			["patch_version"] = 9,
			["login_counter"] = 582,
			["health_selection_overlay_alpha"] = 0.1015491858124733,
			["range_check_health_bar_alpha"] = 1,
			["target_highlight_alpha"] = 0.7527135610580444,
			["hook_auto_imported"] = {
				["Reorder Nameplate"] = 3,
				["Dont Have Aura"] = 1,
				["Players Targetting Amount"] = 4,
				["Color Automation"] = 1,
				["Bwonsamdi Reaping"] = 1,
				["Blockade Encounter"] = 1,
				["Jaina Encounter"] = 6,
				["Execute Range"] = 1,
				["Extra Border"] = 2,
				["Combo Points"] = 3,
				["Attacking Specific Unit"] = 1,
				["Target Color"] = 3,
				["Aura Reorder"] = 1,
				["Hide Neutral Units"] = 1,
			},
			["not_affecting_combat_alpha"] = 0.5976737141609192,
			["captured_spells"] = {
				[164815] = {
					["source"] = "Define-Mal'Ganis",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[306474] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Sycõs-Shandris",
					["npcID"] = 0,
				},
				[8222] = {
					["source"] = "Remixxed-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[53390] = {
					["source"] = "Wurrzaag-Gilneas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[134111] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ashtongue Primalist",
					["npcID"] = 68096,
				},
				[315176] = {
					["source"] = "Aesse",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[258723] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193475] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Malepandá",
					["npcID"] = 0,
				},
				[312107] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sebârt-Illidan",
					["npcID"] = 0,
				},
				[275773] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sathaendor",
					["npcID"] = 0,
				},
				[313643] = {
					["source"] = "Frogy-Agamaggan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[315179] = {
					["source"] = "Afterimage-Thrall",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[119415] = {
					["source"] = "Aesse",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[281404] = {
					["source"] = "Asylius",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[265540] = {
					["source"] = "Fetid Maggot",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 130909,
				},
				[6360] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sarora",
					["npcID"] = 1863,
				},
				[31661] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Gwenevare-WyrmrestAccord",
					["encounterID"] = 2086,
				},
				[285500] = {
					["type"] = "BUFF",
					["source"] = "Zahmerdh",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[296759] = {
					["source"] = "Talgrim-Trollbane",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[123254] = {
					["source"] = "Roipriest-Quel'Thalas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[403] = {
					["source"] = "Karlurn-BleedingHollow",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[216251] = {
					["source"] = "Fhaykum",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275779] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ironmade-Thrall",
					["npcID"] = 0,
				},
				[280385] = {
					["source"] = "Aesse",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[118521] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Enraged Spearman",
					["npcID"] = 59165,
				},
				[118905] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Capacitor Totem",
					["npcID"] = 61245,
				},
				[294717] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Meaven-Zul'jin",
					["npcID"] = 0,
				},
				[233397] = {
					["source"] = "Fuiken-Dalaran",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268619] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sädä-Malfurion",
					["npcID"] = 0,
				},
				[162264] = {
					["source"] = "Yungs-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[221883] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Táste",
					["npcID"] = 0,
				},
				[224186] = {
					["source"] = "Rãvensheart",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[259241] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 131265,
				},
				[273226] = {
					["encounterID"] = 2112,
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[259753] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[190411] = {
					["source"] = "Doinkster-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[228537] = {
					["source"] = "Yungs-Zul'jin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[301886] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sycõs-Shandris",
					["npcID"] = 0,
				},
				[45524] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ahriak",
					["encounterID"] = 1106,
				},
				[421] = {
					["source"] = "Karlurn-BleedingHollow",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[316216] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Deephive Voidsinger",
					["npcID"] = 163704,
				},
				[108416] = {
					["source"] = "Lazerbeamzz-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[118779] = {
					["source"] = "Urukaim-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[221886] = {
					["source"] = "Bløodshot-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[313148] = {
					["source"] = "Verthel",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[203975] = {
					["source"] = "Hankla-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273232] = {
					["source"] = "Yungs-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[196555] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zahmerdh",
					["npcID"] = 0,
				},
				[270674] = {
					["source"] = "Urukaim-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1719] = {
					["source"] = "Cbegswar-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[290121] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dragoul-Illidan",
					["npcID"] = 0,
				},
				[280398] = {
					["source"] = "Heartbeatz-Tichondrius",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288075] = {
					["source"] = "Sandorie-Ner'zhul",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[313151] = {
					["source"] = "Amathet Sun Priest",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 151612,
				},
				[272723] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Veíl-Stormreaver",
					["npcID"] = 0,
				},
				[298823] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sammichbich",
					["npcID"] = 0,
				},
				[235450] = {
					["source"] = "Frostips-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[23922] = {
					["source"] = "Melvinmoose-Zul'jin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[17877] = {
					["source"] = "Lazerbeamzz-Arthas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[188370] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ironmade-Thrall",
					["npcID"] = 0,
				},
				[250036] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[199373] = {
					["source"] = "Army of the Dead",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 24207,
				},
				[228287] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Sädä-Malfurion",
					["npcID"] = 0,
				},
				[202188] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sebich",
					["npcID"] = 0,
				},
				[267611] = {
					["source"] = "Frogy-Agamaggan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[256434] = {
					["source"] = "Culs-Stormrage",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267612] = {
					["source"] = "Whípple-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[286547] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Anty-EmeraldDream",
					["npcID"] = 0,
				},
				[309065] = {
					["source"] = "Saba-tok",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 157286,
				},
				[295248] = {
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1106,
				},
				[32924] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 18450,
				},
				[115072] = {
					["source"] = "Fairin-Akama",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[203981] = {
					["source"] = "Haleios-Sargeras",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[294226] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ma'haat the Indomitable",
					["npcID"] = 151739,
				},
				[280409] = {
					["source"] = "Samëdi-Azralon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[303438] = {
					["source"] = "Saiyori",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5217] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Arikaraa",
					["npcID"] = 0,
				},
				[5225] = {
					["source"] = "Clawzxx-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[198097] = {
					["source"] = "Lunareste",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[271711] = {
					["source"] = "Rotrin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1833] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Flawlyss-Arthas",
					["npcID"] = 0,
				},
				[280412] = {
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1106,
				},
				[280413] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dajjal-Zul'jin",
					["npcID"] = 0,
				},
				[7384] = {
					["source"] = "Urukaim-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279902] = {
					["source"] = "Yungs-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298837] = {
					["source"] = "Jáydee",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[226757] = {
					["source"] = "Tyrionz-Sargeras",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288091] = {
					["source"] = "Cbegswar-BleedingHollow",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[307026] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Oddvar-Kel'Thuzad",
					["npcID"] = 0,
				},
				[158183] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 162939,
				},
				[298839] = {
					["source"] = "Wárr",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[210126] = {
					["source"] = "Fæk",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[296793] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Removal",
					["npcID"] = 0,
				},
				[295258] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fayia-Arthas",
					["npcID"] = 0,
				},
				[201427] = {
					["source"] = "Yungs-Zul'jin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[298841] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sebârt-Illidan",
					["npcID"] = 0,
				},
				[201939] = {
					["source"] = "Fuzzywuzzý-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[204242] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Ironmade-Thrall",
					["npcID"] = 0,
				},
				[26098] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Shienor Sorcerer",
					["npcID"] = 18450,
				},
				[317265] = {
					["source"] = "Supbud-Zul'jin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[266091] = {
					["source"] = "Rotrin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[214222] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Sathaendor",
					["npcID"] = 0,
				},
				[279397] = {
					["source"] = "Amoreiel-Daggerspine",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[251836] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Óle",
					["npcID"] = 0,
				},
				[205523] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dionysús-Malfurion",
					["npcID"] = 0,
				},
				[276840] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Salúd-Baelgun",
					["npcID"] = 0,
				},
				[198103] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fhaykum",
					["encounterID"] = 2086,
				},
				[251837] = {
					["source"] = "Walkingtree-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[98444] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Steelemental-Illidan",
					["npcID"] = 0,
				},
				[127230] = {
					["source"] = "Quickranger-Bloodhoof",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[260793] = {
					["encounterID"] = 2118,
					["source"] = "Cragmaw the Infested",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 131817,
				},
				[125439] = {
					["source"] = "Niacin-Blackhand",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[5697] = {
					["source"] = "Cûrsé-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[251838] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Vdru",
					["npcID"] = 0,
				},
				[1943] = {
					["source"] = "Lunareste",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[185311] = {
					["source"] = "Lunareste",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[255421] = {
					["type"] = "BUFF",
					["source"] = "Rezan",
					["npcID"] = 122963,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[1953] = {
					["source"] = "Aesse",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[251839] = {
					["source"] = "Genorider-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[256445] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Zandalari Leguaan",
					["npcID"] = 129554,
				},
				[52437] = {
					["source"] = "Urukaim-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273264] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Aerospac-Illidan",
					["npcID"] = 0,
				},
				[195292] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ertex-Sargeras",
					["npcID"] = 0,
				},
				[208086] = {
					["source"] = "Urukaim-Mal'Ganis",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[317277] = {
					["source"] = "Magni Bronzebeard",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 154533,
				},
				[250050] = {
					["npcID"] = 122968,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Yazma",
					["encounterID"] = 2087,
				},
				[498] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sathaendor",
					["npcID"] = 0,
				},
				[19574] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fayia-Arthas",
					["npcID"] = 0,
				},
				[256959] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Reanimated Honor Guard",
					["npcID"] = 127757,
				},
				[280433] = {
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1106,
				},
				[265081] = {
					["source"] = "Chosen Blood Matron",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 131436,
				},
				[256960] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Reanimated Honor Guard",
					["npcID"] = 127757,
				},
				[212182] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Flawlyss-Arthas",
					["npcID"] = 0,
				},
				[210391] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Soladris-Mal'Ganis",
					["npcID"] = 0,
				},
				[32272] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Frostbank",
					["npcID"] = 0,
				},
				[315746] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Deephive Chosen",
					["npcID"] = 153905,
				},
				[277365] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kao-Tien Subjugator",
					["npcID"] = 136551,
				},
				[266107] = {
					["source"] = "Feral Bloodswarmer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 133835,
				},
				[277366] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kao-Tien Marauder",
					["npcID"] = 136552,
				},
				[30449] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Neonpen",
					["npcID"] = 0,
				},
				[272249] = {
					["source"] = "Vathikur",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 130401,
				},
				[48792] = {
					["source"] = "Ikalo-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[312679] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tidal Corruptor",
					["npcID"] = 153910,
				},
				[115080] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sädä-Malfurion",
					["npcID"] = 0,
				},
				[6201] = {
					["source"] = "Rotrin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[147193] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Celaste-LaughingSkull",
					["encounterID"] = 2086,
				},
				[188389] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dacorr-ShatteredHand",
					["npcID"] = 0,
				},
				[2094] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Flawlyss-Arthas",
					["npcID"] = 0,
				},
				[2098] = {
					["source"] = "Wantêd-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[187878] = {
					["source"] = "Mjiollnir-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[260291] = {
					["source"] = "Bladeguard Elite",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 130451,
				},
				[256453] = {
					["source"] = "Wudie-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[72350] = {
					["type"] = "BUFF",
					["source"] = "The Lich King",
					["npcID"] = 36597,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1106,
				},
				[12654] = {
					["source"] = "Tyrionz-Sargeras",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[260292] = {
					["encounterID"] = 2118,
					["source"] = "Cragmaw the Infested",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 131817,
				},
				[298357] = {
					["type"] = "BUFF",
					["source"] = "Gwenevare-WyrmrestAccord",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[305010] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tidemistress Ethendriss",
					["npcID"] = 153934,
				},
				[312687] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Faceless Conqueror",
					["npcID"] = 153903,
				},
				[313199] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Putrid Ichor",
					["npcID"] = 153907,
				},
				[256455] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kiriodas",
					["npcID"] = 0,
				},
				[272260] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sathaendor",
					["npcID"] = 0,
				},
				[300919] = {
					["type"] = "BUFF",
					["source"] = "Hungryorphan-Frostmourne",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[205025] = {
					["source"] = "Elhfireah",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[556] = {
					["source"] = "Cãhuna-Thrall",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[262539] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Honorbound Shieldbreaker",
					["npcID"] = 154760,
				},
				[33697] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dacorr-ShatteredHand",
					["npcID"] = 0,
				},
				[102417] = {
					["source"] = "Fellowkid-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[315763] = {
					["source"] = "Gorbanzo",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[255434] = {
					["npcID"] = 122963,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rezan",
					["encounterID"] = 2086,
				},
				[36576] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Shaleskin Flayer",
					["npcID"] = 20210,
				},
				[36640] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 18865,
				},
				[200166] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Zahmerdh",
					["encounterID"] = 2086,
				},
				[210657] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sebich",
					["npcID"] = 0,
				},
				[196840] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dacorr-ShatteredHand",
					["npcID"] = 0,
				},
				[256459] = {
					["source"] = "Starbuk-Kargath",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[11327] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Quickkick-Zul'jin",
					["npcID"] = 0,
				},
				[171253] = {
					["source"] = "Monoxidè-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[257483] = {
					["npcID"] = 0,
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[585] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tyronika-Doomhammer",
					["npcID"] = 0,
				},
				[586] = {
					["type"] = "BUFF",
					["source"] = "Celaste-LaughingSkull",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[256460] = {
					["source"] = "Draculaa-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[589] = {
					["type"] = "DEBUFF",
					["source"] = "Celaste-LaughingSkull",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[236502] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jacobiyana",
					["npcID"] = 0,
				},
				[299905] = {
					["source"] = "Taldreil-Zul'jin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[16953] = {
					["source"] = "Freida-AeriePeak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[309118] = {
					["source"] = "Stellar Pylon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 158568,
				},
				[210660] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sebich",
					["npcID"] = 0,
				},
				[272273] = {
					["source"] = "Warmother Captive",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 134625,
				},
				[111759] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Celaste-LaughingSkull",
					["npcID"] = 0,
				},
				[50842] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ertex-Sargeras",
					["npcID"] = 0,
				},
				[199658] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dahreon-Stormreaver",
					["npcID"] = 0,
				},
				[77472] = {
					["source"] = "Wurrzaag-Gilneas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[277904] = {
					["source"] = "Rynosia-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[34914] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Celaste-LaughingSkull",
					["encounterID"] = 2086,
				},
				[39584] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ashtongue Primalist",
					["npcID"] = 68096,
				},
				[272790] = {
					["source"] = "Quickranger-Bloodhoof",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[102165] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hruka-Velen",
					["npcID"] = 0,
				},
				[33763] = {
					["source"] = "Moolatte-Baelgun",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[264603] = {
					["encounterID"] = 2111,
					["source"] = "Elder Leaxa",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 131318,
				},
				[279956] = {
					["source"] = "Aesse",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[210152] = {
					["source"] = "Yungs-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275351] = {
					["source"] = "Traplifé-Azralon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[633] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thalron",
					["encounterID"] = 2086,
				},
				[231390] = {
					["source"] = "Sullitan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295310] = {
					["source"] = "Cbegswar-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288146] = {
					["source"] = "Nolovz-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[642] = {
					["type"] = "BUFF",
					["source"] = "Thalron",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[273310] = {
					["source"] = "Heartbeatz-Tichondrius",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[217832] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Zahmerdh",
					["npcID"] = 0,
				},
				[268194] = {
					["source"] = "Krogther-Ragnaros",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[315787] = {
					["source"] = "Esov-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275359] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Zujothgul",
					["npcID"] = 128578,
				},
				[131347] = {
					["source"] = "Adamdh-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[36515] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 20474,
				},
				[250585] = {
					["npcID"] = 0,
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2085,
				},
				[213995] = {
					["source"] = "Wantêd-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[222695] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Creedo-Shadowmoon",
					["npcID"] = 0,
				},
				[267685] = {
					["source"] = "Verthel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5394] = {
					["source"] = "Fhaykum",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[297879] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Eye of the Corruptor",
					["npcID"] = 153347,
				},
				[316814] = {
					["source"] = "Rotrin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[53595] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ironmade-Thrall",
					["npcID"] = 0,
				},
				[155145] = {
					["source"] = "Holylolring-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[190456] = {
					["source"] = "Melvinmoose-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[79140] = {
					["source"] = "Crushhero-Zul'jin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288158] = {
					["source"] = "Nolovz-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[688] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[691] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Actively",
					["npcID"] = 0,
				},
				[135700] = {
					["source"] = "Freida-AeriePeak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[204019] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Legndzonttv",
					["npcID"] = 0,
				},
				[697] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[295838] = {
					["source"] = "Verthel",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[703] = {
					["source"] = "Lunareste",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[61336] = {
					["source"] = "Freida-AeriePeak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2818] = {
					["source"] = "Lunareste",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[274346] = {
					["source"] = "Taldreil-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[26678] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Achilios",
					["npcID"] = 0,
				},
				[295840] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Instantdeath-Bloodhoof",
					["npcID"] = 0,
				},
				[193530] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cerbi-Sargeras",
					["npcID"] = 0,
				},
				[193786] = {
					["source"] = "Mjiollnir-BleedingHollow",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[712] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[316823] = {
					["source"] = "Rotrin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[278954] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ironmade-Thrall",
					["npcID"] = 0,
				},
				[295842] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tàlrin-BleedingHollow",
					["npcID"] = 0,
				},
				[197625] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rakporine",
					["npcID"] = 0,
				},
				[16827] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lexa",
					["npcID"] = 32517,
				},
				[33702] = {
					["type"] = "BUFF",
					["source"] = "Hungryorphan-Frostmourne",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[35877] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Unknown",
					["npcID"] = 18850,
				},
				[303520] = {
					["source"] = "Fairin-Akama",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[176644] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Litbadjr-Thrall",
					["npcID"] = 0,
				},
				[316826] = {
					["npcID"] = 162764,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Twisted Appendage",
					["encounterID"] = 1106,
				},
				[34086] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Maiden of Pain",
					["npcID"] = 19408,
				},
				[281517] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Gwenevare-WyrmrestAccord",
					["npcID"] = 0,
				},
				[279471] = {
					["source"] = "Freida-AeriePeak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[273842] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[147732] = {
					["source"] = "Mjiollnir-BleedingHollow",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[287660] = {
					["type"] = "BUFF",
					["source"] = "Hungryorphan-Frostmourne",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[256735] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nello-Norgannon",
					["npcID"] = 0,
				},
				[193534] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Arentar-Dalaran",
					["npcID"] = 0,
				},
				[278961] = {
					["source"] = "Diseased Lasher",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 133870,
				},
				[57755] = {
					["source"] = "Gorbanzo",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[310690] = {
					["source"] = "Holehunter",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[311202] = {
					["source"] = "Holehunter",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[269239] = {
					["source"] = "Yungs-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[256992] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Frightened Brutosaur",
					["npcID"] = 129668,
				},
				[93985] = {
					["source"] = "Freida-AeriePeak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[755] = {
					["source"] = "Rotrin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[36006] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 21050,
				},
				[291247] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 154167,
				},
				[316835] = {
					["type"] = "DEBUFF",
					["source"] = "Twisted Appendage",
					["npcID"] = 162764,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1106,
				},
				[202748] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fayia-Arthas",
					["npcID"] = 0,
				},
				[118038] = {
					["source"] = "Urukaim-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[277943] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dacorr-ShatteredHand",
					["npcID"] = 0,
				},
				[295855] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Instantdeath-Bloodhoof",
					["npcID"] = 0,
				},
				[49184] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ahriak",
					["encounterID"] = 1106,
				},
				[772] = {
					["source"] = "Urukaim-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[256739] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zisu-Kel'Thuzad",
					["npcID"] = 0,
				},
				[193538] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Otters-Eonar",
					["npcID"] = 0,
				},
				[47585] = {
					["type"] = "BUFF",
					["source"] = "Celaste-LaughingSkull",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[3110] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Geljub",
					["npcID"] = 416,
				},
				[781] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fanatixxh-BleedingHollow",
					["npcID"] = 0,
				},
				[783] = {
					["source"] = "Arabella-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[155158] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Gwenevare-WyrmrestAccord",
					["npcID"] = 0,
				},
				[116888] = {
					["source"] = "Ikalo-Zul'jin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[23161] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Koichoga",
					["npcID"] = 0,
				},
				[193796] = {
					["source"] = "Mjiollnir-BleedingHollow",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[70575] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Pathogenz",
					["npcID"] = 0,
				},
				[311214] = {
					["source"] = "Rotrin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[111771] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[85288] = {
					["source"] = "Doinkster-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[158486] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nerfpets-Thrall",
					["npcID"] = 0,
				},
				[8690] = {
					["source"] = "Crushhero-Zul'jin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[19483] = {
					["source"] = "Infernal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 89,
				},
				[21562] = {
					["source"] = "Sinamara-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[304564] = {
					["source"] = "Tokuudred-Arthas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[70192] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Osgurl",
					["npcID"] = 0,
				},
				[194310] = {
					["source"] = "Esov-Illidan",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[260070] = {
					["source"] = "Pa'kura Priest",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 131834,
				},
				[190984] = {
					["source"] = "Define-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[274373] = {
					["source"] = "Esov-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[319919] = {
					["source"] = "Slayamonk-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[198149] = {
					["source"] = "Aesse",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[108446] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 17252,
				},
				[818] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hellenkìller-Thrall",
					["npcID"] = 0,
				},
				[304056] = {
					["source"] = "Kthxbai-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[68530] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Darkevader",
					["npcID"] = 0,
				},
				[260072] = {
					["source"] = "Pa'kura Priest",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 131834,
				},
				[83243] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Gunwar-Kil'jaeden",
					["npcID"] = 0,
				},
				[228600] = {
					["source"] = "Aesse",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[300989] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lynaris-Illidan",
					["npcID"] = 0,
				},
				[15407] = {
					["type"] = "BUFF",
					["source"] = "Celaste-LaughingSkull",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[298431] = {
					["source"] = "Nevaiyah",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[185358] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Vverr-Illidan",
					["encounterID"] = 2086,
				},
				[165144] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Huojin Defender",
					["npcID"] = 154402,
				},
				[318391] = {
					["source"] = "Great Worm From Beyond",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 152550,
				},
				[298433] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Johalius",
					["npcID"] = 0,
				},
				[6770] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Flawlyss-Arthas",
					["npcID"] = 0,
				},
				[39911] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Oxirayne-Sargeras",
					["npcID"] = 0,
				},
				[243955] = {
					["source"] = "Picon-Whisperwind",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[225788] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tàlrin-BleedingHollow",
					["npcID"] = 0,
				},
				[853] = {
					["source"] = "Frogy-Agamaggan",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[303041] = {
					["source"] = "Monjaro-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297412] = {
					["source"] = "Civex-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[70579] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Achilios",
					["npcID"] = 0,
				},
				[295367] = {
					["type"] = "DEBUFF",
					["source"] = "Ahriak",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1106,
				},
				[279503] = {
					["source"] = "Ikalo-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298950] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nighthearts",
					["npcID"] = 0,
				},
				[295368] = {
					["source"] = "Flamejob-Kel'Thuzad",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[51490] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dacorr-ShatteredHand",
					["npcID"] = 0,
				},
				[33259] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Litbadjr-Thrall",
					["npcID"] = 0,
				},
				[176151] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ramiyolol",
					["npcID"] = 0,
				},
				[263642] = {
					["source"] = "Traplifé-Azralon",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[272342] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Minor Azerite Infused Elemental",
					["npcID"] = 136616,
				},
				[77489] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Smartblonde-Mal'Ganis",
					["npcID"] = 0,
				},
				[132653] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 153089,
				},
				[272343] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Azerite-Infused Elemental",
					["npcID"] = 136615,
				},
				[883] = {
					["source"] = "Varu-Blackrock",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[5019] = {
					["source"] = "Lazerbeamzz-Arthas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[224001] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xuk-BleedingHollow",
					["npcID"] = 0,
				},
				[295373] = {
					["source"] = "Genorider-Zul'jin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[30455] = {
					["source"] = "Rynosia-Thrall",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[3566] = {
					["source"] = "Mina-BloodFurnace",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[303564] = {
					["source"] = "Bacata-Dalaran",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[203277] = {
					["source"] = "Pyrotessa-Detheroc",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[252661] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Shadowblade Stalker",
					["npcID"] = 122970,
				},
				[272348] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Infused Crag",
					["npcID"] = 136613,
				},
				[119582] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dionysús-Malfurion",
					["npcID"] = 0,
				},
				[107428] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hecatè-Malfurion",
					["npcID"] = 0,
				},
				[24858] = {
					["source"] = "Lixurwounds-Dalaran",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295378] = {
					["source"] = "Dfd-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[269279] = {
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1106,
				},
				[228354] = {
					["source"] = "Verthel",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[216328] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bophercherry",
					["npcID"] = 0,
				},
				[42024] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ashtongue Shaman",
					["npcID"] = 68129,
				},
				[303568] = {
					["source"] = "Bacata-Dalaran",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[259572] = {
					["type"] = "BUFF",
					["source"] = "Vol'kaal",
					["npcID"] = 122965,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2085,
				},
				[303570] = {
					["source"] = "Bacata-Dalaran",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297941] = {
					["source"] = "Lolnaldtrump-AeriePeak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275936] = {
					["type"] = "BUFF",
					["source"] = "Zahmerdh",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[132403] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thalron",
					["npcID"] = 0,
				},
				[271843] = {
					["source"] = "Define-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295384] = {
					["source"] = "Genorider-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311249] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nello-Norgannon",
					["npcID"] = 0,
				},
				[132404] = {
					["source"] = "Melvinmoose-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[259830] = {
					["type"] = "BUFF",
					["source"] = "Sporecaller Zancha",
					["encounterID"] = 2112,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 131383,
				},
				[157736] = {
					["source"] = "Rotrin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[101545] = {
					["source"] = "Takuetsukaze-BleedingHollow",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[203538] = {
					["source"] = "Supbud-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[228358] = {
					["source"] = "Verthel",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268776] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 130257,
				},
				[275429] = {
					["source"] = "Rotrin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[184092] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thalron",
					["npcID"] = 0,
				},
				[227847] = {
					["source"] = "Urukaim-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[203539] = {
					["source"] = "Supbud-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[252923] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Zanchuli Witch-Doctor",
					["npcID"] = 122969,
				},
				[264173] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Instantdeath-Bloodhoof",
					["npcID"] = 0,
				},
				[101546] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sädä-Malfurion",
					["npcID"] = 0,
				},
				[34477] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Aerospac-Illidan",
					["npcID"] = 0,
				},
				[298461] = {
					["source"] = "Ilgynoth-Tanaris",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[108199] = {
					["source"] = "Ikalo-Zul'jin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[304603] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Anwàr",
					["npcID"] = 0,
				},
				[290786] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Icurus",
					["npcID"] = 0,
				},
				[223499] = {
					["source"] = "Garto-Tanaris",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[32942] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 18884,
				},
				[157228] = {
					["source"] = "Define-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[264689] = {
					["source"] = "Slayamonk-Illidan",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[308188] = {
					["source"] = "Primordial-Llane",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[312794] = {
					["source"] = "Cûrsé-Arthas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[974] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Shieldshock",
					["npcID"] = 0,
				},
				[308189] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sravone-Mal'Ganis",
					["npcID"] = 0,
				},
				[255741] = {
					["source"] = "Faithless Champion",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 135292,
				},
				[100780] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sädä-Malfurion",
					["npcID"] = 0,
				},
				[982] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fanatixxh-BleedingHollow",
					["npcID"] = 0,
				},
				[44457] = {
					["source"] = "Brionac-Arthas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[315356] = {
					["source"] = "Caravaneer's Pack",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 162001,
				},
				[313310] = {
					["source"] = "Saiyori",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[145205] = {
					["source"] = "Moolatte-Baelgun",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[32943] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Warp Chaser",
					["npcID"] = 18884,
				},
				[302565] = {
					["source"] = "Yungs-Zul'jin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[201754] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "johnny",
					["npcID"] = 124527,
				},
				[197916] = {
					["source"] = "Saladin-Bonechewer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[47528] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Gommerr",
					["npcID"] = 0,
				},
				[274420] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hungryorphan-Frostmourne",
					["npcID"] = 0,
				},
				[105771] = {
					["source"] = "Urukaim-Mal'Ganis",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[131901] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dead Inkgill Spearman",
					["npcID"] = 61532,
				},
				[8042] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dacorr-ShatteredHand",
					["npcID"] = 0,
				},
				[32216] = {
					["source"] = "Doinkster-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[219406] = {
					["source"] = "Wrathzz",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279028] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dacorr-ShatteredHand",
					["npcID"] = 0,
				},
				[250372] = {
					["type"] = "DEBUFF",
					["source"] = "Vol'kaal",
					["npcID"] = 122965,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2085,
				},
				[265533] = {
					["source"] = "Underrot Tick",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 131402,
				},
				[172816] = {
					["source"] = "Sun Prophet Tenhamen",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 154727,
				},
				[138555] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 69964,
				},
				[257537] = {
					["source"] = "Verthel",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[281402] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sindrablowsa-Kel'Thuzad",
					["npcID"] = 0,
				},
				[167981] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ogwizard-Deathwing",
					["npcID"] = 0,
				},
				[290608] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Khalifakahn",
					["npcID"] = 0,
				},
				[207386] = {
					["source"] = "Moolatte-Baelgun",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280462] = {
					["source"] = "Watcher Aum-ka",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 154619,
				},
				[134206] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[138556] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Unknown",
					["npcID"] = 69964,
				},
				[69438] = {
					["source"] = "Hêllboy",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[188196] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dacorr-ShatteredHand",
					["npcID"] = 0,
				},
				[274426] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Arikaraa",
					["npcID"] = 0,
				},
				[273794] = {
					["source"] = "Urukaim-Mal'Ganis",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[108843] = {
					["type"] = "BUFF",
					["source"] = "Gwenevare-WyrmrestAccord",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[121253] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dionysús-Malfurion",
					["npcID"] = 0,
				},
				[288756] = {
					["type"] = "DEBUFF",
					["source"] = "Celaste-LaughingSkull",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[138557] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Unknown",
					["npcID"] = 69964,
				},
				[49576] = {
					["source"] = "Ikalo-Zul'jin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[210714] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dacorr-ShatteredHand",
					["npcID"] = 0,
				},
				[1044] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sathaendor",
					["npcID"] = 0,
				},
				[203286] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Yourefired-Aggramar",
					["npcID"] = 0,
				},
				[255937] = {
					["source"] = "Pigeonwat-Alleria",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[193315] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Otters-Eonar",
					["npcID"] = 0,
				},
				[134208] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[66] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sindrablowsa-Kel'Thuzad",
					["npcID"] = 0,
				},
				[126755] = {
					["source"] = "Avey-Azralon",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[71614] = {
					["type"] = "BUFF",
					["source"] = "The Lich King",
					["npcID"] = 36597,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1106,
				},
				[274430] = {
					["source"] = "Kimsohyun-Azralon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[317272] = {
					["source"] = "Magni Bronzebeard",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 154533,
				},
				[1064] = {
					["source"] = "Fhaykum",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[193316] = {
					["source"] = "Sauzey",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[274431] = {
					["source"] = "Kimsohyun-Azralon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2139] = {
					["source"] = "Saiyori",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[194084] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Metalstriker",
					["npcID"] = 0,
				},
				[207289] = {
					["source"] = "Clapedcheeks-Rivendare",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[274742] = {
					["source"] = "Clapedcheeks-Rivendare",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272183] = {
					["source"] = "Fallen Deathspeaker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 134284,
				},
				[104316] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Instantdeath-Bloodhoof",
					["npcID"] = 0,
				},
				[209693] = {
					["source"] = "Yungs-Zul'jin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[55078] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Ertex-Sargeras",
					["npcID"] = 0,
				},
				[8676] = {
					["source"] = "Wantêd-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[27576] = {
					["source"] = "Lunareste",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[274741] = {
					["source"] = "Auroraclaire-Drenden",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[29722] = {
					["source"] = "Rotrin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[279033] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dacorr-ShatteredHand",
					["npcID"] = 0,
				},
				[199203] = {
					["source"] = "Cbegswar-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[183752] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Zahmerdh",
					["npcID"] = 0,
				},
				[148540] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[204255] = {
					["source"] = "Traplifé-Azralon",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[202274] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Dionysús-Malfurion",
					["npcID"] = 0,
				},
				[115098] = {
					["source"] = "Saladin-Bonechewer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[252382] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kharl",
					["npcID"] = 0,
				},
				[289277] = {
					["source"] = "Genorider-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[254473] = {
					["source"] = "Skep",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[203554] = {
					["source"] = "Moolatte-Baelgun",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[47568] = {
					["source"] = "Déjà-Aegwynn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298343] = {
					["source"] = "Bloodscoute",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[123040] = {
					["source"] = "Heartbeatz-Tichondrius",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[1122] = {
					["source"] = "Rotrin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[184364] = {
					["source"] = "Thaerhum",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272903] = {
					["source"] = "Krystynna-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273415] = {
					["source"] = "Urukaim-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272180] = {
					["source"] = "Grotesque Horror",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 138187,
				},
				[148542] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[70577] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Achilios",
					["npcID"] = 0,
				},
				[273238] = {
					["source"] = "Ilgynoth-Tanaris",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[274738] = {
					["source"] = "Clapedcheeks-Rivendare",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[270661] = {
					["source"] = "Dristwo-Ravencrest",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[69563] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Deppfist",
					["npcID"] = 0,
				},
				[116011] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Yourefired-Aggramar",
					["npcID"] = 0,
				},
				[81340] = {
					["source"] = "Esov-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[266201] = {
					["source"] = "Reanimated Guardian",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 133836,
				},
				[268756] = {
					["source"] = "Wantêd-Illidan",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[24275] = {
					["source"] = "Holylolring-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[77758] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Metalmend",
					["npcID"] = 0,
				},
				[280583] = {
					["source"] = "Holehunter",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[73920] = {
					["source"] = "Fhaykum",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[1160] = {
					["source"] = "Melvinmoose-Zul'jin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[214202] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sathaendor",
					["npcID"] = 0,
				},
				[274443] = {
					["source"] = "Quickranger-Bloodhoof",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[140092] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Ji-Kun",
					["npcID"] = 69712,
				},
				[194509] = {
					["source"] = "Heartbeatz-Tichondrius",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[300543] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Chi-Ji",
					["npcID"] = 154261,
				},
				[184367] = {
					["source"] = "Doinkster-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[309023] = {
					["source"] = "Shith'rus the Manipulator",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 154727,
				},
				[198368] = {
					["source"] = "Kaedash-Khaz'goroth",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[122281] = {
					["source"] = "Saladin-Bonechewer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[203814] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Gillygillu",
					["npcID"] = 0,
				},
				[109304] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Vverr-Illidan",
					["encounterID"] = 2086,
				},
				[86659] = {
					["type"] = "BUFF",
					["source"] = "Thalron",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[48107] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Gwenevare-WyrmrestAccord",
					["npcID"] = 0,
				},
				[53209] = {
					["source"] = "Philse",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[2379] = {
					["source"] = "Genorider-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2383] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zarinisa-Stormreaver",
					["npcID"] = 0,
				},
				[252687] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Shadowblade Stalker",
					["npcID"] = 122970,
				},
				[195627] = {
					["source"] = "Bloodscoute",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[178740] = {
					["source"] = "Traplifé-Azralon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[303580] = {
					["source"] = "Wantêd-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[292359] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dragoul-Illidan",
					["npcID"] = 0,
				},
				[267288] = {
					["source"] = "Earthen Ring Shaman",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 135671,
				},
				[97462] = {
					["source"] = "Urukaim-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[40623] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Neonpen",
					["npcID"] = 0,
				},
				[292360] = {
					["source"] = "Hafjin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[85948] = {
					["source"] = "Esov-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[203720] = {
					["source"] = "Traplifé-Azralon",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[77575] = {
					["source"] = "Esov-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[92089] = {
					["source"] = "Traplifé-Azralon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272916] = {
					["source"] = "Slicer-Lightninghoof",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[197561] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ironmade-Thrall",
					["npcID"] = 0,
				},
				[188443] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dacorr-ShatteredHand",
					["npcID"] = 0,
				},
				[292362] = {
					["source"] = "Chipx",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[106785] = {
					["source"] = "Freida-AeriePeak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[303621] = {
					["source"] = "Wantêd-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273428] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Díesel",
					["npcID"] = 0,
				},
				[292363] = {
					["source"] = "Cãhuna-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[317439] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Echo of Chi-Ji",
					["npcID"] = 152895,
				},
				[33395] = {
					["source"] = "Water Elemental",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 78116,
				},
				[116014] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Yourefired-Aggramar",
					["npcID"] = 0,
				},
				[292364] = {
					["source"] = "Hankla-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[195630] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dionysús-Malfurion",
					["npcID"] = 0,
				},
				[207028] = {
					["source"] = "Amoreiel-Daggerspine",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[69445] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Decisïonz",
					["npcID"] = 0,
				},
				[48108] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Gwenevare-WyrmrestAccord",
					["npcID"] = 0,
				},
				[96312] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Skryne-BleedingHollow",
					["npcID"] = 0,
				},
				[33907] = {
					["source"] = "Broll Bearmantle",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 142294,
				},
				[119085] = {
					["source"] = "Urvi-Stormreaver",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[308742] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ahriak",
					["npcID"] = 0,
				},
				[203819] = {
					["source"] = "Traplifé-Azralon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[202028] = {
					["source"] = "Xhapes-Icecrown",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[204331] = {
					["source"] = "Fhaykum",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[313113] = {
					["source"] = "Fairin-Akama",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[294926] = {
					["source"] = "Fairin-Akama",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[275481] = {
					["type"] = "BUFF",
					["source"] = "Thalron",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[236060] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Gwenevare-WyrmrestAccord",
					["npcID"] = 0,
				},
				[252692] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Shadowblade Stalker",
					["npcID"] = 122970,
				},
				[246807] = {
					["source"] = "Krystynna-Illidan",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[108211] = {
					["source"] = "Stevenwonder",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5116] = {
					["source"] = "Quickranger-Bloodhoof",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[77762] = {
					["source"] = "Karlurn-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[206891] = {
					["source"] = "Amoreiel-Daggerspine",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[204213] = {
					["source"] = "Heartbeatz-Tichondrius",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275857] = {
					["source"] = "Bloodscoute",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273947] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ertex-Sargeras",
					["npcID"] = 0,
				},
				[288548] = {
					["source"] = "Magus of the Dead",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 148797,
				},
				[296794] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Judge-Aggramar",
					["npcID"] = 0,
				},
				[215479] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dionysús-Malfurion",
					["npcID"] = 0,
				},
				[208683] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Flawlyss-Arthas",
					["npcID"] = 0,
				},
				[275931] = {
					["source"] = "Clapedcheeks-Rivendare",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[266030] = {
					["source"] = "Zarthell-Arygos",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[285719] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Juggerbear",
					["npcID"] = 0,
				},
				[236021] = {
					["source"] = "Freida-AeriePeak",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257044] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Vverr-Illidan",
					["npcID"] = 0,
				},
				[197937] = {
					["type"] = "BUFF",
					["source"] = "Celaste-LaughingSkull",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[48045] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Celaste-LaughingSkull",
					["encounterID"] = 2086,
				},
				[134614] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[139546] = {
					["source"] = "Wantêd-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[199412] = {
					["source"] = "Chira-Ragnaros",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[314698] = {
					["source"] = "Vuk'laz the Earthbreaker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 160970,
				},
				[2643] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fayia-Arthas",
					["npcID"] = 0,
				},
				[72968] = {
					["source"] = "Starsurgeon-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[204079] = {
					["type"] = "DEBUFF",
					["source"] = "Thalron",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2085,
				},
				[5308] = {
					["source"] = "Doinkster-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[1330] = {
					["source"] = "Lunareste",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[270370] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bilgewater Incinerator",
					["npcID"] = 135541,
				},
				[231895] = {
					["source"] = "Holycowpatty-Antonidas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[287771] = {
					["source"] = "Assoka-Drakkari",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[193333] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Azzorahai-Kel'Thuzad",
					["npcID"] = 0,
				},
				[294935] = {
					["source"] = "Nifx-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268836] = {
					["source"] = "Holycowpatty-Antonidas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[31707] = {
					["source"] = "Water Elemental",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 78116,
				},
				[247454] = {
					["source"] = "Traplifé-Azralon",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[202164] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Razorcakes",
					["npcID"] = 0,
				},
				[197919] = {
					["source"] = "Xuxuu-Azralon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[108853] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Gwenevare-WyrmrestAccord",
					["npcID"] = 0,
				},
				[273955] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sathaendor",
					["npcID"] = 0,
				},
				[124682] = {
					["source"] = "Saladin-Bonechewer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[289308] = {
					["source"] = "Aesse",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[97463] = {
					["source"] = "Urukaim-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[253721] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Shieldbearer of Zul",
					["npcID"] = 127879,
				},
				[107574] = {
					["source"] = "Urukaim-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[196608] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dionysús-Malfurion",
					["npcID"] = 0,
				},
				[298009] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Richdollahz",
					["npcID"] = 0,
				},
				[304662] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Meaven-Zul'jin",
					["npcID"] = 0,
				},
				[198837] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Risen Skulker",
					["npcID"] = 99541,
				},
				[212423] = {
					["source"] = "Risen Skulker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 99541,
				},
				[273836] = {
					["source"] = "Callirra-Daggerspine",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[304663] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jaquelator-Arthas",
					["npcID"] = 0,
				},
				[155722] = {
					["source"] = "Freida-AeriePeak",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[198069] = {
					["source"] = "Heartbeatz-Tichondrius",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[225832] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Viixxie",
					["npcID"] = 0,
				},
				[302952] = {
					["source"] = "Augustina-Aegwynn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288800] = {
					["type"] = "BUFF",
					["source"] = "Gwenevare-WyrmrestAccord",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[26297] = {
					["source"] = "Freida-AeriePeak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[301991] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[273285] = {
					["encounterID"] = 2112,
					["source"] = "Volatile Pod",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 139127,
				},
				[298466] = {
					["source"] = "Ilgynoth-Tanaris",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[266265] = {
					["source"] = "Fallen Deathspeaker",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 134284,
				},
				[215598] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kheldoran",
					["npcID"] = 0,
				},
				[212653] = {
					["source"] = "Verthel",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[270379] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bilgewater Worker",
					["npcID"] = 135561,
				},
				[49376] = {
					["source"] = "Xhapes-Icecrown",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[192058] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dacorr-ShatteredHand",
					["npcID"] = 0,
				},
				[204596] = {
					["source"] = "Traplifé-Azralon",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[2823] = {
					["source"] = "Nüll-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[262161] = {
					["source"] = "Urukaim-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[268769] = {
					["source"] = "Hairygal-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[285981] = {
					["source"] = "Starsurgeon-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[266106] = {
					["source"] = "Feral Bloodswarmer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 133835,
				},
				[272940] = {
					["source"] = "Modflanders-Cho'gall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[316439] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Deephive Soldier",
					["npcID"] = 163703,
				},
				[19505] = {
					["source"] = "Bragkek",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 58964,
				},
				[292361] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["npcID"] = 0,
				},
				[212704] = {
					["source"] = "Samëdi-Azralon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[54049] = {
					["source"] = "Bragkek",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 58964,
				},
				[56222] = {
					["source"] = "Ikalo-Zul'jin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[5740] = {
					["source"] = "Rotrin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[265091] = {
					["source"] = "Devout Blood Priest",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 131492,
				},
				[164547] = {
					["source"] = "Define-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[204598] = {
					["source"] = "Traplifé-Azralon",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[165961] = {
					["source"] = "Shunkashuto-Dalaran",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273185] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Shieldbearer of Zul",
					["npcID"] = 127879,
				},
				[256456] = {
					["source"] = "Battlebull-Madoran",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[269301] = {
					["type"] = "DEBUFF",
					["source"] = "Unbound Abomination",
					["encounterID"] = 2123,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 133007,
				},
				[197690] = {
					["source"] = "Urukaim-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[36213] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Greater Earth Elemental",
					["npcID"] = 95072,
				},
				[1329] = {
					["source"] = "Lunareste",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[153595] = {
					["source"] = "Aesse",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[278574] = {
					["source"] = "Christmasnub-Tichondrius",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272945] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Instantdeath-Bloodhoof",
					["npcID"] = 0,
				},
				[1464] = {
					["source"] = "Urukaim-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[293142] = {
					["source"] = "Lazerbeamzz-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[319241] = {
					["source"] = "Mjiollnir-BleedingHollow",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288024] = {
					["source"] = "Rawdawgw-Kel'Thuzad",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[162243] = {
					["source"] = "Yungs-Zul'jin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[116768] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hecatè-Malfurion",
					["npcID"] = 0,
				},
				[260879] = {
					["encounterID"] = 2111,
					["source"] = "Elder Leaxa",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 131318,
				},
				[296211] = {
					["source"] = "Fivespot-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[318216] = {
					["source"] = "Lunareste",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[20572] = {
					["source"] = "Crushhero-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[214968] = {
					["source"] = "Esov-Illidan",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[289324] = {
					["source"] = "Kthxbai-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275507] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Infused Bedrock",
					["npcID"] = 136614,
				},
				[1490] = {
					["source"] = "Yungs-Zul'jin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2983] = {
					["source"] = "Rumbawls-LaughingSkull",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[264761] = {
					["source"] = "Novae",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[205369] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Celaste-LaughingSkull",
					["encounterID"] = 2086,
				},
				[260894] = {
					["encounterID"] = 2111,
					["source"] = "Elder Leaxa",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 131318,
				},
				[201787] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Sädä-Malfurion",
					["npcID"] = 0,
				},
				[268856] = {
					["type"] = "BUFF",
					["source"] = "Zahmerdh",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[269880] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 135901,
				},
				[273974] = {
					["source"] = "Rotrin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[256404] = {
					["source"] = "Bonebeak Vulture",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 136664,
				},
				[287280] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sathaendor",
					["npcID"] = 0,
				},
				[295186] = {
					["source"] = "Whípple-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[269881] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bloodbough Funggarian",
					["npcID"] = 135901,
				},
				[265668] = {
					["source"] = "Living Rot",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 133852,
				},
				[264764] = {
					["source"] = "Novae",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295470] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ma'haat the Indomitable",
					["npcID"] = 151739,
				},
				[265089] = {
					["source"] = "Devout Blood Priest",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 131492,
				},
				[115767] = {
					["source"] = "Melvinmoose-Zul'jin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[260384] = {
					["source"] = "Arabella-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[124211] = {
					["source"] = "Yogibeär",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[69070] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Skof-Aegwynn",
					["npcID"] = 0,
				},
				[267326] = {
					["type"] = "BUFF",
					["source"] = "Vverr-Illidan",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[130736] = {
					["source"] = "Puppetchill-Illidan",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267325] = {
					["type"] = "BUFF",
					["source"] = "Vverr-Illidan",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[259873] = {
					["source"] = "Bonebeak Scavenger",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 124527,
				},
				[211881] = {
					["source"] = "Callirra-Daggerspine",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[176458] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Blacksmithing Follower - Horde",
					["npcID"] = 88402,
				},
				[273467] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Brother Meller",
					["npcID"] = 154447,
				},
				[276026] = {
					["source"] = "Freida-AeriePeak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[41168] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Unbound Centurion",
					["npcID"] = 68176,
				},
				[299790] = {
					["source"] = "Verthel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267327] = {
					["type"] = "BUFF",
					["source"] = "Vverr-Illidan",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[114800] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[33377] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[132626] = {
					["source"] = "Dewgie-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[268062] = {
					["source"] = "Ilgynoth-Tanaris",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[252395] = {
					["source"] = "Mastuhh-Thrall",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[256967] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Frightened Brutosaur",
					["npcID"] = 129668,
				},
				[118455] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fayia-Arthas",
					["npcID"] = 0,
				},
				[267329] = {
					["type"] = "BUFF",
					["source"] = "Vverr-Illidan",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[184575] = {
					["source"] = "Frogy-Agamaggan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[194627] = {
					["source"] = "Zarthell-Arygos",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[299788] = {
					["source"] = "Holylolring-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267330] = {
					["source"] = "Whípple-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[315336] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Unknown",
					["npcID"] = 161974,
				},
				[166139] = {
					["source"] = "Sun Prophet Tenhamen",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 154727,
				},
				[268854] = {
					["source"] = "Yungs-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267331] = {
					["type"] = "BUFF",
					["source"] = "Vverr-Illidan",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[260069] = {
					["source"] = "Priest of Gonk",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 131809,
				},
				[89158] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Nello-Norgannon",
					["npcID"] = 0,
				},
				[101568] = {
					["source"] = "Esov-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[59052] = {
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1106,
				},
				[270657] = {
					["source"] = "Theoshun-ShatteredHand",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[100] = {
					["source"] = "Urukaim-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[89798] = {
					["source"] = "Lord Victor Nefarius",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 49799,
				},
				[278523] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Chanuka-Zul'jin",
					["npcID"] = 0,
				},
				[235313] = {
					["source"] = "Mina-BloodFurnace",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1604] = {
					["source"] = "Pit Snake",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 126894,
				},
				[233778] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[30283] = {
					["source"] = "Rotrin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[247218] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Honorbound Grunt",
					["npcID"] = 154749,
				},
				[264265] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lexa",
					["npcID"] = 32517,
				},
				[264776] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mïcha",
					["npcID"] = 0,
				},
				[293946] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Strategy",
					["npcID"] = 0,
				},
				[273988] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dacorr-ShatteredHand",
					["npcID"] = 0,
				},
				[303158] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Zanj'ir Myrmidon",
					["npcID"] = 153960,
				},
				[256296] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rhothomir",
					["npcID"] = 0,
				},
				[312370] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Pikaçhu",
					["npcID"] = 0,
				},
				[265019] = {
					["source"] = "Chosen Blood Matron",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 131436,
				},
				[162794] = {
					["source"] = "Taldreil-Zul'jin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[301624] = {
					["source"] = "Aesse",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[44212] = {
					["source"] = "Tunon-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[225080] = {
					["type"] = "DEBUFF",
					["source"] = "Fhaykum",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[200772] = {
					["source"] = "Explorer's League Researcher",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 161938,
				},
				[193455] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tekyto",
					["npcID"] = 0,
				},
				[287808] = {
					["source"] = "Autofill-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[41188] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ashtongue Primalist",
					["npcID"] = 68096,
				},
				[6572] = {
					["source"] = "Melvinmoose-Zul'jin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[113724] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Evilinferno-Aggramar",
					["npcID"] = 0,
				},
				[280544] = {
					["source"] = "Renje-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[212799] = {
					["source"] = "Fæk",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272457] = {
					["encounterID"] = 2112,
					["source"] = "Sporecaller Zancha",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 131383,
				},
				[31224] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Flawlyss-Arthas",
					["npcID"] = 0,
				},
				[273481] = {
					["source"] = "Frogy-Agamaggan",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[302651] = {
					["source"] = "Civex-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[70581] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Achilios",
					["npcID"] = 0,
				},
				[272970] = {
					["source"] = "Ronfreezly-Illidan",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[6660] = {
					["source"] = "Amathet Bowman",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 151800,
				},
				[212800] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zahmerdh",
					["npcID"] = 0,
				},
				[6668] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Pera Firestone",
					["npcID"] = 64480,
				},
				[268877] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fayia-Arthas",
					["npcID"] = 0,
				},
				[35746] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kaylaan",
					["npcID"] = 20780,
				},
				[313088] = {
					["source"] = "Cbegswar-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[51505] = {
					["source"] = "Karlurn-BleedingHollow",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[31850] = {
					["type"] = "BUFF",
					["source"] = "Thalron",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[20707] = {
					["source"] = "Zarthell-Arygos",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[290372] = {
					["source"] = "Maelchon-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[53385] = {
					["source"] = "Frogy-Agamaggan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[289349] = {
					["source"] = "Ikalo-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[62124] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thalron",
					["encounterID"] = 2086,
				},
				[304611] = {
					["source"] = "Rÿlañ-Zul'jin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[265495] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[245686] = {
					["source"] = "Hankla-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[296003] = {
					["source"] = "Flexheal-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[6788] = {
					["source"] = "Jazlah-Illidan",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[185123] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Zahmerdh",
					["npcID"] = 0,
				},
				[408] = {
					["source"] = "Crushhero-Zul'jin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193357] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Otters-Eonar",
					["npcID"] = 0,
				},
				[1706] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Celaste-LaughingSkull",
					["npcID"] = 0,
				},
				[86603] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 68137,
				},
				[188499] = {
					["source"] = "Taldreil-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[119611] = {
					["source"] = "Saladin-Bonechewer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297995] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ázazyel",
					["npcID"] = 0,
				},
				[280653] = {
					["source"] = "Cbegswar-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272469] = {
					["source"] = "Abyssal Reach",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 138538,
				},
				[17253] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Giggles",
					["npcID"] = 14228,
				},
				[300612] = {
					["source"] = "Megadoodoo-Tichondrius",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280654] = {
					["source"] = "Freida-AeriePeak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[313918] = {
					["source"] = "Hellriderr-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[71507] = {
					["source"] = "Orgrimmar Wind Rider",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 51346,
				},
				[260881] = {
					["source"] = "Cãhuna-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[262232] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dahreon-Stormreaver",
					["npcID"] = 0,
				},
				[272979] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ironmade-Thrall",
					["npcID"] = 0,
				},
				[115006] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hozen Gutripper",
					["npcID"] = 58943,
				},
				[193358] = {
					["source"] = "Sauzey",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[203849] = {
					["source"] = "Gnominatrix",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[184662] = {
					["source"] = "Christmasnub-Tichondrius",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[47540] = {
					["source"] = "Jazlah-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[317507] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Depthsborn Binder",
					["npcID"] = 154200,
				},
				[317503] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Depthsborn Binder",
					["npcID"] = 154200,
				},
				[196941] = {
					["source"] = "Nimetz-Azralon",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268893] = {
					["source"] = "Lunareste",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193359] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Otters-Eonar",
					["npcID"] = 0,
				},
				[297034] = {
					["source"] = "Jáydee",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[251187] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Toxic Saurid",
					["npcID"] = 128435,
				},
				[300802] = {
					["source"] = "Yungs-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[116670] = {
					["source"] = "Saladin-Bonechewer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[297035] = {
					["source"] = "Starbuk-Kargath",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1766] = {
					["source"] = "Lunareste",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[40120] = {
					["source"] = "Starsurgeon-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[194384] = {
					["source"] = "Jazlah-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[317506] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Depthsborn Binder",
					["npcID"] = 154200,
				},
				[251188] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Toxic Saurid",
					["npcID"] = 128435,
				},
				[314107] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Faceless Tormentor",
					["npcID"] = 153904,
				},
				[280149] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hellgôre",
					["npcID"] = 0,
				},
				[297037] = {
					["source"] = "Eleious-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[269406] = {
					["encounterID"] = 2123,
					["source"] = "Titan Keeper Hezrel",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 134419,
				},
				[275544] = {
					["source"] = "Heartbeatz-Tichondrius",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[316996] = {
					["source"] = "Sun Prophet Tenhamen",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 154727,
				},
				[203852] = {
					["source"] = "Garto-Tanaris",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[289362] = {
					["source"] = "Flamejob-Kel'Thuzad",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[212552] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["npcID"] = 0,
				},
				[115008] = {
					["source"] = "Tarkkick",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[297039] = {
					["source"] = "Frznspirit",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[225602] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Azâghal",
					["npcID"] = 0,
				},
				[104773] = {
					["type"] = "BUFF",
					["source"] = "Hungryorphan-Frostmourne",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[118635] = {
					["source"] = "Fairin-Akama",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297040] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bubblexone",
					["npcID"] = 0,
				},
				[199736] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Inserrection-Thrall",
					["npcID"] = 0,
				},
				[47541] = {
					["source"] = "Puppetchill-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[125883] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sunwukhong-Thrall",
					["npcID"] = 0,
				},
				[288853] = {
					["source"] = "Clapedcheeks-Rivendare",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[260402] = {
					["type"] = "BUFF",
					["source"] = "Vverr-Illidan",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[122301] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Water Sprite",
					["npcID"] = 62930,
				},
				[5221] = {
					["source"] = "Freida-AeriePeak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[286587] = {
					["source"] = "Assoka-Drakkari",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[29120] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Honor Hold Archer",
					["npcID"] = 16896,
				},
				[312720] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lost Guardian",
					["npcID"] = 153826,
				},
				[259358] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rhothomir",
					["npcID"] = 0,
				},
				[53600] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thalron",
					["npcID"] = 0,
				},
				[252215] = {
					["source"] = "Crimson Cultist",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 138274,
				},
				[5277] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Flawlyss-Arthas",
					["npcID"] = 0,
				},
				[253239] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dazar'ai Juggernaut",
					["npcID"] = 122971,
				},
				[303698] = {
					["source"] = "Autofill-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268898] = {
					["source"] = "Saiyori",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[204197] = {
					["source"] = "Heartbeatz-Tichondrius",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[268899] = {
					["source"] = "Ronfreezly-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[40505] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Horde Vanguard",
					["npcID"] = 156624,
				},
				[252216] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Govinda",
					["npcID"] = 0,
				},
				[34344] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Unbound Bonemender",
					["npcID"] = 68175,
				},
				[1850] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sèetah",
					["npcID"] = 0,
				},
				[55090] = {
					["source"] = "Puppetchill-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[8679] = {
					["source"] = "Clasturavin-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[51124] = {
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1106,
				},
				[216528] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bratàc",
					["npcID"] = 0,
				},
				[82326] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bophercherry",
					["npcID"] = 0,
				},
				[205351] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Celaste-LaughingSkull",
					["encounterID"] = 2086,
				},
				[175456] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Snowbird-Zul'jin",
					["npcID"] = 0,
				},
				[205648] = {
					["source"] = "Mjiollnir-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[546] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[31935] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ironmade-Thrall",
					["npcID"] = 0,
				},
				[255371] = {
					["npcID"] = 122963,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rezan",
					["encounterID"] = 2086,
				},
				[272266] = {
					["source"] = "Warmother Captive",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 134625,
				},
				[17364] = {
					["source"] = "Mjiollnir-BleedingHollow",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[118] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Yourefired-Aggramar",
					["npcID"] = 0,
				},
				[113900] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Demonic Gateway",
					["npcID"] = 59271,
				},
				[20271] = {
					["source"] = "Frogy-Agamaggan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[143625] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cõnker-Exodar",
					["npcID"] = 0,
				},
				[268904] = {
					["source"] = "Sunspot-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[180749] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Alvia",
					["npcID"] = 0,
				},
				[312915] = {
					["source"] = "Monjaro-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[107079] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Flawlyss-Arthas",
					["npcID"] = 0,
				},
				[268905] = {
					["source"] = "Sunspot-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[278789] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[106951] = {
					["source"] = "Leecoli-Kilrogg",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[70233] = {
					["source"] = "Bothered",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[121536] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kezma",
					["npcID"] = 0,
				},
				[3409] = {
					["source"] = "Lunareste",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280165] = {
					["source"] = "Freida-AeriePeak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[206930] = {
					["source"] = "Ikalo-Zul'jin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[280404] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Hungryorphan-Frostmourne",
					["npcID"] = 0,
				},
				[15284] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Unbound Centurion",
					["npcID"] = 68176,
				},
				[279584] = {
					["source"] = "Taldreil-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[156779] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Qballz-Destromath",
					["npcID"] = 0,
				},
				[89808] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Gible",
					["npcID"] = 58959,
				},
				[203233] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ñébuleuse-Zul'jin",
					["npcID"] = 0,
				},
				[13877] = {
					["source"] = "Wantêd-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[71769] = {
					["type"] = "BUFF",
					["source"] = "The Lich King",
					["npcID"] = 36597,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1106,
				},
				[20549] = {
					["source"] = "Whípple-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[223819] = {
					["source"] = "Krystynna-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[209746] = {
					["source"] = "Themaster-Ragnaros",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[70234] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dovehunter-Thrall",
					["npcID"] = 0,
				},
				[11366] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Gwenevare-WyrmrestAccord",
					["encounterID"] = 2086,
				},
				[152175] = {
					["source"] = "Assoka-Drakkari",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[117828] = {
					["source"] = "Rotrin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[249919] = {
					["npcID"] = 122968,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Yazma",
					["encounterID"] = 2087,
				},
				[268911] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ironmade-Thrall",
					["npcID"] = 0,
				},
				[260666] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Gilded Priestess",
					["npcID"] = 132126,
				},
				[199844] = {
					["source"] = "Aesse",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[316508] = {
					["source"] = "Magni Bronzebeard",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 154533,
				},
				[122] = {
					["source"] = "Aesse",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[312411] = {
					["source"] = "Ikalo-Zul'jin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[278124] = {
					["source"] = "Melvinmoose-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279810] = {
					["type"] = "BUFF",
					["source"] = "Fanatixxh-BleedingHollow",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[113899] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Demonic Gateway",
					["npcID"] = 59262,
				},
				[260667] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Gilded Priestess",
					["npcID"] = 132126,
				},
				[109128] = {
					["source"] = "Urukaim-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[70235] = {
					["source"] = "Sistersharp-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[191837] = {
					["source"] = "Saladin-Bonechewer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[312413] = {
					["source"] = "Amathet Zealot",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 151801,
				},
				[261947] = {
					["source"] = "Assoka-Drakkari",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[305249] = {
					["source"] = "Amoreiel-Daggerspine",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[287338] = {
					["source"] = "Déjà-Aegwynn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[260668] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Gilded Priestess",
					["npcID"] = 132126,
				},
				[317020] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sravone-Mal'Ganis",
					["npcID"] = 0,
				},
				[246851] = {
					["type"] = "BUFF",
					["source"] = "Fanatixxh-BleedingHollow",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[134522] = {
					["source"] = "Taress-Dalaran",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[281711] = {
					["source"] = "Gorbanzo",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[49143] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ahriak",
					["encounterID"] = 1106,
				},
				[259718] = {
					["encounterID"] = 2112,
					["source"] = "Sporecaller Zancha",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 131383,
				},
				[53365] = {
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1106,
				},
				[279664] = {
					["npcID"] = 143520,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Vanquished Tendril of G'huun",
					["encounterID"] = 2086,
				},
				[11426] = {
					["source"] = "Aesse",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[246852] = {
					["type"] = "BUFF",
					["source"] = "Fanatixxh-BleedingHollow",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[228128] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rakporine",
					["npcID"] = 0,
				},
				[313136] = {
					["source"] = "Acolyte Taspu",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 157170,
				},
				[8004] = {
					["source"] = "Wurrzaag-Gilneas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[19750] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Chanuka-Zul'jin",
					["npcID"] = 0,
				},
				[17735] = {
					["source"] = "Klathtaz",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 1860,
				},
				[17767] = {
					["source"] = "Klathtaz",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 1860,
				},
				[298601] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[246853] = {
					["source"] = "Whípple-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[191840] = {
					["source"] = "Saladin-Bonechewer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[305252] = {
					["source"] = "Amoreiel-Daggerspine",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[279913] = {
					["source"] = "Rotrin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[198819] = {
					["source"] = "Urukaim-Mal'Ganis",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[86606] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Krolusk Sandhunter",
					["npcID"] = 135582,
				},
				[197214] = {
					["source"] = "Mjiollnir-BleedingHollow",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[134616] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[65410] = {
					["source"] = "Lightpatches-Ravenholdt",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295533] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 151603,
				},
				[280830] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tyronika-Doomhammer",
					["npcID"] = 0,
				},
				[284275] = {
					["source"] = "Eree-Dalaran",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288882] = {
					["source"] = "Haleios-Sargeras",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[302964] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ma'haat the Indomitable",
					["npcID"] = 151739,
				},
				[266083] = {
					["source"] = "Vathikur",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 130401,
				},
				[280177] = {
					["source"] = "Fæk",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[303211] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lumiae",
					["npcID"] = 0,
				},
				[24450] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 66164,
				},
				[307128] = {
					["source"] = "Wantêd-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[12294] = {
					["source"] = "Urukaim-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[34026] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fayia-Arthas",
					["npcID"] = 0,
				},
				[2096] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Furshadow",
					["npcID"] = 0,
				},
				[300142] = {
					["source"] = "Brionac-Arthas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[209754] = {
					["source"] = "Kaedash-Khaz'goroth",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[191587] = {
					["source"] = "Esov-Illidan",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[130] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Gwenevare-WyrmrestAccord",
					["npcID"] = 0,
				},
				[279673] = {
					["type"] = "BUFF",
					["source"] = "Skof-Aegwynn",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[70242] = {
					["source"] = "Crossgrip-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[196770] = {
					["source"] = "Déjà-Aegwynn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[281209] = {
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1106,
				},
				[281721] = {
					["source"] = "Taldreil-Zul'jin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[258883] = {
					["source"] = "Yungs-Zul'jin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[95826] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Horde Vanguard",
					["npcID"] = 156624,
				},
				[48265] = {
					["source"] = "Genorider-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[202335] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dionysús-Malfurion",
					["npcID"] = 0,
				},
				[116680] = {
					["source"] = "Saladin-Bonechewer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2120] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Gwenevare-WyrmrestAccord",
					["npcID"] = 0,
				},
				[133] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Gwenevare-WyrmrestAccord",
					["encounterID"] = 2086,
				},
				[316522] = {
					["source"] = "Esov-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[198817] = {
					["source"] = "Urukaim-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[109132] = {
					["source"] = "Kthxbai-BleedingHollow",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[208796] = {
					["source"] = "Traplifé-Azralon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[255558] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[255814] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Reanimated Honor Guard",
					["npcID"] = 127757,
				},
				[249929] = {
					["type"] = "DEBUFF",
					["source"] = "Zahmerdh",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2087,
				},
				[136] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cerbi-Sargeras",
					["npcID"] = 0,
				},
				[278145] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Sathaendor",
					["npcID"] = 0,
				},
				[294519] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Crazed Earth Rager",
					["npcID"] = 151638,
				},
				[114250] = {
					["source"] = "Flamejob-Kel'Thuzad",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[132483] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Nazani-BleedingHollow",
					["npcID"] = 0,
				},
				[118000] = {
					["source"] = "Doinkster-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[233395] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Gommerr",
					["npcID"] = 0,
				},
				[212061] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 129276,
				},
				[215387] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kheldoran",
					["npcID"] = 0,
				},
				[106830] = {
					["source"] = "Freida-AeriePeak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[211805] = {
					["source"] = "Déjà-Aegwynn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[244813] = {
					["source"] = "Brionac-Arthas",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[132480] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Donisaur-BleedingHollow",
					["npcID"] = 0,
				},
				[288371] = {
					["type"] = "DEBUFF",
					["source"] = "Celaste-LaughingSkull",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[269843] = {
					["encounterID"] = 2123,
					["source"] = "Unbound Abomination",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 133007,
				},
				[113942] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[139] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dhuum",
					["npcID"] = 0,
				},
				[302917] = {
					["source"] = "Doinkster-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[278147] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sathaendor",
					["npcID"] = 0,
				},
				[297082] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Minuét-Quel'Thalas",
					["npcID"] = 0,
				},
				[8936] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ipunishcatz",
					["npcID"] = 0,
				},
				[108366] = {
					["source"] = "Leveathan-Aggramar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[284277] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Litbadjr-Thrall",
					["npcID"] = 0,
				},
				[62061] = {
					["source"] = "Wojö",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[244808] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sandclaw Crab",
					["npcID"] = 145337,
				},
				[2061] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Furshadow",
					["npcID"] = 0,
				},
				[256148] = {
					["source"] = "Lunareste",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[55095] = {
					["type"] = "DEBUFF",
					["source"] = "Ahriak",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1106,
				},
				[268887] = {
					["source"] = "Lunareste",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[207203] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Veíl-Stormreaver",
					["npcID"] = 0,
				},
				[139141] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kanrethad Ebonlocke",
					["npcID"] = 69964,
				},
				[280709] = {
					["source"] = "Fhaykum",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[34433] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Celaste-LaughingSkull",
					["encounterID"] = 2086,
				},
				[297088] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hellenkìller-Thrall",
					["npcID"] = 0,
				},
				[258889] = {
					["source"] = "Faithless Skycaller",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 122746,
				},
				[193641] = {
					["source"] = "Lunareste",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[270987] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 120949,
				},
				[194153] = {
					["source"] = "Define-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[77535] = {
					["source"] = "Ikalo-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[269185] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 133007,
				},
				[90328] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 151133,
				},
				[217694] = {
					["source"] = "Brionac-Arthas",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[179057] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Zahmerdh",
					["npcID"] = 0,
				},
				[115276] = {
					["npcID"] = 58959,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Gible",
					["encounterID"] = 2086,
				},
				[280204] = {
					["source"] = "Taldreil-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[34428] = {
					["source"] = "Urukaim-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[286342] = {
					["type"] = "BUFF",
					["source"] = "Celaste-LaughingSkull",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[297089] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Minuét-Quel'Thalas",
					["npcID"] = 0,
				},
				[1784] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nello-Norgannon",
					["npcID"] = 0,
				},
				[105809] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sathaendor",
					["npcID"] = 0,
				},
				[317563] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Vil'raxx",
					["npcID"] = 153326,
				},
				[45181] = {
					["source"] = "Lunareste",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[220510] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Decisïonz",
					["npcID"] = 0,
				},
				[70244] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xndrya",
					["npcID"] = 0,
				},
				[6789] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hungryorphan-Frostmourne",
					["npcID"] = 0,
				},
				[257408] = {
					["source"] = "Gena-Wildhammer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[250192] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[213602] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kezma",
					["npcID"] = 0,
				},
				[213858] = {
					["source"] = "Doinkster-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[70243] = {
					["source"] = "Zinfel-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[198764] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Echo of Chi-Ji",
					["npcID"] = 152895,
				},
				[255824] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dazar'ai Juggernaut",
					["npcID"] = 122971,
				},
				[280205] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Amaiko",
					["npcID"] = 0,
				},
				[208997] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[83958] = {
					["source"] = "Ellesmêre",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[13750] = {
					["source"] = "Wantêd-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[294027] = {
					["type"] = "BUFF",
					["source"] = "Thalron",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[199786] = {
					["source"] = "Aesse",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[126664] = {
					["source"] = "Urukaim-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[54149] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sathaendor",
					["npcID"] = 0,
				},
				[190319] = {
					["type"] = "BUFF",
					["source"] = "Gwenevare-WyrmrestAccord",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[182387] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Dacorr-ShatteredHand",
					["npcID"] = 0,
				},
				[190831] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Azzorahai-Kel'Thuzad",
					["npcID"] = 0,
				},
				[260685] = {
					["type"] = "DEBUFF",
					["source"] = "Elder Leaxa",
					["encounterID"] = 2111,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 131318,
				},
				[35778] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 20134,
				},
				[51514] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[195949] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wintergrasp-Turalyon",
					["npcID"] = 0,
				},
				[281744] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zdune",
					["npcID"] = 0,
				},
				[202602] = {
					["source"] = "Skyhooker-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268439] = {
					["source"] = "Freida-AeriePeak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267374] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 135976,
				},
				[215652] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lightmaden-Thrall",
					["npcID"] = 0,
				},
				[2484] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dacorr-ShatteredHand",
					["npcID"] = 0,
				},
				[205929] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Krunkadunk",
					["npcID"] = 0,
				},
				[197277] = {
					["source"] = "Frogy-Agamaggan",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[104276] = {
					["source"] = "Xpression-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[98008] = {
					["source"] = "Fhaykum",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[302912] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Zanj'ir Trapper",
					["npcID"] = 153962,
				},
				[268953] = {
					["source"] = "Rotrin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[276211] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thalron",
					["npcID"] = 0,
				},
				[115151] = {
					["source"] = "Saladin-Bonechewer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[198300] = {
					["source"] = "Mjiollnir-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268954] = {
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1106,
				},
				[261711] = {
					["source"] = "Krolusk Dunemite",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 133234,
				},
				[281178] = {
					["source"] = "Sunspot-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[198766] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Echo of Chi-Ji",
					["npcID"] = 152895,
				},
				[93402] = {
					["source"] = "Define-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[278769] = {
					["source"] = "Traplifé-Azralon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[270997] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Frenzied Ranishu",
					["npcID"] = 137208,
				},
				[24870] = {
					["source"] = "Sunspot-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[49020] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ahriak",
					["encounterID"] = 1106,
				},
				[261712] = {
					["source"] = "Saltspine Krolusk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 124016,
				},
				[100784] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hecatè-Malfurion",
					["npcID"] = 0,
				},
				[152279] = {
					["source"] = "Déjà-Aegwynn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[299662] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Blindfish",
					["npcID"] = 0,
				},
				[300174] = {
					["source"] = "Bacata-Dalaran",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[80353] = {
					["type"] = "BUFF",
					["source"] = "Brionac-Arthas",
					["encounterID"] = 2123,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[264352] = {
					["source"] = "Elhfireah",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[45438] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Evilinferno-Aggramar",
					["npcID"] = 0,
				},
				[265376] = {
					["source"] = "Fanatical Headhunter",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 133663,
				},
				[296779] = {
					["source"] = "Wudie-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[35395] = {
					["source"] = "Frogy-Agamaggan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[299664] = {
					["source"] = "Meandmykids-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[265377] = {
					["source"] = "Fanatical Headhunter",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 133663,
				},
				[113746] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Dionysús-Malfurion",
					["npcID"] = 0,
				},
				[279709] = {
					["source"] = "Themaster-Ragnaros",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[278767] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Padop-Stormrage",
					["npcID"] = 0,
				},
				[257620] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Vverr-Illidan",
					["npcID"] = 0,
				},
				[317065] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hunnehbuns-Illidan",
					["npcID"] = 0,
				},
				[312973] = {
					["source"] = "Suntouched Acolyte",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 151960,
				},
				[290468] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Altoìd-BleedingHollow",
					["npcID"] = 0,
				},
				[256382] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mountain Greatstag",
					["npcID"] = 127806,
				},
				[80354] = {
					["source"] = "Lërne-Zul'jin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297108] = {
					["source"] = "Cbegswar-BleedingHollow",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[276205] = {
					["type"] = "BUFF",
					["source"] = "Thalron",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[123725] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Dionysús-Malfurion",
					["npcID"] = 0,
				},
				[300691] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ertex-Sargeras",
					["npcID"] = 0,
				},
				[123981] = {
					["source"] = "Ikalo-Zul'jin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[209261] = {
					["source"] = "Lleeched-Mal'Ganis",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[296086] = {
					["source"] = "Jazlah-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[12743] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 19261,
				},
				[268910] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ironmade-Thrall",
					["npcID"] = 0,
				},
				[287790] = {
					["source"] = "Starsurgeon-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257622] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Vverr-Illidan",
					["npcID"] = 0,
				},
				[300693] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Scyne-Mal'Ganis",
					["npcID"] = 0,
				},
				[265084] = {
					["source"] = "Devout Blood Priest",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 131492,
				},
				[255577] = {
					["type"] = "BUFF",
					["source"] = "Priestess Alun'za",
					["npcID"] = 122967,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2084,
				},
				[215607] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kheldoran",
					["npcID"] = 0,
				},
				[106839] = {
					["source"] = "Freida-AeriePeak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[53563] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sathaendor",
					["npcID"] = 0,
				},
				[319237] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sebârt-Illidan",
					["npcID"] = 0,
				},
				[35917] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 20135,
				},
				[302816] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Crazed Earth Rager",
					["npcID"] = 151638,
				},
				[196725] = {
					["source"] = "Saladin-Bonechewer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[3714] = {
					["source"] = "Thialo-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[172673] = {
					["source"] = "Sun Prophet Tenhamen",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 154727,
				},
				[312978] = {
					["source"] = "Amathet Lightblade",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 151806,
				},
				[8921] = {
					["source"] = "Define-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[297117] = {
					["source"] = "Namnams-Dalaran",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279715] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Gwenevare-WyrmrestAccord",
					["npcID"] = 0,
				},
				[279204] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Icurus",
					["npcID"] = 0,
				},
				[17962] = {
					["source"] = "Rotrin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[137619] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Flawlyss-Arthas",
					["npcID"] = 0,
				},
				[215661] = {
					["source"] = "Augustina-Aegwynn",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[292580] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[297116] = {
					["source"] = "Vindral-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[15286] = {
					["type"] = "BUFF",
					["source"] = "Celaste-LaughingSkull",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[259161] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zarinisa-Stormreaver",
					["npcID"] = 0,
				},
				[44544] = {
					["source"] = "Rynosia-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[317587] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Vil'raxx",
					["npcID"] = 153326,
				},
				[297118] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bigbroseidon",
					["npcID"] = 0,
				},
				[24423] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "johnny",
					["npcID"] = 124527,
				},
				[273843] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[317588] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Vil'raxx",
					["npcID"] = 153326,
				},
				[201846] = {
					["source"] = "Mjiollnir-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[255579] = {
					["type"] = "BUFF",
					["source"] = "Priestess Alun'za",
					["npcID"] = 122967,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2084,
				},
				[255835] = {
					["type"] = "DEBUFF",
					["source"] = "Priestess Alun'za",
					["npcID"] = 122967,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2084,
				},
				[22568] = {
					["source"] = "Freida-AeriePeak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[287062] = {
					["source"] = "Uzimang-Dalaran",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[35013] = {
					["source"] = "Time-Lost Controller",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 18327,
				},
				[43265] = {
					["source"] = "Ikalo-Zul'jin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[236645] = {
					["source"] = "Verthel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[154797] = {
					["source"] = "Demobabe-Stormrage",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[84963] = {
					["source"] = "Pigeonwat-Alleria",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[255836] = {
					["type"] = "DEBUFF",
					["source"] = "Priestess Alun'za",
					["npcID"] = 122967,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2084,
				},
				[315161] = {
					["source"] = "Cbegswar-BleedingHollow",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[152108] = {
					["source"] = "Rotrin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[22888] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[210294] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sathaendor",
					["npcID"] = 0,
				},
				[280746] = {
					["source"] = "Stridle-BurningLegion",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[118922] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fanatixxh-BleedingHollow",
					["npcID"] = 0,
				},
				[258908] = {
					["source"] = "Sethrak Invader",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 130411,
				},
				[198121] = {
					["source"] = "Verthel",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[217200] = {
					["source"] = "Quickranger-Bloodhoof",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5782] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Darksouls-TheUnderbog",
					["npcID"] = 0,
				},
				[210065] = {
					["source"] = "Xhapes-Icecrown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[199545] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thalron",
					["npcID"] = 0,
				},
				[180612] = {
					["type"] = "BUFF",
					["source"] = "Ikalo-Zul'jin",
					["encounterID"] = 2111,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[253279] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dazar'ai Juggernaut",
					["npcID"] = 122971,
				},
				[255582] = {
					["npcID"] = 0,
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2084,
				},
				[1680] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dahreon-Stormreaver",
					["npcID"] = 0,
				},
				[317595] = {
					["source"] = "Watcher Aum-ka",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 154619,
				},
				[256350] = {
					["source"] = "Thornspine Saurolisk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 127758,
				},
				[258653] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Reanimated Honor Guard",
					["npcID"] = 127757,
				},
				[288426] = {
					["source"] = "Ikalo-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297126] = {
					["source"] = "Cbegswar-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[55164] = {
					["source"] = "Urukaim-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[19434] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Arentar-Dalaran",
					["npcID"] = 0,
				},
				[2948] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Gwenevare-WyrmrestAccord",
					["npcID"] = 0,
				},
				[61295] = {
					["source"] = "Wurrzaag-Gilneas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[316062] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Corrupted Putrefaction",
					["npcID"] = 158706,
				},
				[314527] = {
					["source"] = "Vuk'laz the Earthbreaker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 160970,
				},
				[115078] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dionysús-Malfurion",
					["npcID"] = 0,
				},
				[138649] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Demonic Gateway",
					["npcID"] = 70028,
				},
				[29893] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hungryorphan-Frostmourne",
					["npcID"] = 0,
				},
				[108271] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dacorr-ShatteredHand",
					["npcID"] = 0,
				},
				[190336] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Gwenevare-WyrmrestAccord",
					["npcID"] = 0,
				},
				[264314] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Brutalize-Cho'gall",
					["npcID"] = 0,
				},
				[768] = {
					["source"] = "Novae",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[278297] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ragecow",
					["npcID"] = 0,
				},
				[294571] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 151905,
				},
				[199804] = {
					["source"] = "Wantêd-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[198013] = {
					["source"] = "Yungs-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[196414] = {
					["source"] = "Rotrin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[188290] = {
					["source"] = "Ikalo-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[79976] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 50012,
				},
				[81256] = {
					["source"] = "Ikalo-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[52174] = {
					["source"] = "Battlebull-Madoran",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[300761] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Darksouls-TheUnderbog",
					["npcID"] = 0,
				},
				[119381] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hecatè-Malfurion",
					["npcID"] = 0,
				},
				[264892] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Brother Meller",
					["npcID"] = 154447,
				},
				[279572] = {
					["type"] = "BUFF",
					["source"] = "Celaste-LaughingSkull",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[294966] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tàlrin-BleedingHollow",
					["npcID"] = 0,
				},
				[278755] = {
					["source"] = "Befouled Spirit",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 133685,
				},
				[85222] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sathaendor",
					["npcID"] = 0,
				},
				[32612] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sindrablowsa-Kel'Thuzad",
					["npcID"] = 0,
				},
				[254958] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 122984,
				},
				[256099] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Blood Witch Najima",
					["npcID"] = 122204,
				},
				[35079] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Aerospac-Illidan",
					["npcID"] = 0,
				},
				[157331] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Primal Storm Elemental",
					["npcID"] = 77942,
				},
				[79849] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Gija",
					["npcID"] = 47248,
				},
				[233582] = {
					["source"] = "Rotrin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[256355] = {
					["source"] = "Thornspine Saurolisk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 127758,
				},
				[57724] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Shampóò-Illidan",
					["npcID"] = 0,
				},
				[195457] = {
					["source"] = "Hellions-BurningLegion",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[304612] = {
					["source"] = "Rÿlañ-Zul'jin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[204157] = {
					["source"] = "Traplifé-Azralon",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[61882] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dacorr-ShatteredHand",
					["npcID"] = 0,
				},
				[126] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[12472] = {
					["type"] = "BUFF",
					["source"] = "Sindrablowsa-Kel'Thuzad",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[277179] = {
					["source"] = "Christmasnub-Tichondrius",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[271550] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Studdnmuffin",
					["npcID"] = 0,
				},
				[154953] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Flawlyss-Arthas",
					["npcID"] = 0,
				},
				[304606] = {
					["source"] = "Rÿlañ-Zul'jin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[6262] = {
					["source"] = "Rotrin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[186265] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Aerospac-Illidan",
					["npcID"] = 0,
				},
				[207230] = {
					["source"] = "Déjà-Aegwynn",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[303731] = {
					["source"] = "Ghostlyhero-ScarletCrusade",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[277181] = {
					["source"] = "Holehunter",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[304851] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[302769] = {
					["source"] = "Déjà-Aegwynn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1856] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Quickkick-Zul'jin",
					["npcID"] = 0,
				},
				[185736] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Schifoso",
					["npcID"] = 0,
				},
				[289976] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Honorbound Grunt",
					["npcID"] = 154749,
				},
				[259750] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Stormbound Conqueror",
					["npcID"] = 136555,
				},
				[65081] = {
					["source"] = "Ordinarymman-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[199042] = {
					["source"] = "Melvinmoose-Zul'jin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[116705] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dionysús-Malfurion",
					["npcID"] = 0,
				},
				[195182] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ertex-Sargeras",
					["npcID"] = 0,
				},
				[298197] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ironmade-Thrall",
					["npcID"] = 0,
				},
				[122278] = {
					["source"] = "Takuetsukaze-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[255591] = {
					["npcID"] = 122967,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Priestess Alun'za",
					["encounterID"] = 2084,
				},
				[277186] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 136550,
				},
				[23881] = {
					["source"] = "Doinkster-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[277185] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kelbae",
					["npcID"] = 0,
				},
				[268956] = {
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1106,
				},
				[306873] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Rijz'x the Devourer",
					["npcID"] = 154490,
				},
				[257127] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Civsis",
					["npcID"] = 0,
				},
				[268998] = {
					["source"] = "Brionac-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[115546] = {
					["source"] = "Fairin-Akama",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[264420] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Alibast-Thunderhorn",
					["npcID"] = 0,
				},
				[196741] = {
					["source"] = "Assoka-Drakkari",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[271046] = {
					["source"] = "Saltspine Krolusk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 124016,
				},
				[124503] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dionysús-Malfurion",
					["npcID"] = 0,
				},
				[207744] = {
					["source"] = "Traplifé-Azralon",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[131894] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Arentar-Dalaran",
					["npcID"] = 0,
				},
				[32645] = {
					["source"] = "Lunareste",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[69489] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Labbao",
					["npcID"] = 0,
				},
				[198533] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 60849,
				},
				[196742] = {
					["source"] = "Assoka-Drakkari",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[221562] = {
					["source"] = "Ikalo-Zul'jin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[269513] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Flawlyss-Arthas",
					["npcID"] = 0,
				},
				[258920] = {
					["source"] = "Taldreil-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280772] = {
					["source"] = "Doinkster-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[84714] = {
					["source"] = "Ronfreezly-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[255852] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Snowdrift Prowler",
					["npcID"] = 136690,
				},
				[185763] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Otters-Eonar",
					["npcID"] = 0,
				},
				[280773] = {
					["source"] = "Doinkster-Mal'Ganis",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[277724] = {
					["source"] = "Kaedash-Khaz'goroth",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[277703] = {
					["type"] = "DEBUFF",
					["source"] = "Gwenevare-WyrmrestAccord",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[313014] = {
					["source"] = "Suntouched Falcon",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 151811,
				},
				[315573] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ironmade-Thrall",
					["npcID"] = 0,
				},
				[277192] = {
					["source"] = "Skithis the Infused",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 136732,
				},
				[300893] = {
					["source"] = "Yungs-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[313017] = {
					["source"] = "Solar Orb",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 160803,
				},
				[280780] = {
					["source"] = "Quickranger-Bloodhoof",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[285381] = {
					["source"] = "Freida-AeriePeak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[201350] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Quappiedh",
					["npcID"] = 0,
				},
				[252781] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Zanchuli Witch-Doctor",
					["npcID"] = 122969,
				},
				[280776] = {
					["source"] = "Cbegswar-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288455] = {
					["source"] = "Urukaim-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[277706] = {
					["source"] = "Rotrin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[186254] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fayia-Arthas",
					["npcID"] = 0,
				},
				[256108] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Blood Bonepicker",
					["npcID"] = 122636,
				},
				[70771] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xndrya",
					["npcID"] = 0,
				},
				[288981] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zaràki",
					["npcID"] = 0,
				},
				[294595] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[300751] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Highcharity",
					["npcID"] = 0,
				},
				[85739] = {
					["source"] = "Doinkster-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[271581] = {
					["source"] = "Frogy-Agamaggan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[208772] = {
					["source"] = "Heartbeatz-Tichondrius",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[198793] = {
					["source"] = "Óle",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[137639] = {
					["source"] = "Assoka-Drakkari",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[3408] = {
					["source"] = "Nüll-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[224125] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 100820,
				},
				[272592] = {
					["source"] = "Faceless Corruptor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 138281,
				},
				[278736] = {
					["source"] = "Eleious-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[258925] = {
					["source"] = "Ilgynoth-Tanaris",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298703] = {
					["source"] = "Braelight-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[48707] = {
					["source"] = "Ikalo-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[277199] = {
					["source"] = "Skithis the Infused",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 136732,
				},
				[81262] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 47649,
				},
				[224126] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 100820,
				},
				[303299] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tidemistress Ethendriss",
					["npcID"] = 153934,
				},
				[186258] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Taleon",
					["npcID"] = 0,
				},
				[186257] = {
					["type"] = "BUFF",
					["source"] = "Vverr-Illidan",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[96231] = {
					["source"] = "Pigeonwat-Alleria",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[256111] = {
					["source"] = "Faithless Centurion",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 129774,
				},
				[200587] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Darksouls-TheUnderbog",
					["npcID"] = 0,
				},
				[205448] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Celaste-LaughingSkull",
					["encounterID"] = 2086,
				},
				[297162] = {
					["source"] = "Cbegswar-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[303301] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Azsh'ari Siegemistress",
					["npcID"] = 150508,
				},
				[275672] = {
					["source"] = "Doinkster-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[49028] = {
					["source"] = "Ikalo-Zul'jin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[51714] = {
					["type"] = "DEBUFF",
					["source"] = "Ahriak",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1106,
				},
				[133806] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[313030] = {
					["source"] = "Suntouched Acolyte",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 151960,
				},
				[225919] = {
					["source"] = "Traplifé-Azralon",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[242551] = {
					["source"] = "Nitrotaco-Sargeras",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[124506] = {
					["source"] = "Fairin-Akama",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[225921] = {
					["source"] = "Traplifé-Azralon",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[226943] = {
					["type"] = "DEBUFF",
					["source"] = "Celaste-LaughingSkull",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[265946] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Flawlyss-Arthas",
					["npcID"] = 0,
				},
				[202636] = {
					["source"] = "Helltaurus",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275158] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Zujothgul",
					["npcID"] = 128578,
				},
				[80240] = {
					["source"] = "Rotrin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[290512] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Sädä-Malfurion",
					["npcID"] = 0,
				},
				[255858] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Starving Darkmaw",
					["npcID"] = 137461,
				},
				[288803] = {
					["type"] = "BUFF",
					["source"] = "Gwenevare-WyrmrestAccord",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[68981] = {
					["type"] = "BUFF",
					["source"] = "The Lich King",
					["npcID"] = 36597,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1106,
				},
				[298700] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thepots-Illidan",
					["npcID"] = 0,
				},
				[44614] = {
					["source"] = "Verthel",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[24394] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Spirit Beast",
					["npcID"] = 110340,
				},
				[36554] = {
					["source"] = "Lunareste",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272090] = {
					["source"] = "Fhaykum",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[191634] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dacorr-ShatteredHand",
					["npcID"] = 0,
				},
				[281302] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Donisaur-BleedingHollow",
					["npcID"] = 0,
				},
				[55233] = {
					["source"] = "Ikalo-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[296138] = {
					["source"] = "Faelenus",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[8219] = {
					["source"] = "Flüsh",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[228477] = {
					["source"] = "Traplifé-Azralon",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[3600] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Earthbind Totem",
					["npcID"] = 2630,
				},
				[205708] = {
					["source"] = "Rynosia-Thrall",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297168] = {
					["source"] = "Cbegswar-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[197003] = {
					["source"] = "Rumbawls-LaughingSkull",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[157348] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Primal Storm Elemental",
					["npcID"] = 77942,
				},
				[190356] = {
					["source"] = "Ronfreezly-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[70774] = {
					["source"] = "Partridge",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[130265] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thunder Hold Soldier",
					["npcID"] = 66291,
				},
				[5215] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jnxius-Skywall",
					["npcID"] = 0,
				},
				[115804] = {
					["source"] = "Urukaim-Mal'Ganis",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[259187] = {
					["npcID"] = 122968,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Yazma",
					["encounterID"] = 2087,
				},
				[271071] = {
					["source"] = "Saiyori",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[312523] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Living Infestation",
					["npcID"] = 153906,
				},
				[186263] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Celaste-LaughingSkull",
					["npcID"] = 0,
				},
				[147362] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Aerospac-Illidan",
					["npcID"] = 0,
				},
				[112866] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hungryorphan-Frostmourne",
					["npcID"] = 0,
				},
				[265931] = {
					["type"] = "DEBUFF",
					["source"] = "Skof-Aegwynn",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[260455] = {
					["encounterID"] = 2118,
					["source"] = "Unknown",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 132051,
				},
				[56641] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Arentar-Dalaran",
					["npcID"] = 0,
				},
				[302775] = {
					["source"] = "Brionac-Arthas",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[138927] = {
					["source"] = "Arabella-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[87023] = {
					["type"] = "DEBUFF",
					["source"] = "Gwenevare-WyrmrestAccord",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[272609] = {
					["source"] = "Faceless Corruptor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 138281,
				},
				[130266] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thunder Hold Soldier",
					["npcID"] = 66200,
				},
				[312526] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Drowned Zealot",
					["npcID"] = 153956,
				},
				[280286] = {
					["source"] = "Verthel",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[131493] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Marinajoyce-Zul'jin",
					["npcID"] = 0,
				},
				[31687] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sindrablowsa-Kel'Thuzad",
					["npcID"] = 0,
				},
				[185562] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thunderclaw",
					["npcID"] = 0,
				},
				[298710] = {
					["source"] = "Toofâst",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298151] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lukassi-Illidan",
					["npcID"] = 0,
				},
				[286393] = {
					["source"] = "Frogy-Agamaggan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[3716] = {
					["source"] = "Klathtaz",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 1860,
				},
				[51460] = {
					["source"] = "Esov-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288988] = {
					["source"] = "Wantêd-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[271077] = {
					["source"] = "Brine Beetle",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 124019,
				},
				[152173] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hecatè-Malfurion",
					["npcID"] = 0,
				},
				[87024] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Kyerk-Thrall",
					["npcID"] = 0,
				},
				[121557] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kezma",
					["npcID"] = 0,
				},
				[156073] = {
					["source"] = "Zhubin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[277731] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Flawlyss-Arthas",
					["npcID"] = 0,
				},
				[287916] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Skyflux",
					["npcID"] = 0,
				},
				[5487] = {
					["source"] = "Cleansekin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[69369] = {
					["source"] = "Freida-AeriePeak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[253562] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dazar'ai Augur",
					["npcID"] = 122972,
				},
				[139186] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Jubeka Shadowbreaker",
					["npcID"] = 70166,
				},
				[190446] = {
					["source"] = "Verthel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[211793] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Gommerr",
					["npcID"] = 0,
				},
				[30213] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Zilikferil",
					["npcID"] = 17252,
				},
				[300762] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Scyne-Mal'Ganis",
					["npcID"] = 0,
				},
				[270371] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bilgewater Incinerator",
					["npcID"] = 135541,
				},
				[210320] = {
					["source"] = "Jáydee",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[270515] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Azerite-Infused Elemental",
					["npcID"] = 137905,
				},
				[270058] = {
					["source"] = "Cuetip-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[119905] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hungryorphan-Frostmourne",
					["npcID"] = 0,
				},
				[57723] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Dragoul-Illidan",
					["npcID"] = 0,
				},
				[219788] = {
					["source"] = "Ikalo-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[188031] = {
					["source"] = "Alexzánder",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[154796] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wraithion-AltarofStorms",
					["npcID"] = 0,
				},
				[132627] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Nootau-Deathwing",
					["npcID"] = 0,
				},
				[275689] = {
					["source"] = "Doinkster-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[6673] = {
					["source"] = "Dôbbyy-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[79206] = {
					["source"] = "Fhaykum",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[112869] = {
					["source"] = "Megadoodoo-Tichondrius",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[163201] = {
					["source"] = "Urukaim-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[278249] = {
					["type"] = "BUFF",
					["source"] = "Aerospac-Illidan",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[295137] = {
					["source"] = "Rezaria-BurningLegion",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[269038] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[312537] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tidal Corruptor",
					["npcID"] = 153910,
				},
				[290467] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mômô-Arthas",
					["npcID"] = 0,
				},
				[278379] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thalron",
					["npcID"] = 0,
				},
				[81141] = {
					["source"] = "Ikalo-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[49862] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Achilios",
					["npcID"] = 0,
				},
				[276204] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thalron",
					["npcID"] = 0,
				},
				[268528] = {
					["source"] = "Frogy-Agamaggan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[274598] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Gwenevare-WyrmrestAccord",
					["npcID"] = 0,
				},
				[294116] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[7814] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sarora",
					["npcID"] = 1863,
				},
				[270576] = {
					["type"] = "BUFF",
					["source"] = "Vverr-Illidan",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[227723] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zarinisa-Stormreaver",
					["npcID"] = 0,
				},
				[138130] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 69792,
				},
				[276206] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thalron",
					["npcID"] = 0,
				},
				[264760] = {
					["source"] = "Novae",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[131222] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tezlah-Sargeras",
					["npcID"] = 0,
				},
				[7870] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sarora",
					["npcID"] = 1863,
				},
				[276207] = {
					["type"] = "BUFF",
					["source"] = "Thalron",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[31747] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Marauding Crust Burster",
					["npcID"] = 16857,
				},
				[250241] = {
					["type"] = "BUFF",
					["source"] = "Vol'kaal",
					["npcID"] = 122965,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2085,
				},
				[116858] = {
					["source"] = "Rotrin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[276208] = {
					["type"] = "BUFF",
					["source"] = "Thalron",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[268532] = {
					["source"] = "Frogy-Agamaggan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[138680] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[301693] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[276209] = {
					["type"] = "BUFF",
					["source"] = "Thalron",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[303332] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rijz'x the Devourer",
					["npcID"] = 154490,
				},
				[281240] = {
					["source"] = "Aesse",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2580] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dragoul-Illidan",
					["npcID"] = 0,
				},
				[276210] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thalron",
					["npcID"] = 0,
				},
				[25771] = {
					["source"] = "Frogy-Agamaggan",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257407] = {
					["npcID"] = 122963,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rezan",
					["encounterID"] = 2086,
				},
				[275699] = {
					["source"] = "Puppetchill-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[270070] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Flawlyss-Arthas",
					["npcID"] = 0,
				},
				[316036] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[312964] = {
					["source"] = "Suntouched Acolyte",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 151960,
				},
				[260734] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dacorr-ShatteredHand",
					["npcID"] = 0,
				},
				[41187] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ashtongue Primalist",
					["npcID"] = 68096,
				},
				[192106] = {
					["source"] = "Shakal-Andorhal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[259455] = {
					["source"] = "Alesso",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268955] = {
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1106,
				},
				[12042] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Eldra",
					["npcID"] = 0,
				},
				[313571] = {
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1106,
				},
				[202346] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Dionysús-Malfurion",
					["npcID"] = 0,
				},
				[281843] = {
					["source"] = "Ilgynoth-Tanaris",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[195181] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ertex-Sargeras",
					["npcID"] = 0,
				},
				[299243] = {
					["source"] = "Shith'rus the Manipulator",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 154727,
				},
				[259456] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Divination-Mal'Ganis",
					["npcID"] = 0,
				},
				[281844] = {
					["source"] = "Ilgynoth-Tanaris",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1022] = {
					["source"] = "Frogy-Agamaggan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[139142] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kanrethad Ebonlocke",
					["npcID"] = 69964,
				},
				[153561] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Valatuu-Wildhammer",
					["npcID"] = 0,
				},
				[270330] = {
					["source"] = "Azerite Chunk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 136722,
				},
				[258945] = {
					["source"] = "Faithless Champion",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 135292,
				},
				[61684] = {
					["type"] = "BUFF",
					["source"] = "johnny",
					["npcID"] = 124527,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[257410] = {
					["source"] = "Nüll-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[34767] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sathaendor",
					["npcID"] = 0,
				},
				[79865] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Marud",
					["npcID"] = 47247,
				},
				[51271] = {
					["source"] = "Déjà-Aegwynn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[289523] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bratàc",
					["npcID"] = 0,
				},
				[51399] = {
					["source"] = "Ikalo-Zul'jin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257099] = {
					["source"] = "Siperkasa-Arthas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[246152] = {
					["source"] = "Quickranger-Bloodhoof",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[289524] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bratàc",
					["npcID"] = 0,
				},
				[255620] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Reanimated Honor Guard",
					["npcID"] = 127757,
				},
				[117952] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dionysús-Malfurion",
					["npcID"] = 0,
				},
				[119910] = {
					["encounterID"] = 2111,
					["source"] = "Megadoodoo-Tichondrius",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[164273] = {
					["source"] = "Picon-Whisperwind",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[49864] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Achilios",
					["npcID"] = 0,
				},
				[272126] = {
					["source"] = "Jáydee",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[85256] = {
					["source"] = "Frogy-Agamaggan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[298606] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Toter-Bloodhoof",
					["npcID"] = 0,
				},
				[83242] = {
					["source"] = "Whípple-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[102383] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ttvtettles-Zul'jin",
					["npcID"] = 0,
				},
				[303344] = {
					["source"] = "Puppetchill-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[188838] = {
					["source"] = "Karlurn-BleedingHollow",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[294133] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Eanja",
					["npcID"] = 0,
				},
				[102351] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zdune",
					["npcID"] = 0,
				},
				[303345] = {
					["source"] = "Holylolring-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[260364] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[45242] = {
					["source"] = "Jazlah-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[6343] = {
					["source"] = "Melvinmoose-Zul'jin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[305395] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Silverstrk-Mal'Ganis",
					["npcID"] = 0,
				},
				[1079] = {
					["source"] = "Freida-AeriePeak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[269571] = {
					["source"] = "Flamejob-Kel'Thuzad",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273349] = {
					["source"] = "Freida-AeriePeak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[17] = {
					["source"] = "Jazlah-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[271107] = {
					["source"] = "Lunareste",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[245388] = {
					["source"] = "Lunareste",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[139200] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[116841] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sunwukhong-Thrall",
					["npcID"] = 0,
				},
				[134615] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[302943] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Zanj'ir Trapper",
					["npcID"] = 153962,
				},
				[192082] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wind Rush Totem",
					["npcID"] = 97285,
				},
				[278874] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[257415] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zexnero-Dalaran",
					["npcID"] = 0,
				},
				[245389] = {
					["source"] = "Lunareste",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288509] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bvd",
					["npcID"] = 0,
				},
				[270598] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 129305,
				},
				[213405] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Zahmerdh",
					["npcID"] = 0,
				},
				[205473] = {
					["source"] = "Rynosia-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[278559] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[134340] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[278637] = {
					["source"] = "Underrot Tick",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 131402,
				},
				[269576] = {
					["type"] = "BUFF",
					["source"] = "Vverr-Illidan",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[274447] = {
					["type"] = "BUFF",
					["source"] = "Vverr-Illidan",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[295521] = {
					["source"] = "Statue",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 151603,
				},
				[316744] = {
					["source"] = "Jáydee",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[212048] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[278931] = {
					["type"] = "BUFF",
					["source"] = "Hungryorphan-Frostmourne",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[257161] = {
					["source"] = "Faithless Stalker",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 129647,
				},
				[294232] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297989] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Blindfish",
					["npcID"] = 0,
				},
				[115192] = {
					["source"] = "Lunareste",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[256138] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dazar'ai Honor Guard",
					["npcID"] = 127799,
				},
				[279302] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ahriak",
					["encounterID"] = 1106,
				},
				[111400] = {
					["source"] = "Rotrin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[207778] = {
					["source"] = "Fhaykum",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[301308] = {
					["source"] = "Brionac-Arthas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[257418] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Adrewyn-Dalaran",
					["npcID"] = 0,
				},
				[301404] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 150196,
				},
				[269085] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[116] = {
					["source"] = "Rynosia-Thrall",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[63619] = {
					["npcID"] = 19668,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Shadowfiend",
					["encounterID"] = 2086,
				},
				[260843] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jahden Fla",
					["npcID"] = 122704,
				},
				[113858] = {
					["source"] = "Rotrin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[115308] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dionysús-Malfurion",
					["npcID"] = 0,
				},
				[255372] = {
					["npcID"] = 122963,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rezan",
					["encounterID"] = 2086,
				},
				[261769] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sädä-Malfurion",
					["npcID"] = 0,
				},
				[313081] = {
					["source"] = "Amathet Lightblade",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 151806,
				},
				[288613] = {
					["type"] = "BUFF",
					["source"] = "Vverr-Illidan",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[49821] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Celaste-LaughingSkull",
					["encounterID"] = 2086,
				},
				[285959] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dionysús-Malfurion",
					["npcID"] = 0,
				},
				[1822] = {
					["source"] = "Freida-AeriePeak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[301312] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Minuét-Quel'Thalas",
					["npcID"] = 0,
				},
				[255373] = {
					["npcID"] = 122963,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rezan",
					["encounterID"] = 2086,
				},
				[314618] = {
					["source"] = "Vuk'laz the Earthbreaker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 160970,
				},
				[300801] = {
					["source"] = "Quickranger-Bloodhoof",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272987] = {
					["source"] = "Haleios-Sargeras",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[90361] = {
					["npcID"] = 110340,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Spirit Beast",
					["encounterID"] = 2086,
				},
				[32752] = {
					["source"] = "Rotrin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[115181] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dionysús-Malfurion",
					["npcID"] = 0,
				},
				[280661] = {
					["source"] = "Absorb-o-Tron",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 143985,
				},
				[114052] = {
					["type"] = "BUFF",
					["source"] = "Fhaykum",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2085,
				},
				[253583] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dazar'ai Augur",
					["npcID"] = 122972,
				},
				[313085] = {
					["source"] = "Amathet Lightblade",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 151806,
				},
				[31884] = {
					["source"] = "Krystynna-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[312677] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Tidal Corruptor",
					["npcID"] = 153910,
				},
				[277072] = {
					["type"] = "DEBUFF",
					["source"] = "Corrupted Gold",
					["npcID"] = 130738,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2084,
				},
				[183218] = {
					["source"] = "Flamejob-Kel'Thuzad",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[46924] = {
					["source"] = "Cbegswar-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257422] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Yalemannec-Illidan",
					["npcID"] = 0,
				},
				[193356] = {
					["source"] = "Wantêd-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275523] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Infused Bedrock",
					["npcID"] = 136614,
				},
				[199721] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Outbreak-Alleria",
					["npcID"] = 0,
				},
				[250258] = {
					["npcID"] = 122965,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Vol'kaal",
					["encounterID"] = 2085,
				},
				[269589] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[256911] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Frightened Brutosaur",
					["npcID"] = 129668,
				},
				[112042] = {
					["source"] = "Klathtaz",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 1860,
				},
				[299783] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 151309,
				},
				[281954] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Aced-Mal'Ganis",
					["npcID"] = 0,
				},
				[20473] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sathaendor",
					["npcID"] = 0,
				},
				[8212] = {
					["source"] = "Lyfelessjr-Dalaran",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[250259] = {
					["npcID"] = 122965,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Vol'kaal",
					["encounterID"] = 2085,
				},
				[130345] = {
					["source"] = "Wojö",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298761] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[262589] = {
					["source"] = "Bloodswarmer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 138727,
				},
				[257424] = {
					["source"] = "Jimboslicé-AeriePeak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[194223] = {
					["source"] = "Define-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[300809] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Chanuka-Zul'jin",
					["npcID"] = 0,
				},
				[196782] = {
					["source"] = "Esov-Illidan",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[287504] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sädä-Malfurion",
					["npcID"] = 0,
				},
				[19577] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Aerospac-Illidan",
					["npcID"] = 0,
				},
				[193456] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Glidesaway-Illidan",
					["npcID"] = 0,
				},
				[255931] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Blood Bonepicker",
					["npcID"] = 122636,
				},
				[298836] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lilìth-Zul'jin",
					["npcID"] = 0,
				},
				[260057] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Priest of Gonk",
					["npcID"] = 131809,
				},
				[232698] = {
					["source"] = "Nifx-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[303943] = {
					["source"] = "Lazerbeamzz-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[318211] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dacorr-ShatteredHand",
					["npcID"] = 0,
				},
				[77130] = {
					["source"] = "Fhaykum",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[290577] = {
					["source"] = "Abomination",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 149555,
				},
				[199854] = {
					["source"] = "Urukaim-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[26573] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ironmade-Thrall",
					["npcID"] = 0,
				},
				[292113] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[2565] = {
					["source"] = "Melvinmoose-Zul'jin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[116847] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dionysús-Malfurion",
					["npcID"] = 0,
				},
				[256403] = {
					["source"] = "Bonebeak Vulture",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 136664,
				},
				[314631] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kirayne",
					["npcID"] = 0,
				},
				[300814] = {
					["type"] = "BUFF",
					["source"] = "Thalron",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[22703] = {
					["source"] = "Rotrin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[276025] = {
					["source"] = "Saladin-Bonechewer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[264757] = {
					["encounterID"] = 2111,
					["source"] = "Elder Leaxa",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 131318,
				},
				[51723] = {
					["source"] = "Dristwo-Ravencrest",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[260242] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Arentar-Dalaran",
					["npcID"] = 0,
				},
				[314121] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Oozing Corruption",
					["npcID"] = 156457,
				},
				[164545] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Assailermoon-Mal'Ganis",
					["npcID"] = 0,
				},
				[199600] = {
					["source"] = "Sauzey",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[269879] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bloodbough Funggarian",
					["npcID"] = 135901,
				},
				[198065] = {
					["source"] = "Verthel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[285976] = {
					["source"] = "Primordial-Llane",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298025] = {
					["source"] = "Shith'rus the Manipulator",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 154727,
				},
				[190784] = {
					["source"] = "Bløodshot-BleedingHollow",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[58504] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ordo Overseer",
					["npcID"] = 59580,
				},
				[248473] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rpb",
					["npcID"] = 0,
				},
				[2645] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Amaiko",
					["npcID"] = 0,
				},
				[2649] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lexa",
					["npcID"] = 32517,
				},
				[205766] = {
					["source"] = "Verthel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[285978] = {
					["source"] = "Smallgai-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[43308] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Shampóò-Illidan",
					["npcID"] = 0,
				},
				[303378] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Meaven-Zul'jin",
					["npcID"] = 0,
				},
				[318219] = {
					["source"] = "Bacata-Dalaran",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[285979] = {
					["source"] = "Eleious-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[228260] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Celaste-LaughingSkull",
					["encounterID"] = 2086,
				},
				[195072] = {
					["source"] = "Adamdh-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[275243] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Erupting Servant",
					["npcID"] = 140637,
				},
				[266209] = {
					["source"] = "Fallen Deathspeaker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 134284,
				},
				[223143] = {
					["source"] = "Alesso",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[303380] = {
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1106,
				},
				[231843] = {
					["source"] = "Sunspot-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267558] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Baneoflegion",
					["npcID"] = 0,
				},
				[199603] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Otters-Eonar",
					["npcID"] = 0,
				},
				[317363] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[204262] = {
					["source"] = "Lërne-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[41425] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Evilinferno-Aggramar",
					["npcID"] = 0,
				},
				[262652] = {
					["source"] = "Crosshorn-Tichondrius",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[305011] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tidemistress Ethendriss",
					["npcID"] = 153934,
				},
				[194249] = {
					["type"] = "BUFF",
					["source"] = "Celaste-LaughingSkull",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[267560] = {
					["source"] = "Jazlah-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[274213] = {
					["encounterID"] = 2112,
					["source"] = "Sporecaller Zancha",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 131383,
				},
				[269838] = {
					["encounterID"] = 2123,
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[285472] = {
					["source"] = "Krystynna-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[317420] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dragoul-Illidan",
					["npcID"] = 0,
				},
				[224721] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Spiritwalker Ebonhorn",
					["npcID"] = 152385,
				},
				[274726] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[256409] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Zandalari Leguaan",
					["npcID"] = 129554,
				},
				[262115] = {
					["source"] = "Urukaim-Mal'Ganis",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[219589] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kelbae",
					["npcID"] = 0,
				},
				[115315] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dionysús-Malfurion",
					["npcID"] = 0,
				},
				[348] = {
					["source"] = "Rotrin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[253595] = {
					["source"] = "Corcki-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[278310] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hoodròw-Zul'jin",
					["npcID"] = 0,
				},
				[252388] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kharl",
					["npcID"] = 0,
				},
				[318227] = {
					["source"] = "Lunareste",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[70576] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Achilios",
					["npcID"] = 0,
				},
				[288546] = {
					["source"] = "Magus of the Dead",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 148797,
				},
				[314729] = {
					["source"] = "Aqir Scarab",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 161541,
				},
				[293664] = {
					["source"] = "Urvi-Stormreaver",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257541] = {
					["source"] = "Shroudfatcok-AeriePeak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[257946] = {
					["source"] = "Quickranger-Bloodhoof",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2825] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Conictotems-Zul'jin",
					["npcID"] = 0,
				},
				[314135] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Mind Worm",
					["npcID"] = 156455,
				},
				[192225] = {
					["source"] = "Qyzen-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5672] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 3527,
				},
				[51533] = {
					["source"] = "Mjiollnir-BleedingHollow",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[187837] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Takkaga",
					["npcID"] = 0,
				},
				[247456] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Byefelycia",
					["npcID"] = 0,
				},
				[157644] = {
					["type"] = "BUFF",
					["source"] = "Gwenevare-WyrmrestAccord",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2086,
				},
				[278826] = {
					["source"] = "Urukaim-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[57994] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dacorr-ShatteredHand",
					["npcID"] = 0,
				},
				[207400] = {
					["source"] = "Karlurn-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[276268] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Faceless Conqueror",
					["npcID"] = 153903,
				},
				[49998] = {
					["source"] = "Esov-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[108280] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[257692] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[213243] = {
					["source"] = "Kimsohyun-Azralon",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[83244] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Aerospac-Illidan",
					["npcID"] = 0,
				},
				[265568] = {
					["source"] = "Befouled Spirit",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 133685,
				},
				[279526] = {
					["source"] = "Freida-AeriePeak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[94719] = {
					["source"] = "Razkal-ShatteredHand",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[21169] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fhaykum",
					["encounterID"] = 2086,
				},
				[285482] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dacorr-ShatteredHand",
					["npcID"] = 0,
				},
				[167898] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thepots-Illidan",
					["npcID"] = 0,
				},
				[1459] = {
					["source"] = "Pyrolunatic",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[207317] = {
					["source"] = "Clapedcheeks-Rivendare",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[273323] = {
					["source"] = "Mjiollnir-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[234153] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[187874] = {
					["source"] = "Mjiollnir-BleedingHollow",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[13787] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 19411,
				},
				[70580] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Achilios",
					["npcID"] = 0,
				},
				[273714] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Studdnmuffin",
					["npcID"] = 0,
				},
				[162530] = {
					["source"] = "Saladin-Bonechewer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[63560] = {
					["source"] = "Clapedcheeks-Rivendare",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[370] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dacorr-ShatteredHand",
					["npcID"] = 0,
				},
				[196834] = {
					["source"] = "Mjiollnir-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[164812] = {
					["source"] = "Define-Mal'Ganis",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[274739] = {
					["source"] = "Thailos-Chromaggus",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[265016] = {
					["source"] = "Chosen Blood Matron",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 131436,
				},
				[316703] = {
					["source"] = "Tutonka-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[185565] = {
					["source"] = "Thailos-Chromaggus",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[204021] = {
					["source"] = "Traplifé-Azralon",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[184362] = {
					["source"] = "Doinkster-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[124274] = {
					["source"] = "Fairin-Akama",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275909] = {
					["source"] = "Xhapes-Icecrown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[315681] = {
					["source"] = "Flexheal-Zul'jin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[232893] = {
					["source"] = "Kimsohyun-Azralon",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[275765] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[198589] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Zahmerdh",
					["npcID"] = 0,
				},
				[299306] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sorein-Stormrage",
					["npcID"] = 0,
				},
				[33943] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hordepeke",
					["npcID"] = 0,
				},
				[314659] = {
					["source"] = "Vuk'laz the Earthbreaker",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 160970,
				},
				[115191] = {
					["source"] = "Lunareste",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268602] = {
					["source"] = "Zarthell-Arygos",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272349] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Infused Crag",
					["npcID"] = 136613,
				},
				[279029] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dacorr-ShatteredHand",
					["npcID"] = 0,
				},
				[113656] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sädä-Malfurion",
					["npcID"] = 0,
				},
				[54861] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Shimmersion-Destromath",
					["npcID"] = 0,
				},
				[304482] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Solidshaft-Zul'jin",
					["npcID"] = 0,
				},
				[124275] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Dionysús-Malfurion",
					["npcID"] = 0,
				},
				[272721] = {
					["source"] = "Déjà-Aegwynn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
			},
		},
		["MyNewProfile"] = {
			["script_data"] = {
				{
					["Enabled"] = true,
					["Revision"] = 156,
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Hide()\n    \n    --restore the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)    \n    \nend\n\n\n",
					["NpcNames"] = {
						"135029", -- [1]
						"134388", -- [2]
						"134612", -- [3]
						"133361", -- [4]
						"136330", -- [5]
						"130896", -- [6]
						"129758", -- [7]
						"Healing Tide Totem", -- [8]
						"131009", -- [9]
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Highlight a nameplate of an important Add. Add the unit name or NpcID into the trigger box to add more.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \nend\n\n\n",
					["SpellIds"] = {
					},
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can change the nameplate color\n    if (envTable.CanChangeNameplateColor) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n",
					["Time"] = 1537884697,
					["PlaterCore"] = 1,
					["Name"] = "Unit - Important [Plater]",
					["ScriptType"] = 3,
					["Icon"] = 135996,
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)    \n    --change the nameplate color to this if allowed\n    envTable.CanChangeNameplateColor = false --change to true to change the color\n    envTable.NameplateColor = \"pink\"\n    envTable.NameplateSizeOffset = 6 --increase the nameplate height by this value\n    envTable.GlowAlpha = 0.5 --amount of alpha in the outside glow effect\n    \n    --create a glow effect around the nameplate\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (unitFrame.healthBar, envTable.NameplateColor)\n    envTable.glowEffect:SetOffset (-27, 25, 9, -11)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() --\n    \n    --set the glow effect alpha\n    envTable.glowEffect:SetAlpha (envTable.GlowAlpha)\n    \nend\n\n--[=[\nUsing spellIDs for multi-language support\n\n135029 - A Knot of Snakes (Temple of Sethraliss)\n135388 - A Knot of Snakes (Temple of Sethraliss)\n134612 - Grasping Tentacles (Shrine of the Storm)\n133361 - Wasting Servant (Waycrest Manor)\n136330 - Soul Thorns (Waycrest Manor)\n130896 - Blackout Barrel (Freehold)\n129758 - Irontide Grenadier (Freehold)\n131009 - Spirit of Gold (Atal`Dazar)\n--]=]",
				}, -- [1]
				{
					["Enabled"] = true,
					["Revision"] = 399,
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.buffIconGlow:Hide()\n    \nend",
					["NpcNames"] = {
					},
					["Author"] = "Tercioo-Sylvanas",
					["Desc"] = "Add the buff name in the trigger box.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.buffIconGlow:Show()\n    \nend",
					["SpellIds"] = {
						275826, -- [1]
						272888, -- [2]
						272659, -- [3]
						267901, -- [4]
						267830, -- [5]
						265393, -- [6]
					},
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \n    \nend",
					["Time"] = 1539013601,
					["PlaterCore"] = 1,
					["Name"] = "Aura - Buff Alert [Plater]",
					["ScriptType"] = 1,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self)\n    \nend",
				}, -- [2]
				{
					["Enabled"] = true,
					["Revision"] = 391,
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Hide()\n    \n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame:StopFrameShake (envTable.FrameShake)    \n    \nend\n\n\n",
					["NpcNames"] = {
					},
					["Author"] = "Bombad�o-Azralon",
					["Desc"] = "Highlight a very important cast applying several effects into the Cast Bar. Add spell in the Add Trigger field.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    \n    envTable.BackgroundFlash:Play()\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \nend\n\n\n",
					["SpellIds"] = {
						257785, -- [1]
						267237, -- [2]
						266951, -- [3]
						267273, -- [4]
						267433, -- [5]
						263066, -- [6]
						255577, -- [7]
						255371, -- [8]
					},
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Time"] = 1561923707,
					["PlaterCore"] = 1,
					["Name"] = "Cast - Very Important [Plater]",
					["ScriptType"] = 2,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    local CONFIG_BACKGROUND_FLASH_DURATION = 0.8 --0.8\n    local CONFIG_BORDER_GLOW_ALPHA = 0.3 --0.3\n    local CONFIG_SHAKE_DURATION = 0.2 --0.2\n    local CONFIG_SHAKE_AMPLITUDE = 5 --5\n    \n    --create a glow effect in the border of the cast bar\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (self)\n    envTable.glowEffect:SetOffset (-32, 30, 7, -9)\n    envTable.glowEffect:SetAlpha (CONFIG_BORDER_GLOW_ALPHA)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() \n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+40, self:GetHeight()+20, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, 1)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, CONFIG_SHAKE_DURATION, CONFIG_SHAKE_AMPLITUDE, 35, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))    \n    \n    \n    --update the config for the flash here so it wont need a /reload\n    fadeIn:SetDuration (CONFIG_BACKGROUND_FLASH_DURATION/2)\n    fadeOut:SetDuration (CONFIG_BACKGROUND_FLASH_DURATION/2)    \n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = CONFIG_SHAKE_AMPLITUDE\n    envTable.FrameShake.OriginalDuration = CONFIG_SHAKE_DURATION  \n    \nend",
				}, -- [3]
				{
					["Enabled"] = true,
					["Revision"] = 324,
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.glowEffect:Hide()\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
					["NpcNames"] = {
					},
					["Author"] = "Bombad�o-Azralon",
					["Desc"] = "Apply several animations when the explosion orb cast starts on a Mythic Dungeon with Explosion Affix",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 32\n    \n    envTable.glowEffect.Texture:SetAlpha (envTable.GlowAlpha)\n    \n    \nend\n\n\n\n\n\n\n",
					["SpellIds"] = {
						240446, -- [1]
						273577, -- [2]
					},
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-16, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0.016\n    \n    --update the health bar color coloring from yellow to red\n    --Plater.SetNameplateColor (unitFrame, max (envTable._CastPercent/100, .66), abs (envTable._CastPercent/100 - 1), 0, 1)\n    \n    Plater.SetNameplateColor (unitFrame, envTable.HealthBarColor)\n    envTable.glowEffect.Texture:SetAlpha (envTable.GlowAlpha)\n    \nend\n\n\n",
					["Time"] = 1540663131,
					["PlaterCore"] = 1,
					["Name"] = "Explosion Affix M+ [Plater]",
					["ScriptType"] = 2,
					["Icon"] = 2175503,
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = 3\n    envTable.GlowAlpha = .45\n    envTable.ShowArrow = true\n    envTable.ArrowAlpha = .45    \n    envTable.HealthBarColor = \"orange\"\n    \n    --custom frames\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (unitFrame.healthBar)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() \n    envTable.glowEffect:SetOffset (-27, 25, 6, -8)\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 32\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\CastingBar\\UI-CastingBar-Spark]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = 8\n    envTable.topArrow.height = 8\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
				}, -- [4]
				{
					["Enabled"] = true,
					["Revision"] = 232,
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.debuffIconGlow:Hide()\n    \nend\n\n\n",
					["NpcNames"] = {
					},
					["Author"] = "Tercioo-Sylvanas",
					["Desc"] = "Add the debuff name in the trigger box.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.debuffIconGlow:Show()\n    \nend\n\n\n",
					["SpellIds"] = {
					},
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Time"] = 1538429739,
					["PlaterCore"] = 1,
					["Name"] = "Aura - Debuff Alert [Plater]",
					["ScriptType"] = 1,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --creates a glow around the icon\n    envTable.debuffIconGlow = envTable.debuffIconGlow or Plater.CreateIconGlow (self)\n    \nend\n\n\n",
				}, -- [5]
				{
					["Enabled"] = true,
					["Revision"] = 574,
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end    \n    \n    --restore the cast bar to its original height\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n        envTable.OriginalHeight = nil\n    end\n    \n    --stop the camera shake\n    unitFrame:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \nend\n\n\n\n\n\n",
					["NpcNames"] = {
					},
					["Author"] = "Tercioo-Sylvanas",
					["Desc"] = "Flash, Bounce and Red Color the CastBar border when when an important cast is happening. Add spell in the Add Trigger field.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \nend\n\n\n\n\n\n\n\n\n",
					["SpellIds"] = {
						258153, -- [1]
						258313, -- [2]
						257069, -- [3]
						274569, -- [4]
						278020, -- [5]
						261635, -- [6]
						272700, -- [7]
						280404, -- [8]
						268030, -- [9]
						265368, -- [10]
						263891, -- [11]
						264520, -- [12]
						265407, -- [13]
						278567, -- [14]
						278602, -- [15]
						258128, -- [16]
						257791, -- [17]
						258938, -- [18]
						265089, -- [19]
						272183, -- [20]
						256060, -- [21]
						257397, -- [22]
						257899, -- [23]
						269972, -- [24]
						270901, -- [25]
						270492, -- [26]
						268129, -- [27]
						268709, -- [28]
						263215, -- [29]
						268797, -- [30]
						262540, -- [31]
						262554, -- [32]
						253517, -- [33]
						255041, -- [34]
						252781, -- [35]
						250368, -- [36]
						258777, -- [37]
					},
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Time"] = 1561924439,
					["PlaterCore"] = 1,
					["Name"] = "Cast - Big Alert [Plater]",
					["ScriptType"] = 2,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --https://www.wowhead.com/spell=253583/fiery-enchant\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    \n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = \"darkorange\"\n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = 0.4\n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = 5\n    \n    \n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, 0.2, 5, 35, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()        \n    \nend\n\n\n",
				}, -- [6]
				{
					["Enabled"] = true,
					["Revision"] = 376,
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.SmallFlashAnimationHub:Stop()\n    \nend\n\n\n",
					["NpcNames"] = {
					},
					["Author"] = "Tercioo-Sylvanas",
					["Desc"] = "Flashes the Cast Bar when a spell in the trigger list is Cast. Add spell in the Add Trigger field.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.SmallFlashAnimationHub:Play()\n    \nend\n\n\n",
					["SpellIds"] = {
						275192, -- [1]
						265912, -- [2]
						274438, -- [3]
						268317, -- [4]
						268375, -- [5]
						276767, -- [6]
						264105, -- [7]
						265876, -- [8]
						270464, -- [9]
						266106, -- [10]
						272180, -- [11]
						278961, -- [12]
						278755, -- [13]
						265468, -- [14]
						256405, -- [15]
						256897, -- [16]
						264101, -- [17]
						280604, -- [18]
						268702, -- [19]
						281621, -- [20]
						262515, -- [21]
						255824, -- [22]
						253583, -- [23]
						250096, -- [24]
					},
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \nend\n\n\n",
					["Time"] = 1539201768,
					["PlaterCore"] = 1,
					["Name"] = "Cast - Small Alert [Plater]",
					["ScriptType"] = 2,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    \n    --flash duration\n    local CONFIG_FLASH_DURATION = 0.6\n    \n    --manually create a new texture for the flash animation\n    if (not envTable.SmallFlashTexture) then\n        envTable.SmallFlashTexture = envTable.SmallFlashTexture or Plater:CreateImage (unitFrame.castBar)\n        envTable.SmallFlashTexture:SetColorTexture (1, 1, 1)\n        envTable.SmallFlashTexture:SetAllPoints()\n    end\n    \n    --manually create a flash animation using the framework\n    if (not envTable.SmallFlashAnimationHub) then \n        \n        local onPlay = function()\n            envTable.SmallFlashTexture:Show()\n        end\n        \n        local onFinished = function()\n            envTable.SmallFlashTexture:Hide()\n        end\n        \n        local animationHub = Plater:CreateAnimationHub (envTable.SmallFlashTexture, onPlay, onFinished)\n        Plater:CreateAnimation (animationHub, \"Alpha\", 1, CONFIG_FLASH_DURATION/2, 0, .6)\n        Plater:CreateAnimation (animationHub, \"Alpha\", 2, CONFIG_FLASH_DURATION/2, 1, 0)\n        \n        envTable.SmallFlashAnimationHub = animationHub\n    end\n    \n    \n    \nend\n\n\n\n\n\n\n\n",
				}, -- [7]
				{
					["Enabled"] = true,
					["Revision"] = 106,
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["NpcNames"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "When an aura makes the unit invulnarable and you don't want to attack it. Add spell in the Add Trigger field.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["SpellIds"] = {
						261265, -- [1]
						261266, -- [2]
						271590, -- [3]
					},
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --only change the nameplate color in combat\n    if (InCombatLockdown()) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n\n\n",
					["Time"] = 1538256464,
					["PlaterCore"] = 1,
					["Name"] = "Aura - Invalidate Unit [Plater]",
					["ScriptType"] = 1,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_invalid",
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --color to set the nameplate\n    envTable.NameplateColor = \"gray\"\n    \nend\n\n\n",
				}, -- [8]
				{
					["Enabled"] = true,
					["Revision"] = 59,
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --make plater refresh the nameplate color\n    Plater.RefreshNameplateColor (unitFrame)\n    \n        envTable.smallFlash:Stop()\n    \nend\n\n\n",
					["NpcNames"] = {
						"141851", -- [1]
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Add a unitID or unit name in 'Add Trigger' entry. See the constructor script for options.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can flash the nameplate\n    if (envTable.FlashNameplate) then\n        envTable.smallFlash:Play()\n    end\n    \nend\n\n\n\n\n\n\n\n\n",
					["SpellIds"] = {
					},
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --adjust the nameplate color\n    Plater.SetNameplateColor (unitFrame, envTable.Color)\n    \n    --check if can replace the health amount with the unit name\n    if (envTable.ReplaceHealthWithName) then\n        \n        local healthPercent = format (\"%.1f\", unitFrame.healthBar.CurrentHealth / unitFrame.healthBar.CurrentHealthMax *100)\n        \n        unitFrame.healthBar.lifePercent:SetText (unitFrame.namePlateUnitName .. \"  (\" .. healthPercent  .. \"%)\")\n        \n    end\n    \nend\n\n\n",
					["Time"] = 1543253273,
					["PlaterCore"] = 1,
					["Name"] = "Color Change [Plater]",
					["ScriptType"] = 3,
					["Icon"] = 135024,
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings:\n    do\n        \n        --change the nameplate color to this color\n        --can use color names: \"red\", \"yellow\"\n        --can use color hex: \"#FF0000\", \"#FFFF00\"\n        --con use color table: {1, 0, 0}, {1, 1, 0}\n        \n        envTable.Color = \"green\"\n        \n        --if true, it'll replace the health info with the unit name\n        envTable.ReplaceHealthWithName = false\n        \n        --use flash when the unit is shown in the screen\n        envTable.FlashNameplate = true\n        \n    end\n    \n    --private:\n    do\n        --create a flash for when the unit if shown\n        envTable.smallFlash = envTable.smallFlash or Plater.CreateFlash (unitFrame.healthBar, 0.15, 1, envTable.Color)\n        \n    end\n    \nend\n\n--[=[\n\nNpc IDS:\n\n141851: Spawn of G'Huun on Mythic Dungeons\n\n\n--]=]\n\n\n\n\n",
				}, -- [9]
				{
					["Enabled"] = true,
					["Revision"] = 157,
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.blinkAnimation:Stop()\n    envTable.blinkTexture:Hide()\n    envTable.blinkAnimation:Stop()\n    envTable.glowEffect:Stop()\n    Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\nend\n\n\n",
					["NpcNames"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Blink, change the number and nameplate color. Add the debuffs int he trigger box. Set settings on constructor script.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.blinkTexture:SetSize (self:GetSize())\n    \nend\n\n\n",
					["SpellIds"] = {
					},
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    local timeLeft = envTable._RemainingTime\n    \n    --check if the spellID isn't being ignored\n    if (envTable.IgnoredSpellID [envTable._SpellID]) then\n        return\n    end\n    \n    --check the time left and start or stop the blink animation and also check if the time left is > zero\n    if ((envTable.BlinkEnabled or envTable.GlowEnabled) and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftToBlink) then\n            --blink effect\n            if (envTable.BlinkEnabled) then\n                if (not envTable.blinkAnimation:IsPlaying()) then\n                    envTable.blinkAnimation:Play()\n                end\n            end\n            --glow effect\n            if (envTable.GlowEnabled) then\n                envTable.glowEffect:Show()\n            end\n            --nameplate color\n            if (envTable.ChangeNameplateColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n            end\n        else\n            --blink effect\n            if (envTable.blinkAnimation:IsPlaying()) then\n                envTable.blinkAnimation:Stop()\n            end\n            --glow effect\n            if (envTable.GlowEnabled and envTable.glowEffect:IsShown()) then\n                envTable.glowEffect:Hide()\n            end\n        end\n    end\n    \n    --timer color\n    if (envTable.TimerColorEnabled and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftCritical) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Critical)\n        elseif (timeLeft < envTable.TimeLeftWarning) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Warning)        \n        else\n            Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\n        end\n    end\n    \nend",
					["Time"] = 1547991413,
					["PlaterCore"] = 1,
					["Name"] = "Aura - Blink by Time Left [Plater]",
					["ScriptType"] = 1,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_blink",
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (require a /reload after editing any setting)\n    do\n        --blink and glow\n        envTable.BlinkEnabled = true --set to 'false' to disable blinks\n        envTable.GlowEnabled = true --set to 'false' to disable glows\n        envTable.ChangeNameplateColor = true; --set to 'true' to enable nameplate color change\n        envTable.TimeLeftToBlink = 4.5; --in seconds, affects the blink effect only\n        envTable.BlinkSpeed = 1.0; --time to complete a blink loop\n        envTable.BlinkColor = \"white\"; --color of the blink\n        envTable.BlinkMaxAlpha = 0.50; --max transparency in the animation loop (1.0 is full opaque)\n        envTable.NameplateColor = \"darkred\"; --nameplate color if ChangeNameplateColor is true\n        \n        --text color\n        envTable.TimerColorEnabled = true --set to 'false' to disable changes in the color of the time left text\n        envTable.TimeLeftWarning = 8.0; --in seconds, affects the color of the text\n        envTable.TimeLeftCritical = 3.0; --in seconds, affects the color of the text    \n        envTable.TextColor_Warning = \"yellow\"; --color when the time left entered in a warning zone\n        envTable.TextColor_Critical = \"red\"; --color when the time left is critical\n        \n        --list of spellIDs to ignore\n        envTable.IgnoredSpellID = {\n            [12] = true, --use a simple comma here\n            [13] = true,\n        }\n    end\n    \n    \n    --private\n    do\n        envTable.blinkTexture = Plater:CreateImage (self, \"\", 1, 1, \"overlay\")\n        envTable.blinkTexture:SetPoint ('center', 0, 0)\n        envTable.blinkTexture:Hide()\n        \n        local onPlay = function()\n            envTable.blinkTexture:Show() \n            envTable.blinkTexture.color = envTable.BlinkColor\n        end\n        local onStop = function()\n            envTable.blinkTexture:Hide()  \n        end\n        envTable.blinkAnimation = Plater:CreateAnimationHub (envTable.blinkTexture, onPlay, onStop)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 1, envTable.BlinkSpeed / 2, 0, envTable.BlinkMaxAlpha)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 2, envTable.BlinkSpeed / 2, envTable.BlinkMaxAlpha, 0)\n        \n        envTable.glowEffect = envTable.glowEffect or Plater.CreateIconGlow (self)\n        --envTable.glowEffect:Show() --envTable.glowEffect:Hide()\n        \n    end\n    \nend\n\n\n\n\n",
				}, -- [10]
				{
					["Enabled"] = false,
					["Revision"] = 45,
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --reset the border color\n    self:SetBackdropBorderColor (0, 0, 0, 0)\n    \nend\n\n\n",
					["NpcNames"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Add a border to an aura icon. Add the aura into the Add Trigger entry. You can customize the icon color at the constructor script.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the aura name in lower case\n    local auraLowerName = string.lower (envTable._SpellName)\n    \n    --attempt to get a custom color added by the user in the constructor script\n    local hasCustomBorderColor = envTable.BorderColorByAura [auraLowerName] or envTable.BorderColorByAura [envTable._SpellName] or envTable.BorderColorByAura [envTable._SpellID]\n    \n    --save the custom color\n    envTable.CustomBorderColor = hasCustomBorderColor\n    \nend\n\n\n",
					["SpellIds"] = {
					},
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the custom color added by the user or the default color\n    local color = envTable.CustomBorderColor or envTable.DefaultBorderColor\n    --parse the color since it can be a color name, hex or color table\n    local r, g, b = DetailsFramework:ParseColors (color)\n    \n    --set the border color\n    self:SetBackdropBorderColor (r, g, b, envTable.BorderAlpha)\n    \nend\n\n\n\n\n",
					["Time"] = 1543680853,
					["PlaterCore"] = 1,
					["Name"] = "Aura - Border Color [Plater]",
					["ScriptType"] = 1,
					["Icon"] = 133006,
					["ConstructorCode"] = "--gray lines are comments and doesn't affect the code\n\n--1) add the aura you want by typing its name or spellID into the \"Add Trigger\" and click the \"Add\" button.\n--2) the border will use the default color set below, to a custom color type aura name and the color you want in the BorderColorByAura table.\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --default color if the aura name isn't found in the Color By Aura table below\n    envTable.DefaultBorderColor = \"orange\"\n    \n    --transparency, affect all borders\n    envTable.BorderAlpha = 1.0\n    \n    --add the aura name and the color, \n    envTable.BorderColorByAura = {\n        \n        --examples:\n        --[\"Aura Name\"] = \"yellow\", --using regular aura name | using the name of the color\n        --[\"aura name\"] = \"#FFFF00\", --using lower case in the aura name |using html #hex for the color\n        --[54214] = {1, 1, 0}, --using the spellID instead of the name | using rgb table (0 to 1) for the color\n        --color table uses zero to one values: 255 = 1.0, 127 = 0.5, orange color = {1, 0.7, 0}\n        \n        --add your custom border colors below:\n        \n        [\"Aura Name\"] = {1, .5, 0}, --example to copy/paste\n        \n    }\n    \n    \nend\n\n\n\n\n",
				}, -- [11]
				{
					["Enabled"] = true,
					["Revision"] = 131,
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Hide()\nend\n\n\n",
					["NpcNames"] = {
						"Guardian of Yogg-Saron", -- [1]
					},
					["Author"] = "Celian-Sylvanas",
					["Desc"] = "Show the energy amount above the nameplate",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Show()\nend\n\n\n",
					["SpellIds"] = {
					},
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount.text = \"\" .. UnitPower (unitId);\nend\n\n\n",
					["Time"] = 1539015649,
					["PlaterCore"] = 1,
					["Name"] = "UnitPower [Plater]",
					["ScriptType"] = 3,
					["Icon"] = 136048,
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount = Plater:CreateLabel (unitFrame, \"\", 16, \"silver\");\n    envTable.EnergyAmount:SetPoint (\"bottom\", unitFrame, \"top\", 0, 18);\nend\n\n--[=[\n\n\n--]=]",
				}, -- [12]
				{
					["Enabled"] = true,
					["Revision"] = 171,
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.movingAnimation:Stop()\nend\n\n\n",
					["NpcNames"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Does an animation for casts that affect the frontal area of the enemy. Add spell in the Add Trigger field.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.movingAnimation:Play()\nend\n\n\n",
					["SpellIds"] = {
						255952, -- [1]
						257426, -- [2]
						274400, -- [3]
						272609, -- [4]
						269843, -- [5]
						269029, -- [6]
						272827, -- [7]
						269266, -- [8]
						263912, -- [9]
						264923, -- [10]
						258864, -- [11]
						256955, -- [12]
						265540, -- [13]
						260793, -- [14]
						270003, -- [15]
						270507, -- [16]
						257337, -- [17]
						268415, -- [18]
						275907, -- [19]
						268865, -- [20]
						260669, -- [21]
						260280, -- [22]
						253239, -- [23]
						265541, -- [24]
						250258, -- [25]
					},
					["UpdateCode"] = "		function (self, unitId, unitFrame, envTable)\n			\n		end\n	",
					["Time"] = 1539201849,
					["PlaterCore"] = 1,
					["Name"] = "Cast - Frontal Cone [Plater]",
					["ScriptType"] = 2,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.movingArrow = envTable.movingArrow or Plater:CreateImage (self, [[Interface\\PETBATTLES\\PetBattle-StatIcons]], 16, self:GetHeight(), \"background\", {0, 15/32, 18/32, 30/32})\n    \n    envTable.movingArrow:SetAlpha (0.275)\n    --envTable.movingArrow:SetDesaturated (true)\n    \n    envTable.movingAnimation = envTable.movingAnimation or Plater:CreateAnimationHub (envTable.movingArrow, \n        function() \n            envTable.movingArrow:Show() \n            envTable.movingArrow:SetPoint(\"left\", 0, 0)\n        end, \n        function() envTable.movingArrow:Hide() end)\n    \n    envTable.movingAnimation:SetLooping (\"REPEAT\")\n    \n    local animation = Plater:CreateAnimation (envTable.movingAnimation, \"translation\", 1, 0.2, self:GetWidth()-16, 0)\n    \n    \n    \nend\n\n\n",
				}, -- [13]
				{
					["Enabled"] = true,
					["Revision"] = 190,
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n\n",
					["NpcNames"] = {
					},
					["Author"] = "Celian-Sylvanas",
					["Desc"] = "Show above the nameplate who is the player fixated",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Show();\n    envTable.FixateIcon:Show();\n    \nend\n\n\n",
					["SpellIds"] = {
						272584, -- [1]
						244653, -- [2]
					},
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    local targetName = UnitName (unitId .. \"target\");\n    if (targetName) then\n        local _, class = UnitClass (unitId .. \"target\");\n        targetName = Plater.SetTextColorByClass (unitId .. \"target\", targetName);\n        envTable.FixateTarget.text = targetName;\n    end    \nend\n\n\n",
					["Time"] = 1539187387,
					["PlaterCore"] = 1,
					["Name"] = "Fixate [Plater]",
					["ScriptType"] = 1,
					["Icon"] = 1029718,
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.BuffFrame, \"top\", 0, 10);    \n    \n    envTable.FixateIcon = Plater:CreateImage (unitFrame, 236188, 16, 16, \"overlay\");\n    envTable.FixateIcon:SetPoint (\"bottom\", envTable.FixateTarget, \"top\", 0, 4);    \n    \nend\n\n\n\n\n\n\n\n\n",
				}, -- [14]
				{
					["Enabled"] = true,
					["Revision"] = 194,
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:SetText (\"\")\n    envTable.FixateTarget:Hide()\n    \n    envTable.IsFixated = false\n    \n    Plater.RefreshNameplateColor (unitFrame)\nend\n\n\n",
					["NpcNames"] = {
						"smuggled crawg", -- [1]
						"sergeant bainbridge", -- [2]
						"blacktooth scrapper", -- [3]
						"irontide grenadier", -- [4]
						"feral bloodswarmer", -- [5]
						"earthrager", -- [6]
						"crawler mine", -- [7]
						"rezan", -- [8]
						"136461", -- [9]
					},
					["Author"] = "Tecno-Azralon",
					["Desc"] = "When an enemy places a debuff and starts to chase you. This script changes the nameplate color and place your name above the nameplate as well.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["SpellIds"] = {
						"spawn of g'huun", -- [1]
						"smuggled crawg", -- [2]
						"sergeant bainbridge", -- [3]
						"blacktooth scrapper", -- [4]
						"irontide grenadier", -- [5]
						"feral bloodswarmer", -- [6]
						"earthrager", -- [7]
						"crawler mine", -- [8]
						"rezan", -- [9]
					},
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --swap this to true when it is fixated\n    local isFixated = false\n    \n    --check the debuffs the player has and see if any of these debuffs has been placed by this unit\n    for debuffId = 1, 40 do\n        local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (\"player\", debuffId)\n        \n        --cancel the loop if there's no more debuffs on the player\n        if (not name) then \n            break \n        end\n        \n        --check if the owner of the debuff is this unit\n        if (envTable.FixateDebuffs [name] and caster and UnitIsUnit (caster, unitId)) then\n            --the debuff the player has, has been placed by this unit, set the name above the unit name\n            envTable.FixateTarget:SetText (envTable.TextAboveNameplate)\n            envTable.FixateTarget:Show()\n            Plater.SetNameplateColor (unitFrame,  envTable.NameplateColor)\n            isFixated = true\n            \n            if (not envTable.IsFixated) then\n                envTable.IsFixated = true\n                Plater.FlashNameplateBody (unitFrame, \"fixate\", .2)\n            end\n        end\n        \n    end\n    \n    --check if the nameplate color is changed but isn't fixated any more\n    if (not isFixated and envTable.IsFixated) then\n        --refresh the nameplate color\n        Plater.RefreshNameplateColor (unitFrame)\n        --reset the text\n        envTable.FixateTarget:SetText (\"\")\n        \n        envTable.IsFixated = false\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					["Time"] = 1543250950,
					["PlaterCore"] = 1,
					["Name"] = "Fixate On You [Plater]",
					["ScriptType"] = 3,
					["Icon"] = 841383,
					["ConstructorCode"] = "--todo: add npc ids for multilanguage support\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.TextAboveNameplate = \"** On You **\"\n    envTable.NameplateColor = \"green\"\n    \n    --label to show the text above the nameplate\n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.healthBar, \"top\", 0, 30);\n    \n    --the spell casted by the npc in the trigger list needs to be in the list below as well\n    local spellList = {\n        [268074] = \"Dark Purpose\", --G'huun Mythic Add\n        [260954] = \"Iron Gaze\", --Sergeant Bainbridge - Siege of Boralus\n        [257739] = \"Blind Rage\", --Blacktooth Scrapper - Freehold\n        [257314] = \"Black Powder Bomb\", --Irontide Grenadier - Freehold\n        [266107] = \"Thirst For Blood\", --Feral Bloodswarmer - The Underrot\n        [257582] = \"Raging Gaze\", --Earthrager - The MOTHERLODE!!\n        [262377] = \"Seek and Destroy\", --Crawler Mine - The MOTHERLODE!!\n        [257407] = \"Pursuit\", --Rezan - Atal'Dazar\n        --[] = \"\" --       \n        \n    }\n    \n    --build the list with localized spell names\n    envTable.FixateDebuffs = {}\n    for spellID, enUSSpellName in pairs (spellList) do\n        local localizedSpellName = GetSpellInfo (spellID)\n        envTable.FixateDebuffs [localizedSpellName or enUSSpellName] = true\n    end\n    \n    --debug - smuggled crawg\n    envTable.FixateDebuffs [\"Jagged Maw\"] = true\n    \nend\n\n--[=[\nNpcIDs:\n136461: Spawn of G'huun (mythic uldir G'huun)\n\n--]=]\n\n\n\n\n",
				}, -- [15]
			},
			["spell_animations_scale"] = 1.251752853393555,
			["aura_timer_text_anchor"] = {
				["y"] = -4.155016899108887,
				["side"] = 11,
			},
			["use_ui_parent"] = true,
			["npc_cache"] = {
				[69134] = {
					"Kazra'jin", -- [1]
					"Throne of Thunder", -- [2]
				},
				[69390] = {
					"Zandalari Storm-Caller", -- [1]
					"Throne of Thunder", -- [2]
				},
				[34775] = {
					"Demolisher", -- [1]
					"Isle of Conquest", -- [2]
				},
				[45266] = {
					"Twilight Dark Mender", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[111354] = {
					"Taintheart Befouler", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[76811] = {
					"Bellows Operator", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[10413] = {
					"Crypt Beast", -- [1]
					"Stratholme", -- [2]
				},
				[93955] = {
					"Delusional Zealot", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[133345] = {
					"Feckless Assistant", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[136160] = {
					"King Dazar", -- [1]
					"Kings' Rest", -- [2]
				},
				[111355] = {
					"Taintheart Tormenter", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[76812] = {
					"Security Guard", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[138464] = {
					"Ashvane Deckhand", -- [1]
					"Siege of Boralus", -- [2]
				},
				[34776] = {
					"Siege Engine", -- [1]
					"Isle of Conquest", -- [2]
				},
				[131812] = {
					"Heartsbane Soulcharmer", -- [1]
					"Waycrest Manor", -- [2]
				},
				[94724] = {
					"Bryanda", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[138465] = {
					"Ashvane Cannoneer", -- [1]
					"Siege of Boralus", -- [2]
				},
				[82698] = {
					"Night-Twisted Devout", -- [1]
					"Highmaul", -- [2]
				},
				[27983] = {
					"Dark Rune Protector", -- [1]
					"Halls of Stone", -- [2]
				},
				[77325] = {
					"Blackhand", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[75406] = {
					"Slagna", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[92038] = {
					"Salivating Bloodthirster", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[69905] = {
					"Gurubashi Berserker", -- [1]
					"Throne of Thunder", -- [2]
				},
				[54543] = {
					"Time-Twisted Drake", -- [1]
					"End Time", -- [2]
				},
				[74383] = {
					"Splinterbone Warrior", -- [1]
					"Razorfen Downs", -- [2]
				},
				[134629] = {
					"Scaled Krolusk Rider", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[141282] = {
					"Kul Tiran Footman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[151773] = {
					"Junkyard D.0.G.", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[11197] = {
					"Mindless Skeleton", -- [1]
					"Stratholme", -- [2]
				},
				[93830] = {
					"Iron Dragoon", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[161241] = {
					"Voidweaver Mal'thir", -- [1]
					"Kings' Rest", -- [2]
				},
				[34777] = {
					"Siege Turret", -- [1]
					"Isle of Conquest", -- [2]
				},
				[141283] = {
					"Kul Tiran Halberd", -- [1]
					"Siege of Boralus", -- [2]
				},
				[26672] = {
					"Bloodthirsty Tundra Wolf", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[69906] = {
					"Zandalari High Priest", -- [1]
					"Throne of Thunder", -- [2]
				},
				[61644] = {
					"Dark Shaman Researcher", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[53648] = {
					"Inferno Hawk", -- [1]
					"Firelands", -- [2]
				},
				[136934] = {
					"Weapons Tester", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[141284] = {
					"Kul Tiran Wavetender", -- [1]
					"Siege of Boralus", -- [2]
				},
				[161243] = {
					"Samh'rek, Beckoner of Chaos", -- [1]
					"Waycrest Manor", -- [2]
				},
				[141285] = {
					"Kul Tiran Marksman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[13596] = {
					"Rotgrip", -- [1]
					"Maraudon", -- [2]
				},
				[131818] = {
					"Marked Sister", -- [1]
					"Waycrest Manor", -- [2]
				},
				[129526] = {
					"Bilge Rat Swabby", -- [1]
					"Freehold", -- [2]
				},
				[80526] = {
					"Stubborn Ironhoof", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[161244] = {
					"Blood of the Corruptor", -- [1]
					"Kings' Rest", -- [2]
				},
				[152033] = {
					"Inconspicuous Plant", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[131819] = {
					"Coven Diviner", -- [1]
					"Waycrest Manor", -- [2]
				},
				[34778] = {
					"Flame Turret", -- [1]
					"Isle of Conquest", -- [2]
				},
				[11789] = {
					"Deep Borer", -- [1]
					"Maraudon", -- [2]
				},
				[90378] = {
					"Kilrogg Deadeye", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[129527] = {
					"Bilge Rat Buccaneer", -- [1]
					"Freehold", -- [2]
				},
				[19668] = {
					"Shadowfiend", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[161502] = {
					"Ravenous Fleshfiend", -- [1]
					"Kings' Rest", -- [2]
				},
				[76945] = {
					"Ironcrusher", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[27984] = {
					"Dark Rune Stormcaller", -- [1]
					"Halls of Stone", -- [2]
				},
				[131821] = {
					"Faceless Maiden", -- [1]
					"Waycrest Manor", -- [2]
				},
				[156641] = {
					"Enthralled Weaponsmith", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[54161] = {
					"Flame Archon", -- [1]
					"Firelands", -- [2]
				},
				[126969] = {
					"Trothak", -- [1]
					"Freehold", -- [2]
				},
				[69909] = {
					"Amani'shi Flame Chanter", -- [1]
					"Throne of Thunder", -- [2]
				},
				[92554] = {
					"Mek'barash", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[156642] = {
					"Enthralled Laborer", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[28368] = {
					"Ymirjar Necromancer", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[76946] = {
					"Faultline", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[131823] = {
					"Sister Malady", -- [1]
					"Waycrest Manor", -- [2]
				},
				[158690] = {
					"Cultist Tormenter", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[79505] = {
					"Solar Flare", -- [1]
					"Skyreach", -- [2]
				},
				[135406] = {
					"Animated Gold", -- [1]
					"Kings' Rest", -- [2]
				},
				[69910] = {
					"Drakkari Frost Warden", -- [1]
					"Throne of Thunder", -- [2]
				},
				[131824] = {
					"Sister Solena", -- [1]
					"Waycrest Manor", -- [2]
				},
				[129529] = {
					"Blacktooth Scrapper", -- [1]
					"Freehold", -- [2]
				},
				[10382] = {
					"Mangled Cadaver", -- [1]
					"Stratholme", -- [2]
				},
				[10398] = {
					"Thuzadin Shadowcaster", -- [1]
					"Stratholme", -- [2]
				},
				[131825] = {
					"Sister Briar", -- [1]
					"Waycrest Manor", -- [2]
				},
				[3637] = {
					"Deviate Guardian", -- [1]
					"Wailing Caverns", -- [2]
				},
				[133361] = {
					"Wasting Servant", -- [1]
					"Waycrest Manor", -- [2]
				},
				[150249] = {
					"Pistonhead Scrapper", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[94859] = {
					"Armored Skullsmasher", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[93068] = {
					"Xhul'horac", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[151785] = {
					"Void-Twisted Wyrmkiller", -- [1]
					"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
				},
				[462] = {
					"Carrion Bird", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[150250] = {
					"Pistonhead Blaster", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[153065] = {
					"Voidbound Ravager", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[137713] = {
					"Big Money Crab", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[94604] = {
					"Gorebound Corruptor", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[127484] = {
					"Jes Howlis", -- [1]
					"Tol Dagor", -- [2]
				},
				[161510] = {
					"Mindrend Tentacle", -- [1]
					"Kings' Rest", -- [2]
				},
				[74902] = {
					"Splinterbone Warrior", -- [1]
					"Razorfen Downs", -- [2]
				},
				[49813] = {
					"Evolved Drakonaar", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[8895] = {
					"Anvilrage Officer", -- [1]
					"Blackrock Depths", -- [2]
				},
				[8911] = {
					"Fireguard Destroyer", -- [1]
					"Blackrock Depths", -- [2]
				},
				[134388] = {
					"A Knot of Snakes", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[24083] = {
					"Enslaved Proto-Drake", -- [1]
					"Utgarde Keep", -- [2]
				},
				[154347] = {
					"Void-Twisted Corruptor", -- [1]
					"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
				},
				[127485] = {
					"Bilge Rat Looter", -- [1]
					"Tol Dagor", -- [2]
				},
				[134389] = {
					"Venomous Ophidian", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[129788] = {
					"Irontide Bonesaw", -- [1]
					"Freehold", -- [2]
				},
				[137204] = {
					"Hoodoo Hexer", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[137716] = {
					"Bottom Feeder", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[150254] = {
					"Scraphound", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[134390] = {
					"Sand-crusted Striker", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[140787] = {
					"Ember Elemental", -- [1]
					"Isle of Conquest", -- [2]
				},
				[84499] = {
					"Entanglement", -- [1]
					"The Everbloom", -- [2]
				},
				[95630] = {
					"Construct Peacekeeper", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[126847] = {
					"Captain Raoul", -- [1]
					"Freehold", -- [2]
				},
				[94607] = {
					"Gorebound Cauterizer", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[80534] = {
					"Ornery Ironhoof", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[17271] = {
					"Bonechewer Destroyer", -- [1]
					"Hellfire Citadel: Ramparts", -- [2]
				},
				[93968] = {
					"Shadowfel Warden", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[126848] = {
					"Captain Eudora", -- [1]
					"Freehold", -- [2]
				},
				[11790] = {
					"Putridus Satyr", -- [1]
					"Maraudon", -- [2]
				},
				[76057] = {
					"Carrion Worm", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[127488] = {
					"Ashvane Flamecaster", -- [1]
					"Tol Dagor", -- [2]
				},
				[138489] = {
					"Shadow of Zul", -- [1]
					"Kings' Rest", -- [2]
				},
				[156145] = {
					"Burrowing Appendage", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[95632] = {
					"Sargerei Enforcer", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[77337] = {
					"Aknor Steelbringer", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[24084] = {
					"Tunneling Ghoul", -- [1]
					"Utgarde Keep", -- [2]
				},
				[156146] = {
					"Voidbound Shieldbearer", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[78233] = {
					"Darkshard Crystalback", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[70557] = {
					"Zandalari Prophet", -- [1]
					"Throne of Thunder", -- [2]
				},
				[12206] = {
					"Primordial Behemoth", -- [1]
					"Maraudon", -- [2]
				},
				[91539] = {
					"Fel Raven", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[81432] = {
					"Grom'kar Technician", -- [1]
					"Iron Docks", -- [2]
				},
				[53206] = {
					"Hell Hound", -- [1]
					"Firelands", -- [2]
				},
				[127106] = {
					"Irontide Officer", -- [1]
					"Freehold", -- [2]
				},
				[80409] = {
					"Markog Aba'dir", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[142587] = {
					"Devouring Maggot", -- [1]
					"Waycrest Manor", -- [2]
				},
				[135167] = {
					"Spectral Berserker", -- [1]
					"Kings' Rest", -- [2]
				},
				[10399] = {
					"Thuzadin Acolyte", -- [1]
					"Stratholme", -- [2]
				},
				[131585] = {
					"Enthralled Guard", -- [1]
					"Waycrest Manor", -- [2]
				},
				[91540] = {
					"Illusionary Outcast", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[10463] = {
					"Shrieking Banshee", -- [1]
					"Stratholme", -- [2]
				},
				[69791] = {
					"Xuenray", -- [1]
					"Isle of Conquest", -- [2]
				},
				[131586] = {
					"Banquet Steward", -- [1]
					"Waycrest Manor", -- [2]
				},
				[156406] = {
					"Voidbound Honor Guard", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[78491] = {
					"Brackenspore", -- [1]
					"Highmaul", -- [2]
				},
				[94995] = {
					"Graggra", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[125828] = {
					"Galdrelin", -- [1]
					"Atal'Dazar", -- [2]
				},
				[141566] = {
					"Scrimshaw Gutter", -- [1]
					"Siege of Boralus", -- [2]
				},
				[131587] = {
					"Bewitched Captain", -- [1]
					"Waycrest Manor", -- [2]
				},
				[91541] = {
					"Shadowfel Warden", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[100497] = {
					"Ursoc", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[102672] = {
					"Nythendra", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[80411] = {
					"Iron Marksman", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[76829] = {
					"Slag Elemental", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[137474] = {
					"King Timalji", -- [1]
					"Kings' Rest", -- [2]
				},
				[49817] = {
					"Bound Inferno", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[95636] = {
					"Sargerei Adjutant", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[93717] = {
					"Volatile Firebomb", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[81819] = {
					"Everbloom Naturalist", -- [1]
					"The Everbloom", -- [2]
				},
				[24085] = {
					"Dragonflayer Overseer", -- [1]
					"Utgarde Keep", -- [2]
				},
				[78237] = {
					"Phemos", -- [1]
					"Highmaul", -- [2]
				},
				[76446] = {
					"Shadowmoon Enslaver", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[86809] = {
					"Grom'kar Incinerator", -- [1]
					"Iron Docks", -- [2]
				},
				[91543] = {
					"Corrupted Talonpriest", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[67235] = {
					"Shadowfiend", -- [1]
					"Isle of Conquest", -- [2]
				},
				[81820] = {
					"Everbloom Mender", -- [1]
					"The Everbloom", -- [2]
				},
				[78238] = {
					"Pol", -- [1]
					"Highmaul", -- [2]
				},
				[139269] = {
					"Gloom Horror", -- [1]
					"Waycrest Manor", -- [2]
				},
				[137478] = {
					"Queen Wasi", -- [1]
					"Kings' Rest", -- [2]
				},
				[95638] = {
					"Sargerei Bannerman", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[83612] = {
					"Skulloc", -- [1]
					"Iron Docks", -- [2]
				},
				[126983] = {
					"Harlan Sweete", -- [1]
					"Freehold", -- [2]
				},
				[127111] = {
					"Irontide Oarsman", -- [1]
					"Freehold", -- [2]
				},
				[131850] = {
					"Maddened Survivalist", -- [1]
					"Waycrest Manor", -- [2]
				},
				[54552] = {
					"Time-Twisted Breaker", -- [1]
					"End Time", -- [2]
				},
				[78623] = {
					"Cho'gall", -- [1]
					"Highmaul", -- [2]
				},
				[127879] = {
					"Shieldbearer of Zul", -- [1]
					"Atal'Dazar", -- [2]
				},
				[83613] = {
					"Koramar", -- [1]
					"Iron Docks", -- [2]
				},
				[11791] = {
					"Putridus Trickster", -- [1]
					"Maraudon", -- [2]
				},
				[45213] = {
					"Sinestra", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[123402] = {
					"Garothi Decimator", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[152834] = {
					"Azerite Skitterer", -- [1]
					"The Maelstrom - Heart of Azeroth", -- [2]
				},
				[156161] = {
					"Inquisitor Gnshal", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[95640] = {
					"Sargerei Soul Cleaver", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[75426] = {
					"Bloodmaul Overseer", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[151812] = {
					"Detect-o-Bot", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[94617] = {
					"Glynevere", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[54553] = {
					"Time-Twisted Seer", -- [1]
					"End Time", -- [2]
				},
				[94873] = {
					"Felfire Flamebelcher", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[74787] = {
					"Slave Watcher Crushto", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[137484] = {
					"King A'akul", -- [1]
					"Kings' Rest", -- [2]
				},
				[12207] = {
					"Thessala Hydra", -- [1]
					"Maraudon", -- [2]
				},
				[12223] = {
					"Cavern Lurker", -- [1]
					"Maraudon", -- [2]
				},
				[134158] = {
					"Shadow-Borne Champion", -- [1]
					"Kings' Rest", -- [2]
				},
				[128649] = {
					"Sergeant Bainbridge", -- [1]
					"Siege of Boralus", -- [2]
				},
				[137485] = {
					"Bloodsworn Agent", -- [1]
					"Kings' Rest", -- [2]
				},
				[94618] = {
					"Cattwen", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[84767] = {
					"Twisted Abomination", -- [1]
					"The Everbloom", -- [2]
				},
				[53786] = {
					"Blazing Monstrosity", -- [1]
					"Firelands", -- [2]
				},
				[137486] = {
					"Queen Patlaa", -- [1]
					"Kings' Rest", -- [2]
				},
				[10416] = {
					"Bile Spewer", -- [1]
					"Stratholme", -- [2]
				},
				[95642] = {
					"Korvos", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[138254] = {
					"Irontide Powdershot", -- [1]
					"Siege of Boralus", -- [2]
				},
				[83616] = {
					"Zoggosh", -- [1]
					"Iron Docks", -- [2]
				},
				[2630] = {
					"Earthbind Totem", -- [1]
					"Isle of Conquest", -- [2]
				},
				[90269] = {
					"Tyrant Velhari", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[69927] = {
					"Zandalari Prelate", -- [1]
					"Throne of Thunder", -- [2]
				},
				[131858] = {
					"Thornguard", -- [1]
					"Waycrest Manor", -- [2]
				},
				[138255] = {
					"Ashvane Spotter", -- [1]
					"Siege of Boralus", -- [2]
				},
				[52571] = {
					"Majordomo Staghelm", -- [1]
					"Firelands", -- [2]
				},
				[129802] = {
					"Earthrager", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[136976] = {
					"T'zala", -- [1]
					"Kings' Rest", -- [2]
				},
				[17306] = {
					"Watchkeeper Gargolmar", -- [1]
					"Hellfire Citadel: Ramparts", -- [2]
				},
				[128651] = {
					"Hadal Darkfathom", -- [1]
					"Siege of Boralus", -- [2]
				},
				[153097] = {
					"Voidbound Shaman", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[61463] = {
					"Slagmaw", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[90270] = {
					"Ancient Enforcer", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[78116] = {
					"Water Elemental", -- [1]
					"Waycrest Manor", -- [2]
				},
				[43296] = {
					"Chimaeron", -- [1]
					"Blackwing Descent", -- [2]
				},
				[74790] = {
					"Gug'rokk", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[49821] = {
					"Bound Zephyr", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[81315] = {
					"Iron Crack-Shot", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[69161] = {
					"Demossauro", -- [1]
					"Isle of Conquest", -- [2]
				},
				[77477] = {
					"Marak the Blooded", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[77605] = {
					"Whirling Dervish", -- [1]
					"Skyreach", -- [2]
				},
				[75814] = {
					"Bloodmaul Earthbreaker", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[90271] = {
					"Ancient Harbinger", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[84386] = {
					"Spore Image", -- [1]
					"The Everbloom", -- [2]
				},
				[129548] = {
					"Blacktooth Brute", -- [1]
					"Freehold", -- [2]
				},
				[80676] = {
					"Iron Flametwister", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[131863] = {
					"Raal the Gluttonous", -- [1]
					"Waycrest Manor", -- [2]
				},
				[26550] = {
					"Dragonflayer Deathseeker", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[87841] = {
					"Grom'kar Firemender", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[139284] = {
					"Plague Doctor", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[61528] = {
					"Lava Guard Gordoth", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[131864] = {
					"Gorak Tul", -- [1]
					"Waycrest Manor", -- [2]
				},
				[136470] = {
					"Refreshment Vendor", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[80677] = {
					"Iron Journeyman", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[80805] = {
					"Makogg Emberblade", -- [1]
					"Iron Docks", -- [2]
				},
				[41570] = {
					"Magmaw", -- [1]
					"Blackwing Descent", -- [2]
				},
				[83620] = {
					"Bloodmaul Earthbreaker", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[94239] = {
					"Omnus", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[127119] = {
					"Freehold Deckhand", -- [1]
					"Freehold", -- [2]
				},
				[80422] = {
					"Iron Marksman", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[136984] = {
					"Reban", -- [1]
					"Kings' Rest", -- [2]
				},
				[79015] = {
					"Ko'ragh", -- [1]
					"Highmaul", -- [2]
				},
				[13743] = {
					"Corrupt Force of Nature", -- [1]
					"Maraudon", -- [2]
				},
				[81318] = {
					"Iron Gunnery Sergeant", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[17307] = {
					"Nazan", -- [1]
					"Hellfire Citadel: Ramparts", -- [2]
				},
				[83621] = {
					"Bloodmaul Magma Binder", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[89890] = {
					"Fel Lord Zakuun", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[11792] = {
					"Putridus Shadowstalker", -- [1]
					"Maraudon", -- [2]
				},
				[135706] = {
					"Bilge Rat Looter", -- [1]
					"Tol Dagor", -- [2]
				},
				[70060] = {
					"Shadowed Voodoo Spirit", -- [1]
					"Throne of Thunder", -- [2]
				},
				[150547] = {
					"Scrapbone Grunter", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[80551] = {
					"Shard of Tectus", -- [1]
					"Highmaul", -- [2]
				},
				[92961] = {
					"Gorebound Brute", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[17723] = {
					"Bog Giant", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[150292] = {
					"Mechagon Cavalry", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[23960] = {
					"Dragonflayer Runecaster", -- [1]
					"Utgarde Keep", -- [2]
				},
				[83622] = {
					"Bloodmaul Ogre Mage", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[93985] = {
					"Corrupted Talonpriest", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[78121] = {
					"Gorian Warmage", -- [1]
					"Highmaul", -- [2]
				},
				[150293] = {
					"Mechagon Prowler", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[132126] = {
					"Gilded Priestess", -- [1]
					"Atal'Dazar", -- [2]
				},
				[74411] = {
					"Death's Head Necrolyte", -- [1]
					"Razorfen Downs", -- [2]
				},
				[70445] = {
					"Stormbringer Draz'kil", -- [1]
					"Throne of Thunder", -- [2]
				},
				[80808] = {
					"Neesa Nox", -- [1]
					"Iron Docks", -- [2]
				},
				[46753] = {
					"Al'Akir", -- [1]
					"Throne of the Four Winds", -- [2]
				},
				[12224] = {
					"Cavern Shambler", -- [1]
					"Maraudon", -- [2]
				},
				[112153] = {
					"Dire Shaman", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[93858] = {
					"Hulking Berserker", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[134686] = {
					"Mature Krolusk", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[47265] = {
					"Twilight Whelp", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[61658] = {
					"Mature Flame Hound", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[129553] = {
					"Dinomancer Kish'o", -- [1]
					"Atal'Dazar", -- [2]
				},
				[74412] = {
					"Aarux", -- [1]
					"Razorfen Downs", -- [2]
				},
				[10417] = {
					"Venom Belcher", -- [1]
					"Stratholme", -- [2]
				},
				[83624] = {
					"Bloodmaul Enforcer", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[136735] = {
					"Ashvane Marine", -- [1]
					"Tol Dagor", -- [2]
				},
				[75820] = {
					"Vengeful Magma Elemental", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[150297] = {
					"Mechagon Renormalizer", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[84520] = {
					"Pitwarden Gwarnok", -- [1]
					"Iron Docks", -- [2]
				},
				[152089] = {
					"Thrall", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[17308] = {
					"Omor the Unscarred", -- [1]
					"Hellfire Citadel: Ramparts", -- [2]
				},
				[87719] = {
					"Ogron Hauler", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[127124] = {
					"Freehold Barhand", -- [1]
					"Freehold", -- [2]
				},
				[76205] = {
					"Blooded Bladefeather", -- [1]
					"Skyreach", -- [2]
				},
				[134691] = {
					"Static-charged Dervish", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[53791] = {
					"Blazing Monstrosity", -- [1]
					"Firelands", -- [2]
				},
				[76973] = {
					"Hans'gar", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[49825] = {
					"Bound Deluge", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[6498] = {
					"Devilsaur", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[23961] = {
					"Dragonflayer Ironhelm", -- [1]
					"Utgarde Keep", -- [2]
				},
				[136483] = {
					"Ashvane Deckhand", -- [1]
					"Siege of Boralus", -- [2]
				},
				[135204] = {
					"Spectral Hex Priest", -- [1]
					"Kings' Rest", -- [2]
				},
				[86185] = {
					"Night-Twisted Supplicant", -- [1]
					"Highmaul", -- [2]
				},
				[54431] = {
					"Echo of Baine", -- [1]
					"End Time", -- [2]
				},
				[127381] = {
					"Silt Crab", -- [1]
					"Tol Dagor", -- [2]
				},
				[54687] = {
					"Time-Twisted Footman", -- [1]
					"End Time", -- [2]
				},
				[151325] = {
					"Alarm-o-Bot", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[76974] = {
					"Franzok", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[145185] = {
					"Gnomercy 4.U.", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[131112] = {
					"Cutwater Striker", -- [1]
					"Tol Dagor", -- [2]
				},
				[80557] = {
					"Mote of Tectus", -- [1]
					"Highmaul", -- [2]
				},
				[81197] = {
					"Iron Raider", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[77231] = {
					"Enforcer Sorka", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[153119] = {
					"Lesser Void Elemental", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[137511] = {
					"Bilge Rat Cutthroat", -- [1]
					"Siege of Boralus", -- [2]
				},
				[54432] = {
					"Murozond", -- [1]
					"End Time", -- [2]
				},
				[52577] = {
					"Left Foot", -- [1]
					"Firelands", -- [2]
				},
				[82733] = {
					"Night-Twisted Shadowsworn", -- [1]
					"Highmaul", -- [2]
				},
				[91305] = {
					"Fel Iron Summoner", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[130582] = {
					"Despondent Scallywag", -- [1]
					"Tol Dagor", -- [2]
				},
				[153377] = {
					"Goop", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[11793] = {
					"Celebrian Dryad", -- [1]
					"Maraudon", -- [2]
				},
				[90410] = {
					"Felfire Crusher", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[129559] = {
					"Cutwater Duelist", -- [1]
					"Freehold", -- [2]
				},
				[152866] = {
					"Hardened Azerite", -- [1]
					"The Maelstrom - Heart of Azeroth", -- [2]
				},
				[125977] = {
					"Reanimation Totem", -- [1]
					"Atal'Dazar", -- [2]
				},
				[17725] = {
					"Underbog Lurker", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[43686] = {
					"Ignacious", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[78001] = {
					"Cloudburst Totem", -- [1]
					"Waycrest Manor", -- [2]
				},
				[78641] = {
					"Night-Twisted Faithful", -- [1]
					"Highmaul", -- [2]
				},
				[80816] = {
					"Ahri'ok Dugru", -- [1]
					"Iron Docks", -- [2]
				},
				[137516] = {
					"Ashvane Invader", -- [1]
					"Siege of Boralus", -- [2]
				},
				[12225] = {
					"Celebras the Cursed", -- [1]
					"Maraudon", -- [2]
				},
				[26553] = {
					"Dragonflayer Fanatic", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[90284] = {
					"Iron Reaver", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[133935] = {
					"Animated Guardian", -- [1]
					"Kings' Rest", -- [2]
				},
				[74548] = {
					"Blazing Servitor", -- [1]
					"Razorfen Downs", -- [2]
				},
				[43687] = {
					"Feludius", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[112162] = {
					"Grisly Trapper", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[112290] = {
					"Horrid Eagle", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[135472] = {
					"Zanazal the Wise", -- [1]
					"Kings' Rest", -- [2]
				},
				[154663] = {
					"Gnome-Eating Droplet", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[54690] = {
					"Time-Twisted Priest", -- [1]
					"End Time", -- [2]
				},
				[83761] = {
					"Ogron Laborer", -- [1]
					"Iron Docks", -- [2]
				},
				[75829] = {
					"Nhallish", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[137521] = {
					"Irontide Powdershot", -- [1]
					"Siege of Boralus", -- [2]
				},
				[69944] = {
					"Sand Elemental", -- [1]
					"Throne of Thunder", -- [2]
				},
				[84401] = {
					"Swift Sproutling", -- [1]
					"The Everbloom", -- [2]
				},
				[53795] = {
					"Egg Pile", -- [1]
					"Firelands", -- [2]
				},
				[135475] = {
					"Kula the Butcher", -- [1]
					"Kings' Rest", -- [2]
				},
				[43688] = {
					"Arion", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[83762] = {
					"Grom'kar Deckhand", -- [1]
					"Iron Docks", -- [2]
				},
				[54435] = {
					"Ahriak", -- [1]
					"End Time", -- [2]
				},
				[46375] = {
					"Rowdy Troublemaker", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[54691] = {
					"Time-Twisted Sorceress", -- [1]
					"End Time", -- [2]
				},
				[133430] = {
					"Venture Co. Mastermind", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[75191] = {
					"Bloodmaul Slaver", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[46951] = {
					"Chosen Warrior", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[83763] = {
					"Grom'kar Technician", -- [1]
					"Iron Docks", -- [2]
				},
				[61408] = {
					"Adarogg", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[76087] = {
					"Defense Construct", -- [1]
					"Skyreach", -- [2]
				},
				[133943] = {
					"Minion of Zul", -- [1]
					"Kings' Rest", -- [2]
				},
				[94894] = {
					"Keen-Eyed Gronnstalker", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[53732] = {
					"Unbound Smoldering Elemental", -- [1]
					"Firelands", -- [2]
				},
				[133432] = {
					"Venture Co. Alchemist", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[43689] = {
					"Terrastra", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[133944] = {
					"Aspix", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[45992] = {
					"Valiona", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[83892] = {
					"Life Warden Gola", -- [1]
					"The Everbloom", -- [2]
				},
				[13601] = {
					"Tinkerer Gizlock", -- [1]
					"Maraudon", -- [2]
				},
				[46248] = {
					"Riverpaw Basher", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[70587] = {
					"Shale Stalker", -- [1]
					"Throne of Thunder", -- [2]
				},
				[93616] = {
					"Dreadstalker", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[46952] = {
					"Chosen Seer", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[83893] = {
					"Earthshaper Telu", -- [1]
					"The Everbloom", -- [2]
				},
				[149555] = {
					"Abomination", -- [1]
					"Isle of Conquest", -- [2]
				},
				[136250] = {
					"Hoodoo Hexer", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[111528] = {
					"Deathroot Ancient", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[93233] = {
					"Lord Aram'el", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[133436] = {
					"Venture Co. Skyscorcher", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[45993] = {
					"Theralion", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[83894] = {
					"Dulhu", -- [1]
					"The Everbloom", -- [2]
				},
				[46249] = {
					"Riverpaw Slayer", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[54693] = {
					"Time-Twisted Rifleman", -- [1]
					"End Time", -- [2]
				},
				[28410] = {
					"Dragonflayer Spiritualist", -- [1]
					"Utgarde Keep", -- [2]
				},
				[53094] = {
					"Patriarch Fire Turtle", -- [1]
					"Firelands", -- [2]
				},
				[47017] = {
					"Fire Elemental", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[47081] = {
					"Elemental Firelord", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[86326] = {
					"Breaker Ritualist", -- [1]
					"Highmaul", -- [2]
				},
				[61666] = {
					"Corrupted Houndmaster", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[14465] = {
					"Alliance Battle Standard", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[95282] = {
					"Azgalor", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[10435] = {
					"Magistrate Barthilas", -- [1]
					"Stratholme", -- [2]
				},
				[75452] = {
					"Bonemaw", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[151096] = {
					"Hati", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[86071] = {
					"Rokkaa", -- [1]
					"Highmaul", -- [2]
				},
				[75964] = {
					"Ranjit", -- [1]
					"Skyreach", -- [2]
				},
				[46250] = {
					"Riverpaw Poacher", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[17280] = {
					"Shattered Hand Warhound", -- [1]
					"Hellfire Citadel: Ramparts", -- [2]
				},
				[53095] = {
					"Matriarch Fire Turtle", -- [1]
					"Firelands", -- [2]
				},
				[53223] = {
					"Flamewaker Beast Handler", -- [1]
					"Firelands", -- [2]
				},
				[135234] = {
					"Diseased Mastiff", -- [1]
					"Waycrest Manor", -- [2]
				},
				[129699] = {
					"Ludwig Von Tortollan", -- [1]
					"Freehold", -- [2]
				},
				[135235] = {
					"Spectral Beastmaster", -- [1]
					"Kings' Rest", -- [2]
				},
				[17728] = {
					"Murkblood Tribesman", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[75198] = {
					"Bloodmaul Geomancer", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[148797] = {
					"Magus of the Dead", -- [1]
					"Isle of Conquest", -- [2]
				},
				[86073] = {
					"Lokk", -- [1]
					"Highmaul", -- [2]
				},
				[75966] = {
					"Defiled Spirit", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[86329] = {
					"Breaker Ritualist", -- [1]
					"Highmaul", -- [2]
				},
				[46379] = {
					"Vicious Thug", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[52648] = {
					"Boris", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[151613] = {
					"Anti-Personnel Squirrel", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[136005] = {
					"Rowdy Reveler", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[53096] = {
					"Fire Turtle Hatchling", -- [1]
					"Firelands", -- [2]
				},
				[53224] = {
					"Flamewaker Taskmaster", -- [1]
					"Firelands", -- [2]
				},
				[90296] = {
					"Soulbound Construct", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[86330] = {
					"Breaker Ritualist", -- [1]
					"Highmaul", -- [2]
				},
				[136006] = {
					"Rowdy Reveler", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[135239] = {
					"Spectral Witch Doctor", -- [1]
					"Kings' Rest", -- [2]
				},
				[45676] = {
					"Faceless Guardian", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[11459] = {
					"Ironbark Protector", -- [1]
					"Dire Maul", -- [2]
				},
				[84028] = {
					"Siegemaster Rokra", -- [1]
					"Iron Docks", -- [2]
				},
				[151872] = {
					"Grip of Horror", -- [1]
					"Emerald Dream - HoA Scenario", -- [2]
				},
				[46252] = {
					"Riverpaw Shaman", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[135241] = {
					"Bilge Rat Pillager", -- [1]
					"Siege of Boralus", -- [2]
				},
				[61029] = {
					"Primal Fire Elemental", -- [1]
					"Isle of Conquest", -- [2]
				},
				[83389] = {
					"Ironwing Flamespitter", -- [1]
					"Iron Docks", -- [2]
				},
				[128551] = {
					"Irontide Mastiff", -- [1]
					"Freehold", -- [2]
				},
				[77504] = {
					"Slag Behemoth", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[94008] = {
					"Dark Devourer", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[34802] = {
					"Glaive Thrower", -- [1]
					"Isle of Conquest", -- [2]
				},
				[76097] = {
					"Solar Familiar", -- [1]
					"Skyreach", -- [2]
				},
				[133963] = {
					"Test Subject", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[53545] = {
					"Molten Spewer", -- [1]
					"Firelands", -- [2]
				},
				[74434] = {
					"Amnennar the Coldbringer", -- [1]
					"Razorfen Downs", -- [2]
				},
				[130087] = {
					"Irontide Raider", -- [1]
					"Tol Dagor", -- [2]
				},
				[17729] = {
					"Murkblood Spearman", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[93625] = {
					"Phantasmal Resonance", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[93881] = {
					"Contracted Engineer", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[81983] = {
					"Verdant Mandragora", -- [1]
					"The Everbloom", -- [2]
				},
				[94777] = {
					"Morkronn", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[70341] = {
					"Tormented Spirit", -- [1]
					"Throne of Thunder", -- [2]
				},
				[135245] = {
					"Bilge Rat Demolisher", -- [1]
					"Siege of Boralus", -- [2]
				},
				[87229] = {
					"Iron Blood Mage", -- [1]
					"Highmaul", -- [2]
				},
				[75331] = {
					"Death's Head Ghoul Wrangler", -- [1]
					"Razorfen Downs", -- [2]
				},
				[75459] = {
					"Plagued Bat", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[134990] = {
					"Charged Dust Devil", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[81984] = {
					"Gnarlroot", -- [1]
					"The Everbloom", -- [2]
				},
				[43119] = {
					"Spirit of Angerforge", -- [1]
					"Blackwing Descent", -- [2]
				},
				[138061] = {
					"Venture Co. Longshoreman", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[134991] = {
					"Sandfury Stonefist", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[152135] = {
					"Void-Twisted Spellweaver", -- [1]
					"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
				},
				[83392] = {
					"Rampaging Clefthoof", -- [1]
					"Iron Docks", -- [2]
				},
				[45870] = {
					"Anshal", -- [1]
					"Throne of the Four Winds", -- [2]
				},
				[157253] = {
					"Ka'zir", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[127019] = {
					"Training Dummy", -- [1]
					"Freehold", -- [2]
				},
				[131666] = {
					"Coven Thornshaper", -- [1]
					"Waycrest Manor", -- [2]
				},
				[94779] = {
					"Sovokk", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[157254] = {
					"Tek'ris", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[134993] = {
					"Mchimba the Embalmer", -- [1]
					"Kings' Rest", -- [2]
				},
				[131667] = {
					"Soulbound Goliath", -- [1]
					"Waycrest Manor", -- [2]
				},
				[42800] = {
					"Golem Sentry", -- [1]
					"Blackwing Descent", -- [2]
				},
				[134994] = {
					"Spectral Headhunter", -- [1]
					"Kings' Rest", -- [2]
				},
				[47150] = {
					"Earth Ravager", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[158279] = {
					"Haywire Clockwork Rocket Bot", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[159303] = {
					"Monstrous Behemoth", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[74950] = {
					"Gelatanized Plague Gunk", -- [1]
					"Razorfen Downs", -- [2]
				},
				[131669] = {
					"Jagged Hound", -- [1]
					"Waycrest Manor", -- [2]
				},
				[133972] = {
					"Heavy Cannon", -- [1]
					"Tol Dagor", -- [2]
				},
				[45871] = {
					"Nezir", -- [1]
					"Throne of the Four Winds", -- [2]
				},
				[81603] = {
					"Champion Druna", -- [1]
					"Iron Docks", -- [2]
				},
				[135764] = {
					"Explosive Totem", -- [1]
					"Kings' Rest", -- [2]
				},
				[152396] = {
					"Guardian of Azeroth", -- [1]
					"Isle of Conquest", -- [2]
				},
				[46383] = {
					"Randolph Moloch", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[159305] = {
					"Maddened Conscript", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[135765] = {
					"Torrent Totem", -- [1]
					"Kings' Rest", -- [2]
				},
				[47087] = {
					"Azureborne Destroyer", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[47151] = {
					"Wind Breaker", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[133463] = {
					"Venture Co. War Machine", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[90432] = {
					"Felfire Flamebelcher", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[61672] = {
					"Dark Shaman Acolyte", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[89] = {
					"Infernal", -- [1]
					"Isle of Conquest", -- [2]
				},
				[158284] = {
					"Craggle Wobbletop", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[134232] = {
					"Hired Assassin", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[48047] = {
					"Twilight Whelp", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[75976] = {
					"Low-Born Arakkoa", -- [1]
					"Skyreach", -- [2]
				},
				[158285] = {
					"Tinkered Shieldbot", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[74953] = {
					"Congealed Droplet", -- [1]
					"Razorfen Downs", -- [2]
				},
				[158286] = {
					"Reprogrammed Warbot", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[79303] = {
					"Adorned Bladetalon", -- [1]
					"Skyreach", -- [2]
				},
				[42802] = {
					"Drakonid Slayer", -- [1]
					"Blackwing Descent", -- [2]
				},
				[47152] = {
					"Twilight Elementalist", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[80071] = {
					"Bladespire Sorcerer", -- [1]
					"Highmaul", -- [2]
				},
				[139097] = {
					"Sandswept Marksman", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[17731] = {
					"Fen Ray", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[131677] = {
					"Heartsbane Runeweaver", -- [1]
					"Waycrest Manor", -- [2]
				},
				[75210] = {
					"Bloodmaul Warder", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[17827] = {
					"Claw", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[48048] = {
					"Twilight Whelp", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[90435] = {
					"Kormrok", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[91331] = {
					"Archimonde", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[75211] = {
					"Magma Lord", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[42803] = {
					"Drakeadon Mongrel", -- [1]
					"Blackwing Descent", -- [2]
				},
				[136541] = {
					"Bile Oozeling", -- [1]
					"Waycrest Manor", -- [2]
				},
				[94018] = {
					"Shadow Burster", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[81864] = {
					"Dreadpetal", -- [1]
					"The Everbloom", -- [2]
				},
				[75979] = {
					"Exhumed Spirit", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[135007] = {
					"Orb Guardian", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[135263] = {
					"Ashvane Spotter", -- [1]
					"Siege of Boralus", -- [2]
				},
				[153942] = {
					"Annihilator Lak'hal", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[128434] = {
					"Feasting Skyscreamer", -- [1]
					"Atal'Dazar", -- [2]
				},
				[81737] = {
					"Unchecked Growth", -- [1]
					"The Everbloom", -- [2]
				},
				[88902] = {
					"Mol'dana Two-Blade", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[128435] = {
					"Toxic Saurid", -- [1]
					"Atal'Dazar", -- [2]
				},
				[10741] = {
					"Cat", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[94916] = {
					"Fel Touched Seer", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[76877] = {
					"Gruul", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[17732] = {
					"Lykul Wasp", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[131685] = {
					"Runic Disciple", -- [1]
					"Waycrest Manor", -- [2]
				},
				[8902] = {
					"Shadowforge Citizen", -- [1]
					"Blackrock Depths", -- [2]
				},
				[48050] = {
					"Twilight Whelp", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[162647] = {
					"Willing Sacrifice", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[77006] = {
					"Corpse Skitterling", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[152669] = {
					"Void Globule", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[136549] = {
					"Ashvane Cannoneer", -- [1]
					"Siege of Boralus", -- [2]
				},
				[43125] = {
					"Spirit of Moltenfist", -- [1]
					"Blackwing Descent", -- [2]
				},
				[41270] = {
					"Onyxia", -- [1]
					"Blackwing Descent", -- [2]
				},
				[53616] = {
					"Kar the Everburning", -- [1]
					"Firelands", -- [2]
				},
				[137830] = {
					"Pallid Gorger", -- [1]
					"Waycrest Manor", -- [2]
				},
				[130485] = {
					"Mechanized Peacekeeper", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[132713] = {
					"Mogul Razdunk", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[139110] = {
					"Spark Channeler", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[46260] = {
					"Searing Destroyer", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[127799] = {
					"Dazar'ai Honor Guard", -- [1]
					"Atal'Dazar", -- [2]
				},
				[151649] = {
					"Defense Bot Mk I", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[133482] = {
					"Crawler Mine", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[75857] = {
					"Unstable Magma Elemental", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[43126] = {
					"Spirit of Thaurissan", -- [1]
					"Blackwing Descent", -- [2]
				},
				[152162] = {
					"Void-Twisted Skystriker", -- [1]
					"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
				},
				[134251] = {
					"Seneschal M'bara", -- [1]
					"Kings' Rest", -- [2]
				},
				[53617] = {
					"Molten Erupter", -- [1]
					"Firelands", -- [2]
				},
				[80719] = {
					"Iron Smith", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[74834] = {
					"Web Wrap", -- [1]
					"Razorfen Downs", -- [2]
				},
				[23970] = {
					"Vrykul Skeleton", -- [1]
					"Utgarde Keep", -- [2]
				},
				[129208] = {
					"Dread Captain Lockwood", -- [1]
					"Siege of Boralus", -- [2]
				},
				[46261] = {
					"Enraged Fire Elemental", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[113088] = {
					"Corrupted Feeler", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[48436] = {
					"Twilight Drake", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[5053] = {
					"Deviate Crocolisk", -- [1]
					"Wailing Caverns", -- [2]
				},
				[78801] = {
					"Darkshard Acidback", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[130488] = {
					"Mech Jockey", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[46965] = {
					"Cho'gall", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[90316] = {
					"Shadow-Lord Iskar", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[61678] = {
					"Corrupted Reaver", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[70230] = {
					"Zandalari Blade Initiate", -- [1]
					"Throne of Thunder", -- [2]
				},
				[10390] = {
					"Skeletal Guardian", -- [1]
					"Stratholme", -- [2]
				},
				[10406] = {
					"Ghoul Ravener", -- [1]
					"Stratholme", -- [2]
				},
				[10438] = {
					"Maleki the Pallid", -- [1]
					"Stratholme", -- [2]
				},
				[85711] = {
					"Aquatic Technician", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[151144] = {
					"Hati", -- [1]
					"Isle of Conquest", -- [2]
				},
				[94283] = {
					"Shadow Infuser", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[76116] = {
					"Diving Chakram Spinner", -- [1]
					"Skyreach", -- [2]
				},
				[86607] = {
					"Iron Flame Technician", -- [1]
					"Highmaul", -- [2]
				},
				[161124] = {
					"Urg'roth, Breaker of Heroes", -- [1]
					"Kings' Rest", -- [2]
				},
				[151657] = {
					"Bomb Tonk", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[94284] = {
					"Fiery Enkindler", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[43128] = {
					"Spirit of Anvilrage", -- [1]
					"Blackwing Descent", -- [2]
				},
				[158567] = {
					"Tormented Kor'kron Annihilator", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[94924] = {
					"Iron Peon", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[83026] = {
					"Siegemaster Olugar", -- [1]
					"Iron Docks", -- [2]
				},
				[131445] = {
					"Block Warden", -- [1]
					"Tol Dagor", -- [2]
				},
				[69465] = {
					"Jin'rokh the Breaker", -- [1]
					"Throne of Thunder", -- [2]
				},
				[94285] = {
					"Fel Extractor", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[17990] = {
					"Underbog Mushroom", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[46263] = {
					"Slag Fury", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[134005] = {
					"Shalebiter", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[86609] = {
					"Iron Warmaster", -- [1]
					"Highmaul", -- [2]
				},
				[78549] = {
					"Gorian Reaver", -- [1]
					"Highmaul", -- [2]
				},
				[153196] = {
					"Scrapbone Grunter", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[11142] = {
					"Undead Postman", -- [1]
					"Stratholme", -- [2]
				},
				[78933] = {
					"Herald of Sunrise", -- [1]
					"Skyreach", -- [2]
				},
				[141938] = {
					"Ashvane Sniper", -- [1]
					"Siege of Boralus", -- [2]
				},
				[43129] = {
					"Spirit of Shadowforge", -- [1]
					"Blackwing Descent", -- [2]
				},
				[141939] = {
					"Ashvane Spotter", -- [1]
					"Siege of Boralus", -- [2]
				},
				[74584] = {
					"Plague-Rotted Webslinger", -- [1]
					"Razorfen Downs", -- [2]
				},
				[83028] = {
					"Grom'kar Deadeye", -- [1]
					"Iron Docks", -- [2]
				},
				[137591] = {
					"Healing Tide Totem", -- [1]
					"Kings' Rest", -- [2]
				},
				[46264] = {
					"Lord Overheat", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[144244] = {
					"The Platinum Pummeler", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[129598] = {
					"Freehold Pack Mule", -- [1]
					"Freehold", -- [2]
				},
				[42362] = {
					"Drakonid Drudge", -- [1]
					"Blackwing Descent", -- [2]
				},
				[60849] = {
					"Jade Serpent Statue", -- [1]
					"Isle of Conquest", -- [2]
				},
				[93392] = {
					"Captured Prisoner", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[81750] = {
					"Bloodmaul Ogron", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[43130] = {
					"Spirit of Burningeye", -- [1]
					"Blackwing Descent", -- [2]
				},
				[5925] = {
					"Grounding Totem", -- [1]
					"Isle of Conquest", -- [2]
				},
				[86612] = {
					"Spore Shooter", -- [1]
					"Highmaul", -- [2]
				},
				[80599] = {
					"Night-Twisted Earthwarper", -- [1]
					"Highmaul", -- [2]
				},
				[105419] = {
					"Dire Basilisk", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[17735] = {
					"Wrathfin Warrior", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[134012] = {
					"Taskmaster Askari", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[144248] = {
					"Head Machinist Sparkflux", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[129600] = {
					"Bilge Rat Brinescale", -- [1]
					"Freehold", -- [2]
				},
				[144249] = {
					"Omega Buster", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[47161] = {
					"Twilight Brute", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[26691] = {
					"Ymirjar Witch Doctor", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[53494] = {
					"Baleroc", -- [1]
					"Firelands", -- [2]
				},
				[94802] = {
					"Voidscribe Aathalos", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[157812] = {
					"Billibub Cogspinner", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[10407] = {
					"Fleshflayer Ghoul", -- [1]
					"Stratholme", -- [2]
				},
				[10439] = {
					"Ramstein the Gorger", -- [1]
					"Stratholme", -- [2]
				},
				[132481] = {
					"Kul Tiran Vanguard", -- [1]
					"Siege of Boralus", -- [2]
				},
				[106317] = {
					"Storm Totem", -- [1]
					"Isle of Conquest", -- [2]
				},
				[131009] = {
					"Spirit of Gold", -- [1]
					"Atal'Dazar", -- [2]
				},
				[157813] = {
					"Sprite Jumpsprocket", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[135552] = {
					"Deathtouched Slaver", -- [1]
					"Waycrest Manor", -- [2]
				},
				[129602] = {
					"Irontide Enforcer", -- [1]
					"Freehold", -- [2]
				},
				[91349] = {
					"Mannoroth", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[46842] = {
					"Pulsing Twilight Egg", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[77404] = {
					"The Butcher", -- [1]
					"Highmaul", -- [2]
				},
				[158327] = {
					"Crackling Shard", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[76253] = {
					"Dread Raven Hatchling", -- [1]
					"Skyreach", -- [2]
				},
				[94804] = {
					"Shambling Hulk", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[79068] = {
					"Iron Grunt", -- [1]
					"Highmaul", -- [2]
				},
				[150396] = {
					"Aerial Unit R-21/X", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[87768] = {
					"Night-Twisted Fanatic", -- [1]
					"Highmaul", -- [2]
				},
				[106319] = {
					"Ember Totem", -- [1]
					"Isle of Conquest", -- [2]
				},
				[24069] = {
					"Dragonflayer Bonecrusher", -- [1]
					"Utgarde Keep", -- [2]
				},
				[90199] = {
					"Gorefiend", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[150397] = {
					"King Mechagon", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[13142] = {
					"Deeprot Tangler", -- [1]
					"Maraudon", -- [2]
				},
				[28419] = {
					"Frenzied Geist", -- [1]
					"Utgarde Keep", -- [2]
				},
				[150142] = {
					"Scrapbone Trashtosser", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[126918] = {
					"Irontide Crackshot", -- [1]
					"Freehold", -- [2]
				},
				[26692] = {
					"Ymirjar Harpooner", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[150143] = {
					"Scrapbone Grinder", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[94806] = {
					"Fel Hellweaver", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[81117] = {
					"Karnor the Cruel", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[134024] = {
					"Devouring Maggot", -- [1]
					"Waycrest Manor", -- [2]
				},
				[75360] = {
					"Searing Ember", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[106321] = {
					"Tailwind Totem", -- [1]
					"Isle of Conquest", -- [2]
				},
				[126919] = {
					"Irontide Stormcaller", -- [1]
					"Freehold", -- [2]
				},
				[52409] = {
					"Ragnaros", -- [1]
					"Firelands", -- [2]
				},
				[152704] = {
					"Crawling Corruption", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[135049] = {
					"Dreadwing Raven", -- [1]
					"Waycrest Manor", -- [2]
				},
				[99541] = {
					"Risen Skulker", -- [1]
					"Isle of Conquest", -- [2]
				},
				[150146] = {
					"Scrapbone Shaman", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[87515] = {
					"Iron Flame Binder", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[87771] = {
					"Slagshop Worker", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[128967] = {
					"Ashvane Sniper", -- [1]
					"Siege of Boralus", -- [2]
				},
				[135562] = {
					"Venomous Ophidian", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[94808] = {
					"Hellfire Guardian", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[84957] = {
					"Putrid Pyromancer", -- [1]
					"The Everbloom", -- [2]
				},
				[62005] = {
					"Beast", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[27972] = {
					"Lightning Construct", -- [1]
					"Halls of Stone", -- [2]
				},
				[79200] = {
					"Blackrock Forge Specialist", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[150222] = {
					"Gunker", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[54073] = {
					"Flamewaker Hound Master", -- [1]
					"Firelands", -- [2]
				},
				[93913] = {
					"Fel Scorcher", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[27979] = {
					"Forged Iron Trogg", -- [1]
					"Halls of Stone", -- [2]
				},
				[135052] = {
					"Blight Toad", -- [1]
					"Waycrest Manor", -- [2]
				},
				[10437] = {
					"Nerub'enkan", -- [1]
					"Stratholme", -- [2]
				},
				[26696] = {
					"Ymirjar Berserker", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[26690] = {
					"Ymirjar Warrior", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[136076] = {
					"Agitated Nimbus", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[70245] = {
					"Training Dummy", -- [1]
					"Throne of Thunder", -- [2]
				},
				[26687] = {
					"Gortok Palehoof", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[161408] = {
					"Malicious Growth", -- [1]
					"Kings' Rest", -- [2]
				},
				[26686] = {
					"Ferocious Rhino", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[26685] = {
					"Massive Jormungar", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[76145] = {
					"Grand Defense Construct", -- [1]
					"Skyreach", -- [2]
				},
				[24200] = {
					"Skarvald the Constructor", -- [1]
					"Utgarde Keep", -- [2]
				},
				[26668] = {
					"Svala Sorrowgrave", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[26555] = {
					"Scourge Hulk", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[26554] = {
					"Dragonflayer Seer", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[26536] = {
					"Mindless Servant", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[128969] = {
					"Ashvane Commander", -- [1]
					"Siege of Boralus", -- [2]
				},
				[158437] = {
					"Fallen Taskmaster", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[26693] = {
					"Skadi the Ruthless", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[27982] = {
					"Forged Iron Dwarf", -- [1]
					"Halls of Stone", -- [2]
				},
				[82400] = {
					"Ogron Brute", -- [1]
					"Highmaul", -- [2]
				},
				[70246] = {
					"Spirit Flayer", -- [1]
					"Throne of Thunder", -- [2]
				},
				[127486] = {
					"Ashvane Officer", -- [1]
					"Tol Dagor", -- [2]
				},
				[27975] = {
					"Maiden of Grief", -- [1]
					"Halls of Stone", -- [2]
				},
				[27985] = {
					"Iron Golem Custodian", -- [1]
					"Halls of Stone", -- [2]
				},
				[27970] = {
					"Raging Construct", -- [1]
					"Halls of Stone", -- [2]
				},
				[137614] = {
					"Demolishing Terror", -- [1]
					"Siege of Boralus", -- [2]
				},
				[27977] = {
					"Krystallus", -- [1]
					"Halls of Stone", -- [2]
				},
				[27966] = {
					"Dark Rune Controller", -- [1]
					"Halls of Stone", -- [2]
				},
				[154758] = {
					"Toxic Monstrosity", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[69351] = {
					"Greater Cave Bat", -- [1]
					"Throne of Thunder", -- [2]
				},
				[27964] = {
					"Dark Rune Scholar", -- [1]
					"Halls of Stone", -- [2]
				},
				[27961] = {
					"Dark Rune Worker", -- [1]
					"Halls of Stone", -- [2]
				},
				[27965] = {
					"Dark Rune Shaper", -- [1]
					"Halls of Stone", -- [2]
				},
				[10464] = {
					"Wailing Banshee", -- [1]
					"Stratholme", -- [2]
				},
				[76132] = {
					"Soaring Chakram Master", -- [1]
					"Skyreach", -- [2]
				},
				[28384] = {
					"Lesser Air Elemental", -- [1]
					"Halls of Stone", -- [2]
				},
				[27969] = {
					"Dark Rune Giant", -- [1]
					"Halls of Stone", -- [2]
				},
				[27962] = {
					"Dark Rune Elementalist", -- [1]
					"Halls of Stone", -- [2]
				},
				[27960] = {
					"Dark Rune Warrior", -- [1]
					"Halls of Stone", -- [2]
				},
				[27971] = {
					"Unrelenting Construct", -- [1]
					"Halls of Stone", -- [2]
				},
				[27963] = {
					"Dark Rune Theurgist", -- [1]
					"Halls of Stone", -- [2]
				},
				[23954] = {
					"Ingvar the Plunderer", -- [1]
					"Utgarde Keep", -- [2]
				},
				[150154] = {
					"Saurolisk Bonenipper", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[24849] = {
					"Proto-Drake Rider", -- [1]
					"Utgarde Keep", -- [2]
				},
				[23953] = {
					"Prince Keleseth", -- [1]
					"Utgarde Keep", -- [2]
				},
				[69352] = {
					"Vampiric Cave Bat", -- [1]
					"Throne of Thunder", -- [2]
				},
				[23956] = {
					"Dragonflayer Strategist", -- [1]
					"Utgarde Keep", -- [2]
				},
				[17730] = {
					"Murkblood Healer", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[75193] = {
					"Bloodmaul Overseer", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[129227] = {
					"Azerokk", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[17726] = {
					"Wrathfin Myrmidon", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[52558] = {
					"Lord Rhyolith", -- [1]
					"Firelands", -- [2]
				},
				[17478] = {
					"Bleeding Hollow Scryer", -- [1]
					"Hellfire Citadel: Ramparts", -- [2]
				},
				[17270] = {
					"Bleeding Hollow Archer", -- [1]
					"Hellfire Citadel: Ramparts", -- [2]
				},
				[53691] = {
					"Shannox", -- [1]
					"Firelands", -- [2]
				},
				[17269] = {
					"Bleeding Hollow Darkcaster", -- [1]
					"Hellfire Citadel: Ramparts", -- [2]
				},
				[78948] = {
					"Tectus", -- [1]
					"Highmaul", -- [2]
				},
				[27973] = {
					"Crystalline Shardling", -- [1]
					"Halls of Stone", -- [2]
				},
				[17770] = {
					"Hungarfen", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[87520] = {
					"Animated Slag", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[130635] = {
					"Stonefury", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[24080] = {
					"Dragonflayer Weaponsmith", -- [1]
					"Utgarde Keep", -- [2]
				},
				[24082] = {
					"Proto-Drake Handler", -- [1]
					"Utgarde Keep", -- [2]
				},
				[24071] = {
					"Dragonflayer Heartsplitter", -- [1]
					"Utgarde Keep", -- [2]
				},
				[8913] = {
					"Twilight Emissary", -- [1]
					"Blackrock Depths", -- [2]
				},
				[17309] = {
					"Hellfire Watcher", -- [1]
					"Hellfire Citadel: Ramparts", -- [2]
				},
				[9017] = {
					"Lord Incendius", -- [1]
					"Blackrock Depths", -- [2]
				},
				[11121] = {
					"Black Guard Swordsmith", -- [1]
					"Stratholme", -- [2]
				},
				[8904] = {
					"Shadowforge Senator", -- [1]
					"Blackrock Depths", -- [2]
				},
				[76518] = {
					"Ritual of Bones", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[46251] = {
					"Riverpaw Looter", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[91103] = {
					"Felfire Demolisher", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[8896] = {
					"Shadowforge Peasant", -- [1]
					"Blackrock Depths", -- [2]
				},
				[10436] = {
					"Baroness Anastari", -- [1]
					"Stratholme", -- [2]
				},
				[10408] = {
					"Rockwing Gargoyle", -- [1]
					"Stratholme", -- [2]
				},
				[87521] = {
					"Iron Slag-Shaper", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[46381] = {
					"Shifty Thief", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[53116] = {
					"Unbound Blazing Elemental", -- [1]
					"Firelands", -- [2]
				},
				[71529] = {
					"Demossauro", -- [1]
					"Isle of Conquest", -- [2]
				},
				[53244] = {
					"Flamewaker Trainee", -- [1]
					"Firelands", -- [2]
				},
				[10405] = {
					"Plague Ghoul", -- [1]
					"Stratholme", -- [2]
				},
				[26694] = {
					"Ymirjar Dusk Shaman", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[150159] = {
					"King Gobbamak", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[14303] = {
					"Petrified Guardian", -- [1]
					"Dire Maul", -- [2]
				},
				[82532] = {
					"Krush", -- [1]
					"Highmaul", -- [2]
				},
				[8910] = {
					"Blazing Fireguard", -- [1]
					"Blackrock Depths", -- [2]
				},
				[93023] = {
					"Siegemaster Mar'tak", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[10381] = {
					"Ravaged Cadaver", -- [1]
					"Stratholme", -- [2]
				},
				[11794] = {
					"Sister of Celebras", -- [1]
					"Maraudon", -- [2]
				},
				[158092] = {
					"Fallen Heartpiercer", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[150160] = {
					"Scrapbone Bully", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[11030] = {
					"Mindless Undead", -- [1]
					"Stratholme", -- [2]
				},
				[79462] = {
					"Blinding Solar Flare", -- [1]
					"Skyreach", -- [2]
				},
				[136665] = {
					"Ashvane Spotter", -- [1]
					"Tol Dagor", -- [2]
				},
				[10383] = {
					"Broken Cadaver", -- [1]
					"Stratholme", -- [2]
				},
				[162764] = {
					"Twisted Appendage", -- [1]
					"Waycrest Manor", -- [2]
				},
				[36565] = {
					"Apothecary Baxter", -- [1]
					"Shadowfang Keep", -- [2]
				},
				[46262] = {
					"Rumbling Earth", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[11458] = {
					"Petrified Treant", -- [1]
					"Dire Maul", -- [2]
				},
				[134041] = {
					"Infected Peasant", -- [1]
					"Waycrest Manor", -- [2]
				},
				[82533] = {
					"Smash", -- [1]
					"Highmaul", -- [2]
				},
				[13141] = {
					"Deeprot Stomper", -- [1]
					"Maraudon", -- [2]
				},
				[46382] = {
					"Petty Criminal", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[10391] = {
					"Skeletal Berserker", -- [1]
					"Stratholme", -- [2]
				},
				[111004] = {
					"Gelatinized Decay", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[11783] = {
					"Theradrim Shardling", -- [1]
					"Maraudon", -- [2]
				},
				[17259] = {
					"Bonechewer Hungerer", -- [1]
					"Hellfire Citadel: Ramparts", -- [2]
				},
				[129214] = {
					"Coin-Operated Crowd Pummeler", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[79463] = {
					"Radiant Supernova", -- [1]
					"Skyreach", -- [2]
				},
				[81638] = {
					"Aqueous Globule", -- [1]
					"The Everbloom", -- [2]
				},
				[133593] = {
					"Expert Technician", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[11784] = {
					"Theradrim Guardian", -- [1]
					"Maraudon", -- [2]
				},
				[135322] = {
					"The Golden Serpent", -- [1]
					"Kings' Rest", -- [2]
				},
				[137625] = {
					"Demolishing Terror", -- [1]
					"Siege of Boralus", -- [2]
				},
				[86372] = {
					"Melded Berserker", -- [1]
					"The Everbloom", -- [2]
				},
				[88589] = {
					"Boar", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[152722] = {
					"Fallen Voidspeaker", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[74583] = {
					"Festering Spiderling", -- [1]
					"Razorfen Downs", -- [2]
				},
				[76306] = {
					"Grand Defense Construct", -- [1]
					"Skyreach", -- [2]
				},
				[81305] = {
					"Fleshrender Nok'gar", -- [1]
					"Iron Docks", -- [2]
				},
				[139790] = {
					"Stag", -- [1]
					"Isle of Conquest", -- [2]
				},
				[137626] = {
					"Demolishing Terror", -- [1]
					"Siege of Boralus", -- [2]
				},
				[17771] = {
					"Murkblood Oracle", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[91648] = {
					"Somber Guardian", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[95614] = {
					"Binder Eloah", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[87780] = {
					"Slagshop Brute", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[81767] = {
					"Bloodmaul Flamespeaker", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[12222] = {
					"Creeping Sludge", -- [1]
					"Maraudon", -- [2]
				},
				[122963] = {
					"Rezan", -- [1]
					"Atal'Dazar", -- [2]
				},
				[129232] = {
					"Mogul Razdunk", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[150165] = {
					"Slime Elemental", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[76266] = {
					"High Sage Viryx", -- [1]
					"Skyreach", -- [2]
				},
				[74347] = {
					"Mordresh Fire Eye", -- [1]
					"Razorfen Downs", -- [2]
				},
				[74475] = {
					"Magmolatus", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[76778] = {
					"Life-Pact Familiar", -- [1]
					"Skyreach", -- [2]
				},
				[93154] = {
					"Gorebound Crone", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[76906] = {
					"Operator Thogar", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[135254] = {
					"Irontide Raider", -- [1]
					"Tol Dagor", -- [2]
				},
				[12216] = {
					"Poison Sprite", -- [1]
					"Maraudon", -- [2]
				},
				[81114] = {
					"Gronnling Laborer", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[53793] = {
					"Harbinger of Flame", -- [1]
					"Firelands", -- [2]
				},
				[105427] = {
					"Skyfury Totem", -- [1]
					"Isle of Conquest", -- [2]
				},
				[130896] = {
					"Blackout Barrel", -- [1]
					"Freehold", -- [2]
				},
				[129517] = {
					"Reanimated Raptor", -- [1]
					"Atal'Dazar", -- [2]
				},
				[78932] = {
					"Driving Gale-Caller", -- [1]
					"Skyreach", -- [2]
				},
				[76444] = {
					"Subjugated Soul", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[127479] = {
					"The Sand Queen", -- [1]
					"Tol Dagor", -- [2]
				},
				[113113] = {
					"Essence of Nightmare", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[123476] = {
					"Hulking Demolisher", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[53630] = {
					"Unstable Pyrelord", -- [1]
					"Firelands", -- [2]
				},
				[53694] = {
					"Riplimb", -- [1]
					"Firelands", -- [2]
				},
				[156818] = {
					"Wrathion", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[13599] = {
					"Stolid Snapjaw", -- [1]
					"Maraudon", -- [2]
				},
				[10409] = {
					"Rockwing Screecher", -- [1]
					"Stratholme", -- [2]
				},
				[150168] = {
					"Toxic Monstrosity", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[76376] = {
					"Skyreach Arcanologist", -- [1]
					"Skyreach", -- [2]
				},
				[79466] = {
					"Initiate of the Rising Sun", -- [1]
					"Skyreach", -- [2]
				},
				[417] = {
					"Khuunam", -- [1]
					"Isle of Conquest", -- [2]
				},
				[87910] = {
					"Gorian Rune-Mender", -- [1]
					"Highmaul", -- [2]
				},
				[49826] = {
					"Bound Rumbler", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[139422] = {
					"Scaled Krolusk Tamer", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[100576] = {
					"Nightmare Image", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[42180] = {
					"Toxitron", -- [1]
					"Blackwing Descent", -- [2]
				},
				[137940] = {
					"Safety Shark", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[74349] = {
					"Bloodmaul Magma Binder", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[94947] = {
					"Fel-Starved Trainee", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[43127] = {
					"Spirit of Ironstar", -- [1]
					"Blackwing Descent", -- [2]
				},
				[93156] = {
					"Eredar Faithbreaker", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[135329] = {
					"Matron Bryndle", -- [1]
					"Waycrest Manor", -- [2]
				},
				[94861] = {
					"Grim Ambusher", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[76806] = {
					"Heart of the Mountain", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[10697] = {
					"Bile Slime", -- [1]
					"Stratholme", -- [2]
				},
				[79467] = {
					"Adept of the Dawn", -- [1]
					"Skyreach", -- [2]
				},
				[53119] = {
					"Flamewaker Forward Guard", -- [1]
					"Firelands", -- [2]
				},
				[152833] = {
					"Azerite Giant", -- [1]
					"The Maelstrom - Heart of Azeroth", -- [2]
				},
				[80400] = {
					"Iron Assembly Warden", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[86611] = {
					"Mind Fungus", -- [1]
					"Highmaul", -- [2]
				},
				[24207] = {
					"Army of the Dead", -- [1]
					"Isle of Conquest", -- [2]
				},
				[76141] = {
					"Araknath", -- [1]
					"Skyreach", -- [2]
				},
				[144286] = {
					"Asset Manager", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[123478] = {
					"Antoran Felguard", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[53631] = {
					"Cinderweb Spiderling", -- [1]
					"Firelands", -- [2]
				},
				[84841] = {
					"Iron Dockworker", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[80875] = {
					"Bombsquad", -- [1]
					"Iron Docks", -- [2]
				},
				[139425] = {
					"Crazed Incubator", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[45699] = {
					"Twilight Shadow Mender", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[158452] = {
					"Mindtwist Tendril", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[54015] = {
					"Majordomo Staghelm", -- [1]
					"Firelands", -- [2]
				},
				[8922] = {
					"Bloodhound Mastiff", -- [1]
					"Blackrock Depths", -- [2]
				},
				[54143] = {
					"Molten Flamefather", -- [1]
					"Firelands", -- [2]
				},
				[53695] = {
					"Rageface", -- [1]
					"Firelands", -- [2]
				},
				[79852] = {
					"Oshir", -- [1]
					"Iron Docks", -- [2]
				},
				[122967] = {
					"Priestess Alun'za", -- [1]
					"Atal'Dazar", -- [2]
				},
				[44164] = {
					"Raptor", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[82519] = {
					"Highmaul Conscript", -- [1]
					"Highmaul", -- [2]
				},
				[94693] = {
					"Siegeworks Technician", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[92039] = {
					"Bleeding Grunt", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[152988] = {
					"Faceless Shadowcaller", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[36296] = {
					"Apothecary Hummel", -- [1]
					"Shadowfang Keep", -- [2]
				},
				[157594] = {
					"Lesser Void Elemental", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[151659] = {
					"Rocket Tonk", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[135231] = {
					"Spectral Brute", -- [1]
					"Kings' Rest", -- [2]
				},
				[76307] = {
					"Grand Defense Construct", -- [1]
					"Skyreach", -- [2]
				},
				[154524] = {
					"K'thir Mindcarver", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[79469] = {
					"Whirling Dervish", -- [1]
					"Skyreach", -- [2]
				},
				[53120] = {
					"Flamewaker Pathfinder", -- [1]
					"Firelands", -- [2]
				},
				[53087] = {
					"Right Foot", -- [1]
					"Firelands", -- [2]
				},
				[61412] = {
					"Dark Shaman Koranthal", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[122968] = {
					"Yazma", -- [1]
					"Atal'Dazar", -- [2]
				},
				[92391] = {
					"Gorebound Bloodletter", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[76143] = {
					"Rukhran", -- [1]
					"Skyreach", -- [2]
				},
				[127490] = {
					"Knight Captain Valyri", -- [1]
					"Tol Dagor", -- [2]
				},
				[130436] = {
					"Off-Duty Laborer", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[74480] = {
					"Splinterbone Shadowcaster", -- [1]
					"Razorfen Downs", -- [2]
				},
				[137029] = {
					"Ordnance Specialist", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[69078] = {
					"Sul the Sandcrawler", -- [1]
					"Throne of Thunder", -- [2]
				},
				[76884] = {
					"Cruelfang", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[45700] = {
					"Twilight Portal Shaper", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[17517] = {
					"Hellfire Sentry", -- [1]
					"Hellfire Citadel: Ramparts", -- [2]
				},
				[152479] = {
					"Void-Twisted Whelp", -- [1]
					"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
				},
				[53185] = {
					"Flamewaker Overseer", -- [1]
					"Firelands", -- [2]
				},
				[151658] = {
					"Strider Tonk", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[158056] = {
					"Rat", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[135761] = {
					"Thundering Totem", -- [1]
					"Kings' Rest", -- [2]
				},
				[122969] = {
					"Zanchuli Witch-Doctor", -- [1]
					"Atal'Dazar", -- [2]
				},
				[144246] = {
					"K.U.-J.0.", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[129366] = {
					"Bilge Rat Buccaneer", -- [1]
					"Siege of Boralus", -- [2]
				},
				[127480] = {
					"Stinging Parasite", -- [1]
					"Tol Dagor", -- [2]
				},
				[87448] = {
					"Ironworker", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[76309] = {
					"Grand Defense Construct", -- [1]
					"Skyreach", -- [2]
				},
				[81297] = {
					"Dreadfang", -- [1]
					"Iron Docks", -- [2]
				},
				[92514] = {
					"Shao'ghun", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[153760] = {
					"Enthralled Footman", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[44687] = {
					"Proto-Behemoth", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[150253] = {
					"Weaponized Crawler", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[144293] = {
					"Waste Processing Unit", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[61245] = {
					"Capacitor Totem", -- [1]
					"Isle of Conquest", -- [2]
				},
				[53121] = {
					"Flamewaker Cauterizer", -- [1]
					"Firelands", -- [2]
				},
				[161437] = {
					"Explosive Scarab", -- [1]
					"Kings' Rest", -- [2]
				},
				[94563] = {
					"Gorebound Fanatic", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[122970] = {
					"Shadowblade Stalker", -- [1]
					"Atal'Dazar", -- [2]
				},
				[94816] = {
					"Togdrov", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[129367] = {
					"Bilge Rat Tempest", -- [1]
					"Siege of Boralus", -- [2]
				},
				[144294] = {
					"Mechagon Tinkerer", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[144160] = {
					"Chopper Redhook", -- [1]
					"Siege of Boralus", -- [2]
				},
				[46083] = {
					"Drakeadon Mongrel", -- [1]
					"Blackwing Descent", -- [2]
				},
				[87619] = {
					"Gorian Warden", -- [1]
					"Highmaul", -- [2]
				},
				[78832] = {
					"Grom'kar Man-at-Arms", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[76267] = {
					"Solar Zealot", -- [1]
					"Skyreach", -- [2]
				},
				[152835] = {
					"Crystalized Azerite", -- [1]
					"The Maelstrom - Heart of Azeroth", -- [2]
				},
				[8477] = {
					"Skeletal Servant", -- [1]
					"Stratholme", -- [2]
				},
				[144295] = {
					"Mechagon Mechanic", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[74483] = {
					"Death's Head Arachnomancer", -- [1]
					"Razorfen Downs", -- [2]
				},
				[75506] = {
					"Shadowmoon Loyalist", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[29735] = {
					"Savage Worg", -- [1]
					"Utgarde Keep", -- [2]
				},
				[94185] = {
					"Vanguard Akkelion", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[122971] = {
					"Dazar'ai Juggernaut", -- [1]
					"Atal'Dazar", -- [2]
				},
				[156577] = {
					"Therum Deepforge", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[139946] = {
					"Heart Guardian", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[94697] = {
					"Siegeworks Technician", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[74355] = {
					"Captured Miner", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[121564] = {
					"Stagatha", -- [1]
					"Waycrest Manor", -- [2]
				},
				[85225] = {
					"Gorian Sorcerer", -- [1]
					"Highmaul", -- [2]
				},
				[93162] = {
					"Umbral Supplicant", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[53222] = {
					"Flamewaker Centurion", -- [1]
					"Firelands", -- [2]
				},
				[12201] = {
					"Princess Theradras", -- [1]
					"Maraudon", -- [2]
				},
				[12217] = {
					"Corruptor", -- [1]
					"Maraudon", -- [2]
				},
				[84399] = {
					"Vicious Mandragora", -- [1]
					"The Everbloom", -- [2]
				},
				[10412] = {
					"Crypt Crawler", -- [1]
					"Stratholme", -- [2]
				},
				[83025] = {
					"Grom'kar Battlemaster", -- [1]
					"Iron Docks", -- [2]
				},
				[129369] = {
					"Irontide Raider", -- [1]
					"Siege of Boralus", -- [2]
				},
				[83390] = {
					"Thunderlord Wrangler", -- [1]
					"Iron Docks", -- [2]
				},
				[122972] = {
					"Dazar'ai Augur", -- [1]
					"Atal'Dazar", -- [2]
				},
				[87989] = {
					"Forgemistress Flamehand", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[92523] = {
					"Vazeel'fazag", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[144298] = {
					"Defense Bot Mk III", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[74356] = {
					"Captured Miner", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[143985] = {
					"Absorb-o-Tron", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[144299] = {
					"Workshop Defender", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[53635] = {
					"Cinderweb Drone", -- [1]
					"Firelands", -- [2]
				},
				[41378] = {
					"Maloriak", -- [1]
					"Blackwing Descent", -- [2]
				},
				[41442] = {
					"Atramedes", -- [1]
					"Blackwing Descent", -- [2]
				},
				[139949] = {
					"Plague Doctor", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[3636] = {
					"Deviate Ravager", -- [1]
					"Wailing Caverns", -- [2]
				},
				[3640] = {
					"Evolving Ectoplasm", -- [1]
					"Wailing Caverns", -- [2]
				},
				[93931] = {
					"Gorebound Felcaster", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[129550] = {
					"Bilge Rat Padfoot", -- [1]
					"Freehold", -- [2]
				},
				[163746] = {
					"Walkie Shockie X1", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[144296] = {
					"Spider Tank", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[92526] = {
					"Zerik'shekor", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[129370] = {
					"Irontide Waveshaper", -- [1]
					"Siege of Boralus", -- [2]
				},
				[144300] = {
					"Mechagon Citizen", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[74357] = {
					"Captured Miner", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[132530] = {
					"Kul Tiran Vanguard", -- [1]
					"Siege of Boralus", -- [2]
				},
				[3680] = {
					"Serpentbloom Snake", -- [1]
					"Wailing Caverns", -- [2]
				},
				[43735] = {
					"Elementium Monstrosity", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[81522] = {
					"Witherbark", -- [1]
					"The Everbloom", -- [2]
				},
				[151579] = {
					"Shield Generator", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[12203] = {
					"Landslide", -- [1]
					"Maraudon", -- [2]
				},
				[144301] = {
					"Living Waste", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[77428] = {
					"Imperator Mar'gok", -- [1]
					"Highmaul", -- [2]
				},
				[75509] = {
					"Sadana Bloodfury", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[53187] = {
					"Flamewaker Animator", -- [1]
					"Firelands", -- [2]
				},
				[130435] = {
					"Addled Thug", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[130024] = {
					"Soggy Shiprat", -- [1]
					"Freehold", -- [2]
				},
				[86256] = {
					"Gorian High Sorcerer", -- [1]
					"Highmaul", -- [2]
				},
				[129371] = {
					"Riptide Shredder", -- [1]
					"Siege of Boralus", -- [2]
				},
				[91241] = {
					"Doom Lord", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[83697] = {
					"Grom'kar Deckhand", -- [1]
					"Iron Docks", -- [2]
				},
				[74486] = {
					"Freezing Spirit", -- [1]
					"Razorfen Downs", -- [2]
				},
				[129640] = {
					"Snarling Dockhound", -- [1]
					"Siege of Boralus", -- [2]
				},
				[130011] = {
					"Irontide Buccaneer", -- [1]
					"Freehold", -- [2]
				},
				[130522] = {
					"Freehold Shipmate", -- [1]
					"Freehold", -- [2]
				},
				[45703] = {
					"Faceless Minion", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[75451] = {
					"Defiled Spirit", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[144303] = {
					"G.U.A.R.D.", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[3671] = {
					"Lady Anacondra", -- [1]
					"Wailing Caverns", -- [2]
				},
				[77557] = {
					"Admiral Gar'an", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[81779] = {
					"Ogron Mauler", -- [1]
					"Highmaul", -- [2]
				},
				[92142] = {
					"Blademaster Jubei'thos", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[61056] = {
					"Primal Earth Elemental", -- [1]
					"Isle of Conquest", -- [2]
				},
				[24078] = {
					"Dragonflayer Metalworker", -- [1]
					"Utgarde Keep", -- [2]
				},
				[129372] = {
					"Blacktar Bomber", -- [1]
					"Siege of Boralus", -- [2]
				},
				[34793] = {
					"Catapult", -- [1]
					"Isle of Conquest", -- [2]
				},
				[53134] = {
					"Ancient Core Hound", -- [1]
					"Firelands", -- [2]
				},
				[111333] = {
					"Taintheart Trickster", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[141565] = {
					"Kul Tiran Footman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[130012] = {
					"Irontide Ravager", -- [1]
					"Freehold", -- [2]
				},
				[3840] = {
					"Druid of the Fang", -- [1]
					"Wailing Caverns", -- [2]
				},
				[79093] = {
					"Skyreach Sun Talon", -- [1]
					"Skyreach", -- [2]
				},
				[150190] = {
					"HK-8 Aerial Oppression Unit", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[144071] = {
					"Irontide Waveshaper", -- [1]
					"Siege of Boralus", -- [2]
				},
				[152718] = {
					"Alleria Windrunner", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[88818] = {
					"Security Guard", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[53188] = {
					"Flamewaker Subjugator", -- [1]
					"Firelands", -- [2]
				},
				[150295] = {
					"Tank Buster MK1", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[135192] = {
					"Honored Raptor", -- [1]
					"Kings' Rest", -- [2]
				},
				[80822] = {
					"Night-Twisted Berserker", -- [1]
					"Highmaul", -- [2]
				},
				[92527] = {
					"Dag'gorath", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[70276] = {
					"No'ku Stormsayer", -- [1]
					"Throne of Thunder", -- [2]
				},
				[76407] = {
					"Ner'zhul", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[92911] = {
					"Hulking Berserker", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[135846] = {
					"Sand-Crusted Striker", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[75975] = {
					"Skyreach Overlord", -- [1]
					"Skyreach", -- [2]
				},
				[93295] = {
					"Darkcaster Adept", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[157700] = {
					"Agustus Moulaine", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[81269] = {
					"Warden Thul'tok", -- [1]
					"Highmaul", -- [2]
				},
				[74490] = {
					"Boneflayer Ghoul", -- [1]
					"Razorfen Downs", -- [2]
				},
				[130653] = {
					"Wanton Sapper", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[77559] = {
					"Solar Magnifier", -- [1]
					"Skyreach", -- [2]
				},
				[77687] = {
					"Grom'kar Man-at-Arms", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[92144] = {
					"Dia Darkwhisper", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[129373] = {
					"Dockhound Packmaster", -- [1]
					"Siege of Boralus", -- [2]
				},
				[83623] = {
					"Bloodmaul Warder", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[44600] = {
					"Halfus Wyrmbreaker", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[76865] = {
					"Beastlord Darmac", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[127315] = {
					"Reanimation Totem", -- [1]
					"Atal'Dazar", -- [2]
				},
				[78583] = {
					"Dominator Turret", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[68476] = {
					"Horridon", -- [1]
					"Throne of Thunder", -- [2]
				},
				[158478] = {
					"Corruption Tumor", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[135048] = {
					"Gorestained Piglet", -- [1]
					"Waycrest Manor", -- [2]
				},
				[157811] = {
					"Lilliam Sparkspindle", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[81270] = {
					"Gorian Guardsman", -- [1]
					"Highmaul", -- [2]
				},
				[118244] = {
					"Spirit Beast", -- [1]
					"Isle of Conquest", -- [2]
				},
				[133389] = {
					"Galvazzt", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[85748] = {
					"Iron Mauler", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[137473] = {
					"Guard Captain Atu", -- [1]
					"Kings' Rest", -- [2]
				},
				[69131] = {
					"Frost King Malakk", -- [1]
					"Throne of Thunder", -- [2]
				},
				[17455] = {
					"Bonechewer Beastmaster", -- [1]
					"Hellfire Citadel: Ramparts", -- [2]
				},
				[138369] = {
					"Footbomb Hooligan", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[150195] = {
					"Gnome-Eating Slime", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[74875] = {
					"Death Speaker Blackthorn", -- [1]
					"Razorfen Downs", -- [2]
				},
				[134331] = {
					"King Rahu'ai", -- [1]
					"Kings' Rest", -- [2]
				},
				[92913] = {
					"Gorebound Berserker", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[135258] = {
					"Irontide Marauder", -- [1]
					"Siege of Boralus", -- [2]
				},
				[133384] = {
					"Merektha", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[53167] = {
					"Unbound Pyrelord", -- [1]
					"Firelands", -- [2]
				},
				[27978] = {
					"Sjonnir The Ironshaper", -- [1]
					"Halls of Stone", -- [2]
				},
				[132532] = {
					"Kul Tiran Marksman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[135975] = {
					"Off-Duty Laborer", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[130655] = {
					"Bobby Howlis", -- [1]
					"Tol Dagor", -- [2]
				},
				[17871] = {
					"Underbog Shambler", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[130661] = {
					"Venture Co. Earthshaper", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[92146] = {
					"Gurtogg Bloodboil", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[82039] = {
					"Rockspine Stinger", -- [1]
					"The Everbloom", -- [2]
				},
				[152836] = {
					"Azerite Borer", -- [1]
					"The Maelstrom - Heart of Azeroth", -- [2]
				},
				[76154] = {
					"Skyreach Raven Whisperer", -- [1]
					"Skyreach", -- [2]
				},
				[41918] = {
					"Animated Bone Warrior", -- [1]
					"Blackwing Descent", -- [2]
				},
				[76814] = {
					"Flamebender Ka'graz", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[88820] = {
					"Furnace Engineer", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[52530] = {
					"Alysrazor", -- [1]
					"Firelands", -- [2]
				},
				[137233] = {
					"Plague Toad", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[93298] = {
					"Shadowheart Fiend", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[127757] = {
					"Reanimated Honor Guard", -- [1]
					"Atal'Dazar", -- [2]
				},
				[130400] = {
					"Irontide Crusher", -- [1]
					"Freehold", -- [2]
				},
				[153022] = {
					"Snang", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[135971] = {
					"Faithless Conscript", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[43122] = {
					"Spirit of Corehammer", -- [1]
					"Blackwing Descent", -- [2]
				},
				[94832] = {
					"Gorebound Assassin", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[45687] = {
					"Twilight-Shifter", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[75899] = {
					"Possessed Soul", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[135366] = {
					"Blacktooth Arsonist", -- [1]
					"Tol Dagor", -- [2]
				},
				[53140] = {
					"Son of Flame", -- [1]
					"Firelands", -- [2]
				},
				[75715] = {
					"Reanimated Ritual Bones", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[74492] = {
					"Bubonic Geist", -- [1]
					"Razorfen Downs", -- [2]
				},
				[88821] = {
					"Bellows Operator", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[78714] = {
					"Kargath Bladefist", -- [1]
					"Highmaul", -- [2]
				},
				[84983] = {
					"Spore Image", -- [1]
					"The Everbloom", -- [2]
				},
				[127482] = {
					"Sewer Vicejaw", -- [1]
					"Tol Dagor", -- [2]
				},
				[135470] = {
					"Aka'ali the Conqueror", -- [1]
					"Kings' Rest", -- [2]
				},
				[95602] = {
					"Mystic Velruun", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[77182] = {
					"Oregorger", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[150712] = {
					"Trixie Tazer", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[153401] = {
					"K'thir Dominator", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[130521] = {
					"Freehold Deckhand", -- [1]
					"Freehold", -- [2]
				},
				[134174] = {
					"Shadow-Borne Witch Doctor", -- [1]
					"Kings' Rest", -- [2]
				},
				[53639] = {
					"Flamewaker Cauterizer", -- [1]
					"Firelands", -- [2]
				},
				[95280] = {
					"Kaz'rogal", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[90485] = {
					"Felfire Artillery", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[52498] = {
					"Beth'tilac", -- [1]
					"Firelands", -- [2]
				},
				[131847] = {
					"Waycrest Reveler", -- [1]
					"Waycrest Manor", -- [2]
				},
				[48521] = {
					"Defias Squallshaper", -- [1]
					"Deadmines", -- [2]
				},
				[134599] = {
					"Imbued Stormcaller", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[84984] = {
					"Spore Image", -- [1]
					"The Everbloom", -- [2]
				},
				[78077] = {
					"Volatile Anomaly", -- [1]
					"Highmaul", -- [2]
				},
				[135699] = {
					"Ashvane Jailer", -- [1]
					"Tol Dagor", -- [2]
				},
				[17264] = {
					"Bonechewer Ravener", -- [1]
					"Hellfire Citadel: Ramparts", -- [2]
				},
				[42764] = {
					"Pyrecraw", -- [1]
					"Blackwing Descent", -- [2]
				},
				[95408] = {
					"Anetheron", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[53127] = {
					"Fire Scorpion", -- [1]
					"Firelands", -- [2]
				},
				[77692] = {
					"Kromog", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[86072] = {
					"Oro", -- [1]
					"Highmaul", -- [2]
				},
				[80708] = {
					"Iron Taskmaster", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[93813] = {
					"Contracted Engineer", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[85241] = {
					"Night-Twisted Brute", -- [1]
					"Highmaul", -- [2]
				},
				[150276] = {
					"Heavy Scrapbot", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[74366] = {
					"Forgemaster Gog'duh", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[82682] = {
					"Archmage Sol", -- [1]
					"The Everbloom", -- [2]
				},
				[80423] = {
					"Thunderlord Beast-Tender", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[84985] = {
					"Spore Image", -- [1]
					"The Everbloom", -- [2]
				},
				[43324] = {
					"Cho'gall", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[160183] = {
					"Void Fanatic", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[53575] = {
					"Lava Wielder", -- [1]
					"Firelands", -- [2]
				},
				[127503] = {
					"Overseer Korgus", -- [1]
					"Tol Dagor", -- [2]
				},
				[83578] = {
					"Ogron Laborer", -- [1]
					"Iron Docks", -- [2]
				},
				[136643] = {
					"Azerite Extractor", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[127497] = {
					"Ashvane Warden", -- [1]
					"Tol Dagor", -- [2]
				},
				[41376] = {
					"Nefarian", -- [1]
					"Blackwing Descent", -- [2]
				},
				[95603] = {
					"Mystic Aaran", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[48266] = {
					"Defias Cannon", -- [1]
					"Deadmines", -- [2]
				},
				[75713] = {
					"Shadowmoon Bone-Mender", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[93615] = {
					"Felborne Overfiend", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[131849] = {
					"Crazed Marksman", -- [1]
					"Waycrest Manor", -- [2]
				},
				[48522] = {
					"Defias Pirate", -- [1]
					"Deadmines", -- [2]
				},
				[45872] = {
					"Rohash", -- [1]
					"Throne of the Four Winds", -- [2]
				},
				[60932] = {
					"ash", -- [1]
					"Isle of Conquest", -- [2]
				},
				[135365] = {
					"Matron Alma", -- [1]
					"Waycrest Manor", -- [2]
				},
				[131527] = {
					"Lord Waycrest", -- [1]
					"Waycrest Manor", -- [2]
				},
				[130404] = {
					"Vermin Trapper", -- [1]
					"Freehold", -- [2]
				},
				[81985] = {
					"Everbloom Tender", -- [1]
					"The Everbloom", -- [2]
				},
				[58959] = {
					"Piptoc", -- [1]
					"Isle of Conquest", -- [2]
				},
				[53128] = {
					"Giant Fire Scorpion", -- [1]
					"Firelands", -- [2]
				},
				[76310] = {
					"Grand Defense Construct", -- [1]
					"Skyreach", -- [2]
				},
				[151798] = {
					"Vexiona", -- [1]
					"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
				},
				[151742] = {
					"Void-Twisted Invader", -- [1]
					"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
				},
				[129552] = {
					"Monzumi", -- [1]
					"Atal'Dazar", -- [2]
				},
				[137405] = {
					"Gripping Terror", -- [1]
					"Siege of Boralus", -- [2]
				},
				[89011] = {
					"Rylak Skyterror", -- [1]
					"Iron Docks", -- [2]
				},
				[129231] = {
					"Rixxa Fluxflame", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[53640] = {
					"Flamewaker Sentinel", -- [1]
					"Firelands", -- [2]
				},
				[84859] = {
					"Iron Cleaver", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[81272] = {
					"Gorian Runemaster", -- [1]
					"Highmaul", -- [2]
				},
				[93303] = {
					"Slavering Hound", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[53619] = {
					"Druid of the Flame", -- [1]
					"Firelands", -- [2]
				},
				[131785] = {
					"Buzzing Drone", -- [1]
					"Tol Dagor", -- [2]
				},
				[132491] = {
					"Kul Tiran Marksman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[136391] = {
					"Heart Guardian", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[134600] = {
					"Sandswept Marksman", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[76104] = {
					"Monstrous Corpse Spider", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[76094] = {
					"Sun Trinket", -- [1]
					"Skyreach", -- [2]
				},
				[134157] = {
					"Shadow-Borne Warrior", -- [1]
					"Kings' Rest", -- [2]
				},
				[155094] = {
					"Mechagon Trooper", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[76146] = {
					"Grand Defense Construct", -- [1]
					"Skyreach", -- [2]
				},
				[129547] = {
					"Blacktooth Knuckleduster", -- [1]
					"Freehold", -- [2]
				},
				[130437] = {
					"Mine Rat", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[141495] = {
					"Kul Tiran Footman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[84860] = {
					"Iron Earthbinder", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[54445] = {
					"Echo of Jaina", -- [1]
					"End Time", -- [2]
				},
				[87411] = {
					"Workshop Guardian", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[54920] = {
					"Infinite Suppressor", -- [1]
					"End Time", -- [2]
				},
				[84978] = {
					"Bloodmaul Enforcer", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[111858] = {
					"Guardian Rurson", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[74489] = {
					"Thorn Eater Ghoul", -- [1]
					"Razorfen Downs", -- [2]
				},
				[134602] = {
					"Shrouded Fang", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[133379] = {
					"Adderis", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[69455] = {
					"Zandalari Water-Binder", -- [1]
					"Throne of Thunder", -- [2]
				},
				[129758] = {
					"Irontide Grenadier", -- [1]
					"Freehold", -- [2]
				},
				[76102] = {
					"Air Familiar", -- [1]
					"Skyreach", -- [2]
				},
				[45261] = {
					"Twilight Shadow Knight", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[53141] = {
					"Molten Surger", -- [1]
					"Firelands", -- [2]
				},
				[19632] = {
					"Lykul Stinger", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[122965] = {
					"Vol'kaal", -- [1]
					"Atal'Dazar", -- [2]
				},
				[74488] = {
					"Frozen Soul", -- [1]
					"Razorfen Downs", -- [2]
				},
				[84989] = {
					"Infested Icecaller", -- [1]
					"The Everbloom", -- [2]
				},
				[42649] = {
					"Drakonid Chainwielder", -- [1]
					"Blackwing Descent", -- [2]
				},
				[111856] = {
					"Guardian Gorroc", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[81279] = {
					"Grom'kar Flameslinger", -- [1]
					"Iron Docks", -- [2]
				},
				[136139] = {
					"Mechanized Peacekeeper", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[137487] = {
					"Skeletal Hunting Raptor", -- [1]
					"Kings' Rest", -- [2]
				},
				[150169] = {
					"Toxic Lurker", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[95813] = {
					"Weaponlord Mehlkhior", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[26125] = {
					"Battaker", -- [1]
					"Isle of Conquest", -- [2]
				},
				[128455] = {
					"T'lonja", -- [1]
					"Atal'Dazar", -- [2]
				},
				[48049] = {
					"Twilight Whelp", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[74927] = {
					"Unstable Slag", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[138019] = {
					"Kul Tiran Vanguard", -- [1]
					"Siege of Boralus", -- [2]
				},
				[74371] = {
					"Splinterbone Captain", -- [1]
					"Razorfen Downs", -- [2]
				},
				[81780] = {
					"Guard Captain Thag", -- [1]
					"Highmaul", -- [2]
				},
				[159425] = {
					"Occult Shadowmender", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[84990] = {
					"Addled Arcanomancer", -- [1]
					"The Everbloom", -- [2]
				},
				[75209] = {
					"Molten Earth Elemental", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[158146] = {
					"Fallen Riftwalker", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[44999] = {
					"Shen'dralar Watcher", -- [1]
					"Dire Maul", -- [2]
				},
				[42767] = {
					"Ivoroc", -- [1]
					"Blackwing Descent", -- [2]
				},
				[119990] = {
					"Wolf", -- [1]
					"Isle of Conquest", -- [2]
				},
				[135759] = {
					"Earthwall Totem", -- [1]
					"Kings' Rest", -- [2]
				},
				[136330] = {
					"Soul Thorns", -- [1]
					"Waycrest Manor", -- [2]
				},
				[152987] = {
					"Faceless Willbreaker", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[26669] = {
					"Ymirjar Savage", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[161895] = {
					"Thing From Beyond", -- [1]
					"Tol Dagor", -- [2]
				},
				[140447] = {
					"Demolishing Terror", -- [1]
					"Siege of Boralus", -- [2]
				},
				[86526] = {
					"Grom'kar Chainmaster", -- [1]
					"Iron Docks", -- [2]
				},
				[135240] = {
					"Soul Essence", -- [1]
					"Waycrest Manor", -- [2]
				},
				[53642] = {
					"Cinderweb Spinner", -- [1]
					"Firelands", -- [2]
				},
				[26861] = {
					"King Ymiron", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[130025] = {
					"Irontide Thug", -- [1]
					"Tol Dagor", -- [2]
				},
				[78978] = {
					"Darkshard Gnasher", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[93435] = {
					"Felfire Transporter", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[137517] = {
					"Ashvane Destroyer", -- [1]
					"Siege of Boralus", -- [2]
				},
				[47086] = {
					"Crimsonborne Firestarter", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[94733] = {
					"Felfire Demolisher", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[138247] = {
					"Irontide Marauder", -- [1]
					"Siege of Boralus", -- [2]
				},
				[75652] = {
					"Void Spawn", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[69639] = {
					"Humming Crystal", -- [1]
					"Throne of Thunder", -- [2]
				},
				[151752] = {
					"Voidswarm", -- [1]
					"Emerald Dream - HoA Scenario", -- [2]
				},
				[151836] = {
					"Void Horror", -- [1]
					"Emerald Dream - HoA Scenario", -- [2]
				},
				[82528] = {
					"Gorian Arcanist", -- [1]
					"Highmaul", -- [2]
				},
				[76292] = {
					"Skyreach Shield Construct", -- [1]
					"Skyreach", -- [2]
				},
				[7343] = {
					"Splinterbone Skeleton", -- [1]
					"Razorfen Downs", -- [2]
				},
				[135474] = {
					"Thistle Acolyte", -- [1]
					"Waycrest Manor", -- [2]
				},
				[154744] = {
					"Toxic Monstrosity", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[130026] = {
					"Bilge Rat Seaspeaker", -- [1]
					"Tol Dagor", -- [2]
				},
				[93308] = {
					"Portal Guardian", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[152009] = {
					"Malfunctioning Scrapbot", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[92330] = {
					"Soul of Socrethar", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[42768] = {
					"Maimgor", -- [1]
					"Blackwing Descent", -- [2]
				},
				[48415] = {
					"Twilight Spitecaller", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[153755] = {
					"Naeno Megacrash", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[77700] = {
					"Shadowmoon Exhumer", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[102392] = {
					"Resonance Totem", -- [1]
					"Isle of Conquest", -- [2]
				},
				[151754] = {
					"Void Haunt", -- [1]
					"Emerald Dream - HoA Scenario", -- [2]
				},
				[95652] = {
					"Grand Corruptor U'rogg", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[67977] = {
					"Tortos", -- [1]
					"Throne of Thunder", -- [2]
				},
				[93952] = {
					"Fel Raven", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[137969] = {
					"Interment Construct", -- [1]
					"Kings' Rest", -- [2]
				},
				[137989] = {
					"Embalming Fluid", -- [1]
					"Kings' Rest", -- [2]
				},
				[10876] = {
					"Undead Scarab", -- [1]
					"Stratholme", -- [2]
				},
				[130027] = {
					"Ashvane Marine", -- [1]
					"Tol Dagor", -- [2]
				},
				[151755] = {
					"Shadehound", -- [1]
					"Emerald Dream - HoA Scenario", -- [2]
				},
				[27981] = {
					"Malformed Ooze", -- [1]
					"Halls of Stone", -- [2]
				},
				[81283] = {
					"Grom'kar Footsoldier", -- [1]
					"Iron Docks", -- [2]
				},
				[91646] = {
					"Grim Collaborator", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[74579] = {
					"Molten Elemental", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[69916] = {
					"Gurubashi Berserker", -- [1]
					"Throne of Thunder", -- [2]
				},
				[76815] = {
					"Primal Elementalist", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[24079] = {
					"Dragonflayer Forge Master", -- [1]
					"Utgarde Keep", -- [2]
				},
				[90409] = {
					"Gorebound Felcaster", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[24201] = {
					"Dalronn the Controller", -- [1]
					"Utgarde Keep", -- [2]
				},
				[45267] = {
					"Twilight Phase-Twister", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[70153] = {
					"Fungal Growth", -- [1]
					"Throne of Thunder", -- [2]
				},
				[74478] = {
					"Death's Head Shadowmender", -- [1]
					"Razorfen Downs", -- [2]
				},
				[81806] = {
					"Gorian Royal Guardsman", -- [1]
					"Highmaul", -- [2]
				},
				[90272] = {
					"Ancient Sovereign", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[130028] = {
					"Ashvane Priest", -- [1]
					"Tol Dagor", -- [2]
				},
				[92041] = {
					"Bleeding Darkcaster", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[54923] = {
					"Infinite Warden", -- [1]
					"End Time", -- [2]
				},
				[95613] = {
					"Binder Hallaani", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[70236] = {
					"Zandalari Storm-Caller", -- [1]
					"Throne of Thunder", -- [2]
				},
				[86684] = {
					"Feral Lasher", -- [1]
					"The Everbloom", -- [2]
				},
				[153141] = {
					"Endless Hunger Totem", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[20465] = {
					"Underbog Frenzy", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[13323] = {
					"Subterranean Diemetradon", -- [1]
					"Maraudon", -- [2]
				},
				[26670] = {
					"Ymirjar Flesh Hunter", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[46254] = {
					"Hogger", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[45264] = {
					"Twilight Crossfire", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[132056] = {
					"Venture Co. Skyscorcher", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[61657] = {
					"Adolescent Flame Hound", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[86275] = {
					"Gorian Enforcer", -- [1]
					"Highmaul", -- [2]
				},
				[131670] = {
					"Heartsbane Vinetwister", -- [1]
					"Waycrest Manor", -- [2]
				},
				[80048] = {
					"Vul'gor", -- [1]
					"Highmaul", -- [2]
				},
				[1860] = {
					"Jhazdok", -- [1]
					"Isle of Conquest", -- [2]
				},
				[131545] = {
					"Lady Waycrest", -- [1]
					"Waycrest Manor", -- [2]
				},
				[91520] = {
					"Adjunct Kuroh", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[75272] = {
					"Bloodmaul Ogre Mage", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[128652] = {
					"Viq'Goth", -- [1]
					"Siege of Boralus", -- [2]
				},
				[134616] = {
					"Krolusk Pup", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[69792] = {
					"Xuenray", -- [1]
					"Isle of Conquest", -- [2]
				},
				[79208] = {
					"Blackrock Enforcer", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[12236] = {
					"Lord Vyletongue", -- [1]
					"Maraudon", -- [2]
				},
				[69899] = {
					"Farraki Sand Conjurer", -- [1]
					"Throne of Thunder", -- [2]
				},
				[10400] = {
					"Thuzadin Necromancer", -- [1]
					"Stratholme", -- [2]
				},
				[150251] = {
					"Pistonhead Mechanic", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[82534] = {
					"Spike", -- [1]
					"Highmaul", -- [2]
				},
				[134617] = {
					"Krolusk Hatchling", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[126928] = {
					"Irontide Corsair", -- [1]
					"Freehold", -- [2]
				},
				[12221] = {
					"Noxious Slime", -- [1]
					"Maraudon", -- [2]
				},
				[53115] = {
					"Molten Lord", -- [1]
					"Firelands", -- [2]
				},
				[158158] = {
					"Forge-Guard Hurrul", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[91521] = {
					"Vindicator Bramu", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[69132] = {
					"High Priestess Mar'li", -- [1]
					"Throne of Thunder", -- [2]
				},
				[36272] = {
					"Apothecary Frye", -- [1]
					"Shadowfang Keep", -- [2]
				},
				[69388] = {
					"Zandalari Spear-Shaper", -- [1]
					"Throne of Thunder", -- [2]
				},
				[126832] = {
					"Skycap'n Kragg", -- [1]
					"Freehold", -- [2]
				},
				[90114] = {
					"Iron Dragoon", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[42973] = {
					"Eye of Naxxramas", -- [1]
					"Stratholme", -- [2]
				},
				[8900] = {
					"Doomforge Arcanasmith", -- [1]
					"Blackrock Depths", -- [2]
				},
				[45265] = {
					"Twilight Soul Blade", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[61705] = {
					"Corrupted Flamecaller", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[17281] = {
					"Bonechewer Ripper", -- [1]
					"Hellfire Citadel: Ramparts", -- [2]
				},
				[45412] = {
					"Lord Aurius Rivendare", -- [1]
					"Stratholme", -- [2]
				},
				[8898] = {
					"Anvilrage Marshal", -- [1]
					"Blackrock Depths", -- [2]
				},
				[76809] = {
					"Foreman Feldspar", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[74435] = {
					"Mushlump", -- [1]
					"Razorfen Downs", -- [2]
				},
				[53901] = {
					"Unstable Magma", -- [1]
					"Firelands", -- [2]
				},
				[91522] = {
					"Protector Bajunt", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[8889] = {
					"Anvilrage Overseer", -- [1]
					"Blackrock Depths", -- [2]
				},
				[134364] = {
					"Faithless Tender", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[155090] = {
					"Anodized Coilbearer", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[83846] = {
					"Yalnu", -- [1]
					"The Everbloom", -- [2]
				},
				[75786] = {
					"Roltall", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[8897] = {
					"Doomforge Craftsman", -- [1]
					"Blackrock Depths", -- [2]
				},
				[8905] = {
					"Warbringer Construct", -- [1]
					"Blackrock Depths", -- [2]
				},
				[9056] = {
					"Fineous Darkvire", -- [1]
					"Blackrock Depths", -- [2]
				},
				[17724] = {
					"Underbat", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[74379] = {
					"Splinterbone Frostweaver", -- [1]
					"Razorfen Downs", -- [2]
				},
				[18131] = {
					"Nether Ray", -- [1]
					"Isle of Conquest", -- [2]
				},
				[17727] = {
					"Wrathfin Sentry", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[76810] = {
					"Furnace Engineer", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[18105] = {
					"Ghaz'an", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[17826] = {
					"Swamplord Musel'ek", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[17734] = {
					"Underbog Lord", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[17882] = {
					"The Black Stalker", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
			},
			["hook_data"] = {
				{
					["Enabled"] = false,
					["Revision"] = 50,
					["HooksTemp"] = {
					},
					["Author"] = "Kastfall-Azralon",
					["Desc"] = "Easy way to change the color of an unit. Open the constructor script and follow the examples.",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --attempt to get the color from the unit color list\n    local color = envTable.NpcColors [unitFrame.namePlateUnitNameLower] or envTable.NpcColors [unitFrame.namePlateUnitName] or envTable.NpcColors [unitFrame.namePlateNpcId]\n    \n    --if the color exists, set the health bar color\n    if (color) then\n        Plater.SetNameplateColor (unitFrame, color)\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --list of npcs and their colors, can be inserted:\n    --name of the unit\n    --name of the unit in lower case\n    --npcID of the unit\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    \n    envTable.NpcColors = {\n        \n        --examples, using the unit name in lower case, regular unit name and the unitID:\n        \n        [\"Thunderlord Windreader\"] = \"red\", --using regular mob name and color it as red\n        [\"thunderlord crag-leaper\"] = {1, 1, 0}, --using lower case and coloring it yellow\n        [75790] = \"#00FF00\", --using the ID of the unit and using green as color\n        \n        --insert the new mobs here:\n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n    } --close custom color bracket\n    \nend\n\n\n\n\n",
					},
					["Time"] = 1547392935,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["race"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["Icon"] = "Interface\\AddOns\\Plater\\images\\color_bar",
					["Name"] = "Color Automation [Plater]",
				}, -- [1]
				{
					["Enabled"] = false,
					["Revision"] = 59,
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Change the nameplate color when a nameplate does not have the auras set in the constructor script.",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --do nothing if the player isn't in combat\n    if (not Plater.IsInCombat()) then\n        return \n    end\n    \n    --do nothing if the unit isn't in combat\n    if (not unitFrame.InCombat) then\n        return\n    end\n    \n    --do nothing if the unit is the player it self\n    if (unitFrame.IsSelf) then\n        return\n    end\n    \n    --check the auras\n    local hasAura = false\n    \n    for auraName, _ in pairs (envTable.TrackingAuras) do\n        if (Plater.NameplateHasAura (unitFrame, auraName)) then\n            hasAura = true\n            break\n        end\n    end\n    \n    if (not hasAura) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    else\n        if (envTable.ForceRefreshNameplateColor) then\n            Plater.RefreshNameplateColor (unitFrame) \n        end\n    end    \n    \nend",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    --Important: lines starting with double dashes are comments and are not part of the script\n    \n    --set this to true if you are not using threat colors in the health bar\n    envTable.ForceRefreshNameplateColor = true\n    \n    --if the unit does not have any of the following auras, it will be painted with the color listed below\n    --list of spells to track, can be the spell name (case-sensitive) or the spellID\n    envTable.TrackingAuras = {\n        --[\"Nightblade\"] = true, --this is an example using the spell name\n        --[195452] = true, --this is an example using the spellID\n        \n    }\n    \n    --which color the nameplate wil be changed\n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    --you may also use /plater colors\n    envTable.NameplateColor = \"pink\"\n    \nend",
					},
					["Time"] = 1554138845,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["race"] = {
						},
					},
					["Icon"] = 136207,
					["Name"] = "Don't Have Aura [Plater]",
				}, -- [2]
				{
					["Enabled"] = false,
					["Revision"] = 176,
					["HooksTemp"] = {
					},
					["Author"] = "Tecno-Azralon",
					["Desc"] = "Add another border with more customizations. This border can also be manipulated by other scripts.",
					["Hooks"] = {
						["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --run constructor!\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    if (envTable.IsEnabled) then\n        if (unitFrame.IsSelf) then\n            if (envTable.ShowOnPersonalBar) then\n                envTable.BorderFrame:Show()\n            else\n                envTable.BorderFrame:Hide() \n            end\n        else\n            envTable.BorderFrame:Show()\n        end   \n    end\n    \nend   \n\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BorderFrame:Hide()\n    \nend\n\n\n",
						["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BorderFrame:Hide()\n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --border color\n    local borderColor = \"yellow\"\n    \n    --size of the border\n    local borderSize = 1\n    \n    --transparency\n    local borderAlpha = 1\n    \n    --enabled (set to false it you only want to use the extra border in other scripts)\n    local isEnabled = true\n    \n    --export border (allow the border to be used by other scripts)\n    --other scripts can use:\n    --unitFrame.healthBar.extraBorder:Show()\n    --unitFrame.healthBar.extraBorder:SetVertexColor (r, g, b)\n    --unitFrame.healthBar.extraBorder:SetBorderSizes (borderSize)\n    local canExportBorder = true\n    \n    --do not add the border to personal bar\n    local noPersonalBar = true\n    \n    --private\n    do\n        \n        local newBorder = CreateFrame (\"frame\", nil, unitFrame.healthBar, \"NamePlateFullBorderTemplate\")\n        envTable.BorderFrame = newBorder\n        \n        newBorder:SetBorderSizes (borderSize, borderSize, borderSize, borderSize)\n        newBorder:UpdateSizes()\n        \n        local r, g, b = DetailsFramework:ParseColors (borderColor)\n        newBorder:SetVertexColor (r, g, b, borderAlpha)\n        \n        envTable.ShowOnPersonalBar = not noPersonalBar\n        \n        if (canExportBorder) then\n            unitFrame.healthBar.extraBorder = newBorder\n        end\n        \n        if (not isEnabled) then\n            envTable.IsEnabled = false\n        else\n            envTable.IsEnabled = true\n        end\n    end\n    \nend\n\n\n",
					},
					["Time"] = 1547409079,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["role"] = {
						},
					},
					["Icon"] = 133689,
					["Name"] = "Extra Border [Plater]",
				}, -- [3]
				{
					["Enabled"] = false,
					["Revision"] = 73,
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Hide neutral units, show when selected, see the constructor script for options.",
					["Hooks"] = {
						["Leave Combat"] = "function (self, unitId, unitFrame, envTable)\n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat) then\n            envTable.HideNameplate (unitFrame)\n        end\n    end\nend\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end\n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat and InCombatLockdown()) then\n            return\n        end\n        \n        envTable.HideNameplate (unitFrame)\n    end\n    \nend\n\n\n\n\n\n\n",
						["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat and InCombatLockdown()) then\n            return\n        end\n        \n        --check the unit reaction\n        if (unitFrame.namePlateIsTarget) then\n            envTable.ShowNameplate (unitFrame)\n            \n        else\n            envTable.HideNameplate (unitFrame)\n            \n        end    \n    end\n    \nend\n\n\n\n\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        envTable.ShowNameplate (unitFrame)\n    end\n    \nend\n\n\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when plater finishes an update on the nameplate\n    --check within the envTable if the healthBar of this nameplate should be hidden\n    if (envTable.IsHidden) then\n        if (unitFrame.healthBar:IsShown()) then\n            envTable.HideNameplate (unitFrame)\n        end\n    end\n    \nend\n\n\n\n\n",
						["Enter Combat"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat) then\n            envTable.ShowNameplate (unitFrame)\n        end\n    end\nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.OnlyInOpenWorld = true;\n    envTable.ShowInCombat = true;\n    \n    --consts\n    envTable.REACTION_NEUTRAL = 4;\n    \n    --functions to hide and show the healthBar\n    function envTable.HideNameplate (unitFrame)\n        Plater.HideHealthBar (unitFrame)\n        Plater.DisableHighlight (unitFrame)\n        envTable.IsHidden = true\n    end\n    \n    function envTable.ShowNameplate (unitFrame)\n        Plater.ShowHealthBar (unitFrame)\n        Plater.EnableHighlight (unitFrame)\n        envTable.IsHidden = false\n    end\n    \nend\n\n\n\n\n",
					},
					["Time"] = 1541606242,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["role"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["Icon"] = 1990989,
					["Name"] = "Hide Neutral Units [Plater]",
				}, -- [4]
				{
					["Enabled"] = true,
					["Revision"] = 55,
					["HooksTemp"] = {
					},
					["Author"] = "Kastfall-Azralon",
					["Desc"] = "Script for Stormwall Blockade encounter on Battle for Dazzar'alor",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.TemptingSiren) then\n        \n        if (envTable.Colors.TemptingSiren) then\n            Plater.SetNameplateColor (unitFrame, envTable.Colors.TemptingSiren)\n        end\n        \n    end\n    \n    \nend\n\n\n\n\n\n\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.TemptingSiren) then\n        \n        if (envTable.NameplateHeight.TemptingSiren) then\n            \n            Plater.SetNameplateSize (unitFrame, nil, envTable.NameplateHeight.TemptingSiren)\n            \n        end\n        \n    end    \n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --nameplate colors for unit\n    envTable.Colors = {}\n    envTable.Colors.TemptingSiren = \"orange\"\n    \n    --npcID\n    envTable.NpcIDs = {}\n    envTable.NpcIDs.TemptingSiren = 146436\n    \n    --nameplate height for each unit\n    envTable.NameplateHeight = {}\n    envTable.NameplateHeight.TemptingSiren = 18\n    \n    \n    \nend\n\n\n",
					},
					["Time"] = 1548117267,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
							2280, -- [1]
							["Enabled"] = true,
						},
						["race"] = {
						},
					},
					["Icon"] = "Interface\\AddOns\\Plater\\images\\encounter_stormwall_blockade",
					["Name"] = "Stormwall Encounter [Plater]",
				}, -- [5]
				{
					["Enabled"] = true,
					["Revision"] = 220,
					["HooksTemp"] = {
					},
					["Author"] = "Kastfall-Azralon",
					["Desc"] = "Script for the Jaina encounter on Battle for Dazzar'alor",
					["Hooks"] = {
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --Unexploded Ordinance\n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.UnexplodedOrdinance) then\n        \n        --make the life percent be bigger than the regular size\n        --so it's better to see the health percent of the barrel\n        local currentSize = Plater.db.profile.plate_config.enemynpc.percent_text_size\n        Plater:SetFontSize (unitFrame.healthBar.lifePercent, currentSize + envTable.UnexplodedOrdinanceTextSizeIncrease)\n    end\n    \n    if (envTable.IncreaseSize [unitFrame.namePlateNpcId]) then\n        local currentHeight = unitFrame.healthBar:GetHeight()\n        Plater.SetNameplateSize (unitFrame, nil, currentHeight + envTable.IncreaseSize [unitFrame.namePlateNpcId])\n    end\n    \nend\n\n\n\n\n\n\n",
						["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    if (envTable.UnexplodedOrdinanceCast and envTable._SpellID == envTable.UnexplodedOrdinanceSpellID) then\n        Plater.SetCastBarSize (unitFrame, nil, envTable.UnexplodedOrdinanceCastBarHeight)\n        Plater:SetFontSize (unitFrame.castBar.percentText, envTable.UnexplodedOrdinanceTimerSize)\n    end\nend\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    --reset the health percent text size\n    local currentSize = Plater.db.profile.plate_config.enemynpc.percent_text_size\n    Plater:SetFontSize (unitFrame.healthBar.lifePercent, currentSize)    \n    \nend\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --Override the color\n    if (envTable.Colors [unitFrame.namePlateNpcId]) then\n        Plater.SetNameplateColor (unitFrame, envTable.Colors [unitFrame.namePlateNpcId])\n    end    \n    \n    --Show the name of the unit in the Ice Block nameplate\n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.IceBlock) then\n        --find which player this block are holding\n        for i = 1, GetNumGroupMembers() do\n            local unit = \"raid\" .. i\n            if (UnitExists (unit)) then\n                for debuffId = 1, 40 do\n                    local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (unit, debuffId)\n                    \n                    --cancel the loop if there's no more debuffs on the player\n                    if (not name) then \n                        break \n                    end                    \n                    \n                    --check if who casted this debuff is the unit shown on this nameplate\n                    if (UnitIsUnit (caster or \"\", unitId)) then\n                        local unitName = UnitName (unit)\n                        \n                        --color the text by the class\n                        unitName = Plater.SetTextColorByClass (unit, unitName)\n                        \n                        --add the role icon\n                        if (Details) then\n                            local role = UnitGroupRolesAssigned (unit)\n                            unitName = Details:AddRoleIcon (unitName, role, 12)\n                        end\n                        \n                        unitFrame.unitName:SetText (unitName)\n                        unitFrame.castBar.Text:SetText (unitName)\n                        break\n                    end\n                    \n                end\n            else\n                break\n            end\n        end\n    end\nend",
						["Cast Stop"] = "function (self, unitId, unitFrame, envTable)\n    if (envTable.UnexplodedOrdinanceCast and envTable._SpellID == envTable.UnexplodedOrdinanceSpellID) then\n        Plater.SetCastBarSize (unitFrame)\n        Plater:SetFontSize (unitFrame.castBar.percentText, Plater.db.profile.plate_config.enemynpc.spellpercent_text_size)\n    end\nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --nameplate colors for unit\n    envTable.Colors = {}\n    envTable.Colors [148631] = \"orange\" --Unexploded Ordinance\n    envTable.Colors [148522] = \"white\" --Ice Block\n    \n    --increase the nameplate height for these units\n    envTable.IncreaseSize = {}\n    envTable.IncreaseSize [148522] = 4 --Ice Block (increase in 4 pixels)\n    \n    --increase the size of the life percent for the nameplate of the barrel\n    envTable.UnexplodedOrdinanceTextSizeIncrease = 3\n    \n    --increase the castbar size for the unexploded ordinance explosion cast\n    envTable.UnexplodedOrdinanceCast = true\n    envTable.UnexplodedOrdinanceSpellID = 288221 --12058 --(debug)\n    envTable.UnexplodedOrdinanceCastBarHeight = 18\n    envTable.UnexplodedOrdinanceTimerSize = 18\n    \n    --npcIDs\n    envTable.NpcIDs = {}\n    envTable.NpcIDs.UnexplodedOrdinance = 148631\n    envTable.NpcIDs.IceBlock = 148522\nend\n\n--tests 126023 --harbor saurid - dazar'alor harbor\n--tests 3127 venomtail scorpid - durotar\n--tests 12058 dustwind storm witch - durotar\n--Load Condition: EncounterID 2281\n\n\n",
					},
					["Time"] = 1548612537,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["race"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
							2281, -- [1]
							["Enabled"] = true,
						},
						["spec"] = {
						},
					},
					["Icon"] = "Interface\\AddOns\\Plater\\images\\encounter_jaina",
					["Name"] = "Jaina Encounter [Plater]",
				}, -- [6]
				{
					["Enabled"] = false,
					["Revision"] = 84,
					["HooksTemp"] = {
					},
					["Author"] = "Ahwa-Azralon",
					["Desc"] = "Add extra effects to execute range. See the constructor script for options.",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (envTable.UseCustomExecutePercent) then\n        \n        --manual detection\n        local healthBar = unitFrame.healthBar\n        if (healthBar.CurrentHealth / healthBar.CurrentHealthMax <= envTable.ExecutePercent) then\n            envTable.UnitInExecuteRange (unitFrame)\n        end        \n        \n    else\n        \n        --auto detection\n        if (unitFrame.InExecuteRange) then\n            envTable.UnitInExecuteRange (unitFrame)\n        end\n        \n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --execute detection, if true the script will handle the execute percent\n    --while false Plater will automatically trigger the execute range\n    --you only want to set this to true in case of Plater not detecting the execute range correctly\n    envTable.UseCustomExecutePercent = false\n    --execute percent, if not detecting automatic, this is the percent to active the execute range\n    --use from zero to one, 0.20 is equal to 20% of the unit life\n    envTable.ExecutePercent = 0.20\n    \n    --allow this script to change the nameplate color when the unit is in execute range\n    envTable.CanChangeColor = true\n    --change the health bar color to this color when the unit is in execute range\n    --color can be set as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}\n    envTable.ExecuteColor = \"green\"\n    \n    --border color\n    envTable.CanChangeBorderColor = false\n    envTable.BorderColor = \"red\"\n    \n    --hide the default health divisor and the health execute indicator\n    envTable.HideHealthDivisor = false\n    --if not hidden, adjust the health divisor settings and the health execute indicator\n    envTable.HealthDivisorAlpha = 0.5\n    envTable.HealthDivisorColor = \"white\"\n    envTable.HealthExecuteIndicatorAlpha = 0.15\n    envTable.HealthExecuteIndicatorColor = \"darkred\"\n    \n    \n    --private (internal functions)\n    do\n        function envTable.UnitInExecuteRange (unitFrame)\n            --check if can change the execute color\n            if (envTable.CanChangeColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.ExecuteColor)\n            end\n            \n            if (envTable.CanChangeBorderColor) then\n                Plater.SetBorderColor (unitFrame, envTable.BorderColor)\n            end\n            \n            if (envTable.HideHealthDivisor) then\n                unitFrame.healthBar.healthCutOff:Hide() \n                unitFrame.healthBar.executeRange:Hide()\n                \n            else\n                envTable.UpdateHealthDivisor (unitFrame)\n                \n            end\n        end\n        \n        function envTable.UpdateHealthDivisor (unitFrame)\n            local healthBar = unitFrame.healthBar\n            \n            healthBar.healthCutOff:Show()\n            healthBar.healthCutOff:SetVertexColor (DetailsFramework:ParseColors (envTable.HealthDivisorColor))\n            healthBar.healthCutOff:SetAlpha (envTable.HealthDivisorAlpha)\n            \n            healthBar.executeRange:Show()\n            healthBar.executeRange:SetVertexColor (DetailsFramework:ParseColors (envTable.HealthExecuteIndicatorColor))\n            healthBar.executeRange:SetAlpha (envTable.HealthExecuteIndicatorAlpha)\n            \n            if (envTable.UseCustomExecutePercent) then\n                healthBar.healthCutOff:ClearAllPoints()\n                healthBar.executeRange:ClearAllPoints()\n                \n                healthBar.healthCutOff:SetSize (healthBar:GetHeight(), healthBar:GetHeight())\n                healthBar.healthCutOff:SetPoint (\"center\", healthBar, \"left\", healthBar:GetWidth() * envTable.ExecutePercent, 0)\n                \n                healthBar.executeRange:SetTexCoord (0, envTable.ExecutePercent, 0, 1)\n                healthBar.executeRange:SetHeight (healthBar:GetHeight())\n                healthBar.executeRange:SetPoint (\"left\", healthBar, \"left\", 0, 0)\n                healthBar.executeRange:SetPoint (\"right\", healthBar.healthCutOff, \"center\")\n            end\n            \n        end\n    end\n    \nend",
					},
					["Time"] = 1547406548,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["race"] = {
						},
					},
					["Icon"] = 135358,
					["Name"] = "Execute Range [Plater]",
				}, -- [7]
				{
					["Enabled"] = false,
					["Revision"] = 88,
					["HooksTemp"] = {
					},
					["Author"] = "Kastfall-Azralon",
					["Desc"] = "Function Plater.UpdatePlateSize from Plater.lua exported to scritps.",
					["Hooks"] = {
						["Nameplate Added"] = "\n\n-- exported function Plater.UpdatePlateSize() from Plater.lua\n--this is for advanced users which wants to reorder the nameplate frame at their desire\n\n\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --check if there's a type of unit on this nameplate\n    local plateFrame = unitFrame:GetParent()\n    if (not plateFrame.actorType) then\n        return\n    end\n    \n    --get all the frames and cache some variables\n    local ACTORTYPE_ENEMY_PLAYER = \"enemyplayer\"\n    local profile = Plater.db.profile\n    local DB_PLATE_CONFIG = profile.plate_config\n    local isInCombat = Plater.IsInCombat()\n    local actorType = plateFrame.actorType\n    \n    local unitFrame = plateFrame.unitFrame\n    local healthBar = unitFrame.healthBar\n    local castBar = unitFrame.castBar\n    local powerBar = unitFrame.powerBar\n    local buffFrame1 = unitFrame.BuffFrame\n    local buffFrame2 = unitFrame.BuffFrame2\n    \n    --use in combat bars when in pvp\n    if (plateFrame.actorType == ACTORTYPE_ENEMY_PLAYER) then\n        if ((Plater.ZoneInstanceType == \"pvp\" or Plater.ZoneInstanceType == \"arena\") and DB_PLATE_CONFIG.player.pvp_always_incombat) then\n            isInCombat = true\n        end\n    end\n    \n    --get the config for this actor type\n    local plateConfigs = DB_PLATE_CONFIG [actorType]\n    --get the config key based if the player is in combat\n    local castBarConfigKey, healthBarConfigKey, manaConfigKey = Plater.GetHashKey (isInCombat)\n    \n    --get the width and height from what the user set in the options panel\n    local healthBarWidth, healthBarHeight = unitFrame.customHealthBarWidth or plateConfigs [healthBarConfigKey][1], unitFrame.customHealthBarHeight or plateConfigs [healthBarConfigKey][2]\n    local castBarWidth, castBarHeight = unitFrame.customCastBarWidth or plateConfigs [castBarConfigKey][1], unitFrame.customCastBarHeight or plateConfigs [castBarConfigKey][2]\n    local powerBarWidth, powerBarHeight = unitFrame.customPowerBarHeight or plateConfigs [manaConfigKey][1], unitFrame.customPowerBarHeight or plateConfigs [manaConfigKey][2]\n    \n    --calculate the offset for the cast bar, this is done due to the cast bar be anchored to topleft and topright\n    local castBarOffSetX = (healthBarWidth - castBarWidth) / 2\n    local castBarOffSetY = plateConfigs.castbar_offset\n    \n    --calculate offsets for the power bar\n    local powerBarOffSetX = (healthBarWidth - powerBarWidth) / 2\n    local powerBarOffSetY = 0\n    \n    --calculate the size deviation for pets\n    local unitType = Plater.GetUnitType (plateFrame)\n    if (unitType == \"pet\") then\n        healthBarHeight = healthBarHeight * Plater.db.profile.pet_height_scale\n        healthBarWidth = healthBarWidth * Plater.db.profile.pet_width_scale\n        \n    elseif (unitType == \"minus\") then\n        healthBarHeight = healthBarHeight * Plater.db.profile.minor_height_scale\n        healthBarWidth = healthBarWidth * Plater.db.profile.minor_width_scale\n    end\n    \n    --unit frame - is set to be the same size as the plateFrame\n    unitFrame:ClearAllPoints()\n    unitFrame:SetAllPoints()\n    \n    --calculates the health bar anchor points\n    --it will always be placed in the center of the nameplate area (where it accepts mouse clicks) \n    local xOffSet = (plateFrame:GetWidth() - healthBarWidth) / 2\n    local yOffSet = (plateFrame:GetHeight() - healthBarHeight) / 2\n    \n    --set the health bar point\n    healthBar:ClearAllPoints()\n    PixelUtil.SetPoint (healthBar, \"topleft\", unitFrame, \"topleft\", xOffSet + profile.global_offset_x, -yOffSet + profile.global_offset_y)\n    PixelUtil.SetPoint (healthBar, \"bottomright\", unitFrame, \"bottomright\", -xOffSet + profile.global_offset_x, yOffSet + profile.global_offset_y)\n    \n    --set the cast bar point and size\n    castBar:ClearAllPoints()\n    PixelUtil.SetPoint (castBar, \"topleft\", healthBar, \"bottomleft\", castBarOffSetX, castBarOffSetY)\n    PixelUtil.SetPoint (castBar, \"topright\", healthBar, \"bottomright\", -castBarOffSetX, castBarOffSetY)\n    PixelUtil.SetHeight (castBar, castBarHeight)\n    PixelUtil.SetSize (castBar.Icon, castBarHeight, castBarHeight)\n    PixelUtil.SetSize (castBar.BorderShield, castBarHeight * 1.4, castBarHeight * 1.4)\n    \n    --set the power bar point and size\n    powerBar:ClearAllPoints()\n    PixelUtil.SetPoint (powerBar, \"topleft\", healthBar, \"bottomleft\", powerBarOffSetX, powerBarOffSetY)\n    PixelUtil.SetPoint (powerBar, \"topright\", healthBar, \"bottomright\", -powerBarOffSetX, powerBarOffSetY)\n    PixelUtil.SetHeight (powerBar, powerBarHeight)\n    \n    --power bar are hidden by default, show it if there's a custom size for it\n    if (unitFrame.customPowerBarWidth and unitFrame.customPowerBarHeight) then\n        powerBar:SetUnit (unitFrame.unit)\n    end\n    \n    --aura frames\n    buffFrame1:ClearAllPoints()\n    PixelUtil.SetPoint (buffFrame1, \"bottom\", unitFrame, \"top\", profile.aura_x_offset,  plateConfigs.buff_frame_y_offset + profile.aura_y_offset)\n    \n    buffFrame2:ClearAllPoints()\n    PixelUtil.SetPoint (buffFrame2, \"bottom\", unitFrame, \"top\", profile.aura2_x_offset,  plateConfigs.buff_frame_y_offset + profile.aura2_y_offset)    \n    \nend\n\n\n",
					},
					["Time"] = 1548077443,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["role"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["Icon"] = 574574,
					["Name"] = "Reorder Nameplate [Plater]",
				}, -- [8]
				{
					["Enabled"] = false,
					["Revision"] = 222,
					["HooksTemp"] = {
					},
					["Author"] = "Kastfall-Azralon",
					["Desc"] = "Change the nameplate color if the unit is attacking a specific unit like Monk's Ox Statue or Druid's Treants. You may edit which units it track in the constructor script.",
					["Hooks"] = {
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --list of npcs and their colors, can be inserted:\n    --name of the unit\n    --name of the unit in lower case\n    --npcID of the unit\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    \n    envTable.ListOfNpcs = {\n        [61146] = \"olive\", --monk statue npcID\n        [103822] = \"olive\", --druid treant npcID\n        \n    }\n    \n    \nend\n\n\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the GUID of the target of the unit\n    local targetGUID = UnitGUID (unitId .. \"target\")\n    \n    if (targetGUID) then\n        \n        --get the npcID of the target\n        local npcID = Plater.GetNpcIDFromGUID (targetGUID)\n        --check if the npcID of this unit is in the npc list \n        if (envTable.ListOfNpcs [npcID]) then\n            Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [npcID])\n            \n        else\n            --check if the name of ths unit is in the list\n            local unitName = UnitName (unitId .. \"target\")\n            if (envTable.ListOfNpcs [unitName]) then\n                Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])\n                \n            else\n                --check if the name of the unit in lower case is in the npc list\n                unitName = string.lower (unitName)\n                if (envTable.ListOfNpcs [unitName]) then\n                    Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])                \n                    \n                end\n            end\n        end\n        \n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					},
					["Time"] = 1547993111,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["race"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_attacking_unit",
					["Name"] = "Attacking Specific Unit [Plater]",
				}, -- [9]
				{
					["Enabled"] = true,
					["Revision"] = 37,
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Tint nameplates of Reaping Soul units (Mythic Dungeon Affix) depending on its target and role of the player",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --can detect the reaping souls aggro?\n    if (envTable.detectAggro and Plater.IsInCombat()) then\n        \n        --is this npc a reaping soul?\n        if (envTable.npcIDs [unitFrame.namePlateNpcId]) then\n            \n            --check if the mob is attacking the player\n            if (UnitIsUnit (unitFrame.targetUnitID, \"player\")) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateAggroColor)\n                \n            else\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateNoAggroColor)\n            end\n            \n        end\n        \n    end\n    \nend",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when the nameplate is added and the npcID matches, cache the color for the nameplate\n    if (envTable.detectAggro) then\n        if (envTable.npcIDs [unitFrame.namePlateNpcId]) then\n            local profile = Plater.db.profile\n            local role = Plater:GetPlayerRole()\n            \n            if (role == \"TANK\") then\n                envTable.NameplateAggroColor = profile.tank.colors.aggro\n                envTable.NameplateNoAggroColor = profile.tank.colors.noaggro\n            else\n                envTable.NameplateAggroColor = profile.dps.colors.aggro\n                envTable.NameplateNoAggroColor = profile.dps.colors.noaggro\n            end\n            \n        end\n    end\n    \n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --npcs affected by this script\n    \n    envTable.npcIDs = {\n        [148716] = true, --risen soul\n        [148893] = true, --tormented soul\n        [148894] = true, --lost soul\n        \n        [127278] = true, --skittering feeder (tests and debug, also need to disable the load conditions)\n    }\n    \n    --detect aggro, if true it will see which group member the soul is attacking and override the color\n    envTable.detectAggro = true\n    \n    \nend\n\n\n",
					},
					["Time"] = 1549827281,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
							["Enabled"] = true,
							["party"] = true,
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["role"] = {
						},
						["affix"] = {
							[117] = true,
							["Enabled"] = true,
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["Icon"] = 2446016,
					["Name"] = "M+ Bwonsamdi Reaping",
				}, -- [10]
				{
					["Enabled"] = false,
					["Revision"] = 189,
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Show combo points above the nameplate for Druid Feral and Rogues.",
					["Hooks"] = {
						["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --run constructor!\n    --constructor is executed only once when any script of the hook runs.\n    \nend\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if need update the amount of combo points shown\n    if (envTable.LastPlayerTalentUpdate > envTable.LastUpdate) then\n        envTable.UpdateComboPointAmount()\n    end    \n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        envTable.UpdateComboPoints()\n        \n    else\n        envTable.ComboPointFrame:Hide()\n    end    \n    \nend\n\n\n",
						["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if this nameplate is the current target\n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        \n    else\n        envTable.ComboPointFrame:Hide()\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Player Power Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.UpdateComboPoints()\n    end\n    \n    \nend\n\n\n\n\n\n\n",
						["Player Talent Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the amount of comboo points shown when the player changes talents or specialization\n    envTable.UpdateComboPointAmount()\n    \n    --save the time of the last talent change\n    envTable.LastPlayerTalentUpdate = GetTime()\n    \n    \nend\n\n\n",
						["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    local anchors = {\n        {\"bottom\", unitFrame.healthBar, \"top\", 0, 24},\n    }\n    \n    local sizes = {\n        width = 12,\n        height = 12,\n        scale = 1,\n    }\n    \n    local textures = {\n        backgroundTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        backgroundTexCoords = {78/128, 98/128, 21/64, 41/64},\n        \n        comboPointTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        comboPointTexCoords = {100/128, 120/128, 21/64, 41/64},\n    }\n    \n    local frameLevel = 1000\n    local frameStrata = \"high\"    \n    \n    --private\n    do\n        --store combo points frames on this table\n        envTable.ComboPoints = {}\n        --save when the player changed talents or spec\n        envTable.LastPlayerTalentUpdate = GetTime()\n        --save when this nameplate got a combo point amount and alignment update        \n        \n        --build combo points frame anchor (combo point are anchored to this)\n        if (not unitFrame.PlaterComboPointFrame) then\n            local hostFrame = CreateFrame (\"frame\", nil, unitFrame)\n            hostFrame.ComboPointFramesPool = {}\n            unitFrame.PlaterComboPointFrame = hostFrame\n            envTable.ComboPointFrame = hostFrame\n            \n            --DetailsFramework:ApplyStandardBackdrop (envTable.ComboPointFrame) --debug anchor size\n            \n            --animations\n            local onPlayShowAnimation = function (animation)\n                --stop the hide animation if it's playing\n                if (animation:GetParent():GetParent().HideAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().HideAnimation:Stop()\n                end\n                \n                animation:GetParent():Show()\n            end\n            \n            local onPlayHideAnimation = function (animation)\n                --stop the show animation if it's playing\n                if (animation:GetParent():GetParent().ShowAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().ShowAnimation:Stop()\n                end\n            end        \n            local onStopHideAnimation = function (animation)\n                animation:GetParent():Hide()       \n            end\n            \n            local createAnimations = function (comboPoint)\n                --on show\n                comboPoint.ShowAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayShowAnimation, nil)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 1, 0.1, 0, 0, 1, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"alpha\", 1, 0.1, .5, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 2, 0.1, 1.2, 1.2, 1, 1)\n                \n                --on hide\n                comboPoint.HideAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayHideAnimation, onStopHideAnimation)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"scale\", 1, 0.1, 1, 1, 0, 0)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"alpha\", 1, 0.1, 1, 0)\n            end\n            \n            --build combo point frame        \n            for i =1, 10 do \n                local f = CreateFrame (\"frame\", nil, envTable.ComboPointFrame)\n                f:SetSize (sizes.width, sizes.height)\n                tinsert (envTable.ComboPoints, f)\n                tinsert (unitFrame.PlaterComboPointFrame.ComboPointFramesPool, f)\n                \n                local backgroundTexture = f:CreateTexture (nil, \"background\")\n                backgroundTexture:SetTexture (textures.backgroundTexture)\n                backgroundTexture:SetTexCoord (unpack (textures.backgroundTexCoords))\n                backgroundTexture:SetSize (sizes.width, sizes.height)\n                backgroundTexture:SetPoint (\"center\")\n                \n                local comboPointTexture = f:CreateTexture (nil, \"artwork\")\n                comboPointTexture:SetTexture (textures.comboPointTexture)\n                comboPointTexture:SetTexCoord (unpack (textures.comboPointTexCoords))\n                \n                comboPointTexture:SetSize (sizes.width, sizes.height)\n                comboPointTexture:SetPoint (\"center\")\n                comboPointTexture:Hide()            \n                \n                f.IsActive = false\n                \n                f.backgroundTexture = backgroundTexture\n                f.comboPointTexture = comboPointTexture\n                \n                createAnimations (f)\n            end\n            \n        else\n            envTable.ComboPointFrame = unitFrame.PlaterComboPointFrame\n            envTable.ComboPointFrame:SetScale (sizes.scale)\n            envTable.ComboPoints = unitFrame.PlaterComboPointFrame.ComboPointFramesPool\n            \n        end            \n        \n        envTable.ComboPointFrame:SetFrameLevel (frameLevel)\n        envTable.ComboPointFrame:SetFrameStrata (frameStrata)\n        \n        function envTable.UpdateComboPoints()\n            local comboPoints = UnitPower (\"player\", Enum.PowerType.ComboPoints)\n            \n            for i = 1, envTable.TotalComboPoints do\n                local thisComboPoint = envTable.ComboPoints [i]\n                \n                if (i <= comboPoints ) then\n                    --combo point enabled\n                    if (not thisComboPoint.IsActive) then\n                        thisComboPoint.ShowAnimation:Play()\n                        thisComboPoint.IsActive = true\n                        \n                    end\n                    \n                else\n                    --combo point disabled\n                    if (thisComboPoint.IsActive) then\n                        thisComboPoint.HideAnimation:Play()\n                        thisComboPoint.IsActive = false\n                        \n                    end\n                end\n            end\n            \n            \n        end\n        \n        function envTable.UpdateComboPointAmount()\n            local namePlateWidth = Plater.db.profile.plate_config.enemynpc.health_incombat[1]\n            local comboPoints = UnitPowerMax (\"player\", Enum.PowerType.ComboPoints)\n            local reservedSpace = namePlateWidth / comboPoints\n            \n            --store the total amount of combo points\n            envTable.TotalComboPoints = comboPoints\n            \n            --update anchor frame\n            envTable.ComboPointFrame:SetWidth (namePlateWidth)\n            envTable.ComboPointFrame:SetHeight (20)\n            envTable.ComboPointFrame:ClearAllPoints()\n            for i = 1, #anchors do\n                local anchor = anchors[i]\n                envTable.ComboPointFrame:SetPoint (unpack (anchor))\n            end        \n            \n            --\n            for i = 1, #envTable.ComboPoints do\n                envTable.ComboPoints[i]:Hide()\n                envTable.ComboPoints[i]:ClearAllPoints()\n            end\n            \n            for i = 1, comboPoints do\n                local comboPoint = envTable.ComboPoints[i]\n                comboPoint:SetPoint (\"left\", envTable.ComboPointFrame, \"left\", reservedSpace * (i-1), 0)\n                comboPoint:Show()\n            end\n            \n            envTable.LastUpdate = GetTime()\n            \n            envTable.UpdateComboPoints()\n        end\n        \n        --initialize\n        envTable.UpdateComboPointAmount()\n        envTable.ComboPointFrame:Hide()\n    end\n    \n    \nend",
					},
					["Time"] = 1548354524,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
							["Enabled"] = true,
							["DRUID"] = true,
							["ROGUE"] = true,
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
							[103] = true,
							["Enabled"] = true,
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["role"] = {
						},
					},
					["Icon"] = 135426,
					["Name"] = "Combo Points [Plater]",
				}, -- [11]
				{
					["Enabled"] = false,
					["Revision"] = 182,
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Show how many raid members are targeting the unit",
					["Hooks"] = {
						["Leave Combat"] = "function (self, unitId, unitFrame, envTable)\n    envTable.CanShow = false;\n    envTable.TargetAmount:SetText (\"\")\nend\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when a nameplate is added to the screen check if the player is in combat\n    if (InCombatLockdown()) then\n        --player is in combat, check if can check amount of targets\n        envTable.CanShow = envTable.CanShowTargetAmount();\n        \n    else\n        envTable.CanShow = false; \n    end\n    \n    envTable.TargetAmount:SetText (\"\");\n    \nend",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.TargetAmount:SetText (\"\");\n    envTable.CanShow = false;\n    \nend\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --if the script is allowed to show the amount of targets\n    --also check if the unit is in combat\n    if (envTable.CanShow and UnitAffectingCombat (unitId)) then\n        \n        --check if can update the amount of targets following the cooldown set in the constructor script\n        --by default Plater updates the nameplate every 250ms, by default the cooldown is 2, so it'll update the amuont of target every 1/2 of a second\n        envTable.UpdateCooldown = envTable.UpdateCooldown + 1\n        if (envTable.UpdateCooldown < envTable.UpdateInterval) then\n            return\n        else\n            \n            --reset the cooldown interval to check the amount of target again\n            envTable.UpdateCooldown = 0\n            \n            --get the amount of targets\n            local amount;\n            if (envTable.InRaid) then\n                amount = envTable.NumTargetsInRaid (unitFrame)      \n                \n            elseif (envTable.InParty) then\n                amount = envTable.NumTargetsInParty (unitFrame)   \n                \n            else\n                envTable.TargetAmount:SetText (\"\")\n                return\n            end\n            \n            --update the amount text\n            if (amount == 0) then\n                envTable.TargetAmount:SetText (\"\")\n            else\n                envTable.TargetAmount:SetText (amount)\n            end\n            \n        end\n    end\nend\n\n\n",
						["Enter Combat"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can show the amount of targets\n    envTable.CanShow = envTable.CanShowTargetAmount();\n    \n    if (not envTable.CanShow) then\n        envTable.TargetAmount:SetText (\"\") \n    end\nend\n\n\n\n\n",
						["Constructor"] = "--all gray text like this are comments and do not run as code\n--build the settings and basic functions for the hook\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --declare setting variables:\n    local textColor = \"orange\";\n    local textSize = 12;\n    \n    local showInRaid = true;\n    local showInDungeon = true;\n    local showInArena = false;\n    local showInBattleground = false;\n    local showInOpenWorld = true;\n    \n    envTable.UpdateInterval = 2; --each 2 updates in the nameplate it'll update the amount of targets\n    \n    local anchor = {\n        side = 6, --1 = topleft 2 = left 3 = bottomleft 4 = bottom 5 = bottom right 6 = right 7 = topright 8 = top\n        x = 4, --x offset\n        y = 0, --y offset\n    };\n    \n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------\n    \n    \n    --frames:\n    \n    --create the text that will show the amount of people targeting the unit\n    if (not  unitFrame.healthBar.TargetAmount) then\n        envTable.TargetAmount = Plater:CreateLabel (unitFrame.healthBar, \"\", textSize, textColor);\n        Plater.SetAnchor (envTable.TargetAmount, anchor);\n        unitFrame.healthBar.TargetAmount = envTable.TargetAmount\n    end\n    \n    --in case Plater wipes the envTable\n    envTable.TargetAmount = unitFrame.healthBar.TargetAmount\n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------           \n    --private variables (they will be used in the other scripts within this hook)\n    envTable.CanShow = false;\n    envTable.UpdateCooldown = 0;\n    envTable.InRaid = false;\n    envTable.InParty = false;\n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------           \n    --functions\n    \n    --update the InRaid or InParty proprieties\n    function envTable.UpdateGroupType()\n        if (IsInRaid()) then\n            envTable.InRaid = true;\n            envTable.InParty = false;     \n            \n        elseif (IsInGroup()) then\n            envTable.InRaid = false;\n            envTable.InParty = true;   \n            \n        else\n            envTable.InRaid = false;            \n            envTable.InParty = false;\n        end\n    end\n    \n    --this function controls if the amount of targets can show following the settings in the top of this script\n    function envTable.CanShowTargetAmount()\n        \n        local _, instanceType, difficultyID, _, _, _, _, instanceMapID, instanceGroupSize = GetInstanceInfo()\n        \n        if (showInRaid and instanceType == \"raid\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInDungeon and instanceType == \"party\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInArena and instanceType == \"arena\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInBattleground and instanceType == \"pvp\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInOpenWorld and instanceType == \"none\") then\n            envTable.UpdateGroupType()\n            if (envTable.InRaid or envTable.InParty) then\n                return true\n            end\n        end\n        \n        return false\n    end\n    \n    --get the amount of player targetting the unit in raid or party\n    function envTable.NumTargetsInRaid (unitFrame)\n        local amount = 0\n        for i = 1, GetNumGroupMembers() do\n            local unit = \"raid\" .. i .. \"target\"\n            if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n                amount = amount + 1\n            end\n        end\n        \n        return amount\n    end\n    \n    function envTable.NumTargetsInParty()\n        local amount = 0\n        for i = 1, GetNumGroupMembers() - 1 do\n            local unit = \"party\" .. i .. \"target\"\n            if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n                amount = amount + 1\n            end\n        end\n        \n        local unit = \"playertarget\"\n        if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n            amount = amount + 1\n        end        \n        \n        return amount\n    end\n    \nend",
					},
					["Time"] = 1548278227,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["race"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["Icon"] = 1966587,
					["Name"] = "Players Targeting a Target [Plater]",
				}, -- [12]
				{
					["Enabled"] = false,
					["Revision"] = 93,
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Changes the target color to the color set in the constructor script.",
					["Hooks"] = {
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend",
						["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --usage: color name e.g \"red\" \"yellow\"; color table e.g {1, 0, 0} {1, 1, 0}; hex string e.g. \"#FF0000\" \"FFFF00\"\n    \n    envTable.TargetColor = \"purple\"\n    --envTable.TargetColor = \"#FF00FF\"\n    --envTable.TargetColor = {252/255, 0/255, 254/255}\n    \n    function envTable.UpdateColor (unitFrame)\n        --do not change the color of the personal bar\n        if (not unitFrame.IsSelf) then\n            \n            --if this nameplate the current target of the player?\n            if (unitFrame.namePlateIsTarget) then\n                Plater.SetNameplateColor (unitFrame, envTable.TargetColor)  --rgb\n            else\n                --refresh the nameplate color\n                Plater.RefreshNameplateColor (unitFrame)\n            end\n        end\n    end\n    \nend\n\n\n\n\n",
					},
					["Time"] = 1552354619,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["race"] = {
						},
					},
					["Icon"] = 878211,
					["Name"] = "Current Target Color [Plater]",
				}, -- [13]
				{
					["Enabled"] = false,
					["Revision"] = 272,
					["HooksTemp"] = {
					},
					["Author"] = "Ditador-Azralon",
					["Desc"] = "Reorder buffs and debuffs following the settings set in the constructor.",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    local auraContainers = {unitFrame.BuffFrame.PlaterBuffList}\n\n    if (Plater.db.profile.buffs_on_aura2) then\n        auraContainers [2] = unitFrame.BuffFrame2.PlaterBuffList\n    end\n    \n    for containerID = 1, #auraContainers do\n        \n        local auraContainer = auraContainers [containerID]\n        local aurasShown = {}\n        local aurasDuplicated = {}\n        \n        --build the list of auras shown in the buff frame and check for each aura priority\n        --also check if the consolidate (stack) auras with the same name is enabled\n        for index, auraIcon in ipairs (auraContainer) do\n            if (auraIcon:IsShown()) then\n                if (envTable.consolidadeRepeatedAuras) then\n                    --is this aura already shown?\n                    local iconShownIndex = aurasDuplicated [auraIcon.SpellName]\n                    if (iconShownIndex) then\n                        --get the table with information about the shown icon\n                        local auraShownTable = aurasShown [iconShownIndex]\n                        --get the icon already in the table\n                        local icon = auraShownTable[1]\n                        --increase the amount of stacks\n                        auraShownTable[3] = auraShownTable[3] + 1\n                        \n                        --check if the remaining time of the icon already added in the table is lower than the current\n                        if (auraIcon.RemainingTime > icon.RemainingTime) then\n                            --replace the icon for the icon with bigger duration\n                            auraShownTable[1] = auraIcon\n                            icon:Hide()\n                        else\n                            auraIcon:Hide()\n                        end\n                    else    \n                        local priority = envTable.priority[auraIcon.SpellName] or envTable.priority[auraIcon.spellId] or 1\n                        tinsert (aurasShown, {auraIcon, priority, 1}) --icon frame, priority, stack amount\n                        aurasDuplicated [auraIcon.SpellName] = #aurasShown\n                    end\n                else\n                    --not stacking similar auras\n                    local priority = envTable.priority[auraIcon.SpellName] or envTable.priority[auraIcon.spellId] or 1\n                    tinsert (aurasShown, {auraIcon, priority})\n                    \n                end           \n            end\n        end\n        \n        --sort auras by priority\n        table.sort (aurasShown, DetailsFramework.SortOrder2)\n        \n        local growDirection\n        if (containerID == 1) then --debuff container\n            growDirection = Plater.db.profile.aura_grow_direction\n            --force to grow to right if it is anchored to center\n            if (growDirection == 2) then\n                growDirection = 3\n            end\n            -- \"Left\", \"Center\", \"Right\" - 1  2  3\n            \n        elseif (containerID == 2) then --buff container\n            growDirection = Plater.db.profile.aura2_grow_direction\n            --force to grow to left if it is anchored to center\n            if (growDirection == 2) then\n                growDirection = 1\n            end\n            \n        end\n        \n        local padding = envTable.padding\n        local framersPerRow = envTable.maxAurasPerRow + 1\n        \n        --first icon is where the row starts\n        local firstIcon = aurasShown[1] and aurasShown[1][1]\n        \n        if (firstIcon) then\n            local anchorPoint = firstIcon:GetParent() --anchor point is the BuffFrame\n            anchorPoint:SetSize (1, 1)\n            \n            firstIcon:ClearAllPoints()\n            firstIcon:SetPoint (\"center\", anchorPoint, \"center\", 0, 5)\n            \n            --check the consolidaded stacks, this is not the regular buff stacks\n            local firstIconStacks = aurasShown[1][3]\n            if (firstIconStacks and firstIconStacks > 1) then\n                firstIcon.StackText:SetText (firstIconStacks)\n                firstIcon.StackText:Show()\n            end\n            \n            --> left to right\n            if (growDirection == 3) then\n                --> iterate among all aura icons\n                for i = 2, #aurasShown do\n                    local auraIcon = aurasShown [i][1]\n                    auraIcon:ClearAllPoints()\n                    \n                    if (i == framersPerRow) then\n                        auraIcon:SetPoint (\"bottomleft\", firstIcon, \"topleft\", 0, envTable.rowPadding)\n                        framersPerRow = framersPerRow + framersPerRow\n                        \n                    else\n                        auraIcon:SetPoint (\"topleft\", aurasShown [i-1][1], \"topright\", padding, 0)\n                    end\n                    \n                    local stacks = aurasShown[i][3]\n                    if (stacks and stacks > 1) then\n                        auraIcon.StackText:SetText (stacks)\n                        auraIcon.StackText:Show()\n                    end\n                end        \n                \n                --right to left\n            elseif (growDirection == 1) then\n                --> iterate among all aura icons\n                for i = 2, #aurasShown do\n                    local auraIcon = aurasShown [i][1]\n                    auraIcon:ClearAllPoints()\n                    \n                    if (i == framersPerRow) then\n                        auraIcon:SetPoint (\"bottomright\", firstIcon, \"topright\", 0, envTable.rowPadding)\n                        framersPerRow = framersPerRow + framersPerRow\n                        \n                    else\n                        auraIcon:SetPoint (\"topright\", aurasShown [i-1][1], \"topleft\", -padding, 0)\n                    end\n                    \n                    local stacks = aurasShown[i][3]\n                    if (stacks and stacks > 1) then\n                        auraIcon.StackText:SetText (stacks)\n                        auraIcon.StackText:Show()\n                    end\n                    \n                end                    \n            end\n            \n        end\n    end\nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --ATTENTION: after enabling this script, you may have to adjust the anchor point at the Buff Settings tab\n    \n    --space between each aura icon\n    envTable.padding = 2\n    \n    --space between each row of icons\n    envTable.rowPadding = 12\n    \n    --amount of icons in the row, it'll breakline and start a new row after reach the threshold\n    envTable.maxAurasPerRow = 5\n    \n    --stack auras of the same name that arent stacked by default from the game\n    envTable.consolidadeRepeatedAuras = true    \n    \n    --which auras goes first, assign a value (any number), bigger value goes first\n    envTable.priority = {\n        [\"Vampiric Touch\"] = 50,\n        [\"Shadow Word: Pain\"] = 22,\n        [\"Mind Flay\"] = 5,\n    }\n    \nend \n\n\n\n\n",
					},
					["Time"] = 1553450957,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["role"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_reorder",
					["Name"] = "Aura Reorder [Plater]",
				}, -- [14]
			},
			["health_statusbar_bgcolor"] = {
				0.1137254901960784, -- [1]
				0.1137254901960784, -- [2]
				0.1137254901960784, -- [3]
				0.8900000005960464, -- [4]
			},
			["script_auto_imported"] = {
				["Cast - Small Alert"] = 4,
				["Aura - Invalidate Unit"] = 1,
				["Aura - Buff Alert"] = 4,
				["Unit - Important"] = 5,
				["Aura Border Color"] = 1,
				["Cast - Very Important"] = 2,
				["Explosion Affix M+"] = 3,
				["Unit Power"] = 1,
				["Aura - Debuff Alert"] = 3,
				["Cast - Frontal Cone"] = 2,
				["Fixate"] = 3,
				["Aura - Blink Time Left"] = 1,
				["Color Change"] = 1,
				["Cast - Big Alert"] = 5,
				["Fixate On You"] = 2,
			},
			["saved_cvars"] = {
				["ShowClassColorInNameplate"] = "1",
				["nameplateOverlapV"] = "1.1",
				["nameplateShowSelf"] = "1",
				["nameplateShowEnemyMinus"] = "1",
				["nameplatePersonalShowAlways"] = "0",
				["nameplateMotionSpeed"] = "0.05",
				["nameplateShowFriendlyTotems"] = "0",
				["nameplateGlobalScale"] = "1.0",
				["nameplateShowEnemyMinions"] = "1",
				["nameplateShowFriendlyPets"] = "0",
				["nameplateShowFriendlyNPCs"] = "0",
				["nameplateSelectedScale"] = "1.502991437912",
				["nameplatePersonalShowInCombat"] = "0",
				["nameplatePersonalShowWithTarget"] = "0",
				["nameplateSelfTopInset"] = "0.5",
				["nameplatePersonalHideDelaySeconds"] = "0.2",
				["nameplateResourceOnTarget"] = "0",
				["nameplateMotion"] = "0",
				["nameplateShowAll"] = "1",
				["nameplateMinScale"] = "1",
				["nameplateMaxDistance"] = "100",
				["nameplateShowFriendlyMinions"] = "0",
				["nameplateSelfScale"] = "1.0",
				["nameplateSelfBottomInset"] = "0.2",
				["nameplateOccludedAlphaMult"] = "1",
				["nameplateShowFriendlyGuardians"] = "0",
				["nameplateSelfAlpha"] = "0.75",
				["NamePlateHorizontalScale"] = "1",
				["nameplateOtherTopInset"] = "0.085",
				["ShowNamePlateLoseAggroFlash"] = "1",
				["NamePlateVerticalScale"] = "1",
			},
			["extra_icon_auras"] = {
				277242, -- [1]
			},
			["first_run3"] = true,
			["transparency_behavior"] = 3,
			["spell_animations"] = false,
			["ui_parent_scale_tune"] = 1.562500034924597,
			["aura_tracker"] = {
				["buff_tracked"] = {
					[209859] = true,
				},
			},
			["hook_auto_imported"] = {
				["Reorder Nameplate"] = 3,
				["Dont Have Aura"] = 1,
				["Players Targetting Amount"] = 4,
				["Color Automation"] = 1,
				["Bwonsamdi Reaping"] = 1,
				["Blockade Encounter"] = 1,
				["Hide Neutral Units"] = 1,
				["Aura Reorder"] = 1,
				["Combo Points"] = 3,
				["Extra Border"] = 2,
				["Attacking Specific Unit"] = 1,
				["Target Color"] = 3,
				["Execute Range"] = 1,
				["Jaina Encounter"] = 6,
			},
			["update_throttle"] = 0.05000000074505806,
			["not_affecting_combat_alpha"] = 0.5976737141609192,
			["non_targeted_alpha_enabled"] = true,
			["use_health_animation"] = true,
			["target_highlight_alpha"] = 0.7527135610580444,
			["target_indicator"] = "Ornament",
			["range_check_health_bar_alpha"] = 1,
			["target_shady_alpha"] = 0.5976743698120117,
			["target_highlight_height"] = 14.63406085968018,
			["login_counter"] = 432,
			["patch_version"] = 9,
			["aura_timer_text_size"] = 7,
			["number_region_first_run"] = true,
			["OptionsPanelDB"] = {
				["PlaterOptionsPanelFrame"] = {
					["scale"] = 1,
				},
			},
			["border_thickness"] = 1.001471042633057,
			["captured_spells"] = {
				[150486] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Firephox-Mal'Ganis",
					["npcID"] = 0,
				},
				[6136] = {
					["type"] = "DEBUFF",
					["source"] = "Maleki the Pallid",
					["encounterID"] = 481,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 10438,
				},
				[83847] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 44916,
				},
				[280375] = {
					["source"] = "Lavorre-Dalaran",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[53390] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Notklingon-Zuluhed",
					["npcID"] = 0,
				},
				[78346] = {
					["source"] = "Circuitcity-Agamaggan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[214968] = {
					["source"] = "Caskmates",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[43667] = {
					["encounterID"] = 2026,
					["source"] = "Prince Keleseth",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 23953,
				},
				[33624] = {
					["source"] = "Night Elf Mage",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 35154,
				},
				[312107] = {
					["source"] = "Ghanjaman-Kel'Thuzad",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275773] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[313643] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Viktória-Stormreaver",
					["npcID"] = 0,
				},
				[3149] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Snickerfang Hyena",
					["npcID"] = 5985,
				},
				[315179] = {
					["source"] = "Hidefarrmin-Zul'jin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[270657] = {
					["source"] = "Naddy",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[36247] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Searing Infernal",
					["npcID"] = 6073,
				},
				[42452] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[6360] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Cattneth",
					["npcID"] = 1863,
				},
				[42708] = {
					["encounterID"] = 2025,
					["source"] = "Ingvar the Plunderer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 23954,
				},
				[12748] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Freezing Spirit",
					["npcID"] = 74486,
				},
				[31661] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Firefur-Illidan",
					["encounterID"] = 424,
				},
				[10733] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rasha'krak",
					["npcID"] = 47553,
				},
				[79883] = {
					["source"] = "Ariok",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 48562,
				},
				[403] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Gladrielynne-Shadowmoon",
					["npcID"] = 0,
				},
				[270661] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wargazim-BlackwingLair",
					["npcID"] = 0,
				},
				[115450] = {
					["source"] = "Quijang-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[6464] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rotting Slime",
					["npcID"] = 3928,
				},
				[280385] = {
					["source"] = "Cassíopeía-Blackhand",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[301367] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rangdaha",
					["npcID"] = 0,
				},
				[72975] = {
					["source"] = "Hexmaster Bastoon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 38826,
				},
				[259495] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Renuki-Zul'jin",
					["npcID"] = 0,
				},
				[11021] = {
					["source"] = "Searing Whelp",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 4324,
				},
				[116858] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sweetjuice-Ravencrest",
					["npcID"] = 0,
				},
				[6552] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Millovich-Bonechewer",
					["encounterID"] = 1146,
				},
				[78349] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[18100] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Eldreth Apparition",
					["npcID"] = 11471,
				},
				[80780] = {
					["source"] = "Shrieking Banshee",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10463,
				},
				[24337] = {
					["source"] = "Sentinel Ambusher",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 41854,
				},
				[162264] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Resir-Turalyon",
					["npcID"] = 0,
				},
				[221883] = {
					["source"] = "Thartuk",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[81420] = {
					["source"] = "Gnome Engineer",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 35334,
				},
				[118522] = {
					["source"] = "Dioptry-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[194249] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Chlöe-Malfurion",
					["npcID"] = 0,
				},
				[190411] = {
					["source"] = "Atuzu",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[30926] = {
					["encounterID"] = 1892,
					["source"] = "Nazan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 17307,
				},
				[80781] = {
					["source"] = "Rockwing Screecher",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10409,
				},
				[421] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Notklingon-Zuluhed",
					["npcID"] = 0,
				},
				[75024] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Rasha'krak",
					["npcID"] = 47553,
				},
				[15547] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Riverpaw Poacher",
					["npcID"] = 46250,
				},
				[33626] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Stormwind Soldier",
					["npcID"] = 18948,
				},
				[151008] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Splinterbone Captain",
					["npcID"] = 74371,
				},
				[118779] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Millovich-Bonechewer",
					["npcID"] = 0,
				},
				[82061] = {
					["source"] = "Ariok",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 48562,
				},
				[6816] = {
					["source"] = "Foulweald Warrior",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 3743,
				},
				[205766] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Norly-EmeraldDream",
					["npcID"] = 0,
				},
				[203975] = {
					["source"] = "Gimmiedaloot-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[42454] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Captured Totem",
					["npcID"] = 23811,
				},
				[1715] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Argish",
					["npcID"] = 0,
				},
				[21331] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Deeprot Tangler",
					["npcID"] = 13142,
				},
				[290121] = {
					["source"] = "Benqt-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280398] = {
					["source"] = "Risquê",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[197835] = {
					["source"] = "Hellouda-Mannoroth",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[151010] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Splinterbone Warrior",
					["npcID"] = 74383,
				},
				[288075] = {
					["source"] = "Shushy-Sargeras",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[167898] = {
					["source"] = "Cracky-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[13900] = {
					["npcID"] = 9017,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lord Incendius",
					["encounterID"] = 232,
				},
				[45525] = {
					["source"] = "Warsong Hold Mage",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 25420,
				},
				[235450] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Firefoxy-Duskwood",
					["npcID"] = 0,
				},
				[23922] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kronnaw-Stormrage",
					["npcID"] = 0,
				},
				[77329] = {
					["source"] = "Inconspicuous Box",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 41174,
				},
				[77457] = {
					["source"] = "Bleakheart Trickster",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 3767,
				},
				[17877] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sweetjuice-Ravencrest",
					["npcID"] = 0,
				},
				[245686] = {
					["source"] = "Getcodexd-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[48276] = {
					["type"] = "BUFF",
					["source"] = "Svala Sorrowgrave",
					["encounterID"] = 2030,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 26668,
				},
				[199373] = {
					["source"] = "Army of the Dead",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 24207,
				},
				[228287] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Donatello-Shadowmoon",
					["npcID"] = 0,
				},
				[38233] = {
					["source"] = "Northwatch Encroacher",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 41935,
				},
				[202188] = {
					["source"] = "Mohdara-Dalaran",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267611] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kylez-Thrall",
					["npcID"] = 0,
				},
				[290640] = {
					["source"] = "Xun",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[81296] = {
					["source"] = "Venture Co. Builder",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 4070,
				},
				[276824] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fenrax-Whisperwind",
					["npcID"] = 0,
				},
				[34779] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[3589] = {
					["source"] = "Shrieking Banshee",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10463,
				},
				[295248] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Viktória-Stormreaver",
					["npcID"] = 0,
				},
				[32924] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 18450,
				},
				[115072] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tikigu",
					["npcID"] = 0,
				},
				[51475] = {
					["source"] = "Dark Rune Elementalist",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27962,
				},
				[278873] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rishmage",
					["npcID"] = 0,
				},
				[280409] = {
					["source"] = "Doomkinx-BurningBlade",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[287062] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Monkofdusk",
					["npcID"] = 0,
				},
				[316744] = {
					["source"] = "Kôda",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5225] = {
					["source"] = "Legalcrew",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[33628] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fen Strider",
					["npcID"] = 18134,
				},
				[198097] = {
					["type"] = "DEBUFF",
					["source"] = "Hellouda-Mannoroth",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[31279] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Felmusk Satyr",
					["npcID"] = 3758,
				},
				[1833] = {
					["source"] = "Rogjix-Mal'Ganis",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[31407] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Murkblood Spearman",
					["npcID"] = 17729,
				},
				[34268] = {
					["npcID"] = 18105,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ghaz'an",
					["encounterID"] = 1945,
				},
				[78867] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Felmusk Felsworn",
					["npcID"] = 3762,
				},
				[196819] = {
					["source"] = "Hellouda-Mannoroth",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[7384] = {
					["source"] = "Atuzu",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279902] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Viktória-Stormreaver",
					["npcID"] = 0,
				},
				[298837] = {
					["source"] = "Sukura",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[61391] = {
					["source"] = "Doomkinx-BurningBlade",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[5401] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Cliff Stormer",
					["npcID"] = 4008,
				},
				[298839] = {
					["type"] = "BUFF",
					["source"] = "Musíc-Illidan",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[210126] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Firefoxy-Duskwood",
					["npcID"] = 0,
				},
				[49749] = {
					["source"] = "Nerub'ar Skitterer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 24566,
				},
				[298841] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rèdira-Thrall",
					["npcID"] = 0,
				},
				[278244] = {
					["source"] = "Hilshin-Azgalor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[204242] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[212653] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Firefoxy-Duskwood",
					["npcID"] = 0,
				},
				[79892] = {
					["type"] = "BUFF",
					["source"] = "Unknown",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 50174,
				},
				[23337] = {
					["source"] = "Warsong Battleguard",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 25242,
				},
				[48278] = {
					["encounterID"] = 2030,
					["source"] = "Ritual Channeler",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27281,
				},
				[198149] = {
					["source"] = "Arylla-AlteracMountains",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[475] = {
					["encounterID"] = 1996,
					["source"] = "Darkdanash-Quel'Thalas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[214222] = {
					["source"] = "Thartuk",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[212431] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sathienis-Shu'halo",
					["encounterID"] = 427,
				},
				[50645] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[251836] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lasthor-Aggramar",
					["npcID"] = 0,
				},
				[5137] = {
					["source"] = "Undead Postman",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 11142,
				},
				[49020] = {
					["source"] = "Kaeji-Terokkar",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[205523] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tikigu",
					["npcID"] = 0,
				},
				[126462] = {
					["source"] = "Clerks",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[185565] = {
					["source"] = "Teksubshaw-Thrall",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[198103] = {
					["encounterID"] = 429,
					["source"] = "Kazorra-Tichondrius",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[51714] = {
					["type"] = "DEBUFF",
					["source"] = "Kaeji-Terokkar",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[251837] = {
					["source"] = "Monkcopeland",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[13341] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Enraged Fire Elemental",
					["npcID"] = 46261,
				},
				[127230] = {
					["source"] = "Cassíopeía-Blackhand",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[55095] = {
					["type"] = "DEBUFF",
					["source"] = "Kaeji-Terokkar",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[125439] = {
					["encounterID"] = 479,
					["source"] = "Quijang-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[49184] = {
					["source"] = "Kaeji-Terokkar",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[37361] = {
					["source"] = "Skeletal Guardian",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10390,
				},
				[82836] = {
					["source"] = "Rageroar Grunt",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 38658,
				},
				[15284] = {
					["source"] = "Warsong Hold Warrior",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 25414,
				},
				[185422] = {
					["type"] = "BUFF",
					["source"] = "Hellouda-Mannoroth",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1943] = {
					["source"] = "Rogjix-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[53] = {
					["source"] = "Hellouda-Mannoroth",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[16791] = {
					["type"] = "BUFF",
					["source"] = "Magistrate Barthilas",
					["encounterID"] = 482,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 10435,
				},
				[185438] = {
					["source"] = "Hellouda-Mannoroth",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[115192] = {
					["type"] = "BUFF",
					["source"] = "Hellouda-Mannoroth",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1953] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Norly-EmeraldDream",
					["npcID"] = 0,
				},
				[251839] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zurgul",
					["npcID"] = 0,
				},
				[91021] = {
					["type"] = "DEBUFF",
					["source"] = "Hellouda-Mannoroth",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[150001] = {
					["npcID"] = 74347,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mordresh Fire Eye",
					["encounterID"] = 1663,
				},
				[212423] = {
					["source"] = "Risen Skulker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 99541,
				},
				[31376] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Dun Garok Spirit",
					["npcID"] = 49269,
				},
				[45528] = {
					["type"] = "BUFF",
					["source"] = "Warsong Hold Shaman",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 25421,
				},
				[253595] = {
					["source"] = "Grixxis-Ysera",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[50646] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[184362] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Trollnareff",
					["npcID"] = 0,
				},
				[17207] = {
					["source"] = "Ashenvale Skirmisher",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 33193,
				},
				[150002] = {
					["type"] = "BUFF",
					["source"] = "Blazing Servitor",
					["npcID"] = 74548,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1663,
				},
				[81302] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Queen Silith",
					["npcID"] = 41185,
				},
				[185313] = {
					["source"] = "Hellouda-Mannoroth",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[208086] = {
					["source"] = "Atuzu",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[70233] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Clumsymist",
					["npcID"] = 0,
				},
				[15499] = {
					["source"] = "Warsong Hold Shaman",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 25421,
				},
				[198688] = {
					["type"] = "DEBUFF",
					["source"] = "Hellouda-Mannoroth",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[45182] = {
					["type"] = "BUFF",
					["source"] = "Hellouda-Mannoroth",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[498] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[82326] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[45181] = {
					["type"] = "DEBUFF",
					["source"] = "Hellouda-Mannoroth",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[45957] = {
					["type"] = "BUFF",
					["source"] = "Unknown",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 25761,
				},
				[7992] = {
					["source"] = "Darkfang Creeper",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 4412,
				},
				[195452] = {
					["type"] = "DEBUFF",
					["source"] = "Hellouda-Mannoroth",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[17687] = {
					["type"] = "BUFF",
					["source"] = "Ramstein the Gorger",
					["encounterID"] = 483,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 10439,
				},
				[57327] = {
					["type"] = "BUFF",
					["source"] = "Captfoxie-Shadowmoon",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[114014] = {
					["source"] = "Hellouda-Mannoroth",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[86736] = {
					["type"] = "BUFF",
					["source"] = "Hogger",
					["npcID"] = 46254,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1144,
				},
				[21909] = {
					["type"] = "BUFF",
					["source"] = "Princess Theradras",
					["encounterID"] = 429,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 12201,
				},
				[45584] = {
					["type"] = "BUFF",
					["source"] = "Warsong Captain",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 25446,
				},
				[210391] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zanalia",
					["npcID"] = 0,
				},
				[212743] = {
					["source"] = "Hellouda-Mannoroth",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[88084] = {
					["encounterID"] = 480,
					["source"] = "Darkssol-Proudmoore",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 47243,
				},
				[264571] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lamäshtu-Ghostlands",
					["npcID"] = 0,
				},
				[16172] = {
					["source"] = "Ghoul Ravener",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10406,
				},
				[15664] = {
					["source"] = "Flamekin Spitter",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 9776,
				},
				[48267] = {
					["type"] = "DEBUFF",
					["source"] = "Svala Sorrowgrave",
					["encounterID"] = 2030,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 26668,
				},
				[45578] = {
					["source"] = "Warsong Marksman",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 25244,
				},
				[45587] = {
					["source"] = "Nerub'ar Sky Darkener",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 25451,
				},
				[192225] = {
					["source"] = "Seijabank",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[45577] = {
					["source"] = "Nerub'ar Sky Darkener",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 25451,
				},
				[355] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kronnaw-Stormrage",
					["npcID"] = 0,
				},
				[38557] = {
					["source"] = "Krom'gar Logger",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 35160,
				},
				[38621] = {
					["source"] = "Proto-Drake Handler",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 24082,
				},
				[18327] = {
					["encounterID"] = 479,
					["source"] = "Baroness Anastari",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10436,
				},
				[18499] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Argish",
					["npcID"] = 0,
				},
				[198111] = {
					["source"] = "Candieman-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[32752] = {
					["source"] = "Sombriste",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[45987] = {
					["type"] = "BUFF",
					["source"] = "Unknown",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 25467,
				},
				[77978] = {
					["source"] = "Patchwork Horror",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 10414,
				},
				[38556] = {
					["source"] = "Kaskala Defender",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 25764,
				},
				[115080] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Donatello-Shadowmoon",
					["npcID"] = 0,
				},
				[50995] = {
					["type"] = "BUFF",
					["source"] = "Unknown",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 26170,
				},
				[313571] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Viktória-Stormreaver",
					["npcID"] = 0,
				},
				[6201] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Viktória-Stormreaver",
					["npcID"] = 0,
				},
				[147193] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kanitos-Gurubashi",
					["npcID"] = 0,
				},
				[188389] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mona-Sargeras",
					["npcID"] = 0,
				},
				[51799] = {
					["type"] = "BUFF",
					["source"] = "Dark Rune Scholar",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 27964,
				},
				[20822] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Splinterbone Frostweaver",
					["npcID"] = 74379,
				},
				[81305] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Boulderslide Rock Keeper",
					["npcID"] = 11915,
				},
				[48168] = {
					["type"] = "BUFF",
					["source"] = "Unknown",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 50163,
				},
				[527] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bqr-Tichondrius",
					["npcID"] = 0,
				},
				[187878] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Firephox-Mal'Ganis",
					["npcID"] = 0,
				},
				[248170] = {
					["source"] = "Razzakin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[77851] = {
					["source"] = "Sakikaru-Zangarmarsh",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[196834] = {
					["type"] = "BUFF",
					["source"] = "Firephox-Mal'Ganis",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1662,
				},
				[256453] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hotload-Thrall",
					["npcID"] = 0,
				},
				[79962] = {
					["type"] = "BUFF",
					["source"] = "Unknown",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 50160,
				},
				[185562] = {
					["type"] = "BUFF",
					["source"] = "Evanxd-BloodFurnace",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[35361] = {
					["type"] = "BUFF",
					["source"] = "Unknown",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 31228,
				},
				[12654] = {
					["source"] = "Candieman-Illidan",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[304370] = {
					["type"] = "BUFF",
					["source"] = "Vîxsin-Zul'jin",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[40505] = {
					["source"] = "Mor'shan Defender",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 33201,
				},
				[6353] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sweetjuice-Ravencrest",
					["npcID"] = 0,
				},
				[23381] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Riverpaw Shaman",
					["npcID"] = 46252,
				},
				[31601] = {
					["source"] = "Crypt Crawler",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10412,
				},
				[8656] = {
					["source"] = "Mirefin Murloc",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 4359,
				},
				[306474] = {
					["type"] = "DEBUFF",
					["source"] = "Lojicke",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[301886] = {
					["type"] = "BUFF",
					["source"] = "Lojicke",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273794] = {
					["source"] = "Wrekin-Ysera",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[546] = {
					["source"] = "Deshi-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[105809] = {
					["type"] = "BUFF",
					["source"] = "Derek-BleedingHollow",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[35570] = {
					["source"] = "Dragonflayer Overseer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 24085,
				},
				[281216] = {
					["type"] = "BUFF",
					["source"] = "Keystrokes",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[13446] = {
					["npcID"] = 13141,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Deeprot Stomper",
					["encounterID"] = 427,
				},
				[232854] = {
					["type"] = "BUFF",
					["source"] = "Reshoof",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[254474] = {
					["type"] = "BUFF",
					["source"] = "Balarion",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297117] = {
					["type"] = "BUFF",
					["source"] = "Faythè",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[68641] = {
					["source"] = "Apothecary Hummel",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 36296,
				},
				[33377] = {
					["source"] = "Thartuk",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[256456] = {
					["source"] = "Ðarkwraith",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[15037] = {
					["source"] = "Scorching Totem",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 9637,
				},
				[213981] = {
					["type"] = "BUFF",
					["source"] = "Hellouda-Mannoroth",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[89751] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Orikvazul",
					["npcID"] = 17252,
				},
				[33697] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Horiguchi-Zul'jin",
					["npcID"] = 0,
				},
				[264761] = {
					["type"] = "BUFF",
					["source"] = "Ksang-Illidan",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[245710] = {
					["source"] = "Kaydrick-Azshara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[317065] = {
					["type"] = "BUFF",
					["source"] = "Kaspir-BleedingHollow",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[3019] = {
					["type"] = "BUFF",
					["source"] = "Tortured Earth Spirit",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 17156,
				},
				[54487] = {
					["source"] = "Goreclaw the Ravenous",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 23873,
				},
				[89739] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "\"Captain\" Cookie",
					["npcID"] = 47739,
				},
				[39215] = {
					["source"] = "Goretooth",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 17144,
				},
				[224729] = {
					["encounterID"] = 426,
					["source"] = "Theradrim Shardling",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 11783,
				},
				[43135] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bubbling Swamp Ooze",
					["npcID"] = 4394,
				},
				[32127] = {
					["source"] = "Farseer Kurkush",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 18066,
				},
				[277185] = {
					["source"] = "Candieman-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[50841] = {
					["type"] = "DEBUFF",
					["source"] = "Sjonnir The Ironshaper",
					["encounterID"] = 1998,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 27978,
				},
				[34428] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Millovich-Bonechewer",
					["npcID"] = 0,
				},
				[79850] = {
					["source"] = "Dreadmaul Ogre Mage",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 5975,
				},
				[32132] = {
					["source"] = "Murkblood Putrifier",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 18202,
				},
				[31981] = {
					["source"] = "Ortor of Murkblood",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 18204,
				},
				[210657] = {
					["source"] = "Mohdara-Dalaran",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[32013] = {
					["source"] = "Muck Spawn",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 17154,
				},
				[6673] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Trollnareff",
					["npcID"] = 0,
				},
				[71969] = {
					["source"] = "Thartuk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[11327] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sneakyjr-Stormrage",
					["npcID"] = 0,
				},
				[58506] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 33777,
				},
				[30283] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Christsaves-Lightbringer",
					["npcID"] = 0,
				},
				[78622] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Dreadmaul Brute",
					["npcID"] = 5976,
				},
				[585] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Vulperry-Illidan",
					["npcID"] = 0,
				},
				[586] = {
					["type"] = "BUFF",
					["source"] = "Hollyfox",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 232,
				},
				[15038] = {
					["source"] = "Warmaul Shaman",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 18064,
				},
				[256460] = {
					["source"] = "Bojacks-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[81309] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Boulderslide Geomancer",
					["npcID"] = 11917,
				},
				[236502] = {
					["source"] = "Deshi-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[91800] = {
					["source"] = "Ratleaper",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 26125,
				},
				[204262] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mikorikanuwu-Dalaran",
					["npcID"] = 0,
				},
				[48380] = {
					["type"] = "BUFF",
					["source"] = "Spirit Fount",
					["encounterID"] = 2028,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 27339,
				},
				[18968] = {
					["source"] = "Firemane Scalebane",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 4328,
				},
				[16953] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Moosejaw-Shadowmoon",
					["npcID"] = 0,
				},
				[596] = {
					["source"] = "Aelymn",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[6817] = {
					["source"] = "Foulweald Pathfinder",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 3745,
				},
				[48294] = {
					["type"] = "BUFF",
					["source"] = "King Ymiron",
					["encounterID"] = 2028,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 26861,
				},
				[29363] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 1554,
				},
				[117405] = {
					["type"] = "DEBUFF",
					["source"] = "Nighkeo-Arathor",
					["encounterID"] = 2028,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[78751] = {
					["source"] = "Tendril from Below",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 33419,
				},
				[190446] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lunalie-Illidan",
					["npcID"] = 0,
				},
				[111759] = {
					["source"] = "Kaydrick-Azshara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[50842] = {
					["source"] = "Gissëlle-Quel'Thalas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[77216] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kharanos Rifleman",
					["npcID"] = 41182,
				},
				[199658] = {
					["source"] = "Atuzu",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[77472] = {
					["source"] = "Kazorra-Tichondrius",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[273298] = {
					["source"] = "Chipmonkas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[53209] = {
					["source"] = "Nizmo-Gnomeregan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[48529] = {
					["encounterID"] = 2028,
					["source"] = "King Ymiron",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26861,
				},
				[151810] = {
					["npcID"] = 74434,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Amnennar the Coldbringer",
					["encounterID"] = 1666,
				},
				[273299] = {
					["source"] = "Chipmonkas",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[51750] = {
					["encounterID"] = 2028,
					["source"] = "King Ymiron",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26861,
				},
				[21655] = {
					["type"] = "BUFF",
					["source"] = "Lord Vyletongue",
					["npcID"] = 12236,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 424,
				},
				[50868] = {
					["encounterID"] = 1994,
					["source"] = "Krystallus",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27977,
				},
				[48291] = {
					["encounterID"] = 2028,
					["source"] = "King Ymiron",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26861,
				},
				[49204] = {
					["source"] = "Ymirjar Dusk Shaman",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26694,
				},
				[32018] = {
					["source"] = "Storm Rager",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 17159,
				},
				[42780] = {
					["source"] = "Dragonflayer Ironhelm",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 23961,
				},
				[42740] = {
					["source"] = "Dragonflayer Runecaster",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 23960,
				},
				[4962] = {
					["source"] = "Crypt Beast",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10413,
				},
				[11983] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dark Iron Steamsmith",
					["npcID"] = 5840,
				},
				[272790] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Magiss-Blackhand",
					["npcID"] = 0,
				},
				[124682] = {
					["source"] = "Chipmonkas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[33763] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Taurenschit-Tichondrius",
					["npcID"] = 0,
				},
				[115834] = {
					["type"] = "BUFF",
					["source"] = "Loano-Ravencrest",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[14110] = {
					["source"] = "Bloodpetal Trapper",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 6512,
				},
				[2818] = {
					["source"] = "Rogjix-Mal'Ganis",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279956] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Zoth-Nemesis",
					["npcID"] = 0,
				},
				[49172] = {
					["type"] = "BUFF",
					["source"] = "Ymirjar Dusk Shaman",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 26694,
				},
				[49170] = {
					["type"] = "BUFF",
					["source"] = "Ymirjar Dusk Shaman",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 26694,
				},
				[49106] = {
					["source"] = "Ymirjar Berserker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26696,
				},
				[7105] = {
					["source"] = "Private Hallan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 5045,
				},
				[231390] = {
					["source"] = "Banthael-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[143625] = {
					["source"] = "Jerathor-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[50843] = {
					["encounterID"] = 1994,
					["source"] = "Krystallus",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27977,
				},
				[288146] = {
					["source"] = "Mokka",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[49165] = {
					["type"] = "DEBUFF",
					["source"] = "Ymirjar Berserker",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 26696,
				},
				[232670] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lamäshtu-Ghostlands",
					["npcID"] = 0,
				},
				[32722] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Blistering Rot",
					["npcID"] = 16901,
				},
				[30707] = {
					["encounterID"] = 1891,
					["source"] = "Omor the Unscarred",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 17308,
				},
				[642] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[288074] = {
					["type"] = "BUFF",
					["source"] = "Bomorgana",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[7328] = {
					["source"] = "Thartuk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[50234] = {
					["encounterID"] = 2029,
					["source"] = "Skadi the Ruthless",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26693,
				},
				[50228] = {
					["type"] = "BUFF",
					["source"] = "Skadi the Ruthless",
					["encounterID"] = 2029,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 26693,
				},
				[16570] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Prince Raze",
					["npcID"] = 10647,
				},
				[86814] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Riverpaw Basher",
					["npcID"] = 46248,
				},
				[50258] = {
					["type"] = "DEBUFF",
					["encounterID"] = 2029,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[22807] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Stailc-Thrall",
					["npcID"] = 0,
				},
				[151575] = {
					["npcID"] = 74347,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mordresh Fire Eye",
					["encounterID"] = 1663,
				},
				[56222] = {
					["source"] = "Gissëlle-Quel'Thalas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[49092] = {
					["source"] = "Ymirjar Harpooner",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26692,
				},
				[49084] = {
					["source"] = "Ymirjar Witch Doctor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26691,
				},
				[297162] = {
					["source"] = "Chillpill",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[7289] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Twilight Dark Shaman",
					["npcID"] = 5860,
				},
				[48640] = {
					["source"] = "Ymirjar Warrior",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26690,
				},
				[65214] = {
					["source"] = "Lord Magmathar",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 34295,
				},
				[48221] = {
					["source"] = "Malohint",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[48261] = {
					["encounterID"] = 2027,
					["source"] = "Gortok Palehoof",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26687,
				},
				[17484] = {
					["source"] = "Meatlode-BurningBlade",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[78371] = {
					["source"] = "Krom'gar Demolisher",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 42055,
				},
				[48260] = {
					["encounterID"] = 2027,
					["source"] = "Gortok Palehoof",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26687,
				},
				[267171] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Christsaves-Lightbringer",
					["npcID"] = 0,
				},
				[48130] = {
					["source"] = "Ferocious Rhino",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26686,
				},
				[78529] = {
					["source"] = "Vtecc-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[131347] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Alltruis",
					["npcID"] = 0,
				},
				[48131] = {
					["source"] = "Ferocious Rhino",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26686,
				},
				[48136] = {
					["source"] = "Massive Jormungar",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26685,
				},
				[48133] = {
					["source"] = "Massive Jormungar",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26685,
				},
				[48132] = {
					["source"] = "Massive Jormungar",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26685,
				},
				[23511] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Orgrimmar Grunt",
					["npcID"] = 18950,
				},
				[267685] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Norly-EmeraldDream",
					["npcID"] = 0,
				},
				[17434] = {
					["encounterID"] = 484,
					["source"] = "Lord Aurius Rivendare",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 45412,
				},
				[5394] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Notklingon-Zuluhed",
					["encounterID"] = 427,
				},
				[49029] = {
					["type"] = "BUFF",
					["source"] = "Büttèrs-Ragnaros",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[316814] = {
					["source"] = "Sukura",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[78372] = {
					["source"] = "Krom'gar Demolisher",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 42055,
				},
				[53595] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[51612] = {
					["source"] = "Dark Rune Scholar",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27964,
				},
				[633] = {
					["source"] = "Thartuk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[32019] = {
					["source"] = "Goreclaw the Ravenous",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 23873,
				},
				[48876] = {
					["source"] = "Ymirjar Savage",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26669,
				},
				[12975] = {
					["source"] = "Tahnok-Thunderhorn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288158] = {
					["source"] = "Vanysh",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[124430] = {
					["source"] = "Kaydrick-Azshara",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[48880] = {
					["source"] = "Ymirjar Savage",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26669,
				},
				[688] = {
					["source"] = "Sombriste",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[48854] = {
					["source"] = "Ymirjar Flesh Hunter",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26670,
				},
				[15118] = {
					["source"] = "Thartuk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[50900] = {
					["encounterID"] = 1998,
					["source"] = "Forged Iron Trogg",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27979,
				},
				[180734] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kyly",
					["npcID"] = 0,
				},
				[44256] = {
					["source"] = "Warsong Captain",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 25446,
				},
				[272296] = {
					["source"] = "Puddycat-Thrall",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[204019] = {
					["source"] = "Radar-Arygos",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[2782] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Onedruid-Zul'jin",
					["npcID"] = 0,
				},
				[50653] = {
					["source"] = "Enslaved Proto-Drake",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 24083,
				},
				[48246] = {
					["encounterID"] = 2030,
					["source"] = "Flame Brazier",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27273,
				},
				[79859] = {
					["source"] = "Dreadmaul Ogre Mage",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 5975,
				},
				[79140] = {
					["encounterID"] = 2030,
					["source"] = "Loano-Ravencrest",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[78837] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ghostpaw Alpha",
					["npcID"] = 3825,
				},
				[59228] = {
					["source"] = "Scourge Hulk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26555,
				},
				[703] = {
					["source"] = "Rogjix-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[61336] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Moosejaw-Shadowmoon",
					["npcID"] = 0,
				},
				[20473] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[51484] = {
					["type"] = "BUFF",
					["source"] = "Dark Rune Theurgist",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 27963,
				},
				[125071] = {
					["type"] = "BUFF",
					["source"] = "Reshoof",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273323] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Woozah-Mal'Ganis",
					["npcID"] = 0,
				},
				[13375] = {
					["source"] = "Flamescale Broodling",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 7049,
				},
				[193530] = {
					["type"] = "BUFF",
					["source"] = "Phoque-Hyjal",
					["encounterID"] = 1893,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193786] = {
					["source"] = "Shamstral-BleedingHollow",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[257410] = {
					["source"] = "Lelliena",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[316823] = {
					["source"] = "Gizuh",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[180749] = {
					["source"] = "Bearblud",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[20793] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Boulderslide Geomancer",
					["npcID"] = 11917,
				},
				[295842] = {
					["source"] = "Marrowguard",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[15550] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bog Giant",
					["npcID"] = 17723,
				},
				[48697] = {
					["source"] = "Scourge Hulk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26555,
				},
				[45] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Raging Ancient",
					["npcID"] = 33688,
				},
				[33702] = {
					["type"] = "BUFF",
					["source"] = "Christsaves-Lightbringer",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1946,
				},
				[90560] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Unknown",
					["npcID"] = 47739,
				},
				[48851] = {
					["source"] = "Dragonflayer Deathseeker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26550,
				},
				[159786] = {
					["type"] = "BUFF",
					["source"] = "Scruffy",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 41166,
				},
				[71978] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[281000] = {
					["source"] = "Orecchini-Tichondrius",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[34086] = {
					["source"] = "Maiden of Pain",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 19408,
				},
				[154953] = {
					["type"] = "DEBUFF",
					["source"] = "Loano-Ravencrest",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[408] = {
					["source"] = "Loano-Ravencrest",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[44513] = {
					["source"] = "Pepinilla",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[1329] = {
					["source"] = "Loano-Ravencrest",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[27576] = {
					["source"] = "Loano-Ravencrest",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[21337] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Deeprot Tangler",
					["npcID"] = 13142,
				},
				[269747] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Renuki-Zul'jin",
					["npcID"] = 0,
				},
				[17307] = {
					["encounterID"] = 483,
					["source"] = "Ramstein the Gorger",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10439,
				},
				[34662] = {
					["npcID"] = 17826,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Swamplord Musel'ek",
					["encounterID"] = 1947,
				},
				[1966] = {
					["type"] = "BUFF",
					["source"] = "Loano-Ravencrest",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[33424] = {
					["source"] = "Mag'har Pitfighter",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 19140,
				},
				[17435] = {
					["encounterID"] = 484,
					["source"] = "Lord Aurius Rivendare",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 45412,
				},
				[147732] = {
					["type"] = "DEBUFF",
					["source"] = "Firephox-Mal'Ganis",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1664,
				},
				[32943] = {
					["type"] = "BUFF",
					["source"] = "Warp Hunter",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 18465,
				},
				[256735] = {
					["source"] = "Poofdead",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[32942] = {
					["type"] = "BUFF",
					["source"] = "Unknown",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 18465,
				},
				[70316] = {
					["source"] = "Ogron",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 4983,
				},
				[86820] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Riverpaw Looter",
					["npcID"] = 46251,
				},
				[745] = {
					["source"] = "Darkmist Silkspinner",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 4379,
				},
				[32020] = {
					["source"] = "Talbuk Thorngrazer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 17131,
				},
				[32281] = {
					["type"] = "BUFF",
					["source"] = "Unknown",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 18261,
				},
				[55964] = {
					["type"] = "BUFF",
					["source"] = "Randolph Moloch",
					["npcID"] = 46383,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1146,
				},
				[83366] = {
					["source"] = "Ravasaur Runner",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 6506,
				},
				[8936] = {
					["source"] = "Balloo-Zangarmarsh",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[187650] = {
					["source"] = "Phoque-Hyjal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[45985] = {
					["type"] = "BUFF",
					["source"] = "Unknown",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 25470,
				},
				[32104] = {
					["source"] = "Murkblood Brute",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 18211,
				},
				[202225] = {
					["type"] = "BUFF",
					["source"] = "Rucar-Aggramar",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[755] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xponential-Duskwood",
					["npcID"] = 0,
				},
				[252387] = {
					["source"] = "Apachuuirn",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[166669] = {
					["source"] = "Monèybågzz",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[303017] = {
					["source"] = "Chipmonkas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[30285] = {
					["source"] = "Windroc",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 17128,
				},
				[28694] = {
					["type"] = "BUFF",
					["source"] = "Jarrick-Mal'Ganis",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[12160] = {
					["source"] = "Tar Lord",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 6519,
				},
				[8137] = {
					["source"] = "Gorishi Wasp",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 6551,
				},
				[32023] = {
					["source"] = "Clefthoof",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 18205,
				},
				[118038] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Argish",
					["npcID"] = 0,
				},
				[83367] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Young Diemetradon",
					["npcID"] = 9162,
				},
				[150550] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Death's Head Shadowmender",
					["npcID"] = 74478,
				},
				[70235] = {
					["source"] = "Bbnomoney",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[768] = {
					["source"] = "Balloo-Zangarmarsh",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[16380] = {
					["source"] = "Eye of Naxxramas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 10411,
				},
				[196608] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cartujo-Agamaggan",
					["npcID"] = 0,
				},
				[78904] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Shadowsworn Occultist",
					["npcID"] = 42297,
				},
				[35333] = {
					["source"] = "Marshfang Slicer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 18131,
				},
				[8258] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kharanos Mountaineer",
					["npcID"] = 41181,
				},
				[774] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Taurenschit-Tichondrius",
					["npcID"] = 0,
				},
				[33795] = {
					["type"] = "BUFF",
					["source"] = "Ertex-Sargeras",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[33581] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Justinius the Harbinger",
					["npcID"] = 18966,
				},
				[47585] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kanitos-Gurubashi",
					["npcID"] = 0,
				},
				[3110] = {
					["source"] = "Belyal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 416,
				},
				[89253] = {
					["source"] = "Xodorn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[20826] = {
					["source"] = "Blackrock Warlock",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 7028,
				},
				[781] = {
					["source"] = "Renuki-Zul'jin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[264130] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Christsaves-Lightbringer",
					["encounterID"] = 1946,
				},
				[783] = {
					["source"] = "Hettok",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[155158] = {
					["source"] = "Candieman-Illidan",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[243435] = {
					["type"] = "BUFF",
					["source"] = "Quijang-Illidan",
					["encounterID"] = 479,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[12540] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Putridus Satyr",
					["npcID"] = 11790,
				},
				[33896] = {
					["source"] = "Stonescythe Whelp",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 16927,
				},
				[3150] = {
					["source"] = "Rabid Blisterpaw",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 5427,
				},
				[23161] = {
					["type"] = "BUFF",
					["source"] = "Ughlookatu",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[173959] = {
					["type"] = "BUFF",
					["source"] = "Derek-BleedingHollow",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193796] = {
					["source"] = "Shamstral-BleedingHollow",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[318391] = {
					["type"] = "DEBUFF",
					["source"] = "Great Worm From Beyond",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 152550,
				},
				[243955] = {
					["type"] = "BUFF",
					["source"] = "Demonisch",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[262115] = {
					["source"] = "Atuzu",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[77129] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Shadowsworn Obstructor",
					["npcID"] = 41191,
				},
				[85288] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Trollnareff",
					["npcID"] = 0,
				},
				[158486] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ariadrina",
					["npcID"] = 0,
				},
				[274369] = {
					["source"] = "Rashima",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[89766] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Orikvazul",
					["npcID"] = 17252,
				},
				[8690] = {
					["source"] = "Rogjix-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[49121] = {
					["type"] = "BUFF",
					["source"] = "Ymirjar Berserker",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 26696,
				},
				[19483] = {
					["source"] = "Infernal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 89,
				},
				[21562] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Chlöe-Malfurion",
					["npcID"] = 0,
				},
				[34984] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fen Ray",
					["npcID"] = 17731,
				},
				[298728] = {
					["source"] = "Beergrillz",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[90662] = {
					["source"] = "Ariok",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 48562,
				},
				[19643] = {
					["source"] = "Thrallmar Grunt",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 16580,
				},
				[273348] = {
					["source"] = "Squatrack-Gnomeregan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[68529] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Furbattitude",
					["npcID"] = 0,
				},
				[196741] = {
					["type"] = "BUFF",
					["source"] = "Weeabboo",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[3242] = {
					["source"] = "Thornfang Ravager",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 19349,
				},
				[190984] = {
					["source"] = "Balloo-Zangarmarsh",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[83370] = {
					["source"] = "Stone Guardian",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 6560,
				},
				[280149] = {
					["type"] = "BUFF",
					["source"] = "Quilled",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[319919] = {
					["source"] = "Yensu-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[15087] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Putridus Shadowstalker",
					["npcID"] = 11792,
				},
				[275909] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Flabanabba-Gorefiend",
					["npcID"] = 0,
				},
				[15119] = {
					["source"] = "Thartuk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[55078] = {
					["source"] = "Gissëlle-Quel'Thalas",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[304056] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Flabanabba-Gorefiend",
					["npcID"] = 0,
				},
				[198590] = {
					["source"] = "Sombriste",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[280615] = {
					["source"] = "Helemental",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[6713] = {
					["source"] = "Bonechewer Hungerer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 17259,
				},
				[290819] = {
					["source"] = "Emozo",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[68530] = {
					["source"] = "Vognar-Azgalor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[87081] = {
					["source"] = "Blackrock Slayer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 7027,
				},
				[219788] = {
					["source"] = "Gissëlle-Quel'Thalas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[209261] = {
					["type"] = "DEBUFF",
					["source"] = "Chìtoh-Zul'jin",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[197277] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[49966] = {
					["source"] = "Aaron",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 3242,
				},
				[32693] = {
					["type"] = "BUFF",
					["source"] = "Dark Rune Elementalist",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 27962,
				},
				[35336] = {
					["type"] = "BUFF",
					["source"] = "Sporebat",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 18128,
				},
				[86659] = {
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[300989] = {
					["source"] = "Therian-BloodFurnace",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[26977] = {
					["npcID"] = 9017,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lord Incendius",
					["encounterID"] = 232,
				},
				[15407] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Chlöe-Malfurion",
					["npcID"] = 0,
				},
				[298431] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mona-Sargeras",
					["npcID"] = 0,
				},
				[185358] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sathienis-Shu'halo",
					["npcID"] = 0,
				},
				[53600] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[15471] = {
					["source"] = "Crypt Crawler",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10412,
				},
				[28747] = {
					["type"] = "BUFF",
					["source"] = "Sjonnir The Ironshaper",
					["encounterID"] = 1998,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 27978,
				},
				[48846] = {
					["type"] = "BUFF",
					["source"] = "Darkdanash-Quel'Thalas",
					["encounterID"] = 1998,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[50840] = {
					["type"] = "BUFF",
					["source"] = "Sjonnir The Ironshaper",
					["encounterID"] = 1998,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 27978,
				},
				[39591] = {
					["source"] = "Foulweald Totemic",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 3750,
				},
				[845] = {
					["encounterID"] = 2030,
					["source"] = "Orecchini-Tichondrius",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[50834] = {
					["encounterID"] = 1998,
					["source"] = "Sjonnir The Ironshaper",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27978,
				},
				[6770] = {
					["source"] = "Teksubshaw-Thrall",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[50830] = {
					["encounterID"] = 1998,
					["source"] = "Sjonnir The Ironshaper",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27978,
				},
				[39911] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Blueballz-Staghelm",
					["npcID"] = 0,
				},
				[13584] = {
					["source"] = "Theradrim Shardling",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 11783,
				},
				[33898] = {
					["source"] = "Stonescythe Whelp",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 16927,
				},
				[106785] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Moosejaw-Shadowmoon",
					["npcID"] = 0,
				},
				[853] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[303041] = {
					["source"] = "Darthpaws",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297412] = {
					["source"] = "Sukura",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[50895] = {
					["encounterID"] = 1998,
					["source"] = "Forged Iron Dwarf",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27982,
				},
				[697] = {
					["source"] = "Cooler-Dawnbringer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[89734] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 48295,
				},
				[13728] = {
					["source"] = "Tortured Earth Spirit",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 17156,
				},
				[50752] = {
					["encounterID"] = 1996,
					["source"] = "Maiden of Grief",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27975,
				},
				[50761] = {
					["encounterID"] = 1996,
					["source"] = "Maiden of Grief",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27975,
				},
				[52383] = {
					["source"] = "Lightning Construct",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27972,
				},
				[232698] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Chlöe-Malfurion",
					["npcID"] = 0,
				},
				[33661] = {
					["encounterID"] = 1995,
					["source"] = "Iron Golem Custodian",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27985,
				},
				[11366] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Firefur-Illidan",
					["npcID"] = 0,
				},
				[6922] = {
					["source"] = "Elder Shadowhorn Stag",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 3818,
				},
				[51001] = {
					["encounterID"] = 1995,
					["source"] = "Dark Matter",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 28235,
				},
				[315336] = {
					["source"] = "Tent",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 161974,
				},
				[528] = {
					["source"] = "Derive-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[51490] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mona-Sargeras",
					["npcID"] = 0,
				},
				[871] = {
					["source"] = "Tahnok-Thunderhorn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[86765] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Slag Fury",
					["npcID"] = 46263,
				},
				[13952] = {
					["source"] = "Marshal Paltrow",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 41937,
				},
				[176151] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Stinkybeard",
					["npcID"] = 0,
				},
				[51819] = {
					["type"] = "BUFF",
					["source"] = "Raging Construct",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 27970,
				},
				[39592] = {
					["source"] = "Summoned Searing Totem",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 22895,
				},
				[11969] = {
					["source"] = "Firemane Ash Tail",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 4331,
				},
				[11985] = {
					["source"] = "Searing Hatchling",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 4323,
				},
				[77489] = {
					["source"] = "Aelymn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[4987] = {
					["source"] = "Thartuk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[51494] = {
					["type"] = "BUFF",
					["source"] = "Dark Rune Giant",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 27969,
				},
				[186387] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sathienis-Shu'halo",
					["npcID"] = 0,
				},
				[14112] = {
					["source"] = "Bloodpetal Flayer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 6510,
				},
				[48292] = {
					["encounterID"] = 2028,
					["source"] = "King Ymiron",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26861,
				},
				[78257] = {
					["source"] = "Wuara-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[90667] = {
					["source"] = "Ariok",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 48562,
				},
				[295373] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fenrax-Whisperwind",
					["npcID"] = 0,
				},
				[194509] = {
					["encounterID"] = 1994,
					["source"] = "Derive-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[30455] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lunalie-Illidan",
					["npcID"] = 0,
				},
				[5217] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Moosejaw-Shadowmoon",
					["npcID"] = 0,
				},
				[44425] = {
					["source"] = "Darkssol-Proudmoore",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[50836] = {
					["type"] = "DEBUFF",
					["source"] = "Rajukah-Illidan",
					["encounterID"] = 1994,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[50833] = {
					["type"] = "DEBUFF",
					["source"] = "Rajukah-Illidan",
					["encounterID"] = 1994,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[30615] = {
					["source"] = "Bleeding Hollow Scryer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 17478,
				},
				[63619] = {
					["encounterID"] = 1994,
					["source"] = "Shadowfiend",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 19668,
				},
				[5115] = {
					["source"] = "Nethergarde Foreman",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 5998,
				},
				[171804] = {
					["source"] = "Lackofwords-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[60521] = {
					["type"] = "BUFF",
					["source"] = "Darkdanash-Quel'Thalas",
					["encounterID"] = 1994,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[20540] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 12856,
				},
				[203277] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Shawndraa",
					["npcID"] = 0,
				},
				[205231] = {
					["encounterID"] = 1994,
					["source"] = "Darkglare",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 103673,
				},
				[51491] = {
					["source"] = "Unrelenting Construct",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27971,
				},
				[80561] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Twilight Fire Guard",
					["npcID"] = 5861,
				},
				[204301] = {
					["source"] = "Radar-Arygos",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[107428] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Donatello-Shadowmoon",
					["npcID"] = 0,
				},
				[24858] = {
					["source"] = "Balloo-Zangarmarsh",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295378] = {
					["source"] = "Fhenryr-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[269279] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wargazim-BlackwingLair",
					["npcID"] = 0,
				},
				[22907] = {
					["npcID"] = 17826,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Swamplord Musel'ek",
					["encounterID"] = 1947,
				},
				[228354] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Lunalie-Illidan",
					["npcID"] = 0,
				},
				[216328] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hâzy-Kel'Thuzad",
					["npcID"] = 0,
				},
				[205180] = {
					["type"] = "BUFF",
					["source"] = "Cooler-Dawnbringer",
					["encounterID"] = 1994,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[39913] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[116768] = {
					["source"] = "Define-ScarletCrusade",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[31287] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Umbrafen Seer",
					["npcID"] = 18079,
				},
				[51805] = {
					["source"] = "Dark Rune Controller",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27966,
				},
				[51507] = {
					["source"] = "Dark Rune Controller",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27966,
				},
				[184575] = {
					["source"] = "Thartuk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[119415] = {
					["type"] = "BUFF",
					["source"] = "Darkdanash-Quel'Thalas",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[256290] = {
					["source"] = "Monèybågzz",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[46202] = {
					["source"] = "Dark Rune Worker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27961,
				},
				[51496] = {
					["source"] = "Dark Rune Shaper",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27965,
				},
				[190456] = {
					["source"] = "Tahnok-Thunderhorn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297941] = {
					["source"] = "Kinemon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[213771] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Grizlybear-Tichondrius",
					["npcID"] = 0,
				},
				[121557] = {
					["type"] = "BUFF",
					["source"] = "Derive-Mal'Ganis",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[132403] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[202636] = {
					["source"] = "Cloudwatcher-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[3714] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zoddk-Zul'jin",
					["npcID"] = 0,
				},
				[278350] = {
					["source"] = "Cooler-Dawnbringer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[295384] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fenrax-Whisperwind",
					["npcID"] = 0,
				},
				[53314] = {
					["source"] = "Dark Rune Elementalist",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27962,
				},
				[299790] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fortismera-Thrall",
					["npcID"] = 0,
				},
				[19577] = {
					["source"] = "Phoque-Hyjal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[216331] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mälakai",
					["npcID"] = 0,
				},
				[51493] = {
					["source"] = "Dark Rune Giant",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27969,
				},
				[70243] = {
					["source"] = "Xantòn-Auchindoun",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[157736] = {
					["source"] = "Felfirefox-Scilla",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[89263] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "\"Captain\" Cookie",
					["npcID"] = 47739,
				},
				[91807] = {
					["type"] = "DEBUFF",
					["source"] = "Plaguetaker",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 26125,
				},
				[203538] = {
					["source"] = "Pyraldra-Doomhammer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[228358] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Kirasha-Blackrock",
					["npcID"] = 0,
				},
				[51832] = {
					["source"] = "Unrelenting Construct",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27971,
				},
				[55233] = {
					["type"] = "BUFF",
					["source"] = "Gissëlle-Quel'Thalas",
					["encounterID"] = 2025,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[184092] = {
					["source"] = "Thartuk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[45524] = {
					["encounterID"] = 479,
					["source"] = "Razzakin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[53395] = {
					["source"] = "Dark Rune Warrior",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27960,
				},
				[227847] = {
					["type"] = "BUFF",
					["source"] = "Orecchini-Tichondrius",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[203539] = {
					["source"] = "Nemesaria",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[13878] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bleakheart Hellcaller",
					["npcID"] = 3771,
				},
				[202004] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Firephox-Mal'Ganis",
					["npcID"] = 0,
				},
				[275699] = {
					["source"] = "Rajukah-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[15869] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kataru",
					["npcID"] = 18080,
				},
				[188443] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mona-Sargeras",
					["npcID"] = 0,
				},
				[101546] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Munchfist-Dalaran",
					["npcID"] = 0,
				},
				[34477] = {
					["source"] = "Phoque-Hyjal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[42729] = {
					["encounterID"] = 2025,
					["source"] = "Ingvar the Plunderer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 23954,
				},
				[15801] = {
					["source"] = "Dark Rune Theurgist",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27963,
				},
				[34787] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rajis Fyashe",
					["npcID"] = 18044,
				},
				[51776] = {
					["type"] = "BUFF",
					["source"] = "Dark Rune Elementalist",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 27962,
				},
				[304603] = {
					["type"] = "DEBUFF",
					["source"] = "Tyrrannous",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[34861] = {
					["source"] = "Aelymn",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[35499] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rajis Fyashe",
					["npcID"] = 18044,
				},
				[203285] = {
					["source"] = "Candieman-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[33688] = {
					["source"] = "Raging Colossus",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 19188,
				},
				[250878] = {
					["source"] = "Candieman-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[18813] = {
					["npcID"] = 17826,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Swamplord Musel'ek",
					["encounterID"] = 1947,
				},
				[157228] = {
					["source"] = "Nohno",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[304605] = {
					["type"] = "DEBUFF",
					["source"] = "Vellissel",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[22812] = {
					["type"] = "BUFF",
					["source"] = "Teizzie-WyrmrestAccord",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1662,
				},
				[264689] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Finarfinn-Illidan",
					["npcID"] = 0,
				},
				[308188] = {
					["source"] = "Fallencruxis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[304606] = {
					["type"] = "DEBUFF",
					["source"] = "Vellissel",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[974] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Notklingon-Zuluhed",
					["npcID"] = 0,
				},
				[221885] = {
					["source"] = "Keifitreal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[308189] = {
					["source"] = "Kinemon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[69563] = {
					["source"] = "Thartuk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[255941] = {
					["source"] = "Thartuk",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[157997] = {
					["source"] = "Crexus-Tichondrius",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[980] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lamäshtu-Ghostlands",
					["npcID"] = 0,
				},
				[100780] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Cartujo-Agamaggan",
					["npcID"] = 0,
				},
				[982] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Georgebüsh-Turalyon",
					["npcID"] = 0,
				},
				[146739] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Lamäshtu-Ghostlands",
					["npcID"] = 0,
				},
				[44457] = {
					["source"] = "Candieman-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[15744] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Searing Destroyer",
					["npcID"] = 46260,
				},
				[315356] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Caravaneer's Pack",
					["npcID"] = 162001,
				},
				[48400] = {
					["type"] = "DEBUFF",
					["source"] = "Unknown",
					["encounterID"] = 2026,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 23965,
				},
				[13745] = {
					["npcID"] = 8913,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Twilight Emissary",
					["encounterID"] = 232,
				},
				[54477] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "U'cha",
					["npcID"] = 9622,
				},
				[16170] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 18972,
				},
				[112042] = {
					["source"] = "Klathgarth",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 1860,
				},
				[31704] = {
					["npcID"] = 17882,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "The Black Stalker",
					["encounterID"] = 1948,
				},
				[304611] = {
					["type"] = "DEBUFF",
					["source"] = "Vellissel",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[17439] = {
					["source"] = "Black Guard Sentry",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10394,
				},
				[52174] = {
					["source"] = "Atuzu",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[150067] = {
					["npcID"] = 74347,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mordresh Fire Eye",
					["encounterID"] = 1663,
				},
				[304612] = {
					["type"] = "DEBUFF",
					["source"] = "Vellissel",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[7978] = {
					["source"] = "Goblin Technician",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 35333,
				},
				[197916] = {
					["source"] = "Quijang-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[111400] = {
					["source"] = "Agendedes-Aegwynn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[13953] = {
					["npcID"] = 9056,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fineous Darkvire",
					["encounterID"] = 234,
				},
				[11922] = {
					["source"] = "Bloodpetal Trapper",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 6512,
				},
				[89267] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kronnaw-Stormrage",
					["npcID"] = 0,
				},
				[105771] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Trollnareff",
					["npcID"] = 0,
				},
				[11970] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Magma Elemental",
					["npcID"] = 5855,
				},
				[11986] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Twilight Dark Shaman",
					["npcID"] = 5860,
				},
				[45153] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kitsuri",
					["npcID"] = 0,
				},
				[32216] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Trollnareff",
					["npcID"] = 0,
				},
				[38232] = {
					["source"] = "Dragonflayer Overseer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 24085,
				},
				[37933] = {
					["source"] = "Risen Husk",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 23555,
				},
				[262652] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Woozah-Mal'Ganis",
					["npcID"] = 0,
				},
				[251832] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Nomoohere",
					["npcID"] = 0,
				},
				[1066] = {
					["source"] = "Dirtylegs-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[195292] = {
					["source"] = "Gissëlle-Quel'Thalas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[82615] = {
					["source"] = "Rageroar Sea Dog",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 38661,
				},
				[42771] = {
					["source"] = "Dragonflayer Ironhelm",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 23961,
				},
				[25778] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Underbog Lord",
					["npcID"] = 17734,
				},
				[31567] = {
					["type"] = "BUFF",
					["source"] = "Swamplord Musel'ek",
					["npcID"] = 17826,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1947,
				},
				[34974] = {
					["npcID"] = 17826,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Swamplord Musel'ek",
					["encounterID"] = 1947,
				},
				[164812] = {
					["source"] = "Balloo-Zangarmarsh",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[49722] = {
					["source"] = "Enslaved Proto-Drake",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 24083,
				},
				[1022] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[197919] = {
					["source"] = "Quijang-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[69438] = {
					["source"] = "Dîosa",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[188196] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mona-Sargeras",
					["npcID"] = 0,
				},
				[164815] = {
					["source"] = "Balloo-Zangarmarsh",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[110762] = {
					["encounterID"] = 426,
					["source"] = "Landslide",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 12203,
				},
				[108843] = {
					["source"] = "Vognar-Azgalor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[121253] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tikigu",
					["npcID"] = 0,
				},
				[63560] = {
					["source"] = "Yayo-TheUnderbog",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[82616] = {
					["source"] = "Rageroar Sea Dog",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 38661,
				},
				[49576] = {
					["source"] = "Razzakin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[43931] = {
					["source"] = "Enslaved Proto-Drake",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 24083,
				},
				[1044] = {
					["source"] = "Thartuk",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[68799] = {
					["source"] = "Apothecary Frye",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 36272,
				},
				[12466] = {
					["npcID"] = 46264,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lord Overheat",
					["encounterID"] = 1145,
				},
				[193315] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sodo-Gnomeregan",
					["npcID"] = 0,
				},
				[60195] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Grimtotem Mercenary",
					["npcID"] = 11911,
				},
				[66] = {
					["source"] = "Pyrokus-Auchindoun",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[202425] = {
					["source"] = "Criticalrick",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[48105] = {
					["source"] = "Ferocious Rhino",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26686,
				},
				[32330] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lykul Wasp",
					["npcID"] = 17732,
				},
				[15043] = {
					["npcID"] = 8913,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Twilight Emissary",
					["encounterID"] = 232,
				},
				[1064] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Notklingon-Zuluhed",
					["npcID"] = 0,
				},
				[100784] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Cartujo-Agamaggan",
					["npcID"] = 0,
				},
				[34267] = {
					["npcID"] = 18105,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ghaz'an",
					["encounterID"] = 1945,
				},
				[2139] = {
					["encounterID"] = 479,
					["source"] = "Darkssol-Proudmoore",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[194084] = {
					["source"] = "Shamstral-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[12674] = {
					["source"] = "Bloodmage",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 19258,
				},
				[78907] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Severed Keeper",
					["npcID"] = 3803,
				},
				[81082] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Felhound",
					["npcID"] = 6010,
				},
				[17235] = {
					["encounterID"] = 480,
					["source"] = "Nerub'enkan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10437,
				},
				[289308] = {
					["source"] = "Crexus-Tichondrius",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[317420] = {
					["source"] = "Sathanus-Ysera",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[8676] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mashido",
					["npcID"] = 0,
				},
				[1459] = {
					["source"] = "Buffpriest",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[255654] = {
					["source"] = "Kgositsile-Kargath",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[233490] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Lamäshtu-Ghostlands",
					["npcID"] = 0,
				},
				[109304] = {
					["source"] = "Phoque-Hyjal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[148540] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[51432] = {
					["source"] = "Ymirjar Necromancer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 28368,
				},
				[43308] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wargazim-BlackwingLair",
					["npcID"] = 0,
				},
				[77722] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Shadowsworn Dreadweaver",
					["npcID"] = 6009,
				},
				[31961] = {
					["type"] = "DEBUFF",
					["source"] = "Rucar-Aggramar",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273947] = {
					["source"] = "Gissëlle-Quel'Thalas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[21790] = {
					["source"] = "Thessala Hydra",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 12207,
				},
				[33393] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Pit Commander",
					["npcID"] = 18945,
				},
				[308212] = {
					["source"] = "Itwasbush",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[150332] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Splinterbone Warrior",
					["npcID"] = 74383,
				},
				[148541] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298823] = {
					["source"] = "Wrekin-Ysera",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[35760] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Greater Bogstrok",
					["npcID"] = 17817,
				},
				[1122] = {
					["source"] = "Agendedes-Aegwynn",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[184364] = {
					["source"] = "Atuzu",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272903] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hobõ",
					["npcID"] = 0,
				},
				[78141] = {
					["source"] = "Thartuk",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[83242] = {
					["source"] = "Emozo",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[148542] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[34161] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Underbog Lurker",
					["npcID"] = 17725,
				},
				[264178] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Christsaves-Lightbringer",
					["npcID"] = 0,
				},
				[264173] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Christsaves-Lightbringer",
					["npcID"] = 0,
				},
				[315161] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Believesteve",
					["npcID"] = 0,
				},
				[153561] = {
					["source"] = "Candieman-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[42669] = {
					["encounterID"] = 2025,
					["source"] = "Ingvar the Plunderer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 23954,
				},
				[81340] = {
					["source"] = "Crõwlêy",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[43665] = {
					["source"] = "Dragonflayer Heartsplitter",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 24071,
				},
				[203286] = {
					["source"] = "Candieman-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[13298] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Putridus Trickster",
					["npcID"] = 11791,
				},
				[261896] = {
					["source"] = "Orgrimmar Bruiser",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 133168,
				},
				[199736] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Humpho-BleedingHollow",
					["npcID"] = 0,
				},
				[96437] = {
					["source"] = "Ashenvale Skirmisher",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 33193,
				},
				[1160] = {
					["source"] = "Tahnok-Thunderhorn",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[118] = {
					["source"] = "Candieman-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[90680] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "\"Captain\" Cookie",
					["npcID"] = 47739,
				},
				[76479] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Whiterider-Whisperwind",
					["npcID"] = 0,
				},
				[264057] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Christsaves-Lightbringer",
					["npcID"] = 0,
				},
				[104316] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Christsaves-Lightbringer",
					["npcID"] = 0,
				},
				[184367] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Trollnareff",
					["npcID"] = 0,
				},
				[37488] = {
					["source"] = "Terrorfiend",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 16951,
				},
				[11443] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Death's Head Necrolyte",
					["npcID"] = 74411,
				},
				[122281] = {
					["source"] = "Squatrack-Gnomeregan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[203814] = {
					["source"] = "Erina-Garithos",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5672] = {
					["type"] = "BUFF",
					["source"] = "Healing Stream Totem",
					["npcID"] = 3527,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 427,
				},
				[2367] = {
					["source"] = "Blamm-Greymane",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[48107] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Firefur-Illidan",
					["npcID"] = 0,
				},
				[79934] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 4563,
				},
				[31290] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Riverpaw Poacher",
					["npcID"] = 46250,
				},
				[2383] = {
					["source"] = "Stepsibling-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[47540] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Vulperry-Illidan",
					["npcID"] = 0,
				},
				[195627] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sneakyjr-Stormrage",
					["npcID"] = 0,
				},
				[206931] = {
					["source"] = "Gissëlle-Quel'Thalas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[31281] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bloodwash Enchantress",
					["npcID"] = 41387,
				},
				[292359] = {
					["source"] = "Khalifakahn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257946] = {
					["source"] = "Emozo",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[13730] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Grimtotem Brute",
					["npcID"] = 11912,
				},
				[150082] = {
					["type"] = "DEBUFF",
					["source"] = "Aarux",
					["npcID"] = 74412,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1662,
				},
				[292360] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cartujo-Agamaggan",
					["npcID"] = 0,
				},
				[289324] = {
					["source"] = "Emillotte",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279490] = {
					["source"] = "Candieman-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[6907] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rotting Slime",
					["npcID"] = 3928,
				},
				[292361] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[280870] = {
					["source"] = "Candieman-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[312372] = {
					["source"] = "Bearhugs-Garona",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[108849] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Vlagga Freyfeather",
					["npcID"] = 18930,
				},
				[292362] = {
					["source"] = "Xun",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[31410] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wrathfin Myrmidon",
					["npcID"] = 17726,
				},
				[255248] = {
					["source"] = "Seeward",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[318227] = {
					["source"] = "Cassíopeía-Blackhand",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267799] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[32717] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Haal'eshi Windwalker",
					["npcID"] = 16966,
				},
				[33395] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Water Elemental",
					["npcID"] = 78116,
				},
				[7964] = {
					["npcID"] = 12236,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lord Vyletongue",
					["encounterID"] = 424,
				},
				[11971] = {
					["source"] = "Firemane Scalebane",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 4328,
				},
				[14034] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Murkblood Oracle",
					["npcID"] = 17771,
				},
				[77505] = {
					["source"] = "Chicoritita-Quel'Thalas",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[69445] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Holydruid",
					["npcID"] = 0,
				},
				[33779] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hâzy-Kel'Thuzad",
					["npcID"] = 0,
				},
				[90171] = {
					["source"] = "Mottled Drywallow Crocolisk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 4344,
				},
				[50283] = {
					["type"] = "DEBUFF",
					["source"] = "Nerub'ar Web Lord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 25294,
				},
				[119085] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Donatello-Shadowmoon",
					["npcID"] = 0,
				},
				[308742] = {
					["source"] = "Thartuk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[202164] = {
					["source"] = "Tahnok-Thunderhorn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[134477] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 17252,
				},
				[280868] = {
					["source"] = "Candieman-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[33463] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Undercity Mage",
					["npcID"] = 18971,
				},
				[33564] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Justinius the Harbinger",
					["npcID"] = 18966,
				},
				[224001] = {
					["source"] = "Cydebítch-Galakrond",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[68934] = {
					["source"] = "[DND] Valentine Boss - Vial Bunny",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 36530,
				},
				[228128] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[32666] = {
					["source"] = "Dreadcaller",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 19434,
				},
				[108211] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Knelth",
					["npcID"] = 0,
				},
				[5116] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sathienis-Shu'halo",
					["encounterID"] = 427,
				},
				[77762] = {
					["type"] = "BUFF",
					["source"] = "Kazorra-Tichondrius",
					["encounterID"] = 426,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[79937] = {
					["source"] = "Dreadmaul Warlock",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 5978,
				},
				[115191] = {
					["source"] = "Bigstab-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[48792] = {
					["type"] = "BUFF",
					["source"] = "Razzakin",
					["encounterID"] = 479,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[90556] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "\"Captain\" Cookie",
					["npcID"] = 47739,
				},
				[51499] = {
					["type"] = "BUFF",
					["source"] = "Dark Rune Worker",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 27961,
				},
				[78530] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Petrified Treant",
					["npcID"] = 11458,
				},
				[198069] = {
					["source"] = "Cassíopeía-Blackhand",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[208683] = {
					["source"] = "Birdwings-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[55899] = {
					["source"] = "Pepinilla",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[160067] = {
					["source"] = "Iriss, a Viúva",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 50759,
				},
				[130345] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Maxfistsama",
					["npcID"] = 0,
				},
				[194310] = {
					["source"] = "Crõwlêy",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[10452] = {
					["source"] = "Thaurissan Firewalker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 7037,
				},
				[71366] = {
					["source"] = "Thartuk",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[16866] = {
					["source"] = "Venom Belcher",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10417,
				},
				[267560] = {
					["source"] = "Jazlene",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[79938] = {
					["source"] = "Dreadmaul Warlock",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 5978,
				},
				[50284] = {
					["type"] = "BUFF",
					["source"] = "Nerub'ar Web Lord",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 25294,
				},
				[285721] = {
					["type"] = "BUFF",
					["source"] = "Treêbag",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[90557] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "\"Captain\" Cookie",
					["npcID"] = 47739,
				},
				[150601] = {
					["type"] = "BUFF",
					["source"] = "Death Speaker Blackthorn",
					["npcID"] = 74875,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1665,
				},
				[15346] = {
					["type"] = "BUFF",
					["source"] = "Fineous Darkvire",
					["npcID"] = 9056,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 234,
				},
				[5308] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Trollnareff",
					["npcID"] = 0,
				},
				[1330] = {
					["type"] = "DEBUFF",
					["source"] = "Hellouda-Mannoroth",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[818] = {
					["source"] = "Kishbaw",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[8613] = {
					["source"] = "Monks-GrizzlyHills",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[54954] = {
					["source"] = "Ticking Bomb",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 29684,
				},
				[12739] = {
					["source"] = "Thuzadin Shadowcaster",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10398,
				},
				[294935] = {
					["source"] = "Cyberknife",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267329] = {
					["source"] = "Wrekin-Ysera",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[31707] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Water Elemental",
					["npcID"] = 78116,
				},
				[126892] = {
					["source"] = "Sakikaru-Zangarmarsh",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[42972] = {
					["source"] = "Dragonflayer Strategist",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 23956,
				},
				[149835] = {
					["type"] = "BUFF",
					["source"] = "Mushlump",
					["npcID"] = 74435,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1664,
				},
				[108853] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Firefur-Illidan",
					["npcID"] = 0,
				},
				[285981] = {
					["source"] = "Gimmiedaloot-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[42772] = {
					["source"] = "Dragonflayer Strategist",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 23956,
				},
				[59752] = {
					["source"] = "Wrekin-Ysera",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[116849] = {
					["source"] = "Quijang-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[13899] = {
					["npcID"] = 9017,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lord Incendius",
					["encounterID"] = 232,
				},
				[107574] = {
					["source"] = "Meatlode-BurningBlade",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[35748] = {
					["encounterID"] = 1891,
					["source"] = "Fiendish Hound",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 17540,
				},
				[81219] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 46749,
				},
				[198067] = {
					["encounterID"] = 479,
					["source"] = "Chicoritita-Quel'Thalas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[30108] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lamäshtu-Ghostlands",
					["npcID"] = 0,
				},
				[298440] = {
					["source"] = "Exodan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[228260] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Chlöe-Malfurion",
					["npcID"] = 0,
				},
				[33781] = {
					["source"] = "Thornfang Venomspitter",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 19350,
				},
				[155722] = {
					["source"] = "Balloo-Zangarmarsh",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[33909] = {
					["source"] = "Hulking Helboar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 16880,
				},
				[298011] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Chrisoshadow",
					["npcID"] = 0,
				},
				[90559] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "\"Captain\" Cookie",
					["npcID"] = 47739,
				},
				[285979] = {
					["source"] = "Puddycat-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298836] = {
					["source"] = "Demonsyder",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[212792] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Kirasha-Blackrock",
					["npcID"] = 0,
				},
				[263725] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tishtroll-Ravencrest",
					["npcID"] = 0,
				},
				[7367] = {
					["source"] = "Ember Worg",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 9690,
				},
				[101545] = {
					["source"] = "Define-ScarletCrusade",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[191034] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dowop-Khaz'goroth",
					["npcID"] = 0,
				},
				[290337] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Alltruis",
					["npcID"] = 0,
				},
				[80182] = {
					["source"] = "Firegut Reaver",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 48120,
				},
				[293142] = {
					["source"] = "Wrekin-Ysera",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[192058] = {
					["encounterID"] = 479,
					["source"] = "Chicoritita-Quel'Thalas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[3427] = {
					["source"] = "Bloodfen Razormaw",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 4356,
				},
				[2823] = {
					["source"] = "Rogjix-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[149839] = {
					["npcID"] = 0,
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1664,
				},
				[248473] = {
					["source"] = "Firefoxy-Duskwood",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[84419] = {
					["source"] = "Ogron",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 4983,
				},
				[6818] = {
					["source"] = "Foulweald Totemic",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 3750,
				},
				[272940] = {
					["source"] = "Birdwings-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[33206] = {
					["source"] = "Derive-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[13443] = {
					["source"] = "Ravasaur",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 6505,
				},
				[5708] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Noxious Reaver",
					["npcID"] = 4347,
				},
				[20801] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Imp Minion",
					["npcID"] = 12922,
				},
				[33462] = {
					["source"] = "Night Elf Mage",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 35154,
				},
				[262232] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Trollnareff",
					["npcID"] = 0,
				},
				[5740] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sweetjuice-Ravencrest",
					["npcID"] = 0,
				},
				[296211] = {
					["source"] = "Squatrack-Gnomeregan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[16867] = {
					["encounterID"] = 479,
					["source"] = "Baroness Anastari",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10436,
				},
				[15618] = {
					["source"] = "Thrallmar Grunt",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 16580,
				},
				[165961] = {
					["source"] = "Balloo-Zangarmarsh",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[21057] = {
					["source"] = "Theradrim Guardian",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 11784,
				},
				[152144] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 74950,
				},
				[318216] = {
					["source"] = "Squatrack-Gnomeregan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2643] = {
					["source"] = "Phoque-Hyjal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[36213] = {
					["encounterID"] = 429,
					["source"] = "Greater Earth Elemental",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 95072,
				},
				[34017] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Shahandana",
					["npcID"] = 41165,
				},
				[60103] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Firephox-Mal'Ganis",
					["npcID"] = 0,
				},
				[42724] = {
					["source"] = "Dragonflayer Weaponsmith",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 24080,
				},
				[104318] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wild Imp",
					["npcID"] = 55659,
				},
				[1464] = {
					["source"] = "Atuzu",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[83639] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bloodwash Barbarian",
					["npcID"] = 41386,
				},
				[123586] = {
					["source"] = "Define-ScarletCrusade",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[14180] = {
					["source"] = "Tar Lurker",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 6518,
				},
				[44977] = {
					["source"] = "Dreadmaul Warlock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 5978,
				},
				[40504] = {
					["source"] = "Gorishi Reaver",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 6553,
				},
				[17620] = {
					["encounterID"] = 481,
					["source"] = "Maleki the Pallid",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10438,
				},
				[84165] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tempered War Golem",
					["npcID"] = 5853,
				},
				[69964] = {
					["source"] = "Darkmist Spider",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 4376,
				},
				[18545] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ashenvale Outrunner",
					["npcID"] = 12856,
				},
				[7979] = {
					["source"] = "Venture Co. Machine Smith",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 3993,
				},
				[31932] = {
					["type"] = "DEBUFF",
					["source"] = "Swamplord Musel'ek",
					["npcID"] = 17826,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1947,
				},
				[47536] = {
					["type"] = "BUFF",
					["source"] = "Derive-Mal'Ganis",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280855] = {
					["source"] = "Candieman-Illidan",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2983] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mashido",
					["npcID"] = 0,
				},
				[190784] = {
					["source"] = "Thartuk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[287790] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cdewski-Kel'Thuzad",
					["npcID"] = 0,
				},
				[11972] = {
					["source"] = "Firemane Scalebane",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 4328,
				},
				[201787] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Bootyfist-Illidan",
					["npcID"] = 0,
				},
				[268856] = {
					["source"] = "Radar-Arygos",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297039] = {
					["source"] = "Sukura",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[223500] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Drspy",
					["npcID"] = 0,
				},
				[14099] = {
					["encounterID"] = 482,
					["source"] = "Magistrate Barthilas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10435,
				},
				[33911] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Stonescythe Alpha",
					["npcID"] = 16929,
				},
				[150479] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Boneflayer Ghoul",
					["npcID"] = 74490,
				},
				[31602] = {
					["encounterID"] = 480,
					["source"] = "Nerub'enkan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10437,
				},
				[272440] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Shawndraa",
					["npcID"] = 0,
				},
				[281178] = {
					["source"] = "Thartuk",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[60842] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Unknown",
					["npcID"] = 11911,
				},
				[22273] = {
					["source"] = "Bloodmage",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 19258,
				},
				[115767] = {
					["source"] = "Meatlode-BurningBlade",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[34423] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Murkblood Healer",
					["npcID"] = 17730,
				},
				[190319] = {
					["source"] = "Candieman-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[69070] = {
					["source"] = "Rekanth-Stormreaver",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[30621] = {
					["source"] = "Bonechewer Ravener",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 17264,
				},
				[130736] = {
					["source"] = "Rajukah-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[15530] = {
					["source"] = "Bloodmage",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 19258,
				},
				[276025] = {
					["source"] = "Chipmonkas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[34871] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Umbrafen Witchdoctor",
					["npcID"] = 20115,
				},
				[10277] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Felmusk Shadowstalker",
					["npcID"] = 3763,
				},
				[267326] = {
					["source"] = "Wrekin-Ysera",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[19574] = {
					["source"] = "Phoque-Hyjal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[207311] = {
					["source"] = "Crõwlêy",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[86726] = {
					["type"] = "BUFF",
					["source"] = "Randolph Moloch",
					["npcID"] = 46383,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1146,
				},
				[185311] = {
					["source"] = "Wrekin-Ysera",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[12420] = {
					["source"] = "Thuzadin Necromancer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10400,
				},
				[16856] = {
					["encounterID"] = 484,
					["source"] = "Lord Aurius Rivendare",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 45412,
				},
				[20802] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Grimtotem Sorcerer",
					["npcID"] = 11913,
				},
				[287280] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fortismera-Thrall",
					["npcID"] = 0,
				},
				[188370] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[150616] = {
					["npcID"] = 74875,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Death Speaker Blackthorn",
					["encounterID"] = 1665,
				},
				[118455] = {
					["source"] = "Phoque-Hyjal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[6268] = {
					["source"] = "Warsong Vanguard",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 34366,
				},
				[12548] = {
					["source"] = "Warmaul Shaman",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 18064,
				},
				[268901] = {
					["source"] = "Depeaz",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[316036] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[260384] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Nieun",
					["npcID"] = 0,
				},
				[12612] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "U'cha",
					["npcID"] = 9622,
				},
				[32723] = {
					["source"] = "Bonechewer Raider",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 16925,
				},
				[34168] = {
					["npcID"] = 17990,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Underbog Mushroom",
					["encounterID"] = 1946,
				},
				[267331] = {
					["source"] = "Wrekin-Ysera",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[30659] = {
					["source"] = "Bleeding Hollow Scryer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 17478,
				},
				[294966] = {
					["source"] = "Toosi-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[101568] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Believesteve",
					["npcID"] = 0,
				},
				[59052] = {
					["type"] = "BUFF",
					["source"] = "Kaeji-Terokkar",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[8646] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ashenvale Outrunner",
					["npcID"] = 12856,
				},
				[187464] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Bqr-Tichondrius",
					["npcID"] = 0,
				},
				[264774] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tishtroll-Ravencrest",
					["npcID"] = 0,
				},
				[53167] = {
					["source"] = "Dark Rune Theurgist",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27963,
				},
				[235313] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Firefur-Illidan",
					["npcID"] = 0,
				},
				[1604] = {
					["source"] = "Mor'shan Defender",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 33201,
				},
				[149851] = {
					["npcID"] = 74435,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mushlump",
					["encounterID"] = 1664,
				},
				[84297] = {
					["source"] = "Illycor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 41163,
				},
				[31598] = {
					["source"] = "Bleeding Hollow Darkcaster",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 17269,
				},
				[31901] = {
					["type"] = "BUFF",
					["source"] = "Omor the Unscarred",
					["encounterID"] = 1891,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 17308,
				},
				[264776] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Xxena",
					["npcID"] = 0,
				},
				[293946] = {
					["source"] = "Fillabigdila",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[115989] = {
					["source"] = "Panded-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[45438] = {
					["type"] = "BUFF",
					["source"] = "Kirasha-Blackrock",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 232,
				},
				[264777] = {
					["source"] = "Fillabigdila",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[312370] = {
					["source"] = "Nomaza-BleedingHollow",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[166740] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 144323,
				},
				[3409] = {
					["source"] = "Wrekin-Ysera",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[15616] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Unknown",
					["npcID"] = 18972,
				},
				[35395] = {
					["source"] = "Thartuk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[225080] = {
					["type"] = "DEBUFF",
					["source"] = "Katyuska-BleedingHollow",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 232,
				},
				[197548] = {
					["source"] = "Cassíopeía-Blackhand",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[31850] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[84298] = {
					["source"] = "Illycor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 41163,
				},
				[180736] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kyly",
					["npcID"] = 0,
				},
				[6572] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Millovich-Bonechewer",
					["npcID"] = 0,
				},
				[86729] = {
					["npcID"] = 46383,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Randolph Moloch",
					["encounterID"] = 1146,
				},
				[175697] = {
					["encounterID"] = 479,
					["source"] = "Quijang-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[38391] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Searing Destroyer",
					["npcID"] = 46260,
				},
				[218164] = {
					["source"] = "Oreosr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[34425] = {
					["source"] = "Lake Spirit",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 17153,
				},
				[68946] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 36565,
				},
				[302651] = {
					["type"] = "BUFF",
					["source"] = "Akharii",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[206662] = {
					["source"] = "Tìgerlìly",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[35998] = {
					["source"] = "Forward Commander To'arch",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 19273,
				},
				[30686] = {
					["encounterID"] = 1891,
					["source"] = "Omor the Unscarred",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 17308,
				},
				[6660] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ashenvale Outrunner",
					["npcID"] = 12856,
				},
				[6668] = {
					["source"] = "Seeward",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[268877] = {
					["source"] = "Phoque-Hyjal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[16143] = {
					["source"] = "Mangled Cadaver",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 10382,
				},
				[78286] = {
					["source"] = "Demonicles-Hellscream",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[51505] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mona-Sargeras",
					["npcID"] = 0,
				},
				[78542] = {
					["source"] = "Befouled Water Elemental",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 3917,
				},
				[1680] = {
					["source"] = "Atuzu",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[13444] = {
					["source"] = "Rockwing Gargoyle",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10408,
				},
				[15507] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Golem Lord Argelmach",
					["npcID"] = 8983,
				},
				[85948] = {
					["source"] = "Crõwlêy",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[62124] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[150368] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Death's Head Necrolyte",
					["npcID"] = 74411,
				},
				[9791] = {
					["source"] = "Dragonflayer Bonecrusher",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 24069,
				},
				[115994] = {
					["source"] = "Panded-Zul'jin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[3391] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Putridus Trickster",
					["npcID"] = 11791,
				},
				[6788] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Vulperry-Illidan",
					["npcID"] = 0,
				},
				[195901] = {
					["source"] = "Sombriste",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[32749] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Searing Infernal",
					["npcID"] = 6073,
				},
				[15667] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Putridus Satyr",
					["npcID"] = 11790,
				},
				[1706] = {
					["source"] = "Kaydrick-Azshara",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[86603] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 46890,
				},
				[109248] = {
					["source"] = "Nighkeo-Arathor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[119611] = {
					["source"] = "Brini-Darkspear",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[34298] = {
					["npcID"] = 17827,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Claw",
					["encounterID"] = 1947,
				},
				[280653] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Habiits-Illidan",
					["npcID"] = 0,
				},
				[42490] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zeppelin Power Core",
					["npcID"] = 23832,
				},
				[124217] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kandalucretz",
					["npcID"] = 0,
				},
				[80382] = {
					["source"] = "Nethergarde Miner",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 5996,
				},
				[203848] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Justinblade-Sargeras",
					["npcID"] = 0,
				},
				[1719] = {
					["type"] = "BUFF",
					["source"] = "Huztle-KhazModan",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 234,
				},
				[71507] = {
					["source"] = "Orgrimmar Wind Rider",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 51346,
				},
				[9734] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Cassia the Slitherqueen",
					["npcID"] = 45258,
				},
				[34874] = {
					["npcID"] = 17770,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hungarfen",
					["encounterID"] = 1946,
				},
				[21071] = {
					["source"] = "Primordial Behemoth",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 12206,
				},
				[6940] = {
					["source"] = "Thartuk",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[48108] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Firefur-Illidan",
					["npcID"] = 0,
				},
				[203849] = {
					["source"] = "Zaràki",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[9484] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kanitos-Gurubashi",
					["encounterID"] = 1666,
				},
				[90954] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 48505,
				},
				[80610] = {
					["source"] = "Razgar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 43239,
				},
				[248289] = {
					["source"] = "Radianthoof",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268887] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Woozah-Mal'Ganis",
					["npcID"] = 0,
				},
				[300104] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Justinblade-Sargeras",
					["npcID"] = 0,
				},
				[86740] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rowdy Troublemaker",
					["npcID"] = 46375,
				},
				[297034] = {
					["source"] = "Félborn-Tanaris",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[33659] = {
					["source"] = "Wing Commander Brack",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 19401,
				},
				[21987] = {
					["source"] = "Sister of Grief",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 16960,
				},
				[116670] = {
					["source"] = "Quijang-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[297035] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Methuselahh",
					["npcID"] = 0,
				},
				[1766] = {
					["source"] = "Loano-Ravencrest",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[40120] = {
					["source"] = "Rakeandbake",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[68054] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 35642,
				},
				[16869] = {
					["encounterID"] = 481,
					["source"] = "Maleki the Pallid",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10438,
				},
				[34171] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Underbat",
					["npcID"] = 17724,
				},
				[287825] = {
					["source"] = "Candieman-Illidan",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[194384] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Vulperry-Illidan",
					["npcID"] = 0,
				},
				[297037] = {
					["source"] = "Marrowguard",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[88663] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zatya",
					["npcID"] = 0,
				},
				[300108] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Justinblade-Sargeras",
					["npcID"] = 0,
				},
				[24450] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Puseygalore",
					["npcID"] = 2385,
				},
				[203852] = {
					["source"] = "Cassíopeía-Blackhand",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[85256] = {
					["source"] = "Thartuk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[7164] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 3385,
				},
				[15619] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Doomforge Craftsman",
					["npcID"] = 8897,
				},
				[215111] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Unknown",
					["npcID"] = 98035,
				},
				[184662] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[115008] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Donatello-Shadowmoon",
					["npcID"] = 0,
				},
				[205644] = {
					["source"] = "Unknown",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 103822,
				},
				[297040] = {
					["source"] = "Demonsyder",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275335] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Millovich-Bonechewer",
					["npcID"] = 0,
				},
				[78674] = {
					["source"] = "Balloo-Zangarmarsh",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[22568] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Moosejaw-Shadowmoon",
					["npcID"] = 0,
				},
				[255937] = {
					["source"] = "Thartuk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[84451] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Jarroc Torn-Wing",
					["npcID"] = 41164,
				},
				[14516] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Riverpaw Slayer",
					["npcID"] = 46249,
				},
				[5221] = {
					["source"] = "Balloo-Zangarmarsh",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[58160] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tikigu",
					["npcID"] = 0,
				},
				[1822] = {
					["source"] = "Balloo-Zangarmarsh",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[21787] = {
					["source"] = "Thessala Hydra",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 12207,
				},
				[73685] = {
					["source"] = "Kazorra-Tichondrius",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[79954] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mojo the Twisted",
					["npcID"] = 8296,
				},
				[151998] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Festering Spiderling",
					["npcID"] = 74583,
				},
				[5277] = {
					["source"] = "Teksubshaw-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[205351] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Chlöe-Malfurion",
					["npcID"] = 0,
				},
				[19514] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Grimtotem Ruffian",
					["npcID"] = 11910,
				},
				[33570] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Melgromm Highmountain",
					["npcID"] = 18969,
				},
				[78675] = {
					["source"] = "Doomkinx-BurningBlade",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[80850] = {
					["source"] = "Thuzadin Necromancer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 10400,
				},
				[8599] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ghostpaw Alpha",
					["npcID"] = 3825,
				},
				[252216] = {
					["source"] = "Dirtylegs-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[54962] = {
					["source"] = "Dragonflayer Strategist",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 23956,
				},
				[31615] = {
					["npcID"] = 17826,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Swamplord Musel'ek",
					["encounterID"] = 1947,
				},
				[55090] = {
					["source"] = "Razzakin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[61295] = {
					["source"] = "Castscarin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1856] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sneakyjr-Stormrage",
					["npcID"] = 0,
				},
				[306715] = {
					["source"] = "Tìgerlìly",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267612] = {
					["type"] = "BUFF",
					["source"] = "Katyuska-BleedingHollow",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 232,
				},
				[31807] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Keleth",
					["npcID"] = 17901,
				},
				[84305] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 42244,
				},
				[5413] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Corruptor",
					["npcID"] = 12217,
				},
				[83015] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dreadmaul Brute",
					["npcID"] = 5976,
				},
				[31935] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[274738] = {
					["source"] = "Teksubshaw-Thrall",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[101643] = {
					["source"] = "Squatrack-Gnomeregan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[276743] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Redication",
					["npcID"] = 0,
				},
				[54791] = {
					["encounterID"] = 481,
					["source"] = "Maleki the Pallid",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10438,
				},
				[6685] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Kharanos Rifleman",
					["npcID"] = 41182,
				},
				[81363] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Stonetalon Ram",
					["npcID"] = 34894,
				},
				[10966] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Magronos the Unyielding",
					["npcID"] = 8297,
				},
				[268904] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Firefur-Illidan",
					["npcID"] = 0,
				},
				[21062] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Putridus Satyr",
					["npcID"] = 11790,
				},
				[16739] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Glyndorn-Mal'Ganis",
					["npcID"] = 0,
				},
				[43127] = {
					["source"] = "Risen Spirit",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 23554,
				},
				[268905] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Firefur-Illidan",
					["npcID"] = 0,
				},
				[74589] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jihadria",
					["npcID"] = 0,
				},
				[286305] = {
					["source"] = "Varok Saurfang",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 146011,
				},
				[48438] = {
					["source"] = "Blueßulls",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[121536] = {
					["source"] = "Derive-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[42425] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[42489] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[204883] = {
					["source"] = "Aelymn",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[268907] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Crusadia",
					["npcID"] = 0,
				},
				[9143] = {
					["npcID"] = 13601,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tinkerer Gizlock",
					["encounterID"] = 427,
				},
				[744] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Wildthorn Lurker",
					["npcID"] = 3821,
				},
				[156779] = {
					["source"] = "Emillotte",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268908] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Babypigeon",
					["npcID"] = 0,
				},
				[32735] = {
					["source"] = "Goblin Harvester",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 35204,
				},
				[132168] = {
					["source"] = "Tahnok-Thunderhorn",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[65628] = {
					["source"] = "Captured Razormane",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 34523,
				},
				[20549] = {
					["source"] = "Doomkinx-BurningBlade",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[34026] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Magiss-Blackhand",
					["npcID"] = 0,
				},
				[209746] = {
					["source"] = "Nohno",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[70234] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Howdoigrip",
					["npcID"] = 0,
				},
				[35197] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Umbrafen Witchdoctor",
					["npcID"] = 20115,
				},
				[190336] = {
					["encounterID"] = 482,
					["source"] = "Darkssol-Proudmoore",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[39419] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mire Hydra",
					["npcID"] = 18213,
				},
				[21833] = {
					["type"] = "BUFF",
					["source"] = "Tinkerer Gizlock",
					["npcID"] = 13601,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 427,
				},
				[29722] = {
					["source"] = "Felfirefox-Scilla",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[7713] = {
					["source"] = "Undead Postman",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 11142,
				},
				[17963] = {
					["source"] = "Warsong Vanguard",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 34366,
				},
				[15572] = {
					["source"] = "Dragonflayer Metalworker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 24078,
				},
				[122] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Norly-EmeraldDream",
					["npcID"] = 0,
				},
				[312411] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bqr-Tichondrius",
					["encounterID"] = 1146,
				},
				[15620] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Darnassian Archer",
					["npcID"] = 18965,
				},
				[13589] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Anvilrage Overseer",
					["npcID"] = 8889,
				},
				[52341] = {
					["source"] = "Lightning Construct",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27972,
				},
				[54452] = {
					["type"] = "BUFF",
					["source"] = "Shionden-Stormrage",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[150385] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Splinterbone Shadowcaster",
					["npcID"] = 74480,
				},
				[109128] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Trollnareff",
					["npcID"] = 0,
				},
				[15716] = {
					["type"] = "BUFF",
					["source"] = "Ghaz'an",
					["npcID"] = 18105,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1945,
				},
				[19645] = {
					["source"] = "Wailing Banshee",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 10464,
				},
				[261947] = {
					["source"] = "Define-ScarletCrusade",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[117828] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sweetjuice-Ravencrest",
					["npcID"] = 0,
				},
				[12294] = {
					["source"] = "Atuzu",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[291944] = {
					["source"] = "Thartuk",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[317020] = {
					["source"] = "Axefish",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[246851] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Magiss-Blackhand",
					["npcID"] = 0,
				},
				[46968] = {
					["source"] = "Tahnok-Thunderhorn",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[32612] = {
					["source"] = "Pyrokus-Auchindoun",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[49143] = {
					["source"] = "Kaeji-Terokkar",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[7948] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cavern Shambler",
					["npcID"] = 12224,
				},
				[31808] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ashyen",
					["npcID"] = 17900,
				},
				[84309] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bloodwash Gambler",
					["npcID"] = 41404,
				},
				[83657] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Redstone Basilisk",
					["npcID"] = 5990,
				},
				[246852] = {
					["type"] = "BUFF",
					["source"] = "Phoque-Hyjal",
					["encounterID"] = 1891,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[35198] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Terror Totem",
					["npcID"] = 20455,
				},
				[16324] = {
					["source"] = "Ravaged Cadaver",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10381,
				},
				[8004] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Notklingon-Zuluhed",
					["npcID"] = 0,
				},
				[19750] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[32064] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 47270,
				},
				[14873] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Shifty Thief",
					["npcID"] = 46381,
				},
				[150388] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[264314] = {
					["source"] = "Puddycat-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[16100] = {
					["npcID"] = 12236,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lord Vyletongue",
					["encounterID"] = 424,
				},
				[14795] = {
					["source"] = "Thartuk",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[191840] = {
					["source"] = "Chipmonkas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193641] = {
					["source"] = "Rogjix-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[212799] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Redication",
					["npcID"] = 0,
				},
				[8092] = {
					["source"] = "Kaydrick-Azshara",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[79877] = {
					["source"] = "Krom'gar Berserker",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 35158,
				},
				[268429] = {
					["source"] = "Cleopatra-TheForgottenCoast",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[90328] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 38453,
				},
				[16244] = {
					["source"] = "Bonechewer Hungerer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 17259,
				},
				[292463] = {
					["source"] = "Thartuk",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[31589] = {
					["encounterID"] = 480,
					["source"] = "Darkssol-Proudmoore",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[41534] = {
					["source"] = "Fel Reaver",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 18733,
				},
				[54965] = {
					["source"] = "Dragonflayer Runecaster",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 23960,
				},
				[248646] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Donatello-Shadowmoon",
					["npcID"] = 0,
				},
				[303211] = {
					["source"] = "Crom",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280433] = {
					["source"] = "Yayo-TheUnderbog",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[32736] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Unknown",
					["npcID"] = 11912,
				},
				[284277] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Felicitey",
					["npcID"] = 0,
				},
				[34645] = {
					["encounterID"] = 1893,
					["source"] = "Watchkeeper Gargolmar",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 17306,
				},
				[55342] = {
					["type"] = "BUFF",
					["source"] = "Darkssol-Proudmoore",
					["encounterID"] = 480,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[45242] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kanitos-Gurubashi",
					["npcID"] = 0,
				},
				[287827] = {
					["source"] = "Candieman-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[191587] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Dismal",
					["npcID"] = 0,
				},
				[130] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Firefoxy-Duskwood",
					["npcID"] = 0,
				},
				[27243] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lamäshtu-Ghostlands",
					["npcID"] = 0,
				},
				[78810] = {
					["source"] = "Singed Shambler",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 3780,
				},
				[129250] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hollyfox",
					["npcID"] = 0,
				},
				[281209] = {
					["source"] = "Dramghrul",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[22885] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Melgromm Highmountain",
					["npcID"] = 18969,
				},
				[273977] = {
					["source"] = "Panded-Zul'jin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[214105] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 107836,
				},
				[117952] = {
					["source"] = "Sakikaru-Zangarmarsh",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[81753] = {
					["source"] = "Wastewander Foreman",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 154425,
				},
				[116680] = {
					["source"] = "Chipmonkas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2120] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Firefur-Illidan",
					["npcID"] = 0,
				},
				[151928] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Gelatanized Plague Gunk",
					["npcID"] = 74950,
				},
				[78348] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[292363] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Trollnareff",
					["npcID"] = 0,
				},
				[109132] = {
					["source"] = "Sakikaru-Zangarmarsh",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[150528] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Death's Head Arachnomancer",
					["npcID"] = 74483,
				},
				[281724] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mõmmÿ",
					["npcID"] = 0,
				},
				[16458] = {
					["source"] = "Plague Ghoul",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10405,
				},
				[68704] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 36272,
				},
				[31553] = {
					["source"] = "Dreghood Brute",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 16938,
				},
				[86620] = {
					["npcID"] = 46254,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hogger",
					["encounterID"] = 1144,
				},
				[8364] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Splinterbone Frostweaver",
					["npcID"] = 74379,
				},
				[258920] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Resir-Turalyon",
					["npcID"] = 0,
				},
				[136] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Magiss-Blackhand",
					["npcID"] = 0,
				},
				[181867] = {
					["source"] = "Agendedes-Aegwynn",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[292473] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Trollnareff",
					["npcID"] = 0,
				},
				[71775] = {
					["source"] = "Thartuk",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[43132] = {
					["source"] = "Noxious Flayer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 4346,
				},
				[106830] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Moosejaw-Shadowmoon",
					["npcID"] = 0,
				},
				[195182] = {
					["source"] = "Gissëlle-Quel'Thalas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[244813] = {
					["source"] = "Candieman-Illidan",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[216411] = {
					["source"] = "Ronyrigatoni",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[198304] = {
					["source"] = "Tahnok-Thunderhorn",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[10887] = {
					["encounterID"] = 482,
					["source"] = "Magistrate Barthilas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10435,
				},
				[214621] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Vulperry-Illidan",
					["npcID"] = 0,
				},
				[32065] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bog Giant",
					["npcID"] = 17723,
				},
				[33802] = {
					["source"] = "Flame Wave",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 19381,
				},
				[33962] = {
					["source"] = "Shattered Hand Captain",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 16870,
				},
				[58165] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kitsuri",
					["npcID"] = 0,
				},
				[30146] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Christsaves-Lightbringer",
					["npcID"] = 0,
				},
				[108366] = {
					["source"] = "Fallencruxis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[33793] = {
					["encounterID"] = 1892,
					["source"] = "Nazan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 17307,
				},
				[20007] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Huztle-KhazModan",
					["npcID"] = 0,
				},
				[51399] = {
					["source"] = "Gissëlle-Quel'Thalas",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[246152] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Magiss-Blackhand",
					["npcID"] = 0,
				},
				[91143] = {
					["source"] = "Chipmonkas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[34113] = {
					["source"] = "Bonechewer Mutant",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 16876,
				},
				[272123] = {
					["source"] = "Freent-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[9080] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Vicious Thug",
					["npcID"] = 46379,
				},
				[38558] = {
					["source"] = "Gerenzo Wrenchwhistle",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 4202,
				},
				[48698] = {
					["source"] = "Dragonflayer Seer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26554,
				},
				[9128] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Anvilrage Officer",
					["npcID"] = 8895,
				},
				[32609] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 18581,
				},
				[137639] = {
					["type"] = "BUFF",
					["source"] = "Define-ScarletCrusade",
					["encounterID"] = 1893,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[81500] = {
					["source"] = "Krom'gar Warrior",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 35161,
				},
				[15549] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Margol the Rager",
					["npcID"] = 5833,
				},
				[192106] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Benemortis-BloodFurnace",
					["npcID"] = 0,
				},
				[40652] = {
					["source"] = "Darnassian Scout",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 41865,
				},
				[34881] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Murkblood Oracle",
					["npcID"] = 17771,
				},
				[43133] = {
					["source"] = "Darkmist Recluse",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 4378,
				},
				[217694] = {
					["source"] = "Candieman-Illidan",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[61684] = {
					["source"] = "Wolf",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 3825,
				},
				[70242] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Javahoodie-Illidan",
					["npcID"] = 0,
				},
				[235559] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Stinkybeard",
					["npcID"] = 0,
				},
				[2336] = {
					["source"] = "Squatrack-Gnomeregan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[57846] = {
					["source"] = "Northwatch Encroacher",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 41935,
				},
				[280713] = {
					["source"] = "Fujisl",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267798] = {
					["source"] = "Thartuk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[6749] = {
					["source"] = "Overlord Mok'Morokk",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 4500,
				},
				[86604] = {
					["npcID"] = 46254,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hogger",
					["encounterID"] = 1144,
				},
				[115313] = {
					["source"] = "Chipmonkas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[12471] = {
					["source"] = "Bleeding Hollow Scryer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 17478,
				},
				[156064] = {
					["source"] = "Beachy-Baelgun",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[15621] = {
					["npcID"] = 8905,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Warbringer Construct",
					["encounterID"] = 232,
				},
				[88154] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lunk",
					["npcID"] = 47281,
				},
				[53365] = {
					["source"] = "Razzakin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[6813] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 3925,
				},
				[257044] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sathienis-Shu'halo",
					["npcID"] = 0,
				},
				[34114] = {
					["source"] = "Bonechewer Mutant",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 16876,
				},
				[3604] = {
					["source"] = "Ravasaur Hunter",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 6507,
				},
				[8078] = {
					["source"] = "Masha Cliffwalker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 42047,
				},
				[280205] = {
					["source"] = "Turekk",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[48699] = {
					["source"] = "Dragonflayer Seer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26554,
				},
				[50810] = {
					["encounterID"] = 1994,
					["source"] = "Krystallus",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27977,
				},
				[87387] = {
					["source"] = "Brimgore",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 4339,
				},
				[9672] = {
					["source"] = "Skeletal Guardian",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10390,
				},
				[185763] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mashido",
					["npcID"] = 0,
				},
				[126664] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Trollnareff",
					["npcID"] = 0,
				},
				[167105] = {
					["source"] = "Atuzu",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[6917] = {
					["source"] = "Thornfang Venomspitter",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 19350,
				},
				[182387] = {
					["source"] = "Chicoritita-Quel'Thalas",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[51322] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 34866,
				},
				[195181] = {
					["source"] = "Gissëlle-Quel'Thalas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[150452] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Frozen Soul",
					["npcID"] = 74488,
				},
				[70244] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zimeon",
					["npcID"] = 0,
				},
				[202090] = {
					["source"] = "Chipmonkas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[281744] = {
					["source"] = "Spankamandy",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[202602] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kronnaw-Stormrage",
					["npcID"] = 0,
				},
				[35394] = {
					["source"] = "Greater Sporebat",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 18129,
				},
				[118905] = {
					["encounterID"] = 479,
					["source"] = "Capacitor Totem",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 61245,
				},
				[294027] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hobõ",
					["npcID"] = 0,
				},
				[2484] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mona-Sargeras",
					["encounterID"] = 1146,
				},
				[205929] = {
					["source"] = "Krunkadunk",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[205708] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Lunalie-Illidan",
					["npcID"] = 0,
				},
				[300693] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mona-Sargeras",
					["npcID"] = 0,
				},
				[79840] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Felscale Crawler",
					["npcID"] = 45087,
				},
				[290028] = {
					["type"] = "BUFF",
					["source"] = "Notklingon-Zuluhed",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 427,
				},
				[268953] = {
					["source"] = "Drusyn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[78177] = {
					["source"] = "Large Daddy",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 41954,
				},
				[115151] = {
					["source"] = "Chipmonkas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[30451] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tishtroll-Ravencrest",
					["npcID"] = 0,
				},
				[25771] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[32482] = {
					["source"] = "Jaro-Baelgun",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[12167] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Riverpaw Shaman",
					["npcID"] = 46252,
				},
				[295367] = {
					["source"] = "Chipmonkas",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[93402] = {
					["source"] = "Balloo-Zangarmarsh",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[32610] = {
					["type"] = "BUFF",
					["source"] = "Unknown",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 18564,
				},
				[79858] = {
					["source"] = "Dreadmaul Ogre Mage",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 5975,
				},
				[32131] = {
					["source"] = "High Chieftain Cliffwalker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 42039,
				},
				[268956] = {
					["source"] = "Drusyn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[32738] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tunneler",
					["npcID"] = 16968,
				},
				[437] = {
					["source"] = "Darkssol-Proudmoore",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[205636] = {
					["source"] = "Drusyn",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[299662] = {
					["source"] = "Chrisoshadow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[78178] = {
					["source"] = "Unknown",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 41954,
				},
				[78306] = {
					["source"] = "Emosylvanas-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[264352] = {
					["source"] = "Mommazomba",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[281240] = {
					["source"] = "Bufir",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[236645] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Firefur-Illidan",
					["npcID"] = 0,
				},
				[8042] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mona-Sargeras",
					["npcID"] = 0,
				},
				[24870] = {
					["source"] = "Sycoon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[299664] = {
					["source"] = "Isaoo",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[22887] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Murkblood Spearman",
					["npcID"] = 17729,
				},
				[12169] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 38624,
				},
				[81505] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Goblin Pump Controller",
					["npcID"] = 41437,
				},
				[34914] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Chlöe-Malfurion",
					["npcID"] = 0,
				},
				[257620] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sathienis-Shu'halo",
					["npcID"] = 0,
				},
				[102359] = {
					["source"] = "Dirtylegs-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[187874] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Firephox-Mal'Ganis",
					["npcID"] = 0,
				},
				[104423] = {
					["source"] = "Lavorre-Dalaran",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[78295] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Goblin Heavy Gun",
					["npcID"] = 41895,
				},
				[80354] = {
					["source"] = "Viices",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[150665] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[31427] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Underbog Shambler",
					["npcID"] = 17871,
				},
				[123725] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Tikigu",
					["npcID"] = 0,
				},
				[48583] = {
					["encounterID"] = 2024,
					["source"] = "Skarvald the Constructor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 24200,
				},
				[54842] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cntdonething-Stormrage",
					["npcID"] = 0,
				},
				[50812] = {
					["type"] = "DEBUFF",
					["source"] = "Rajukah-Illidan",
					["encounterID"] = 1994,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[285719] = {
					["source"] = "Maýo",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[81378] = {
					["source"] = "General Grebo",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 42050,
				},
				[77412] = {
					["source"] = "Wuara-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[11876] = {
					["npcID"] = 13141,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Deeprot Stomper",
					["encounterID"] = 427,
				},
				[31715] = {
					["npcID"] = 17882,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "The Black Stalker",
					["encounterID"] = 1948,
				},
				[31747] = {
					["source"] = "Crust Burster",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 16844,
				},
				[212552] = {
					["source"] = "Caskmates",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[73958] = {
					["source"] = "Drowned Thunder Lizard",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 39464,
				},
				[22888] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[35076] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "A'dal",
					["npcID"] = 18481,
				},
				[53563] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[6942] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Felmusk Felsworn",
					["npcID"] = 3762,
				},
				[45503] = {
					["source"] = "Hamachi-Thrall",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[32003] = {
					["source"] = "Gan'arg Servant",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 16947,
				},
				[15039] = {
					["source"] = "Smolderthorn Shaman",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 48118,
				},
				[21832] = {
					["encounterID"] = 429,
					["source"] = "Princess Theradras",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 12201,
				},
				[207472] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Crylenna",
					["npcID"] = 0,
				},
				[138130] = {
					["type"] = "BUFF",
					["source"] = "Earth Spirit",
					["encounterID"] = 1893,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 69792,
				},
				[8921] = {
					["source"] = "Balloo-Zangarmarsh",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[172] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lamäshtu-Ghostlands",
					["npcID"] = 0,
				},
				[275779] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[262387] = {
					["source"] = "Shattered Hand Neophyte",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 19410,
				},
				[274598] = {
					["source"] = "Candieman-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298703] = {
					["source"] = "Cloudwatcher-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[22120] = {
					["source"] = "Krom'gar Warrior",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 35161,
				},
				[263852] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "DíckCheney",
					["npcID"] = 131076,
				},
				[297116] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Resir-Turalyon",
					["npcID"] = 0,
				},
				[22695] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Petrified Guardian",
					["npcID"] = 14303,
				},
				[42433] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Smolderwing",
					["npcID"] = 23789,
				},
				[263853] = {
					["source"] = "Hyena",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 37086,
				},
				[48702] = {
					["type"] = "BUFF",
					["source"] = "Dragonflayer Fanatic",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 26553,
				},
				[147362] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sathienis-Shu'halo",
					["encounterID"] = 427,
				},
				[186270] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Renuki-Zul'jin",
					["npcID"] = 0,
				},
				[305395] = {
					["source"] = "Thartuk",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297118] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Merazi",
					["npcID"] = 0,
				},
				[32707] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Felmusk Felsworn",
					["npcID"] = 3762,
				},
				[126346] = {
					["source"] = "Ashenvale Bowman",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 33195,
				},
				[295137] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Viktória-Stormreaver",
					["npcID"] = 0,
				},
				[16427] = {
					["source"] = "Crypt Beast",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 10413,
				},
				[78054] = {
					["source"] = "Wuara-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[37624] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Diathorus the Seeker",
					["npcID"] = 6072,
				},
				[290467] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Akusho",
					["npcID"] = 0,
				},
				[22696] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 14303,
				},
				[95826] = {
					["source"] = "Mor'shan Defender",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 33201,
				},
				[7741] = {
					["source"] = "Unknown",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 19305,
				},
				[84963] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Crusadia",
					["npcID"] = 0,
				},
				[116841] = {
					["source"] = "Micromist",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[43649] = {
					["encounterID"] = 2024,
					["source"] = "Dalronn the Controller",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 24201,
				},
				[79206] = {
					["type"] = "BUFF",
					["source"] = "Kazorra-Tichondrius",
					["encounterID"] = 429,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[17173] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Diathorus the Seeker",
					["npcID"] = 6072,
				},
				[66254] = {
					["source"] = "Malaka'jin Witch Doctor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 34807,
				},
				[33417] = {
					["source"] = "Night Elf Mage",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 35154,
				},
				[72968] = {
					["source"] = "Bowchicawow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[150072] = {
					["npcID"] = 74412,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Aarux",
					["encounterID"] = 1662,
				},
				[217200] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Magiss-Blackhand",
					["npcID"] = 0,
				},
				[8147] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Margol the Rager",
					["npcID"] = 5833,
				},
				[76136] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 40906,
				},
				[199545] = {
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[68927] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[31428] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[188031] = {
					["source"] = "Kaliba",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[48639] = {
					["source"] = "Ymirjar Warrior",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26690,
				},
				[48703] = {
					["type"] = "BUFF",
					["source"] = "Dragonflayer Fanatic",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 26553,
				},
				[222695] = {
					["source"] = "Arylla-AlteracMountains",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[15798] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Severed Keeper",
					["npcID"] = 3803,
				},
				[17291] = {
					["source"] = "Darkssol-Proudmoore",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[34189] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 41854,
				},
				[160597] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[19434] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sathienis-Shu'halo",
					["encounterID"] = 427,
				},
				[2948] = {
					["source"] = "Candieman-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[300762] = {
					["source"] = "Candieman-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[180612] = {
					["type"] = "BUFF",
					["source"] = "Razzakin",
					["encounterID"] = 479,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[84325] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Enthralled Cultist",
					["npcID"] = 41254,
				},
				[2908] = {
					["source"] = "Dirtylegs-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[255072] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lokrum",
					["npcID"] = 0,
				},
				[57723] = {
					["source"] = "Maýo",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268854] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mashido",
					["npcID"] = 0,
				},
				[68589] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 36296,
				},
				[123986] = {
					["source"] = "Sakikaru-Zangarmarsh",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[43650] = {
					["encounterID"] = 2024,
					["source"] = "Dalronn the Controller",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 24201,
				},
				[11960] = {
					["source"] = "Dreadmaul Mauler",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 5977,
				},
				[11976] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dark Iron Watchman",
					["npcID"] = 8637,
				},
				[68821] = {
					["source"] = "Apothecary Hummel",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 36296,
				},
				[198013] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Resir-Turalyon",
					["npcID"] = 0,
				},
				[188034] = {
					["type"] = "BUFF",
					["source"] = "Roflsmash-Thrall",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[30213] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Orikvazul",
					["npcID"] = 17252,
				},
				[79976] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 50012,
				},
				[48256] = {
					["encounterID"] = 2027,
					["source"] = "Gortok Palehoof",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26687,
				},
				[22121] = {
					["source"] = "Falcon Watch Sentinel",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 16579,
				},
				[84454] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bloodwash Enchantress",
					["npcID"] = 41387,
				},
				[119381] = {
					["source"] = "Define-ScarletCrusade",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[188838] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Gladrielynne-Shadowmoon",
					["npcID"] = 0,
				},
				[188035] = {
					["source"] = "Shushy-Sargeras",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[58875] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Intense",
					["npcID"] = 0,
				},
				[26297] = {
					["type"] = "BUFF",
					["source"] = "Millovich-Bonechewer",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1146,
				},
				[85222] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Annvicious-Illidan",
					["npcID"] = 0,
				},
				[81256] = {
					["type"] = "BUFF",
					["source"] = "Gissëlle-Quel'Thalas",
					["encounterID"] = 2024,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[17364] = {
					["source"] = "Shamstral-BleedingHollow",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[78336] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mashido",
					["npcID"] = 0,
				},
				[23881] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Trollnareff",
					["npcID"] = 0,
				},
				[79721] = {
					["source"] = "Nethergarde Engineer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 5997,
				},
				[79849] = {
					["source"] = "Moraka",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 46718,
				},
				[22592] = {
					["type"] = "DEBUFF",
					["source"] = "Princess Theradras",
					["encounterID"] = 429,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 12201,
				},
				[16460] = {
					["source"] = "Plagued Insect",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10461,
				},
				[33951] = {
					["source"] = "Bonechewer Mutant",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 16876,
				},
				[35079] = {
					["source"] = "Phoque-Hyjal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[150679] = {
					["npcID"] = 74434,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Amnennar the Coldbringer",
					["encounterID"] = 1666,
				},
				[57724] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Argish",
					["npcID"] = 0,
				},
				[61882] = {
					["source"] = "Chicoritita-Quel'Thalas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[34345] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Twilight Dark Shaman",
					["npcID"] = 5860,
				},
				[53822] = {
					["source"] = "Razzakin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[43651] = {
					["encounterID"] = 2024,
					["source"] = "Skarvald the Constructor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 24200,
				},
				[12472] = {
					["type"] = "BUFF",
					["source"] = "Kirasha-Blackrock",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 232,
				},
				[73920] = {
					["source"] = "Kazorra-Tichondrius",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[73325] = {
					["source"] = "Derive-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[6262] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[90606] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "\"Captain\" Cookie",
					["npcID"] = 47739,
				},
				[88038] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 922,
				},
				[279709] = {
					["source"] = "Drusyn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[277181] = {
					["source"] = "Squatrack-Gnomeregan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[105421] = {
					["source"] = "Thartuk",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[78315] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[3160] = {
					["source"] = "Powashot-Stormrage",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[31429] = {
					["npcID"] = 17827,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Claw",
					["encounterID"] = 1947,
				},
				[81361] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Boulderslide Stonepounder",
					["npcID"] = 11918,
				},
				[78827] = {
					["source"] = "General Grebo",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 42050,
				},
				[65081] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Vulperry-Illidan",
					["npcID"] = 0,
				},
				[36487] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jarroc Torn-Wing",
					["npcID"] = 41164,
				},
				[260708] = {
					["source"] = "Atuzu",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[116705] = {
					["source"] = "Define-ScarletCrusade",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[20243] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kronnaw-Stormrage",
					["npcID"] = 0,
				},
				[280177] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Padcad",
					["npcID"] = 0,
				},
				[31717] = {
					["npcID"] = 17882,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "The Black Stalker",
					["encounterID"] = 1948,
				},
				[79851] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Grimtotem Mercenary",
					["npcID"] = 11911,
				},
				[132157] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hollyfox",
					["encounterID"] = 232,
				},
				[151962] = {
					["npcID"] = 74875,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Death Speaker Blackthorn",
					["encounterID"] = 1665,
				},
				[88423] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Teizzie-WyrmrestAccord",
					["npcID"] = 0,
				},
				[65216] = {
					["source"] = "Whirling Vortex",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 34322,
				},
				[268893] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Woozah-Mal'Ganis",
					["npcID"] = 0,
				},
				[259430] = {
					["source"] = "Kishbaw",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[115546] = {
					["encounterID"] = 479,
					["source"] = "Quijang-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[78828] = {
					["source"] = "General Grebo",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 42050,
				},
				[8858] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dark Iron Geologist",
					["npcID"] = 5839,
				},
				[131493] = {
					["source"] = "Deeohgee",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[33634] = {
					["source"] = "Bloodmage",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 19258,
				},
				[32133] = {
					["source"] = "Murkblood Putrifier",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 18202,
				},
				[15063] = {
					["npcID"] = 8913,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Twilight Emissary",
					["encounterID"] = 232,
				},
				[298343] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Padcad",
					["npcID"] = 0,
				},
				[69489] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Zacore",
					["npcID"] = 0,
				},
				[198533] = {
					["source"] = "Jade Serpent Statue",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 60849,
				},
				[71792] = {
					["source"] = "Gorishi Fledgling Colossus",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 38305,
				},
				[48258] = {
					["encounterID"] = 2030,
					["source"] = "Svala Sorrowgrave",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26668,
				},
				[263840] = {
					["source"] = "Wolf",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 3825,
				},
				[78317] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[86633] = {
					["npcID"] = 46264,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lord Overheat",
					["encounterID"] = 1145,
				},
				[84714] = {
					["source"] = "Crexus-Tichondrius",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[300893] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mashido",
					["npcID"] = 0,
				},
				[50689] = {
					["type"] = "BUFF",
					["source"] = "Unknown",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 27860,
				},
				[56894] = {
					["source"] = "Malohint",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[52419] = {
					["source"] = "Razzakin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279362] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Martin",
					["npcID"] = 9318,
				},
				[32645] = {
					["source"] = "Teksubshaw-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[124503] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tikigu",
					["npcID"] = 0,
				},
				[49026] = {
					["source"] = "Bloodthirsty Tundra Wolf",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26672,
				},
				[186263] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bqr-Tichondrius",
					["npcID"] = 0,
				},
				[77806] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wildthorn Lurker",
					["npcID"] = 3821,
				},
				[16429] = {
					["source"] = "Thuzadin Shadowcaster",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10398,
				},
				[20707] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Viktória-Stormreaver",
					["npcID"] = 0,
				},
				[84331] = {
					["source"] = "Ashmane Boar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 5992,
				},
				[74224] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Pawndering",
					["npcID"] = 0,
				},
				[280776] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Trollnareff",
					["npcID"] = 0,
				},
				[11977] = {
					["source"] = "Ariok",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 48562,
				},
				[57984] = {
					["encounterID"] = 479,
					["source"] = "Greater Fire Elemental",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 95061,
				},
				[186254] = {
					["source"] = "Phoque-Hyjal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[115804] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Cartujo-Agamaggan",
					["npcID"] = 0,
				},
				[6742] = {
					["source"] = "Shattered Hand Neophyte",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 19410,
				},
				[11426] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lunalie-Illidan",
					["npcID"] = 0,
				},
				[21869] = {
					["encounterID"] = 429,
					["source"] = "Princess Theradras",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 12201,
				},
				[37704] = {
					["source"] = "Krom'gar Berserker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 35158,
				},
				[85739] = {
					["source"] = "Atuzu",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[79726] = {
					["source"] = "Nethergarde Engineer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 5997,
				},
				[208772] = {
					["type"] = "DEBUFF",
					["source"] = "Hollyfox",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 232,
				},
				[292364] = {
					["source"] = "Havikshadow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[21067] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Poison Sprite",
					["npcID"] = 12216,
				},
				[3408] = {
					["source"] = "Redrabbit-Kargath",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288981] = {
					["source"] = "Zaràki",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280780] = {
					["source"] = "Cassíopeía-Blackhand",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[34186] = {
					["source"] = "Illidari Taskmaster",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 17058,
				},
				[82797] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Snickerfang Hyena",
					["npcID"] = 5985,
				},
				[300751] = {
					["source"] = "Valiumm-Skullcrusher",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[48707] = {
					["source"] = "Razzakin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[197003] = {
					["source"] = "Wrekin-Ysera",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[15799] = {
					["source"] = "Warsong Captain",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 25446,
				},
				[116189] = {
					["type"] = "DEBUFF",
					["source"] = "Quijang-Illidan",
					["encounterID"] = 479,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[304851] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[201846] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Woozah-Mal'Ganis",
					["npcID"] = 0,
				},
				[49091] = {
					["source"] = "Ymirjar Harpooner",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26692,
				},
				[96231] = {
					["source"] = "Thartuk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[278736] = {
					["source"] = "Ðarkwraith",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[13864] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 19415,
				},
				[84333] = {
					["source"] = "Dreadmaul Ambusher",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 41136,
				},
				[33675] = {
					["source"] = "Dread Tactician",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 16959,
				},
				[86636] = {
					["npcID"] = 46264,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lord Overheat",
					["encounterID"] = 1145,
				},
				[215387] = {
					["source"] = "Microyeen",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[16430] = {
					["source"] = "Thuzadin Necromancer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10400,
				},
				[186258] = {
					["source"] = "Renuki-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[589] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Chlöe-Malfurion",
					["npcID"] = 0,
				},
				[51842] = {
					["source"] = "Unrelenting Construct",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27971,
				},
				[296138] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lemmedrink",
					["npcID"] = 0,
				},
				[35594] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rajis Fyashe",
					["npcID"] = 18044,
				},
				[124506] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tikigu",
					["npcID"] = 0,
				},
				[30151] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Orikvazul",
					["npcID"] = 17252,
				},
				[79728] = {
					["source"] = "Ticking Time Bomb",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 42776,
				},
				[28168] = {
					["source"] = "Raging Construct",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27970,
				},
				[12057] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Murkblood Tribesman",
					["npcID"] = 17728,
				},
				[14120] = {
					["source"] = "Gorishi Tunneler",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 6555,
				},
				[80240] = {
					["source"] = "Agendedes-Aegwynn",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[90603] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "\"Captain\" Cookie",
					["npcID"] = 47739,
				},
				[298700] = {
					["source"] = "Staradin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[32454] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Amali",
					["npcID"] = 0,
				},
				[50627] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[290512] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Bootyfist-Illidan",
					["npcID"] = 0,
				},
				[44614] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lunalie-Illidan",
					["npcID"] = 0,
				},
				[24394] = {
					["source"] = "Hyena",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 37086,
				},
				[36554] = {
					["type"] = "BUFF",
					["source"] = "Loano-Ravencrest",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272090] = {
					["source"] = "Lidrenia",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[17962] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sweetjuice-Ravencrest",
					["npcID"] = 0,
				},
				[49028] = {
					["encounterID"] = 2024,
					["source"] = "Gissëlle-Quel'Thalas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[30695] = {
					["encounterID"] = 1891,
					["source"] = "Omor the Unscarred",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 17308,
				},
				[34827] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 20089,
				},
				[8219] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Oledad",
					["npcID"] = 0,
				},
				[5143] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tishtroll-Ravencrest",
					["npcID"] = 0,
				},
				[3600] = {
					["type"] = "DEBUFF",
					["source"] = "Earthbind Totem",
					["npcID"] = 2630,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1146,
				},
				[90604] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "\"Captain\" Cookie",
					["npcID"] = 47739,
				},
				[242551] = {
					["source"] = "Cyberknife",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[51587] = {
					["source"] = "Dragonflayer Spiritualist",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 28410,
				},
				[16790] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Cavern Shambler",
					["npcID"] = 12224,
				},
				[190356] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lunalie-Illidan",
					["npcID"] = 0,
				},
				[70774] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Firefoxy-Duskwood",
					["npcID"] = 0,
				},
				[22859] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Roaming Felguard",
					["npcID"] = 6115,
				},
				[5215] = {
					["source"] = "Balloo-Zangarmarsh",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[205448] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Chlöe-Malfurion",
					["npcID"] = 0,
				},
				[186257] = {
					["source"] = "Renuki-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[271071] = {
					["source"] = "Drusyn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[8281] = {
					["source"] = "Subterranean Diemetradon",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 13323,
				},
				[12553] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Un'Goro Thunderer",
					["npcID"] = 6516,
				},
				[35915] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 9604,
				},
				[21068] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Corruptor",
					["npcID"] = 12217,
				},
				[203407] = {
					["source"] = "Salmonchipz",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[90605] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "\"Captain\" Cookie",
					["npcID"] = 47739,
				},
				[56641] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sathienis-Shu'halo",
					["npcID"] = 0,
				},
				[16553] = {
					["source"] = "Ghoul Ravener",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10406,
				},
				[3396] = {
					["source"] = "Corrupted Sap Beast",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 4021,
				},
				[87023] = {
					["source"] = "Vognar-Azgalor",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[78799] = {
					["source"] = "Befouled Water Elemental",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 3917,
				},
				[256374] = {
					["source"] = "ßöö-Stormrage",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[114018] = {
					["type"] = "BUFF",
					["source"] = "Loano-Ravencrest",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[14792] = {
					["source"] = "Venomhide Ravasaur",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 6508,
				},
				[51012] = {
					["encounterID"] = 1995,
					["source"] = "Dark Matter",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 28235,
				},
				[31687] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kirasha-Blackrock",
					["npcID"] = 0,
				},
				[31719] = {
					["type"] = "DEBUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1948,
				},
				[3716] = {
					["source"] = "Klathgarth",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 1860,
				},
				[83368] = {
					["source"] = "Stone Guardian",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 6560,
				},
				[265931] = {
					["source"] = "Minuano-Arthas",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[213644] = {
					["source"] = "Thartuk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[51460] = {
					["source"] = "Crõwlêy",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[32022] = {
					["source"] = "Bonestripper Vulture",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 16973,
				},
				[79852] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Grimtotem Mercenary",
					["npcID"] = 11911,
				},
				[113746] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Donatello-Shadowmoon",
					["npcID"] = 0,
				},
				[87024] = {
					["source"] = "Vognar-Azgalor",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[277187] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fenrax-Whisperwind",
					["npcID"] = 0,
				},
				[11981] = {
					["source"] = "Netherhound",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 16950,
				},
				[17253] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Unknown",
					["npcID"] = 82308,
				},
				[32135] = {
					["source"] = "Ortor of Murkblood",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 18204,
				},
				[5487] = {
					["source"] = "Maýo",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2094] = {
					["source"] = "Teksubshaw-Thrall",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[254409] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Woozah-Mal'Ganis",
					["npcID"] = 0,
				},
				[300761] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mona-Sargeras",
					["npcID"] = 0,
				},
				[35916] = {
					["source"] = "Bloodspore Firestarter",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 25470,
				},
				[290608] = {
					["source"] = "Thartuk",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[16868] = {
					["encounterID"] = 479,
					["source"] = "Baroness Anastari",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10436,
				},
				[84466] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Felscale Crawler",
					["npcID"] = 45087,
				},
				[294133] = {
					["source"] = "Thartuk",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[210320] = {
					["source"] = "Vtecc-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[148539] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[270058] = {
					["source"] = "Cyberthugg",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[119905] = {
					["source"] = "Cooler-Dawnbringer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[81140] = {
					["source"] = "Dreadmaul Ambusher",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 41136,
				},
				[15288] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Twilight Emissary",
					["npcID"] = 8913,
				},
				[298717] = {
					["type"] = "BUFF",
					["source"] = "Bqr-Tichondrius",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1146,
				},
				[154796] = {
					["source"] = "Roycerain-Dalaran",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[259449] = {
					["source"] = "Ashtooth",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[132404] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kronnaw-Stormrage",
					["npcID"] = 0,
				},
				[188290] = {
					["source"] = "Dantdk-Azralon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[131894] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sathienis-Shu'halo",
					["encounterID"] = 427,
				},
				[32910] = {
					["source"] = "Grimtotem Earthbinder",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 23595,
				},
				[195072] = {
					["source"] = "Deathmasheen",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[194153] = {
					["source"] = "Balloo-Zangarmarsh",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[154797] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Whiterider-Whisperwind",
					["npcID"] = 0,
				},
				[16591] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Agrious",
					["npcID"] = 0,
				},
				[18670] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ironbark Protector",
					["npcID"] = 11459,
				},
				[15496] = {
					["source"] = "General Grebo",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 42050,
				},
				[11418] = {
					["source"] = "Sabille-BleedingHollow",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[81141] = {
					["source"] = "Gissëlle-Quel'Thalas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[88418] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[256459] = {
					["source"] = "Scriptx",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[15576] = {
					["source"] = "Ashenvale Skirmisher",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 33193,
				},
				[18562] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Taurenschit-Tichondrius",
					["npcID"] = 0,
				},
				[213602] = {
					["source"] = "Rashima",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[7814] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Cattneth",
					["npcID"] = 1863,
				},
				[20271] = {
					["source"] = "Thartuk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[227723] = {
					["source"] = "Sukura",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[115750] = {
					["source"] = "Thartuk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[68841] = {
					["source"] = "Apothecary Frye",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 36272,
				},
				[43265] = {
					["source"] = "Dantdk-Azralon",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[86771] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rumbling Earth",
					["npcID"] = 46262,
				},
				[7870] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 1863,
				},
				[3583] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Shifty Thief",
					["npcID"] = 46381,
				},
				[70779] = {
					["type"] = "BUFF",
					["source"] = "Shionden-Stormrage",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[13737] = {
					["source"] = "Okril'lon Defender",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 51791,
				},
				[65215] = {
					["source"] = "Lord Magmathar",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 34295,
				},
				[44544] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Norly-EmeraldDream",
					["npcID"] = 0,
				},
				[7744] = {
					["type"] = "BUFF",
					["source"] = "Micromist",
					["encounterID"] = 429,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[12544] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Twilight Emissary",
					["npcID"] = 8913,
				},
				[34653] = {
					["encounterID"] = 1892,
					["source"] = "Nazan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 17307,
				},
				[9739] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Severed Druid",
					["npcID"] = 3799,
				},
				[194717] = {
					["source"] = "Kishinzenky",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[35460] = {
					["source"] = "Thartuk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[281404] = {
					["source"] = "Nelena",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[15248] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Riverpaw Looter",
					["npcID"] = 46251,
				},
				[150707] = {
					["npcID"] = 0,
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1666,
				},
				[259454] = {
					["source"] = "Vyndendril",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[198300] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Firephox-Mal'Ganis",
					["npcID"] = 0,
				},
				[270070] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Daddyshanks-Kel'Thuzad",
					["npcID"] = 0,
				},
				[12743] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 41253,
				},
				[33423] = {
					["source"] = "Mag'har Pitfighter",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 19140,
				},
				[11962] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Felmusk Felsworn",
					["npcID"] = 3762,
				},
				[11978] = {
					["npcID"] = 9056,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fineous Darkvire",
					["encounterID"] = 234,
				},
				[20545] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 18972,
				},
				[54149] = {
					["source"] = "Thartuk",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5302] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Millovich-Bonechewer",
					["npcID"] = 0,
				},
				[12042] = {
					["source"] = "Darkssol-Proudmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[12058] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kataru",
					["npcID"] = 18080,
				},
				[68947] = {
					["source"] = "Apothecary Baxter",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 36565,
				},
				[108446] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 17252,
				},
				[115175] = {
					["source"] = "Chipmonkas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[13398] = {
					["source"] = "Bonechewer Scavenger",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 18952,
				},
				[36238] = {
					["source"] = "Fel Cannon MKI",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 22461,
				},
				[100] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Trollnareff",
					["npcID"] = 0,
				},
				[78841] = {
					["source"] = "Huntress Davinia",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 41864,
				},
				[163201] = {
					["source"] = "Atuzu",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[2580] = {
					["source"] = "Stepsibling-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[290033] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tikigu",
					["npcID"] = 0,
				},
				[78050] = {
					["source"] = "Sakikaru-Zangarmarsh",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[300802] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Woozah-Mal'Ganis",
					["npcID"] = 0,
				},
				[71421] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[34767] = {
					["source"] = "Pyraldra-Doomhammer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[79865] = {
					["source"] = "Nerog",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 46716,
				},
				[268955] = {
					["source"] = "Candieman-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[289523] = {
					["source"] = "Cowofheal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[18543] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Mannoroc Lasher",
					["npcID"] = 11697,
				},
				[17244] = {
					["type"] = "DEBUFF",
					["source"] = "Baroness Anastari",
					["encounterID"] = 479,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 10436,
				},
				[305388] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Lamäshtu-Ghostlands",
					["npcID"] = 0,
				},
				[289524] = {
					["source"] = "Cowofheal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[163505] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Moosejaw-Shadowmoon",
					["npcID"] = 0,
				},
				[68607] = {
					["source"] = "Apothecary Hummel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 36296,
				},
				[20825] = {
					["source"] = "Blackrock Warlock",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 7028,
				},
				[164273] = {
					["source"] = "Banthael-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[57755] = {
					["source"] = "Atuzu",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[272126] = {
					["source"] = "Cyberknife",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[120] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kirasha-Blackrock",
					["npcID"] = 0,
				},
				[116] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lunalie-Illidan",
					["npcID"] = 0,
				},
				[188070] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Firephox-Mal'Ganis",
					["encounterID"] = 1664,
				},
				[210660] = {
					["source"] = "Mohdara-Dalaran",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[107079] = {
					["encounterID"] = 479,
					["source"] = "Quijang-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[48265] = {
					["source"] = "Caskmates",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[17008] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Marshfang Ripper",
					["npcID"] = 18130,
				},
				[296003] = {
					["source"] = "Vtecc-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[313148] = {
					["source"] = "Cassíopeía-Blackhand",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[257413] = {
					["source"] = "Dugalok",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[264211] = {
					["encounterID"] = 479,
					["source"] = "Darkssol-Proudmoore",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[6343] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kronnaw-Stormrage",
					["npcID"] = 0,
				},
				[50760] = {
					["encounterID"] = 1996,
					["source"] = "Maiden of Grief",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 27975,
				},
				[63106] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lamäshtu-Ghostlands",
					["npcID"] = 0,
				},
				[269571] = {
					["source"] = "Travz-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[21390] = {
					["npcID"] = 12236,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lord Vyletongue",
					["encounterID"] = 424,
				},
				[17] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Vulperry-Illidan",
					["npcID"] = 0,
				},
				[31689] = {
					["npcID"] = 17990,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Underbog Mushroom",
					["encounterID"] = 1946,
				},
				[34433] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hollyfox",
					["encounterID"] = 232,
				},
				[17735] = {
					["source"] = "Klathgarth",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 1860,
				},
				[67713] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kyshatra",
					["npcID"] = 0,
				},
				[47541] = {
					["source"] = "Crõwlêy",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[83012] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Un'Goro Gorilla",
					["npcID"] = 6514,
				},
				[17467] = {
					["source"] = "Lord Aurius Rivendare",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 45412,
				},
				[102351] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Taurenschit-Tichondrius",
					["npcID"] = 0,
				},
				[257415] = {
					["type"] = "BUFF",
					["source"] = "Gaarson",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[229206] = {
					["source"] = "Hushpad",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[32009] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fel Soldier",
					["npcID"] = 18944,
				},
				[271843] = {
					["source"] = "Squatrack-Gnomeregan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[33425] = {
					["source"] = "Mag'har Pitfighter",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 19140,
				},
				[205473] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cntdonething-Stormrage",
					["npcID"] = 0,
				},
				[32137] = {
					["source"] = "Ortor of Murkblood",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 18204,
				},
				[32734] = {
					["source"] = "Dreghood Geomancer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 16937,
				},
				[102352] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Taurenschit-Tichondrius",
					["npcID"] = 0,
				},
				[269576] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zatya",
					["npcID"] = 0,
				},
				[1784] = {
					["source"] = "Rogjix-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[3355] = {
					["source"] = "Phoque-Hyjal",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[32329] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Underbog Shambler",
					["npcID"] = 17871,
				},
				[52424] = {
					["type"] = "BUFF",
					["source"] = "Razzakin",
					["encounterID"] = 479,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[18501] = {
					["source"] = "Bonechewer Ripper",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 17281,
				},
				[56646] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Enraged Fire Elemental",
					["npcID"] = 46261,
				},
				[54663] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Deatheye",
					["npcID"] = 8302,
				},
				[12550] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 4363,
				},
				[15241] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Blazing Fireguard",
					["npcID"] = 8910,
				},
				[6607] = {
					["source"] = "Bloodfen Lashtail",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 4357,
				},
				[48778] = {
					["source"] = "Lilithguard",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[54983] = {
					["source"] = "Proto-Drake Handler",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 24082,
				},
				[221771] = {
					["encounterID"] = 1893,
					["source"] = "Define-ScarletCrusade",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[35199] = {
					["source"] = "Smolderthorn Shaman",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 48118,
				},
				[257418] = {
					["type"] = "BUFF",
					["source"] = "Ysoserial",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[57286] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cavemanbrain-Stormrage",
					["npcID"] = 0,
				},
				[75775] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Frostmane Scavenger",
					["npcID"] = 41146,
				},
				[13338] = {
					["source"] = "Blackrock Warlock",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 7028,
				},
				[32914] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kaliri Matriarch",
					["npcID"] = 17035,
				},
				[215711] = {
					["type"] = "BUFF",
					["source"] = "Rajukah-Illidan",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[68948] = {
					["source"] = "Apothecary Baxter",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 36565,
				},
				[115308] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tikigu",
					["npcID"] = 0,
				},
				[30639] = {
					["source"] = "Shattered Hand Warhound",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 17280,
				},
				[22766] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Putridus Shadowstalker",
					["npcID"] = 11792,
				},
				[15497] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rajis Fyashe",
					["npcID"] = 18044,
				},
				[119914] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Christsaves-Lightbringer",
					["npcID"] = 0,
				},
				[51849] = {
					["type"] = "BUFF",
					["source"] = "Sjonnir The Ironshaper",
					["encounterID"] = 1998,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 27978,
				},
				[12051] = {
					["source"] = "Darkssol-Proudmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[33554] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Justinius the Harbinger",
					["npcID"] = 18966,
				},
				[301312] = {
					["source"] = "Fillabigdila",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[257420] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Desume",
					["npcID"] = 0,
				},
				[32959] = {
					["source"] = "Goliathon",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 19305,
				},
				[300801] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mashido",
					["npcID"] = 0,
				},
				[116844] = {
					["source"] = "Squatrack-Gnomeregan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[15657] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Putridus Trickster",
					["npcID"] = 11791,
				},
				[9532] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Haal'eshi Windwalker",
					["npcID"] = 16966,
				},
				[115181] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tikigu",
					["npcID"] = 0,
				},
				[23214] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bloodyface-Dalaran",
					["npcID"] = 0,
				},
				[17105] = {
					["source"] = "Wailing Banshee",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10464,
				},
				[191837] = {
					["source"] = "Chipmonkas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[55077] = {
					["source"] = "Savage Worg",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 29735,
				},
				[47528] = {
					["source"] = "Gissëlle-Quel'Thalas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[13738] = {
					["source"] = "Fleshflayer Ghoul",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10407,
				},
				[42702] = {
					["encounterID"] = 2026,
					["source"] = "Vrykul Skeleton",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 23970,
				},
				[183218] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[41425] = {
					["type"] = "DEBUFF",
					["source"] = "Kirasha-Blackrock",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 232,
				},
				[35325] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Umbraglow Stinger",
					["npcID"] = 18132,
				},
				[17393] = {
					["encounterID"] = 484,
					["source"] = "Lord Aurius Rivendare",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 45412,
				},
				[86738] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Vicious Thug",
					["npcID"] = 46379,
				},
				[188592] = {
					["type"] = "BUFF",
					["source"] = "Chicoritita-Quel'Thalas",
					["encounterID"] = 479,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[53385] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[11835] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cassia the Slitherqueen",
					["npcID"] = 45258,
				},
				[313088] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fungalunga",
					["npcID"] = 0,
				},
				[206930] = {
					["source"] = "Gissëlle-Quel'Thalas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[31946] = {
					["npcID"] = 17826,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Swamplord Musel'ek",
					["encounterID"] = 1947,
				},
				[45517] = {
					["type"] = "BUFF",
					["source"] = "Warsong Hold Warrior",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 25414,
				},
				[206760] = {
					["type"] = "DEBUFF",
					["source"] = "Hellouda-Mannoroth",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[21807] = {
					["npcID"] = 12225,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Celebras the Cursed",
					["encounterID"] = 425,
				},
				[673] = {
					["source"] = "Blamm-Greymane",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[205025] = {
					["source"] = "Sneakymagi-Dalaran",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193455] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Magiss-Blackhand",
					["npcID"] = 0,
				},
				[33844] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Earthbinder Galandria Nightbreeze",
					["npcID"] = 19294,
				},
				[79616] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Felhound",
					["npcID"] = 6010,
				},
				[194223] = {
					["source"] = "Drusyn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[205648] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Firephox-Mal'Ganis",
					["npcID"] = 0,
				},
				[196782] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Dismal",
					["npcID"] = 0,
				},
				[287504] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bootyfist-Illidan",
					["npcID"] = 0,
				},
				[43130] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Withervine Creeper",
					["npcID"] = 4382,
				},
				[193456] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Drüly",
					["npcID"] = 0,
				},
				[8679] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hooknsinker-Stormrage",
					["npcID"] = 0,
				},
				[1850] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nizan-Baelgun",
					["npcID"] = 0,
				},
				[133] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Firefur-Illidan",
					["npcID"] = 0,
				},
				[102560] = {
					["source"] = "Doomkinx-BurningBlade",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[310690] = {
					["source"] = "Doomkinx-BurningBlade",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[35230] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "T'shu",
					["npcID"] = 54674,
				},
				[202770] = {
					["source"] = "Doomkinx-BurningBlade",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[290577] = {
					["source"] = "Abomination",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 149555,
				},
				[199854] = {
					["source"] = "Atuzu",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[26573] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[298512] = {
					["source"] = "Squatrack-Gnomeregan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2565] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kronnaw-Stormrage",
					["npcID"] = 0,
				},
				[114800] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[32916] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Shadowsworn Enforcer",
					["npcID"] = 6007,
				},
				[88445] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dark Iron Marksman",
					["npcID"] = 8338,
				},
				[319237] = {
					["source"] = "Toosi-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[22703] = {
					["source"] = "Agendedes-Aegwynn",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5176] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Teizzie-WyrmrestAccord",
					["npcID"] = 0,
				},
				[33642] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Melgromm Highmountain",
					["npcID"] = 18969,
				},
				[51723] = {
					["source"] = "Wrekin-Ysera",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[260242] = {
					["type"] = "BUFF",
					["source"] = "Sathienis-Shu'halo",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 427,
				},
				[1752] = {
					["source"] = "Rogjix-Mal'Ganis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[164545] = {
					["source"] = "Balloo-Zangarmarsh",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[285496] = {
					["source"] = "Doomkinx-BurningBlade",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[7279] = {
					["source"] = "Tar Lurker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 6518,
				},
				[198065] = {
					["source"] = "Tinock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[285976] = {
					["source"] = "Arthaz-Stormreaver",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[12555] = {
					["source"] = "Skeletal Berserker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10391,
				},
				[34163] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Underbog Shambler",
					["npcID"] = 17871,
				},
				[150513] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Death's Head Arachnomancer",
					["npcID"] = 74483,
				},
				[5280] = {
					["source"] = "Razormane Battleguard",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 3114,
				},
				[2645] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mona-Sargeras",
					["npcID"] = 0,
				},
				[2649] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Serpent",
					["npcID"] = 160413,
				},
				[31405] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Murkblood Oracle",
					["npcID"] = 17771,
				},
				[285978] = {
					["source"] = "Trexas-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5320] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sergra Darkthorn",
					["npcID"] = 3338,
				},
				[34290] = {
					["npcID"] = 18105,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ghaz'an",
					["encounterID"] = 1945,
				},
				[118000] = {
					["source"] = "Meatlode-BurningBlade",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[164547] = {
					["source"] = "Balloo-Zangarmarsh",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[12747] = {
					["npcID"] = 12225,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Celebras the Cursed",
					["encounterID"] = 425,
				},
				[31566] = {
					["npcID"] = 17826,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Swamplord Musel'ek",
					["encounterID"] = 1947,
				},
				[79619] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Felhound",
					["npcID"] = 6010,
				},
				[14032] = {
					["source"] = "Hellfire Watcher",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 17309,
				},
				[223143] = {
					["source"] = "Staradin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[303380] = {
					["source"] = "Chipmonkas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[231843] = {
					["source"] = "Thartuk",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[25710] = {
					["source"] = "Masha Cliffwalker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 42047,
				},
				[339] = {
					["source"] = "Doomkinx-BurningBlade",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[215598] = {
					["source"] = "Microyeen",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[215607] = {
					["source"] = "Microyeen",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[196277] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Christsaves-Lightbringer",
					["npcID"] = 0,
				},
				[32011] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bloodwash Idolater",
					["npcID"] = 41405,
				},
				[21808] = {
					["type"] = "BUFF",
					["source"] = "Landslide",
					["encounterID"] = 426,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 12203,
				},
				[43664] = {
					["source"] = "Proto-Drake Handler",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 24082,
				},
				[152267] = {
					["npcID"] = 0,
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1666,
				},
				[98444] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Justinblade-Sargeras",
					["npcID"] = 0,
				},
				[16827] = {
					["source"] = "Harry",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 1797,
				},
				[21968] = {
					["npcID"] = 12225,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Celebras the Cursed",
					["encounterID"] = 425,
				},
				[225788] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wargazim-BlackwingLair",
					["npcID"] = 0,
				},
				[32267] = {
					["source"] = "Sabille-BleedingHollow",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[198837] = {
					["source"] = "Risen Skulker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 99541,
				},
				[88320] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lunk",
					["npcID"] = 47333,
				},
				[54475] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "U'cha",
					["npcID"] = 9622,
				},
				[78341] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[9053] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Prince Raze",
					["npcID"] = 10647,
				},
				[348] = {
					["source"] = "Felfirefox-Scilla",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[5568] = {
					["source"] = "Primordial Behemoth",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 12206,
				},
				[32720] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Haal'eshi Talonguard",
					["npcID"] = 16967,
				},
				[280869] = {
					["source"] = "Candieman-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[36500] = {
					["source"] = "Stonetalon Warder",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 35151,
				},
				[42705] = {
					["type"] = "BUFF",
					["source"] = "Ingvar the Plunderer",
					["encounterID"] = 2025,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 23954,
				},
				[9941] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 7031,
				},
				[30636] = {
					["source"] = "Shattered Hand Warhound",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 17280,
				},
				[293664] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sàsukæ-Illidan",
					["npcID"] = 0,
				},
				[183998] = {
					["source"] = "Thartuk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[266030] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Viktória-Stormreaver",
					["npcID"] = 0,
				},
				[2825] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zippityzapp-Mal'Ganis",
					["npcID"] = 0,
				},
				[215479] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tikigu",
					["npcID"] = 0,
				},
				[686] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Christsaves-Lightbringer",
					["npcID"] = 0,
				},
				[45328] = {
					["source"] = "King Mrgl-Mrgl",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 25197,
				},
				[51533] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Firephox-Mal'Ganis",
					["encounterID"] = 1664,
				},
				[187837] = {
					["source"] = "Shamstral-BleedingHollow",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[89753] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Orikvazul",
					["npcID"] = 17252,
				},
				[157644] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Firefur-Illidan",
					["npcID"] = 0,
				},
				[11428] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Cavern Lurker",
					["npcID"] = 12223,
				},
				[57994] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mona-Sargeras",
					["npcID"] = 0,
				},
				[105174] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Christsaves-Lightbringer",
					["npcID"] = 0,
				},
				[197561] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[49998] = {
					["source"] = "Razzakin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[77575] = {
					["source"] = "Crõwlêy",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[119582] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tikigu",
					["npcID"] = 0,
				},
				[79878] = {
					["source"] = "Krom'gar Berserker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 35158,
				},
				[260881] = {
					["source"] = "Deshi-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[190909] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 0,
				},
				[1449] = {
					["source"] = "Darkssol-Proudmoore",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[31673] = {
					["type"] = "BUFF",
					["source"] = "Hungarfen",
					["npcID"] = 17770,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1946,
				},
				[21169] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Katyuska-BleedingHollow",
					["npcID"] = 0,
				},
				[62856] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 33356,
				},
				[12531] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Frozen Soul",
					["npcID"] = 74488,
				},
				[9613] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mannoroc Lasher",
					["npcID"] = 11697,
				},
				[137211] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tikigu",
					["npcID"] = 0,
				},
				[15786] = {
					["source"] = "Grimtotem Earthbinder",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 23595,
				},
				[234153] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Lamäshtu-Ghostlands",
					["npcID"] = 0,
				},
				[5697] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Christsaves-Lightbringer",
					["npcID"] = 0,
				},
				[13787] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 10390,
				},
				[77576] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Deatheye",
					["npcID"] = 8302,
				},
				[13819] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Manessil-Thunderlord",
					["npcID"] = 0,
				},
				[16793] = {
					["encounterID"] = 482,
					["source"] = "Magistrate Barthilas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 10435,
				},
				[7951] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Deepmoss Venomspitter",
					["npcID"] = 4007,
				},
				[34971] = {
					["type"] = "BUFF",
					["source"] = "Claw",
					["npcID"] = 17827,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 1947,
				},
				[300919] = {
					["source"] = "Drusyn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[31884] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hobõ",
					["npcID"] = 0,
				},
				[274739] = {
					["source"] = "Teksubshaw-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[43410] = {
					["source"] = "Krom'gar Logger",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 35160,
				},
				[316703] = {
					["source"] = "Scriptx",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[162313] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Órin",
					["npcID"] = 0,
				},
				[274740] = {
					["source"] = "Teksubshaw-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[225606] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Chrisxx",
					["npcID"] = 0,
				},
				[124274] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Tikigu",
					["npcID"] = 0,
				},
				[289277] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lunalie-Illidan",
					["npcID"] = 0,
				},
				[315681] = {
					["source"] = "Liquidationn",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[75025] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rasha'krak",
					["npcID"] = 47553,
				},
				[6016] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Drywallow Daggermaw",
					["npcID"] = 4345,
				},
				[115078] = {
					["encounterID"] = 479,
					["source"] = "Quijang-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[50255] = {
					["encounterID"] = 2029,
					["source"] = "Skadi the Ruthless",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 26693,
				},
				[33943] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Animorphius-Kel'Thuzad",
					["npcID"] = 0,
				},
				[150229] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[150485] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Plague-Rotted Webslinger",
					["npcID"] = 74584,
				},
				[277904] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dutchmagex-Stormreaver",
					["npcID"] = 0,
				},
				[556] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wooaas-Dalaran",
					["npcID"] = 0,
				},
				[35493] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Boglash",
					["npcID"] = 18281,
				},
				[113656] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Donatello-Shadowmoon",
					["npcID"] = 0,
				},
				[8143] = {
					["source"] = "Chicoritita-Quel'Thalas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[50831] = {
					["type"] = "BUFF",
					["source"] = "Sjonnir The Ironshaper",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 27978,
				},
				[124275] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Tikigu",
					["npcID"] = 0,
				},
				[102417] = {
					["source"] = "Malorstri",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
			},
			["border_color"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				0.8400000035762787, -- [4]
			},
			["health_selection_overlay_alpha"] = 0.1015491858124733,
		},
	},
}
