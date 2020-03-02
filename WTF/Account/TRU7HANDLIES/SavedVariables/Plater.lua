
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
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \nend\n\n\n",
					["ScriptType"] = 3,
					["Time"] = 1537884697,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can change the nameplate color\n    if (envTable.CanChangeNameplateColor) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n",
					["Name"] = "Unit - Important [Plater]",
					["PlaterCore"] = 1,
					["SpellIds"] = {
					},
					["Desc"] = "Highlight a nameplate of an important Add. Add the unit name or NpcID into the trigger box to add more.",
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
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.debuffIconGlow:Show()\n    \nend\n\n\n",
					["ScriptType"] = 1,
					["Time"] = 1538429739,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Name"] = "Aura - Debuff Alert [Plater]",
					["PlaterCore"] = 1,
					["SpellIds"] = {
					},
					["Desc"] = "Add the debuff name in the trigger box.",
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
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can flash the nameplate\n    if (envTable.FlashNameplate) then\n        envTable.smallFlash:Play()\n    end\n    \nend\n\n\n\n\n\n\n\n\n",
					["ScriptType"] = 3,
					["Time"] = 1543253273,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --adjust the nameplate color\n    Plater.SetNameplateColor (unitFrame, envTable.Color)\n    \n    --check if can replace the health amount with the unit name\n    if (envTable.ReplaceHealthWithName) then\n        \n        local healthPercent = format (\"%.1f\", unitFrame.healthBar.CurrentHealth / unitFrame.healthBar.CurrentHealthMax *100)\n        \n        unitFrame.healthBar.lifePercent:SetText (unitFrame.namePlateUnitName .. \"  (\" .. healthPercent  .. \"%)\")\n        \n    end\n    \nend\n\n\n",
					["Name"] = "Color Change [Plater]",
					["PlaterCore"] = 1,
					["SpellIds"] = {
					},
					["Desc"] = "Add a unitID or unit name in 'Add Trigger' entry. See the constructor script for options.",
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
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.blinkTexture:SetSize (self:GetSize())\n    \nend\n\n\n",
					["ScriptType"] = 1,
					["Time"] = 1547991413,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    local timeLeft = envTable._RemainingTime\n    \n    --check if the spellID isn't being ignored\n    if (envTable.IgnoredSpellID [envTable._SpellID]) then\n        return\n    end\n    \n    --check the time left and start or stop the blink animation and also check if the time left is > zero\n    if ((envTable.BlinkEnabled or envTable.GlowEnabled) and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftToBlink) then\n            --blink effect\n            if (envTable.BlinkEnabled) then\n                if (not envTable.blinkAnimation:IsPlaying()) then\n                    envTable.blinkAnimation:Play()\n                end\n            end\n            --glow effect\n            if (envTable.GlowEnabled) then\n                envTable.glowEffect:Show()\n            end\n            --nameplate color\n            if (envTable.ChangeNameplateColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n            end\n        else\n            --blink effect\n            if (envTable.blinkAnimation:IsPlaying()) then\n                envTable.blinkAnimation:Stop()\n            end\n            --glow effect\n            if (envTable.GlowEnabled and envTable.glowEffect:IsShown()) then\n                envTable.glowEffect:Hide()\n            end\n        end\n    end\n    \n    --timer color\n    if (envTable.TimerColorEnabled and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftCritical) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Critical)\n        elseif (timeLeft < envTable.TimeLeftWarning) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Warning)        \n        else\n            Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\n        end\n    end\n    \nend",
					["Name"] = "Aura - Blink by Time Left [Plater]",
					["PlaterCore"] = 1,
					["SpellIds"] = {
					},
					["Desc"] = "Blink, change the number and nameplate color. Add the debuffs int he trigger box. Set settings on constructor script.",
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
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the aura name in lower case\n    local auraLowerName = string.lower (envTable._SpellName)\n    \n    --attempt to get a custom color added by the user in the constructor script\n    local hasCustomBorderColor = envTable.BorderColorByAura [auraLowerName] or envTable.BorderColorByAura [envTable._SpellName] or envTable.BorderColorByAura [envTable._SpellID]\n    \n    --save the custom color\n    envTable.CustomBorderColor = hasCustomBorderColor\n    \nend\n\n\n",
					["ScriptType"] = 1,
					["Time"] = 1543680853,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the custom color added by the user or the default color\n    local color = envTable.CustomBorderColor or envTable.DefaultBorderColor\n    --parse the color since it can be a color name, hex or color table\n    local r, g, b = DetailsFramework:ParseColors (color)\n    \n    --set the border color\n    self:SetBackdropBorderColor (r, g, b, envTable.BorderAlpha)\n    \nend\n\n\n\n\n",
					["Name"] = "Aura - Border Color [Plater]",
					["PlaterCore"] = 1,
					["SpellIds"] = {
					},
					["Desc"] = "Add a border to an aura icon. Add the aura into the Add Trigger entry. You can customize the icon color at the constructor script.",
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
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Show()\nend\n\n\n",
					["ScriptType"] = 3,
					["Time"] = 1539015649,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount.text = \"\" .. UnitPower (unitId);\nend\n\n\n",
					["Name"] = "UnitPower [Plater]",
					["PlaterCore"] = 1,
					["SpellIds"] = {
					},
					["Desc"] = "Show the energy amount above the nameplate",
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
					["Icon"] = 841383,
					["ConstructorCode"] = "--todo: add npc ids for multilanguage support\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.TextAboveNameplate = \"** On You **\"\n    envTable.NameplateColor = \"green\"\n    \n    --label to show the text above the nameplate\n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.healthBar, \"top\", 0, 30);\n    \n    --the spell casted by the npc in the trigger list needs to be in the list below as well\n    local spellList = {\n        [268074] = \"Dark Purpose\", --G'huun Mythic Add\n        [260954] = \"Iron Gaze\", --Sergeant Bainbridge - Siege of Boralus\n        [257739] = \"Blind Rage\", --Blacktooth Scrapper - Freehold\n        [257314] = \"Black Powder Bomb\", --Irontide Grenadier - Freehold\n        [266107] = \"Thirst For Blood\", --Feral Bloodswarmer - The Underrot\n        [257582] = \"Raging Gaze\", --Earthrager - The MOTHERLODE!!\n        [262377] = \"Seek and Destroy\", --Crawler Mine - The MOTHERLODE!!\n        [257407] = \"Pursuit\", --Rezan - Atal'Dazar\n        --[] = \"\" --       \n        \n    }\n    \n    --build the list with localized spell names\n    envTable.FixateDebuffs = {}\n    for spellID, enUSSpellName in pairs (spellList) do\n        local localizedSpellName = GetSpellInfo (spellID)\n        envTable.FixateDebuffs [localizedSpellName or enUSSpellName] = true\n    end\n    \n    --debug - smuggled crawg\n    envTable.FixateDebuffs [\"Jagged Maw\"] = true\n    \nend\n\n--[=[\nNpcIDs:\n136461: Spawn of G'huun (mythic uldir G'huun)\n\n--]=]\n\n\n\n\n",
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
						["race"] = {
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
						["role"] = {
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
						["race"] = {
						},
						["pvptalent"] = {
						},
						["role"] = {
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
						["role"] = {
						},
						["pvptalent"] = {
						},
						["race"] = {
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
						["role"] = {
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
						["race"] = {
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
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_reorder",
					["Name"] = "Aura Reorder [Plater]",
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
				["Aura Border Color"] = 1,
				["Cast - Very Important"] = 2,
				["Explosion Affix M+"] = 3,
				["Aura - Debuff Alert"] = 3,
				["Unit Power"] = 1,
				["Cast - Frontal Cone"] = 2,
				["Fixate"] = 3,
				["Aura - Blink Time Left"] = 1,
				["Color Change"] = 1,
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
				[68140] = {
					"Hungering Soul Fragment", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[68129] = {
					"Ashtongue Shaman", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[76132] = {
					"Soaring Chakram Master", -- [1]
					"Skyreach", -- [2]
				},
				[36597] = {
					"The Lich King", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[37098] = {
					"Val'kyr Herald", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[133870] = {
					"Diseased Lasher", -- [1]
					"The Underrot", -- [2]
				},
				[37533] = {
					"Rimefang", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[133663] = {
					"Fanatical Headhunter", -- [1]
					"The Underrot", -- [2]
				},
				[131436] = {
					"Chosen Blood Matron", -- [1]
					"The Underrot", -- [2]
				},
				[37868] = {
					"Risen Archmage", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[150154] = {
					"Saurolisk Bonenipper", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[152833] = {
					"Azerite Giant", -- [1]
					"The Maelstrom - Heart of Azeroth", -- [2]
				},
				[127497] = {
					"Ashvane Warden", -- [1]
					"Tol Dagor", -- [2]
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
				[155090] = {
					"Anodized Coilbearer", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[37531] = {
					"Frostwarden Handler", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[37666] = {
					"Darkfallen Tactician", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[91522] = {
					"Protector Bajunt", -- [1]
					"Hellfire Citadel", -- [2]
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
				[37023] = {
					"Plague Scientist", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[37813] = {
					"Deathbringer Saurfang", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[37955] = {
					"Blood-Queen Lana'thel", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[88288] = {
					"Dungeoneer's Training Dummy", -- [1]
					"FW Horde Garrison Level 3", -- [2]
				},
				[151659] = {
					"Rocket Tonk", -- [1]
					"Operation: Mechagon", -- [2]
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
				[37027] = {
					"Skybreaker Hierophant", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[91103] = {
					"Felfire Demolisher", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[37025] = {
					"Stinky", -- [1]
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
				[136665] = {
					"Ashvane Spotter", -- [1]
					"Tol Dagor", -- [2]
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
				[34793] = {
					"Catapult", -- [1]
					"Isle of Conquest", -- [2]
				},
				[162764] = {
					"Twisted Appendage", -- [1]
					"Waycrest Manor", -- [2]
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
				[154727] = {
					"Sun Prophet Tenhamen", -- [1]
					"Halls of Origination", -- [2]
				},
				[37017] = {
					"Skybreaker Assassin", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[158092] = {
					"Fallen Heartpiercer", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[150160] = {
					"Scrapbone Bully", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[151859] = {
					"Tomb Scarab", -- [1]
					"Halls of Origination", -- [2]
				},
				[79462] = {
					"Blinding Solar Flare", -- [1]
					"Skyreach", -- [2]
				},
				[47086] = {
					"Crimsonborne Firestarter", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[74927] = {
					"Unstable Slag", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[137591] = {
					"Healing Tide Totem", -- [1]
					"Kings' Rest", -- [2]
				},
				[163978] = {
					"Darkwhisper Cultist", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[68204] = {
					"Unbound Rogue", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[133593] = {
					"Expert Technician", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[134041] = {
					"Infected Peasant", -- [1]
					"Waycrest Manor", -- [2]
				},
				[82533] = {
					"Smash", -- [1]
					"Highmaul", -- [2]
				},
				[151658] = {
					"Strider Tonk", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[52498] = {
					"Beth'tilac", -- [1]
					"Firelands", -- [2]
				},
				[140787] = {
					"Ember Elemental", -- [1]
					"Isle of Conquest", -- [2]
				},
				[90269] = {
					"Tyrant Velhari", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[155953] = {
					"C'Thuffer", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[91648] = {
					"Somber Guardian", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[95614] = {
					"Binder Eloah", -- [1]
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
				[68205] = {
					"Unbound Succubus", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[82534] = {
					"Spike", -- [1]
					"Highmaul", -- [2]
				},
				[53134] = {
					"Ancient Core Hound", -- [1]
					"Firelands", -- [2]
				},
				[69792] = {
					"Xuenray", -- [1]
					"Isle of Conquest", -- [2]
				},
				[58959] = {
					"Piptoc", -- [1]
					"Isle of Conquest", -- [2]
				},
				[61657] = {
					"Adolescent Flame Hound", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[137626] = {
					"Demolishing Terror", -- [1]
					"Siege of Boralus", -- [2]
				},
				[79208] = {
					"Blackrock Enforcer", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[69078] = {
					"Sul the Sandcrawler", -- [1]
					"Throne of Thunder", -- [2]
				},
				[129517] = {
					"Reanimated Raptor", -- [1]
					"Atal'Dazar", -- [2]
				},
				[87780] = {
					"Slagshop Brute", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[81767] = {
					"Bloodmaul Flamespeaker", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[68206] = {
					"Unbound Shivarra", -- [1]
					"Pursuing the Black Harvest", -- [2]
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
				[156818] = {
					"Wrathion", -- [1]
					"Ny'alotha, the Waking City", -- [2]
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
				[161895] = {
					"Thing From Beyond", -- [1]
					"Tol Dagor", -- [2]
				},
				[155656] = {
					"Misha", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[36678] = {
					"Professor Putricide", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[106321] = {
					"Tailwind Totem", -- [1]
					"Isle of Conquest", -- [2]
				},
				[130896] = {
					"Blackout Barrel", -- [1]
					"Freehold", -- [2]
				},
				[75451] = {
					"Defiled Spirit", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[37126] = {
					"Sister Svalna", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[36998] = {
					"Skybreaker Protector", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[137940] = {
					"Safety Shark", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[76267] = {
					"Solar Zealot", -- [1]
					"Skyreach", -- [2]
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
				[88589] = {
					"Boar", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[150168] = {
					"Toxic Monstrosity", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[130028] = {
					"Ashvane Priest", -- [1]
					"Tol Dagor", -- [2]
				},
				[79466] = {
					"Initiate of the Rising Sun", -- [1]
					"Skyreach", -- [2]
				},
				[130436] = {
					"Off-Duty Laborer", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[87910] = {
					"Gorian Rune-Mender", -- [1]
					"Highmaul", -- [2]
				},
				[135474] = {
					"Thistle Acolyte", -- [1]
					"Waycrest Manor", -- [2]
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
				[53793] = {
					"Harbinger of Flame", -- [1]
					"Firelands", -- [2]
				},
				[74349] = {
					"Bloodmaul Magma Binder", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[94947] = {
					"Fel-Starved Trainee", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[70153] = {
					"Fungal Growth", -- [1]
					"Throne of Thunder", -- [2]
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
				[48049] = {
					"Twilight Whelp", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[141284] = {
					"Kul Tiran Wavetender", -- [1]
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
				[135761] = {
					"Thundering Totem", -- [1]
					"Kings' Rest", -- [2]
				},
				[151657] = {
					"Bomb Tonk", -- [1]
					"Operation: Mechagon", -- [2]
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
				[46083] = {
					"Drakeadon Mongrel", -- [1]
					"Blackwing Descent", -- [2]
				},
				[54015] = {
					"Majordomo Staghelm", -- [1]
					"Firelands", -- [2]
				},
				[153755] = {
					"Naeno Megacrash", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[54143] = {
					"Molten Flamefather", -- [1]
					"Firelands", -- [2]
				},
				[157337] = {
					"Spawn of Shad'har", -- [1]
					"Blackwing Descent Scenario", -- [2]
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
				[45267] = {
					"Twilight Phase-Twister", -- [1]
					"The Bastion of Twilight", -- [2]
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
				[151798] = {
					"Vexiona", -- [1]
					"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
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
				[81806] = {
					"Gorian Royal Guardsman", -- [1]
					"Highmaul", -- [2]
				},
				[135240] = {
					"Soul Essence", -- [1]
					"Waycrest Manor", -- [2]
				},
				[86611] = {
					"Mind Fungus", -- [1]
					"Highmaul", -- [2]
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
				[127480] = {
					"Stinging Parasite", -- [1]
					"Tol Dagor", -- [2]
				},
				[135231] = {
					"Spectral Brute", -- [1]
					"Kings' Rest", -- [2]
				},
				[36627] = {
					"Rotface", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[122969] = {
					"Zanchuli Witch-Doctor", -- [1]
					"Atal'Dazar", -- [2]
				},
				[80822] = {
					"Night-Twisted Berserker", -- [1]
					"Highmaul", -- [2]
				},
				[129366] = {
					"Bilge Rat Buccaneer", -- [1]
					"Siege of Boralus", -- [2]
				},
				[44687] = {
					"Proto-Behemoth", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[49826] = {
					"Bound Rumbler", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[94563] = {
					"Gorebound Fanatic", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[94604] = {
					"Gorebound Corruptor", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[153760] = {
					"Enthralled Footman", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[91241] = {
					"Doom Lord", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[95640] = {
					"Sargerei Soul Cleaver", -- [1]
					"Hellfire Citadel", -- [2]
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
				[154347] = {
					"Void-Twisted Corruptor", -- [1]
					"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
				},
				[122970] = {
					"Shadowblade Stalker", -- [1]
					"Atal'Dazar", -- [2]
				},
				[92330] = {
					"Soul of Socrethar", -- [1]
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
				[37970] = {
					"Prince Valanar", -- [1]
					"Icecrown Citadel", -- [2]
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
				[53087] = {
					"Right Foot", -- [1]
					"Firelands", -- [2]
				},
				[131849] = {
					"Crazed Marksman", -- [1]
					"Waycrest Manor", -- [2]
				},
				[70236] = {
					"Zandalari Storm-Caller", -- [1]
					"Throne of Thunder", -- [2]
				},
				[144295] = {
					"Mechagon Mechanic", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[135254] = {
					"Irontide Raider", -- [1]
					"Tol Dagor", -- [2]
				},
				[75506] = {
					"Shadowmoon Loyalist", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[111858] = {
					"Guardian Rurson", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[94185] = {
					"Vanguard Akkelion", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[122971] = {
					"Dazar'ai Juggernaut", -- [1]
					"Atal'Dazar", -- [2]
				},
				[144296] = {
					"Spider Tank", -- [1]
					"Operation: Mechagon", -- [2]
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
				[93233] = {
					"Lord Aram'el", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[93162] = {
					"Umbral Supplicant", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[154744] = {
					"Toxic Monstrosity", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[155094] = {
					"Mechagon Trooper", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[78932] = {
					"Driving Gale-Caller", -- [1]
					"Skyreach", -- [2]
				},
				[129547] = {
					"Blacktooth Knuckleduster", -- [1]
					"Freehold", -- [2]
				},
				[135258] = {
					"Irontide Marauder", -- [1]
					"Siege of Boralus", -- [2]
				},
				[43127] = {
					"Spirit of Ironstar", -- [1]
					"Blackwing Descent", -- [2]
				},
				[48436] = {
					"Twilight Drake", -- [1]
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
				[129369] = {
					"Irontide Raider", -- [1]
					"Siege of Boralus", -- [2]
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
				[53115] = {
					"Molten Lord", -- [1]
					"Firelands", -- [2]
				},
				[135470] = {
					"Aka'ali the Conqueror", -- [1]
					"Kings' Rest", -- [2]
				},
				[157604] = {
					"Crawling Corruption", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[163746] = {
					"Walkie Shockie X1", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[36626] = {
					"Festergut", -- [1]
					"Icecrown Citadel", -- [2]
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
				[157605] = {
					"Burrowing Appendage", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[76814] = {
					"Flamebender Ka'graz", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[144300] = {
					"Mechagon Citizen", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[129370] = {
					"Irontide Waveshaper", -- [1]
					"Siege of Boralus", -- [2]
				},
				[38154] = {
					"Warhawk", -- [1]
					"Icecrown Citadel", -- [2]
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
				[42649] = {
					"Drakonid Chainwielder", -- [1]
					"Blackwing Descent", -- [2]
				},
				[130024] = {
					"Soggy Shiprat", -- [1]
					"Freehold", -- [2]
				},
				[77428] = {
					"Imperator Mar'gok", -- [1]
					"Highmaul", -- [2]
				},
				[75509] = {
					"Sadana Bloodfury", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[144301] = {
					"Living Waste", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[81522] = {
					"Witherbark", -- [1]
					"The Everbloom", -- [2]
				},
				[83697] = {
					"Grom'kar Deckhand", -- [1]
					"Iron Docks", -- [2]
				},
				[53187] = {
					"Flamewaker Animator", -- [1]
					"Firelands", -- [2]
				},
				[157607] = {
					"Faceless Shadowcaller", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[37003] = {
					"Skybreaker Vindicator", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[86256] = {
					"Gorian High Sorcerer", -- [1]
					"Highmaul", -- [2]
				},
				[129371] = {
					"Riptide Shredder", -- [1]
					"Siege of Boralus", -- [2]
				},
				[127757] = {
					"Reanimated Honor Guard", -- [1]
					"Atal'Dazar", -- [2]
				},
				[135699] = {
					"Ashvane Jailer", -- [1]
					"Tol Dagor", -- [2]
				},
				[53635] = {
					"Cinderweb Drone", -- [1]
					"Firelands", -- [2]
				},
				[135048] = {
					"Gorestained Piglet", -- [1]
					"Waycrest Manor", -- [2]
				},
				[130011] = {
					"Irontide Buccaneer", -- [1]
					"Freehold", -- [2]
				},
				[130521] = {
					"Freehold Deckhand", -- [1]
					"Freehold", -- [2]
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
				[92142] = {
					"Blademaster Jubei'thos", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[77557] = {
					"Admiral Gar'an", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[81779] = {
					"Ogron Mauler", -- [1]
					"Highmaul", -- [2]
				},
				[157609] = {
					"K'thir Mindcarver", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[45687] = {
					"Twilight-Shifter", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[89011] = {
					"Rylak Skyterror", -- [1]
					"Iron Docks", -- [2]
				},
				[92526] = {
					"Zerik'shekor", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[157610] = {
					"K'thir Dominator", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[144071] = {
					"Irontide Waveshaper", -- [1]
					"Siege of Boralus", -- [2]
				},
				[111333] = {
					"Taintheart Trickster", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[111856] = {
					"Guardian Gorroc", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[130012] = {
					"Irontide Ravager", -- [1]
					"Freehold", -- [2]
				},
				[79093] = {
					"Skyreach Sun Talon", -- [1]
					"Skyreach", -- [2]
				},
				[61056] = {
					"Primal Earth Elemental", -- [1]
					"Isle of Conquest", -- [2]
				},
				[150190] = {
					"HK-8 Aerial Oppression Unit", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[130522] = {
					"Freehold Shipmate", -- [1]
					"Freehold", -- [2]
				},
				[86275] = {
					"Gorian Enforcer", -- [1]
					"Highmaul", -- [2]
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
				[138247] = {
					"Irontide Marauder", -- [1]
					"Siege of Boralus", -- [2]
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
				[45261] = {
					"Twilight Shadow Knight", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[93295] = {
					"Darkcaster Adept", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[137233] = {
					"Plague Toad", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[81269] = {
					"Warden Thul'tok", -- [1]
					"Highmaul", -- [2]
				},
				[127482] = {
					"Sewer Vicejaw", -- [1]
					"Tol Dagor", -- [2]
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
				[137969] = {
					"Interment Construct", -- [1]
					"Kings' Rest", -- [2]
				},
				[81279] = {
					"Grom'kar Flameslinger", -- [1]
					"Iron Docks", -- [2]
				},
				[76145] = {
					"Grand Defense Construct", -- [1]
					"Skyreach", -- [2]
				},
				[158437] = {
					"Fallen Taskmaster", -- [1]
					"Horrific Vision of Stormwind", -- [2]
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
				[127315] = {
					"Reanimation Totem", -- [1]
					"Atal'Dazar", -- [2]
				},
				[81297] = {
					"Dreadfang", -- [1]
					"Iron Docks", -- [2]
				},
				[136330] = {
					"Soul Thorns", -- [1]
					"Waycrest Manor", -- [2]
				},
				[81270] = {
					"Gorian Guardsman", -- [1]
					"Highmaul", -- [2]
				},
				[118244] = {
					"Spirit Beast", -- [1]
					"Isle of Conquest", -- [2]
				},
				[80400] = {
					"Iron Assembly Warden", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[85748] = {
					"Iron Mauler", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[134157] = {
					"Shadow-Borne Warrior", -- [1]
					"Kings' Rest", -- [2]
				},
				[76310] = {
					"Grand Defense Construct", -- [1]
					"Skyreach", -- [2]
				},
				[141495] = {
					"Kul Tiran Footman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[153401] = {
					"K'thir Dominator", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
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
				[95613] = {
					"Binder Hallaani", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[152835] = {
					"Crystalized Azerite", -- [1]
					"The Maelstrom - Heart of Azeroth", -- [2]
				},
				[135975] = {
					"Off-Duty Laborer", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[76094] = {
					"Sun Trinket", -- [1]
					"Skyreach", -- [2]
				},
				[75715] = {
					"Reanimated Ritual Bones", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[127486] = {
					"Ashvane Officer", -- [1]
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
				[130661] = {
					"Venture Co. Earthshaper", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[151476] = {
					"Blastatron X-80", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[82039] = {
					"Rockspine Stinger", -- [1]
					"The Everbloom", -- [2]
				},
				[80708] = {
					"Iron Taskmaster", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[76154] = {
					"Skyreach Raven Whisperer", -- [1]
					"Skyreach", -- [2]
				},
				[131847] = {
					"Waycrest Reveler", -- [1]
					"Waycrest Manor", -- [2]
				},
				[135971] = {
					"Faithless Conscript", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[88820] = {
					"Furnace Engineer", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[133389] = {
					"Galvazzt", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[81985] = {
					"Everbloom Tender", -- [1]
					"The Everbloom", -- [2]
				},
				[93298] = {
					"Shadowheart Fiend", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[81272] = {
					"Gorian Runemaster", -- [1]
					"Highmaul", -- [2]
				},
				[130400] = {
					"Irontide Crusher", -- [1]
					"Freehold", -- [2]
				},
				[53640] = {
					"Flamewaker Sentinel", -- [1]
					"Firelands", -- [2]
				},
				[53141] = {
					"Molten Surger", -- [1]
					"Firelands", -- [2]
				},
				[113113] = {
					"Essence of Nightmare", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[41376] = {
					"Nefarian", -- [1]
					"Blackwing Descent", -- [2]
				},
				[137405] = {
					"Gripping Terror", -- [1]
					"Siege of Boralus", -- [2]
				},
				[75899] = {
					"Possessed Soul", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[151742] = {
					"Void-Twisted Invader", -- [1]
					"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
				},
				[92146] = {
					"Gurtogg Bloodboil", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[37134] = {
					"Ymirjar Huntress", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[75209] = {
					"Molten Earth Elemental", -- [1]
					"Bloodmaul Slag Mines", -- [2]
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
				[150547] = {
					"Scrapbone Grunter", -- [1]
					"Operation: Mechagon", -- [2]
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
				[69455] = {
					"Zandalari Water-Binder", -- [1]
					"Throne of Thunder", -- [2]
				},
				[130404] = {
					"Vermin Trapper", -- [1]
					"Freehold", -- [2]
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
				[153532] = {
					"Aqir Mindhunter", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[83623] = {
					"Bloodmaul Warder", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[76104] = {
					"Monstrous Corpse Spider", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[84984] = {
					"Spore Image", -- [1]
					"The Everbloom", -- [2]
				},
				[42764] = {
					"Pyrecraw", -- [1]
					"Blackwing Descent", -- [2]
				},
				[68098] = {
					"Ashtongue Worker", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[95603] = {
					"Mystic Aaran", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[154552] = {
					"Amathet Zealot", -- [1]
					"Halls of Origination", -- [2]
				},
				[129550] = {
					"Bilge Rat Padfoot", -- [1]
					"Freehold", -- [2]
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
				[139422] = {
					"Scaled Krolusk Tamer", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[37007] = {
					"Deathbound Ward", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[53575] = {
					"Lava Wielder", -- [1]
					"Firelands", -- [2]
				},
				[82682] = {
					"Archmage Sol", -- [1]
					"The Everbloom", -- [2]
				},
				[74366] = {
					"Forgemaster Gog'duh", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[53639] = {
					"Flamewaker Cauterizer", -- [1]
					"Firelands", -- [2]
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
				[160183] = {
					"Void Fanatic", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[83578] = {
					"Ogron Laborer", -- [1]
					"Iron Docks", -- [2]
				},
				[154554] = {
					"Amathet Guardian", -- [1]
					"Halls of Origination", -- [2]
				},
				[93813] = {
					"Contracted Engineer", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[136643] = {
					"Azerite Extractor", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[156089] = {
					"Aqir Venomweaver", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[153531] = {
					"Aqir Bonecrusher", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[85241] = {
					"Night-Twisted Brute", -- [1]
					"Highmaul", -- [2]
				},
				[78077] = {
					"Volatile Anomaly", -- [1]
					"Highmaul", -- [2]
				},
				[41378] = {
					"Maloriak", -- [1]
					"Blackwing Descent", -- [2]
				},
				[154555] = {
					"Amathet Artificer", -- [1]
					"Halls of Origination", -- [2]
				},
				[86072] = {
					"Oro", -- [1]
					"Highmaul", -- [2]
				},
				[129373] = {
					"Dockhound Packmaster", -- [1]
					"Siege of Boralus", -- [2]
				},
				[75975] = {
					"Skyreach Overlord", -- [1]
					"Skyreach", -- [2]
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
				[77182] = {
					"Oregorger", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[76778] = {
					"Life-Pact Familiar", -- [1]
					"Skyreach", -- [2]
				},
				[135846] = {
					"Sand-Crusted Striker", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[53128] = {
					"Giant Fire Scorpion", -- [1]
					"Firelands", -- [2]
				},
				[153526] = {
					"Aqir Swarmer", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[36880] = {
					"Decaying Colossus", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[135366] = {
					"Blacktooth Arsonist", -- [1]
					"Tol Dagor", -- [2]
				},
				[135192] = {
					"Honored Raptor", -- [1]
					"Kings' Rest", -- [2]
				},
				[131670] = {
					"Heartsbane Vinetwister", -- [1]
					"Waycrest Manor", -- [2]
				},
				[53619] = {
					"Druid of the Flame", -- [1]
					"Firelands", -- [2]
				},
				[150169] = {
					"Toxic Lurker", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[134599] = {
					"Imbued Stormcaller", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[84859] = {
					"Iron Cleaver", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[150165] = {
					"Slime Elemental", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[93303] = {
					"Slavering Hound", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[75272] = {
					"Bloodmaul Ogre Mage", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[131785] = {
					"Buzzing Drone", -- [1]
					"Tol Dagor", -- [2]
				},
				[94832] = {
					"Gorebound Assassin", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[136391] = {
					"Heart Guardian", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[134600] = {
					"Sandswept Marksman", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[127381] = {
					"Silt Crab", -- [1]
					"Tol Dagor", -- [2]
				},
				[127503] = {
					"Overseer Korgus", -- [1]
					"Tol Dagor", -- [2]
				},
				[43122] = {
					"Spirit of Corehammer", -- [1]
					"Blackwing Descent", -- [2]
				},
				[132532] = {
					"Kul Tiran Marksman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[76146] = {
					"Grand Defense Construct", -- [1]
					"Skyreach", -- [2]
				},
				[95408] = {
					"Anetheron", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[144160] = {
					"Chopper Redhook", -- [1]
					"Siege of Boralus", -- [2]
				},
				[53224] = {
					"Flamewaker Taskmaster", -- [1]
					"Firelands", -- [2]
				},
				[84860] = {
					"Iron Earthbinder", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[129231] = {
					"Rixxa Fluxflame", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[87411] = {
					"Workshop Guardian", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[54920] = {
					"Infinite Suppressor", -- [1]
					"End Time", -- [2]
				},
				[76309] = {
					"Grand Defense Construct", -- [1]
					"Skyreach", -- [2]
				},
				[78583] = {
					"Dominator Turret", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[86185] = {
					"Night-Twisted Supplicant", -- [1]
					"Highmaul", -- [2]
				},
				[134602] = {
					"Shrouded Fang", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[87619] = {
					"Gorian Warden", -- [1]
					"Highmaul", -- [2]
				},
				[93615] = {
					"Felborne Overfiend", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[130909] = {
					"Fetid Maggot", -- [1]
					"The Underrot", -- [2]
				},
				[76865] = {
					"Beastlord Darmac", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[133835] = {
					"Feral Bloodswarmer", -- [1]
					"The Underrot", -- [2]
				},
				[152987] = {
					"Faceless Willbreaker", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[70276] = {
					"No'ku Stormsayer", -- [1]
					"Throne of Thunder", -- [2]
				},
				[81780] = {
					"Guard Captain Thag", -- [1]
					"Highmaul", -- [2]
				},
				[94816] = {
					"Togdrov", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[84989] = {
					"Infested Icecaller", -- [1]
					"The Everbloom", -- [2]
				},
				[87448] = {
					"Ironworker", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[162238] = {
					"Darkwhisper Cultist", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[133836] = {
					"Reanimated Guardian", -- [1]
					"The Underrot", -- [2]
				},
				[136139] = {
					"Mechanized Peacekeeper", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[84978] = {
					"Bloodmaul Enforcer", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[129372] = {
					"Blacktar Bomber", -- [1]
					"Siege of Boralus", -- [2]
				},
				[129552] = {
					"Monzumi", -- [1]
					"Atal'Dazar", -- [2]
				},
				[26125] = {
					"Battaker", -- [1]
					"Isle of Conquest", -- [2]
				},
				[53222] = {
					"Flamewaker Centurion", -- [1]
					"Firelands", -- [2]
				},
				[157608] = {
					"Faceless Willbreaker", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[76884] = {
					"Cruelfang", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[138187] = {
					"Grotesque Horror", -- [1]
					"The Underrot", -- [2]
				},
				[129640] = {
					"Snarling Dockhound", -- [1]
					"Siege of Boralus", -- [2]
				},
				[36811] = {
					"Deathspeaker Attendant", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[159425] = {
					"Occult Shadowmender", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[84990] = {
					"Addled Arcanomancer", -- [1]
					"The Everbloom", -- [2]
				},
				[85225] = {
					"Gorian Sorcerer", -- [1]
					"Highmaul", -- [2]
				},
				[158146] = {
					"Fallen Riftwalker", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[151579] = {
					"Shield Generator", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[42767] = {
					"Ivoroc", -- [1]
					"Blackwing Descent", -- [2]
				},
				[144299] = {
					"Workshop Defender", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[112153] = {
					"Dire Shaman", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[158056] = {
					"Rat", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[43324] = {
					"Cho'gall", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[44600] = {
					"Halfus Wyrmbreaker", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[156577] = {
					"Therum Deepforge", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[128652] = {
					"Viq'Goth", -- [1]
					"Siege of Boralus", -- [2]
				},
				[86526] = {
					"Grom'kar Chainmaster", -- [1]
					"Iron Docks", -- [2]
				},
				[69916] = {
					"Gurubashi Berserker", -- [1]
					"Throne of Thunder", -- [2]
				},
				[53642] = {
					"Cinderweb Spinner", -- [1]
					"Firelands", -- [2]
				},
				[87989] = {
					"Forgemistress Flamehand", -- [1]
					"Blackrock Foundry", -- [2]
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
				[47161] = {
					"Twilight Brute", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[81305] = {
					"Fleshrender Nok'gar", -- [1]
					"Iron Docks", -- [2]
				},
				[127479] = {
					"The Sand Queen", -- [1]
					"Tol Dagor", -- [2]
				},
				[158452] = {
					"Mindtwist Tendril", -- [1]
					"Horrific Vision of Stormwind", -- [2]
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
				[135759] = {
					"Earthwall Totem", -- [1]
					"Kings' Rest", -- [2]
				},
				[139790] = {
					"Stag", -- [1]
					"Isle of Conquest", -- [2]
				},
				[76292] = {
					"Skyreach Shield Construct", -- [1]
					"Skyreach", -- [2]
				},
				[137989] = {
					"Embalming Fluid", -- [1]
					"Kings' Rest", -- [2]
				},
				[86684] = {
					"Feral Lasher", -- [1]
					"The Everbloom", -- [2]
				},
				[94733] = {
					"Felfire Demolisher", -- [1]
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
				[152009] = {
					"Malfunctioning Scrapbot", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[43735] = {
					"Elementium Monstrosity", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[42768] = {
					"Maimgor", -- [1]
					"Blackwing Descent", -- [2]
				},
				[119990] = {
					"Wolf", -- [1]
					"Isle of Conquest", -- [2]
				},
				[76444] = {
					"Subjugated Soul", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
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
				[144286] = {
					"Asset Manager", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[138369] = {
					"Footbomb Hooligan", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[90409] = {
					"Gorebound Felcaster", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[61658] = {
					"Mature Flame Hound", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[130027] = {
					"Ashvane Marine", -- [1]
					"Tol Dagor", -- [2]
				},
				[151755] = {
					"Shadehound", -- [1]
					"Emerald Dream - HoA Scenario", -- [2]
				},
				[137029] = {
					"Ordnance Specialist", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[81283] = {
					"Grom'kar Footsoldier", -- [1]
					"Iron Docks", -- [2]
				},
				[91646] = {
					"Grim Collaborator", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[95813] = {
					"Weaponlord Mehlkhior", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[158588] = {
					"Gamon", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[111004] = {
					"Gelatinized Decay", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[76376] = {
					"Skyreach Arcanologist", -- [1]
					"Skyreach", -- [2]
				},
				[140447] = {
					"Demolishing Terror", -- [1]
					"Siege of Boralus", -- [2]
				},
				[151639] = {
					"Crazed Gyreworm", -- [1]
					"Neltharion's Lair - HoA Scenario", -- [2]
				},
				[75193] = {
					"Bloodmaul Overseer", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[24207] = {
					"Army of the Dead", -- [1]
					"Isle of Conquest", -- [2]
				},
				[133379] = {
					"Adderis", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[90272] = {
					"Ancient Sovereign", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[157333] = {
					"Darkwhisper Cultist", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[76806] = {
					"Heart of the Mountain", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[34802] = {
					"Glaive Thrower", -- [1]
					"Isle of Conquest", -- [2]
				},
				[54923] = {
					"Infinite Warden", -- [1]
					"End Time", -- [2]
				},
				[150222] = {
					"Gunker", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[76306] = {
					"Grand Defense Construct", -- [1]
					"Skyreach", -- [2]
				},
				[6498] = {
					"Devilsaur", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[10741] = {
					"Cat", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[105427] = {
					"Skyfury Totem", -- [1]
					"Isle of Conquest", -- [2]
				},
				[1860] = {
					"Jhazdok", -- [1]
					"Isle of Conquest", -- [2]
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
				[132056] = {
					"Venture Co. Skyscorcher", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[84399] = {
					"Vicious Mandragora", -- [1]
					"The Everbloom", -- [2]
				},
				[152718] = {
					"Alleria Windrunner", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[34777] = {
					"Siege Turret", -- [1]
					"Isle of Conquest", -- [2]
				},
				[143985] = {
					"Absorb-o-Tron", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[81114] = {
					"Gronnling Laborer", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[131545] = {
					"Lady Waycrest", -- [1]
					"Waycrest Manor", -- [2]
				},
				[91520] = {
					"Adjunct Kuroh", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[69131] = {
					"Frost King Malakk", -- [1]
					"Throne of Thunder", -- [2]
				},
				[152722] = {
					"Fallen Voidspeaker", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[134616] = {
					"Krolusk Pup", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[41442] = {
					"Atramedes", -- [1]
					"Blackwing Descent", -- [2]
				},
				[37021] = {
					"Skybreaker Vicar", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[37972] = {
					"Prince Keleseth", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[69899] = {
					"Farraki Sand Conjurer", -- [1]
					"Throne of Thunder", -- [2]
				},
				[90284] = {
					"Iron Reaver", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[37038] = {
					"Vengeful Fleshreaper", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[128455] = {
					"T'lonja", -- [1]
					"Atal'Dazar", -- [2]
				},
				[134617] = {
					"Krolusk Hatchling", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[5053] = {
					"Deviate Crocolisk", -- [1]
					"Wailing Caverns", -- [2]
				},
				[3671] = {
					"Lady Anacondra", -- [1]
					"Wailing Caverns", -- [2]
				},
				[37016] = {
					"Skybreaker Luminary", -- [1]
					"Icecrown Citadel", -- [2]
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
				[34778] = {
					"Flame Turret", -- [1]
					"Isle of Conquest", -- [2]
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
				[37782] = {
					"Flesh-eating Insect", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[83390] = {
					"Thunderlord Wrangler", -- [1]
					"Iron Docks", -- [2]
				},
				[45265] = {
					"Twilight Soul Blade", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[61705] = {
					"Corrupted Flamecaller", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[127490] = {
					"Knight Captain Valyri", -- [1]
					"Tol Dagor", -- [2]
				},
				[69791] = {
					"Xuenray", -- [1]
					"Isle of Conquest", -- [2]
				},
				[152836] = {
					"Azerite Borer", -- [1]
					"The Maelstrom - Heart of Azeroth", -- [2]
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
				[133852] = {
					"Living Rot", -- [1]
					"The Underrot", -- [2]
				},
				[37228] = {
					"Frostwarden Warrior", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[134364] = {
					"Faithless Tender", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[157137] = {
					"Terror Tendril", -- [1]
					"Halls of Origination", -- [2]
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
				[157483] = {
					"Ysedra the Darkener", -- [1]
					"Halls of Origination", -- [2]
				},
				[161815] = {
					"K'thir Voidcaller", -- [1]
					"Chamber of Heart - Scenario", -- [2]
				},
				[131402] = {
					"Underrot Tick", -- [1]
					"The Underrot", -- [2]
				},
				[52558] = {
					"Lord Rhyolith", -- [1]
					"Firelands", -- [2]
				},
				[18131] = {
					"Nether Ray", -- [1]
					"Isle of Conquest", -- [2]
				},
				[133685] = {
					"Befouled Spirit", -- [1]
					"The Underrot", -- [2]
				},
				[76810] = {
					"Furnace Engineer", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[134284] = {
					"Fallen Deathspeaker", -- [1]
					"The Underrot", -- [2]
				},
				[131383] = {
					"Sporecaller Zancha", -- [1]
					"The Underrot", -- [2]
				},
				[138281] = {
					"Faceless Corruptor", -- [1]
					"The Underrot", -- [2]
				},
				[133007] = {
					"Unbound Abomination", -- [1]
					"The Underrot", -- [2]
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
				["nameplateSelectedScale"] = "1.5048192739487",
				["nameplatePersonalShowInCombat"] = "0",
				["nameplatePersonalShowWithTarget"] = "0",
				["nameplateGlobalScale"] = "1.0",
				["nameplatePersonalHideDelaySeconds"] = "0.2",
				["nameplateResourceOnTarget"] = "0",
				["nameplateMotion"] = "0",
				["nameplateMinScale"] = "1",
				["nameplateShowAll"] = "1",
				["nameplateMaxDistance"] = "100",
				["nameplateOtherTopInset"] = "0.085",
				["nameplateSelfScale"] = "1.0",
				["nameplateSelfBottomInset"] = "0.2",
				["nameplateOccludedAlphaMult"] = "1",
				["nameplateShowFriendlyGuardians"] = "0",
				["NamePlateHorizontalScale"] = "1",
				["nameplateSelfAlpha"] = "0.75",
				["nameplateShowFriendlyMinions"] = "0",
				["nameplateShowSelf"] = "1",
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
			["login_counter"] = 585,
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
				["Combo Points"] = 3,
				["Aura Reorder"] = 1,
				["Hide Neutral Units"] = 1,
				["Extra Border"] = 2,
				["Attacking Specific Unit"] = 1,
				["Target Color"] = 3,
				["Execute Range"] = 1,
				["Jaina Encounter"] = 6,
			},
			["not_affecting_combat_alpha"] = 0.5976737141609192,
			["captured_spells"] = {
				[164815] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Define-Mal'Ganis",
					["npcID"] = 0,
				},
				[306474] = {
					["source"] = "Sycõs-Shandris",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[8222] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Remixxed-Mal'Ganis",
					["npcID"] = 0,
				},
				[53390] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wurrzaag-Gilneas",
					["npcID"] = 0,
				},
				[134111] = {
					["source"] = "Ashtongue Primalist",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 68096,
				},
				[315176] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Aesse",
					["npcID"] = 0,
				},
				[258723] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193475] = {
					["source"] = "Malepandá",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[312107] = {
					["source"] = "Sebârt-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275773] = {
					["source"] = "Sathaendor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[313643] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Frogy-Agamaggan",
					["npcID"] = 0,
				},
				[315179] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Afterimage-Thrall",
					["npcID"] = 0,
				},
				[119415] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Aesse",
					["npcID"] = 0,
				},
				[281404] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Asylius",
					["npcID"] = 0,
				},
				[265540] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fetid Maggot",
					["npcID"] = 130909,
				},
				[6360] = {
					["source"] = "Sarora",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 1863,
				},
				[31661] = {
					["encounterID"] = 2086,
					["source"] = "Gwenevare-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[285500] = {
					["type"] = "BUFF",
					["source"] = "Zahmerdh",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[296759] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Talgrim-Trollbane",
					["npcID"] = 0,
				},
				[123254] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Roipriest-Quel'Thalas",
					["npcID"] = 0,
				},
				[403] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Karlurn-BleedingHollow",
					["npcID"] = 0,
				},
				[216251] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[275779] = {
					["source"] = "Ironmade-Thrall",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[280385] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Aesse",
					["npcID"] = 0,
				},
				[118521] = {
					["source"] = "Enraged Spearman",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 59165,
				},
				[118905] = {
					["source"] = "Capacitor Totem",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 61245,
				},
				[294717] = {
					["source"] = "Meaven-Zul'jin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[233397] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fuiken-Dalaran",
					["npcID"] = 0,
				},
				[268619] = {
					["source"] = "Sädä-Malfurion",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[162264] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Yungs-Zul'jin",
					["npcID"] = 0,
				},
				[221883] = {
					["source"] = "Táste",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[224186] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rãvensheart",
					["npcID"] = 0,
				},
				[259241] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 131265,
				},
				[273226] = {
					["npcID"] = 0,
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2112,
				},
				[259753] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[190411] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Doinkster-Mal'Ganis",
					["npcID"] = 0,
				},
				[228537] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Yungs-Zul'jin",
					["npcID"] = 0,
				},
				[301886] = {
					["source"] = "Sycõs-Shandris",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[45524] = {
					["encounterID"] = 1106,
					["source"] = "Ahriak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[421] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Karlurn-BleedingHollow",
					["npcID"] = 0,
				},
				[316216] = {
					["source"] = "Deephive Voidsinger",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 163704,
				},
				[108416] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lazerbeamzz-Arthas",
					["npcID"] = 0,
				},
				[118779] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[221886] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bløodshot-BleedingHollow",
					["npcID"] = 0,
				},
				[313148] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Verthel",
					["npcID"] = 0,
				},
				[203975] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hankla-Mal'Ganis",
					["npcID"] = 0,
				},
				[273232] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Yungs-Zul'jin",
					["npcID"] = 0,
				},
				[196555] = {
					["source"] = "Zahmerdh",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[270674] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[1719] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cbegswar-BleedingHollow",
					["npcID"] = 0,
				},
				[290121] = {
					["source"] = "Dragoul-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280398] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Heartbeatz-Tichondrius",
					["npcID"] = 0,
				},
				[288075] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sandorie-Ner'zhul",
					["npcID"] = 0,
				},
				[313151] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Amathet Sun Priest",
					["npcID"] = 151612,
				},
				[272723] = {
					["source"] = "Veíl-Stormreaver",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298823] = {
					["source"] = "Sammichbich",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[235450] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Frostips-BleedingHollow",
					["npcID"] = 0,
				},
				[23922] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Melvinmoose-Zul'jin",
					["npcID"] = 0,
				},
				[17877] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lazerbeamzz-Arthas",
					["npcID"] = 0,
				},
				[188370] = {
					["source"] = "Ironmade-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[250036] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[199373] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Army of the Dead",
					["npcID"] = 24207,
				},
				[228287] = {
					["source"] = "Sädä-Malfurion",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[202188] = {
					["source"] = "Sebich",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267611] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Frogy-Agamaggan",
					["npcID"] = 0,
				},
				[256434] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Culs-Stormrage",
					["npcID"] = 0,
				},
				[267612] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Whípple-Mal'Ganis",
					["npcID"] = 0,
				},
				[286547] = {
					["source"] = "Anty-EmeraldDream",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[309065] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Saba-tok",
					["npcID"] = 157286,
				},
				[295248] = {
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["encounterID"] = 1106,
					["event"] = "SPELL_AURA_APPLIED",
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
					["source"] = "Fairin-Akama",
					["npcID"] = 0,
				},
				[203981] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Haleios-Sargeras",
					["npcID"] = 0,
				},
				[294226] = {
					["source"] = "Ma'haat the Indomitable",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 151739,
				},
				[280409] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Samëdi-Azralon",
					["npcID"] = 0,
				},
				[303438] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Saiyori",
					["npcID"] = 0,
				},
				[5217] = {
					["source"] = "Arikaraa",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5225] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Clawzxx-Illidan",
					["npcID"] = 0,
				},
				[198097] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Lunareste",
					["npcID"] = 0,
				},
				[271711] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[1833] = {
					["source"] = "Flawlyss-Arthas",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280412] = {
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["encounterID"] = 1106,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280413] = {
					["source"] = "Dajjal-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[7384] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[279902] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Yungs-Zul'jin",
					["npcID"] = 0,
				},
				[298837] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jáydee",
					["npcID"] = 0,
				},
				[226757] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Tyrionz-Sargeras",
					["npcID"] = 0,
				},
				[288091] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Cbegswar-BleedingHollow",
					["npcID"] = 0,
				},
				[307026] = {
					["source"] = "Oddvar-Kel'Thuzad",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[158183] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 162939,
				},
				[298839] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wárr",
					["npcID"] = 0,
				},
				[210126] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fæk",
					["npcID"] = 0,
				},
				[296793] = {
					["source"] = "Removal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295258] = {
					["source"] = "Fayia-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[201427] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Yungs-Zul'jin",
					["npcID"] = 0,
				},
				[298841] = {
					["source"] = "Sebârt-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[201939] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fuzzywuzzý-Illidan",
					["npcID"] = 0,
				},
				[204242] = {
					["source"] = "Ironmade-Thrall",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[26098] = {
					["source"] = "Shienor Sorcerer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 18450,
				},
				[317265] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Supbud-Zul'jin",
					["npcID"] = 0,
				},
				[266091] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[214222] = {
					["source"] = "Sathaendor",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279397] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Amoreiel-Daggerspine",
					["npcID"] = 0,
				},
				[251836] = {
					["source"] = "Óle",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[205523] = {
					["source"] = "Dionysús-Malfurion",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[276840] = {
					["source"] = "Salúd-Baelgun",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[198103] = {
					["encounterID"] = 2086,
					["source"] = "Fhaykum",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[251837] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Walkingtree-Mal'Ganis",
					["npcID"] = 0,
				},
				[98444] = {
					["source"] = "Steelemental-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[127230] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Quickranger-Bloodhoof",
					["npcID"] = 0,
				},
				[260793] = {
					["npcID"] = 131817,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Cragmaw the Infested",
					["encounterID"] = 2118,
				},
				[125439] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Niacin-Blackhand",
					["npcID"] = 0,
				},
				[5697] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cûrsé-Arthas",
					["npcID"] = 0,
				},
				[251838] = {
					["source"] = "Vdru",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1943] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lunareste",
					["npcID"] = 0,
				},
				[185311] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lunareste",
					["npcID"] = 0,
				},
				[255421] = {
					["type"] = "BUFF",
					["source"] = "Rezan",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 122963,
				},
				[1953] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Aesse",
					["npcID"] = 0,
				},
				[251839] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Genorider-Zul'jin",
					["npcID"] = 0,
				},
				[256445] = {
					["source"] = "Zandalari Leguaan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 129554,
				},
				[52437] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[273264] = {
					["source"] = "Aerospac-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[195292] = {
					["source"] = "Ertex-Sargeras",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[208086] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[317277] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Magni Bronzebeard",
					["npcID"] = 154533,
				},
				[250050] = {
					["encounterID"] = 2087,
					["source"] = "Yazma",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 122968,
				},
				[498] = {
					["source"] = "Sathaendor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[19574] = {
					["source"] = "Fayia-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[256959] = {
					["source"] = "Reanimated Honor Guard",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 127757,
				},
				[280433] = {
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["encounterID"] = 1106,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[265081] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Chosen Blood Matron",
					["npcID"] = 131436,
				},
				[256960] = {
					["source"] = "Reanimated Honor Guard",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 127757,
				},
				[212182] = {
					["source"] = "Flawlyss-Arthas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[210391] = {
					["source"] = "Soladris-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[32272] = {
					["source"] = "Frostbank",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[315746] = {
					["source"] = "Deephive Chosen",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 153905,
				},
				[277365] = {
					["source"] = "Kao-Tien Subjugator",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 136551,
				},
				[266107] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Feral Bloodswarmer",
					["npcID"] = 133835,
				},
				[277366] = {
					["source"] = "Kao-Tien Marauder",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 136552,
				},
				[30449] = {
					["source"] = "Neonpen",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[272249] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Vathikur",
					["npcID"] = 130401,
				},
				[48792] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ikalo-Zul'jin",
					["npcID"] = 0,
				},
				[312679] = {
					["source"] = "Tidal Corruptor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 153910,
				},
				[115080] = {
					["source"] = "Sädä-Malfurion",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[6201] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[147193] = {
					["encounterID"] = 2086,
					["source"] = "Celaste-LaughingSkull",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[188389] = {
					["source"] = "Dacorr-ShatteredHand",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[2094] = {
					["source"] = "Flawlyss-Arthas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[2098] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wantêd-Illidan",
					["npcID"] = 0,
				},
				[187878] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mjiollnir-BleedingHollow",
					["npcID"] = 0,
				},
				[260291] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bladeguard Elite",
					["npcID"] = 130451,
				},
				[256453] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wudie-Mal'Ganis",
					["npcID"] = 0,
				},
				[72350] = {
					["type"] = "BUFF",
					["source"] = "The Lich King",
					["encounterID"] = 1106,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 36597,
				},
				[12654] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Tyrionz-Sargeras",
					["npcID"] = 0,
				},
				[260292] = {
					["npcID"] = 131817,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Cragmaw the Infested",
					["encounterID"] = 2118,
				},
				[298357] = {
					["type"] = "BUFF",
					["source"] = "Gwenevare-WyrmrestAccord",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[305010] = {
					["source"] = "Tidemistress Ethendriss",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 153934,
				},
				[312687] = {
					["source"] = "Faceless Conqueror",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 153903,
				},
				[313199] = {
					["source"] = "Putrid Ichor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 153907,
				},
				[256455] = {
					["source"] = "Kiriodas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272260] = {
					["source"] = "Sathaendor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[300919] = {
					["type"] = "BUFF",
					["source"] = "Hungryorphan-Frostmourne",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[205025] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Elhfireah",
					["npcID"] = 0,
				},
				[556] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Cãhuna-Thrall",
					["npcID"] = 0,
				},
				[262539] = {
					["source"] = "Honorbound Shieldbreaker",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 154760,
				},
				[33697] = {
					["source"] = "Dacorr-ShatteredHand",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[102417] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fellowkid-Mal'Ganis",
					["npcID"] = 0,
				},
				[315763] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Gorbanzo",
					["npcID"] = 0,
				},
				[255434] = {
					["encounterID"] = 2086,
					["source"] = "Rezan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 122963,
				},
				[36576] = {
					["source"] = "Shaleskin Flayer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 20210,
				},
				[36640] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 18865,
				},
				[200166] = {
					["encounterID"] = 2086,
					["source"] = "Zahmerdh",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[210657] = {
					["source"] = "Sebich",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[196840] = {
					["source"] = "Dacorr-ShatteredHand",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[256459] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Starbuk-Kargath",
					["npcID"] = 0,
				},
				[11327] = {
					["source"] = "Quickkick-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[171253] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Monoxidè-Mal'Ganis",
					["npcID"] = 0,
				},
				[257483] = {
					["encounterID"] = 2086,
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[585] = {
					["source"] = "Tyronika-Doomhammer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[586] = {
					["type"] = "BUFF",
					["source"] = "Celaste-LaughingSkull",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[256460] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Draculaa-Thrall",
					["npcID"] = 0,
				},
				[589] = {
					["type"] = "DEBUFF",
					["source"] = "Celaste-LaughingSkull",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[236502] = {
					["source"] = "Jacobiyana",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[299905] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Taldreil-Zul'jin",
					["npcID"] = 0,
				},
				[16953] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Freida-AeriePeak",
					["npcID"] = 0,
				},
				[309118] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Stellar Pylon",
					["npcID"] = 158568,
				},
				[210660] = {
					["source"] = "Sebich",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272273] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Warmother Captive",
					["npcID"] = 134625,
				},
				[111759] = {
					["source"] = "Celaste-LaughingSkull",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[50842] = {
					["source"] = "Ertex-Sargeras",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[199658] = {
					["source"] = "Dahreon-Stormreaver",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[77472] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wurrzaag-Gilneas",
					["npcID"] = 0,
				},
				[277904] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rynosia-Thrall",
					["npcID"] = 0,
				},
				[34914] = {
					["encounterID"] = 2086,
					["source"] = "Celaste-LaughingSkull",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[39584] = {
					["source"] = "Ashtongue Primalist",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 68096,
				},
				[272790] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Quickranger-Bloodhoof",
					["npcID"] = 0,
				},
				[102165] = {
					["source"] = "Hruka-Velen",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[33763] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Moolatte-Baelgun",
					["npcID"] = 0,
				},
				[264603] = {
					["npcID"] = 131318,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Elder Leaxa",
					["encounterID"] = 2111,
				},
				[279956] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Aesse",
					["npcID"] = 0,
				},
				[210152] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Yungs-Zul'jin",
					["npcID"] = 0,
				},
				[275351] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Traplifé-Azralon",
					["npcID"] = 0,
				},
				[633] = {
					["encounterID"] = 2086,
					["source"] = "Thalron",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[231390] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sullitan",
					["npcID"] = 0,
				},
				[295310] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cbegswar-BleedingHollow",
					["npcID"] = 0,
				},
				[288146] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nolovz-Illidan",
					["npcID"] = 0,
				},
				[642] = {
					["type"] = "BUFF",
					["source"] = "Thalron",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273310] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Heartbeatz-Tichondrius",
					["npcID"] = 0,
				},
				[217832] = {
					["source"] = "Zahmerdh",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[268194] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Krogther-Ragnaros",
					["npcID"] = 0,
				},
				[315787] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Esov-Illidan",
					["npcID"] = 0,
				},
				[275359] = {
					["source"] = "Zujothgul",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 128578,
				},
				[131347] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Adamdh-Illidan",
					["npcID"] = 0,
				},
				[36515] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 20474,
				},
				[250585] = {
					["encounterID"] = 2085,
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[213995] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wantêd-Illidan",
					["npcID"] = 0,
				},
				[222695] = {
					["source"] = "Creedo-Shadowmoon",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[267685] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Verthel",
					["npcID"] = 0,
				},
				[5394] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[297879] = {
					["source"] = "Eye of the Corruptor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 153347,
				},
				[316814] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[53595] = {
					["source"] = "Ironmade-Thrall",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[155145] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Holylolring-Illidan",
					["npcID"] = 0,
				},
				[190456] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Melvinmoose-Zul'jin",
					["npcID"] = 0,
				},
				[79140] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Crushhero-Zul'jin",
					["npcID"] = 0,
				},
				[288158] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nolovz-Illidan",
					["npcID"] = 0,
				},
				[688] = {
					["source"] = "Rotrin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[691] = {
					["source"] = "Actively",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[135700] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Freida-AeriePeak",
					["npcID"] = 0,
				},
				[204019] = {
					["source"] = "Legndzonttv",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[697] = {
					["source"] = "Rotrin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[295838] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Verthel",
					["npcID"] = 0,
				},
				[703] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lunareste",
					["npcID"] = 0,
				},
				[61336] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Freida-AeriePeak",
					["npcID"] = 0,
				},
				[2818] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Lunareste",
					["npcID"] = 0,
				},
				[274346] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Taldreil-Zul'jin",
					["npcID"] = 0,
				},
				[26678] = {
					["source"] = "Achilios",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[295840] = {
					["source"] = "Instantdeath-Bloodhoof",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193530] = {
					["source"] = "Cerbi-Sargeras",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193786] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mjiollnir-BleedingHollow",
					["npcID"] = 0,
				},
				[712] = {
					["source"] = "Rotrin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[316823] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[278954] = {
					["source"] = "Ironmade-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295842] = {
					["source"] = "Tàlrin-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[197625] = {
					["source"] = "Rakporine",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[16827] = {
					["source"] = "Lexa",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 32517,
				},
				[33702] = {
					["type"] = "BUFF",
					["source"] = "Hungryorphan-Frostmourne",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[35877] = {
					["source"] = "Unknown",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 18850,
				},
				[303520] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fairin-Akama",
					["npcID"] = 0,
				},
				[176644] = {
					["source"] = "Litbadjr-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[316826] = {
					["encounterID"] = 1106,
					["source"] = "Twisted Appendage",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 162764,
				},
				[34086] = {
					["source"] = "Maiden of Pain",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 19408,
				},
				[281517] = {
					["source"] = "Gwenevare-WyrmrestAccord",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279471] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Freida-AeriePeak",
					["npcID"] = 0,
				},
				[273842] = {
					["source"] = "Fhaykum",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[147732] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Mjiollnir-BleedingHollow",
					["npcID"] = 0,
				},
				[287660] = {
					["type"] = "BUFF",
					["source"] = "Hungryorphan-Frostmourne",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[256735] = {
					["source"] = "Nello-Norgannon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193534] = {
					["source"] = "Arentar-Dalaran",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[278961] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Diseased Lasher",
					["npcID"] = 133870,
				},
				[57755] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Gorbanzo",
					["npcID"] = 0,
				},
				[310690] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Holehunter",
					["npcID"] = 0,
				},
				[311202] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Holehunter",
					["npcID"] = 0,
				},
				[269239] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Yungs-Zul'jin",
					["npcID"] = 0,
				},
				[256992] = {
					["source"] = "Frightened Brutosaur",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 129668,
				},
				[93985] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Freida-AeriePeak",
					["npcID"] = 0,
				},
				[755] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[36006] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 21050,
				},
				[291247] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 154167,
				},
				[316835] = {
					["type"] = "DEBUFF",
					["source"] = "Twisted Appendage",
					["encounterID"] = 1106,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 162764,
				},
				[202748] = {
					["source"] = "Fayia-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[118038] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[277943] = {
					["source"] = "Dacorr-ShatteredHand",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295855] = {
					["source"] = "Instantdeath-Bloodhoof",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[49184] = {
					["encounterID"] = 1106,
					["source"] = "Ahriak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[772] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[256739] = {
					["source"] = "Zisu-Kel'Thuzad",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193538] = {
					["source"] = "Otters-Eonar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[47585] = {
					["type"] = "BUFF",
					["source"] = "Celaste-LaughingSkull",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[3110] = {
					["source"] = "Geljub",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 416,
				},
				[781] = {
					["source"] = "Fanatixxh-BleedingHollow",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[783] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Arabella-Mal'Ganis",
					["npcID"] = 0,
				},
				[155158] = {
					["source"] = "Gwenevare-WyrmrestAccord",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[116888] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Ikalo-Zul'jin",
					["npcID"] = 0,
				},
				[23161] = {
					["source"] = "Koichoga",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193796] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mjiollnir-BleedingHollow",
					["npcID"] = 0,
				},
				[70575] = {
					["source"] = "Pathogenz",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[311214] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[111771] = {
					["source"] = "Rotrin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[85288] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Doinkster-Mal'Ganis",
					["npcID"] = 0,
				},
				[158486] = {
					["source"] = "Nerfpets-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[8690] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Crushhero-Zul'jin",
					["npcID"] = 0,
				},
				[19483] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Infernal",
					["npcID"] = 89,
				},
				[21562] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sinamara-Illidan",
					["npcID"] = 0,
				},
				[304564] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tokuudred-Arthas",
					["npcID"] = 0,
				},
				[70192] = {
					["source"] = "Osgurl",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[194310] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Esov-Illidan",
					["npcID"] = 0,
				},
				[260070] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Pa'kura Priest",
					["npcID"] = 131834,
				},
				[190984] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Define-Mal'Ganis",
					["npcID"] = 0,
				},
				[274373] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Esov-Illidan",
					["npcID"] = 0,
				},
				[319919] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Slayamonk-Illidan",
					["npcID"] = 0,
				},
				[198149] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Aesse",
					["npcID"] = 0,
				},
				[108446] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 17252,
				},
				[818] = {
					["source"] = "Hellenkìller-Thrall",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[304056] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kthxbai-BleedingHollow",
					["npcID"] = 0,
				},
				[68530] = {
					["source"] = "Darkevader",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[260072] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Pa'kura Priest",
					["npcID"] = 131834,
				},
				[83243] = {
					["source"] = "Gunwar-Kil'jaeden",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[228600] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Aesse",
					["npcID"] = 0,
				},
				[300989] = {
					["source"] = "Lynaris-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[15407] = {
					["type"] = "BUFF",
					["source"] = "Celaste-LaughingSkull",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298431] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nevaiyah",
					["npcID"] = 0,
				},
				[185358] = {
					["encounterID"] = 2086,
					["source"] = "Vverr-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[165144] = {
					["source"] = "Huojin Defender",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 154402,
				},
				[318391] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Great Worm From Beyond",
					["npcID"] = 152550,
				},
				[298433] = {
					["source"] = "Johalius",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[6770] = {
					["source"] = "Flawlyss-Arthas",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[39911] = {
					["source"] = "Oxirayne-Sargeras",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[243955] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Picon-Whisperwind",
					["npcID"] = 0,
				},
				[225788] = {
					["source"] = "Tàlrin-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[853] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Frogy-Agamaggan",
					["npcID"] = 0,
				},
				[303041] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Monjaro-BleedingHollow",
					["npcID"] = 0,
				},
				[297412] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Civex-Illidan",
					["npcID"] = 0,
				},
				[70579] = {
					["source"] = "Achilios",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295367] = {
					["type"] = "DEBUFF",
					["source"] = "Ahriak",
					["encounterID"] = 1106,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279503] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ikalo-Zul'jin",
					["npcID"] = 0,
				},
				[298950] = {
					["source"] = "Nighthearts",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295368] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Flamejob-Kel'Thuzad",
					["npcID"] = 0,
				},
				[51490] = {
					["source"] = "Dacorr-ShatteredHand",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[33259] = {
					["source"] = "Litbadjr-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[176151] = {
					["source"] = "Ramiyolol",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[263642] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Traplifé-Azralon",
					["npcID"] = 0,
				},
				[272342] = {
					["source"] = "Minor Azerite Infused Elemental",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 136616,
				},
				[77489] = {
					["source"] = "Smartblonde-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[132653] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 153089,
				},
				[272343] = {
					["source"] = "Azerite-Infused Elemental",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 136615,
				},
				[883] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Varu-Blackrock",
					["npcID"] = 0,
				},
				[5019] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lazerbeamzz-Arthas",
					["npcID"] = 0,
				},
				[224001] = {
					["source"] = "Xuk-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295373] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Genorider-Zul'jin",
					["npcID"] = 0,
				},
				[30455] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rynosia-Thrall",
					["npcID"] = 0,
				},
				[3566] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mina-BloodFurnace",
					["npcID"] = 0,
				},
				[303564] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bacata-Dalaran",
					["npcID"] = 0,
				},
				[203277] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Pyrotessa-Detheroc",
					["npcID"] = 0,
				},
				[252661] = {
					["source"] = "Shadowblade Stalker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 122970,
				},
				[272348] = {
					["source"] = "Infused Crag",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 136613,
				},
				[119582] = {
					["source"] = "Dionysús-Malfurion",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[107428] = {
					["source"] = "Hecatè-Malfurion",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[24858] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lixurwounds-Dalaran",
					["npcID"] = 0,
				},
				[295378] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dfd-BleedingHollow",
					["npcID"] = 0,
				},
				[269279] = {
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["encounterID"] = 1106,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[228354] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Verthel",
					["npcID"] = 0,
				},
				[216328] = {
					["source"] = "Bophercherry",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[42024] = {
					["source"] = "Ashtongue Shaman",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 68129,
				},
				[303568] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Bacata-Dalaran",
					["npcID"] = 0,
				},
				[259572] = {
					["type"] = "BUFF",
					["source"] = "Vol'kaal",
					["encounterID"] = 2085,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 122965,
				},
				[303570] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bacata-Dalaran",
					["npcID"] = 0,
				},
				[297941] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lolnaldtrump-AeriePeak",
					["npcID"] = 0,
				},
				[275936] = {
					["type"] = "BUFF",
					["source"] = "Zahmerdh",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[132403] = {
					["source"] = "Thalron",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[271843] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Define-Mal'Ganis",
					["npcID"] = 0,
				},
				[295384] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Genorider-Zul'jin",
					["npcID"] = 0,
				},
				[311249] = {
					["source"] = "Nello-Norgannon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[132404] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Melvinmoose-Zul'jin",
					["npcID"] = 0,
				},
				[259830] = {
					["type"] = "BUFF",
					["source"] = "Sporecaller Zancha",
					["npcID"] = 131383,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2112,
				},
				[157736] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[101545] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Takuetsukaze-BleedingHollow",
					["npcID"] = 0,
				},
				[203538] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Supbud-Zul'jin",
					["npcID"] = 0,
				},
				[228358] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Verthel",
					["npcID"] = 0,
				},
				[268776] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 130257,
				},
				[275429] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[184092] = {
					["source"] = "Thalron",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[227847] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[203539] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Supbud-Zul'jin",
					["npcID"] = 0,
				},
				[252923] = {
					["source"] = "Zanchuli Witch-Doctor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 122969,
				},
				[264173] = {
					["source"] = "Instantdeath-Bloodhoof",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[101546] = {
					["source"] = "Sädä-Malfurion",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[34477] = {
					["source"] = "Aerospac-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[298461] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ilgynoth-Tanaris",
					["npcID"] = 0,
				},
				[108199] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ikalo-Zul'jin",
					["npcID"] = 0,
				},
				[304603] = {
					["source"] = "Anwàr",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[290786] = {
					["source"] = "Icurus",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[223499] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Garto-Tanaris",
					["npcID"] = 0,
				},
				[32942] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 18884,
				},
				[157228] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Define-Mal'Ganis",
					["npcID"] = 0,
				},
				[264689] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Slayamonk-Illidan",
					["npcID"] = 0,
				},
				[308188] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Primordial-Llane",
					["npcID"] = 0,
				},
				[312794] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Cûrsé-Arthas",
					["npcID"] = 0,
				},
				[974] = {
					["source"] = "Shieldshock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[308189] = {
					["source"] = "Sravone-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[255741] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Faithless Champion",
					["npcID"] = 135292,
				},
				[100780] = {
					["source"] = "Sädä-Malfurion",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[982] = {
					["source"] = "Fanatixxh-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[44457] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Brionac-Arthas",
					["npcID"] = 0,
				},
				[315356] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Caravaneer's Pack",
					["npcID"] = 162001,
				},
				[313310] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Saiyori",
					["npcID"] = 0,
				},
				[282505] = {
					["source"] = "Diøxin-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[145205] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Moolatte-Baelgun",
					["npcID"] = 0,
				},
				[124275] = {
					["source"] = "Dionysús-Malfurion",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272721] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Déjà-Aegwynn",
					["npcID"] = 0,
				},
				[32943] = {
					["source"] = "Warp Chaser",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 18884,
				},
				[302565] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Yungs-Zul'jin",
					["npcID"] = 0,
				},
				[201754] = {
					["source"] = "johnny",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 124527,
				},
				[197916] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Saladin-Bonechewer",
					["npcID"] = 0,
				},
				[47528] = {
					["source"] = "Gommerr",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[303044] = {
					["source"] = "Barfight",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[274420] = {
					["source"] = "Hungryorphan-Frostmourne",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[113656] = {
					["source"] = "Sädä-Malfurion",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[105771] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[131901] = {
					["source"] = "Dead Inkgill Spearman",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 61532,
				},
				[8042] = {
					["source"] = "Dacorr-ShatteredHand",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[281402] = {
					["source"] = "Sindrablowsa-Kel'Thuzad",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[32216] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Doinkster-Mal'Ganis",
					["npcID"] = 0,
				},
				[304482] = {
					["source"] = "Solidshaft-Zul'jin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[186403] = {
					["source"] = "Ahriak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279028] = {
					["source"] = "Dacorr-ShatteredHand",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[250372] = {
					["type"] = "DEBUFF",
					["source"] = "Vol'kaal",
					["encounterID"] = 2085,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 122965,
				},
				[272349] = {
					["source"] = "Infused Crag",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 136613,
				},
				[279029] = {
					["source"] = "Dacorr-ShatteredHand",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[138555] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 69964,
				},
				[257537] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Verthel",
					["npcID"] = 0,
				},
				[203286] = {
					["source"] = "Yourefired-Aggramar",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[167981] = {
					["source"] = "Ogwizard-Deathwing",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[33943] = {
					["source"] = "Hordepeke",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[207386] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Moolatte-Baelgun",
					["npcID"] = 0,
				},
				[299306] = {
					["source"] = "Sorein-Stormrage",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[134206] = {
					["source"] = "Rotrin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[138556] = {
					["source"] = "Unknown",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 69964,
				},
				[69438] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Hêllboy",
					["npcID"] = 0,
				},
				[188196] = {
					["source"] = "Dacorr-ShatteredHand",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[274426] = {
					["source"] = "Arikaraa",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[198589] = {
					["source"] = "Zahmerdh",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[108843] = {
					["type"] = "BUFF",
					["source"] = "Gwenevare-WyrmrestAccord",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[121253] = {
					["source"] = "Dionysús-Malfurion",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[288756] = {
					["type"] = "DEBUFF",
					["source"] = "Celaste-LaughingSkull",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[138557] = {
					["source"] = "Unknown",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 69964,
				},
				[49576] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ikalo-Zul'jin",
					["npcID"] = 0,
				},
				[210714] = {
					["source"] = "Dacorr-ShatteredHand",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1044] = {
					["source"] = "Sathaendor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275765] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[255937] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Pigeonwat-Alleria",
					["npcID"] = 0,
				},
				[193315] = {
					["source"] = "Otters-Eonar",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[134208] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[66] = {
					["source"] = "Sindrablowsa-Kel'Thuzad",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[126755] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Avey-Azralon",
					["npcID"] = 0,
				},
				[71614] = {
					["type"] = "BUFF",
					["source"] = "The Lich King",
					["encounterID"] = 1106,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 36597,
				},
				[274430] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kimsohyun-Azralon",
					["npcID"] = 0,
				},
				[315681] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Flexheal-Zul'jin",
					["npcID"] = 0,
				},
				[1064] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[193316] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sauzey",
					["npcID"] = 0,
				},
				[274431] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kimsohyun-Azralon",
					["npcID"] = 0,
				},
				[2139] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Saiyori",
					["npcID"] = 0,
				},
				[194084] = {
					["source"] = "Metalstriker",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[232893] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kimsohyun-Azralon",
					["npcID"] = 0,
				},
				[279033] = {
					["source"] = "Dacorr-ShatteredHand",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275909] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xhapes-Icecrown",
					["npcID"] = 0,
				},
				[183752] = {
					["source"] = "Zahmerdh",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[209693] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Yungs-Zul'jin",
					["npcID"] = 0,
				},
				[55078] = {
					["source"] = "Ertex-Sargeras",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[8676] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wantêd-Illidan",
					["npcID"] = 0,
				},
				[29722] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[316703] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tutonka-Mal'Ganis",
					["npcID"] = 0,
				},
				[184362] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Doinkster-Mal'Ganis",
					["npcID"] = 0,
				},
				[252382] = {
					["source"] = "Kharl",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[199203] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cbegswar-BleedingHollow",
					["npcID"] = 0,
				},
				[274739] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thailos-Chromaggus",
					["npcID"] = 0,
				},
				[148540] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[164812] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Define-Mal'Ganis",
					["npcID"] = 0,
				},
				[202274] = {
					["source"] = "Dionysús-Malfurion",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[123040] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Heartbeatz-Tichondrius",
					["npcID"] = 0,
				},
				[185565] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thailos-Chromaggus",
					["npcID"] = 0,
				},
				[289277] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Genorider-Zul'jin",
					["npcID"] = 0,
				},
				[254473] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Skep",
					["npcID"] = 0,
				},
				[203554] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Moolatte-Baelgun",
					["npcID"] = 0,
				},
				[63560] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Clapedcheeks-Rivendare",
					["npcID"] = 0,
				},
				[273238] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ilgynoth-Tanaris",
					["npcID"] = 0,
				},
				[70577] = {
					["source"] = "Achilios",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1122] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[184364] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thaerhum",
					["npcID"] = 0,
				},
				[272903] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Krystynna-Illidan",
					["npcID"] = 0,
				},
				[273415] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[162530] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Saladin-Bonechewer",
					["npcID"] = 0,
				},
				[148542] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[13787] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 19411,
				},
				[70580] = {
					["source"] = "Achilios",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[266201] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Reanimated Guardian",
					["npcID"] = 133836,
				},
				[187874] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mjiollnir-BleedingHollow",
					["npcID"] = 0,
				},
				[214202] = {
					["source"] = "Sathaendor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[116011] = {
					["source"] = "Yourefired-Aggramar",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[81340] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Esov-Illidan",
					["npcID"] = 0,
				},
				[1459] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Pyrolunatic",
					["npcID"] = 0,
				},
				[207317] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Clapedcheeks-Rivendare",
					["npcID"] = 0,
				},
				[285482] = {
					["source"] = "Dacorr-ShatteredHand",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[77758] = {
					["source"] = "Metalmend",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[280583] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Holehunter",
					["npcID"] = 0,
				},
				[73920] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[1160] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Melvinmoose-Zul'jin",
					["npcID"] = 0,
				},
				[21169] = {
					["encounterID"] = 2086,
					["source"] = "Fhaykum",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[274443] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Quickranger-Bloodhoof",
					["npcID"] = 0,
				},
				[268756] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Wantêd-Illidan",
					["npcID"] = 0,
				},
				[167898] = {
					["source"] = "Thepots-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[300543] = {
					["source"] = "Chi-Ji",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 154261,
				},
				[184367] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Doinkster-Mal'Ganis",
					["npcID"] = 0,
				},
				[53209] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Philse",
					["npcID"] = 0,
				},
				[279526] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Freida-AeriePeak",
					["npcID"] = 0,
				},
				[122281] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Saladin-Bonechewer",
					["npcID"] = 0,
				},
				[203814] = {
					["source"] = "Gillygillu",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[265568] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Befouled Spirit",
					["npcID"] = 133685,
				},
				[303580] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wantêd-Illidan",
					["npcID"] = 0,
				},
				[48107] = {
					["source"] = "Gwenevare-WyrmrestAccord",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[108280] = {
					["source"] = "Fhaykum",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2379] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Genorider-Zul'jin",
					["npcID"] = 0,
				},
				[2383] = {
					["source"] = "Zarinisa-Stormreaver",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[252687] = {
					["source"] = "Shadowblade Stalker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 122970,
				},
				[195627] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bloodscoute",
					["npcID"] = 0,
				},
				[188443] = {
					["source"] = "Dacorr-ShatteredHand",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[276268] = {
					["source"] = "Faceless Conqueror",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 153903,
				},
				[292359] = {
					["source"] = "Dragoul-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[106785] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Freida-AeriePeak",
					["npcID"] = 0,
				},
				[97462] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[40623] = {
					["source"] = "Neonpen",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[292360] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hafjin",
					["npcID"] = 0,
				},
				[203720] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Traplifé-Azralon",
					["npcID"] = 0,
				},
				[278826] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[157644] = {
					["type"] = "BUFF",
					["source"] = "Gwenevare-WyrmrestAccord",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[85948] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Esov-Illidan",
					["npcID"] = 0,
				},
				[92089] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Traplifé-Azralon",
					["npcID"] = 0,
				},
				[187837] = {
					["source"] = "Takkaga",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[83244] = {
					["source"] = "Aerospac-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[292362] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Chipx",
					["npcID"] = 0,
				},
				[5672] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 3527,
				},
				[272916] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Slicer-Lightninghoof",
					["npcID"] = 0,
				},
				[273428] = {
					["source"] = "Díesel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[292363] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cãhuna-Thrall",
					["npcID"] = 0,
				},
				[317439] = {
					["source"] = "Echo of Chi-Ji",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 152895,
				},
				[33395] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Water Elemental",
					["npcID"] = 78116,
				},
				[116014] = {
					["source"] = "Yourefired-Aggramar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[292364] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hankla-Mal'Ganis",
					["npcID"] = 0,
				},
				[195630] = {
					["source"] = "Dionysús-Malfurion",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275857] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bloodscoute",
					["npcID"] = 0,
				},
				[69445] = {
					["source"] = "Decisïonz",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[48108] = {
					["source"] = "Gwenevare-WyrmrestAccord",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[96312] = {
					["source"] = "Skryne-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[33907] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Broll Bearmantle",
					["npcID"] = 142294,
				},
				[119085] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Urvi-Stormreaver",
					["npcID"] = 0,
				},
				[308742] = {
					["source"] = "Ahriak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[203819] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Traplifé-Azralon",
					["npcID"] = 0,
				},
				[202028] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Xhapes-Icecrown",
					["npcID"] = 0,
				},
				[204331] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[213243] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kimsohyun-Azralon",
					["npcID"] = 0,
				},
				[294926] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fairin-Akama",
					["npcID"] = 0,
				},
				[5116] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Quickranger-Bloodhoof",
					["npcID"] = 0,
				},
				[236060] = {
					["source"] = "Gwenevare-WyrmrestAccord",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[252692] = {
					["source"] = "Shadowblade Stalker",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 122970,
				},
				[246807] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Krystynna-Illidan",
					["npcID"] = 0,
				},
				[108211] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Stevenwonder",
					["npcID"] = 0,
				},
				[275481] = {
					["type"] = "BUFF",
					["source"] = "Thalron",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[77762] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Karlurn-BleedingHollow",
					["npcID"] = 0,
				},
				[206891] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Amoreiel-Daggerspine",
					["npcID"] = 0,
				},
				[257946] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Quickranger-Bloodhoof",
					["npcID"] = 0,
				},
				[275931] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Clapedcheeks-Rivendare",
					["npcID"] = 0,
				},
				[273947] = {
					["source"] = "Ertex-Sargeras",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[293664] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Urvi-Stormreaver",
					["npcID"] = 0,
				},
				[257541] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Shroudfatcok-AeriePeak",
					["npcID"] = 0,
				},
				[303621] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wantêd-Illidan",
					["npcID"] = 0,
				},
				[208683] = {
					["source"] = "Flawlyss-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[314729] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Aqir Scarab",
					["npcID"] = 161541,
				},
				[318227] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lunareste",
					["npcID"] = 0,
				},
				[285719] = {
					["source"] = "Juggerbear",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[70576] = {
					["source"] = "Achilios",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257044] = {
					["source"] = "Vverr-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[197937] = {
					["type"] = "BUFF",
					["source"] = "Celaste-LaughingSkull",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[48045] = {
					["encounterID"] = 2086,
					["source"] = "Celaste-LaughingSkull",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[215479] = {
					["source"] = "Dionysús-Malfurion",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[253595] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Corcki-Illidan",
					["npcID"] = 0,
				},
				[348] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[231895] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Holycowpatty-Antonidas",
					["npcID"] = 0,
				},
				[2643] = {
					["source"] = "Fayia-Arthas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[197919] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xuxuu-Azralon",
					["npcID"] = 0,
				},
				[204079] = {
					["type"] = "DEBUFF",
					["source"] = "Thalron",
					["encounterID"] = 2085,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5308] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Doinkster-Mal'Ganis",
					["npcID"] = 0,
				},
				[1330] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Lunareste",
					["npcID"] = 0,
				},
				[270370] = {
					["source"] = "Bilgewater Incinerator",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 135541,
				},
				[267288] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Earthen Ring Shaman",
					["npcID"] = 135671,
				},
				[287771] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Assoka-Drakkari",
					["npcID"] = 0,
				},
				[193333] = {
					["source"] = "Azzorahai-Kel'Thuzad",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[294935] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nifx-BleedingHollow",
					["npcID"] = 0,
				},
				[268836] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Holycowpatty-Antonidas",
					["npcID"] = 0,
				},
				[31707] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Water Elemental",
					["npcID"] = 78116,
				},
				[274726] = {
					["source"] = "Fhaykum",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[196608] = {
					["source"] = "Dionysús-Malfurion",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[262115] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[108853] = {
					["source"] = "Gwenevare-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[273955] = {
					["source"] = "Sathaendor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[285472] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Krystynna-Illidan",
					["npcID"] = 0,
				},
				[289308] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Aesse",
					["npcID"] = 0,
				},
				[317420] = {
					["source"] = "Dragoul-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[253721] = {
					["source"] = "Shieldbearer of Zul",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 127879,
				},
				[107574] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[212423] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Risen Skulker",
					["npcID"] = 99541,
				},
				[298009] = {
					["source"] = "Richdollahz",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[304662] = {
					["source"] = "Meaven-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273836] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Callirra-Daggerspine",
					["npcID"] = 0,
				},
				[26297] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Freida-AeriePeak",
					["npcID"] = 0,
				},
				[301991] = {
					["source"] = "Fhaykum",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[304663] = {
					["source"] = "Jaquelator-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[155722] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Freida-AeriePeak",
					["npcID"] = 0,
				},
				[194249] = {
					["type"] = "BUFF",
					["source"] = "Celaste-LaughingSkull",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[225832] = {
					["source"] = "Viixxie",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[41425] = {
					["source"] = "Evilinferno-Aggramar",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288800] = {
					["type"] = "BUFF",
					["source"] = "Gwenevare-WyrmrestAccord",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[262652] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Crosshorn-Tichondrius",
					["npcID"] = 0,
				},
				[305011] = {
					["source"] = "Tidemistress Ethendriss",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 153934,
				},
				[266265] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fallen Deathspeaker",
					["npcID"] = 134284,
				},
				[267558] = {
					["source"] = "Baneoflegion",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[49376] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Xhapes-Icecrown",
					["npcID"] = 0,
				},
				[215598] = {
					["source"] = "Kheldoran",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[303380] = {
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["encounterID"] = 1106,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[270379] = {
					["source"] = "Bilgewater Worker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 135561,
				},
				[204262] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lërne-Zul'jin",
					["npcID"] = 0,
				},
				[192058] = {
					["source"] = "Dacorr-ShatteredHand",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[204596] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Traplifé-Azralon",
					["npcID"] = 0,
				},
				[2823] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nüll-Thrall",
					["npcID"] = 0,
				},
				[317363] = {
					["source"] = "Rotrin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[292361] = {
					["source"] = "Ahriak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[266209] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fallen Deathspeaker",
					["npcID"] = 134284,
				},
				[266106] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Feral Bloodswarmer",
					["npcID"] = 133835,
				},
				[272940] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Modflanders-Cho'gall",
					["npcID"] = 0,
				},
				[316439] = {
					["source"] = "Deephive Soldier",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 163703,
				},
				[285979] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Eleious-Zul'jin",
					["npcID"] = 0,
				},
				[318219] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bacata-Dalaran",
					["npcID"] = 0,
				},
				[56222] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ikalo-Zul'jin",
					["npcID"] = 0,
				},
				[265091] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Devout Blood Priest",
					["npcID"] = 131492,
				},
				[285978] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Smallgai-Illidan",
					["npcID"] = 0,
				},
				[5740] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[43308] = {
					["source"] = "Shampóò-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2649] = {
					["source"] = "Lexa",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 32517,
				},
				[204598] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Traplifé-Azralon",
					["npcID"] = 0,
				},
				[165961] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Shunkashuto-Dalaran",
					["npcID"] = 0,
				},
				[2645] = {
					["source"] = "Amaiko",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[248473] = {
					["source"] = "Rpb",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[58504] = {
					["source"] = "Ordo Overseer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 59580,
				},
				[197690] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[36213] = {
					["source"] = "Greater Earth Elemental",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 95072,
				},
				[256456] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Battlebull-Madoran",
					["npcID"] = 0,
				},
				[205766] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Verthel",
					["npcID"] = 0,
				},
				[278574] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Christmasnub-Tichondrius",
					["npcID"] = 0,
				},
				[272945] = {
					["source"] = "Instantdeath-Bloodhoof",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1464] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[285976] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Primordial-Llane",
					["npcID"] = 0,
				},
				[198065] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Verthel",
					["npcID"] = 0,
				},
				[214968] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Esov-Illidan",
					["npcID"] = 0,
				},
				[260879] = {
					["npcID"] = 131318,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Elder Leaxa",
					["encounterID"] = 2111,
				},
				[212704] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Samëdi-Azralon",
					["npcID"] = 0,
				},
				[314121] = {
					["source"] = "Oozing Corruption",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 156457,
				},
				[260242] = {
					["source"] = "Arentar-Dalaran",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[153595] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Aesse",
					["npcID"] = 0,
				},
				[265668] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Living Rot",
					["npcID"] = 133852,
				},
				[20572] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Crushhero-Zul'jin",
					["npcID"] = 0,
				},
				[289324] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kthxbai-BleedingHollow",
					["npcID"] = 0,
				},
				[275507] = {
					["source"] = "Infused Bedrock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 136614,
				},
				[1490] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Yungs-Zul'jin",
					["npcID"] = 0,
				},
				[2983] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rumbawls-LaughingSkull",
					["npcID"] = 0,
				},
				[264761] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Novae",
					["npcID"] = 0,
				},
				[205369] = {
					["encounterID"] = 2086,
					["source"] = "Celaste-LaughingSkull",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[269879] = {
					["source"] = "Bloodbough Funggarian",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 135901,
				},
				[201787] = {
					["source"] = "Sädä-Malfurion",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268856] = {
					["type"] = "BUFF",
					["source"] = "Zahmerdh",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[269880] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 135901,
				},
				[273974] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[300814] = {
					["type"] = "BUFF",
					["source"] = "Thalron",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[287280] = {
					["source"] = "Sathaendor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[314631] = {
					["source"] = "Kirayne",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[269881] = {
					["source"] = "Bloodbough Funggarian",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 135901,
				},
				[256403] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bonebeak Vulture",
					["npcID"] = 136664,
				},
				[264764] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Novae",
					["npcID"] = 0,
				},
				[116847] = {
					["source"] = "Dionysús-Malfurion",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[260384] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Arabella-Mal'Ganis",
					["npcID"] = 0,
				},
				[115767] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Melvinmoose-Zul'jin",
					["npcID"] = 0,
				},
				[295470] = {
					["source"] = "Ma'haat the Indomitable",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 151739,
				},
				[124211] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Yogibeär",
					["npcID"] = 0,
				},
				[69070] = {
					["source"] = "Skof-Aegwynn",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[265089] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Devout Blood Priest",
					["npcID"] = 131492,
				},
				[130736] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Puppetchill-Illidan",
					["npcID"] = 0,
				},
				[267325] = {
					["type"] = "BUFF",
					["source"] = "Vverr-Illidan",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[259873] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bonebeak Scavenger",
					["npcID"] = 124527,
				},
				[264757] = {
					["npcID"] = 131318,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Elder Leaxa",
					["encounterID"] = 2111,
				},
				[176458] = {
					["source"] = "Blacksmithing Follower - Horde",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 88402,
				},
				[273467] = {
					["source"] = "Brother Meller",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 154447,
				},
				[276026] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Freida-AeriePeak",
					["npcID"] = 0,
				},
				[260894] = {
					["npcID"] = 131318,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Elder Leaxa",
					["encounterID"] = 2111,
				},
				[267326] = {
					["type"] = "BUFF",
					["source"] = "Vverr-Illidan",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267327] = {
					["type"] = "BUFF",
					["source"] = "Vverr-Illidan",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[252395] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mastuhh-Thrall",
					["npcID"] = 0,
				},
				[318211] = {
					["source"] = "Dacorr-ShatteredHand",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[77130] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[256967] = {
					["source"] = "Frightened Brutosaur",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 129668,
				},
				[303943] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lazerbeamzz-Arthas",
					["npcID"] = 0,
				},
				[232698] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nifx-BleedingHollow",
					["npcID"] = 0,
				},
				[118455] = {
					["source"] = "Fayia-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267329] = {
					["type"] = "BUFF",
					["source"] = "Vverr-Illidan",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[260057] = {
					["source"] = "Priest of Gonk",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 131809,
				},
				[194627] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zarthell-Arygos",
					["npcID"] = 0,
				},
				[166139] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Sun Prophet Tenhamen",
					["npcID"] = 154727,
				},
				[267330] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Whípple-Mal'Ganis",
					["npcID"] = 0,
				},
				[255931] = {
					["source"] = "Blood Bonepicker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 122636,
				},
				[287504] = {
					["source"] = "Sädä-Malfurion",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[270657] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Theoshun-ShatteredHand",
					["npcID"] = 0,
				},
				[267331] = {
					["type"] = "BUFF",
					["source"] = "Vverr-Illidan",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298836] = {
					["source"] = "Lilìth-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[89158] = {
					["source"] = "Nello-Norgannon",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[101568] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Esov-Illidan",
					["npcID"] = 0,
				},
				[59052] = {
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["encounterID"] = 1106,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[278523] = {
					["source"] = "Chanuka-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[260069] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Priest of Gonk",
					["npcID"] = 131809,
				},
				[89798] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Lord Victor Nefarius",
					["npcID"] = 49799,
				},
				[265019] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Chosen Blood Matron",
					["npcID"] = 131436,
				},
				[235313] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mina-BloodFurnace",
					["npcID"] = 0,
				},
				[1604] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Pit Snake",
					["npcID"] = 126894,
				},
				[233778] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[298761] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[262589] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bloodswarmer",
					["npcID"] = 138727,
				},
				[303158] = {
					["source"] = "Zanj'ir Myrmidon",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 153960,
				},
				[264776] = {
					["source"] = "Mïcha",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[293946] = {
					["source"] = "Strategy",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273988] = {
					["source"] = "Dacorr-ShatteredHand",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[264265] = {
					["source"] = "Lexa",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 32517,
				},
				[256296] = {
					["source"] = "Rhothomir",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[312370] = {
					["source"] = "Pikaçhu",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[130345] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wojö",
					["npcID"] = 0,
				},
				[280544] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Renje-Mal'Ganis",
					["npcID"] = 0,
				},
				[301624] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Aesse",
					["npcID"] = 0,
				},
				[8212] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lyfelessjr-Dalaran",
					["npcID"] = 0,
				},
				[225080] = {
					["type"] = "DEBUFF",
					["source"] = "Fhaykum",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[200772] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Explorer's League Researcher",
					["npcID"] = 161938,
				},
				[287808] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Autofill-Thrall",
					["npcID"] = 0,
				},
				[44212] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tunon-Thrall",
					["npcID"] = 0,
				},
				[281954] = {
					["source"] = "Aced-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[6572] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Melvinmoose-Zul'jin",
					["npcID"] = 0,
				},
				[256911] = {
					["source"] = "Frightened Brutosaur",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 129668,
				},
				[269589] = {
					["source"] = "Fhaykum",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[212799] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fæk",
					["npcID"] = 0,
				},
				[113724] = {
					["source"] = "Evilinferno-Aggramar",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[250258] = {
					["encounterID"] = 2085,
					["source"] = "Vol'kaal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 122965,
				},
				[273481] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Frogy-Agamaggan",
					["npcID"] = 0,
				},
				[302651] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Civex-Illidan",
					["npcID"] = 0,
				},
				[112042] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Klathtaz",
					["npcID"] = 1860,
				},
				[272970] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Ronfreezly-Illidan",
					["npcID"] = 0,
				},
				[212800] = {
					["source"] = "Zahmerdh",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[6660] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Amathet Bowman",
					["npcID"] = 151800,
				},
				[6668] = {
					["source"] = "Pera Firestone",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 64480,
				},
				[268877] = {
					["source"] = "Fayia-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[199721] = {
					["source"] = "Outbreak-Alleria",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[20473] = {
					["source"] = "Sathaendor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[51505] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Karlurn-BleedingHollow",
					["npcID"] = 0,
				},
				[304611] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Rÿlañ-Zul'jin",
					["npcID"] = 0,
				},
				[20707] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zarthell-Arygos",
					["npcID"] = 0,
				},
				[290372] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Maelchon-Mal'Ganis",
					["npcID"] = 0,
				},
				[265495] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[289349] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ikalo-Zul'jin",
					["npcID"] = 0,
				},
				[62124] = {
					["encounterID"] = 2086,
					["source"] = "Thalron",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[297995] = {
					["source"] = "Ázazyel",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[312677] = {
					["source"] = "Tidal Corruptor",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 153910,
				},
				[408] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Crushhero-Zul'jin",
					["npcID"] = 0,
				},
				[296003] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Flexheal-Zul'jin",
					["npcID"] = 0,
				},
				[6788] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Jazlah-Illidan",
					["npcID"] = 0,
				},
				[260881] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cãhuna-Thrall",
					["npcID"] = 0,
				},
				[32752] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[193356] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wantêd-Illidan",
					["npcID"] = 0,
				},
				[1706] = {
					["source"] = "Celaste-LaughingSkull",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[86603] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 68137,
				},
				[199736] = {
					["source"] = "Inserrection-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[119611] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Saladin-Bonechewer",
					["npcID"] = 0,
				},
				[115181] = {
					["source"] = "Dionysús-Malfurion",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[280653] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cbegswar-BleedingHollow",
					["npcID"] = 0,
				},
				[312720] = {
					["source"] = "Lost Guardian",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 153826,
				},
				[17253] = {
					["source"] = "Giggles",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 14228,
				},
				[193357] = {
					["source"] = "Otters-Eonar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280654] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Freida-AeriePeak",
					["npcID"] = 0,
				},
				[313918] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hellriderr-Arthas",
					["npcID"] = 0,
				},
				[71507] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Orgrimmar Wind Rider",
					["npcID"] = 51346,
				},
				[90361] = {
					["encounterID"] = 2086,
					["source"] = "Spirit Beast",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 110340,
				},
				[262232] = {
					["source"] = "Dahreon-Stormreaver",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272979] = {
					["source"] = "Ironmade-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[115006] = {
					["source"] = "Hozen Gutripper",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 58943,
				},
				[193358] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sauzey",
					["npcID"] = 0,
				},
				[203849] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Gnominatrix",
					["npcID"] = 0,
				},
				[286587] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Assoka-Drakkari",
					["npcID"] = 0,
				},
				[47540] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Jazlah-Illidan",
					["npcID"] = 0,
				},
				[317503] = {
					["source"] = "Depthsborn Binder",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 154200,
				},
				[272469] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Abyssal Reach",
					["npcID"] = 138538,
				},
				[196941] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Nimetz-Azralon",
					["npcID"] = 0,
				},
				[314618] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Vuk'laz the Earthbreaker",
					["npcID"] = 160970,
				},
				[193359] = {
					["source"] = "Otters-Eonar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297034] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jáydee",
					["npcID"] = 0,
				},
				[251187] = {
					["source"] = "Toxic Saurid",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 128435,
				},
				[280661] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Absorb-o-Tron",
					["npcID"] = 143985,
				},
				[116670] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Saladin-Bonechewer",
					["npcID"] = 0,
				},
				[297035] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Starbuk-Kargath",
					["npcID"] = 0,
				},
				[1766] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lunareste",
					["npcID"] = 0,
				},
				[40120] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Starsurgeon-Zul'jin",
					["npcID"] = 0,
				},
				[280149] = {
					["source"] = "Hellgôre",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[317506] = {
					["source"] = "Depthsborn Binder",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 154200,
				},
				[251188] = {
					["source"] = "Toxic Saurid",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 128435,
				},
				[297037] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Eleious-Zul'jin",
					["npcID"] = 0,
				},
				[194384] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jazlah-Illidan",
					["npcID"] = 0,
				},
				[188499] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Taldreil-Zul'jin",
					["npcID"] = 0,
				},
				[268893] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lunareste",
					["npcID"] = 0,
				},
				[275544] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Heartbeatz-Tichondrius",
					["npcID"] = 0,
				},
				[316996] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sun Prophet Tenhamen",
					["npcID"] = 154727,
				},
				[203852] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Garto-Tanaris",
					["npcID"] = 0,
				},
				[289362] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Flamejob-Kel'Thuzad",
					["npcID"] = 0,
				},
				[212552] = {
					["source"] = "Ahriak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[184662] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Christmasnub-Tichondrius",
					["npcID"] = 0,
				},
				[297039] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Frznspirit",
					["npcID"] = 0,
				},
				[272987] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Haleios-Sargeras",
					["npcID"] = 0,
				},
				[115008] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tarkkick",
					["npcID"] = 0,
				},
				[47541] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Puppetchill-Illidan",
					["npcID"] = 0,
				},
				[297040] = {
					["source"] = "Bubblexone",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5221] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Freida-AeriePeak",
					["npcID"] = 0,
				},
				[269406] = {
					["npcID"] = 134419,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Titan Keeper Hezrel",
					["encounterID"] = 2123,
				},
				[125883] = {
					["source"] = "Sunwukhong-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288853] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Clapedcheeks-Rivendare",
					["npcID"] = 0,
				},
				[260402] = {
					["type"] = "BUFF",
					["source"] = "Vverr-Illidan",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1822] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Freida-AeriePeak",
					["npcID"] = 0,
				},
				[122301] = {
					["source"] = "Water Sprite",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 62930,
				},
				[255372] = {
					["encounterID"] = 2086,
					["source"] = "Rezan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 122963,
				},
				[29120] = {
					["source"] = "Honor Hold Archer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 16896,
				},
				[53600] = {
					["source"] = "Thalron",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[259358] = {
					["source"] = "Rhothomir",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[260843] = {
					["source"] = "Jahden Fla",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 122704,
				},
				[252215] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Crimson Cultist",
					["npcID"] = 138274,
				},
				[5277] = {
					["source"] = "Flawlyss-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[82326] = {
					["source"] = "Bophercherry",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[252216] = {
					["source"] = "Govinda",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268898] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Saiyori",
					["npcID"] = 0,
				},
				[303698] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Autofill-Thrall",
					["npcID"] = 0,
				},
				[8679] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Clasturavin-Zul'jin",
					["npcID"] = 0,
				},
				[40505] = {
					["source"] = "Horde Vanguard",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 156624,
				},
				[268899] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ronfreezly-Illidan",
					["npcID"] = 0,
				},
				[257418] = {
					["source"] = "Adrewyn-Dalaran",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1850] = {
					["source"] = "Sèetah",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[55090] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Puppetchill-Illidan",
					["npcID"] = 0,
				},
				[116] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rynosia-Thrall",
					["npcID"] = 0,
				},
				[51124] = {
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["encounterID"] = 1106,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[205351] = {
					["encounterID"] = 2086,
					["source"] = "Celaste-LaughingSkull",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[546] = {
					["source"] = "Fhaykum",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[17364] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mjiollnir-BleedingHollow",
					["npcID"] = 0,
				},
				[279302] = {
					["encounterID"] = 1106,
					["source"] = "Ahriak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[205648] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mjiollnir-BleedingHollow",
					["npcID"] = 0,
				},
				[256138] = {
					["source"] = "Dazar'ai Honor Guard",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 127799,
				},
				[31935] = {
					["source"] = "Ironmade-Thrall",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[111400] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[115192] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lunareste",
					["npcID"] = 0,
				},
				[294232] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257161] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Faithless Stalker",
					["npcID"] = 129647,
				},
				[297989] = {
					["source"] = "Blindfish",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[278931] = {
					["type"] = "BUFF",
					["source"] = "Hungryorphan-Frostmourne",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[175456] = {
					["source"] = "Snowbird-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268904] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sunspot-Arthas",
					["npcID"] = 0,
				},
				[316744] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jáydee",
					["npcID"] = 0,
				},
				[312915] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Monjaro-BleedingHollow",
					["npcID"] = 0,
				},
				[279584] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Taldreil-Zul'jin",
					["npcID"] = 0,
				},
				[268905] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sunspot-Arthas",
					["npcID"] = 0,
				},
				[107079] = {
					["source"] = "Flawlyss-Arthas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[106951] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Leecoli-Kilrogg",
					["npcID"] = 0,
				},
				[70233] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bothered",
					["npcID"] = 0,
				},
				[121536] = {
					["source"] = "Kezma",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[274447] = {
					["type"] = "BUFF",
					["source"] = "Vverr-Illidan",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280165] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Freida-AeriePeak",
					["npcID"] = 0,
				},
				[206930] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ikalo-Zul'jin",
					["npcID"] = 0,
				},
				[134340] = {
					["source"] = "Rotrin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[15284] = {
					["source"] = "Unbound Centurion",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 68176,
				},
				[11366] = {
					["encounterID"] = 2086,
					["source"] = "Gwenevare-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[156779] = {
					["source"] = "Qballz-Destromath",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[89808] = {
					["source"] = "Gible",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 58959,
				},
				[205473] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rynosia-Thrall",
					["npcID"] = 0,
				},
				[213405] = {
					["source"] = "Zahmerdh",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[71769] = {
					["type"] = "BUFF",
					["source"] = "The Lich King",
					["encounterID"] = 1106,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 36597,
				},
				[20549] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Whípple-Mal'Ganis",
					["npcID"] = 0,
				},
				[223819] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Krystynna-Illidan",
					["npcID"] = 0,
				},
				[209746] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Themaster-Ragnaros",
					["npcID"] = 0,
				},
				[70234] = {
					["source"] = "Dovehunter-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295521] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Statue",
					["npcID"] = 151603,
				},
				[203233] = {
					["source"] = "Ñébuleuse-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[152175] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Assoka-Drakkari",
					["npcID"] = 0,
				},
				[249919] = {
					["encounterID"] = 2087,
					["source"] = "Yazma",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 122968,
				},
				[268911] = {
					["source"] = "Ironmade-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[260666] = {
					["source"] = "Gilded Priestess",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 132126,
				},
				[245389] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Lunareste",
					["npcID"] = 0,
				},
				[11426] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Aesse",
					["npcID"] = 0,
				},
				[122] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Aesse",
					["npcID"] = 0,
				},
				[312411] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ikalo-Zul'jin",
					["npcID"] = 0,
				},
				[278124] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Melvinmoose-Zul'jin",
					["npcID"] = 0,
				},
				[278874] = {
					["source"] = "Fhaykum",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[192082] = {
					["source"] = "Wind Rush Totem",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 97285,
				},
				[260667] = {
					["source"] = "Gilded Priestess",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 132126,
				},
				[109128] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[70235] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sistersharp-Illidan",
					["npcID"] = 0,
				},
				[191837] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Saladin-Bonechewer",
					["npcID"] = 0,
				},
				[312413] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Amathet Zealot",
					["npcID"] = 151801,
				},
				[261947] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Assoka-Drakkari",
					["npcID"] = 0,
				},
				[305249] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Amoreiel-Daggerspine",
					["npcID"] = 0,
				},
				[287338] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Déjà-Aegwynn",
					["npcID"] = 0,
				},
				[260668] = {
					["source"] = "Gilded Priestess",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 132126,
				},
				[317020] = {
					["source"] = "Sravone-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[246851] = {
					["type"] = "BUFF",
					["source"] = "Fanatixxh-BleedingHollow",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[134522] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Taress-Dalaran",
					["npcID"] = 0,
				},
				[279664] = {
					["encounterID"] = 2086,
					["source"] = "Vanquished Tendril of G'huun",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 143520,
				},
				[49143] = {
					["encounterID"] = 1106,
					["source"] = "Ahriak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[116841] = {
					["source"] = "Sunwukhong-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[53365] = {
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["encounterID"] = 1106,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[13877] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wantêd-Illidan",
					["npcID"] = 0,
				},
				[313136] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Acolyte Taspu",
					["npcID"] = 157170,
				},
				[246852] = {
					["type"] = "BUFF",
					["source"] = "Fanatixxh-BleedingHollow",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[305252] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Amoreiel-Daggerspine",
					["npcID"] = 0,
				},
				[279913] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[8004] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wurrzaag-Gilneas",
					["npcID"] = 0,
				},
				[19750] = {
					["source"] = "Chanuka-Zul'jin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[17735] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Klathtaz",
					["npcID"] = 1860,
				},
				[17767] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Klathtaz",
					["npcID"] = 1860,
				},
				[298601] = {
					["source"] = "Fhaykum",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[246853] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Whípple-Mal'Ganis",
					["npcID"] = 0,
				},
				[191840] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Saladin-Bonechewer",
					["npcID"] = 0,
				},
				[17] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jazlah-Illidan",
					["npcID"] = 0,
				},
				[65410] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lightpatches-Ravenholdt",
					["npcID"] = 0,
				},
				[302943] = {
					["source"] = "Zanj'ir Trapper",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 153962,
				},
				[86606] = {
					["source"] = "Krolusk Sandhunter",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 135582,
				},
				[197214] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mjiollnir-BleedingHollow",
					["npcID"] = 0,
				},
				[266083] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Vathikur",
					["npcID"] = 130401,
				},
				[302964] = {
					["source"] = "Ma'haat the Indomitable",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 151739,
				},
				[295533] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 151603,
				},
				[305395] = {
					["source"] = "Silverstrk-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[284275] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Eree-Dalaran",
					["npcID"] = 0,
				},
				[24450] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 66164,
				},
				[280177] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fæk",
					["npcID"] = 0,
				},
				[83242] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Whípple-Mal'Ganis",
					["npcID"] = 0,
				},
				[303211] = {
					["source"] = "Lumiae",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288882] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Haleios-Sargeras",
					["npcID"] = 0,
				},
				[188838] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Karlurn-BleedingHollow",
					["npcID"] = 0,
				},
				[303344] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Puppetchill-Illidan",
					["npcID"] = 0,
				},
				[12294] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[102383] = {
					["source"] = "Ttvtettles-Zul'jin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[198817] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[45242] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jazlah-Illidan",
					["npcID"] = 0,
				},
				[209754] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kaedash-Khaz'goroth",
					["npcID"] = 0,
				},
				[191587] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Esov-Illidan",
					["npcID"] = 0,
				},
				[130] = {
					["source"] = "Gwenevare-WyrmrestAccord",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279673] = {
					["type"] = "BUFF",
					["source"] = "Skof-Aegwynn",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298606] = {
					["source"] = "Toter-Bloodhoof",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[300142] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Brionac-Arthas",
					["npcID"] = 0,
				},
				[281209] = {
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["encounterID"] = 1106,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2096] = {
					["source"] = "Furshadow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[258883] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Yungs-Zul'jin",
					["npcID"] = 0,
				},
				[95826] = {
					["source"] = "Horde Vanguard",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 156624,
				},
				[102351] = {
					["source"] = "Zdune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[202335] = {
					["source"] = "Dionysús-Malfurion",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[116680] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Saladin-Bonechewer",
					["npcID"] = 0,
				},
				[2120] = {
					["source"] = "Gwenevare-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[133] = {
					["encounterID"] = 2086,
					["source"] = "Gwenevare-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[316522] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Esov-Illidan",
					["npcID"] = 0,
				},
				[118000] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Doinkster-Mal'Ganis",
					["npcID"] = 0,
				},
				[109132] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kthxbai-BleedingHollow",
					["npcID"] = 0,
				},
				[233395] = {
					["source"] = "Gommerr",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[255558] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[255814] = {
					["source"] = "Reanimated Honor Guard",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 127757,
				},
				[249929] = {
					["type"] = "DEBUFF",
					["source"] = "Zahmerdh",
					["encounterID"] = 2087,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[132480] = {
					["source"] = "Donisaur-BleedingHollow",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[288371] = {
					["type"] = "DEBUFF",
					["source"] = "Celaste-LaughingSkull",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[294519] = {
					["source"] = "Crazed Earth Rager",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 151638,
				},
				[114250] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Flamejob-Kel'Thuzad",
					["npcID"] = 0,
				},
				[136] = {
					["source"] = "Cerbi-Sargeras",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[85256] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Frogy-Agamaggan",
					["npcID"] = 0,
				},
				[302917] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Doinkster-Mal'Ganis",
					["npcID"] = 0,
				},
				[211805] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Déjà-Aegwynn",
					["npcID"] = 0,
				},
				[215387] = {
					["source"] = "Kheldoran",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[106830] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Freida-AeriePeak",
					["npcID"] = 0,
				},
				[278145] = {
					["source"] = "Sathaendor",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[244813] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Brionac-Arthas",
					["npcID"] = 0,
				},
				[284277] = {
					["source"] = "Litbadjr-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[269843] = {
					["npcID"] = 133007,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Unbound Abomination",
					["encounterID"] = 2123,
				},
				[246152] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Quickranger-Bloodhoof",
					["npcID"] = 0,
				},
				[62061] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wojö",
					["npcID"] = 0,
				},
				[139] = {
					["source"] = "Dhuum",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[244808] = {
					["source"] = "Sandclaw Crab",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 145337,
				},
				[278147] = {
					["source"] = "Sathaendor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297082] = {
					["source"] = "Minuét-Quel'Thalas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[8936] = {
					["source"] = "Ipunishcatz",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[108366] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Leveathan-Aggramar",
					["npcID"] = 0,
				},
				[256148] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Lunareste",
					["npcID"] = 0,
				},
				[117952] = {
					["source"] = "Dionysús-Malfurion",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[270330] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Azerite Chunk",
					["npcID"] = 136722,
				},
				[2061] = {
					["source"] = "Furshadow",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[1784] = {
					["source"] = "Nello-Norgannon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267374] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 135976,
				},
				[1022] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Frogy-Agamaggan",
					["npcID"] = 0,
				},
				[192106] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Shakal-Andorhal",
					["npcID"] = 0,
				},
				[297088] = {
					["source"] = "Hellenkìller-Thrall",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[280709] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[34433] = {
					["encounterID"] = 2086,
					["source"] = "Celaste-LaughingSkull",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[207203] = {
					["source"] = "Veíl-Stormreaver",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[258889] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Faithless Skycaller",
					["npcID"] = 122746,
				},
				[193641] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lunareste",
					["npcID"] = 0,
				},
				[270987] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 120949,
				},
				[194153] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Define-Mal'Ganis",
					["npcID"] = 0,
				},
				[61684] = {
					["type"] = "BUFF",
					["source"] = "johnny",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 124527,
				},
				[257099] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Siperkasa-Arthas",
					["npcID"] = 0,
				},
				[90328] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 151133,
				},
				[217694] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Brionac-Arthas",
					["npcID"] = 0,
				},
				[179057] = {
					["source"] = "Zahmerdh",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[70242] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Crossgrip-Thrall",
					["npcID"] = 0,
				},
				[41187] = {
					["source"] = "Ashtongue Primalist",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 68096,
				},
				[77535] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ikalo-Zul'jin",
					["npcID"] = 0,
				},
				[286342] = {
					["type"] = "BUFF",
					["source"] = "Celaste-LaughingSkull",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297089] = {
					["source"] = "Minuét-Quel'Thalas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[54149] = {
					["source"] = "Sathaendor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[105809] = {
					["source"] = "Sathaendor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[12042] = {
					["source"] = "Eldra",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[45181] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Lunareste",
					["npcID"] = 0,
				},
				[220510] = {
					["source"] = "Decisïonz",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[259455] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Alesso",
					["npcID"] = 0,
				},
				[6789] = {
					["source"] = "Hungryorphan-Frostmourne",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[70244] = {
					["source"] = "Xndrya",
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
					["source"] = "Kezma",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[213858] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Doinkster-Mal'Ganis",
					["npcID"] = 0,
				},
				[70243] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zinfel-Zul'jin",
					["npcID"] = 0,
				},
				[195949] = {
					["source"] = "Wintergrasp-Turalyon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[260734] = {
					["source"] = "Dacorr-ShatteredHand",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280205] = {
					["source"] = "Amaiko",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[208997] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[202346] = {
					["source"] = "Dionysús-Malfurion",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[13750] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wantêd-Illidan",
					["npcID"] = 0,
				},
				[198764] = {
					["source"] = "Echo of Chi-Ji",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 152895,
				},
				[199786] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Aesse",
					["npcID"] = 0,
				},
				[126664] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[270070] = {
					["source"] = "Flawlyss-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[190319] = {
					["type"] = "BUFF",
					["source"] = "Gwenevare-WyrmrestAccord",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[182387] = {
					["source"] = "Dacorr-ShatteredHand",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[190831] = {
					["source"] = "Azzorahai-Kel'Thuzad",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[260685] = {
					["type"] = "DEBUFF",
					["source"] = "Elder Leaxa",
					["npcID"] = 131318,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2111,
				},
				[275699] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Puppetchill-Illidan",
					["npcID"] = 0,
				},
				[51514] = {
					["source"] = "Fhaykum",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[270997] = {
					["source"] = "Frenzied Ranishu",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 137208,
				},
				[281744] = {
					["source"] = "Zdune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[202602] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Skyhooker-Zul'jin",
					["npcID"] = 0,
				},
				[268439] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Freida-AeriePeak",
					["npcID"] = 0,
				},
				[281178] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sunspot-Arthas",
					["npcID"] = 0,
				},
				[294027] = {
					["type"] = "BUFF",
					["source"] = "Thalron",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2484] = {
					["source"] = "Dacorr-ShatteredHand",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[205929] = {
					["source"] = "Krunkadunk",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[25771] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Frogy-Agamaggan",
					["npcID"] = 0,
				},
				[35778] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 20134,
				},
				[302912] = {
					["source"] = "Zanj'ir Trapper",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 153962,
				},
				[100784] = {
					["source"] = "Hecatè-Malfurion",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[268953] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[104276] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xpression-Mal'Ganis",
					["npcID"] = 0,
				},
				[115151] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Saladin-Bonechewer",
					["npcID"] = 0,
				},
				[268955] = {
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["encounterID"] = 1106,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268954] = {
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["encounterID"] = 1106,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[261711] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Krolusk Dunemite",
					["npcID"] = 133234,
				},
				[316036] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[198766] = {
					["source"] = "Echo of Chi-Ji",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 152895,
				},
				[93402] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Define-Mal'Ganis",
					["npcID"] = 0,
				},
				[296779] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wudie-Mal'Ganis",
					["npcID"] = 0,
				},
				[116858] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[268532] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Frogy-Agamaggan",
					["npcID"] = 0,
				},
				[49020] = {
					["encounterID"] = 1106,
					["source"] = "Ahriak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[261712] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Saltspine Krolusk",
					["npcID"] = 124016,
				},
				[301693] = {
					["source"] = "Fhaykum",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[281240] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Aesse",
					["npcID"] = 0,
				},
				[299662] = {
					["source"] = "Blindfish",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[300174] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bacata-Dalaran",
					["npcID"] = 0,
				},
				[80353] = {
					["type"] = "BUFF",
					["source"] = "Brionac-Arthas",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2123,
				},
				[264352] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Elhfireah",
					["npcID"] = 0,
				},
				[45438] = {
					["source"] = "Evilinferno-Aggramar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[265376] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fanatical Headhunter",
					["npcID"] = 133663,
				},
				[250241] = {
					["type"] = "BUFF",
					["source"] = "Vol'kaal",
					["encounterID"] = 2085,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 122965,
				},
				[24870] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sunspot-Arthas",
					["npcID"] = 0,
				},
				[299664] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Meandmykids-Thrall",
					["npcID"] = 0,
				},
				[265377] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fanatical Headhunter",
					["npcID"] = 133663,
				},
				[265084] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Devout Blood Priest",
					["npcID"] = 131492,
				},
				[268910] = {
					["source"] = "Ironmade-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[35395] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Frogy-Agamaggan",
					["npcID"] = 0,
				},
				[257620] = {
					["source"] = "Vverr-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[317065] = {
					["source"] = "Hunnehbuns-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[215607] = {
					["source"] = "Kheldoran",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[3714] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thialo-Thrall",
					["npcID"] = 0,
				},
				[123725] = {
					["source"] = "Dionysús-Malfurion",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[80354] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Lërne-Zul'jin",
					["npcID"] = 0,
				},
				[297108] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Cbegswar-BleedingHollow",
					["npcID"] = 0,
				},
				[312973] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Suntouched Acolyte",
					["npcID"] = 151960,
				},
				[279709] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Themaster-Ragnaros",
					["npcID"] = 0,
				},
				[300691] = {
					["source"] = "Ertex-Sargeras",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[113746] = {
					["source"] = "Dionysús-Malfurion",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[209261] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Lleeched-Mal'Ganis",
					["npcID"] = 0,
				},
				[296086] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jazlah-Illidan",
					["npcID"] = 0,
				},
				[12743] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 19261,
				},
				[300693] = {
					["source"] = "Scyne-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[270576] = {
					["type"] = "BUFF",
					["source"] = "Vverr-Illidan",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257622] = {
					["source"] = "Vverr-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[31747] = {
					["source"] = "Marauding Crust Burster",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 16857,
				},
				[302816] = {
					["source"] = "Crazed Earth Rager",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 151638,
				},
				[264760] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Novae",
					["npcID"] = 0,
				},
				[273843] = {
					["source"] = "Fhaykum",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[7814] = {
					["source"] = "Sarora",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 1863,
				},
				[53563] = {
					["source"] = "Sathaendor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[276204] = {
					["source"] = "Thalron",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[287062] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Uzimang-Dalaran",
					["npcID"] = 0,
				},
				[312978] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Amathet Lightblade",
					["npcID"] = 151806,
				},
				[196725] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Saladin-Bonechewer",
					["npcID"] = 0,
				},
				[274598] = {
					["source"] = "Gwenevare-WyrmrestAccord",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[172673] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sun Prophet Tenhamen",
					["npcID"] = 154727,
				},
				[138130] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 69792,
				},
				[8921] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Define-Mal'Ganis",
					["npcID"] = 0,
				},
				[137619] = {
					["source"] = "Flawlyss-Arthas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[279715] = {
					["source"] = "Gwenevare-WyrmrestAccord",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[215661] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Augustina-Aegwynn",
					["npcID"] = 0,
				},
				[131222] = {
					["source"] = "Tezlah-Sargeras",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[279204] = {
					["source"] = "Icurus",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[106839] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Freida-AeriePeak",
					["npcID"] = 0,
				},
				[163201] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[297116] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Vindral-Arthas",
					["npcID"] = 0,
				},
				[295137] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rezaria-BurningLegion",
					["npcID"] = 0,
				},
				[317587] = {
					["source"] = "Vil'raxx",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 153326,
				},
				[44544] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rynosia-Thrall",
					["npcID"] = 0,
				},
				[297117] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Namnams-Dalaran",
					["npcID"] = 0,
				},
				[317588] = {
					["source"] = "Vil'raxx",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 153326,
				},
				[24423] = {
					["source"] = "johnny",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 124527,
				},
				[259161] = {
					["source"] = "Zarinisa-Stormreaver",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297118] = {
					["source"] = "Bigbroseidon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[152108] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[255579] = {
					["type"] = "BUFF",
					["source"] = "Priestess Alun'za",
					["encounterID"] = 2084,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 122967,
				},
				[255835] = {
					["type"] = "DEBUFF",
					["source"] = "Priestess Alun'za",
					["encounterID"] = 2084,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 122967,
				},
				[22568] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Freida-AeriePeak",
					["npcID"] = 0,
				},
				[315161] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Cbegswar-BleedingHollow",
					["npcID"] = 0,
				},
				[35013] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Time-Lost Controller",
					["npcID"] = 18327,
				},
				[43265] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ikalo-Zul'jin",
					["npcID"] = 0,
				},
				[236645] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Verthel",
					["npcID"] = 0,
				},
				[6673] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dôbbyy-Arthas",
					["npcID"] = 0,
				},
				[255836] = {
					["type"] = "DEBUFF",
					["source"] = "Priestess Alun'za",
					["encounterID"] = 2084,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 122967,
				},
				[290468] = {
					["source"] = "Altoìd-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[154796] = {
					["source"] = "Wraithion-AltarofStorms",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[132627] = {
					["source"] = "Nootau-Deathwing",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[22888] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[79206] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[280746] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Stridle-BurningLegion",
					["npcID"] = 0,
				},
				[118922] = {
					["source"] = "Fanatixxh-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[61295] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wurrzaag-Gilneas",
					["npcID"] = 0,
				},
				[115078] = {
					["source"] = "Dionysús-Malfurion",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[217200] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Quickranger-Bloodhoof",
					["npcID"] = 0,
				},
				[5782] = {
					["source"] = "Darksouls-TheUnderbog",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[108271] = {
					["source"] = "Dacorr-ShatteredHand",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[258908] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sethrak Invader",
					["npcID"] = 130411,
				},
				[188031] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Alexzánder",
					["npcID"] = 0,
				},
				[253279] = {
					["source"] = "Dazar'ai Juggernaut",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 122971,
				},
				[255582] = {
					["encounterID"] = 2084,
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[270515] = {
					["source"] = "Azerite-Infused Elemental",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 137905,
				},
				[317595] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Watcher Aum-ka",
					["npcID"] = 154619,
				},
				[256350] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thornspine Saurolisk",
					["npcID"] = 127758,
				},
				[258653] = {
					["source"] = "Reanimated Honor Guard",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 127757,
				},
				[288426] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ikalo-Zul'jin",
					["npcID"] = 0,
				},
				[297126] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cbegswar-BleedingHollow",
					["npcID"] = 0,
				},
				[55164] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[19434] = {
					["source"] = "Arentar-Dalaran",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[2948] = {
					["source"] = "Gwenevare-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[316062] = {
					["source"] = "Corrupted Putrefaction",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 158706,
				},
				[180612] = {
					["type"] = "BUFF",
					["source"] = "Ikalo-Zul'jin",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2111,
				},
				[314527] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Vuk'laz the Earthbreaker",
					["npcID"] = 160970,
				},
				[278297] = {
					["source"] = "Ragecow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[138649] = {
					["source"] = "Demonic Gateway",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 70028,
				},
				[57723] = {
					["source"] = "Dragoul-Illidan",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[196414] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[190336] = {
					["source"] = "Gwenevare-WyrmrestAccord",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[139186] = {
					["source"] = "Jubeka Shadowbreaker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 70166,
				},
				[52174] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Battlebull-Madoran",
					["npcID"] = 0,
				},
				[30213] = {
					["source"] = "Zilikferil",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 17252,
				},
				[294571] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 151905,
				},
				[199804] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wantêd-Illidan",
					["npcID"] = 0,
				},
				[198013] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Yungs-Zul'jin",
					["npcID"] = 0,
				},
				[5487] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cleansekin",
					["npcID"] = 0,
				},
				[188290] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ikalo-Zul'jin",
					["npcID"] = 0,
				},
				[79976] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 50012,
				},
				[294966] = {
					["source"] = "Tàlrin-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[190446] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Verthel",
					["npcID"] = 0,
				},
				[211793] = {
					["source"] = "Gommerr",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[119381] = {
					["source"] = "Hecatè-Malfurion",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[264892] = {
					["source"] = "Brother Meller",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 154447,
				},
				[304612] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Rÿlañ-Zul'jin",
					["npcID"] = 0,
				},
				[254958] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 122984,
				},
				[287916] = {
					["source"] = "Skyflux",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[85222] = {
					["source"] = "Sathaendor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[32612] = {
					["source"] = "Sindrablowsa-Kel'Thuzad",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[126] = {
					["source"] = "Rotrin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[154953] = {
					["source"] = "Flawlyss-Arthas",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[233582] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[157331] = {
					["source"] = "Primal Storm Elemental",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 77942,
				},
				[79849] = {
					["source"] = "Gija",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 47248,
				},
				[256099] = {
					["source"] = "Blood Witch Najima",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 122204,
				},
				[256355] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thornspine Saurolisk",
					["npcID"] = 127758,
				},
				[304606] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Rÿlañ-Zul'jin",
					["npcID"] = 0,
				},
				[35079] = {
					["source"] = "Aerospac-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[121557] = {
					["source"] = "Kezma",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[57724] = {
					["source"] = "Shampóò-Illidan",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[61882] = {
					["source"] = "Dacorr-ShatteredHand",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[298151] = {
					["source"] = "Lukassi-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[298710] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Toofâst",
					["npcID"] = 0,
				},
				[277179] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Christmasnub-Tichondrius",
					["npcID"] = 0,
				},
				[12472] = {
					["type"] = "BUFF",
					["source"] = "Sindrablowsa-Kel'Thuzad",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[3716] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Klathtaz",
					["npcID"] = 1860,
				},
				[1856] = {
					["source"] = "Quickkick-Zul'jin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[6262] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[185562] = {
					["source"] = "Thunderclaw",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[304851] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[312526] = {
					["source"] = "Drowned Zealot",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 153956,
				},
				[277181] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Holehunter",
					["npcID"] = 0,
				},
				[302769] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Déjà-Aegwynn",
					["npcID"] = 0,
				},
				[286393] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Frogy-Agamaggan",
					["npcID"] = 0,
				},
				[116705] = {
					["source"] = "Dionysús-Malfurion",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[185736] = {
					["source"] = "Schifoso",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[289976] = {
					["source"] = "Honorbound Grunt",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 154749,
				},
				[199042] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Melvinmoose-Zul'jin",
					["npcID"] = 0,
				},
				[65081] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ordinarymman-Illidan",
					["npcID"] = 0,
				},
				[207230] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Déjà-Aegwynn",
					["npcID"] = 0,
				},
				[259750] = {
					["source"] = "Stormbound Conqueror",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 136555,
				},
				[195182] = {
					["source"] = "Ertex-Sargeras",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[56641] = {
					["source"] = "Arentar-Dalaran",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[300893] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Yungs-Zul'jin",
					["npcID"] = 0,
				},
				[255591] = {
					["encounterID"] = 2084,
					["source"] = "Priestess Alun'za",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 122967,
				},
				[185763] = {
					["source"] = "Otters-Eonar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268998] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Brionac-Arthas",
					["npcID"] = 0,
				},
				[277185] = {
					["source"] = "Kelbae",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[23881] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Doinkster-Mal'Ganis",
					["npcID"] = 0,
				},
				[207744] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Traplifé-Azralon",
					["npcID"] = 0,
				},
				[257127] = {
					["source"] = "Civsis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[277186] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 136550,
				},
				[115546] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fairin-Akama",
					["npcID"] = 0,
				},
				[312523] = {
					["source"] = "Living Infestation",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 153906,
				},
				[196741] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Assoka-Drakkari",
					["npcID"] = 0,
				},
				[271046] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Saltspine Krolusk",
					["npcID"] = 124016,
				},
				[221562] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ikalo-Zul'jin",
					["npcID"] = 0,
				},
				[302775] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Brionac-Arthas",
					["npcID"] = 0,
				},
				[265931] = {
					["type"] = "DEBUFF",
					["source"] = "Skof-Aegwynn",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[313014] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Suntouched Falcon",
					["npcID"] = 151811,
				},
				[69489] = {
					["source"] = "Labbao",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[198533] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 60849,
				},
				[196742] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Assoka-Drakkari",
					["npcID"] = 0,
				},
				[260455] = {
					["npcID"] = 132051,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Unknown",
					["encounterID"] = 2118,
				},
				[269513] = {
					["source"] = "Flawlyss-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[258920] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Taldreil-Zul'jin",
					["npcID"] = 0,
				},
				[280772] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Doinkster-Mal'Ganis",
					["npcID"] = 0,
				},
				[84714] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ronfreezly-Illidan",
					["npcID"] = 0,
				},
				[315573] = {
					["source"] = "Ironmade-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[255852] = {
					["source"] = "Snowdrift Prowler",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 136690,
				},
				[280773] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Doinkster-Mal'Ganis",
					["npcID"] = 0,
				},
				[70774] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Partridge",
					["npcID"] = 0,
				},
				[277703] = {
					["type"] = "DEBUFF",
					["source"] = "Gwenevare-WyrmrestAccord",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[306873] = {
					["source"] = "Rijz'x the Devourer",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 154490,
				},
				[124503] = {
					["source"] = "Dionysús-Malfurion",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[277192] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Skithis the Infused",
					["npcID"] = 136732,
				},
				[190356] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ronfreezly-Illidan",
					["npcID"] = 0,
				},
				[157348] = {
					["source"] = "Primal Storm Elemental",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 77942,
				},
				[313017] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Solar Orb",
					["npcID"] = 160803,
				},
				[285381] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Freida-AeriePeak",
					["npcID"] = 0,
				},
				[201350] = {
					["source"] = "Quappiedh",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[252781] = {
					["source"] = "Zanchuli Witch-Doctor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 122969,
				},
				[280776] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cbegswar-BleedingHollow",
					["npcID"] = 0,
				},
				[288455] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[277706] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[186254] = {
					["source"] = "Fayia-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[115804] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[205708] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Rynosia-Thrall",
					["npcID"] = 0,
				},
				[208772] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Heartbeatz-Tichondrius",
					["npcID"] = 0,
				},
				[294595] = {
					["source"] = "Fhaykum",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[70771] = {
					["source"] = "Xndrya",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[85739] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Doinkster-Mal'Ganis",
					["npcID"] = 0,
				},
				[197003] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rumbawls-LaughingSkull",
					["npcID"] = 0,
				},
				[147362] = {
					["source"] = "Aerospac-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[198793] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Óle",
					["npcID"] = 0,
				},
				[137639] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Assoka-Drakkari",
					["npcID"] = 0,
				},
				[3408] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nüll-Thrall",
					["npcID"] = 0,
				},
				[224125] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 100820,
				},
				[272592] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Faceless Corruptor",
					["npcID"] = 138281,
				},
				[96231] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Pigeonwat-Alleria",
					["npcID"] = 0,
				},
				[278736] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Eleious-Zul'jin",
					["npcID"] = 0,
				},
				[281302] = {
					["source"] = "Donisaur-BleedingHollow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[48707] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ikalo-Zul'jin",
					["npcID"] = 0,
				},
				[277199] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Skithis the Infused",
					["npcID"] = 136732,
				},
				[81262] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 47649,
				},
				[258925] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ilgynoth-Tanaris",
					["npcID"] = 0,
				},
				[303299] = {
					["source"] = "Tidemistress Ethendriss",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 153934,
				},
				[228477] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Traplifé-Azralon",
					["npcID"] = 0,
				},
				[272090] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[186257] = {
					["type"] = "BUFF",
					["source"] = "Vverr-Illidan",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[256111] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Faithless Centurion",
					["npcID"] = 129774,
				},
				[275672] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Doinkster-Mal'Ganis",
					["npcID"] = 0,
				},
				[205448] = {
					["encounterID"] = 2086,
					["source"] = "Celaste-LaughingSkull",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[200587] = {
					["source"] = "Darksouls-TheUnderbog",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[303301] = {
					["source"] = "Azsh'ari Siegemistress",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 150508,
				},
				[51714] = {
					["type"] = "DEBUFF",
					["source"] = "Ahriak",
					["encounterID"] = 1106,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298700] = {
					["source"] = "Thepots-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[186258] = {
					["source"] = "Taleon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[202636] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Helltaurus",
					["npcID"] = 0,
				},
				[290512] = {
					["source"] = "Sädä-Malfurion",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[225919] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Traplifé-Azralon",
					["npcID"] = 0,
				},
				[242551] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nitrotaco-Sargeras",
					["npcID"] = 0,
				},
				[124506] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fairin-Akama",
					["npcID"] = 0,
				},
				[68981] = {
					["type"] = "BUFF",
					["source"] = "The Lich King",
					["encounterID"] = 1106,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 36597,
				},
				[226943] = {
					["type"] = "DEBUFF",
					["source"] = "Celaste-LaughingSkull",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[265946] = {
					["source"] = "Flawlyss-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288803] = {
					["type"] = "BUFF",
					["source"] = "Gwenevare-WyrmrestAccord",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275158] = {
					["source"] = "Zujothgul",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 128578,
				},
				[80240] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[133806] = {
					["source"] = "Rotrin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[225921] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Traplifé-Azralon",
					["npcID"] = 0,
				},
				[297162] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cbegswar-BleedingHollow",
					["npcID"] = 0,
				},
				[296138] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Faelenus",
					["npcID"] = 0,
				},
				[255858] = {
					["source"] = "Starving Darkmaw",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 137461,
				},
				[44614] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Verthel",
					["npcID"] = 0,
				},
				[24394] = {
					["source"] = "Spirit Beast",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 110340,
				},
				[36554] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lunareste",
					["npcID"] = 0,
				},
				[313030] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Suntouched Acolyte",
					["npcID"] = 151960,
				},
				[191634] = {
					["source"] = "Dacorr-ShatteredHand",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[49028] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ikalo-Zul'jin",
					["npcID"] = 0,
				},
				[55233] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ikalo-Zul'jin",
					["npcID"] = 0,
				},
				[224126] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 100820,
				},
				[8219] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Flüsh",
					["npcID"] = 0,
				},
				[280780] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Quickranger-Bloodhoof",
					["npcID"] = 0,
				},
				[3600] = {
					["source"] = "Earthbind Totem",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 2630,
				},
				[298703] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Braelight-Zul'jin",
					["npcID"] = 0,
				},
				[297168] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cbegswar-BleedingHollow",
					["npcID"] = 0,
				},
				[256108] = {
					["source"] = "Blood Bonepicker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 122636,
				},
				[271581] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Frogy-Agamaggan",
					["npcID"] = 0,
				},
				[300751] = {
					["source"] = "Highcharity",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[288981] = {
					["source"] = "Zaràki",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[130265] = {
					["source"] = "Thunder Hold Soldier",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 66291,
				},
				[5215] = {
					["source"] = "Jnxius-Skywall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[32645] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lunareste",
					["npcID"] = 0,
				},
				[259187] = {
					["encounterID"] = 2087,
					["source"] = "Yazma",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 122968,
				},
				[271071] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Saiyori",
					["npcID"] = 0,
				},
				[277724] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kaedash-Khaz'goroth",
					["npcID"] = 0,
				},
				[186263] = {
					["source"] = "Celaste-LaughingSkull",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[131493] = {
					["source"] = "Marinajoyce-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[112866] = {
					["source"] = "Hungryorphan-Frostmourne",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[131894] = {
					["source"] = "Arentar-Dalaran",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[268956] = {
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["encounterID"] = 1106,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[264420] = {
					["source"] = "Alibast-Thunderhorn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[122278] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Takuetsukaze-BleedingHollow",
					["npcID"] = 0,
				},
				[138927] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Arabella-Mal'Ganis",
					["npcID"] = 0,
				},
				[87023] = {
					["type"] = "DEBUFF",
					["source"] = "Gwenevare-WyrmrestAccord",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272609] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Faceless Corruptor",
					["npcID"] = 138281,
				},
				[130266] = {
					["source"] = "Thunder Hold Soldier",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 66200,
				},
				[298197] = {
					["source"] = "Ironmade-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280286] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Verthel",
					["npcID"] = 0,
				},
				[271550] = {
					["source"] = "Studdnmuffin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[31687] = {
					["source"] = "Sindrablowsa-Kel'Thuzad",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[303731] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ghostlyhero-ScarletCrusade",
					["npcID"] = 0,
				},
				[186265] = {
					["source"] = "Aerospac-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[152173] = {
					["source"] = "Hecatè-Malfurion",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[204157] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Traplifé-Azralon",
					["npcID"] = 0,
				},
				[195457] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hellions-BurningLegion",
					["npcID"] = 0,
				},
				[51460] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Esov-Illidan",
					["npcID"] = 0,
				},
				[288988] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wantêd-Illidan",
					["npcID"] = 0,
				},
				[271077] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Brine Beetle",
					["npcID"] = 124019,
				},
				[81256] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ikalo-Zul'jin",
					["npcID"] = 0,
				},
				[87024] = {
					["source"] = "Kyerk-Thrall",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279572] = {
					["type"] = "BUFF",
					["source"] = "Celaste-LaughingSkull",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[156073] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zhubin",
					["npcID"] = 0,
				},
				[277731] = {
					["source"] = "Flawlyss-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[264314] = {
					["source"] = "Brutalize-Cho'gall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[278755] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Befouled Spirit",
					["npcID"] = 133685,
				},
				[69369] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Freida-AeriePeak",
					["npcID"] = 0,
				},
				[253562] = {
					["source"] = "Dazar'ai Augur",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 122972,
				},
				[300761] = {
					["source"] = "Darksouls-TheUnderbog",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[768] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Novae",
					["npcID"] = 0,
				},
				[29893] = {
					["source"] = "Hungryorphan-Frostmourne",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[210294] = {
					["source"] = "Sathaendor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[300762] = {
					["source"] = "Scyne-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[270371] = {
					["source"] = "Bilgewater Incinerator",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 135541,
				},
				[210320] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jáydee",
					["npcID"] = 0,
				},
				[199545] = {
					["source"] = "Thalron",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[270058] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cuetip-Thrall",
					["npcID"] = 0,
				},
				[119905] = {
					["source"] = "Hungryorphan-Frostmourne",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[1680] = {
					["source"] = "Dahreon-Stormreaver",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[219788] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ikalo-Zul'jin",
					["npcID"] = 0,
				},
				[198121] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Verthel",
					["npcID"] = 0,
				},
				[210065] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xhapes-Icecrown",
					["npcID"] = 0,
				},
				[84963] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Pigeonwat-Alleria",
					["npcID"] = 0,
				},
				[275689] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Doinkster-Mal'Ganis",
					["npcID"] = 0,
				},
				[201846] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mjiollnir-BleedingHollow",
					["npcID"] = 0,
				},
				[290467] = {
					["source"] = "Mômô-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[112869] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Megadoodoo-Tichondrius",
					["npcID"] = 0,
				},
				[15286] = {
					["type"] = "BUFF",
					["source"] = "Celaste-LaughingSkull",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[278249] = {
					["type"] = "BUFF",
					["source"] = "Aerospac-Illidan",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[154797] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Demobabe-Stormrage",
					["npcID"] = 0,
				},
				[269038] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[312537] = {
					["source"] = "Tidal Corruptor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 153910,
				},
				[17962] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[255577] = {
					["type"] = "BUFF",
					["source"] = "Priestess Alun'za",
					["encounterID"] = 2084,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 122967,
				},
				[81141] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ikalo-Zul'jin",
					["npcID"] = 0,
				},
				[49862] = {
					["source"] = "Achilios",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[292580] = {
					["source"] = "Fhaykum",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268528] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Frogy-Agamaggan",
					["npcID"] = 0,
				},
				[278379] = {
					["source"] = "Thalron",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[294116] = {
					["source"] = "Fhaykum",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[276205] = {
					["type"] = "BUFF",
					["source"] = "Thalron",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[35917] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 20135,
				},
				[227723] = {
					["source"] = "Zarinisa-Stormreaver",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[123981] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Ikalo-Zul'jin",
					["npcID"] = 0,
				},
				[276206] = {
					["source"] = "Thalron",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[319237] = {
					["source"] = "Sebârt-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[287790] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Starsurgeon-Zul'jin",
					["npcID"] = 0,
				},
				[7870] = {
					["source"] = "Sarora",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 1863,
				},
				[276207] = {
					["type"] = "BUFF",
					["source"] = "Thalron",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[98008] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[256382] = {
					["source"] = "Mountain Greatstag",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 127806,
				},
				[2580] = {
					["source"] = "Dragoul-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[276208] = {
					["type"] = "BUFF",
					["source"] = "Thalron",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[278767] = {
					["source"] = "Padop-Stormrage",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[138680] = {
					["source"] = "Rotrin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[152279] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Déjà-Aegwynn",
					["npcID"] = 0,
				},
				[276209] = {
					["type"] = "BUFF",
					["source"] = "Thalron",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[303332] = {
					["source"] = "Rijz'x the Devourer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 154490,
				},
				[312964] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Suntouched Acolyte",
					["npcID"] = 151960,
				},
				[215652] = {
					["source"] = "Lightmaden-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[276210] = {
					["source"] = "Thalron",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[278769] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Traplifé-Azralon",
					["npcID"] = 0,
				},
				[257407] = {
					["encounterID"] = 2086,
					["source"] = "Rezan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 122963,
				},
				[198300] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mjiollnir-BleedingHollow",
					["npcID"] = 0,
				},
				[276211] = {
					["source"] = "Thalron",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[255824] = {
					["source"] = "Dazar'ai Juggernaut",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 122971,
				},
				[195181] = {
					["source"] = "Ertex-Sargeras",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[197277] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Frogy-Agamaggan",
					["npcID"] = 0,
				},
				[317563] = {
					["source"] = "Vil'raxx",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 153326,
				},
				[280204] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Taldreil-Zul'jin",
					["npcID"] = 0,
				},
				[257408] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Gena-Wildhammer",
					["npcID"] = 0,
				},
				[139142] = {
					["source"] = "Kanrethad Ebonlocke",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 69964,
				},
				[83958] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ellesmêre",
					["npcID"] = 0,
				},
				[313571] = {
					["type"] = "BUFF",
					["source"] = "Ahriak",
					["encounterID"] = 1106,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[139141] = {
					["source"] = "Kanrethad Ebonlocke",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 69964,
				},
				[281843] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ilgynoth-Tanaris",
					["npcID"] = 0,
				},
				[115276] = {
					["encounterID"] = 2086,
					["source"] = "Gible",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 58959,
				},
				[299243] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Shith'rus the Manipulator",
					["npcID"] = 154727,
				},
				[259456] = {
					["source"] = "Divination-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[281844] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ilgynoth-Tanaris",
					["npcID"] = 0,
				},
				[55095] = {
					["type"] = "DEBUFF",
					["source"] = "Ahriak",
					["encounterID"] = 1106,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[34428] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[153561] = {
					["source"] = "Valatuu-Wildhammer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[269185] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 133007,
				},
				[258945] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Faithless Champion",
					["npcID"] = 135292,
				},
				[268887] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lunareste",
					["npcID"] = 0,
				},
				[257410] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nüll-Thrall",
					["npcID"] = 0,
				},
				[34767] = {
					["source"] = "Sathaendor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[79865] = {
					["source"] = "Marud",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 47247,
				},
				[51271] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Déjà-Aegwynn",
					["npcID"] = 0,
				},
				[289523] = {
					["source"] = "Bratàc",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[51399] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Ikalo-Zul'jin",
					["npcID"] = 0,
				},
				[113942] = {
					["source"] = "Rotrin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[212061] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 129276,
				},
				[289524] = {
					["source"] = "Bratàc",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[255620] = {
					["source"] = "Reanimated Honor Guard",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 127757,
				},
				[132483] = {
					["source"] = "Nazani-BleedingHollow",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[119910] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Megadoodoo-Tichondrius",
					["encounterID"] = 2111,
				},
				[164273] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Picon-Whisperwind",
					["npcID"] = 0,
				},
				[49864] = {
					["source"] = "Achilios",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272126] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jáydee",
					["npcID"] = 0,
				},
				[281721] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Taldreil-Zul'jin",
					["npcID"] = 0,
				},
				[260364] = {
					["source"] = "Rotrin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[34026] = {
					["source"] = "Fayia-Arthas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[208796] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Traplifé-Azralon",
					["npcID"] = 0,
				},
				[196770] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Déjà-Aegwynn",
					["npcID"] = 0,
				},
				[48265] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Genorider-Zul'jin",
					["npcID"] = 0,
				},
				[294133] = {
					["source"] = "Eanja",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[307128] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wantêd-Illidan",
					["npcID"] = 0,
				},
				[303345] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Holylolring-Illidan",
					["npcID"] = 0,
				},
				[273349] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Freida-AeriePeak",
					["npcID"] = 0,
				},
				[134616] = {
					["source"] = "Rotrin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[6343] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Melvinmoose-Zul'jin",
					["npcID"] = 0,
				},
				[281711] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Gorbanzo",
					["npcID"] = 0,
				},
				[1079] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Freida-AeriePeak",
					["npcID"] = 0,
				},
				[269571] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Flamejob-Kel'Thuzad",
					["npcID"] = 0,
				},
				[134615] = {
					["source"] = "Rotrin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280830] = {
					["source"] = "Tyronika-Doomhammer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[271107] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lunareste",
					["npcID"] = 0,
				},
				[245388] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lunareste",
					["npcID"] = 0,
				},
				[139200] = {
					["source"] = "Rotrin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[198819] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[228128] = {
					["source"] = "Rakporine",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[316508] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Magni Bronzebeard",
					["npcID"] = 154533,
				},
				[117828] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[278637] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Underrot Tick",
					["npcID"] = 131402,
				},
				[257415] = {
					["source"] = "Zexnero-Dalaran",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[259718] = {
					["npcID"] = 131383,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sporecaller Zancha",
					["encounterID"] = 2112,
				},
				[288509] = {
					["source"] = "Bvd",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[270598] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 129305,
				},
				[113899] = {
					["source"] = "Demonic Gateway",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 59262,
				},
				[279810] = {
					["type"] = "BUFF",
					["source"] = "Fanatixxh-BleedingHollow",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[212048] = {
					["source"] = "Fhaykum",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[199844] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Aesse",
					["npcID"] = 0,
				},
				[278559] = {
					["source"] = "Fhaykum",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[269576] = {
					["type"] = "BUFF",
					["source"] = "Vverr-Illidan",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280404] = {
					["source"] = "Hungryorphan-Frostmourne",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[3409] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Lunareste",
					["npcID"] = 0,
				},
				[118] = {
					["source"] = "Yourefired-Aggramar",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[301404] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 150196,
				},
				[180749] = {
					["source"] = "Alvia",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[278789] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[113858] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[143625] = {
					["source"] = "Cõnker-Exodar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[269085] = {
					["source"] = "Fhaykum",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[20271] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Frogy-Agamaggan",
					["npcID"] = 0,
				},
				[113900] = {
					["source"] = "Demonic Gateway",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 59271,
				},
				[272266] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Warmother Captive",
					["npcID"] = 134625,
				},
				[207778] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fhaykum",
					["npcID"] = 0,
				},
				[301308] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Brionac-Arthas",
					["npcID"] = 0,
				},
				[255371] = {
					["encounterID"] = 2086,
					["source"] = "Rezan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 122963,
				},
				[216528] = {
					["source"] = "Bratàc",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[34344] = {
					["source"] = "Unbound Bonemender",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 68175,
				},
				[253239] = {
					["source"] = "Dazar'ai Juggernaut",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 122971,
				},
				[63619] = {
					["encounterID"] = 2086,
					["source"] = "Shadowfiend",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 19668,
				},
				[288613] = {
					["type"] = "BUFF",
					["source"] = "Vverr-Illidan",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[49821] = {
					["encounterID"] = 2086,
					["source"] = "Celaste-LaughingSkull",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[115308] = {
					["source"] = "Dionysús-Malfurion",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[204197] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Heartbeatz-Tichondrius",
					["npcID"] = 0,
				},
				[261769] = {
					["source"] = "Sädä-Malfurion",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[313081] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Amathet Lightblade",
					["npcID"] = 151806,
				},
				[225602] = {
					["source"] = "Azâghal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[104773] = {
					["type"] = "BUFF",
					["source"] = "Hungryorphan-Frostmourne",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[285959] = {
					["source"] = "Dionysús-Malfurion",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[317507] = {
					["source"] = "Depthsborn Binder",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 154200,
				},
				[301312] = {
					["source"] = "Minuét-Quel'Thalas",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[255373] = {
					["encounterID"] = 2086,
					["source"] = "Rezan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 122963,
				},
				[118635] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fairin-Akama",
					["npcID"] = 0,
				},
				[300801] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Quickranger-Bloodhoof",
					["npcID"] = 0,
				},
				[300612] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Megadoodoo-Tichondrius",
					["npcID"] = 0,
				},
				[314107] = {
					["source"] = "Faceless Tormentor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 153904,
				},
				[277072] = {
					["type"] = "DEBUFF",
					["source"] = "Corrupted Gold",
					["encounterID"] = 2084,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 130738,
				},
				[300802] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Yungs-Zul'jin",
					["npcID"] = 0,
				},
				[31884] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Krystynna-Illidan",
					["npcID"] = 0,
				},
				[114052] = {
					["type"] = "BUFF",
					["source"] = "Fhaykum",
					["encounterID"] = 2085,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[253583] = {
					["source"] = "Dazar'ai Augur",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 122972,
				},
				[313085] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Amathet Lightblade",
					["npcID"] = 151806,
				},
				[185123] = {
					["source"] = "Zahmerdh",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[275523] = {
					["source"] = "Infused Bedrock",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 136614,
				},
				[245686] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hankla-Mal'Ganis",
					["npcID"] = 0,
				},
				[183218] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Flamejob-Kel'Thuzad",
					["npcID"] = 0,
				},
				[46924] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cbegswar-BleedingHollow",
					["npcID"] = 0,
				},
				[257422] = {
					["source"] = "Yalemannec-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272457] = {
					["npcID"] = 131383,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sporecaller Zancha",
					["encounterID"] = 2112,
				},
				[70581] = {
					["source"] = "Achilios",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[35746] = {
					["source"] = "Kaylaan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 20780,
				},
				[53385] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Frogy-Agamaggan",
					["npcID"] = 0,
				},
				[31850] = {
					["type"] = "BUFF",
					["source"] = "Thalron",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[313088] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cbegswar-BleedingHollow",
					["npcID"] = 0,
				},
				[31224] = {
					["source"] = "Flawlyss-Arthas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[299783] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 151309,
				},
				[162794] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Taldreil-Zul'jin",
					["npcID"] = 0,
				},
				[41188] = {
					["source"] = "Ashtongue Primalist",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 68096,
				},
				[100] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[250259] = {
					["encounterID"] = 2085,
					["source"] = "Vol'kaal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 122965,
				},
				[247218] = {
					["source"] = "Honorbound Grunt",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 154749,
				},
				[193455] = {
					["source"] = "Tekyto",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[19577] = {
					["source"] = "Aerospac-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[257424] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jimboslicé-AeriePeak",
					["npcID"] = 0,
				},
				[194223] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Define-Mal'Ganis",
					["npcID"] = 0,
				},
				[300809] = {
					["source"] = "Chanuka-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[196782] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Esov-Illidan",
					["npcID"] = 0,
				},
				[30283] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[268854] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Yungs-Zul'jin",
					["npcID"] = 0,
				},
				[193456] = {
					["source"] = "Glidesaway-Illidan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[315336] = {
					["source"] = "Unknown",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 161974,
				},
				[33377] = {
					["source"] = "Rotrin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[184575] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Frogy-Agamaggan",
					["npcID"] = 0,
				},
				[268062] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ilgynoth-Tanaris",
					["npcID"] = 0,
				},
				[132626] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dewgie-Mal'Ganis",
					["npcID"] = 0,
				},
				[299788] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Holylolring-Illidan",
					["npcID"] = 0,
				},
				[276025] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Saladin-Bonechewer",
					["npcID"] = 0,
				},
				[290577] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Abomination",
					["npcID"] = 149555,
				},
				[199854] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[26573] = {
					["source"] = "Ironmade-Thrall",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[292113] = {
					["source"] = "Fhaykum",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2565] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Melvinmoose-Zul'jin",
					["npcID"] = 0,
				},
				[114800] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[299790] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Verthel",
					["npcID"] = 0,
				},
				[41168] = {
					["source"] = "Unbound Centurion",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 68176,
				},
				[211881] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Callirra-Daggerspine",
					["npcID"] = 0,
				},
				[22703] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Rotrin",
					["npcID"] = 0,
				},
				[298025] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Shith'rus the Manipulator",
					["npcID"] = 154727,
				},
				[190784] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bløodshot-BleedingHollow",
					["npcID"] = 0,
				},
				[51723] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dristwo-Ravencrest",
					["npcID"] = 0,
				},
				[295186] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Whípple-Mal'Ganis",
					["npcID"] = 0,
				},
				[256404] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bonebeak Vulture",
					["npcID"] = 136664,
				},
				[164545] = {
					["source"] = "Assailermoon-Mal'Ganis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[199600] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sauzey",
					["npcID"] = 0,
				},
				[116768] = {
					["source"] = "Hecatè-Malfurion",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[318216] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lunareste",
					["npcID"] = 0,
				},
				[296211] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fivespot-Arthas",
					["npcID"] = 0,
				},
				[269301] = {
					["type"] = "DEBUFF",
					["source"] = "Unbound Abomination",
					["npcID"] = 133007,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2123,
				},
				[195072] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Adamdh-Illidan",
					["npcID"] = 0,
				},
				[162243] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Yungs-Zul'jin",
					["npcID"] = 0,
				},
				[288024] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rawdawgw-Kel'Thuzad",
					["npcID"] = 0,
				},
				[319241] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Mjiollnir-BleedingHollow",
					["npcID"] = 0,
				},
				[293142] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lazerbeamzz-Arthas",
					["npcID"] = 0,
				},
				[54049] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bragkek",
					["npcID"] = 58964,
				},
				[1329] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lunareste",
					["npcID"] = 0,
				},
				[275243] = {
					["source"] = "Erupting Servant",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 140637,
				},
				[303378] = {
					["source"] = "Meaven-Zul'jin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[273185] = {
					["source"] = "Shieldbearer of Zul",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 127879,
				},
				[164547] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Define-Mal'Ganis",
					["npcID"] = 0,
				},
				[228260] = {
					["encounterID"] = 2086,
					["source"] = "Celaste-LaughingSkull",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[262161] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[268769] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hairygal-Illidan",
					["npcID"] = 0,
				},
				[269838] = {
					["npcID"] = 0,
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2123,
				},
				[223143] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Alesso",
					["npcID"] = 0,
				},
				[19505] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bragkek",
					["npcID"] = 58964,
				},
				[231843] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sunspot-Arthas",
					["npcID"] = 0,
				},
				[285981] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Starsurgeon-Zul'jin",
					["npcID"] = 0,
				},
				[199603] = {
					["source"] = "Otters-Eonar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298466] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ilgynoth-Tanaris",
					["npcID"] = 0,
				},
				[273285] = {
					["npcID"] = 139127,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Volatile Pod",
					["encounterID"] = 2112,
				},
				[212653] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Verthel",
					["npcID"] = 0,
				},
				[224721] = {
					["source"] = "Spiritwalker Ebonhorn",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 152385,
				},
				[302952] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Augustina-Aegwynn",
					["npcID"] = 0,
				},
				[219589] = {
					["source"] = "Kelbae",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267560] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jazlah-Illidan",
					["npcID"] = 0,
				},
				[274213] = {
					["npcID"] = 131383,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sporecaller Zancha",
					["encounterID"] = 2112,
				},
				[252388] = {
					["source"] = "Kharl",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[198069] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Heartbeatz-Tichondrius",
					["npcID"] = 0,
				},
				[97463] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[124682] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Saladin-Bonechewer",
					["npcID"] = 0,
				},
				[198837] = {
					["source"] = "Risen Skulker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 99541,
				},
				[256409] = {
					["source"] = "Zandalari Leguaan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 129554,
				},
				[314698] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Vuk'laz the Earthbreaker",
					["npcID"] = 160970,
				},
				[199412] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Chira-Ragnaros",
					["npcID"] = 0,
				},
				[115315] = {
					["source"] = "Dionysús-Malfurion",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[202164] = {
					["source"] = "Razorcakes",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[247454] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Traplifé-Azralon",
					["npcID"] = 0,
				},
				[278310] = {
					["source"] = "Hoodròw-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[139546] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wantêd-Illidan",
					["npcID"] = 0,
				},
				[72968] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Starsurgeon-Zul'jin",
					["npcID"] = 0,
				},
				[236021] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Freida-AeriePeak",
					["npcID"] = 0,
				},
				[288546] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Magus of the Dead",
					["npcID"] = 148797,
				},
				[192225] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Qyzen-Thrall",
					["npcID"] = 0,
				},
				[134614] = {
					["source"] = "Rotrin",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[296794] = {
					["source"] = "Judge-Aggramar",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[266030] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zarthell-Arygos",
					["npcID"] = 0,
				},
				[2825] = {
					["source"] = "Conictotems-Zul'jin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[314135] = {
					["source"] = "Mind Worm",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 156455,
				},
				[207400] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Karlurn-BleedingHollow",
					["npcID"] = 0,
				},
				[288548] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Magus of the Dead",
					["npcID"] = 148797,
				},
				[51533] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mjiollnir-BleedingHollow",
					["npcID"] = 0,
				},
				[204213] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Heartbeatz-Tichondrius",
					["npcID"] = 0,
				},
				[247456] = {
					["source"] = "Byefelycia",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[313113] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fairin-Akama",
					["npcID"] = 0,
				},
				[207028] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Amoreiel-Daggerspine",
					["npcID"] = 0,
				},
				[57994] = {
					["source"] = "Dacorr-ShatteredHand",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[178740] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Traplifé-Azralon",
					["npcID"] = 0,
				},
				[197561] = {
					["source"] = "Ironmade-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[49998] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Esov-Illidan",
					["npcID"] = 0,
				},
				[77575] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Esov-Illidan",
					["npcID"] = 0,
				},
				[257692] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273323] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mjiollnir-BleedingHollow",
					["npcID"] = 0,
				},
				[86659] = {
					["type"] = "BUFF",
					["source"] = "Thalron",
					["encounterID"] = 2086,
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[194509] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Heartbeatz-Tichondrius",
					["npcID"] = 0,
				},
				[198368] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kaedash-Khaz'goroth",
					["npcID"] = 0,
				},
				[94719] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Razkal-ShatteredHand",
					["npcID"] = 0,
				},
				[291111] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Liluth-Trollbane",
					["npcID"] = 0,
				},
				[109304] = {
					["encounterID"] = 2086,
					["source"] = "Vverr-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[140092] = {
					["source"] = "Ji-Kun",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 69712,
				},
				[309023] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Shith'rus the Manipulator",
					["npcID"] = 154727,
				},
				[24275] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Holylolring-Illidan",
					["npcID"] = 0,
				},
				[69563] = {
					["source"] = "Deppfist",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[234153] = {
					["source"] = "Rotrin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[196834] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mjiollnir-BleedingHollow",
					["npcID"] = 0,
				},
				[291113] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Liluth-Trollbane",
					["npcID"] = 0,
				},
				[270661] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dristwo-Ravencrest",
					["npcID"] = 0,
				},
				[273714] = {
					["source"] = "Studdnmuffin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298343] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bloodscoute",
					["npcID"] = 0,
				},
				[274738] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Clapedcheeks-Rivendare",
					["npcID"] = 0,
				},
				[370] = {
					["source"] = "Dacorr-ShatteredHand",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[204021] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Traplifé-Azralon",
					["npcID"] = 0,
				},
				[272180] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Grotesque Horror",
					["npcID"] = 138187,
				},
				[291115] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Liluth-Trollbane",
					["npcID"] = 0,
				},
				[265016] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Chosen Blood Matron",
					["npcID"] = 131436,
				},
				[47568] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Déjà-Aegwynn",
					["npcID"] = 0,
				},
				[115098] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Saladin-Bonechewer",
					["npcID"] = 0,
				},
				[204255] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Traplifé-Azralon",
					["npcID"] = 0,
				},
				[317272] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Magni Bronzebeard",
					["npcID"] = 154533,
				},
				[124274] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fairin-Akama",
					["npcID"] = 0,
				},
				[27576] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lunareste",
					["npcID"] = 0,
				},
				[274741] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Auroraclaire-Drenden",
					["npcID"] = 0,
				},
				[274742] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Clapedcheeks-Rivendare",
					["npcID"] = 0,
				},
				[104316] = {
					["source"] = "Instantdeath-Bloodhoof",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[272183] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fallen Deathspeaker",
					["npcID"] = 134284,
				},
				[291118] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Liluth-Trollbane",
					["npcID"] = 0,
				},
				[207289] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Clapedcheeks-Rivendare",
					["npcID"] = 0,
				},
				[314659] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Vuk'laz the Earthbreaker",
					["npcID"] = 160970,
				},
				[115191] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lunareste",
					["npcID"] = 0,
				},
				[268602] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zarthell-Arygos",
					["npcID"] = 0,
				},
				[273794] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Urukaim-Mal'Ganis",
					["npcID"] = 0,
				},
				[280462] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Watcher Aum-ka",
					["npcID"] = 154619,
				},
				[290608] = {
					["source"] = "Khalifakahn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[54861] = {
					["source"] = "Shimmersion-Destromath",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[172816] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sun Prophet Tenhamen",
					["npcID"] = 154727,
				},
				[265533] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Underrot Tick",
					["npcID"] = 131402,
				},
				[219406] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Wrathzz",
					["npcID"] = 0,
				},
			},
		},
		["MyNewProfile"] = {
			["script_data"] = {
				{
					["Enabled"] = true,
					["Revision"] = 156,
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)    \n    --change the nameplate color to this if allowed\n    envTable.CanChangeNameplateColor = false --change to true to change the color\n    envTable.NameplateColor = \"pink\"\n    envTable.NameplateSizeOffset = 6 --increase the nameplate height by this value\n    envTable.GlowAlpha = 0.5 --amount of alpha in the outside glow effect\n    \n    --create a glow effect around the nameplate\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (unitFrame.healthBar, envTable.NameplateColor)\n    envTable.glowEffect:SetOffset (-27, 25, 9, -11)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() --\n    \n    --set the glow effect alpha\n    envTable.glowEffect:SetAlpha (envTable.GlowAlpha)\n    \nend\n\n--[=[\nUsing spellIDs for multi-language support\n\n135029 - A Knot of Snakes (Temple of Sethraliss)\n135388 - A Knot of Snakes (Temple of Sethraliss)\n134612 - Grasping Tentacles (Shrine of the Storm)\n133361 - Wasting Servant (Waycrest Manor)\n136330 - Soul Thorns (Waycrest Manor)\n130896 - Blackout Barrel (Freehold)\n129758 - Irontide Grenadier (Freehold)\n131009 - Spirit of Gold (Atal`Dazar)\n--]=]",
					["Icon"] = 135996,
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
					["Desc"] = "Add the debuff name in the trigger box.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.debuffIconGlow:Show()\n    \nend\n\n\n",
					["SpellIds"] = {
					},
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Time"] = 1538429739,
					["PlaterCore"] = 1,
					["Name"] = "Aura - Debuff Alert [Plater]",
					["ScriptType"] = 1,
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
					["Desc"] = "Add a unitID or unit name in 'Add Trigger' entry. See the constructor script for options.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can flash the nameplate\n    if (envTable.FlashNameplate) then\n        envTable.smallFlash:Play()\n    end\n    \nend\n\n\n\n\n\n\n\n\n",
					["SpellIds"] = {
					},
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --adjust the nameplate color\n    Plater.SetNameplateColor (unitFrame, envTable.Color)\n    \n    --check if can replace the health amount with the unit name\n    if (envTable.ReplaceHealthWithName) then\n        \n        local healthPercent = format (\"%.1f\", unitFrame.healthBar.CurrentHealth / unitFrame.healthBar.CurrentHealthMax *100)\n        \n        unitFrame.healthBar.lifePercent:SetText (unitFrame.namePlateUnitName .. \"  (\" .. healthPercent  .. \"%)\")\n        \n    end\n    \nend\n\n\n",
					["Time"] = 1543253273,
					["PlaterCore"] = 1,
					["Name"] = "Color Change [Plater]",
					["ScriptType"] = 3,
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
					["Desc"] = "Blink, change the number and nameplate color. Add the debuffs int he trigger box. Set settings on constructor script.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.blinkTexture:SetSize (self:GetSize())\n    \nend\n\n\n",
					["SpellIds"] = {
					},
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    local timeLeft = envTable._RemainingTime\n    \n    --check if the spellID isn't being ignored\n    if (envTable.IgnoredSpellID [envTable._SpellID]) then\n        return\n    end\n    \n    --check the time left and start or stop the blink animation and also check if the time left is > zero\n    if ((envTable.BlinkEnabled or envTable.GlowEnabled) and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftToBlink) then\n            --blink effect\n            if (envTable.BlinkEnabled) then\n                if (not envTable.blinkAnimation:IsPlaying()) then\n                    envTable.blinkAnimation:Play()\n                end\n            end\n            --glow effect\n            if (envTable.GlowEnabled) then\n                envTable.glowEffect:Show()\n            end\n            --nameplate color\n            if (envTable.ChangeNameplateColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n            end\n        else\n            --blink effect\n            if (envTable.blinkAnimation:IsPlaying()) then\n                envTable.blinkAnimation:Stop()\n            end\n            --glow effect\n            if (envTable.GlowEnabled and envTable.glowEffect:IsShown()) then\n                envTable.glowEffect:Hide()\n            end\n        end\n    end\n    \n    --timer color\n    if (envTable.TimerColorEnabled and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftCritical) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Critical)\n        elseif (timeLeft < envTable.TimeLeftWarning) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Warning)        \n        else\n            Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\n        end\n    end\n    \nend",
					["Time"] = 1547991413,
					["PlaterCore"] = 1,
					["Name"] = "Aura - Blink by Time Left [Plater]",
					["ScriptType"] = 1,
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
					["Desc"] = "Add a border to an aura icon. Add the aura into the Add Trigger entry. You can customize the icon color at the constructor script.",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the aura name in lower case\n    local auraLowerName = string.lower (envTable._SpellName)\n    \n    --attempt to get a custom color added by the user in the constructor script\n    local hasCustomBorderColor = envTable.BorderColorByAura [auraLowerName] or envTable.BorderColorByAura [envTable._SpellName] or envTable.BorderColorByAura [envTable._SpellID]\n    \n    --save the custom color\n    envTable.CustomBorderColor = hasCustomBorderColor\n    \nend\n\n\n",
					["SpellIds"] = {
					},
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the custom color added by the user or the default color\n    local color = envTable.CustomBorderColor or envTable.DefaultBorderColor\n    --parse the color since it can be a color name, hex or color table\n    local r, g, b = DetailsFramework:ParseColors (color)\n    \n    --set the border color\n    self:SetBackdropBorderColor (r, g, b, envTable.BorderAlpha)\n    \nend\n\n\n\n\n",
					["Time"] = 1543680853,
					["PlaterCore"] = 1,
					["Name"] = "Aura - Border Color [Plater]",
					["ScriptType"] = 1,
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
					["Desc"] = "Show the energy amount above the nameplate",
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Show()\nend\n\n\n",
					["SpellIds"] = {
					},
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount.text = \"\" .. UnitPower (unitId);\nend\n\n\n",
					["Time"] = 1539015649,
					["PlaterCore"] = 1,
					["Name"] = "UnitPower [Plater]",
					["ScriptType"] = 3,
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
				[40788] = {
					"Mindbender Ghur'sha", -- [1]
					"Throne of the Tides", -- [2]
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
				[80782] = {
					"Icespine Stinger", -- [1]
					"FW Horde Garrison Level 1", -- [2]
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
				[155872] = {
					"Trapped Saurok", -- [1]
					"Mogu'shan Scenario", -- [2]
				},
				[90378] = {
					"Kilrogg Deadeye", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[59598] = {
					"Lesser Sha", -- [1]
					"Temple of the Jade Serpent", -- [2]
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
				[58319] = {
					"Lesser Sha", -- [1]
					"Temple of the Jade Serpent", -- [2]
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
				[44566] = {
					"Ozumat", -- [1]
					"Throne of the Tides", -- [2]
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
				[157419] = {
					"Void-Twisted Whelp", -- [1]
					"Blackwing Descent Scenario", -- [2]
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
				[56915] = {
					"Sun", -- [1]
					"Temple of the Jade Serpent", -- [2]
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
				[159219] = {
					"Umbral Seer", -- [1]
					"Ny'alotha, the Waking City", -- [2]
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
				[57109] = {
					"Minion of Doubt", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[40925] = {
					"Tainted Sentry", -- [1]
					"Throne of the Tides", -- [2]
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
				[137478] = {
					"Queen Wasi", -- [1]
					"Kings' Rest", -- [2]
				},
				[95638] = {
					"Sargerei Bannerman", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[91672] = {
					"Jailer Zerus", -- [1]
					"Broken Shore", -- [2]
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
				[157441] = {
					"Void Wraith", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[151812] = {
					"Detect-o-Bot", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[56472] = {
					"Fragrant Lotus", -- [1]
					"Shado-Pan Monastery", -- [2]
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
				[56792] = {
					"Figment of Doubt", -- [1]
					"Temple of the Jade Serpent", -- [2]
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
				[62358] = {
					"Corrupt Droplet", -- [1]
					"Temple of the Jade Serpent", -- [2]
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
				[59545] = {
					"The Golden Beetle", -- [1]
					"Temple of the Jade Serpent", -- [2]
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
				[62360] = {
					"Corrupt Droplet", -- [1]
					"Temple of the Jade Serpent", -- [2]
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
				[97567] = {
					"Ravenous Felstalker", -- [1]
					"Broken Shore", -- [2]
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
				[161812] = {
					"Faceless Ruiner", -- [1]
					"Chamber of Heart - Scenario", -- [2]
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
				[159510] = {
					"Eye of the Depths", -- [1]
					"Ny'alotha, the Waking City", -- [2]
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
				[42789] = {
					"Stonecore Magmalord", -- [1]
					"The Stonecore", -- [2]
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
				[43430] = {
					"Stonecore Berserker", -- [1]
					"The Stonecore", -- [2]
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
				[40936] = {
					"Faceless Watcher", -- [1]
					"Throne of the Tides", -- [2]
				},
				[155684] = {
					"Depthcaller Xith'el", -- [1]
					"Mogu'shan Scenario", -- [2]
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
				[131123] = {
					"Enchanted Tiki Mask", -- [1]
					"Atal'Dazar", -- [2]
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
				[59808] = {
					"Shado-Pan Stormbringer", -- [1]
					"Shado-Pan Monastery", -- [2]
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
				[44841] = {
					"Blight Beast", -- [1]
					"Throne of the Tides", -- [2]
				},
				[46952] = {
					"Chosen Seer", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[157231] = {
					"Shad'har the Insatiable", -- [1]
					"Ny'alotha, the Waking City", -- [2]
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
				[157238] = {
					"Prophet Skitra", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[44715] = {
					"Vicious Mindlasher", -- [1]
					"Throne of the Tides", -- [2]
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
				[161334] = {
					"Gnashing Terror", -- [1]
					"Ny'alotha, the Waking City", -- [2]
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
				[161335] = {
					"Void Horror", -- [1]
					"Ny'alotha, the Waking City", -- [2]
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
				[158781] = {
					"Shredded Psyche", -- [1]
					"Ny'alotha, the Waking City", -- [2]
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
				[43438] = {
					"Corborus", -- [1]
					"The Stonecore", -- [2]
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
				[59751] = {
					"Shado-Pan Warden", -- [1]
					"Shado-Pan Monastery", -- [2]
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
				[59752] = {
					"Shado-Pan Ambusher", -- [1]
					"Shado-Pan Monastery", -- [2]
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
				[155723] = {
					"Swarmguard Kzaz", -- [1]
					"Mogu'shan Scenario", -- [2]
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
				[56747] = {
					"Gu Cloudstrike", -- [1]
					"Shado-Pan Monastery", -- [2]
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
				[41139] = {
					"Naz'jar Spiritmender", -- [1]
					"Throne of the Tides", -- [2]
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
				[96192] = {
					"Wrathguard Cleaver", -- [1]
					"Broken Shore", -- [2]
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
				[151638] = {
					"Crazed Earth Rager", -- [1]
					"Neltharion's Lair - HoA Scenario", -- [2]
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
				[153943] = {
					"Decimator Shiq'voth", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
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
				[96196] = {
					"Eredar Deathspeaker", -- [1]
					"Broken Shore", -- [2]
				},
				[162647] = {
					"Willing Sacrifice", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[44404] = {
					"Naz'jar Tempest Witch", -- [1]
					"Throne of the Tides", -- [2]
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
				[45620] = {
					"Naz'jar Soldier", -- [1]
					"Throne of the Tides", -- [2]
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
				[144231] = {
					"Rowdy Reveler", -- [1]
					"The MOTHERLODE!!", -- [2]
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
				[134739] = {
					"Purification Construct", -- [1]
					"Kings' Rest", -- [2]
				},
				[94283] = {
					"Shadow Infuser", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[159514] = {
					"Blood of Ny'alotha", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[76116] = {
					"Diving Chakram Spinner", -- [1]
					"Skyreach", -- [2]
				},
				[162828] = {
					"Corrosive Digester", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[86607] = {
					"Iron Flame Technician", -- [1]
					"Highmaul", -- [2]
				},
				[161124] = {
					"Urg'roth, Breaker of Heroes", -- [1]
					"Kings' Rest", -- [2]
				},
				[161312] = {
					"Crushing Tendril", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[158168] = {
					"Dark Disciple", -- [1]
					"Halls of Origination", -- [2]
				},
				[151657] = {
					"Bomb Tonk", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[159309] = {
					"Leeching Parasite", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[40633] = {
					"Naz'jar Honor Guard", -- [1]
					"Throne of the Tides", -- [2]
				},
				[53167] = {
					"Unbound Pyrelord", -- [1]
					"Firelands", -- [2]
				},
				[42808] = {
					"Stonecore Flayer", -- [1]
					"The Stonecore", -- [2]
				},
				[40825] = {
					"Erunak Stonespeaker", -- [1]
					"Throne of the Tides", -- [2]
				},
				[74379] = {
					"Splinterbone Frostweaver", -- [1]
					"Razorfen Downs", -- [2]
				},
				[87989] = {
					"Forgemistress Flamehand", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[94284] = {
					"Fiery Enkindler", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[43128] = {
					"Spirit of Anvilrage", -- [1]
					"Blackwing Descent", -- [2]
				},
				[45872] = {
					"Rohash", -- [1]
					"Throne of the Four Winds", -- [2]
				},
				[158567] = {
					"Tormented Kor'kron Annihilator", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[93615] = {
					"Felborne Overfiend", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[94924] = {
					"Iron Peon", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[133384] = {
					"Merektha", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[75786] = {
					"Roltall", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[83026] = {
					"Siegemaster Olugar", -- [1]
					"Iron Docks", -- [2]
				},
				[131445] = {
					"Block Warden", -- [1]
					"Tol Dagor", -- [2]
				},
				[151859] = {
					"Tomb Scarab", -- [1]
					"Halls of Origination", -- [2]
				},
				[155090] = {
					"Anodized Coilbearer", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[151639] = {
					"Crazed Gyreworm", -- [1]
					"Neltharion's Lair - HoA Scenario", -- [2]
				},
				[59804] = {
					"Gripping Hatred", -- [1]
					"Shado-Pan Monastery", -- [2]
				},
				[69465] = {
					"Jin'rokh the Breaker", -- [1]
					"Throne of Thunder", -- [2]
				},
				[95280] = {
					"Kaz'rogal", -- [1]
					"Hellfire Citadel", -- [2]
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
				[53901] = {
					"Unstable Magma", -- [1]
					"Firelands", -- [2]
				},
				[141938] = {
					"Ashvane Sniper", -- [1]
					"Siege of Boralus", -- [2]
				},
				[56732] = {
					"Liu Flameheart", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[91697] = {
					"Dark Inquisitor", -- [1]
					"Broken Shore", -- [2]
				},
				[43286] = {
					"Crystal Shard", -- [1]
					"The Stonecore", -- [2]
				},
				[97566] = {
					"Wrathguard Cleaver", -- [1]
					"Broken Shore", -- [2]
				},
				[96005] = {
					"Burning Crusher", -- [1]
					"Broken Shore", -- [2]
				},
				[65317] = {
					"Xiang", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[43129] = {
					"Spirit of Shadowforge", -- [1]
					"Blackwing Descent", -- [2]
				},
				[141939] = {
					"Ashvane Spotter", -- [1]
					"Siege of Boralus", -- [2]
				},
				[158169] = {
					"Devout Disciple", -- [1]
					"Halls of Origination", -- [2]
				},
				[139790] = {
					"Stag", -- [1]
					"Isle of Conquest", -- [2]
				},
				[42845] = {
					"Rock Borer", -- [1]
					"The Stonecore", -- [2]
				},
				[74584] = {
					"Plague-Rotted Webslinger", -- [1]
					"Razorfen Downs", -- [2]
				},
				[65362] = {
					"Minion of Doubt", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[83028] = {
					"Grom'kar Deadeye", -- [1]
					"Iron Docks", -- [2]
				},
				[59553] = {
					"The Songbird Queen", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[69388] = {
					"Zandalari Spear-Shaper", -- [1]
					"Throne of Thunder", -- [2]
				},
				[59555] = {
					"Haunting Sha", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[69132] = {
					"High Priestess Mar'li", -- [1]
					"Throne of Thunder", -- [2]
				},
				[91521] = {
					"Vindicator Bramu", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[10400] = {
					"Thuzadin Necromancer", -- [1]
					"Stratholme", -- [2]
				},
				[163690] = {
					"Shath'Yar Scribe", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[59552] = {
					"The Crybaby Hozen", -- [1]
					"Temple of the Jade Serpent", -- [2]
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
				[76376] = {
					"Skyreach Arcanologist", -- [1]
					"Skyreach", -- [2]
				},
				[42362] = {
					"Drakonid Drudge", -- [1]
					"Blackwing Descent", -- [2]
				},
				[60849] = {
					"Jade Serpent Statue", -- [1]
					"Isle of Conquest", -- [2]
				},
				[94733] = {
					"Felfire Demolisher", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[26555] = {
					"Scourge Hulk", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[93392] = {
					"Captured Prisoner", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[155706] = {
					"Yox'ith", -- [1]
					"Mogu'shan Scenario", -- [2]
				},
				[127486] = {
					"Ashvane Officer", -- [1]
					"Tol Dagor", -- [2]
				},
				[42810] = {
					"Crystalspawn Giant", -- [1]
					"The Stonecore", -- [2]
				},
				[40634] = {
					"Naz'jar Tempest Witch", -- [1]
					"Throne of the Tides", -- [2]
				},
				[81750] = {
					"Bloodmaul Ogron", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[66652] = {
					"Lesser Volatile Energy", -- [1]
					"Shado-Pan Monastery", -- [2]
				},
				[69899] = {
					"Farraki Sand Conjurer", -- [1]
					"Throne of Thunder", -- [2]
				},
				[43130] = {
					"Spirit of Burningeye", -- [1]
					"Blackwing Descent", -- [2]
				},
				[18105] = {
					"Ghaz'an", -- [1]
					"Coilfang: The Underbog", -- [2]
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
				[17735] = {
					"Wrathfin Warrior", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[105419] = {
					"Dire Basilisk", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[153141] = {
					"Endless Hunger Totem", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[27970] = {
					"Raging Construct", -- [1]
					"Halls of Stone", -- [2]
				},
				[39960] = {
					"Deep Murloc Drudge", -- [1]
					"Throne of the Tides", -- [2]
				},
				[134012] = {
					"Taskmaster Askari", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[44658] = {
					"Deep Murloc Invader", -- [1]
					"Throne of the Tides", -- [2]
				},
				[75272] = {
					"Bloodmaul Ogre Mage", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[91520] = {
					"Adjunct Kuroh", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[26685] = {
					"Massive Jormungar", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[56754] = {
					"Azure Serpent", -- [1]
					"Shado-Pan Monastery", -- [2]
				},
				[17826] = {
					"Swamplord Musel'ek", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[24082] = {
					"Proto-Drake Handler", -- [1]
					"Utgarde Keep", -- [2]
				},
				[144248] = {
					"Head Machinist Sparkflux", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[129600] = {
					"Bilge Rat Brinescale", -- [1]
					"Freehold", -- [2]
				},
				[8897] = {
					"Doomforge Craftsman", -- [1]
					"Blackrock Depths", -- [2]
				},
				[58803] = {
					"Residual Hatred", -- [1]
					"Shado-Pan Monastery", -- [2]
				},
				[10464] = {
					"Wailing Banshee", -- [1]
					"Stratholme", -- [2]
				},
				[56884] = {
					"Corrupted Taran Zhu", -- [1]
					"Shado-Pan Monastery", -- [2]
				},
				[132056] = {
					"Venture Co. Skyscorcher", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[27961] = {
					"Dark Rune Worker", -- [1]
					"Halls of Stone", -- [2]
				},
				[144249] = {
					"Omega Buster", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[27963] = {
					"Dark Rune Theurgist", -- [1]
					"Halls of Stone", -- [2]
				},
				[23956] = {
					"Dragonflayer Strategist", -- [1]
					"Utgarde Keep", -- [2]
				},
				[74435] = {
					"Mushlump", -- [1]
					"Razorfen Downs", -- [2]
				},
				[23954] = {
					"Ingvar the Plunderer", -- [1]
					"Utgarde Keep", -- [2]
				},
				[47161] = {
					"Twilight Brute", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[26691] = {
					"Ymirjar Witch Doctor", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[10437] = {
					"Nerub'enkan", -- [1]
					"Stratholme", -- [2]
				},
				[53494] = {
					"Baleroc", -- [1]
					"Firelands", -- [2]
				},
				[94802] = {
					"Voidscribe Aathalos", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[17478] = {
					"Bleeding Hollow Scryer", -- [1]
					"Hellfire Citadel: Ramparts", -- [2]
				},
				[36272] = {
					"Apothecary Frye", -- [1]
					"Shadowfang Keep", -- [2]
				},
				[44752] = {
					"Faceless Sapper", -- [1]
					"Throne of the Tides", -- [2]
				},
				[157812] = {
					"Billibub Cogspinner", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[10407] = {
					"Fleshflayer Ghoul", -- [1]
					"Stratholme", -- [2]
				},
				[12221] = {
					"Noxious Slime", -- [1]
					"Maraudon", -- [2]
				},
				[10439] = {
					"Ramstein the Gorger", -- [1]
					"Stratholme", -- [2]
				},
				[8898] = {
					"Anvilrage Marshal", -- [1]
					"Blackrock Depths", -- [2]
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
				[130028] = {
					"Ashvane Priest", -- [1]
					"Tol Dagor", -- [2]
				},
				[17882] = {
					"The Black Stalker", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[129602] = {
					"Irontide Enforcer", -- [1]
					"Freehold", -- [2]
				},
				[27965] = {
					"Dark Rune Shaper", -- [1]
					"Halls of Stone", -- [2]
				},
				[42428] = {
					"Devout Follower", -- [1]
					"The Stonecore", -- [2]
				},
				[59873] = {
					"Corrupt Living Water", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[70153] = {
					"Fungal Growth", -- [1]
					"Throne of Thunder", -- [2]
				},
				[91349] = {
					"Mannoroth", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[26554] = {
					"Dragonflayer Seer", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[46842] = {
					"Pulsing Twilight Egg", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[40765] = {
					"Commander Ulthok", -- [1]
					"Throne of the Tides", -- [2]
				},
				[27962] = {
					"Dark Rune Elementalist", -- [1]
					"Halls of Stone", -- [2]
				},
				[27966] = {
					"Dark Rune Controller", -- [1]
					"Halls of Stone", -- [2]
				},
				[56658] = {
					"Corrupt Droplet", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[27969] = {
					"Dark Rune Giant", -- [1]
					"Halls of Stone", -- [2]
				},
				[17724] = {
					"Underbat", -- [1]
					"Coilfang: The Underbog", -- [2]
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
				[11121] = {
					"Black Guard Swordsmith", -- [1]
					"Stratholme", -- [2]
				},
				[46381] = {
					"Shifty Thief", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[79068] = {
					"Iron Grunt", -- [1]
					"Highmaul", -- [2]
				},
				[150396] = {
					"Aerial Unit R-21/X", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[27971] = {
					"Unrelenting Construct", -- [1]
					"Halls of Stone", -- [2]
				},
				[158328] = {
					"Il'gynoth", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[8904] = {
					"Shadowforge Senator", -- [1]
					"Blackrock Depths", -- [2]
				},
				[42973] = {
					"Eye of Naxxramas", -- [1]
					"Stratholme", -- [2]
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
				[12236] = {
					"Lord Vyletongue", -- [1]
					"Maraudon", -- [2]
				},
				[150251] = {
					"Pistonhead Mechanic", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[150397] = {
					"King Mechagon", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[13142] = {
					"Deeprot Tangler", -- [1]
					"Maraudon", -- [2]
				},
				[14303] = {
					"Petrified Guardian", -- [1]
					"Dire Maul", -- [2]
				},
				[128652] = {
					"Viq'Goth", -- [1]
					"Siege of Boralus", -- [2]
				},
				[28419] = {
					"Frenzied Geist", -- [1]
					"Utgarde Keep", -- [2]
				},
				[158437] = {
					"Fallen Taskmaster", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[69792] = {
					"Xuenray", -- [1]
					"Isle of Conquest", -- [2]
				},
				[150142] = {
					"Scrapbone Trashtosser", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[9056] = {
					"Fineous Darkvire", -- [1]
					"Blackrock Depths", -- [2]
				},
				[129214] = {
					"Coin-Operated Crowd Pummeler", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[59544] = {
					"The Nodding Tiger", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[17281] = {
					"Bonechewer Ripper", -- [1]
					"Hellfire Citadel: Ramparts", -- [2]
				},
				[126918] = {
					"Irontide Crackshot", -- [1]
					"Freehold", -- [2]
				},
				[111004] = {
					"Gelatinized Decay", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[26692] = {
					"Ymirjar Harpooner", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[150143] = {
					"Scrapbone Grinder", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[10391] = {
					"Skeletal Berserker", -- [1]
					"Stratholme", -- [2]
				},
				[94806] = {
					"Fel Hellweaver", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[11030] = {
					"Mindless Undead", -- [1]
					"Stratholme", -- [2]
				},
				[10383] = {
					"Broken Cadaver", -- [1]
					"Stratholme", -- [2]
				},
				[152009] = {
					"Malfunctioning Scrapbot", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[86275] = {
					"Gorian Enforcer", -- [1]
					"Highmaul", -- [2]
				},
				[81117] = {
					"Karnor the Cruel", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[70236] = {
					"Zandalari Storm-Caller", -- [1]
					"Throne of Thunder", -- [2]
				},
				[134024] = {
					"Devouring Maggot", -- [1]
					"Waycrest Manor", -- [2]
				},
				[75360] = {
					"Searing Ember", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[8900] = {
					"Doomforge Arcanasmith", -- [1]
					"Blackrock Depths", -- [2]
				},
				[106321] = {
					"Tailwind Totem", -- [1]
					"Isle of Conquest", -- [2]
				},
				[126919] = {
					"Irontide Stormcaller", -- [1]
					"Freehold", -- [2]
				},
				[11458] = {
					"Petrified Treant", -- [1]
					"Dire Maul", -- [2]
				},
				[56439] = {
					"Sha of Doubt", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[52409] = {
					"Ragnaros", -- [1]
					"Firelands", -- [2]
				},
				[74583] = {
					"Festering Spiderling", -- [1]
					"Razorfen Downs", -- [2]
				},
				[152704] = {
					"Crawling Corruption", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[81806] = {
					"Gorian Royal Guardsman", -- [1]
					"Highmaul", -- [2]
				},
				[10405] = {
					"Plague Ghoul", -- [1]
					"Stratholme", -- [2]
				},
				[135049] = {
					"Dreadwing Raven", -- [1]
					"Waycrest Manor", -- [2]
				},
				[135254] = {
					"Irontide Raider", -- [1]
					"Tol Dagor", -- [2]
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
				[151752] = {
					"Voidswarm", -- [1]
					"Emerald Dream - HoA Scenario", -- [2]
				},
				[87771] = {
					"Slagshop Worker", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[11783] = {
					"Theradrim Shardling", -- [1]
					"Maraudon", -- [2]
				},
				[128967] = {
					"Ashvane Sniper", -- [1]
					"Siege of Boralus", -- [2]
				},
				[61657] = {
					"Adolescent Flame Hound", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[135562] = {
					"Venomous Ophidian", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[76815] = {
					"Primal Elementalist", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[53793] = {
					"Harbinger of Flame", -- [1]
					"Firelands", -- [2]
				},
				[94808] = {
					"Hellfire Guardian", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[28384] = {
					"Lesser Air Elemental", -- [1]
					"Halls of Stone", -- [2]
				},
				[137989] = {
					"Embalming Fluid", -- [1]
					"Kings' Rest", -- [2]
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
				[39616] = {
					"Naz'jar Invader", -- [1]
					"Throne of the Tides", -- [2]
				},
				[93435] = {
					"Felfire Transporter", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[54073] = {
					"Flamewaker Hound Master", -- [1]
					"Firelands", -- [2]
				},
				[93913] = {
					"Fel Scorcher", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[45267] = {
					"Twilight Phase-Twister", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[135052] = {
					"Blight Toad", -- [1]
					"Waycrest Manor", -- [2]
				},
				[79200] = {
					"Blackrock Forge Specialist", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[69916] = {
					"Gurubashi Berserker", -- [1]
					"Throne of Thunder", -- [2]
				},
				[46254] = {
					"Hogger", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[136076] = {
					"Agitated Nimbus", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[70245] = {
					"Training Dummy", -- [1]
					"Throne of Thunder", -- [2]
				},
				[11794] = {
					"Sister of Celebras", -- [1]
					"Maraudon", -- [2]
				},
				[58807] = {
					"Vestige of Hatred", -- [1]
					"Shado-Pan Monastery", -- [2]
				},
				[10436] = {
					"Baroness Anastari", -- [1]
					"Stratholme", -- [2]
				},
				[76306] = {
					"Grand Defense Construct", -- [1]
					"Skyreach", -- [2]
				},
				[95613] = {
					"Binder Hallaani", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[92330] = {
					"Soul of Socrethar", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[57080] = {
					"Corrupted Scroll", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[45412] = {
					"Lord Aurius Rivendare", -- [1]
					"Stratholme", -- [2]
				},
				[8910] = {
					"Blazing Fireguard", -- [1]
					"Blackrock Depths", -- [2]
				},
				[135231] = {
					"Spectral Brute", -- [1]
					"Kings' Rest", -- [2]
				},
				[128969] = {
					"Ashvane Commander", -- [1]
					"Siege of Boralus", -- [2]
				},
				[26686] = {
					"Ferocious Rhino", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[26693] = {
					"Skadi the Ruthless", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[158452] = {
					"Mindtwist Tendril", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[82400] = {
					"Ogron Brute", -- [1]
					"Highmaul", -- [2]
				},
				[70246] = {
					"Spirit Flayer", -- [1]
					"Throne of Thunder", -- [2]
				},
				[43391] = {
					"Millhouse Manastorm", -- [1]
					"The Stonecore", -- [2]
				},
				[69078] = {
					"Sul the Sandcrawler", -- [1]
					"Throne of Thunder", -- [2]
				},
				[158146] = {
					"Fallen Riftwalker", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[10408] = {
					"Rockwing Gargoyle", -- [1]
					"Stratholme", -- [2]
				},
				[137614] = {
					"Demolishing Terror", -- [1]
					"Siege of Boralus", -- [2]
				},
				[84990] = {
					"Addled Arcanomancer", -- [1]
					"The Everbloom", -- [2]
				},
				[144160] = {
					"Chopper Redhook", -- [1]
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
				[76884] = {
					"Cruelfang", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[74371] = {
					"Splinterbone Captain", -- [1]
					"Razorfen Downs", -- [2]
				},
				[135474] = {
					"Thistle Acolyte", -- [1]
					"Waycrest Manor", -- [2]
				},
				[93952] = {
					"Fel Raven", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[76132] = {
					"Soaring Chakram Master", -- [1]
					"Skyreach", -- [2]
				},
				[49826] = {
					"Bound Rumbler", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[137940] = {
					"Safety Shark", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[26125] = {
					"Battaker", -- [1]
					"Isle of Conquest", -- [2]
				},
				[130436] = {
					"Off-Duty Laborer", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[150154] = {
					"Saurolisk Bonenipper", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[127479] = {
					"The Sand Queen", -- [1]
					"Tol Dagor", -- [2]
				},
				[40577] = {
					"Naz'jar Sentinel", -- [1]
					"Throne of the Tides", -- [2]
				},
				[152201] = {
					"Darkspear Headhunter", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[417] = {
					"Khuunam", -- [1]
					"Isle of Conquest", -- [2]
				},
				[81279] = {
					"Grom'kar Flameslinger", -- [1]
					"Iron Docks", -- [2]
				},
				[53115] = {
					"Molten Lord", -- [1]
					"Firelands", -- [2]
				},
				[43662] = {
					"Unbound Earth Rager", -- [1]
					"The Stonecore", -- [2]
				},
				[69352] = {
					"Vampiric Cave Bat", -- [1]
					"Throne of Thunder", -- [2]
				},
				[10381] = {
					"Ravaged Cadaver", -- [1]
					"Stratholme", -- [2]
				},
				[129227] = {
					"Azerokk", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[158343] = {
					"Organ of Corruption", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[144246] = {
					"K.U.-J.0.", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[47086] = {
					"Crimsonborne Firestarter", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[19632] = {
					"Lykul Stinger", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[53691] = {
					"Shannox", -- [1]
					"Firelands", -- [2]
				},
				[137517] = {
					"Ashvane Destroyer", -- [1]
					"Siege of Boralus", -- [2]
				},
				[78948] = {
					"Tectus", -- [1]
					"Highmaul", -- [2]
				},
				[27973] = {
					"Crystalline Shardling", -- [1]
					"Halls of Stone", -- [2]
				},
				[8889] = {
					"Anvilrage Overseer", -- [1]
					"Blackrock Depths", -- [2]
				},
				[87520] = {
					"Animated Slag", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[130635] = {
					"Stonefury", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[43214] = {
					"Slabhide", -- [1]
					"The Stonecore", -- [2]
				},
				[43127] = {
					"Spirit of Ironstar", -- [1]
					"Blackwing Descent", -- [2]
				},
				[24071] = {
					"Dragonflayer Heartsplitter", -- [1]
					"Utgarde Keep", -- [2]
				},
				[151836] = {
					"Void Horror", -- [1]
					"Emerald Dream - HoA Scenario", -- [2]
				},
				[82519] = {
					"Highmaul Conscript", -- [1]
					"Highmaul", -- [2]
				},
				[9017] = {
					"Lord Incendius", -- [1]
					"Blackrock Depths", -- [2]
				},
				[83390] = {
					"Thunderlord Wrangler", -- [1]
					"Iron Docks", -- [2]
				},
				[87448] = {
					"Ironworker", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[76518] = {
					"Ritual of Bones", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[56762] = {
					"Yu'lon", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[91103] = {
					"Felfire Demolisher", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[76309] = {
					"Grand Defense Construct", -- [1]
					"Skyreach", -- [2]
				},
				[138247] = {
					"Irontide Marauder", -- [1]
					"Siege of Boralus", -- [2]
				},
				[161895] = {
					"Thing From Beyond", -- [1]
					"Tol Dagor", -- [2]
				},
				[87521] = {
					"Iron Slag-Shaper", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[119990] = {
					"Wolf", -- [1]
					"Isle of Conquest", -- [2]
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
				[111856] = {
					"Guardian Gorroc", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[26694] = {
					"Ymirjar Dusk Shaman", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[150159] = {
					"King Gobbamak", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[128455] = {
					"T'lonja", -- [1]
					"Atal'Dazar", -- [2]
				},
				[82532] = {
					"Krush", -- [1]
					"Highmaul", -- [2]
				},
				[53087] = {
					"Right Foot", -- [1]
					"Firelands", -- [2]
				},
				[93023] = {
					"Siegemaster Mar'tak", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[83025] = {
					"Grom'kar Battlemaster", -- [1]
					"Iron Docks", -- [2]
				},
				[87619] = {
					"Gorian Warden", -- [1]
					"Highmaul", -- [2]
				},
				[158092] = {
					"Fallen Heartpiercer", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[150160] = {
					"Scrapbone Bully", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[135761] = {
					"Thundering Totem", -- [1]
					"Kings' Rest", -- [2]
				},
				[79462] = {
					"Blinding Solar Flare", -- [1]
					"Skyreach", -- [2]
				},
				[74927] = {
					"Unstable Slag", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[95813] = {
					"Weaponlord Mehlkhior", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[48049] = {
					"Twilight Whelp", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[163978] = {
					"Darkwhisper Cultist", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[141565] = {
					"Kul Tiran Footman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[58810] = {
					"Fragment of Hatred", -- [1]
					"Shado-Pan Monastery", -- [2]
				},
				[134041] = {
					"Infected Peasant", -- [1]
					"Waycrest Manor", -- [2]
				},
				[82533] = {
					"Smash", -- [1]
					"Highmaul", -- [2]
				},
				[43917] = {
					"Rock Borer", -- [1]
					"The Stonecore", -- [2]
				},
				[56763] = {
					"Regenerating Sha", -- [1]
					"Shado-Pan Monastery", -- [2]
				},
				[136391] = {
					"Heart Guardian", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[143985] = {
					"Absorb-o-Tron", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[40579] = {
					"Deep Murloc Hunter", -- [1]
					"Throne of the Tides", -- [2]
				},
				[17259] = {
					"Bonechewer Hungerer", -- [1]
					"Hellfire Citadel: Ramparts", -- [2]
				},
				[130435] = {
					"Addled Thug", -- [1]
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
				[94816] = {
					"Togdrov", -- [1]
					"Hellfire Citadel", -- [2]
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
				[82534] = {
					"Spike", -- [1]
					"Highmaul", -- [2]
				},
				[152722] = {
					"Fallen Voidspeaker", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[3671] = {
					"Lady Anacondra", -- [1]
					"Wailing Caverns", -- [2]
				},
				[127480] = {
					"Stinging Parasite", -- [1]
					"Tol Dagor", -- [2]
				},
				[53640] = {
					"Flamewaker Sentinel", -- [1]
					"Firelands", -- [2]
				},
				[75451] = {
					"Defiled Spirit", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[137626] = {
					"Demolishing Terror", -- [1]
					"Siege of Boralus", -- [2]
				},
				[79208] = {
					"Blackrock Enforcer", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[76266] = {
					"High Sage Viryx", -- [1]
					"Skyreach", -- [2]
				},
				[74347] = {
					"Mordresh Fire Eye", -- [1]
					"Razorfen Downs", -- [2]
				},
				[87780] = {
					"Slagshop Brute", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[81767] = {
					"Bloodmaul Flamespeaker", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[129547] = {
					"Blacktooth Knuckleduster", -- [1]
					"Freehold", -- [2]
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
				[24200] = {
					"Skarvald the Constructor", -- [1]
					"Utgarde Keep", -- [2]
				},
				[156818] = {
					"Wrathion", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[74475] = {
					"Magmolatus", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[56764] = {
					"Consuming Sha", -- [1]
					"Shado-Pan Monastery", -- [2]
				},
				[93154] = {
					"Gorebound Crone", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[76906] = {
					"Operator Thogar", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[151742] = {
					"Void-Twisted Invader", -- [1]
					"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
				},
				[42691] = {
					"Stonecore Rift Conjurer", -- [1]
					"The Stonecore", -- [2]
				},
				[127490] = {
					"Knight Captain Valyri", -- [1]
					"Tol Dagor", -- [2]
				},
				[12216] = {
					"Poison Sprite", -- [1]
					"Maraudon", -- [2]
				},
				[76865] = {
					"Beastlord Darmac", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[130896] = {
					"Blackout Barrel", -- [1]
					"Freehold", -- [2]
				},
				[89011] = {
					"Rylak Skyterror", -- [1]
					"Iron Docks", -- [2]
				},
				[113113] = {
					"Essence of Nightmare", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[130404] = {
					"Vermin Trapper", -- [1]
					"Freehold", -- [2]
				},
				[157700] = {
					"Agustus Moulaine", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[76267] = {
					"Solar Zealot", -- [1]
					"Skyreach", -- [2]
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
				[87910] = {
					"Gorian Rune-Mender", -- [1]
					"Highmaul", -- [2]
				},
				[155797] = {
					"Animated Guardian", -- [1]
					"Mogu'shan Scenario", -- [2]
				},
				[10409] = {
					"Rockwing Screecher", -- [1]
					"Stratholme", -- [2]
				},
				[150168] = {
					"Toxic Monstrosity", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[122965] = {
					"Vol'kaal", -- [1]
					"Atal'Dazar", -- [2]
				},
				[79466] = {
					"Initiate of the Rising Sun", -- [1]
					"Skyreach", -- [2]
				},
				[94563] = {
					"Gorebound Fanatic", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[157333] = {
					"Darkwhisper Cultist", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[56765] = {
					"Destroying Sha", -- [1]
					"Shado-Pan Monastery", -- [2]
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
				[140447] = {
					"Demolishing Terror", -- [1]
					"Siege of Boralus", -- [2]
				},
				[74349] = {
					"Bloodmaul Magma Binder", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[94947] = {
					"Fel-Starved Trainee", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[58812] = {
					"Hateful Essence", -- [1]
					"Shado-Pan Monastery", -- [2]
				},
				[93156] = {
					"Eredar Faithbreaker", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[135329] = {
					"Matron Bryndle", -- [1]
					"Waycrest Manor", -- [2]
				},
				[138019] = {
					"Kul Tiran Vanguard", -- [1]
					"Siege of Boralus", -- [2]
				},
				[42692] = {
					"Stonecore Bruiser", -- [1]
					"The Stonecore", -- [2]
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
				[45699] = {
					"Twilight Shadow Mender", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[48266] = {
					"Defias Cannon", -- [1]
					"Deadmines", -- [2]
				},
				[54143] = {
					"Molten Flamefather", -- [1]
					"Firelands", -- [2]
				},
				[153755] = {
					"Naeno Megacrash", -- [1]
					"Operation: Mechagon", -- [2]
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
				[85225] = {
					"Gorian Sorcerer", -- [1]
					"Highmaul", -- [2]
				},
				[46083] = {
					"Drakeadon Mongrel", -- [1]
					"Blackwing Descent", -- [2]
				},
				[54015] = {
					"Majordomo Staghelm", -- [1]
					"Firelands", -- [2]
				},
				[8922] = {
					"Bloodhound Mastiff", -- [1]
					"Blackrock Depths", -- [2]
				},
				[152987] = {
					"Faceless Willbreaker", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[157337] = {
					"Spawn of Shad'har", -- [1]
					"Blackwing Descent Scenario", -- [2]
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
				[24201] = {
					"Dalronn the Controller", -- [1]
					"Utgarde Keep", -- [2]
				},
				[94693] = {
					"Siegeworks Technician", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[83578] = {
					"Ogron Laborer", -- [1]
					"Iron Docks", -- [2]
				},
				[152988] = {
					"Faceless Shadowcaller", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[56766] = {
					"Volatile Energy", -- [1]
					"Shado-Pan Monastery", -- [2]
				},
				[157594] = {
					"Lesser Void Elemental", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[36296] = {
					"Apothecary Hummel", -- [1]
					"Shadowfang Keep", -- [2]
				},
				[79469] = {
					"Whirling Dervish", -- [1]
					"Skyreach", -- [2]
				},
				[160183] = {
					"Void Fanatic", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[154524] = {
					"K'thir Mindcarver", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[26536] = {
					"Mindless Servant", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[53120] = {
					"Flamewaker Pathfinder", -- [1]
					"Firelands", -- [2]
				},
				[58959] = {
					"Piptoc", -- [1]
					"Isle of Conquest", -- [2]
				},
				[41378] = {
					"Maloriak", -- [1]
					"Blackwing Descent", -- [2]
				},
				[122968] = {
					"Yazma", -- [1]
					"Atal'Dazar", -- [2]
				},
				[26696] = {
					"Ymirjar Berserker", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[76143] = {
					"Rukhran", -- [1]
					"Skyreach", -- [2]
				},
				[135846] = {
					"Sand-Crusted Striker", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[82682] = {
					"Archmage Sol", -- [1]
					"The Everbloom", -- [2]
				},
				[74480] = {
					"Splinterbone Shadowcaster", -- [1]
					"Razorfen Downs", -- [2]
				},
				[53575] = {
					"Lava Wielder", -- [1]
					"Firelands", -- [2]
				},
				[152718] = {
					"Alleria Windrunner", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[76094] = {
					"Sun Trinket", -- [1]
					"Skyreach", -- [2]
				},
				[45700] = {
					"Twilight Portal Shaper", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[132491] = {
					"Kul Tiran Marksman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[152479] = {
					"Void-Twisted Whelp", -- [1]
					"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
				},
				[80822] = {
					"Night-Twisted Berserker", -- [1]
					"Highmaul", -- [2]
				},
				[127315] = {
					"Reanimation Totem", -- [1]
					"Atal'Dazar", -- [2]
				},
				[155094] = {
					"Mechagon Trooper", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[84399] = {
					"Vicious Mandragora", -- [1]
					"The Everbloom", -- [2]
				},
				[122969] = {
					"Zanchuli Witch-Doctor", -- [1]
					"Atal'Dazar", -- [2]
				},
				[152836] = {
					"Azerite Borer", -- [1]
					"The Maelstrom - Heart of Azeroth", -- [2]
				},
				[56511] = {
					"Corrupt Living Water", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[154552] = {
					"Amathet Zealot", -- [1]
					"Halls of Origination", -- [2]
				},
				[95603] = {
					"Mystic Aaran", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[91241] = {
					"Doom Lord", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[56767] = {
					"Shado-Pan Fire Archer", -- [1]
					"Shado-Pan Monastery", -- [2]
				},
				[130437] = {
					"Mine Rat", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[153760] = {
					"Enthralled Footman", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[53185] = {
					"Flamewaker Overseer", -- [1]
					"Firelands", -- [2]
				},
				[129367] = {
					"Bilge Rat Tempest", -- [1]
					"Siege of Boralus", -- [2]
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
				[43014] = {
					"Imp", -- [1]
					"The Stonecore", -- [2]
				},
				[122970] = {
					"Shadowblade Stalker", -- [1]
					"Atal'Dazar", -- [2]
				},
				[76145] = {
					"Grand Defense Construct", -- [1]
					"Skyreach", -- [2]
				},
				[17517] = {
					"Hellfire Sentry", -- [1]
					"Hellfire Citadel: Ramparts", -- [2]
				},
				[144294] = {
					"Mechagon Tinkerer", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[76102] = {
					"Air Familiar", -- [1]
					"Skyreach", -- [2]
				},
				[43324] = {
					"Cho'gall", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[42188] = {
					"Ozruk", -- [1]
					"The Stonecore", -- [2]
				},
				[78832] = {
					"Grom'kar Man-at-Arms", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[76310] = {
					"Grand Defense Construct", -- [1]
					"Skyreach", -- [2]
				},
				[144295] = {
					"Mechagon Mechanic", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[139946] = {
					"Heart Guardian", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[156577] = {
					"Therum Deepforge", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[74483] = {
					"Death's Head Arachnomancer", -- [1]
					"Razorfen Downs", -- [2]
				},
				[75506] = {
					"Shadowmoon Loyalist", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[157602] = {
					"Drest'agath", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[94185] = {
					"Vanguard Akkelion", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[122971] = {
					"Dazar'ai Juggernaut", -- [1]
					"Atal'Dazar", -- [2]
				},
				[56448] = {
					"Wise Mari", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[76146] = {
					"Grand Defense Construct", -- [1]
					"Skyreach", -- [2]
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
				[12217] = {
					"Corruptor", -- [1]
					"Maraudon", -- [2]
				},
				[93162] = {
					"Umbral Supplicant", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[76914] = {
					"Coldtusk", -- [1]
					"FW Horde Garrison Level 1", -- [2]
				},
				[40584] = {
					"Naz'jar Invader", -- [1]
					"Throne of the Tides", -- [2]
				},
				[42695] = {
					"Stonecore Sentry", -- [1]
					"The Stonecore", -- [2]
				},
				[154550] = {
					"Amathet Sun Priest", -- [1]
					"Halls of Origination", -- [2]
				},
				[136330] = {
					"Soul Thorns", -- [1]
					"Waycrest Manor", -- [2]
				},
				[127497] = {
					"Ashvane Warden", -- [1]
					"Tol Dagor", -- [2]
				},
				[94697] = {
					"Siegeworks Technician", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[84983] = {
					"Spore Image", -- [1]
					"The Everbloom", -- [2]
				},
				[122972] = {
					"Dazar'ai Augur", -- [1]
					"Atal'Dazar", -- [2]
				},
				[41096] = {
					"Naz'jar Spiritmender", -- [1]
					"Throne of the Tides", -- [2]
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
				[86072] = {
					"Oro", -- [1]
					"Highmaul", -- [2]
				},
				[74492] = {
					"Bubonic Geist", -- [1]
					"Razorfen Downs", -- [2]
				},
				[127503] = {
					"Overseer Korgus", -- [1]
					"Tol Dagor", -- [2]
				},
				[135192] = {
					"Honored Raptor", -- [1]
					"Kings' Rest", -- [2]
				},
				[92523] = {
					"Vazeel'fazag", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[139949] = {
					"Plague Doctor", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[130521] = {
					"Freehold Deckhand", -- [1]
					"Freehold", -- [2]
				},
				[3640] = {
					"Evolving Ectoplasm", -- [1]
					"Wailing Caverns", -- [2]
				},
				[93931] = {
					"Gorebound Felcaster", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[76814] = {
					"Flamebender Ka'graz", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[163746] = {
					"Walkie Shockie X1", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[75899] = {
					"Possessed Soul", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[43122] = {
					"Spirit of Corehammer", -- [1]
					"Blackwing Descent", -- [2]
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
				[130522] = {
					"Freehold Shipmate", -- [1]
					"Freehold", -- [2]
				},
				[44999] = {
					"Shen'dralar Watcher", -- [1]
					"Dire Maul", -- [2]
				},
				[131849] = {
					"Crazed Marksman", -- [1]
					"Waycrest Manor", -- [2]
				},
				[42696] = {
					"Stonecore Warbringer", -- [1]
					"The Stonecore", -- [2]
				},
				[144301] = {
					"Living Waste", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[77428] = {
					"Imperator Mar'gok", -- [1]
					"Highmaul", -- [2]
				},
				[83697] = {
					"Grom'kar Deckhand", -- [1]
					"Iron Docks", -- [2]
				},
				[53187] = {
					"Flamewaker Animator", -- [1]
					"Firelands", -- [2]
				},
				[144299] = {
					"Workshop Defender", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[81272] = {
					"Gorian Runemaster", -- [1]
					"Highmaul", -- [2]
				},
				[86256] = {
					"Gorian High Sorcerer", -- [1]
					"Highmaul", -- [2]
				},
				[129371] = {
					"Riptide Shredder", -- [1]
					"Siege of Boralus", -- [2]
				},
				[53635] = {
					"Cinderweb Drone", -- [1]
					"Firelands", -- [2]
				},
				[74875] = {
					"Death Speaker Blackthorn", -- [1]
					"Razorfen Downs", -- [2]
				},
				[132532] = {
					"Kul Tiran Marksman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[133389] = {
					"Galvazzt", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[130011] = {
					"Irontide Buccaneer", -- [1]
					"Freehold", -- [2]
				},
				[81522] = {
					"Witherbark", -- [1]
					"The Everbloom", -- [2]
				},
				[27977] = {
					"Krystallus", -- [1]
					"Halls of Stone", -- [2]
				},
				[138369] = {
					"Footbomb Hooligan", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[144303] = {
					"G.U.A.R.D.", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[45687] = {
					"Twilight-Shifter", -- [1]
					"The Bastion of Twilight", -- [2]
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
				[150276] = {
					"Heavy Scrapbot", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[129372] = {
					"Blacktar Bomber", -- [1]
					"Siege of Boralus", -- [2]
				},
				[92526] = {
					"Zerik'shekor", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[84978] = {
					"Bloodmaul Enforcer", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[52498] = {
					"Beth'tilac", -- [1]
					"Firelands", -- [2]
				},
				[111333] = {
					"Taintheart Trickster", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[61056] = {
					"Primal Earth Elemental", -- [1]
					"Isle of Conquest", -- [2]
				},
				[130012] = {
					"Irontide Ravager", -- [1]
					"Freehold", -- [2]
				},
				[81780] = {
					"Guard Captain Thag", -- [1]
					"Highmaul", -- [2]
				},
				[79093] = {
					"Skyreach Sun Talon", -- [1]
					"Skyreach", -- [2]
				},
				[150190] = {
					"HK-8 Aerial Oppression Unit", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[17871] = {
					"Underbog Shambler", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[127757] = {
					"Reanimated Honor Guard", -- [1]
					"Atal'Dazar", -- [2]
				},
				[3840] = {
					"Druid of the Fang", -- [1]
					"Wailing Caverns", -- [2]
				},
				[53188] = {
					"Flamewaker Subjugator", -- [1]
					"Firelands", -- [2]
				},
				[131847] = {
					"Waycrest Reveler", -- [1]
					"Waycrest Manor", -- [2]
				},
				[80423] = {
					"Thunderlord Beast-Tender", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[92911] = {
					"Hulking Berserker", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[92527] = {
					"Dag'gorath", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[80708] = {
					"Iron Taskmaster", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[76407] = {
					"Ner'zhul", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[74488] = {
					"Frozen Soul", -- [1]
					"Razorfen Downs", -- [2]
				},
				[157356] = {
					"Extractor Thelsara", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[157612] = {
					"Eye of Drest'agath", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[93295] = {
					"Darkcaster Adept", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[135366] = {
					"Blacktooth Arsonist", -- [1]
					"Tol Dagor", -- [2]
				},
				[81269] = {
					"Warden Thul'tok", -- [1]
					"Highmaul", -- [2]
				},
				[92913] = {
					"Gorebound Berserker", -- [1]
					"Hellfire Citadel", -- [2]
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
				[134331] = {
					"King Rahu'ai", -- [1]
					"Kings' Rest", -- [2]
				},
				[129552] = {
					"Monzumi", -- [1]
					"Atal'Dazar", -- [2]
				},
				[135975] = {
					"Off-Duty Laborer", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[88818] = {
					"Security Guard", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[141495] = {
					"Kul Tiran Footman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[74489] = {
					"Thorn Eater Ghoul", -- [1]
					"Razorfen Downs", -- [2]
				},
				[68476] = {
					"Horridon", -- [1]
					"Throne of Thunder", -- [2]
				},
				[157614] = {
					"Tentacle of Drest'agath", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[3636] = {
					"Deviate Ravager", -- [1]
					"Wailing Caverns", -- [2]
				},
				[135699] = {
					"Ashvane Jailer", -- [1]
					"Tol Dagor", -- [2]
				},
				[87411] = {
					"Workshop Guardian", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[118244] = {
					"Spirit Beast", -- [1]
					"Isle of Conquest", -- [2]
				},
				[81270] = {
					"Gorian Guardsman", -- [1]
					"Highmaul", -- [2]
				},
				[85748] = {
					"Iron Mauler", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[150295] = {
					"Tank Buster MK1", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[78583] = {
					"Dominator Turret", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[17455] = {
					"Bonechewer Beastmaster", -- [1]
					"Hellfire Citadel: Ramparts", -- [2]
				},
				[129758] = {
					"Irontide Grenadier", -- [1]
					"Freehold", -- [2]
				},
				[150195] = {
					"Gnome-Eating Slime", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[75975] = {
					"Skyreach Overlord", -- [1]
					"Skyreach", -- [2]
				},
				[94832] = {
					"Gorebound Assassin", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[74490] = {
					"Boneflayer Ghoul", -- [1]
					"Razorfen Downs", -- [2]
				},
				[135258] = {
					"Irontide Marauder", -- [1]
					"Siege of Boralus", -- [2]
				},
				[75715] = {
					"Reanimated Ritual Bones", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[129373] = {
					"Dockhound Packmaster", -- [1]
					"Siege of Boralus", -- [2]
				},
				[27978] = {
					"Sjonnir The Ironshaper", -- [1]
					"Halls of Stone", -- [2]
				},
				[134599] = {
					"Imbued Stormcaller", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[91634] = {
					"Wrathguard Cleaver", -- [1]
					"Broken Shore", -- [2]
				},
				[130655] = {
					"Bobby Howlis", -- [1]
					"Tol Dagor", -- [2]
				},
				[95984] = {
					"Mo'arg Brutalizer", -- [1]
					"Broken Shore", -- [2]
				},
				[40586] = {
					"Lady Naz'jar", -- [1]
					"Throne of the Tides", -- [2]
				},
				[92146] = {
					"Gurtogg Bloodboil", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[82039] = {
					"Rockspine Stinger", -- [1]
					"The Everbloom", -- [2]
				},
				[135971] = {
					"Faithless Conscript", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[76154] = {
					"Skyreach Raven Whisperer", -- [1]
					"Skyreach", -- [2]
				},
				[85241] = {
					"Night-Twisted Brute", -- [1]
					"Highmaul", -- [2]
				},
				[137473] = {
					"Guard Captain Atu", -- [1]
					"Kings' Rest", -- [2]
				},
				[88820] = {
					"Furnace Engineer", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[45703] = {
					"Faceless Minion", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[74486] = {
					"Freezing Spirit", -- [1]
					"Razorfen Downs", -- [2]
				},
				[93298] = {
					"Shadowheart Fiend", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[137233] = {
					"Plague Toad", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[130400] = {
					"Irontide Crusher", -- [1]
					"Freehold", -- [2]
				},
				[135470] = {
					"Aka'ali the Conqueror", -- [1]
					"Kings' Rest", -- [2]
				},
				[75509] = {
					"Sadana Bloodfury", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[134174] = {
					"Shadow-Borne Witch Doctor", -- [1]
					"Kings' Rest", -- [2]
				},
				[52530] = {
					"Alysrazor", -- [1]
					"Firelands", -- [2]
				},
				[151798] = {
					"Vexiona", -- [1]
					"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
				},
				[137405] = {
					"Gripping Terror", -- [1]
					"Siege of Boralus", -- [2]
				},
				[95408] = {
					"Anetheron", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[127482] = {
					"Sewer Vicejaw", -- [1]
					"Tol Dagor", -- [2]
				},
				[75713] = {
					"Shadowmoon Bone-Mender", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[41376] = {
					"Nefarian", -- [1]
					"Blackwing Descent", -- [2]
				},
				[88821] = {
					"Bellows Operator", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[78714] = {
					"Kargath Bladefist", -- [1]
					"Highmaul", -- [2]
				},
				[157620] = {
					"Prophet Skitra", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[53140] = {
					"Son of Flame", -- [1]
					"Firelands", -- [2]
				},
				[53134] = {
					"Ancient Core Hound", -- [1]
					"Firelands", -- [2]
				},
				[95602] = {
					"Mystic Velruun", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[91636] = {
					"Ravenous Felstalker", -- [1]
					"Broken Shore", -- [2]
				},
				[150712] = {
					"Trixie Tazer", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[12201] = {
					"Princess Theradras", -- [1]
					"Maraudon", -- [2]
				},
				[153401] = {
					"K'thir Dominator", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[129231] = {
					"Rixxa Fluxflame", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[44600] = {
					"Halfus Wyrmbreaker", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[41918] = {
					"Animated Bone Warrior", -- [1]
					"Blackwing Descent", -- [2]
				},
				[90485] = {
					"Felfire Artillery", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[158478] = {
					"Corruption Tumor", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[34793] = {
					"Catapult", -- [1]
					"Isle of Conquest", -- [2]
				},
				[48521] = {
					"Defias Squallshaper", -- [1]
					"Deadmines", -- [2]
				},
				[29735] = {
					"Savage Worg", -- [1]
					"Utgarde Keep", -- [2]
				},
				[84984] = {
					"Spore Image", -- [1]
					"The Everbloom", -- [2]
				},
				[42649] = {
					"Drakonid Chainwielder", -- [1]
					"Blackwing Descent", -- [2]
				},
				[81985] = {
					"Everbloom Tender", -- [1]
					"The Everbloom", -- [2]
				},
				[17264] = {
					"Bonechewer Ravener", -- [1]
					"Hellfire Citadel: Ramparts", -- [2]
				},
				[42764] = {
					"Pyrecraw", -- [1]
					"Blackwing Descent", -- [2]
				},
				[129366] = {
					"Bilge Rat Buccaneer", -- [1]
					"Siege of Boralus", -- [2]
				},
				[53127] = {
					"Fire Scorpion", -- [1]
					"Firelands", -- [2]
				},
				[77692] = {
					"Kromog", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[92391] = {
					"Gorebound Bloodletter", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[157811] = {
					"Lilliam Sparkspindle", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[160182] = {
					"Void Initiate", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[135048] = {
					"Gorestained Piglet", -- [1]
					"Waycrest Manor", -- [2]
				},
				[69131] = {
					"Frost King Malakk", -- [1]
					"Throne of Thunder", -- [2]
				},
				[74366] = {
					"Forgemaster Gog'duh", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[53639] = {
					"Flamewaker Cauterizer", -- [1]
					"Firelands", -- [2]
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
				[27979] = {
					"Forged Iron Trogg", -- [1]
					"Halls of Stone", -- [2]
				},
				[43735] = {
					"Elementium Monstrosity", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[154554] = {
					"Amathet Guardian", -- [1]
					"Halls of Origination", -- [2]
				},
				[93813] = {
					"Contracted Engineer", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[136643] = {
					"Azerite Extractor", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[159416] = {
					"Spiked Tentacle", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[27975] = {
					"Maiden of Grief", -- [1]
					"Halls of Stone", -- [2]
				},
				[53695] = {
					"Rageface", -- [1]
					"Firelands", -- [2]
				},
				[78077] = {
					"Volatile Anomaly", -- [1]
					"Highmaul", -- [2]
				},
				[74478] = {
					"Death's Head Shadowmender", -- [1]
					"Razorfen Downs", -- [2]
				},
				[154555] = {
					"Amathet Artificer", -- [1]
					"Halls of Origination", -- [2]
				},
				[90981] = {
					"Balnazzar", -- [1]
					"Broken Shore", -- [2]
				},
				[48522] = {
					"Defias Pirate", -- [1]
					"Deadmines", -- [2]
				},
				[150169] = {
					"Toxic Lurker", -- [1]
					"Operation: Mechagon", -- [2]
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
				[77182] = {
					"Oregorger", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[54445] = {
					"Echo of Jaina", -- [1]
					"End Time", -- [2]
				},
				[53619] = {
					"Druid of the Flame", -- [1]
					"Firelands", -- [2]
				},
				[53128] = {
					"Giant Fire Scorpion", -- [1]
					"Firelands", -- [2]
				},
				[83623] = {
					"Bloodmaul Warder", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[134157] = {
					"Shadow-Borne Warrior", -- [1]
					"Kings' Rest", -- [2]
				},
				[26668] = {
					"Svala Sorrowgrave", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[76778] = {
					"Life-Pact Familiar", -- [1]
					"Skyreach", -- [2]
				},
				[150165] = {
					"Slime Elemental", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[76104] = {
					"Monstrous Corpse Spider", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[17771] = {
					"Murkblood Oracle", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[153022] = {
					"Snang", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[84859] = {
					"Iron Cleaver", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[12222] = {
					"Creeping Sludge", -- [1]
					"Maraudon", -- [2]
				},
				[93303] = {
					"Slavering Hound", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[126928] = {
					"Irontide Corsair", -- [1]
					"Freehold", -- [2]
				},
				[131785] = {
					"Buzzing Drone", -- [1]
					"Tol Dagor", -- [2]
				},
				[111858] = {
					"Guardian Rurson", -- [1]
					"The Emerald Nightmare", -- [2]
				},
				[130661] = {
					"Venture Co. Earthshaper", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[134600] = {
					"Sandswept Marksman", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[69455] = {
					"Zandalari Water-Binder", -- [1]
					"Throne of Thunder", -- [2]
				},
				[151579] = {
					"Shield Generator", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[53222] = {
					"Flamewaker Centurion", -- [1]
					"Firelands", -- [2]
				},
				[152835] = {
					"Crystalized Azerite", -- [1]
					"The Maelstrom - Heart of Azeroth", -- [2]
				},
				[137029] = {
					"Ordnance Specialist", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[133379] = {
					"Adderis", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[129550] = {
					"Bilge Rat Padfoot", -- [1]
					"Freehold", -- [2]
				},
				[135759] = {
					"Earthwall Totem", -- [1]
					"Kings' Rest", -- [2]
				},
				[84860] = {
					"Iron Earthbinder", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[41442] = {
					"Atramedes", -- [1]
					"Blackwing Descent", -- [2]
				},
				[94861] = {
					"Grim Ambusher", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[54920] = {
					"Infinite Suppressor", -- [1]
					"End Time", -- [2]
				},
				[86611] = {
					"Mind Fungus", -- [1]
					"Highmaul", -- [2]
				},
				[81297] = {
					"Dreadfang", -- [1]
					"Iron Docks", -- [2]
				},
				[82528] = {
					"Gorian Arcanist", -- [1]
					"Highmaul", -- [2]
				},
				[134602] = {
					"Shrouded Fang", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[76307] = {
					"Grand Defense Construct", -- [1]
					"Skyreach", -- [2]
				},
				[105427] = {
					"Skyfury Totem", -- [1]
					"Isle of Conquest", -- [2]
				},
				[151658] = {
					"Strider Tonk", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[135240] = {
					"Soul Essence", -- [1]
					"Waycrest Manor", -- [2]
				},
				[45261] = {
					"Twilight Shadow Knight", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[8905] = {
					"Warbringer Construct", -- [1]
					"Blackrock Depths", -- [2]
				},
				[70276] = {
					"No'ku Stormsayer", -- [1]
					"Throne of Thunder", -- [2]
				},
				[17770] = {
					"Hungarfen", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[150253] = {
					"Weaponized Crawler", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[84989] = {
					"Infested Icecaller", -- [1]
					"The Everbloom", -- [2]
				},
				[152833] = {
					"Azerite Giant", -- [1]
					"The Maelstrom - Heart of Azeroth", -- [2]
				},
				[162238] = {
					"Darkwhisper Cultist", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[144071] = {
					"Irontide Waveshaper", -- [1]
					"Siege of Boralus", -- [2]
				},
				[136139] = {
					"Mechanized Peacekeeper", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[75209] = {
					"Molten Earth Elemental", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[154744] = {
					"Toxic Monstrosity", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[81114] = {
					"Gronnling Laborer", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[24078] = {
					"Dragonflayer Metalworker", -- [1]
					"Utgarde Keep", -- [2]
				},
				[80400] = {
					"Iron Assembly Warden", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[158056] = {
					"Rat", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[61412] = {
					"Dark Shaman Koranthal", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[95652] = {
					"Grand Corruptor U'rogg", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[129640] = {
					"Snarling Dockhound", -- [1]
					"Siege of Boralus", -- [2]
				},
				[92039] = {
					"Bleeding Grunt", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[159425] = {
					"Occult Shadowmender", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[130024] = {
					"Soggy Shiprat", -- [1]
					"Freehold", -- [2]
				},
				[151659] = {
					"Rocket Tonk", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[12203] = {
					"Landslide", -- [1]
					"Maraudon", -- [2]
				},
				[137969] = {
					"Interment Construct", -- [1]
					"Kings' Rest", -- [2]
				},
				[42767] = {
					"Ivoroc", -- [1]
					"Blackwing Descent", -- [2]
				},
				[48415] = {
					"Twilight Spitecaller", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[90409] = {
					"Gorebound Felcaster", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[76444] = {
					"Subjugated Soul", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[78932] = {
					"Driving Gale-Caller", -- [1]
					"Skyreach", -- [2]
				},
				[26669] = {
					"Ymirjar Savage", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[74579] = {
					"Molten Elemental", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[46262] = {
					"Rumbling Earth", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[86526] = {
					"Grom'kar Chainmaster", -- [1]
					"Iron Docks", -- [2]
				},
				[161408] = {
					"Malicious Growth", -- [1]
					"Kings' Rest", -- [2]
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
				[10412] = {
					"Crypt Crawler", -- [1]
					"Stratholme", -- [2]
				},
				[17270] = {
					"Bleeding Hollow Archer", -- [1]
					"Hellfire Citadel: Ramparts", -- [2]
				},
				[92041] = {
					"Bleeding Darkcaster", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[13599] = {
					"Stolid Snapjaw", -- [1]
					"Maraudon", -- [2]
				},
				[13141] = {
					"Deeprot Stomper", -- [1]
					"Maraudon", -- [2]
				},
				[75652] = {
					"Void Spawn", -- [1]
					"Shadowmoon Burial Grounds", -- [2]
				},
				[69639] = {
					"Humming Crystal", -- [1]
					"Throne of Thunder", -- [2]
				},
				[8477] = {
					"Skeletal Servant", -- [1]
					"Stratholme", -- [2]
				},
				[1860] = {
					"Jhazdok", -- [1]
					"Isle of Conquest", -- [2]
				},
				[90272] = {
					"Ancient Sovereign", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[76292] = {
					"Skyreach Shield Construct", -- [1]
					"Skyreach", -- [2]
				},
				[7343] = {
					"Splinterbone Skeleton", -- [1]
					"Razorfen Downs", -- [2]
				},
				[56713] = {
					"Master Snowdrift", -- [1]
					"Shado-Pan Monastery", -- [2]
				},
				[88589] = {
					"Boar", -- [1]
					"Temple of Kotmogu", -- [2]
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
				[8913] = {
					"Twilight Emissary", -- [1]
					"Blackrock Depths", -- [2]
				},
				[42768] = {
					"Maimgor", -- [1]
					"Blackwing Descent", -- [2]
				},
				[80048] = {
					"Vul'gor", -- [1]
					"Highmaul", -- [2]
				},
				[17269] = {
					"Bleeding Hollow Darkcaster", -- [1]
					"Hellfire Citadel: Ramparts", -- [2]
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
				[131670] = {
					"Heartsbane Vinetwister", -- [1]
					"Waycrest Manor", -- [2]
				},
				[67977] = {
					"Tortos", -- [1]
					"Throne of Thunder", -- [2]
				},
				[86684] = {
					"Feral Lasher", -- [1]
					"The Everbloom", -- [2]
				},
				[46382] = {
					"Petty Criminal", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[17727] = {
					"Wrathfin Sentry", -- [1]
					"Coilfang: The Underbog", -- [2]
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
				[75193] = {
					"Bloodmaul Overseer", -- [1]
					"Bloodmaul Slag Mines", -- [2]
				},
				[17309] = {
					"Hellfire Watcher", -- [1]
					"Hellfire Citadel: Ramparts", -- [2]
				},
				[17730] = {
					"Murkblood Healer", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[24079] = {
					"Dragonflayer Forge Master", -- [1]
					"Utgarde Keep", -- [2]
				},
				[27964] = {
					"Dark Rune Scholar", -- [1]
					"Halls of Stone", -- [2]
				},
				[17726] = {
					"Wrathfin Myrmidon", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[77404] = {
					"The Butcher", -- [1]
					"Highmaul", -- [2]
				},
				[24207] = {
					"Army of the Dead", -- [1]
					"Isle of Conquest", -- [2]
				},
				[46251] = {
					"Riverpaw Looter", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[8896] = {
					"Shadowforge Peasant", -- [1]
					"Blackrock Depths", -- [2]
				},
				[23953] = {
					"Prince Keleseth", -- [1]
					"Utgarde Keep", -- [2]
				},
				[76806] = {
					"Heart of the Mountain", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[17734] = {
					"Underbog Lord", -- [1]
					"Coilfang: The Underbog", -- [2]
				},
				[54923] = {
					"Infinite Warden", -- [1]
					"End Time", -- [2]
				},
				[150222] = {
					"Gunker", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[40935] = {
					"Gilgoblin Hunter", -- [1]
					"Throne of the Tides", -- [2]
				},
				[24849] = {
					"Proto-Drake Rider", -- [1]
					"Utgarde Keep", -- [2]
				},
				[65414] = {
					"Ethereal Sha", -- [1]
					"Shado-Pan Monastery", -- [2]
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
				[26690] = {
					"Ymirjar Warrior", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[45264] = {
					"Twilight Crossfire", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[129517] = {
					"Reanimated Raptor", -- [1]
					"Atal'Dazar", -- [2]
				},
				[58856] = {
					"Haunting Sha", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[53141] = {
					"Molten Surger", -- [1]
					"Firelands", -- [2]
				},
				[58198] = {
					"Shado-Pan Disciple", -- [1]
					"Shado-Pan Monastery", -- [2]
				},
				[43537] = {
					"Stonecore Earthshaper", -- [1]
					"The Stonecore", -- [2]
				},
				[56541] = {
					"Master Snowdrift", -- [1]
					"Shado-Pan Monastery", -- [2]
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
				[40943] = {
					"Gilgoblin Aquamage", -- [1]
					"Throne of the Tides", -- [2]
				},
				[134616] = {
					"Krolusk Pup", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[81305] = {
					"Fleshrender Nok'gar", -- [1]
					"Iron Docks", -- [2]
				},
				[40923] = {
					"Unstable Corruption", -- [1]
					"Throne of the Tides", -- [2]
				},
				[56395] = {
					"Shado-Pan Novice", -- [1]
					"Shado-Pan Monastery", -- [2]
				},
				[133593] = {
					"Expert Technician", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[59547] = {
					"Jiang", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[27985] = {
					"Iron Golem Custodian", -- [1]
					"Halls of Stone", -- [2]
				},
				[26687] = {
					"Gortok Palehoof", -- [1]
					"Utgarde Pinnacle", -- [2]
				},
				[134617] = {
					"Krolusk Hatchling", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[58826] = {
					"Zao Sunseeker", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[27960] = {
					"Dark Rune Warrior", -- [1]
					"Halls of Stone", -- [2]
				},
				[129598] = {
					"Freehold Pack Mule", -- [1]
					"Freehold", -- [2]
				},
				[158158] = {
					"Forge-Guard Hurrul", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[36565] = {
					"Apothecary Baxter", -- [1]
					"Shadowfang Keep", -- [2]
				},
				[162764] = {
					"Twisted Appendage", -- [1]
					"Waycrest Manor", -- [2]
				},
				[44648] = {
					"Unyielding Behemoth", -- [1]
					"Throne of the Tides", -- [2]
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
				[137487] = {
					"Skeletal Hunting Raptor", -- [1]
					"Kings' Rest", -- [2]
				},
				[42333] = {
					"High Priestess Azil", -- [1]
					"The Stonecore", -- [2]
				},
				[45265] = {
					"Twilight Soul Blade", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[61705] = {
					"Corrupted Flamecaller", -- [1]
					"Ragefire Chasm", -- [2]
				},
				[91681] = {
					"Ravenous Felstalker", -- [1]
					"Broken Shore", -- [2]
				},
				[59546] = {
					"The Talking Fish", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[56719] = {
					"Sha of Violence", -- [1]
					"Shado-Pan Monastery", -- [2]
				},
				[76809] = {
					"Foreman Feldspar", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[56473] = {
					"Flying Snow", -- [1]
					"Shado-Pan Monastery", -- [2]
				},
				[27982] = {
					"Forged Iron Dwarf", -- [1]
					"Halls of Stone", -- [2]
				},
				[91522] = {
					"Protector Bajunt", -- [1]
					"Hellfire Citadel", -- [2]
				},
				[157709] = {
					"Dreliana", -- [1]
					"Blackwing Descent Scenario", -- [2]
				},
				[134364] = {
					"Faithless Tender", -- [1]
					"Temple of Sethraliss", -- [2]
				},
				[157137] = {
					"Terror Tendril", -- [1]
					"Halls of Origination", -- [2]
				},
				[83846] = {
					"Yalnu", -- [1]
					"The Everbloom", -- [2]
				},
				[24080] = {
					"Dragonflayer Weaponsmith", -- [1]
					"Utgarde Keep", -- [2]
				},
				[154727] = {
					"Sun Prophet Tenhamen", -- [1]
					"Halls of Origination", -- [2]
				},
				[155680] = {
					"Deephive Summoner", -- [1]
					"Mogu'shan Scenario", -- [2]
				},
				[155930] = {
					"Deephive Chosen", -- [1]
					"Mogu'shan Scenario", -- [2]
				},
				[159767] = {
					"Sanguimar", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[52558] = {
					"Lord Rhyolith", -- [1]
					"Firelands", -- [2]
				},
				[18131] = {
					"Nether Ray", -- [1]
					"Isle of Conquest", -- [2]
				},
				[159312] = {
					"Living Blood", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[76810] = {
					"Furnace Engineer", -- [1]
					"Blackrock Foundry", -- [2]
				},
				[158171] = {
					"Faceless Destroyer", -- [1]
					"Halls of Origination", -- [2]
				},
				[157483] = {
					"Ysedra the Darkener", -- [1]
					"Halls of Origination", -- [2]
				},
				[161815] = {
					"K'thir Voidcaller", -- [1]
					"Chamber of Heart - Scenario", -- [2]
				},
				[144232] = {
					"Rowdy Reveler", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
			},
			["border_color"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				0.8400000035762787, -- [4]
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
						["role"] = {
						},
						["pvptalent"] = {
						},
						["race"] = {
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
						["role"] = {
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
						["race"] = {
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
						["race"] = {
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
						["role"] = {
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
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_reorder",
					["LastHookEdited"] = "",
				}, -- [14]
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
			["range_check_health_bar_alpha"] = 1,
			["health_statusbar_bgcolor"] = {
				0.1137254901960784, -- [1]
				0.1137254901960784, -- [2]
				0.1137254901960784, -- [3]
				0.8900000005960464, -- [4]
			},
			["health_selection_overlay_alpha"] = 0.1015491858124733,
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
				["Jaina Encounter"] = 6,
				["Execute Range"] = 1,
				["Extra Border"] = 2,
				["Combo Points"] = 3,
				["Attacking Specific Unit"] = 1,
				["Target Color"] = 3,
				["Aura Reorder"] = 1,
				["Hide Neutral Units"] = 1,
			},
			["update_throttle"] = 0.05000000074505806,
			["captured_spells"] = {
				[204598] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[167898] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jekserah-Alleria",
					["npcID"] = 0,
				},
				[315336] = {
					["source"] = "Tent",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 161974,
				},
				[276207] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[269302] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hired Assassin",
					["npcID"] = 134232,
				},
				[115151] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[276208] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[2050] = {
					["source"] = "Nédara",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[276209] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[32752] = {
					["type"] = "BUFF",
					["source"] = "One-Azuremyst",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[278767] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[276210] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[276211] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[162530] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[276212] = {
					["npcID"] = 129232,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mogul Razdunk",
					["encounterID"] = 2108,
				},
				[272121] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Výñ-Madoran",
					["npcID"] = 0,
				},
				[268797] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Venture Co. Alchemist",
					["npcID"] = 133432,
				},
				[2094] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[23881] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[304603] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Obsydion",
					["npcID"] = 0,
				},
				[279029] = {
					["type"] = "BUFF",
					["source"] = "Rodtod-Mal'Ganis",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279541] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Chumacer-Sargeras",
					["npcID"] = 0,
				},
				[281843] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[48018] = {
					["type"] = "BUFF",
					["source"] = "Barrywittier-Illidan",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257544] = {
					["type"] = "DEBUFF",
					["source"] = "Earthrager",
					["npcID"] = 129802,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2106,
				},
				[281844] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[304606] = {
					["type"] = "DEBUFF",
					["source"] = "Groscrise-Mal'Ganis",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[271103] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[216113] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[308188] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wizzbangg-Dalaran",
					["npcID"] = 0,
				},
				[279033] = {
					["type"] = "BUFF",
					["source"] = "Rodtod-Mal'Ganis",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[190411] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[260103] = {
					["npcID"] = 0,
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2107,
				},
				[262412] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mechanized Peacekeeper",
					["npcID"] = 130485,
				},
				[17] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Spdunni-Arthas",
					["npcID"] = 0,
				},
				[306146] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Spdunni-Arthas",
					["npcID"] = 0,
				},
				[136] = {
					["source"] = "Mazapany-Thrall",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[304612] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Obsydion",
					["npcID"] = 0,
				},
				[288756] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[269831] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[124682] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[315356] = {
					["type"] = "BUFF",
					["source"] = "Caravaneer's Pack",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 162001,
				},
				[268810] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Test Subject",
					["npcID"] = 133963,
				},
				[262161] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[222256] = {
					["type"] = "BUFF",
					["source"] = "Lopow-Thrall",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[215479] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[139] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rudeilyn-Dalaran",
					["npcID"] = 0,
				},
				[87024] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Eskeetit-Stormreaver",
					["npcID"] = 0,
				},
				[556] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Obsydion",
					["npcID"] = 0,
				},
				[54861] = {
					["type"] = "BUFF",
					["source"] = "Velaniya-Illidan",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[260364] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[113942] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Aracendra-Arthas",
					["npcID"] = 0,
				},
				[313571] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[268815] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 133963,
				},
				[196555] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[188499] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[48020] = {
					["type"] = "BUFF",
					["source"] = "Barrywittier-Illidan",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288509] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Holyqt-Thunderlord",
					["npcID"] = 0,
				},
				[271374] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[248473] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cresto-Azuremyst",
					["npcID"] = 0,
				},
				[289277] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[280583] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[188501] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[302580] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Spdunni-Arthas",
					["npcID"] = 0,
				},
				[262940] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 133753,
				},
				[212799] = {
					["type"] = "BUFF",
					["source"] = "Takethetip-Azgalor",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[203720] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[285959] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[260369] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[259474] = {
					["npcID"] = 129231,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rixxa Fluxflame",
					["encounterID"] = 2107,
				},
				[198222] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[267546] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rowdy Reveler",
					["npcID"] = 144231,
				},
				[260881] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Shãmikaze-Thrall",
					["npcID"] = 0,
				},
				[1160] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[273685] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[206151] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[317420] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Verdicked",
					["npcID"] = 0,
				},
				[29893] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kågg-Arthas",
					["npcID"] = 0,
				},
				[263202] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Venture Co. Earthshaper",
					["npcID"] = 130661,
				},
				[247456] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[24858] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Pizzaisgood",
					["npcID"] = 0,
				},
				[269085] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[185565] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[260372] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Venture Co. Skyscorcher",
					["npcID"] = 133436,
				},
				[118038] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[253595] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Revert-Kel'Thuzad",
					["npcID"] = 0,
				},
				[292360] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tejano-Kel'Thuzad",
					["npcID"] = 0,
				},
				[6770] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[119381] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[131347] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[292361] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[300801] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[221883] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[185311] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[281621] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mech Jockey",
					["npcID"] = 130488,
				},
				[203981] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[271903] = {
					["type"] = "BUFF",
					["source"] = "Coin-Operated Crowd Pummeler",
					["npcID"] = 129214,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2105,
				},
				[269090] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ordnance Specialist",
					["npcID"] = 137029,
				},
				[292364] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mòrtem",
					["npcID"] = 0,
				},
				[48438] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Junataro-Dalaran",
					["npcID"] = 0,
				},
				[263209] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mine Rat",
					["npcID"] = 130437,
				},
				[269092] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Ordnance Specialist",
					["npcID"] = 137029,
				},
				[267558] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dtkbaebae-LaughingSkull",
					["npcID"] = 0,
				},
				[35395] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[280602] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mech Jockey",
					["npcID"] = 130488,
				},
				[212295] = {
					["type"] = "BUFF",
					["source"] = "Groscrise-Mal'Ganis",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267560] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Katarinita-Zuluhed",
					["npcID"] = 0,
				},
				[235313] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Eskeetit-Stormreaver",
					["npcID"] = 0,
				},
				[294926] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[46968] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[121557] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wysp-Arthas",
					["npcID"] = 0,
				},
				[223677] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Jekserah-Alleria",
					["npcID"] = 0,
				},
				[280605] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Refreshment Vendor",
					["npcID"] = 136470,
				},
				[201427] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[224189] = {
					["type"] = "BUFF",
					["source"] = "Mandracor-Wildhammer",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[285721] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Onisoma-Zul'jin",
					["npcID"] = 0,
				},
				[101545] = {
					["source"] = "Pocketpunk-Thrall",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[191837] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[45242] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Spdunni-Arthas",
					["npcID"] = 0,
				},
				[279584] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Vàlkyríe-Stormrage",
					["npcID"] = 0,
				},
				[285978] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Trexas-Thrall",
					["npcID"] = 0,
				},
				[269099] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Venture Co. War Machine",
					["npcID"] = 133463,
				},
				[285979] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hellboi-Mal'Ganis",
					["npcID"] = 0,
				},
				[137619] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[204242] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[315391] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[107428] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[308742] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[315392] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[101546] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[268846] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Weapons Tester",
					["npcID"] = 136934,
				},
				[289308] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[205523] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[273453] = {
					["type"] = "BUFF",
					["source"] = "Rodtod-Mal'Ganis",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[171253] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wäffle-Zul'jin",
					["npcID"] = 0,
				},
				[192225] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ferrstroz-Dalaran",
					["npcID"] = 0,
				},
				[206803] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[288800] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Deftoniik",
					["npcID"] = 0,
				},
				[633] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["encounterID"] = 2108,
				},
				[264761] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jabari-Dragonmaw",
					["npcID"] = 0,
				},
				[303380] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[72968] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Zelfracx-BleedingHollow",
					["npcID"] = 0,
				},
				[319237] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nochehombre-Stormscale",
					["npcID"] = 0,
				},
				[288803] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Deftoniik",
					["npcID"] = 0,
				},
				[273714] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[209746] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Pizzaisgood",
					["npcID"] = 0,
				},
				[214222] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[268856] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[318216] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[12294] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[274739] = {
					["type"] = "BUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2107,
				},
				[179057] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[147728] = {
					["type"] = "BUFF",
					["source"] = "Lopow-Thrall",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[163201] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[11327] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[274741] = {
					["type"] = "BUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2106,
				},
				[25771] = {
					["type"] = "DEBUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2108,
				},
				[124503] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[208086] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[266047] = {
					["type"] = "BUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2105,
				},
				[260643] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[303390] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[289324] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[216528] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Obsydion",
					["npcID"] = 0,
				},
				[287790] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rikey",
					["npcID"] = 0,
				},
				[268865] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Weapons Tester",
					["npcID"] = 136934,
				},
				[201695] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kurjin-BloodFurnace",
					["npcID"] = 0,
				},
				[45181] = {
					["type"] = "DEBUFF",
					["source"] = "Revvz-Illidan",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[287280] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[210391] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[202335] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[270657] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[318227] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[275773] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[275006] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Vintroxis-Dalaran",
					["npcID"] = 0,
				},
				[30455] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[245686] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wysp-Arthas",
					["npcID"] = 0,
				},
				[280634] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dtkbaebae-LaughingSkull",
					["npcID"] = 0,
				},
				[315161] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[270661] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Revert-Kel'Thuzad",
					["npcID"] = 0,
				},
				[124506] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[8690] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fearboner",
					["npcID"] = 0,
				},
				[281404] = {
					["source"] = "Takethetip-Azgalor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[190446] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[18499] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[190319] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Deftoniik",
					["npcID"] = 0,
				},
				[205025] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Vintroxis-Dalaran",
					["npcID"] = 0,
				},
				[200166] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[257582] = {
					["npcID"] = 129802,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Earthrager",
					["encounterID"] = 2106,
				},
				[97462] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[315681] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Sanarao-Illidan",
					["npcID"] = 0,
				},
				[688] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ferrstroz-Dalaran",
					["npcID"] = 0,
				},
				[294966] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[23055] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[97463] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[199658] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[199786] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[270674] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[273232] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Vàlkyríe-Stormrage",
					["npcID"] = 0,
				},
				[271698] = {
					["npcID"] = 129227,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Azerokk",
					["encounterID"] = 2106,
				},
				[315176] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[196718] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[216411] = {
					["type"] = "BUFF",
					["source"] = "Picklelol",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[313643] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[268887] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Gukasha-BleedingHollow",
					["npcID"] = 0,
				},
				[276304] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rowdy Reveler",
					["npcID"] = 136005,
				},
				[31687] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[202090] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[315179] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fortrêss-Dalaran",
					["npcID"] = 0,
				},
				[202346] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[202602] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wäffle-Zul'jin",
					["npcID"] = 0,
				},
				[280398] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Trexas-Thrall",
					["npcID"] = 0,
				},
				[280654] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[216413] = {
					["type"] = "BUFF",
					["source"] = "Picklelol",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275540] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[267612] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[320297] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[274774] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[302651] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Aesea-Thrall",
					["npcID"] = 0,
				},
				[268893] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Spdunni-Arthas",
					["npcID"] = 0,
				},
				[251836] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bucksnot-Spinebreaker",
					["npcID"] = 0,
				},
				[296003] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Shãmikaze-Thrall",
					["npcID"] = 0,
				},
				[290121] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mikowo-Norgannon",
					["npcID"] = 0,
				},
				[312372] = {
					["type"] = "BUFF",
					["source"] = "Qliq-Malfurion",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5740] = {
					["source"] = "Rázghoul-Cho'gall",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[251837] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Trexas-Thrall",
					["npcID"] = 0,
				},
				[16870] = {
					["type"] = "BUFF",
					["source"] = "Unknown",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268129] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Refreshment Vendor",
					["npcID"] = 136470,
				},
				[31224] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[268130] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Refreshment Vendor",
					["npcID"] = 136470,
				},
				[271711] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[268898] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Vàlkyríe-Stormrage",
					["npcID"] = 0,
				},
				[271456] = {
					["npcID"] = 129232,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mogul Razdunk",
					["encounterID"] = 2108,
				},
				[268899] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Saucystabz-Undermine",
					["npcID"] = 0,
				},
				[251839] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mandlez",
					["npcID"] = 0,
				},
				[246852] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Renyli-Zul'jin",
					["npcID"] = 0,
				},
				[260279] = {
					["npcID"] = 0,
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2108,
				},
				[280409] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[20243] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[107570] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[267367] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mechanized Peacekeeper",
					["npcID"] = 130485,
				},
				[260280] = {
					["type"] = "BUFF",
					["source"] = "Mogul Razdunk",
					["npcID"] = 129232,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2108,
				},
				[202225] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[263276] = {
					["type"] = "DEBUFF",
					["source"] = "Taskmaster Askari",
					["npcID"] = 134012,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2105,
				},
				[121253] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[147367] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[313148] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Spdunni-Arthas",
					["npcID"] = 0,
				},
				[26573] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[268904] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[280413] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[299083] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[279902] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[268905] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[295248] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[156064] = {
					["type"] = "BUFF",
					["source"] = "Demonhuntz-Deathwing",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257597] = {
					["type"] = "BUFF",
					["source"] = "Azerokk",
					["npcID"] = 129227,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2106,
				},
				[262513] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Venture Co. Skyscorcher",
					["npcID"] = 133436,
				},
				[297040] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wizzbangg-Dalaran",
					["npcID"] = 0,
				},
				[108211] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Government-Dalaran",
					["npcID"] = 0,
				},
				[1490] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[262515] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Venture Co. Skyscorcher",
					["npcID"] = 133436,
				},
				[190336] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Botat-Arthas",
					["npcID"] = 0,
				},
				[255936] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mena",
					["npcID"] = 0,
				},
				[288091] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[258622] = {
					["npcID"] = 129227,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Azerokk",
					["encounterID"] = 2106,
				},
				[115181] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[303438] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[32216] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[260669] = {
					["npcID"] = 129231,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rixxa Fluxflame",
					["encounterID"] = 2107,
				},
				[298836] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Míkè-Zul'jin",
					["npcID"] = 0,
				},
				[116844] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[204021] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Swordmaiden-BleedingHollow",
					["encounterID"] = 2106,
				},
				[298837] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Aesea-Thrall",
					["npcID"] = 0,
				},
				[217832] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[303953] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[115310] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[279913] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Varrec-Zul'jin",
					["npcID"] = 0,
				},
				[185736] = {
					["type"] = "BUFF",
					["source"] = "Promey-Thrall",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298839] = {
					["type"] = "BUFF",
					["source"] = "Skoal-Lightning'sBlade",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[304722] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[107574] = {
					["type"] = "BUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2105,
				},
				[269429] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Venture Co. War Machine",
					["npcID"] = 133463,
				},
				[198013] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[298841] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fortrêss-Dalaran",
					["npcID"] = 0,
				},
				[316744] = {
					["type"] = "BUFF",
					["source"] = "Taxmans-Illidan",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[768] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ndxinzhizhu-Illidan",
					["npcID"] = 0,
				},
				[262270] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Venture Co. Alchemist",
					["npcID"] = 133432,
				},
				[256453] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dtkbaebae-LaughingSkull",
					["npcID"] = 0,
				},
				[258627] = {
					["type"] = "BUFF",
					["source"] = "Earthrager",
					["npcID"] = 129802,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2106,
				},
				[258883] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[231390] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Corikko",
					["npcID"] = 0,
				},
				[206966] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[298845] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[122281] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[280177] = {
					["type"] = "BUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2105,
				},
				[300893] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[298848] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[116847] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[781] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Legulass-Onyxia",
					["npcID"] = 0,
				},
				[247121] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[256456] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Auberin",
					["npcID"] = 0,
				},
				[783] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rikey",
					["npcID"] = 0,
				},
				[278134] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[176151] = {
					["type"] = "BUFF",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2106,
				},
				[317265] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[5277] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[204157] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[264776] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mittreeleaf-Illidan",
					["npcID"] = 0,
				},
				[279161] = {
					["source"] = "Ruebenonrye-Zul'jin",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[243435] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[296211] = {
					["type"] = "BUFF",
					["source"] = "Sitonmyjimmy-Mal'Ganis",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298343] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sangelus-Zul'jin",
					["npcID"] = 0,
				},
				[284277] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Trexas-Thrall",
					["npcID"] = 0,
				},
				[256459] = {
					["type"] = "BUFF",
					["source"] = "Kewalala-Illidan",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[259454] = {
					["type"] = "BUFF",
					["source"] = "Skoal-Lightning'sBlade",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[259455] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sangelus-Zul'jin",
					["npcID"] = 0,
				},
				[281209] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Solanthan-Mal'Ganis",
					["npcID"] = 0,
				},
				[44614] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[116849] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[251838] = {
					["type"] = "BUFF",
					["source"] = "Levviathan-Dalaran",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[292463] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[286581] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[100] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[162313] = {
					["type"] = "BUFF",
					["source"] = "Johnbtw-BleedingHollow",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[186257] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Precisiøn",
					["npcID"] = 0,
				},
				[227041] = {
					["type"] = "BUFF",
					["source"] = "Groscrise-Mal'Ganis",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[287660] = {
					["type"] = "BUFF",
					["source"] = "Rázghoul-Cho'gall",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[152108] = {
					["source"] = "Rázghoul-Cho'gall",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[195072] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hellboi-Mal'Ganis",
					["npcID"] = 0,
				},
				[134477] = {
					["type"] = "BUFF",
					["source"] = "睿恩卡祖爾",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 17252,
				},
				[202370] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[278911] = {
					["type"] = "BUFF",
					["source"] = "Celann",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[186258] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Precisiøn",
					["npcID"] = 0,
				},
				[287825] = {
					["type"] = "DEBUFF",
					["source"] = "Norror-BleedingHollow",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[287827] = {
					["type"] = "BUFF",
					["source"] = "Norror-BleedingHollow",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[302917] = {
					["type"] = "BUFF",
					["source"] = "Norror-BleedingHollow",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1449] = {
					["source"] = "Norror-BleedingHollow",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[273286] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Rasheikh-Tichondrius",
					["npcID"] = 0,
				},
				[264774] = {
					["type"] = "BUFF",
					["source"] = "Norror-BleedingHollow",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273428] = {
					["type"] = "BUFF",
					["source"] = "Bruxigar-Ragnaros",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[317020] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Snowsteps-Icecrown",
					["npcID"] = 0,
				},
				[132168] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[2120] = {
					["source"] = "Admilla",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[61684] = {
					["type"] = "BUFF",
					["source"] = "Unknown",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 38453,
				},
				[31661] = {
					["source"] = "Admilla",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[281721] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[2565] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[260811] = {
					["npcID"] = 129232,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mogul Razdunk",
					["encounterID"] = 2108,
				},
				[19750] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[132169] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[109132] = {
					["source"] = "Fuscus-BlackDragonflight",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[214968] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Andräx-Illidan",
					["npcID"] = 0,
				},
				[262804] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Venture Co. Mastermind",
					["npcID"] = 133430,
				},
				[23922] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[279684] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[279028] = {
					["type"] = "BUFF",
					["source"] = "Rodtod-Mal'Ganis",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[408] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[257410] = {
					["type"] = "BUFF",
					["source"] = "Nédara",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[198793] = {
					["source"] = "Crazygenius-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[306474] = {
					["type"] = "DEBUFF",
					["source"] = "Picklelol",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[197003] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[300802] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[116095] = {
					["type"] = "DEBUFF",
					["source"] = "Heisenbergg-Whisperwind",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[260813] = {
					["npcID"] = 129232,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mogul Razdunk",
					["encounterID"] = 2108,
				},
				[226329] = {
					["type"] = "BUFF",
					["source"] = "Mentat-Dalvengyr",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[131493] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Flinstoned-Mal'Ganis",
					["npcID"] = 0,
				},
				[6552] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[306715] = {
					["type"] = "BUFF",
					["source"] = "Tàimon-Illidan",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[206662] = {
					["type"] = "DEBUFF",
					["source"] = "Tàimon-Illidan",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297035] = {
					["type"] = "BUFF",
					["source"] = "Wolfsteer",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[82326] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[6572] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[304611] = {
					["type"] = "DEBUFF",
					["source"] = "Groscrise-Mal'Ganis",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[269493] = {
					["type"] = "BUFF",
					["source"] = "Coin-Operated Crowd Pummeler",
					["npcID"] = 129214,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2105,
				},
				[294852] = {
					["type"] = "DEBUFF",
					["source"] = "Voice in the Deeps",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 151719,
				},
				[57723] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Thegoobi",
					["npcID"] = 0,
				},
				[57755] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[193530] = {
					["type"] = "BUFF",
					["source"] = "Sokra-Sargeras",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[209261] = {
					["type"] = "DEBUFF",
					["source"] = "Sleëp-Illidan",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[224772] = {
					["type"] = "BUFF",
					["source"] = "Mandracor-Wildhammer",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[262811] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Leech Globule",
					["npcID"] = 133753,
				},
				[224186] = {
					["type"] = "BUFF",
					["source"] = "Mandracor-Wildhammer",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[296059] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[212552] = {
					["type"] = "BUFF",
					["source"] = "Velaniya-Illidan",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[304851] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[132627] = {
					["source"] = "Hardtips-Illidan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[268439] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[262794] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Venture Co. Mastermind",
					["npcID"] = 133430,
				},
				[286342] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[272276] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Biopsy-Zul'jin",
					["npcID"] = 0,
				},
				[290819] = {
					["type"] = "BUFF",
					["source"] = "Mazapany-Thrall",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275857] = {
					["type"] = "BUFF",
					["source"] = "Norror-BleedingHollow",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[31707] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Water Elemental",
					["npcID"] = 78116,
				},
				[30146] = {
					["source"] = "One-Azuremyst",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[316522] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[277904] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[268953] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[270232] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[883] = {
					["source"] = "Mazapany-Thrall",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[263583] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Taskmaster Askari",
					["npcID"] = 134012,
				},
				[268954] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[164273] = {
					["type"] = "BUFF",
					["source"] = "Mangosteen-Illidan",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[108446] = {
					["type"] = "BUFF",
					["source"] = "Unknown",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 58965,
				},
				[270070] = {
					["type"] = "BUFF",
					["source"] = "Ruebenonrye-Zul'jin",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[115192] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[73313] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sanarao-Illidan",
					["npcID"] = 0,
				},
				[1680] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[57724] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Mandlez",
					["npcID"] = 0,
				},
				[268956] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[290640] = {
					["type"] = "BUFF",
					["source"] = "Evalíana-Mal'Ganis",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[281744] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Demonseamên",
					["npcID"] = 0,
				},
				[263586] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Taskmaster Askari",
					["npcID"] = 134012,
				},
				[185245] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[11426] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[314631] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dtkbaebae-LaughingSkull",
					["npcID"] = 0,
				},
				[268702] = {
					["type"] = "BUFF",
					["source"] = "Stonefury",
					["npcID"] = 130635,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2105,
				},
				[115191] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[274742] = {
					["type"] = "BUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2105,
				},
				[198589] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[279956] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Rasheikh-Tichondrius",
					["npcID"] = 0,
				},
				[52174] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[316703] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[274738] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ollìe-BleedingHollow",
					["encounterID"] = 2105,
				},
				[281402] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[1459] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[203277] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Frostflakes",
					["npcID"] = 0,
				},
				[202168] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[203814] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[268854] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[90328] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 151096,
				},
				[2383] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Trexas-Thrall",
					["npcID"] = 0,
				},
				[853] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[308189] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cofe-Zul'jin",
					["npcID"] = 0,
				},
				[278124] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[247454] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[295856] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Guardian of Azeroth",
					["npcID"] = 152396,
				},
				[205708] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[316036] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1330] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[197908] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[115450] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[2580] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cofe-Zul'jin",
					["npcID"] = 0,
				},
				[257537] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[288146] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rawstench-Kargath",
					["npcID"] = 0,
				},
				[287379] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[1719] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[259161] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Annhoj-Sargeras",
					["npcID"] = 0,
				},
				[285981] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ritchie-Illidan",
					["npcID"] = 0,
				},
				[257371] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[223143] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[118000] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[298197] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[3408] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rawstench-Kargath",
					["npcID"] = 0,
				},
				[285976] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rawstench-Kargath",
					["npcID"] = 0,
				},
				[267433] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mech Jockey",
					["npcID"] = 130488,
				},
				[295310] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[262947] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Venture Co. Mastermind",
					["npcID"] = 133430,
				},
				[287638] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[271526] = {
					["npcID"] = 129802,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Earthrager",
					["encounterID"] = 2106,
				},
				[185123] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Vàlkyríe-Stormrage",
					["npcID"] = 0,
				},
				[264877] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Precisiøn",
					["npcID"] = 0,
				},
				[287639] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[164545] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Pizzaisgood",
					["npcID"] = 0,
				},
				[6940] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[267551] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Coin-Operated Crowd Pummeler",
					["npcID"] = 129214,
				},
				[211881] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[124275] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[271784] = {
					["npcID"] = 138369,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Footbomb Hooligan",
					["encounterID"] = 2105,
				},
				[43308] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Harpylove-Kil'jaeden",
					["npcID"] = 0,
				},
				[186403] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[299790] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[263601] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Taskmaster Askari",
					["npcID"] = 134012,
				},
				[299662] = {
					["type"] = "BUFF",
					["source"] = "Legendborne-Illidan",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[302348] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tubulartits-Illidan",
					["npcID"] = 0,
				},
				[300174] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[203539] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Strategic",
					["npcID"] = 0,
				},
				[262268] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Venture Co. Alchemist",
					["npcID"] = 133432,
				},
				[203795] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[228600] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[267547] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Coin-Operated Crowd Pummeler",
					["npcID"] = 129214,
				},
				[299664] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[262348] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Crawler Mine",
					["npcID"] = 133482,
				},
				[44544] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[300809] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[257424] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Blazeblaze-Illidan",
					["npcID"] = 0,
				},
				[257337] = {
					["npcID"] = 129214,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Coin-Operated Crowd Pummeler",
					["encounterID"] = 2105,
				},
				[260189] = {
					["type"] = "BUFF",
					["source"] = "Mogul Razdunk",
					["npcID"] = 129232,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2108,
				},
				[216328] = {
					["type"] = "BUFF",
					["source"] = "Picklelol",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257420] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bucksnot-Spinebreaker",
					["npcID"] = 0,
				},
				[115308] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[225919] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[288158] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Snowsteps-Icecrown",
					["npcID"] = 0,
				},
				[1766] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[303564] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[260190] = {
					["type"] = "BUFF",
					["source"] = "Mogul Razdunk",
					["npcID"] = 129232,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2107,
				},
				[260318] = {
					["npcID"] = 129232,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mogul Razdunk",
					["encounterID"] = 2108,
				},
				[300691] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[2818] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[276229] = {
					["npcID"] = 141303,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "B.O.O.M.B.A.",
					["encounterID"] = 2108,
				},
				[297037] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bannd-Sargeras",
					["npcID"] = 0,
				},
				[199844] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[115804] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[183752] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[232698] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Spdunni-Arthas",
					["npcID"] = 0,
				},
				[210320] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[245389] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[271538] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[256739] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Katarinita-Zuluhed",
					["npcID"] = 0,
				},
				[138927] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thegoobi",
					["npcID"] = 0,
				},
				[184362] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[280746] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Gukasha-BleedingHollow",
					["npcID"] = 0,
				},
				[216331] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[6343] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[275689] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[270576] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[80353] = {
					["type"] = "BUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2105,
				},
				[204255] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[269239] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[297116] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Gothicthot-Illidan",
					["npcID"] = 0,
				},
				[273348] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[317065] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zelfracx-BleedingHollow",
					["npcID"] = 0,
				},
				[295838] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[297117] = {
					["type"] = "BUFF",
					["source"] = "Fuscus-BlackDragonflight",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[315787] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[205766] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[263103] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Feckless Assistant",
					["npcID"] = 133345,
				},
				[120954] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[31821] = {
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2108,
				},
				[115175] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[295840] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[115072] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[80354] = {
					["type"] = "DEBUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2105,
				},
				[212800] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[228354] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[6201] = {
					["source"] = "Johnbtw-BleedingHollow",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[276206] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[162243] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[295842] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nochehombre-Stormscale",
					["npcID"] = 0,
				},
				[198304] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[316814] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[259533] = {
					["npcID"] = 0,
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2107,
				},
				[65081] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Spdunni-Arthas",
					["npcID"] = 0,
				},
				[276204] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[225921] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[79140] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[178740] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[260708] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[162264] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[3409] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[262115] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[198817] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[5246] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[208683] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[279194] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[164547] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Pizzaisgood",
					["npcID"] = 0,
				},
				[48265] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Derel-BleedingHollow",
					["npcID"] = 0,
				},
				[242551] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tejano-Kel'Thuzad",
					["npcID"] = 0,
				},
				[20707] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Røsgar-Mal'Ganis",
					["npcID"] = 0,
				},
				[297126] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[303520] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[260384] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Aesea-Thrall",
					["npcID"] = 0,
				},
				[2645] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Shãmikaze-Thrall",
					["npcID"] = 0,
				},
				[263642] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[260838] = {
					["npcID"] = 0,
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2108,
				},
				[258920] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[228358] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[198819] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[156070] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dastard-Aegwynn",
					["npcID"] = 0,
				},
				[27576] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[227847] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[262347] = {
					["npcID"] = 129214,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Coin-Operated Crowd Pummeler",
					["encounterID"] = 2105,
				},
				[190356] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[281240] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Harpylove-Kil'jaeden",
					["npcID"] = 0,
				},
				[257593] = {
					["npcID"] = 129227,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Azerokk",
					["encounterID"] = 2106,
				},
				[7384] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[316823] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[1850] = {
					["type"] = "BUFF",
					["source"] = "Tàimon-Illidan",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275672] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[116] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[263628] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mechanized Peacekeeper",
					["npcID"] = 130485,
				},
				[115203] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[196608] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[1856] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[54149] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[3714] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sìlencé-Shadowmoon",
					["npcID"] = 0,
				},
				[20473] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[48107] = {
					["type"] = "BUFF",
					["source"] = "Tonetality-Mal'Ganis",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[105421] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[280412] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[295855] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[260202] = {
					["npcID"] = 129232,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mogul Razdunk",
					["encounterID"] = 2108,
				},
				[275907] = {
					["npcID"] = 129227,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Azerokk",
					["encounterID"] = 2106,
				},
				[184367] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[300971] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Smashyobith-BleedingHollow",
					["npcID"] = 0,
				},
				[228477] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[310690] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[301308] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[114165] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[297039] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Corikko",
					["npcID"] = 0,
				},
				[187698] = {
					["source"] = "Mazapany-Thrall",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[227723] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[85739] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[205473] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[1329] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[32645] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[53822] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Revert-Kel'Thuzad",
					["npcID"] = 0,
				},
				[84714] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[281517] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[187827] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[207744] = {
					["type"] = "DEBUFF",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2106,
				},
				[313088] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[263636] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Addled Thug",
					["npcID"] = 130435,
				},
				[289467] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[165961] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Chumacer-Sargeras",
					["npcID"] = 0,
				},
				[280772] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[263637] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Addled Thug",
					["npcID"] = 130435,
				},
				[6262] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[12472] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[280773] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[268955] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[213915] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[295368] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[160029] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Kågg-Arthas",
					["npcID"] = 0,
				},
				[316835] = {
					["type"] = "DEBUFF",
					["source"] = "Twisted Appendage",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 162764,
				},
				[312107] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nochehombre-Stormscale",
					["npcID"] = 0,
				},
				[236645] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Awesomo-Thrall",
					["npcID"] = 0,
				},
				[115078] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[317859] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[193456] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kaelthyr-Thrall",
					["npcID"] = 0,
				},
				[195630] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[280776] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[121536] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wysp-Arthas",
					["npcID"] = 0,
				},
				[196725] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[703] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[53563] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[317861] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mena",
					["npcID"] = 0,
				},
				[298823] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Madswagger-Aggramar",
					["npcID"] = 0,
				},
				[113746] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[123725] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[5302] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[292363] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sanarao-Illidan",
					["npcID"] = 0,
				},
				[264352] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Vintroxis-Dalaran",
					["npcID"] = 0,
				},
				[258674] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Off-Duty Laborer",
					["npcID"] = 130436,
				},
				[119085] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[153561] = {
					["source"] = "Admilla",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[126664] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[280205] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sanarao-Illidan",
					["npcID"] = 0,
				},
				[164729] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[8679] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[108366] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fearboner",
					["npcID"] = 0,
				},
				[2823] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rawstench-Kargath",
					["npcID"] = 0,
				},
				[192106] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sanarao-Illidan",
					["npcID"] = 0,
				},
				[6673] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[12323] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wazili-Sargeras",
					["encounterID"] = 2106,
				},
				[278736] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Effingcupid-Illidan",
					["npcID"] = 0,
				},
				[105681] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kurjin-BloodFurnace",
					["npcID"] = 0,
				},
				[288455] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[304056] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[8680] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[263648] = {
					["type"] = "BUFF",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2106,
				},
				[116680] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[187748] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[199854] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[191840] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[264764] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jabari-Dragonmaw",
					["npcID"] = 0,
				},
				[109128] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[183998] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[263262] = {
					["npcID"] = 134005,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Shalebiter",
					["encounterID"] = 2105,
				},
				[156779] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[1943] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[271579] = {
					["npcID"] = 130661,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Venture Co. Earthshaper",
					["encounterID"] = 2105,
				},
				[85222] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[263275] = {
					["type"] = "BUFF",
					["source"] = "Taskmaster Askari",
					["npcID"] = 134012,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2105,
				},
				[115008] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[122] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[280661] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Absorb-o-Tron",
					["npcID"] = 143985,
				},
				[267354] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hired Assassin",
					["npcID"] = 134232,
				},
				[269279] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Feldromeda-Magtheridon",
					["npcID"] = 0,
				},
				[116670] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[297412] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[297034] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mandlez",
					["npcID"] = 0,
				},
				[280653] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[119611] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[319919] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Aesea-Thrall",
					["npcID"] = 0,
				},
				[109248] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Renyli-Zul'jin",
					["npcID"] = 0,
				},
				[6788] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Spdunni-Arthas",
					["npcID"] = 0,
				},
				[268362] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wanton Sapper",
					["npcID"] = 130653,
				},
				[105683] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kurjin-BloodFurnace",
					["npcID"] = 0,
				},
				[36554] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[303041] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fortrêss-Dalaran",
					["npcID"] = 0,
				},
				[262377] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Crawler Mine",
					["npcID"] = 133482,
				},
				[115767] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[1966] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[298950] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rellumani-Nazjatar",
					["npcID"] = 0,
				},
				[105771] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[202274] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[1464] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[30449] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Riitz-Proudmoore",
					["encounterID"] = 2106,
				},
				[296138] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Aesea-Thrall",
					["npcID"] = 0,
				},
				[871] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[263215] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Stonefury",
					["npcID"] = 130635,
				},
				[255996] = {
					["npcID"] = 0,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Riitz-Proudmoore",
					["encounterID"] = 2105,
				},
				[297162] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[271843] = {
					["type"] = "BUFF",
					["source"] = "Sitonmyjimmy-Mal'Ganis",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[85288] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[115750] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[154953] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[295373] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[315362] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[318391] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Great Worm From Beyond",
					["npcID"] = 152550,
				},
				[198837] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Risen Skulker",
					["npcID"] = 99541,
				},
				[5308] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[280604] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Refreshment Vendor",
					["npcID"] = 136470,
				},
				[264173] = {
					["type"] = "BUFF",
					["source"] = "Legendborne-Illidan",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[262383] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Venture Co. War Machine",
					["npcID"] = 133463,
				},
				[295367] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[298700] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wysp-Arthas",
					["npcID"] = 0,
				},
				[21562] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Trexas-Thrall",
					["npcID"] = 0,
				},
				[222695] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Annhoj-Sargeras",
					["npcID"] = 0,
				},
				[259856] = {
					["npcID"] = 129231,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Rixxa Fluxflame",
					["encounterID"] = 2107,
				},
				[203819] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[280543] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dtkbaebae-LaughingSkull",
					["npcID"] = 0,
				},
				[12975] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[259853] = {
					["type"] = "DEBUFF",
					["source"] = "Rixxa Fluxflame",
					["npcID"] = 129231,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2107,
				},
				[270058] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ërebüs-Mal'Ganis",
					["npcID"] = 0,
				},
				[132404] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[77489] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Twomft-Destromath",
					["npcID"] = 0,
				},
				[295378] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
				},
				[202164] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Gukasha-BleedingHollow",
					["npcID"] = 0,
				},
				[184364] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wazili-Sargeras",
					["npcID"] = 0,
				},
				[2983] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[264689] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Tubulartits-Illidan",
					["npcID"] = 0,
				},
				[199203] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[100784] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[271867] = {
					["type"] = "DEBUFF",
					["source"] = "Coin-Operated Crowd Pummeler",
					["npcID"] = 129214,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2105,
				},
				[190784] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[300751] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Aesea-Thrall",
					["npcID"] = 0,
				},
				[772] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ollìe-BleedingHollow",
					["npcID"] = 0,
				},
				[100780] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bótat-Arthas",
					["npcID"] = 0,
				},
				[268712] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 130653,
				},
				[203538] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Strategic",
					["npcID"] = 0,
				},
				[15407] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Spdunni-Arthas",
					["npcID"] = 0,
				},
				[4987] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[210152] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[257408] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Precisiøn",
					["npcID"] = 0,
				},
				[278999] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[245388] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
				[204596] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Swordmaiden-BleedingHollow",
					["npcID"] = 0,
				},
				[256493] = {
					["type"] = "BUFF",
					["source"] = "Azerite Footbomb",
					["npcID"] = 129246,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2105,
				},
				[297941] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Katarinita-Zuluhed",
					["npcID"] = 0,
				},
				[118922] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Legulass-Onyxia",
					["npcID"] = 0,
				},
				[303568] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[40120] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rikey",
					["npcID"] = 0,
				},
				[269298] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Hired Assassin",
					["npcID"] = 134232,
				},
				[212653] = {
					["type"] = "BUFF",
					["source"] = "Riitz-Proudmoore",
					["npcID"] = 0,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2105,
				},
				[260829] = {
					["type"] = "DEBUFF",
					["source"] = "Unknown",
					["npcID"] = 132338,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2108,
				},
				[69179] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[190456] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mansnotprot-Sargeras",
					["npcID"] = 0,
				},
				[268709] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Venture Co. Earthshaper",
					["npcID"] = 130661,
				},
				[303570] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mewzy-Arthas",
					["npcID"] = 0,
				},
				[276205] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Thartuk",
					["npcID"] = 0,
				},
				[204262] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Shãmikaze-Thrall",
					["npcID"] = 0,
				},
				[236502] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Shãmikaze-Thrall",
					["npcID"] = 0,
				},
				[212182] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fuglyqt-Arthas",
					["npcID"] = 0,
				},
			},
			["not_affecting_combat_alpha"] = 0.5976737141609192,
			["non_targeted_alpha_enabled"] = true,
			["use_health_animation"] = true,
			["target_highlight_alpha"] = 0.7527135610580444,
			["target_indicator"] = "Ornament",
			["target_shady_alpha"] = 0.5976743698120117,
			["target_highlight_height"] = 14.63406085968018,
			["login_counter"] = 716,
			["patch_version"] = 9,
			["aura_timer_text_size"] = 7,
			["number_region_first_run"] = true,
			["OptionsPanelDB"] = {
				["PlaterOptionsPanelFrame"] = {
					["scale"] = 1,
				},
			},
			["saved_cvars"] = {
				["ShowClassColorInNameplate"] = "1",
				["nameplateOverlapV"] = "1.1",
				["nameplateShowSelf"] = "0",
				["nameplateShowEnemyMinus"] = "1",
				["nameplatePersonalShowAlways"] = "0",
				["nameplateMotionSpeed"] = "0.025",
				["nameplateGlobalScale"] = "1",
				["nameplateShowFriendlyTotems"] = "0",
				["nameplateShowEnemyMinions"] = "0",
				["nameplateShowFriendlyPets"] = "0",
				["nameplateShowFriendlyNPCs"] = "1",
				["nameplateSelectedScale"] = "1.5004963874817",
				["nameplatePersonalShowInCombat"] = "1",
				["nameplatePersonalShowWithTarget"] = "0",
				["ShowNamePlateLoseAggroFlash"] = "1",
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
				["nameplateOccludedAlphaMult"] = "0.4",
				["nameplateShowAll"] = "1",
				["nameplatePersonalHideDelaySeconds"] = "0.2",
				["nameplateSelfTopInset"] = "0.5",
				["NamePlateVerticalScale"] = "1",
			},
			["border_thickness"] = 1.001471042633057,
		},
	},
}
