local L_1_
L_1_ = {
	cache = {},
	load = function(L_15_arg0)
		if not L_1_.cache[L_15_arg0] then
			L_1_.cache[L_15_arg0] = {
				c = L_1_[L_15_arg0]()
			}
		end
		return L_1_.cache[L_15_arg0].c
	end
}
do
	function L_1_.a()
		local L_16_ = game:GetService"RunService"
		local L_17_ =
L_16_.Heartbeat
		local L_18_ = game:GetService"UserInputService"
		local L_19_ = game:GetService"TweenService"
		local L_20_ = game:GetService"LocalizationService"
		local L_21_ = game:GetService"HttpService"
		local L_22_ = "https://raw.githubusercontent.com/Footagesus/Icons/main/Main-v2.lua"
		local L_23_ = loadstring(
game.HttpGetAsync and game:HttpGetAsync(L_22_)
or L_21_:GetAsync(L_22_)
)()
		L_23_.SetIconsType"lucide"
		local L_24_
		local L_25_ = {
			Font = "rbxassetid://12187365364",
			Localization = nil,
			CanDraggable = true,
			Theme = nil,
			Themes = nil,
			Icons = L_23_,
			Signals = {},
			Objects = {},
			LocalizationObjects = {},
			FontObjects = {},
			Language = string.match(L_20_.SystemLocaleId, "^[a-z]+"),
			Request = http_request or (syn and syn.request) or request,
			DefaultProperties = {
				ScreenGui = {
					ResetOnSpawn = false,
					ZIndexBehavior = "Sibling",
				},
				CanvasGroup = {
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.new(1, 1, 1),
				},
				Frame = {
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.new(1, 1, 1),
				},
				TextLabel = {
					BackgroundColor3 = Color3.new(1, 1, 1),
					BorderSizePixel = 0,
					Text = "",
					RichText = true,
					TextColor3 = Color3.new(1, 1, 1),
					TextSize = 14,
				},
				TextButton = {
					BackgroundColor3 = Color3.new(1, 1, 1),
					BorderSizePixel = 0,
					Text = "",
					AutoButtonColor = false,
					TextColor3 = Color3.new(1, 1, 1),
					TextSize = 14,
				},
				TextBox = {
					BackgroundColor3 = Color3.new(1, 1, 1),
					BorderColor3 = Color3.new(0, 0, 0),
					ClearTextOnFocus = false,
					Text = "",
					TextColor3 = Color3.new(0, 0, 0),
					TextSize = 14,
				},
				ImageLabel = {
					BackgroundTransparency = 1,
					BackgroundColor3 = Color3.new(1, 1, 1),
					BorderSizePixel = 0,
				},
				ImageButton = {
					BackgroundColor3 = Color3.new(1, 1, 1),
					BorderSizePixel = 0,
					AutoButtonColor = false,
				},
				UIListLayout = {
					SortOrder = "LayoutOrder",
				},
				ScrollingFrame = {
					ScrollBarImageTransparency = 1,
					BorderSizePixel = 0,
				},
				VideoFrame = {
					BorderSizePixel = 0,
				}
			},
			Colors = {
				Red = "#e53935",
				Orange = "#f57c00",
				Green = "#43a047",
				Blue = "#039be5",
				White = "#ffffff",
				Grey = "#484848",
			},
		}
		function L_25_.Init(L_28_arg0)
			L_24_ = L_28_arg0
		end
		function L_25_.AddSignal(L_29_arg0, L_30_arg1)
			local L_31_ = L_29_arg0:Connect(L_30_arg1)
			table.insert(L_25_.Signals, L_31_)
			return L_31_
		end
		function L_25_.DisconnectAll()
			for L_32_forvar0, L_33_forvar1 in next, L_25_.Signals do
				local L_34_ = table.remove(L_25_.Signals, L_32_forvar0)
				L_34_:Disconnect()
			end
		end
		function L_25_.SafeCallback(L_35_arg0, ...)
			if not L_35_arg0 then
				return
			end
			local L_36_, L_37_ = pcall(L_35_arg0, ...)
			if not L_36_ then
				if L_24_ and L_24_.Window and L_24_.Window.Debug then
					local
L_38_, L_39_ = L_37_:find":%d+: "
					warn("[ WindUI: DEBUG Mode ] " .. L_37_)
					return L_24_:Notify{
						Title = "DEBUG Mode: Error",
						Content = not L_39_ and L_37_ or L_37_:sub(L_39_ + 1),
						Duration = 8,
					}
				end
			end
		end
		function L_25_.Gradient(L_40_arg0, L_41_arg1)
			if L_24_ and L_24_.Gradient then
				return L_24_:Gradient(L_40_arg0, L_41_arg1)
			end
			local L_42_ = {}
			local L_43_ = {}
			for L_45_forvar0, L_46_forvar1 in next, L_40_arg0 do
				local L_47_ = tonumber(L_45_forvar0)
				if L_47_ then
					L_47_ = math.clamp(L_47_ / 100, 0, 1)
					table.insert(L_42_, ColorSequenceKeypoint.new(L_47_, L_46_forvar1.Color))
					table.insert(L_43_, NumberSequenceKeypoint.new(L_47_, L_46_forvar1.Transparency or 0))
				end
			end
			table.sort(L_42_, function(L_48_arg0, L_49_arg1)
				return L_48_arg0.Time < L_49_arg1.Time
			end)
			table.sort(L_43_, function(L_50_arg0, L_51_arg1)
				return L_50_arg0.Time < L_51_arg1.Time
			end)
			if #L_42_ < 2 then
				error"ColorSequence requires at least 2 keypoints"
			end
			local L_44_ = {
				Color = ColorSequence.new(L_42_),
				Transparency = NumberSequence.new(L_43_),
			}
			if L_41_arg1 then
				for L_52_forvar0, L_53_forvar1 in pairs(L_41_arg1) do
					L_44_[L_52_forvar0] = L_53_forvar1
				end
			end
			return L_44_
		end
		function L_25_.SetTheme(L_54_arg0)
			L_25_.Theme = L_54_arg0
			L_25_.UpdateTheme(nil, true)
		end
		function L_25_.AddFontObject(L_55_arg0)
			table.insert(L_25_.FontObjects, L_55_arg0)
			L_25_.UpdateFont(L_25_.Font)
		end
		function L_25_.UpdateFont(L_56_arg0)
			L_25_.Font = L_56_arg0
			for L_57_forvar0, L_58_forvar1 in next, L_25_.FontObjects do
				L_58_forvar1.FontFace = Font.new(L_56_arg0, L_58_forvar1.FontFace.Weight, L_58_forvar1.FontFace.Style)
			end
		end
		function L_25_.GetThemeProperty(L_59_arg0, L_60_arg1)
			local L_61_ = L_60_arg1[L_59_arg0] or L_25_.Themes.Dark[L_59_arg0]
			if not L_61_ then
				return nil
			end
			if type(L_61_) == "string" and string.sub(L_61_, 1, 1) == "#" then
				return Color3.fromHex(L_61_)
			end
			if typeof(L_61_) == "Color3" then
				return L_61_
			end
			if type(L_61_) == "table" and L_61_.Color and L_61_.Transparency then
				return L_61_
			end
			if type(L_61_) == "function" then
				return L_61_()
			end
			return nil
		end
		function L_25_.AddThemeObject(L_62_arg0, L_63_arg1)
			L_25_.Objects[L_62_arg0] = {
				Object = L_62_arg0,
				Properties = L_63_arg1
			}
			L_25_.UpdateTheme(L_62_arg0, false)
			return L_62_arg0
		end
		function L_25_.AddLangObject(L_64_arg0)
			local L_65_ = L_25_.LocalizationObjects[L_64_arg0]
			local L_66_ = L_65_.Object
			local L_67_ = currentObjTranslationId
			L_25_.UpdateLang(L_66_, L_67_)
			return L_66_
		end
		function L_25_.UpdateTheme(L_68_arg0, L_69_arg1)
			local function L_70_func(L_71_arg0)
				for L_72_forvar0, L_73_forvar1 in pairs(L_71_arg0.Properties or {}) do
					local L_74_ = L_25_.GetThemeProperty(L_73_forvar1, L_25_.Theme)
					if L_74_ then
						if typeof(L_74_) == "Color3" then
							local L_75_ = L_71_arg0.Object:FindFirstChild"WindUIGradient"
							if L_75_ then
								L_75_:Destroy()
							end
							if not L_69_arg1 then
								L_71_arg0.Object[L_72_forvar0] = L_74_
							else
								L_25_.Tween(L_71_arg0.Object, 0.08, {
									[L_72_forvar0] = L_74_
								}):Play()
							end
						elseif type(L_74_) == "table" and L_74_.Color and L_74_.Transparency then
							L_71_arg0.Object[L_72_forvar0] = Color3.new(1, 1, 1)
							local L_76_ = L_71_arg0.Object:FindFirstChild"WindUIGradient"
							if not L_76_ then
								L_76_ = Instance.new"UIGradient"
								L_76_.Name = "WindUIGradient"
								L_76_.Parent = L_71_arg0.Object
							end
							L_76_.Color = L_74_.Color
							L_76_.Transparency = L_74_.Transparency
							for L_77_forvar0, L_78_forvar1 in pairs(L_74_) do
								if L_77_forvar0 ~= "Color" and L_77_forvar0 ~= "Transparency" and L_76_[L_77_forvar0] ~= nil then
									L_76_[L_77_forvar0] = L_78_forvar1
								end
							end
						end
					else
						local L_79_ = L_71_arg0.Object:FindFirstChild"WindUIGradient"
						if L_79_ then
							L_79_:Destroy()
						end
					end
				end
			end
			if L_68_arg0 then
				local L_80_ = L_25_.Objects[L_68_arg0]
				if L_80_ then
					L_70_func(L_80_)
				end
			else
				for L_81_forvar0, L_82_forvar1 in pairs(L_25_.Objects) do
					L_70_func(L_82_forvar1)
				end
			end
		end
		function L_25_.SetLangForObject(L_83_arg0)
			if L_25_.Localization and L_25_.Localization.Enabled then
				local L_84_ = L_25_.LocalizationObjects[L_83_arg0]
				if not L_84_ then
					return
				end
				local L_85_ = L_84_.Object
				local L_86_ = L_84_.TranslationId
				local L_87_ = L_25_.Localization.Translations[L_25_.Language]
				if L_87_ and L_87_[L_86_] then
					L_85_.Text = L_87_[L_86_]
				else
					local L_88_ = L_25_.Localization and L_25_.Localization.Translations and L_25_.Localization.Translations.en or nil
					if L_88_ and L_88_[L_86_] then
						L_85_.Text = L_88_[L_86_]
					else
						L_85_.Text = "[" .. L_86_ .. "]"
					end
				end
			end
		end
		function L_25_.ChangeTranslationKey(L_89_arg0, L_90_arg1, L_91_arg2)
			if L_25_.Localization and L_25_.Localization.Enabled then
				local L_92_ = string.match(L_91_arg2, "^" .. L_25_.Localization.Prefix .. "(.+)")
				if L_92_ then
					for L_93_forvar0, L_94_forvar1 in ipairs(L_25_.LocalizationObjects) do
						if L_94_forvar1.Object == L_90_arg1 then
							L_94_forvar1.TranslationId = L_92_
							L_25_.SetLangForObject(L_93_forvar0)
							return
						end
					end
					table.insert(L_25_.LocalizationObjects, {
						TranslationId = L_92_,
						Object = L_90_arg1
					})
					L_25_.SetLangForObject(#L_25_.LocalizationObjects)
				end
			end
		end
		function L_25_.UpdateLang(L_95_arg0)
			if L_95_arg0 then
				L_25_.Language = L_95_arg0
			end
			for L_96_forvar0 = 1, #L_25_.LocalizationObjects do
				local L_97_ = L_25_.LocalizationObjects[L_96_forvar0]
				if L_97_.Object and L_97_.Object.Parent ~= nil then
					L_25_.SetLangForObject(L_96_forvar0)
				else
					L_25_.LocalizationObjects[L_96_forvar0] = nil
				end
			end
		end
		function L_25_.SetLanguage(L_98_arg0)
			L_25_.Language = L_98_arg0
			L_25_.UpdateLang()
		end
		function L_25_.Icon(L_99_arg0)
			return L_23_.Icon(L_99_arg0)
		end
		function L_25_.AddIcons(L_100_arg0, L_101_arg1)
			return L_23_.AddIcons(L_100_arg0, L_101_arg1)
		end
		function L_25_.New(L_102_arg0, L_103_arg1, L_104_arg2)
			local L_105_ = Instance.new(L_102_arg0)
			for L_106_forvar0, L_107_forvar1 in next, L_25_.DefaultProperties[L_102_arg0] or {} do
				L_105_[L_106_forvar0] = L_107_forvar1
			end
			for L_108_forvar0, L_109_forvar1 in next, L_103_arg1 or {} do
				if L_108_forvar0 ~= "ThemeTag" then
					L_105_[L_108_forvar0] = L_109_forvar1
				end
				if L_25_.Localization and L_25_.Localization.Enabled and L_108_forvar0 == "Text" then
					local L_110_ = string.match(L_109_forvar1, "^" .. L_25_.Localization.Prefix .. "(.+)")
					if L_110_ then
						local L_111_ = #L_25_.LocalizationObjects + 1
						L_25_.LocalizationObjects[L_111_] = {
							TranslationId = L_110_,
							Object = L_105_
						}
						L_25_.SetLangForObject(L_111_)
					end
				end
			end
			for L_112_forvar0, L_113_forvar1 in next, L_104_arg2 or {} do
				L_113_forvar1.Parent = L_105_
			end
			if L_103_arg1 and L_103_arg1.ThemeTag then
				L_25_.AddThemeObject(L_105_, L_103_arg1.ThemeTag)
			end
			if L_103_arg1 and L_103_arg1.FontFace then
				L_25_.AddFontObject(L_105_)
			end
			return L_105_
		end
		function L_25_.Tween(L_114_arg0, L_115_arg1, L_116_arg2, ...)
			return L_19_:Create(L_114_arg0, TweenInfo.new(L_115_arg1, ...), L_116_arg2)
		end
		function L_25_.NewRoundFrame(L_117_arg0, L_118_arg1, L_119_arg2, L_120_arg3, L_121_arg4, L_122_arg5)
			local function L_123_func(L_128_arg0)
				return L_128_arg0 == "Squircle" and "rbxassetid://80999662900595"
or L_128_arg0 == "SquircleOutline" and "rbxassetid://117788349049947"
or L_128_arg0 == "SquircleOutline2" and "rbxassetid://117817408534198"
or L_128_arg0 == "Squircle-Outline" and "rbxassetid://117817408534198"
or L_128_arg0 == "Shadow-sm" and "rbxassetid://84825982946844"
or L_128_arg0 == "Squircle-TL-TR" and "rbxassetid://73569156276236"
or L_128_arg0 == "Squircle-BL-BR" and "rbxassetid://93853842912264"
or L_128_arg0 == "Squircle-TL-TR-Outline" and "rbxassetid://136702870075563"
or L_128_arg0 == "Squircle-BL-BR-Outline" and "rbxassetid://75035847706564"
or L_128_arg0 == "Square" and "rbxassetid://82909646051652"
or L_128_arg0 == "Square-Outline" and "rbxassetid://72946211851948"
			end
			local function L_124_func(L_129_arg0)
				return L_129_arg0 ~= "Shadow-sm" and Rect.new(256
, 256
, 256
, 256

) or Rect.new(512, 512, 512, 512)
			end
			local L_125_ = L_25_.New(L_121_arg4 and "ImageButton" or "ImageLabel", {
				Image = L_123_func(L_118_arg1),
				ScaleType = "Slice",
				SliceCenter = L_124_func(L_118_arg1),
				SliceScale = 1,
				BackgroundTransparency = 1,
				ThemeTag = L_119_arg2.ThemeTag and L_119_arg2.ThemeTag
			}, L_120_arg3)
			for L_130_forvar0, L_131_forvar1 in pairs(L_119_arg2 or {}) do
				if L_130_forvar0 ~= "ThemeTag" then
					L_125_[L_130_forvar0] = L_131_forvar1
				end
			end
			local function L_126_func(L_132_arg0)
				local L_133_ = L_118_arg1 ~= "Shadow-sm" and (L_132_arg0 / (256)) or (L_132_arg0 / 512)
				L_125_.SliceScale = math.max(L_133_, 0.0001)
			end
			local L_127_ = {}
			function L_127_.SetRadius(L_134_arg0, L_135_arg1)
				L_126_func(L_135_arg1)
			end
			function L_127_.SetType(L_136_arg0, L_137_arg1)
				L_118_arg1 = L_137_arg1
				L_125_.Image = L_123_func(L_137_arg1)
				L_125_.SliceCenter = L_124_func(L_137_arg1)
				L_126_func(L_117_arg0)
			end
			function L_127_.UpdateShape(L_138_arg0, L_139_arg1, L_140_arg2)
				if L_140_arg2 then
					L_118_arg1 = L_140_arg2
					L_125_.Image = L_123_func(L_140_arg2)
					L_125_.SliceCenter = L_124_func(L_140_arg2)
				end
				if L_139_arg1 then
					L_117_arg0 = L_139_arg1
				end
				L_126_func(L_117_arg0)
			end
			function L_127_.GetRadius(L_141_arg0)
				return L_117_arg0
			end
			function L_127_.GetType(L_142_arg0)
				return L_118_arg1
			end
			L_126_func(L_117_arg0)
			return L_125_, L_122_arg5 and L_127_ or nil
		end
		local L_26_ = L_25_.New
		local L_27_ =
L_25_.Tween
		function L_25_.SetDraggable(L_143_arg0)
			L_25_.CanDraggable = L_143_arg0
		end
		function L_25_.Drag(L_144_arg0, L_145_arg1, L_146_arg2)
			local L_147_
			local L_148_, L_149_, L_150_, L_151_
			local L_152_ = {
				CanDraggable = true
			}
			if not L_145_arg1 or type(L_145_arg1) ~= "table" then
				L_145_arg1 = {
					L_144_arg0
				}
			end
			local function L_153_func(L_154_arg0)
				local L_155_ = L_154_arg0.Position - L_150_
				L_25_.Tween(L_144_arg0, 0.02, {
					Position = UDim2.new(
L_151_.X.Scale, L_151_.X.Offset + L_155_.X,
L_151_.Y.Scale, L_151_.Y.Offset + L_155_.Y
)
				}):Play()
			end
			for L_156_forvar0, L_157_forvar1 in pairs(L_145_arg1) do
				L_157_forvar1.InputBegan:Connect(function(L_158_arg0)
					if (L_158_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_158_arg0.UserInputType == Enum.UserInputType.Touch) and L_152_.CanDraggable then
						if L_147_ == nil then
							L_147_ = L_157_forvar1
							L_148_ = true
							L_150_ = L_158_arg0.Position
							L_151_ = L_144_arg0.Position
							if L_146_arg2 and type(L_146_arg2) == "function" then
								L_146_arg2(true, L_147_)
							end
							L_158_arg0.Changed:Connect(function()
								if L_158_arg0.UserInputState == Enum.UserInputState.End then
									L_148_ = false
									L_147_ = nil
									if L_146_arg2 and type(L_146_arg2) == "function" then
										L_146_arg2(false, L_147_)
									end
								end
							end)
						end
					end
				end)
				L_157_forvar1.InputChanged:Connect(function(L_159_arg0)
					if L_147_ == L_157_forvar1 and L_148_ then
						if L_159_arg0.UserInputType == Enum.UserInputType.MouseMovement or L_159_arg0.UserInputType == Enum.UserInputType.Touch then
							L_149_ = L_159_arg0
						end
					end
				end)
			end
			L_18_.InputChanged:Connect(function(L_160_arg0)
				if L_160_arg0 == L_149_ and L_148_ and L_147_ ~= nil then
					if L_152_.CanDraggable then
						L_153_func(L_160_arg0)
					end
				end
			end)
			function L_152_.Set(L_161_arg0, L_162_arg1)
				L_152_.CanDraggable = L_162_arg1
			end
			return L_152_
		end
		L_23_.Init(L_26_, "Icon")
		function L_25_.Image(L_163_arg0, L_164_arg1, L_165_arg2, L_166_arg3, L_167_arg4, L_168_arg5, L_169_arg6)
			local function L_170_func(L_172_arg0)
				L_172_arg0 = L_172_arg0:gsub("[%s/\\:*?\"<>|]+", "-")
				L_172_arg0 = L_172_arg0:gsub("[^%w%-_%.]", "")
				return L_172_arg0
			end
			L_166_arg3 = L_166_arg3 or "Temp"
			L_164_arg1 = L_170_func(L_164_arg1)
			local L_171_ = L_26_("Frame", {
				Size = UDim2.new(0, 0, 0, 0),
				BackgroundTransparency = 1,
			}, {
				L_26_("ImageLabel", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					ScaleType = "Crop",
					ThemeTag = (L_25_.Icon(L_163_arg0) or L_169_arg6) and {
						ImageColor3 = L_168_arg5 and "Icon" or nil
					} or nil,
				}, {
					L_26_("UICorner", {
						CornerRadius = UDim.new(0, L_165_arg2)
					})
				})
			})
			if L_25_.Icon(L_163_arg0) then
				L_171_.ImageLabel:Destroy()
				local L_173_ = L_23_.Image{
					Icon = L_163_arg0,
					Size = UDim2.new(1, 0, 1, 0),
					Colors = {
						(L_168_arg5 and "Icon" or false),
						"Button"
					}
				}.IconFrame
				L_173_.Parent = L_171_
			elseif string.find(L_163_arg0, "http") then
				local L_174_ = "WindUI/" .. L_166_arg3 .. "/assets/." .. L_167_arg4 .. "-" .. L_164_arg1 .. ".png"
				local L_175_, L_176_ = pcall(function()
					task.spawn(function()
						if not isfile(L_174_) then
							local L_179_ = L_25_.Request{
								Url = L_163_arg0,
								Method = "GET",
							}.Body
							writefile(L_174_, L_179_)
						end
						local L_177_, L_178_ = pcall(getcustomasset, L_174_)
						if L_177_ then
							L_171_.ImageLabel.Image = L_178_
						else
							warn(string.format("[ WindUI.Creator ] Failed to load custom asset '%s': %s", L_174_, tostring(L_178_)))
							L_171_:Destroy()
							return
						end
					end)
				end)
				if not L_175_ then
					warn("[ WindUI.Creator ]  '" .. identifyexecutor() .. "' doesnt support the URL Images. Error: " .. L_176_)
					L_171_:Destroy()
				end
			elseif L_163_arg0 == "" then
				L_171_.Visible = false
			else
				L_171_.ImageLabel.Image = L_163_arg0
			end
			return L_171_
		end
		return L_25_
	end
	function L_1_.b()
		local L_180_ = {}
		function L_180_.New(L_181_arg0, L_182_arg1, L_183_arg2)
			local L_184_ = {
				Enabled = L_182_arg1.Enabled or false,
				Translations = L_182_arg1.Translations or {},
				Prefix = L_182_arg1.Prefix or "loc:",
				DefaultLanguage = L_182_arg1.DefaultLanguage or "en"
			}
			L_183_arg2.Localization = L_184_
			return L_184_
		end
		return L_180_
	end
	function L_1_.c()
		local L_185_ = L_1_.load'a'
		local L_186_ = L_185_.New
		local L_187_ = L_185_.Tween
		local L_188_ = {
			Size = UDim2.new(0, 300, 1, -156),
			SizeLower = UDim2.new(0, 300, 1, -56),
			UICorner = 13,
			UIPadding = 14,
			Holder = nil,
			NotificationIndex = 0,
			Notifications = {}
		}
		function L_188_.Init(L_189_arg0)
			local L_190_ = {
				Lower = false
			}
			function L_190_.SetLower(L_191_arg0)
				L_190_.Lower = L_191_arg0
				L_190_.Frame.Size = L_191_arg0 and L_188_.SizeLower or L_188_.Size
			end
			L_190_.Frame = L_186_("Frame", {
				Position = UDim2.new(1, -29, 0, 56),
				AnchorPoint = Vector2.new(1, 0),
				Size = L_188_.Size,
				Parent = L_189_arg0,
				BackgroundTransparency = 1,
			}, {
				L_186_("UIListLayout", {
					HorizontalAlignment = "Center",
					SortOrder = "LayoutOrder",
					VerticalAlignment = "Bottom",
					Padding = UDim.new(0, 8),
				}),
				L_186_("UIPadding", {
					PaddingBottom = UDim.new(0, 29)
				})
			})
			return L_190_
		end
		function L_188_.New(L_192_arg0)
			local L_193_ = {
				Title = L_192_arg0.Title or "Notification",
				Content = L_192_arg0.Content or nil,
				Icon = L_192_arg0.Icon or nil,
				IconThemed = L_192_arg0.IconThemed,
				Background = L_192_arg0.Background,
				BackgroundImageTransparency = L_192_arg0.BackgroundImageTransparency,
				Duration = L_192_arg0.Duration or 5,
				Buttons = L_192_arg0.Buttons or {},
				CanClose = true,
				UIElements = {},
				Closed = false,
			}
			if L_193_.CanClose == nil then
				L_193_.CanClose = true
			end
			L_188_.NotificationIndex = L_188_.NotificationIndex + 1
			L_188_.Notifications[L_188_.NotificationIndex] = L_193_
			local L_194_
			if L_193_.Icon then
				L_194_ = L_185_.Image(
L_193_.Icon,
L_193_.Title .. ":" .. L_193_.Icon,
0,
L_192_arg0.Window,
"Notification",
L_193_.IconThemed
)
				L_194_.Size = UDim2.new(0, 26, 0, 26)
				L_194_.Position = UDim2.new(0, L_188_.UIPadding, 0, L_188_.UIPadding)
			end
			local L_195_
			if L_193_.CanClose then
				L_195_ = L_186_("ImageButton", {
					Image = L_185_.Icon"x"[1],
					ImageRectSize = L_185_.Icon"x"[2].ImageRectSize,
					ImageRectOffset = L_185_.Icon"x"[2].ImageRectPosition,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 16, 0, 16),
					Position = UDim2.new(1, -L_188_.UIPadding, 0, L_188_.UIPadding),
					AnchorPoint = Vector2.new(1, 0),
					ThemeTag = {
						ImageColor3 = "Text"
					},
					ImageTransparency = .4,
				}, {
					L_186_("TextButton", {
						Size = UDim2.new(1, 8, 1, 8),
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						Text = "",
					})
				})
			end
			local L_196_ = L_186_("Frame", {
				Size = UDim2.new(0, 0, 1, 0),
				BackgroundTransparency = .95,
				ThemeTag = {
					BackgroundColor3 = "Text",
				},
			})
			local L_197_ = L_186_("Frame", {
				Size = UDim2.new(1,
L_193_.Icon and -28 - L_188_.UIPadding or 0,
1, 0),
				Position = UDim2.new(1, 0, 0, 0),
				AnchorPoint = Vector2.new(1, 0),
				BackgroundTransparency = 1,
				AutomaticSize = "Y",
			}, {
				L_186_("UIPadding", {
					PaddingTop = UDim.new(0, L_188_.UIPadding),
					PaddingLeft = UDim.new(0, L_188_.UIPadding),
					PaddingRight = UDim.new(0, L_188_.UIPadding),
					PaddingBottom = UDim.new(0, L_188_.UIPadding),
				}),
				L_186_("TextLabel", {
					AutomaticSize = "Y",
					Size = UDim2.new(1, -30 - L_188_.UIPadding, 0, 0),
					TextWrapped = true,
					TextXAlignment = "Left",
					RichText = true,
					BackgroundTransparency = 1,
					TextSize = 16,
					ThemeTag = {
						TextColor3 = "Text"
					},
					Text = L_193_.Title,
					FontFace = Font.new(L_185_.Font, Enum.FontWeight.Medium)
				}),
				L_186_("UIListLayout", {
					Padding = UDim.new(0, L_188_.UIPadding / 3)
				})
			})
			if L_193_.Content then
				L_186_("TextLabel", {
					AutomaticSize = "Y",
					Size = UDim2.new(1, 0, 0, 0),
					TextWrapped = true,
					TextXAlignment = "Left",
					RichText = true,
					BackgroundTransparency = 1,
					TextTransparency = .4,
					TextSize = 15,
					ThemeTag = {
						TextColor3 = "Text"
					},
					Text = L_193_.Content,
					FontFace = Font.new(L_185_.Font, Enum.FontWeight.Medium),
					Parent = L_197_
				})
			end
			local L_198_ = L_185_.NewRoundFrame(L_188_.UICorner, "Squircle", {
				Size = UDim2.new(1, 0, 0, 0),
				Position = UDim2.new(2, 0, 1, 0),
				AnchorPoint = Vector2.new(0, 1),
				AutomaticSize = "Y",
				ImageTransparency = .05,
				ThemeTag = {
					ImageColor3 = "Background"
				},
			}, {
				L_186_("CanvasGroup", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
				}, {
					L_196_,
					L_186_("UICorner", {
						CornerRadius = UDim.new(0, L_188_.UICorner),
					})
				}),
				L_186_("ImageLabel", {
					Name = "Background",
					Image = L_193_.Background,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					ScaleType = "Crop",
					ImageTransparency = L_193_.BackgroundImageTransparency
				}, {
					L_186_("UICorner", {
						CornerRadius = UDim.new(0, L_188_.UICorner),
					})
				}),
				L_197_,
				L_194_,
				L_195_,
			})
			local L_199_ = L_186_("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				Parent = L_192_arg0.Holder
			}, {
				L_198_
			})
			function L_193_.Close(L_200_arg0)
				if not L_193_.Closed then
					L_193_.Closed = true
					L_187_(L_199_, 0.45, {
						Size = UDim2.new(1, 0, 0, -8)
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					L_187_(L_198_, 0.55, {
						Position = UDim2.new(2, 0, 1, 0)
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					task.wait(.45)
					L_199_:Destroy()
				end
			end
			task.spawn(function()
				task.wait()
				L_187_(L_199_, 0.45, {
					Size = UDim2.new(
1,
0,
0,
L_198_.AbsoluteSize.Y
)
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				L_187_(L_198_, 0.45, {
					Position = UDim2.new(0, 0, 1, 0)
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				if L_193_.Duration then
					L_187_(L_196_, L_193_.Duration, {
						Size = UDim2.new(1, 0, 1, 0)
					}, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut):Play()
					task.wait(L_193_.Duration)
					L_193_:Close()
				end
			end)
			if L_195_ then
				L_185_.AddSignal(L_195_.TextButton.MouseButton1Click, function()
					L_193_:Close()
				end)
			end
			return L_193_
		end
		return L_188_
	end
	function L_1_.d()
		local L_201_ = 4294967296;
		local L_202_ = L_201_ - 1;
		local function L_203_func(L_251_arg0, L_252_arg1)
			local L_253_, L_254_ = 0, 1;
			while L_251_arg0 ~= 0 or L_252_arg1 ~= 0 do
				local L_255_, L_256_ = L_251_arg0 % 2, L_252_arg1 % 2;
				local L_257_ = (L_255_ + L_256_) % 2;
				L_253_ = L_253_ + L_257_ * L_254_;
				L_251_arg0 = math.floor(L_251_arg0 / 2)
				L_252_arg1 = math.floor(L_252_arg1 / 2)
				L_254_ = L_254_ * 2
			end;
			return L_253_ % L_201_
		end;
		local function L_204_func(L_258_arg0, L_259_arg1, L_260_arg2, ...)
			local L_261_;
			if L_259_arg1 then
				L_258_arg0 = L_258_arg0 % L_201_;
				L_259_arg1 = L_259_arg1 % L_201_;
				L_261_ = L_203_func(L_258_arg0, L_259_arg1)
				if L_260_arg2 then
					L_261_ = L_204_func(L_261_, L_260_arg2, ...)
				end;
				return L_261_
			elseif L_258_arg0 then
				return L_258_arg0 % L_201_
			else
				return 0
			end
		end;
		local function L_205_func(L_262_arg0, L_263_arg1, L_264_arg2, ...)
			local L_265_;
			if L_263_arg1 then
				L_262_arg0 = L_262_arg0 % L_201_;
				L_263_arg1 = L_263_arg1 % L_201_;
				L_265_ = (L_262_arg0 + L_263_arg1 - L_203_func(L_262_arg0, L_263_arg1)) / 2;
				if L_264_arg2 then
					L_265_ = L_205_func(L_265_, L_264_arg2, ...)
				end;
				return L_265_
			elseif L_262_arg0 then
				return L_262_arg0 % L_201_
			else
				return L_202_
			end
		end;
		local function L_206_func(L_266_arg0)
			return L_202_ - L_266_arg0
		end;
		local function L_207_func(L_267_arg0, L_268_arg1)
			if L_268_arg1 < 0 then
				return lshift(L_267_arg0, -L_268_arg1)
			end;
			return math.floor(L_267_arg0 % 4294967296 / 2 ^ L_268_arg1)
		end;
		local function L_208_func(L_269_arg0, L_270_arg1)
			if L_270_arg1 > 31 or L_270_arg1 < -31 then
				return 0
			end;
			return L_207_func(L_269_arg0 % L_201_, L_270_arg1)
		end;
		local function L_209_func(L_271_arg0, L_272_arg1)
			if L_272_arg1 < 0 then
				return L_208_func(L_271_arg0, -L_272_arg1)
			end;
			return L_271_arg0 * 2 ^ L_272_arg1 % 4294967296
		end;
		local function L_210_func(L_273_arg0, L_274_arg1)
			L_273_arg0 = L_273_arg0 % L_201_;
			L_274_arg1 = L_274_arg1 % 32;
			local L_275_ = L_205_func(L_273_arg0, 2 ^ L_274_arg1 - 1)
			return L_208_func(L_273_arg0, L_274_arg1) + L_209_func(L_275_, 32 - L_274_arg1)
		end;
		local L_211_ = {
			1116352408,
			1899447441,
			3049323471,
			3921009573,
			961987163,
			1508970993,
			2453635748,
			2870763221,
			3624381080,
			310598401,
			607225278,
			1426881987,
			1925078388,
			2162078206,
			2614888103,
			3248222580,
			3835390401,
			4022224774,
			264347078,
			604807628,
			770255983,
			1249150122,
			1555081692,
			1996064986,
			2554220882,
			2821834349,
			2952996808,
			3210313671,
			3336571891,
			3584528711,
			113926993,
			338241895,
			666307205,
			773529912,
			1294757372,
			1396182291,
			1695183700,
			1986661051,
			2177026350,
			2456956037,
			2730485921,
			2820302411,
			3259730800,
			3345764771,
			3516065817,
			3600352804,
			4094571909,
			275423344,
			430227734,
			506948616,
			659060556,
			883997877,
			958139571,
			1322822218,
			1537002063,
			1747873779,
			1955562222,
			2024104815,
			2227730452,
			2361852424,
			2428436474,
			2756734187,
			3204031479,
			3329325298
		}
		local function L_212_func(L_276_arg0)
			return string.gsub(L_276_arg0, ".", function(L_277_arg0)
				return string.format("%02x", string.byte(L_277_arg0))
			end)
		end;
		local function L_213_func(L_278_arg0, L_279_arg1)
			local L_280_ = ""
			for L_281_forvar0 = 1, L_279_arg1 do
				local L_282_ = L_278_arg0 % 256;
				L_280_ = string.char(L_282_) .. L_280_;
				L_278_arg0 = (L_278_arg0 - L_282_) / 256
			end;
			return L_280_
		end;
		local function L_214_func(L_283_arg0, L_284_arg1)
			local L_285_ = 0;
			for L_286_forvar0 = L_284_arg1, L_284_arg1 + 3 do
				L_285_ = L_285_ * 256 + string.byte(L_283_arg0, L_286_forvar0)
			end;
			return L_285_
		end;
		local function L_215_func(L_287_arg0, L_288_arg1)
			local L_289_ = 64 - (L_288_arg1 + 9) % 64;
			L_288_arg1 = L_213_func(8 * L_288_arg1, 8)
			L_287_arg0 = L_287_arg0 .. "\128" .. string.rep("\0", L_289_) .. L_288_arg1;
			assert(#L_287_arg0 % 64 == 0)
			return L_287_arg0
		end;
		local function L_216_func(L_290_arg0)
			L_290_arg0[1] = 1779033703;
			L_290_arg0[2] = 3144134277;
			L_290_arg0[3] = 1013904242;
			L_290_arg0[4] = 2773480762;
			L_290_arg0[5] = 1359893119;
			L_290_arg0[6] = 2600822924;
			L_290_arg0[7] = 528734635;
			L_290_arg0[8] = 1541459225;
			return L_290_arg0
		end;
		local function L_217_func(L_291_arg0, L_292_arg1, L_293_arg2)
			local L_294_ = {}
			for L_303_forvar0 = 1, 16 do
				L_294_[L_303_forvar0] = L_214_func(L_291_arg0, L_292_arg1 + (L_303_forvar0 - 1) * 4)
			end;
			for L_304_forvar0 = 17, 64 do
				local L_305_ = L_294_[L_304_forvar0 - 15]
				local L_306_ = L_204_func(L_210_func(L_305_, 7), L_210_func(L_305_, 18), L_208_func(L_305_, 3))
				L_305_ = L_294_[L_304_forvar0 - 2]
				L_294_[L_304_forvar0] = (L_294_[L_304_forvar0 - 16] + L_306_ + L_294_[L_304_forvar0 - 7] + L_204_func(L_210_func(L_305_, 17), L_210_func(L_305_, 19), L_208_func(L_305_, 10))) % L_201_
			end;
			local L_295_, L_296_, L_297_, L_298_, L_299_, L_300_, L_301_, L_302_ = L_293_arg2[1], L_293_arg2[2], L_293_arg2[3], L_293_arg2[4], L_293_arg2[5], L_293_arg2[6], L_293_arg2[7], L_293_arg2[8]
			for L_307_forvar0 = 1, 64 do
				local L_308_ = L_204_func(L_210_func(L_295_, 2), L_210_func(L_295_, 13), L_210_func(L_295_, 22))
				local L_309_ = L_204_func(L_205_func(L_295_, L_296_), L_205_func(L_295_, L_297_), L_205_func(L_296_, L_297_))
				local L_310_ = (L_308_ + L_309_) % L_201_;
				local L_311_ = L_204_func(L_210_func(L_299_, 6), L_210_func(L_299_, 11), L_210_func(L_299_, 25))
				local L_312_ = L_204_func(L_205_func(L_299_, L_300_), L_205_func(L_206_func(L_299_), L_301_))
				local L_313_ = (L_302_ + L_311_ + L_312_ + L_211_[L_307_forvar0] + L_294_[L_307_forvar0]) % L_201_;
				L_302_ = L_301_;
				L_301_ = L_300_;
				L_300_ = L_299_;
				L_299_ = (L_298_ + L_313_) % L_201_;
				L_298_ = L_297_;
				L_297_ = L_296_;
				L_296_ = L_295_;
				L_295_ = (L_313_ + L_310_) % L_201_
			end;
			L_293_arg2[1] = (L_293_arg2[1] + L_295_) % L_201_;
			L_293_arg2[2] = (L_293_arg2[2] + L_296_) % L_201_;
			L_293_arg2[3] = (L_293_arg2[3] + L_297_) % L_201_;
			L_293_arg2[4] = (L_293_arg2[4] + L_298_) % L_201_;
			L_293_arg2[5] = (L_293_arg2[5] + L_299_) % L_201_;
			L_293_arg2[6] = (L_293_arg2[6] + L_300_) % L_201_;
			L_293_arg2[7] = (L_293_arg2[7] + L_301_) % L_201_;
			L_293_arg2[8] = (L_293_arg2[8] + L_302_) % L_201_
		end;
		local function L_218_func(L_314_arg0)
			L_314_arg0 = L_215_func(L_314_arg0, #L_314_arg0)
			local L_315_ = L_216_func{}
			for L_316_forvar0 = 1, #L_314_arg0, 64 do
				L_217_func(L_314_arg0, L_316_forvar0, L_315_)
			end;
			return L_212_func(L_213_func(L_315_[1], 4) .. L_213_func(L_315_[2], 4) .. L_213_func(L_315_[3], 4) .. L_213_func(L_315_[4], 4) .. L_213_func(L_315_[5], 4) .. L_213_func(L_315_[6], 4) .. L_213_func(L_315_[7], 4) .. L_213_func(L_315_[8], 4))
		end;
		local L_219_;
		local L_220_ = {
			["\\"] = "\\",
			["\""] = "\"",
			["\b"] = "b",
			["\f"] = "f",
			["\n"] = "n",
			["\r"] = "r",
			["\t"] = "t"
		}
		local L_221_ = {
			["/"] = "/"
		}
		for L_317_forvar0, L_318_forvar1 in pairs(L_220_) do
			L_221_[L_318_forvar1] = L_317_forvar0
		end;
		local L_222_ = function(L_319_arg0)
			return "\\" .. (L_220_[L_319_arg0] or string.format("u%04x", L_319_arg0:byte()))
		end;
		local L_223_ = function(L_320_arg0)
			return "null"
		end;
		local L_224_ = function(L_321_arg0, L_322_arg1)
			local L_323_ = {}
			L_322_arg1 = L_322_arg1 or {}
			if L_322_arg1[L_321_arg0] then
				error"circular reference"
			end;
			L_322_arg1[L_321_arg0] = true;
			if rawget(L_321_arg0, 1) ~= nil or next(L_321_arg0) == nil then
				local L_324_ = 0;
				for L_325_forvar0 in pairs(L_321_arg0) do
					if type(L_325_forvar0) ~= "number" then
						error"invalid table: mixed or invalid key types"
					end;
					L_324_ = L_324_ + 1
				end;
				if L_324_ ~= #L_321_arg0 then
					error"invalid table: sparse array"
				end;
				for L_326_forvar0, L_327_forvar1 in ipairs(L_321_arg0) do
					table.insert(L_323_, L_219_(L_327_forvar1, L_322_arg1))
				end;
				L_322_arg1[L_321_arg0] = nil;
				return "[" .. table.concat(L_323_, ",") .. "]"
			else
				for L_328_forvar0, L_329_forvar1 in pairs(L_321_arg0) do
					if type(L_328_forvar0) ~= "string" then
						error"invalid table: mixed or invalid key types"
					end;
					table.insert(L_323_, L_219_(L_328_forvar0, L_322_arg1) .. ":" .. L_219_(L_329_forvar1, L_322_arg1))
				end;
				L_322_arg1[L_321_arg0] = nil;
				return "{" .. table.concat(L_323_, ",") .. "}"
			end
		end;
		local L_225_ = function(L_330_arg0)
			return '"' .. L_330_arg0:gsub('[%z\1-\31\\"]', L_222_) .. '"'
		end;
		local L_226_ = function(L_331_arg0)
			if L_331_arg0 ~= L_331_arg0 or L_331_arg0 <= -math.huge or L_331_arg0 >= math.huge then
				error("unexpected number value '" .. tostring(L_331_arg0) .. "'")
			end;
			return string.format("%.14g", L_331_arg0)
		end;
		local L_227_ = {
			["nil"] = L_223_,
			table = L_224_,
			string = L_225_,
			number = L_226_,
			boolean = tostring
		}
		L_219_ = function(L_332_arg0, L_333_arg1)
			local L_334_ = type(L_332_arg0)
			local L_335_ = L_227_[L_334_]
			if L_335_ then
				return L_335_(L_332_arg0, L_333_arg1)
			end;
			error("unexpected type '" .. L_334_ .. "'")
		end;
		local L_228_ = function(L_336_arg0)
			return L_219_(L_336_arg0)
		end;
		local L_229_;
		local L_230_ = function(...)
			local L_337_ = {}
			for L_338_forvar0 = 1, select("#", ...) do
				L_337_[select(L_338_forvar0, ...)] = true
			end;
			return L_337_
		end;
		local L_231_ = L_230_(" ", "\t", "\r", "\n")
		local L_232_ = L_230_(" ", "\t", "\r", "\n", "]", "}", ",")
		local L_233_ = L_230_("\\", "/", '"', "b", "f", "n", "r", "t", "u")
		local L_234_ = L_230_("true", "false", "null")
		local L_235_ = {
			["true"] = true,
			["false"] = false,
			null = nil
		}
		local L_236_ = function(L_339_arg0, L_340_arg1, L_341_arg2, L_342_arg3)
			for L_343_forvar0 = L_340_arg1, #L_339_arg0 do
				if L_341_arg2[L_339_arg0:sub(L_343_forvar0, L_343_forvar0)] ~= L_342_arg3 then
					return L_343_forvar0
				end
			end;
			return #L_339_arg0 + 1
		end;
		local L_237_ = function(L_344_arg0, L_345_arg1, L_346_arg2)
			local L_347_ = 1;
			local L_348_ = 1;
			for L_349_forvar0 = 1, L_345_arg1 - 1 do
				L_348_ = L_348_ + 1;
				if L_344_arg0:sub(L_349_forvar0, L_349_forvar0) == "\n" then
					L_347_ = L_347_ + 1;
					L_348_ = 1
				end
			end;
			error(string.format("%s at line %d col %d", L_346_arg2, L_347_, L_348_))
		end;
		local L_238_ = function(L_350_arg0)
			local L_351_ = math.floor;
			if L_350_arg0 <= 127 then
				return string.char(L_350_arg0)
			elseif L_350_arg0 <= 2047 then
				return string.char(L_351_(L_350_arg0 / 64) + 192, L_350_arg0 % 64 + 128)
			elseif L_350_arg0 <= 65535 then
				return string.char(L_351_(L_350_arg0 / 4096) + 224, L_351_(L_350_arg0 % 4096 / 64) + 128, L_350_arg0 % 64 + 128)
			elseif L_350_arg0 <= 1114111 then
				return string.char(L_351_(L_350_arg0 / 262144) + 240, L_351_(L_350_arg0 % 262144 / 4096) + 128, L_351_(L_350_arg0 % 4096 / 64) + 128, L_350_arg0 % 64 + 128)
			end;
			error(string.format("invalid unicode codepoint '%x'", L_350_arg0))
		end;
		local L_239_ = function(L_352_arg0)
			local L_353_ = tonumber(L_352_arg0:sub(1, 4), 16)
			local L_354_ = tonumber(L_352_arg0:sub(7, 10), 16)
			if L_354_ then
				return L_238_((L_353_ - 55296) * 1024 + L_354_ - 56320 + 65536)
			else
				return L_238_(L_353_)
			end
		end;
		local L_240_ = function(L_355_arg0, L_356_arg1)
			local L_357_ = ""
			local L_358_ = L_356_arg1 + 1;
			local L_359_ = L_358_;
			while L_358_ <= #L_355_arg0 do
				local L_360_ = L_355_arg0:byte(L_358_)
				if L_360_ < 32 then
					L_237_(L_355_arg0, L_358_, "control character in string")
				elseif L_360_ == 92 then
					L_357_ = L_357_ .. L_355_arg0:sub(L_359_, L_358_ - 1)
					L_358_ = L_358_ + 1;
					local L_361_ = L_355_arg0:sub(L_358_, L_358_)
					if L_361_ == "u" then
						local L_362_ = L_355_arg0:match("^[dD][89aAbB]%x%x\\u%x%x%x%x", L_358_ + 1) or L_355_arg0:match("^%x%x%x%x", L_358_ + 1) or L_237_(L_355_arg0, L_358_ - 1, "invalid unicode escape in string")
						L_357_ = L_357_ .. L_239_(L_362_)
						L_358_ = L_358_ + #L_362_
					else
						if not L_233_[L_361_] then
							L_237_(L_355_arg0, L_358_ - 1, "invalid escape char '" .. L_361_ .. "' in string")
						end;
						L_357_ = L_357_ .. L_221_[L_361_]
					end;
					L_359_ = L_358_ + 1
				elseif L_360_ == 34 then
					L_357_ = L_357_ .. L_355_arg0:sub(L_359_, L_358_ - 1)
					return L_357_, L_358_ + 1
				end;
				L_358_ = L_358_ + 1
			end;
			L_237_(L_355_arg0, L_356_arg1, "expected closing quote for string")
		end;
		local L_241_ = function(L_363_arg0, L_364_arg1)
			local L_365_ = L_236_(L_363_arg0, L_364_arg1, L_232_)
			local L_366_ = L_363_arg0:sub(L_364_arg1, L_365_ - 1)
			local L_367_ = tonumber(L_366_)
			if not L_367_ then
				L_237_(L_363_arg0, L_364_arg1, "invalid number '" .. L_366_ .. "'")
			end;
			return L_367_, L_365_
		end;
		local L_242_ = function(L_368_arg0, L_369_arg1)
			local L_370_ = L_236_(L_368_arg0, L_369_arg1, L_232_)
			local L_371_ = L_368_arg0:sub(L_369_arg1, L_370_ - 1)
			if not L_234_[L_371_] then
				L_237_(L_368_arg0, L_369_arg1, "invalid literal '" .. L_371_ .. "'")
			end;
			return L_235_[L_371_], L_370_
		end;
		local L_243_ = function(L_372_arg0, L_373_arg1)
			local L_374_ = {}
			local L_375_ = 1;
			L_373_arg1 = L_373_arg1 + 1;
			while 1 do
				local L_376_;
				L_373_arg1 = L_236_(L_372_arg0, L_373_arg1, L_231_, true)
				if L_372_arg0:sub(L_373_arg1, L_373_arg1) == "]" then
					L_373_arg1 = L_373_arg1 + 1;
					break
				end;
				L_376_, L_373_arg1 = L_229_(L_372_arg0, L_373_arg1)
				L_374_[L_375_] = L_376_;
				L_375_ = L_375_ + 1;
				L_373_arg1 = L_236_(L_372_arg0, L_373_arg1, L_231_, true)
				local L_377_ = L_372_arg0:sub(L_373_arg1, L_373_arg1)
				L_373_arg1 = L_373_arg1 + 1;
				if L_377_ == "]" then
					break
				end;
				if L_377_ ~= "," then
					L_237_(L_372_arg0, L_373_arg1, "expected ']' or ','")
				end
			end;
			return L_374_, L_373_arg1
		end;
		local L_244_ = function(L_378_arg0, L_379_arg1)
			local L_380_ = {}
			L_379_arg1 = L_379_arg1 + 1;
			while 1 do
				local L_381_, L_382_;
				L_379_arg1 = L_236_(L_378_arg0, L_379_arg1, L_231_, true)
				if L_378_arg0:sub(L_379_arg1, L_379_arg1) == "}" then
					L_379_arg1 = L_379_arg1 + 1;
					break
				end;
				if L_378_arg0:sub(L_379_arg1, L_379_arg1) ~= '"' then
					L_237_(L_378_arg0, L_379_arg1, "expected string for key")
				end;
				L_381_, L_379_arg1 = L_229_(L_378_arg0, L_379_arg1)
				L_379_arg1 = L_236_(L_378_arg0, L_379_arg1, L_231_, true)
				if L_378_arg0:sub(L_379_arg1, L_379_arg1) ~= ":" then
					L_237_(L_378_arg0, L_379_arg1, "expected ':' after key")
				end;
				L_379_arg1 = L_236_(L_378_arg0, L_379_arg1 + 1, L_231_, true)
				L_382_, L_379_arg1 = L_229_(L_378_arg0, L_379_arg1)
				L_380_[L_381_] = L_382_;
				L_379_arg1 = L_236_(L_378_arg0, L_379_arg1, L_231_, true)
				local L_383_ = L_378_arg0:sub(L_379_arg1, L_379_arg1)
				L_379_arg1 = L_379_arg1 + 1;
				if L_383_ == "}" then
					break
				end;
				if L_383_ ~= "," then
					L_237_(L_378_arg0, L_379_arg1, "expected '}' or ','")
				end
			end;
			return L_380_, L_379_arg1
		end;
		local L_245_ = {
			['"'] = L_240_,
			["0"] = L_241_,
			["1"] = L_241_,
			["2"] = L_241_,
			["3"] = L_241_,
			["4"] = L_241_,
			["5"] = L_241_,
			["6"] = L_241_,
			["7"] = L_241_,
			["8"] = L_241_,
			["9"] = L_241_,
			["-"] = L_241_,
			t = L_242_,
			f = L_242_,
			n = L_242_,
			["["] = L_243_,
			["{"] = L_244_
		}
		L_229_ = function(L_384_arg0, L_385_arg1)
			local L_386_ = L_384_arg0:sub(L_385_arg1, L_385_arg1)
			local L_387_ = L_245_[L_386_]
			if L_387_ then
				return L_387_(L_384_arg0, L_385_arg1)
			end;
			L_237_(L_384_arg0, L_385_arg1, "unexpected character '" .. L_386_ .. "'")
		end;
		local L_246_ = function(L_388_arg0)
			if type(L_388_arg0) ~= "string" then
				error("expected argument of type string, got " .. type(L_388_arg0))
			end;
			local L_389_, L_390_ = L_229_(L_388_arg0, L_236_(L_388_arg0, 1, L_231_, true))
			L_390_ = L_236_(L_388_arg0, L_390_, L_231_, true)
			if L_390_ <= #L_388_arg0 then
				L_237_(L_388_arg0, L_390_, "trailing garbage")
			end;
			return L_389_
		end;
		local L_247_, L_248_, L_249_ = L_228_, L_246_, L_218_func;
		local L_250_ = {}
		function L_250_.New(L_391_arg0, L_392_arg1)
			local L_393_ = L_391_arg0;
			local L_394_ = L_392_arg1;
			local L_395_ = true;
			local L_396_ = function(L_416_arg0)
			end;
			repeat
				task.wait(1)
			until game:IsLoaded();
			local L_397_ = false;
			local L_398_, L_399_, L_400_, L_401_, L_402_, L_403_, L_404_, L_405_, L_406_ = setclipboard or toclipboard, request or http_request or syn_request, string.char, tostring, string.sub, os.time, math.random, math.floor, gethwid or function()
				return game:GetService"Players".LocalPlayer.UserId
			end
			local L_407_, L_408_ = "", 0;
			local L_409_ = "https://api.platoboost.com";
			local L_410_ = L_399_{
				Url = L_409_ .. "/public/connectivity",
				Method = "GET"
			};
			if L_410_.StatusCode ~= 200 or L_410_.StatusCode ~= 429 then
				L_409_ = "https://api.platoboost.net";
			end
			function cacheLink()
				if L_408_ + (600) < L_403_() then
					local L_417_ = L_399_{
						Url = L_409_ .. "/public/start",
						Method = "POST",
						Body = L_247_{
							service = L_393_,
							identifier = L_249_(L_406_())
						},
						Headers = {
							["Content-Type"] = "application/json",
							["User-Agent"] = "Roblox/Exploit"
						}
					};
					if L_417_.StatusCode == 200 then
						local L_419_ = L_248_(L_417_.Body);
						if L_419_.success == true then
							L_407_ = L_419_.data.url;
							L_408_ = L_403_();
							return true, L_407_
						else
							L_396_(L_419_.message);
							return false, L_419_.message
						end
					elseif L_417_.StatusCode == 429 then
						local L_420_ = "you are being rate limited, please wait 20 seconds and try again.";
						L_396_(L_420_);
						return false, L_420_
					end
					local L_418_ = "Failed to cache link.";
					L_396_(L_418_);
					return false, L_418_
				else
					return true, L_407_
				end
			end
			cacheLink();
			local L_411_ = function()
				local L_421_ = ""
				for L_422_forvar0 = 1, 16 do
					L_421_ = L_421_ .. L_400_(L_405_(L_404_() * (26)) + 97)
				end
				return L_421_
			end
			for L_423_forvar0 = 1, 5 do
				local L_424_ = L_411_();
				task.wait(0.2)
				if L_411_() == L_424_ then
					local L_425_ = "platoboost nonce error.";
					L_396_(L_425_);
					error(L_425_);
				end
			end
			local L_412_ = function()
				local L_426_, L_427_ = cacheLink();
				if L_426_ then
					L_398_(L_427_);
				end
			end
			local L_413_ = function(L_428_arg0)
				local L_429_ = L_411_();
				local L_430_ = L_409_ .. "/public/redeem/" .. L_401_(L_393_);
				local L_431_ = {
					identifier = L_249_(L_406_()),
					key = L_428_arg0
				}
				if L_395_ then
					L_431_.nonce = L_429_;
				end
				local L_432_ = L_399_{
					Url = L_430_,
					Method = "POST",
					Body = L_247_(L_431_),
					Headers = {
						["Content-Type"] = "application/json"
					}
				};
				if L_432_.StatusCode == 200 then
					local L_433_ = L_248_(L_432_.Body);
					if L_433_.success == true then
						if L_433_.data.valid == true then
							if L_395_ then
								if L_433_.data.hash == L_249_("true" .. "-" .. L_429_ .. "-" .. L_394_) then
									return true
								else
									L_396_"failed to verify integrity.";
									return false
								end
							else
								return true
							end
						else
							L_396_"key is invalid.";
							return false
						end
					else
						if L_402_(L_433_.message, 1, 27) == "unique constraint violation" then
							L_396_"you already have an active key, please wait for it to expire before redeeming it.";
							return false
						else
							L_396_(L_433_.message);
							return false
						end
					end
				elseif L_432_.StatusCode == 429 then
					L_396_"you are being rate limited, please wait 20 seconds and try again.";
					return false
				else
					L_396_"server returned an invalid status code, please try again later.";
					return false
				end
			end
			local L_414_ = function(L_434_arg0)
				if L_397_ == true then
					return false, ("A request is already being sent, please slow down.")
				else
					L_397_ = true;
				end
				local L_435_ = L_411_();
				local L_436_ = L_409_ .. "/public/whitelist/" .. L_401_(L_393_) .. "?identifier=" .. L_249_(L_406_()) .. "&key=" .. L_434_arg0;
				if L_395_ then
					L_436_ = L_436_ .. "&nonce=" .. L_435_;
				end
				local L_437_ = L_399_{
					Url = L_436_,
					Method = "GET",
				};
				L_397_ = false;
				if L_437_.StatusCode == 200 then
					local L_438_ = L_248_(L_437_.Body);
					if L_438_.success == true then
						if L_438_.data.valid == true then
							if L_395_ then
								if L_438_.data.hash == L_249_("true" .. "-" .. L_435_ .. "-" .. L_394_) then
									return true, ""
								else
									return false, ("failed to verify integrity.")
								end
							else
								return true
							end
						else
							if L_402_(L_434_arg0, 1, 4) == "KEY_" then
								return true, L_413_(L_434_arg0)
							else
								return false, ("Key is invalid.")
							end
						end
					else
						return false, (L_438_.message)
					end
				elseif L_437_.StatusCode == 429 then
					return false, ("You are being rate limited, please wait 20 seconds and try again.")
				else
					return false, ("Server returned an invalid status code, please try again later.")
				end
			end
			local L_415_ = function(L_439_arg0)
				local L_440_ = L_411_();
				local L_441_ = L_409_ .. "/public/flag/" .. L_401_(L_393_) .. "?name=" .. L_439_arg0;
				if L_395_ then
					L_441_ = L_441_ .. "&nonce=" .. L_440_;
				end
				local L_442_ = L_399_{
					Url = L_441_,
					Method = "GET",
				};
				if L_442_.StatusCode == 200 then
					local L_443_ = L_248_(L_442_.Body);
					if L_443_.success == true then
						if L_395_ then
							if L_443_.data.hash == L_249_(L_401_(L_443_.data.value) .. "-" .. L_440_ .. "-" .. L_394_) then
								return L_443_.data.value
							else
								L_396_"failed to verify integrity.";
								return nil
							end
						else
							return L_443_.data.value
						end
					else
						L_396_(L_443_.message);
						return nil
					end
				else
					return nil
				end
			end
			return {
				Verify = L_414_,
				GetFlag = L_415_,
				Copy = L_412_,
			}
		end
		return L_250_
	end
	function L_1_.e()
		local L_444_ = game:GetService"HttpService"
		local L_445_ = {}
		function L_445_.New(L_446_arg0)
			local L_447_ = gethwid or function()
				return game:GetService"Players".LocalPlayer.UserId
			end
			local L_448_, L_449_ = request or http_request or syn_request, setclipboard or toclipboard
			function ValidateKey(L_450_arg0)
				local L_451_ = "https://pandadevelopment.net/v2_validation?key=" .. tostring(L_450_arg0) .. "&service=" .. tostring(L_446_arg0) .. "&hwid=" .. tostring(L_447_())
				local L_452_, L_453_ = pcall(function()
					return L_448_{
						Url = L_451_,
						Method = "GET",
						Headers = {
							["User-Agent"] = "Roblox/Exploit"
						}
					}
				end)
				if L_452_ and L_453_ then
					if L_453_.Success then
						local L_454_, L_455_ = pcall(function()
							return L_444_:JSONDecode(L_453_.Body)
						end)
						if L_454_ and L_455_ then
							if L_455_.V2_Authentication and L_455_.V2_Authentication == "success" then
								return true, "Authenticated"
							else
								local L_456_ = L_455_.Key_Information.Notes or "Unknown reason"
								return false, "Authentication failed: " .. L_456_
							end
						else
							return false, "JSON decode error"
						end
					else
						warn("[Pelinda Ov2.5] HTTP request was not successful. Code: " .. tostring(L_453_.StatusCode) .. " Message: " .. L_453_.StatusMessage)
						return false, "HTTP request failed: " .. L_453_.StatusMessage
					end
				else
					return false, "Request pcall error"
				end
			end
			function GetKeyLink()
				return "https://pandadevelopment.net/getkey?service=" .. tostring(L_446_arg0) .. "&hwid=" .. tostring(L_447_())
			end
			function CopyLink()
				return L_449_(GetKeyLink())
			end
			return {
				Verify = ValidateKey,
				Copy = CopyLink
			}
		end
		return L_445_
	end
	function L_1_.f()
		local L_457_ = {}
		function L_457_.New(L_458_arg0, L_459_arg1)
			local L_460_ = "https://sdkapi-public.luarmor.net/library.lua"
			local L_461_ = loadstring(
game.HttpGetAsync and game:HttpGetAsync(L_460_)
or HttpService:GetAsync(L_460_)
)()
			local L_462_ = setclipboard or toclipboard
			L_461_.script_id = L_458_arg0
			function ValidateKey(L_463_arg0)
				local L_464_ = L_461_.check_key(L_463_arg0);
				if (L_464_.code == "KEY_VALID") then
					return true, "Whitelisted!"
				elseif (L_464_.code == "KEY_HWID_LOCKED") then
					return false, "Key linked to a different HWID. Please reset it using our bot"
				elseif (L_464_.code == "KEY_INCORRECT") then
					return false, "Key is wrong or deleted!"
				else
					return false, "Key check failed:" .. L_464_.message .. " Code: " .. L_464_.code
				end
			end
			function CopyLink()
				L_462_(tostring(L_459_arg1))
			end
			return {
				Verify = ValidateKey,
				Copy = CopyLink
			}
		end
		return L_457_
	end
	function L_1_.g()
		return {
			platoboost = {
				Name = "Platoboost",
				Icon = "rbxassetid://75920162824531",
				Args = {
					"ServiceId",
					"Secret"
				},
				New = L_1_.load'd'.New
			},
			pandadevelopment = {
				Name = "Panda Development",
				Icon = "panda",
				Args = {
					"ServiceId"
				},
				New = L_1_.load'e'.New
			},
			luarmor = {
				Name = "Luarmor",
				Icon = "rbxassetid://130918283130165",
				Args = {
					"ScriptId",
					"Discord"
				},
				New = L_1_.load'f'.New
			},
		}
	end
	function L_1_.h()
		return [[
{
    "name": "windui",
    "version": "1.6.54",
    "main": "./dist/main.lua",
    "repository": "https://github.com/Footagesus/WindUI",
    "discord": "https://discord.gg/ftgs-development-hub-1300692552005189632",
    "author": "Footagesus",
    "description": "Roblox UI Library for scripts",
    "license": "MIT",
    "scripts": {
        "dev": "sh build/build.sh dev $INPUT_FILE",
        "build": "sh build/build.sh build $INPUT_FILE",
        "live": "python -m http.server 8642",
        "watch": "chokidar . -i 'node_modules' -i 'dist' -i 'build' -c 'npm run dev --'",
        "live-build": "concurrently \"npm run live\" \"npm run watch --\"",
        "updater": "python updater/main.py"
    },
    "keywords": [
        "ui-library",
        "ui-design",
        "script",
        "script-hub",
        "exploiting"
    ],
    "devDependencies": {
        "chokidar-cli": "^3.0.0",
        "concurrently": "^9.2.0"
    }
}]]
	end
	function L_1_.i()
		local L_465_ = {}
		local L_466_ = L_1_.load'a'
		local L_467_ = L_466_.New
		local L_468_ = L_466_.Tween
		function L_465_.New(L_469_arg0, L_470_arg1, L_471_arg2, L_472_arg3, L_473_arg4, L_474_arg5, L_475_arg6, L_476_arg7)
			L_472_arg3 = L_472_arg3 or "Primary"
			local L_477_ = L_476_arg7 or (not L_475_arg6 and 10 or 99)
			local L_478_
			if L_470_arg1 and L_470_arg1 ~= "" then
				L_478_ = L_467_("ImageLabel", {
					Image = L_466_.Icon(L_470_arg1)[1],
					ImageRectSize = L_466_.Icon(L_470_arg1)[2].ImageRectSize,
					ImageRectOffset = L_466_.Icon(L_470_arg1)[2].ImageRectPosition,
					Size = UDim2.new(0, 21, 0, 21),
					BackgroundTransparency = 1,
					ImageColor3 = L_472_arg3 == "White" and Color3.new(0, 0, 0) or nil,
					ImageTransparency = L_472_arg3 == "White" and .4 or 0,
					ThemeTag = {
						ImageColor3 = L_472_arg3 ~= "White" and "Icon" or nil,
					}
				})
			end
			local L_479_ = L_467_("TextButton", {
				Size = UDim2.new(0, 0, 1, 0),
				AutomaticSize = "X",
				Parent = L_473_arg4,
				BackgroundTransparency = 1
			}, {
				L_466_.NewRoundFrame(L_477_, "Squircle", {
					ThemeTag = {
						ImageColor3 = L_472_arg3 ~= "White" and "Button" or nil,
					},
					ImageColor3 = L_472_arg3 == "White" and Color3.new(1, 1, 1) or nil,
					Size = UDim2.new(1, 0, 1, 0),
					Name = "Squircle",
					ImageTransparency = L_472_arg3 == "Primary" and 0 or L_472_arg3 == "White" and 0 or 1
				}),
				L_466_.NewRoundFrame(L_477_, "Squircle", {
					ImageColor3 = Color3.new(1, 1, 1),
					Size = UDim2.new(1, 0, 1, 0),
					Name = "Special",
					ImageTransparency = L_472_arg3 == "Secondary" and 0.95 or 1
				}),
				L_466_.NewRoundFrame(L_477_, "Shadow-sm", {
					ImageColor3 = Color3.new(0, 0, 0),
					Size = UDim2.new(1, 3, 1, 3),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Name = "Shadow",
					ImageTransparency = 1,
					Visible = not L_475_arg6
				}),
				L_466_.NewRoundFrame(L_477_, not L_475_arg6 and "SquircleOutline" or "SquircleOutline2", {
					ThemeTag = {
						ImageColor3 = L_472_arg3 ~= "White" and "Outline" or nil,
					},
					Size = UDim2.new(1, 0, 1, 0),
					ImageColor3 = L_472_arg3 == "White" and Color3.new(0, 0, 0) or nil,
					ImageTransparency = L_472_arg3 == "Primary" and .95 or .85,
					Name = "SquircleOutline",
				}, {
					L_467_("UIGradient", {
						Rotation = 70,
						Color = ColorSequence.new{
							ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
						},
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0.0, 0.1),
							NumberSequenceKeypoint.new(0.5, 1),
							NumberSequenceKeypoint.new(1.0, 0.1),
						}
					})
				}),
				L_466_.NewRoundFrame(L_477_, "Squircle", {
					Size = UDim2.new(1, 0, 1, 0),
					Name = "Frame",
					ThemeTag = {
						ImageColor3 = L_472_arg3 ~= "White" and "Text" or nil
					},
					ImageColor3 = L_472_arg3 == "White" and Color3.new(0, 0, 0) or nil,
					ImageTransparency = 1
				}, {
					L_467_("UIPadding", {
						PaddingLeft = UDim.new(0, 16),
						PaddingRight = UDim.new(0, 16),
					}),
					L_467_("UIListLayout", {
						FillDirection = "Horizontal",
						Padding = UDim.new(0, 8),
						VerticalAlignment = "Center",
						HorizontalAlignment = "Center",
					}),
					L_478_,
					L_467_("TextLabel", {
						BackgroundTransparency = 1,
						FontFace = Font.new(L_466_.Font, Enum.FontWeight.SemiBold),
						Text = L_469_arg0 or "Button",
						ThemeTag = {
							TextColor3 = (L_472_arg3 ~= "Primary" and L_472_arg3 ~= "White") and "Text",
						},
						TextColor3 = L_472_arg3 == "Primary" and Color3.new(1, 1, 1) or L_472_arg3 == "White" and Color3.new(0, 0, 0) or nil,
						AutomaticSize = "XY",
						TextSize = 18,
					})
				})
			})
			L_466_.AddSignal(L_479_.MouseEnter, function()
				L_468_(L_479_.Frame, .047, {
					ImageTransparency = .95
				}):Play()
			end)
			L_466_.AddSignal(L_479_.MouseLeave, function()
				L_468_(L_479_.Frame, .047, {
					ImageTransparency = 1
				}):Play()
			end)
			L_466_.AddSignal(L_479_.MouseButton1Up, function()
				if L_474_arg5 then
					L_474_arg5:Close()()
				end
				if L_471_arg2 then
					L_466_.SafeCallback(L_471_arg2)
				end
			end)
			return L_479_
		end
		return L_465_
	end
	function L_1_.j()
		local L_480_ = {}
		local L_481_ = L_1_.load'a'
		local L_482_ = L_481_.New
		local L_483_ =
L_481_.Tween
		function L_480_.New(L_484_arg0, L_485_arg1, L_486_arg2, L_487_arg3, L_488_arg4, L_489_arg5, L_490_arg6, L_491_arg7)
			L_487_arg3 = L_487_arg3 or "Input"
			local L_492_ = L_490_arg6 or 10
			local L_493_
			if L_485_arg1 and L_485_arg1 ~= "" then
				L_493_ = L_482_("ImageLabel", {
					Image = L_481_.Icon(L_485_arg1)[1],
					ImageRectSize = L_481_.Icon(L_485_arg1)[2].ImageRectSize,
					ImageRectOffset = L_481_.Icon(L_485_arg1)[2].ImageRectPosition,
					Size = UDim2.new(0, 21, 0, 21),
					BackgroundTransparency = 1,
					ThemeTag = {
						ImageColor3 = "Icon",
					}
				})
			end
			local L_494_ = L_487_arg3 ~= "Input"
			local L_495_ = L_482_("TextBox", {
				BackgroundTransparency = 1,
				TextSize = 17,
				FontFace = Font.new(L_481_.Font, Enum.FontWeight.Regular),
				Size = UDim2.new(1, L_493_ and -29 or 0, 1, 0),
				PlaceholderText = L_484_arg0,
				ClearTextOnFocus = L_491_arg7 or false,
				ClipsDescendants = true,
				TextWrapped = L_494_,
				MultiLine = L_494_,
				TextXAlignment = "Left",
				TextYAlignment = L_487_arg3 == "Input" and "Center" or "Top",
				ThemeTag = {
					PlaceholderColor3 = "PlaceholderText",
					TextColor3 = "Text",
				},
			})
			local L_496_ = L_482_("Frame", {
				Size = UDim2.new(1, 0, 0, 42),
				Parent = L_486_arg2,
				BackgroundTransparency = 1
			}, {
				L_482_("Frame", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
				}, {
					L_481_.NewRoundFrame(L_492_, "Squircle", {
						ThemeTag = {
							ImageColor3 = "Accent",
						},
						Size = UDim2.new(1, 0, 1, 0),
						ImageTransparency = .97,
					}),
					L_481_.NewRoundFrame(L_492_, "SquircleOutline", {
						ThemeTag = {
							ImageColor3 = "Outline",
						},
						Size = UDim2.new(1, 0, 1, 0),
						ImageTransparency = .95,
					}, {













}),
					L_481_.NewRoundFrame(L_492_, "Squircle", {
						Size = UDim2.new(1, 0, 1, 0),
						Name = "Frame",
						ImageColor3 = Color3.new(1, 1, 1),
						ImageTransparency = .95
					}, {
						L_482_("UIPadding", {
							PaddingTop = UDim.new(0, L_487_arg3 == "Input" and 0 or 12),
							PaddingLeft = UDim.new(0, 12),
							PaddingRight = UDim.new(0, 12),
							PaddingBottom = UDim.new(0, L_487_arg3 == "Input" and 0 or 12),
						}),
						L_482_("UIListLayout", {
							FillDirection = "Horizontal",
							Padding = UDim.new(0, 8),
							VerticalAlignment = L_487_arg3 == "Input" and "Center" or "Top",
							HorizontalAlignment = "Left",
						}),
						L_493_,
						L_495_,
					})
				})
			})
			if L_489_arg5 then
				L_481_.AddSignal(L_495_:GetPropertyChangedSignal"Text", function()
					if L_488_arg4 then
						L_481_.SafeCallback(L_488_arg4, L_495_.Text)
					end
				end)
			else
				L_481_.AddSignal(L_495_.FocusLost, function()
					if L_488_arg4 then
						L_481_.SafeCallback(L_488_arg4, L_495_.Text)
					end
				end)
			end
			return L_496_
		end
		return L_480_
	end
	function L_1_.k()
		local L_497_ = L_1_.load'a'
		local L_498_ = L_497_.New
		local L_499_ = L_497_.Tween
		local L_500_ = {
			Holder = nil,
			Parent = nil,
		}
		function L_500_.Init(L_501_arg0, L_502_arg1)
			Window = L_501_arg0
			L_500_.Parent = L_502_arg1
			return L_500_
		end
		function L_500_.Create(L_503_arg0)
			local L_504_ = {
				UICorner = 24,
				UIPadding = 15,
				UIElements = {}
			}
			if L_503_arg0 then
				L_504_.UIPadding = 0
			end
			if L_503_arg0 then
				L_504_.UICorner = 26
			end
			if not L_503_arg0 then
				L_504_.UIElements.FullScreen = L_498_("Frame", {
					ZIndex = 999,
					BackgroundTransparency = 1,
					BackgroundColor3 = Color3.fromHex"#000000",
					Size = UDim2.new(1, 0, 1, 0),
					Active = false,
					Visible = false,
					Parent = L_500_.Parent or (Window and Window.UIElements and Window.UIElements.Main and Window.UIElements.Main.Main)
				}, {
					L_498_("UICorner", {
						CornerRadius = UDim.new(0, Window.UICorner)
					})
				})
			end
			L_504_.UIElements.Main = L_498_("Frame", {
				Size = UDim2.new(0, 280, 0, 0),
				ThemeTag = {
					BackgroundColor3 = "Dialog",
				},
				AutomaticSize = "Y",
				BackgroundTransparency = 1,
				Visible = false,
				ZIndex = 99999,
			}, {
				L_498_("UIPadding", {
					PaddingTop = UDim.new(0, L_504_.UIPadding),
					PaddingLeft = UDim.new(0, L_504_.UIPadding),
					PaddingRight = UDim.new(0, L_504_.UIPadding),
					PaddingBottom = UDim.new(0, L_504_.UIPadding),
				})
			})
			L_504_.UIElements.MainContainer = L_497_.NewRoundFrame(L_504_.UICorner, "Squircle", {
				Visible = false,
				ImageTransparency = L_503_arg0 and 0.15 or 0,
				Parent = L_503_arg0 and L_500_.Parent or L_504_.UIElements.FullScreen,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				AutomaticSize = "XY",
				ThemeTag = {
					ImageColor3 = "Dialog"
				},
				ZIndex = 9999,
			}, {
				L_504_.UIElements.Main,
				L_497_.NewRoundFrame(L_504_.UICorner, "SquircleOutline2", {
					Size = UDim2.new(1, 0, 1, 0),
					ImageTransparency = 1,
					ThemeTag = {
						ImageColor3 = "Outline",
					},
				}, {
					L_498_("UIGradient", {
						Rotation = 45,
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0, 0.55),
							NumberSequenceKeypoint.new(0.5, 0.8),
							NumberSequenceKeypoint.new(1, 0.6)
						}
					})
				})
			})
			function L_504_.Open(L_505_arg0)
				if not L_503_arg0 then
					L_504_.UIElements.FullScreen.Visible = true
					L_504_.UIElements.FullScreen.Active = true
				end
				task.spawn(function()
					L_504_.UIElements.MainContainer.Visible = true
					if not L_503_arg0 then
						L_499_(L_504_.UIElements.FullScreen, 0.1, {
							BackgroundTransparency = .3
						}):Play()
					end
					L_499_(L_504_.UIElements.MainContainer, 0.1, {
						ImageTransparency = 0
					}):Play()
					task.spawn(function()
						task.wait(0.05)
						L_504_.UIElements.Main.Visible = true
					end)
				end)
			end
			function L_504_.Close(L_506_arg0)
				if not L_503_arg0 then
					L_499_(L_504_.UIElements.FullScreen, 0.1, {
						BackgroundTransparency = 1
					}):Play()
					L_504_.UIElements.FullScreen.Active = false
					task.spawn(function()
						task.wait(.1)
						L_504_.UIElements.FullScreen.Visible = false
					end)
				end
				L_504_.UIElements.Main.Visible = false
				L_499_(L_504_.UIElements.MainContainer, 0.1, {
					ImageTransparency = 1
				}):Play()
				task.spawn(function()
					task.wait(.1)
					if not L_503_arg0 then
						L_504_.UIElements.FullScreen:Destroy()
					else
						L_504_.UIElements.MainContainer:Destroy()
					end
				end)
				return function()
				end
			end
			return L_504_
		end
		return L_500_
	end
	function L_1_.l()
		local L_507_ = {}
		local L_508_ = L_1_.load'a'
		local L_509_ = L_508_.New
		local L_510_ = L_508_.Tween
		local L_511_ = L_1_.load'i'.New
		local L_512_ = L_1_.load'j'.New
		function L_507_.new(L_513_arg0, L_514_arg1, L_515_arg2)
			local L_516_ = L_1_.load'k'.Init(nil, L_513_arg0.WindUI.ScreenGui.KeySystem)
			local L_517_ = L_516_.Create(true)
			local L_518_ = {}
			local L_519_
			local L_520_ = (L_513_arg0.KeySystem.Thumbnail and L_513_arg0.KeySystem.Thumbnail.Width) or 200
			local L_521_ = 430
			if L_513_arg0.KeySystem.Thumbnail and L_513_arg0.KeySystem.Thumbnail.Image then
				L_521_ = 430 + (L_520_ / 2)
			end
			L_517_.UIElements.Main.AutomaticSize = "Y"
			L_517_.UIElements.Main.Size = UDim2.new(0, L_521_, 0, 0)
			local L_522_
			if L_513_arg0.Icon then
				L_522_ = L_508_.Image(
L_513_arg0.Icon,
L_513_arg0.Title .. ":" .. L_513_arg0.Icon,
0,
"Temp",
"KeySystem",
L_513_arg0.IconThemed
)
				L_522_.Size = UDim2.new(0, 24, 0, 24)
				L_522_.LayoutOrder = -1
			end
			local L_523_ = L_509_("TextLabel", {
				AutomaticSize = "XY",
				BackgroundTransparency = 1,
				Text = L_513_arg0.Title,
				FontFace = Font.new(L_508_.Font, Enum.FontWeight.SemiBold),
				ThemeTag = {
					TextColor3 = "Text",
				},
				TextSize = 20
			})
			local L_524_ = L_509_("TextLabel", {
				AutomaticSize = "XY",
				BackgroundTransparency = 1,
				Text = "Key System",
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, 0, 0.5, 0),
				TextTransparency = 1,
				FontFace = Font.new(L_508_.Font, Enum.FontWeight.Medium),
				ThemeTag = {
					TextColor3 = "Text",
				},
				TextSize = 16
			})
			local L_525_ = L_509_("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = "XY",
			}, {
				L_509_("UIListLayout", {
					Padding = UDim.new(0, 14),
					FillDirection = "Horizontal",
					VerticalAlignment = "Center"
				}),
				L_522_,
				L_523_
			})
			local L_526_ = L_509_("Frame", {
				AutomaticSize = "Y",
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
			}, {
				L_525_,
				L_524_,
			})
			local L_527_ = L_512_("Enter Key", "key", nil, "Input", function(L_534_arg0)
				L_519_ = L_534_arg0
			end)
			local L_528_
			if L_513_arg0.KeySystem.Note and L_513_arg0.KeySystem.Note ~= "" then
				L_528_ = L_509_("TextLabel", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
					FontFace = Font.new(L_508_.Font, Enum.FontWeight.Medium),
					TextXAlignment = "Left",
					Text = L_513_arg0.KeySystem.Note,
					TextSize = 18,
					TextTransparency = .4,
					ThemeTag = {
						TextColor3 = "Text",
					},
					BackgroundTransparency = 1,
					RichText = true,
					TextWrapped = true,
				})
			end
			local L_529_ = L_509_("Frame", {
				Size = UDim2.new(1, 0, 0, 42),
				BackgroundTransparency = 1,
			}, {
				L_509_("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = "X",
					Size = UDim2.new(0, 0, 1, 0),
				}, {
					L_509_("UIListLayout", {
						Padding = UDim.new(0, 9),
						FillDirection = "Horizontal",
					})
				})
			})
			local L_530_
			if L_513_arg0.KeySystem.Thumbnail and L_513_arg0.KeySystem.Thumbnail.Image then
				local L_535_
				if L_513_arg0.KeySystem.Thumbnail.Title then
					L_535_ = L_509_("TextLabel", {
						Text = L_513_arg0.KeySystem.Thumbnail.Title,
						ThemeTag = {
							TextColor3 = "Text",
						},
						TextSize = 18,
						FontFace = Font.new(L_508_.Font, Enum.FontWeight.Medium),
						BackgroundTransparency = 1,
						AutomaticSize = "XY",
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0),
					})
				end
				L_530_ = L_509_("ImageLabel", {
					Image = L_513_arg0.KeySystem.Thumbnail.Image,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, L_520_, 1, -12),
					Position = UDim2.new(0, 6, 0, 6),
					Parent = L_517_.UIElements.Main,
					ScaleType = "Crop"
				}, {
					L_535_,
					L_509_("UICorner", {
						CornerRadius = UDim.new(0, 20),
					})
				})
			end
			L_509_("Frame", {
				Size = UDim2.new(1, L_530_ and -L_520_ or 0, 1, 0),
				Position = UDim2.new(0, L_530_ and L_520_ or 0, 0, 0),
				BackgroundTransparency = 1,
				Parent = L_517_.UIElements.Main
			}, {
				L_509_("Frame", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
				}, {
					L_509_("UIListLayout", {
						Padding = UDim.new(0, 18),
						FillDirection = "Vertical",
					}),
					L_526_,
					L_528_,
					L_527_,
					L_529_,
					L_509_("UIPadding", {
						PaddingTop = UDim.new(0, 16),
						PaddingLeft = UDim.new(0, 16),
						PaddingRight = UDim.new(0, 16),
						PaddingBottom = UDim.new(0, 16),
					})
				}),
			})
			local L_531_ = L_511_("Exit", "log-out", function()
				L_517_:Close()()
			end, "Tertiary", L_529_.Frame)
			if L_530_ then
				L_531_.Parent = L_530_
				L_531_.Size = UDim2.new(0, 0, 0, 42)
				L_531_.Position = UDim2.new(0, 10, 1, -10)
				L_531_.AnchorPoint = Vector2.new(0, 1)
			end
			if L_513_arg0.KeySystem.URL then
				L_511_("Get key", "key", function()
					setclipboard(L_513_arg0.KeySystem.URL)
				end, "Secondary", L_529_.Frame)
			end
			if L_513_arg0.KeySystem.API then
				local L_536_ = 240
				local L_537_ = false
				local L_538_ = L_511_("Get key", "key", nil, "Secondary", L_529_.Frame)
				local L_539_ = L_508_.NewRoundFrame(99, "Squircle", {
					Size = UDim2.new(0, 1, 1, 0),
					ThemeTag = {
						ImageColor3 = "Text",
					},
					ImageTransparency = .9,
				})
				L_509_("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 0, 1, 0),
					AutomaticSize = "X",
					Parent = L_538_.Frame,
				}, {
					L_539_,
					L_509_("UIPadding", {
						PaddingLeft = UDim.new(0, 5),
						PaddingRight = UDim.new(0, 5),
					})
				})
				local L_540_ = L_508_.Image(
"chevron-down",
"chevron-down",
0,
"Temp",
"KeySystem",
true
)
				L_540_.Size = UDim2.new(1, 0, 1, 0)
				L_509_("Frame", {
					Size = UDim2.new(0, 21, 0, 21),
					Parent = L_538_.Frame,
					BackgroundTransparency = 1,
				}, {
					L_540_
				})
				local L_541_ = L_508_.NewRoundFrame(15, "Squircle", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
					ThemeTag = {
						ImageColor3 = "Background",
					},
				}, {
					L_509_("UIPadding", {
						PaddingTop = UDim.new(0, 5),
						PaddingLeft = UDim.new(0, 5),
						PaddingRight = UDim.new(0, 5),
						PaddingBottom = UDim.new(0, 5),
					}),
					L_509_("UIListLayout", {
						FillDirection = "Vertical",
						Padding = UDim.new(0, 5),
					})
				})
				local L_542_ = L_509_("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, L_536_, 0, 0),
					ClipsDescendants = true,
					AnchorPoint = Vector2.new(1, 0),
					Parent = L_538_,
					Position = UDim2.new(1, 0, 1, 15)
				}, {
					L_541_
				})
				L_509_("TextLabel", {
					Text = "Select Service",
					BackgroundTransparency = 1,
					FontFace = Font.new(L_508_.Font, Enum.FontWeight.Medium),
					ThemeTag = {
						TextColor3 = "Text"
					},
					TextTransparency = 0.2,
					TextSize = 16,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
					TextWrapped = true,
					TextXAlignment = "Left",
					Parent = L_541_,
				}, {
					L_509_("UIPadding", {
						PaddingTop = UDim.new(0, 10),
						PaddingLeft = UDim.new(0, 10),
						PaddingRight = UDim.new(0, 10),
						PaddingBottom = UDim.new(0, 10),
					})
				})
				for L_543_forvar0, L_544_forvar1 in next, L_513_arg0.KeySystem.API do
					local L_545_ = L_513_arg0.WindUI.Services[L_544_forvar1.Type]
					if L_545_ then
						local L_546_ = {}
						for L_550_forvar0, L_551_forvar1 in next, L_545_.Args do
							table.insert(L_546_, L_544_forvar1[L_551_forvar1])
						end
						local L_547_ = L_545_.New(table.unpack(L_546_))
						L_547_.Type = L_544_forvar1.Type
						table.insert(L_518_, L_547_)
						local L_548_ = L_508_.Image(
L_544_forvar1.Icon or L_545_.Icon or Icons[L_544_forvar1.Type] or "user",
L_544_forvar1.Icon or L_545_.Icon or Icons[L_544_forvar1.Type] or "user",
0,
"Temp",
"KeySystem",
true
)
						L_548_.Size = UDim2.new(0, 24, 0, 24)
						local L_549_ = L_508_.NewRoundFrame(10, "Squircle", {
							Size = UDim2.new(1, 0, 0, 0),
							ThemeTag = {
								ImageColor3 = "Text"
							},
							ImageTransparency = 1,
							Parent = L_541_,
							AutomaticSize = "Y",
						}, {
							L_509_("UIListLayout", {
								FillDirection = "Horizontal",
								Padding = UDim.new(0, 10),
								VerticalAlignment = "Center",
							}),
							L_548_,
							L_509_("UIPadding", {
								PaddingTop = UDim.new(0, 10),
								PaddingLeft = UDim.new(0, 10),
								PaddingRight = UDim.new(0, 10),
								PaddingBottom = UDim.new(0, 10),
							}),
							L_509_("Frame", {
								BackgroundTransparency = 1,
								Size = UDim2.new(1, -34, 0, 0),
								AutomaticSize = "Y",
							}, {
								L_509_("UIListLayout", {
									FillDirection = "Vertical",
									Padding = UDim.new(0, 5),
									HorizontalAlignment = "Center",
								}),
								L_509_("TextLabel", {
									Text = L_544_forvar1.Title or L_545_.Name,
									BackgroundTransparency = 1,
									FontFace = Font.new(L_508_.Font, Enum.FontWeight.Medium),
									ThemeTag = {
										TextColor3 = "Text"
									},
									TextTransparency = 0.05,
									TextSize = 18,
									Size = UDim2.new(1, 0, 0, 0),
									AutomaticSize = "Y",
									TextWrapped = true,
									TextXAlignment = "Left",
								}),
								L_509_("TextLabel", {
									Text = L_544_forvar1.Desc or "",
									BackgroundTransparency = 1,
									FontFace = Font.new(L_508_.Font, Enum.FontWeight.Regular),
									ThemeTag = {
										TextColor3 = "Text"
									},
									TextTransparency = 0.2,
									TextSize = 16,
									Size = UDim2.new(1, 0, 0, 0),
									AutomaticSize = "Y",
									TextWrapped = true,
									Visible = L_544_forvar1.Desc and true or false,
									TextXAlignment = "Left",
								})
							})
						}, true)
						L_508_.AddSignal(L_549_.MouseEnter, function()
							L_510_(L_549_, 0.08, {
								ImageTransparency = .95
							}):Play()
						end)
						L_508_.AddSignal(L_549_.InputEnded, function()
							L_510_(L_549_, 0.08, {
								ImageTransparency = 1
							}):Play()
						end)
						L_508_.AddSignal(L_549_.MouseButton1Click, function()
							L_547_.Copy()
							L_513_arg0.WindUI:Notify{
								Title = "Key System",
								Content = "Key link copied to clipboard.",
								Image = "key",
							}
						end)
					end
				end
				L_508_.AddSignal(L_538_.MouseButton1Click, function()
					if not L_537_ then
						L_510_(L_542_, .3, {
							Size = UDim2.new(0, L_536_, 0, L_541_.AbsoluteSize.Y + 1)
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
						L_510_(L_540_, .3, {
							Rotation = 180
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					else
						L_510_(L_542_, .25, {
							Size = UDim2.new(0, L_536_, 0, 0)
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
						L_510_(L_540_, .25, {
							Rotation = 0
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					end
					L_537_ = not L_537_
				end)
			end
			local function L_532_func(L_552_arg0)
				L_517_:Close()()
				writefile((L_513_arg0.Folder or L_513_arg0.Title) .. "/" .. L_514_arg1 .. ".key", tostring(L_552_arg0))
				task.wait(.4)
				L_515_arg2(true)
			end
			local L_533_ = L_511_("Submit", "arrow-right", function()
				local L_553_ = tostring(L_519_ or "empty")
				local L_554_ =
L_513_arg0.Folder or L_513_arg0.Title
				if not L_513_arg0.KeySystem.API then
					local L_555_ = type(L_513_arg0.KeySystem.Key) == "table"
and table.find(L_513_arg0.KeySystem.Key, L_553_)
or L_513_arg0.KeySystem.Key == L_553_
					if L_555_ then
						if L_513_arg0.KeySystem.SaveKey then
							L_532_func(L_553_)
						else
							L_517_:Close()()
							task.wait(.4)
							L_515_arg2(true)
						end
					end
				else
					local L_556_, L_557_
					for L_558_forvar0, L_559_forvar1 in next, L_518_ do
						local L_560_, L_561_ = L_559_forvar1.Verify(L_553_)
						if L_560_ then
							L_556_, L_557_ = true, L_561_
							break
						end
						L_557_ = L_561_
					end
					if L_556_ then
						L_532_func(L_553_)
					else
						L_513_arg0.WindUI:Notify{
							Title = "Key System. Error",
							Content = L_557_,
							Icon = "triangle-alert",
						}
					end
				end
			end, "Primary", L_529_)
			L_533_.AnchorPoint = Vector2.new(1, 0.5)
			L_533_.Position = UDim2.new(1, 0, 0.5, 0)
			L_517_:Open()
		end
		return L_507_
	end
	function L_1_.m()
		local function L_562_func(L_565_arg0, L_566_arg1, L_567_arg2, L_568_arg3, L_569_arg4)
			return (L_565_arg0 - L_566_arg1) * (L_569_arg4 - L_568_arg3) / (L_567_arg2 - L_566_arg1) + L_568_arg3
		end
		local function L_563_func(L_570_arg0, L_571_arg1)
			local L_572_ = game:GetService"Workspace".CurrentCamera:ScreenPointToRay(L_570_arg0.X, L_570_arg0.Y)
			return L_572_.Origin + L_572_.Direction * L_571_arg1
		end
		local function L_564_func()
			local L_573_ = game:GetService"Workspace".CurrentCamera.ViewportSize.Y
			return L_562_func(L_573_, 0, 2560, 8, 56)
		end
		return {
			L_563_func,
			L_564_func
		}
	end
	function L_1_.n()
		local L_574_ = L_1_.load'a'
		local L_575_ = L_574_.New
		local L_576_, L_577_ = unpack(L_1_.load'm')
		local L_578_ = Instance.new("Folder", game:GetService"Workspace".CurrentCamera)
		local function L_579_func()
			local L_581_ = L_575_("Part", {
				Name = "Body",
				Color = Color3.new(0, 0, 0),
				Material = Enum.Material.Glass,
				Size = Vector3.new(1, 1, 0),
				Anchored = true,
				CanCollide = false,
				Locked = true,
				CastShadow = false,
				Transparency = 0.98,
			}, {
				L_575_("SpecialMesh", {
					MeshType = Enum.MeshType.Brick,
					Offset = Vector3.new(0, 0, -1),
				}),
			})
			return L_581_
		end
		local function L_580_func(L_582_arg0)
			local L_583_ = {}
			L_582_arg0 = L_582_arg0 or 0.001
			local L_584_ = {
				topLeft = Vector2.new(),
				topRight = Vector2.new(),
				bottomRight = Vector2.new(),
			}
			local L_585_ = L_579_func()
			L_585_.Parent = L_578_
			local function L_586_func(L_590_arg0, L_591_arg1)
				L_584_.topLeft = L_591_arg1
				L_584_.topRight = L_591_arg1 + Vector2.new(L_590_arg0.X, 0)
				L_584_.bottomRight = L_591_arg1 + L_590_arg0
			end
			local function L_587_func()
				local L_592_ = game:GetService"Workspace".CurrentCamera
				if L_592_ then
					L_592_ = L_592_.CFrame
				end
				local L_593_ = L_592_
				if not L_593_ then
					L_593_ = CFrame.new()
				end
				local L_594_ = L_593_
				local L_595_ = L_584_.topLeft
				local L_596_ = L_584_.topRight
				local L_597_ = L_584_.bottomRight
				local L_598_ = L_576_(L_595_, L_582_arg0)
				local L_599_ = L_576_(L_596_, L_582_arg0)
				local L_600_ = L_576_(L_597_, L_582_arg0)
				local L_601_ = (L_599_ - L_598_).Magnitude
				local L_602_ = (L_599_ - L_600_).Magnitude
				L_585_.CFrame =
CFrame.fromMatrix((L_598_ + L_600_) / 2, L_594_.XVector, L_594_.YVector, L_594_.ZVector)
				L_585_.Mesh.Scale = Vector3.new(L_601_, L_602_, 0)
			end
			local function L_588_func(L_603_arg0)
				local L_604_ = L_577_()
				local L_605_ = L_603_arg0.AbsoluteSize - Vector2.new(L_604_, L_604_)
				local L_606_ = L_603_arg0.AbsolutePosition + Vector2.new(L_604_ / 2, L_604_ / 2)
				L_586_func(L_605_, L_606_)
				task.spawn(L_587_func)
			end
			local function L_589_func()
				local L_607_ = game:GetService"Workspace".CurrentCamera
				if not L_607_ then
					return
				end
				table.insert(L_583_, L_607_:GetPropertyChangedSignal"CFrame":Connect(L_587_func))
				table.insert(L_583_, L_607_:GetPropertyChangedSignal"ViewportSize":Connect(L_587_func))
				table.insert(L_583_, L_607_:GetPropertyChangedSignal"FieldOfView":Connect(L_587_func))
				task.spawn(L_587_func)
			end
			L_585_.Destroying:Connect(function()
				for L_608_forvar0, L_609_forvar1 in L_583_ do
					pcall(function()
						L_609_forvar1:Disconnect()
					end)
				end
			end)
			L_589_func()
			return L_588_func, L_585_
		end
		return function(L_610_arg0)
			local L_611_ = {}
			local L_612_, L_613_ = L_580_func(L_610_arg0)
			local L_614_ = L_575_("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
			})
			L_574_.AddSignal(L_614_:GetPropertyChangedSignal"AbsolutePosition", function()
				L_612_(L_614_)
			end)
			L_574_.AddSignal(L_614_:GetPropertyChangedSignal"AbsoluteSize", function()
				L_612_(L_614_)
			end)
			L_611_.AddParent = function(L_615_arg0)
				L_574_.AddSignal(L_615_arg0:GetPropertyChangedSignal"Visible", function()
					L_611_.SetVisibility(L_615_arg0.Visible)
				end)
			end
			L_611_.SetVisibility = function(L_616_arg0)
				L_613_.Transparency = L_616_arg0 and 0.98 or 1
			end
			L_611_.Frame = L_614_
			L_611_.Model = L_613_
			return L_611_
		end
	end
	function L_1_.o()
		local L_617_ = L_1_.load'a'
		local L_618_ = L_1_.load'n'
		local L_619_ = L_617_.New
		return function(L_620_arg0)
			local L_621_ = {}
			L_621_.Frame = L_619_("Frame", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BorderSizePixel = 0,
			}, {
				L_619_("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),
				L_619_("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					Name = "Background",
					ThemeTag = {
						BackgroundColor3 = "AcrylicMain",
					},
				}, {
					L_619_("UICorner", {
						CornerRadius = UDim.new(0, 8),
					}),
				}),
				L_619_("Frame", {
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
				}, {










}),
				L_619_("ImageLabel", {
					Image = "rbxassetid://9968344105",
					ImageTransparency = 0.98,
					ScaleType = Enum.ScaleType.Tile,
					TileSize = UDim2.new(0, 128, 0, 128),
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
				}, {
					L_619_("UICorner", {
						CornerRadius = UDim.new(0, 8),
					}),
				}),
				L_619_("ImageLabel", {
					Image = "rbxassetid://9968344227",
					ImageTransparency = 0.9,
					ScaleType = Enum.ScaleType.Tile,
					TileSize = UDim2.new(0, 128, 0, 128),
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					ThemeTag = {
						ImageTransparency = "AcrylicNoise",
					},
				}, {
					L_619_("UICorner", {
						CornerRadius = UDim.new(0, 8),
					}),
				}),
				L_619_("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					ZIndex = 2,
				}, {










}),
			})
			local L_622_
			task.wait()
			if L_620_arg0.UseAcrylic then
				L_622_ = L_618_()
				L_622_.Frame.Parent = L_621_.Frame
				L_621_.Model = L_622_.Model
				L_621_.AddParent = L_622_.AddParent
				L_621_.SetVisibility = L_622_.SetVisibility
			end
			return L_621_, L_622_
		end
	end
	function L_1_.p()
		local L_623_ = {
			AcrylicBlur = L_1_.load'n',
			AcrylicPaint = L_1_.load'o',
		}
		function L_623_.init()
			local L_624_ = Instance.new"DepthOfFieldEffect"
			L_624_.FarIntensity = 0
			L_624_.InFocusRadius = 0.1
			L_624_.NearIntensity = 1
			local L_625_ = {}
			function L_623_.Enable()
				for L_627_forvar0, L_628_forvar1 in pairs(L_625_) do
					L_628_forvar1.Enabled = false
				end
				L_624_.Parent = game:GetService"Lighting"
			end
			function L_623_.Disable()
				for L_629_forvar0, L_630_forvar1 in pairs(L_625_) do
					L_630_forvar1.Enabled = L_630_forvar1.enabled
				end
				L_624_.Parent = nil
			end
			local function L_626_func()
				local function L_631_func(L_632_arg0)
					if L_632_arg0:IsA"DepthOfFieldEffect" then
						L_625_[L_632_arg0] = {
							enabled = L_632_arg0.Enabled
						}
					end
				end
				for L_633_forvar0, L_634_forvar1 in pairs(game:GetService"Lighting":GetChildren()) do
					L_631_func(L_634_forvar1)
				end
				if game:GetService"Workspace".CurrentCamera then
					for L_635_forvar0, L_636_forvar1 in pairs(game:GetService"Workspace".CurrentCamera:GetChildren()) do
						L_631_func(L_636_forvar1)
					end
				end
			end
			L_626_func()
			L_623_.Enable()
		end
		return L_623_
	end
	function L_1_.q()
		local L_637_ = {}
		local L_638_ = L_1_.load'a'
		local L_639_ = L_638_.New
		local L_640_ =
L_638_.Tween
		function L_637_.new(L_641_arg0)
			local L_642_ = {
				Title = L_641_arg0.Title or "Dialog",
				Content = L_641_arg0.Content,
				Icon = L_641_arg0.Icon,
				IconThemed = L_641_arg0.IconThemed,
				Thumbnail = L_641_arg0.Thumbnail,
				Buttons = L_641_arg0.Buttons,
				IconSize = 22,
			}
			local L_643_ = L_1_.load'k'.Init(nil, L_641_arg0.WindUI.ScreenGui.Popups)
			local L_644_ = L_643_.Create(true)
			local L_645_ = 200
			local L_646_ = 430
			if L_642_.Thumbnail and L_642_.Thumbnail.Image then
				L_646_ = 430 + (L_645_ / 2)
			end
			L_644_.UIElements.Main.AutomaticSize = "Y"
			L_644_.UIElements.Main.Size = UDim2.new(0, L_646_, 0, 0)
			local L_647_
			if L_642_.Icon then
				L_647_ = L_638_.Image(
L_642_.Icon,
L_642_.Title .. ":" .. L_642_.Icon,
0,
L_641_arg0.WindUI.Window,
"Popup",
true,
L_641_arg0.IconThemed
)
				L_647_.Size = UDim2.new(0, L_642_.IconSize, 0, L_642_.IconSize)
				L_647_.LayoutOrder = -1
			end
			local L_648_ = L_639_("TextLabel", {
				AutomaticSize = "Y",
				BackgroundTransparency = 1,
				Text = L_642_.Title,
				TextXAlignment = "Left",
				FontFace = Font.new(L_638_.Font, Enum.FontWeight.SemiBold),
				ThemeTag = {
					TextColor3 = "Text",
				},
				TextSize = 20,
				TextWrapped = true,
				Size = UDim2.new(1, L_647_ and -L_642_.IconSize - 14 or 0, 0, 0)
			})
			local L_649_ = L_639_("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = "XY",
			}, {
				L_639_("UIListLayout", {
					Padding = UDim.new(0, 14),
					FillDirection = "Horizontal",
					VerticalAlignment = "Center"
				}),
				L_647_,
				L_648_
			})
			local L_650_ = L_639_("Frame", {
				AutomaticSize = "Y",
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
			}, {
				L_649_,
			})
			local L_651_
			if L_642_.Content and L_642_.Content ~= "" then
				L_651_ = L_639_("TextLabel", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
					FontFace = Font.new(L_638_.Font, Enum.FontWeight.Medium),
					TextXAlignment = "Left",
					Text = L_642_.Content,
					TextSize = 18,
					TextTransparency = .2,
					ThemeTag = {
						TextColor3 = "Text",
					},
					BackgroundTransparency = 1,
					RichText = true,
					TextWrapped = true,
				})
			end
			local L_652_ = L_639_("Frame", {
				Size = UDim2.new(1, 0, 0, 42),
				BackgroundTransparency = 1,
			}, {
				L_639_("UIListLayout", {
					Padding = UDim.new(0, 9),
					FillDirection = "Horizontal",
					HorizontalAlignment = "Right"
				})
			})
			local L_653_
			if L_642_.Thumbnail and L_642_.Thumbnail.Image then
				local L_655_
				if L_642_.Thumbnail.Title then
					L_655_ = L_639_("TextLabel", {
						Text = L_642_.Thumbnail.Title,
						ThemeTag = {
							TextColor3 = "Text",
						},
						TextSize = 18,
						FontFace = Font.new(L_638_.Font, Enum.FontWeight.Medium),
						BackgroundTransparency = 1,
						AutomaticSize = "XY",
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0),
					})
				end
				L_653_ = L_639_("ImageLabel", {
					Image = L_642_.Thumbnail.Image,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, L_645_, 1, 0),
					Parent = L_644_.UIElements.Main,
					ScaleType = "Crop"
				}, {
					L_655_,
					L_639_("UICorner", {
						CornerRadius = UDim.new(0, 0),
					})
				})
			end
			L_639_("Frame", {
				Size = UDim2.new(1, L_653_ and -L_645_ or 0, 1, 0),
				Position = UDim2.new(0, L_653_ and L_645_ or 0, 0, 0),
				BackgroundTransparency = 1,
				Parent = L_644_.UIElements.Main
			}, {
				L_639_("Frame", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
				}, {
					L_639_("UIListLayout", {
						Padding = UDim.new(0, 18),
						FillDirection = "Vertical",
					}),
					L_650_,
					L_651_,
					L_652_,
					L_639_("UIPadding", {
						PaddingTop = UDim.new(0, 16),
						PaddingLeft = UDim.new(0, 16),
						PaddingRight = UDim.new(0, 16),
						PaddingBottom = UDim.new(0, 16),
					})
				}),
			})
			local L_654_ = L_1_.load'i'.New
			for L_656_forvar0, L_657_forvar1 in next, L_642_.Buttons do
				L_654_(L_657_forvar1.Title, L_657_forvar1.Icon, L_657_forvar1.Callback, L_657_forvar1.Variant, L_652_, L_644_)
			end
			L_644_:Open()
			return L_642_
		end
		return L_637_
	end
	function L_1_.r()
		return function(L_658_arg0)
			return {
				Dark = {
					Name = "Dark",
					Accent = Color3.fromHex"#18181b",
					Dialog = Color3.fromHex"#161616",
					Outline = Color3.fromHex"#FFFFFF",
					Text = Color3.fromHex"#FFFFFF",
					Placeholder = Color3.fromHex"#7a7a7a",
					Background = Color3.fromHex"#101010",
					Button = Color3.fromHex"#52525b",
					Icon = Color3.fromHex"#a1a1aa"
				},
				Light = {
					Name = "Light",
					Accent = Color3.fromHex"#FFFFFF",
					Dialog = Color3.fromHex"#f4f4f5",
					Outline = Color3.fromHex"#09090b",
					Text = Color3.fromHex"#000000",
					Placeholder = Color3.fromHex"#555555",
					Background = Color3.fromHex"#e4e4e7",
					Button = Color3.fromHex"#18181b",
					Icon = Color3.fromHex"#52525b",
				},
				Rose = {
					Name = "Rose",
					Accent = Color3.fromHex"#be185d",
					Dialog = Color3.fromHex"#4c0519",
					Outline = Color3.fromHex"#fecdd3",
					Text = Color3.fromHex"#fdf2f8",
					Placeholder = Color3.fromHex"#d67aa6",
					Background = Color3.fromHex"#1f0308",
					Button = Color3.fromHex"#e11d48",
					Icon = Color3.fromHex"#fb7185",
				},
				Plant = {
					Name = "Plant",
					Accent = Color3.fromHex"#166534",
					Dialog = Color3.fromHex"#052e16",
					Outline = Color3.fromHex"#bbf7d0",
					Text = Color3.fromHex"#f0fdf4",
					Placeholder = Color3.fromHex"#4fbf7a",
					Background = Color3.fromHex"#0a1b0f",
					Button = Color3.fromHex"#16a34a",
					Icon = Color3.fromHex"#4ade80",
				},
				Red = {
					Name = "Red",
					Accent = Color3.fromHex"#991b1b",
					Dialog = Color3.fromHex"#450a0a",
					Outline = Color3.fromHex"#fecaca",
					Text = Color3.fromHex"#fef2f2",
					Placeholder = Color3.fromHex"#d95353",
					Background = Color3.fromHex"#1c0606",
					Button = Color3.fromHex"#dc2626",
					Icon = Color3.fromHex"#ef4444",
				},
				Indigo = {
					Name = "Indigo",
					Accent = Color3.fromHex"#3730a3",
					Dialog = Color3.fromHex"#1e1b4b",
					Outline = Color3.fromHex"#c7d2fe",
					Text = Color3.fromHex"#f1f5f9",
					Placeholder = Color3.fromHex"#7078d9",
					Background = Color3.fromHex"#0f0a2e",
					Button = Color3.fromHex"#4f46e5",
					Icon = Color3.fromHex"#6366f1",
				},
				Sky = {
					Name = "Sky",
					Accent = Color3.fromHex"#0369a1",
					Dialog = Color3.fromHex"#0c4a6e",
					Outline = Color3.fromHex"#bae6fd",
					Text = Color3.fromHex"#f0f9ff",
					Placeholder = Color3.fromHex"#4fb6d9",
					Background = Color3.fromHex"#041f2e",
					Button = Color3.fromHex"#0284c7",
					Icon = Color3.fromHex"#0ea5e9",
				},
				Violet = {
					Name = "Violet",
					Accent = Color3.fromHex"#6d28d9",
					Dialog = Color3.fromHex"#3c1361",
					Outline = Color3.fromHex"#ddd6fe",
					Text = Color3.fromHex"#faf5ff",
					Placeholder = Color3.fromHex"#8f7ee0",
					Background = Color3.fromHex"#1e0a3e",
					Button = Color3.fromHex"#7c3aed",
					Icon = Color3.fromHex"#8b5cf6",
				},
				Amber = {
					Name = "Amber",
					Accent = Color3.fromHex"#b45309",
					Dialog = Color3.fromHex"#451a03",
					Outline = Color3.fromHex"#fde68a",
					Text = Color3.fromHex"#fffbeb",
					Placeholder = Color3.fromHex"#d1a326",
					Background = Color3.fromHex"#1c1003",
					Button = Color3.fromHex"#d97706",
					Icon = Color3.fromHex"#f59e0b",
				},
				Emerald = {
					Name = "Emerald",
					Accent = Color3.fromHex"#047857",
					Dialog = Color3.fromHex"#022c22",
					Outline = Color3.fromHex"#a7f3d0",
					Text = Color3.fromHex"#ecfdf5",
					Placeholder = Color3.fromHex"#3fbf8f",
					Background = Color3.fromHex"#011411",
					Button = Color3.fromHex"#059669",
					Icon = Color3.fromHex"#10b981",
				},
				Midnight = {
					Name = "Midnight",
					Accent = Color3.fromHex"#1e3a8a",
					Dialog = Color3.fromHex"#0c1e42",
					Outline = Color3.fromHex"#bfdbfe",
					Text = Color3.fromHex"#dbeafe",
					Placeholder = Color3.fromHex"#2f74d1",
					Background = Color3.fromHex"#0a0f1e",
					Button = Color3.fromHex"#2563eb",
					Icon = Color3.fromHex"#3b82f6",
				},
				Crimson = {
					Name = "Crimson",
					Accent = Color3.fromHex"#b91c1c",
					Dialog = Color3.fromHex"#450a0a",
					Outline = Color3.fromHex"#fca5a5",
					Text = Color3.fromHex"#fef2f2",
					Placeholder = Color3.fromHex"#6f757b",
					Background = Color3.fromHex"#0c0404",
					Button = Color3.fromHex"#991b1b",
					Icon = Color3.fromHex"#dc2626",
				},
				MonokaiPro = {
					Name = "Monokai Pro",
					Accent = Color3.fromHex"#fc9867",
					Dialog = Color3.fromHex"#1e1e1e",
					Outline = Color3.fromHex"#78dce8",
					Text = Color3.fromHex"#fcfcfa",
					Placeholder = Color3.fromHex"#6f6f6f",
					Background = Color3.fromHex"#191622",
					Button = Color3.fromHex"#ab9df2",
					Icon = Color3.fromHex"#a9dc76",
				},
				CottonCandy = {
					Name = "Cotton Candy",
					Accent = Color3.fromHex"#ec4899",
					Dialog = Color3.fromHex"#2d1b3d",
					Outline = Color3.fromHex"#f9a8d4",
					Text = Color3.fromHex"#fdf2f8",
					Placeholder = Color3.fromHex"#8a5fd3",
					Background = Color3.fromHex"#1a0b2e",
					Button = Color3.fromHex"#d946ef",
					Icon = Color3.fromHex"#06b6d4",
				},
				Rainbow = {
					Name = "Rainbow",
					Accent = L_658_arg0:Gradient({
						["0"] = {
							Color = Color3.fromHex"#00ff41",
							Transparency = 0
						},
						["33"] = {
							Color = Color3.fromHex"#00ffff",
							Transparency = 0
						},
						["66"] = {
							Color = Color3.fromHex"#0080ff",
							Transparency = 0
						},
						["100"] = {
							Color = Color3.fromHex"#8000ff",
							Transparency = 0
						},
					}, {
						Rotation = 45,
					}),
					Dialog = L_658_arg0:Gradient({
						["0"] = {
							Color = Color3.fromHex"#ff0080",
							Transparency = 0
						},
						["25"] = {
							Color = Color3.fromHex"#8000ff",
							Transparency = 0
						},
						["50"] = {
							Color = Color3.fromHex"#0080ff",
							Transparency = 0
						},
						["75"] = {
							Color = Color3.fromHex"#00ff80",
							Transparency = 0
						},
						["100"] = {
							Color = Color3.fromHex"#ff8000",
							Transparency = 0
						},
					}, {
						Rotation = 135,
					}),
					Outline = Color3.fromHex"#ffffff",
					Text = Color3.fromHex"#ffffff",
					Placeholder = Color3.fromHex"#00ff80",
					Background = L_658_arg0:Gradient({
						["0"] = {
							Color = Color3.fromHex"#ff0040",
							Transparency = 0
						},
						["20"] = {
							Color = Color3.fromHex"#ff4000",
							Transparency = 0
						},
						["40"] = {
							Color = Color3.fromHex"#ffff00",
							Transparency = 0
						},
						["60"] = {
							Color = Color3.fromHex"#00ff40",
							Transparency = 0
						},
						["80"] = {
							Color = Color3.fromHex"#0040ff",
							Transparency = 0
						},
						["100"] = {
							Color = Color3.fromHex"#4000ff",
							Transparency = 0
						},
					}, {
						Rotation = 90,
					}),
					Button = L_658_arg0:Gradient({
						["0"] = {
							Color = Color3.fromHex"#ff0080",
							Transparency = 0
						},
						["25"] = {
							Color = Color3.fromHex"#ff8000",
							Transparency = 0
						},
						["50"] = {
							Color = Color3.fromHex"#ffff00",
							Transparency = 0
						},
						["75"] = {
							Color = Color3.fromHex"#80ff00",
							Transparency = 0
						},
						["100"] = {
							Color = Color3.fromHex"#00ffff",
							Transparency = 0
						},
					}, {
						Rotation = 60,
					}),
					Icon = Color3.fromHex"#ffffff",
				}
			}
		end
	end
	function L_1_.s()
		local L_659_ = {}
		local L_660_ = L_1_.load'a'
		local L_661_ = L_660_.New
		local L_662_ =
L_660_.Tween
		function L_659_.New(L_663_arg0, L_664_arg1, L_665_arg2, L_666_arg3, L_667_arg4)
			local L_668_ = L_667_arg4 or 10
			local L_669_
			if L_664_arg1 and L_664_arg1 ~= "" then
				L_669_ = L_661_("ImageLabel", {
					Image = L_660_.Icon(L_664_arg1)[1],
					ImageRectSize = L_660_.Icon(L_664_arg1)[2].ImageRectSize,
					ImageRectOffset = L_660_.Icon(L_664_arg1)[2].ImageRectPosition,
					Size = UDim2.new(0, 21, 0, 21),
					BackgroundTransparency = 1,
					ThemeTag = {
						ImageColor3 = "Icon",
					}
				})
			end
			local L_670_ = L_661_("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 17,
				FontFace = Font.new(L_660_.Font, Enum.FontWeight.Regular),
				Size = UDim2.new(1, L_669_ and -29 or 0, 1, 0),
				TextXAlignment = "Left",
				ThemeTag = {
					TextColor3 = L_666_arg3 and "Placeholder" or "Text",
				},
				Text = L_663_arg0,
			})
			local L_671_ = L_661_("TextButton", {
				Size = UDim2.new(1, 0, 0, 42),
				Parent = L_665_arg2,
				BackgroundTransparency = 1,
				Text = "",
			}, {
				L_661_("Frame", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
				}, {
					L_660_.NewRoundFrame(L_668_, "Squircle", {
						ThemeTag = {
							ImageColor3 = "Accent",
						},
						Size = UDim2.new(1, 0, 1, 0),
						ImageTransparency = .97,
					}),
					L_660_.NewRoundFrame(L_668_, "SquircleOutline", {
						ThemeTag = {
							ImageColor3 = "Outline",
						},
						Size = UDim2.new(1, 0, 1, 0),
						ImageTransparency = .95,
					}, {
						L_661_("UIGradient", {
							Rotation = 70,
							Color = ColorSequence.new{
								ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
								ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
								ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
							},
							Transparency = NumberSequence.new{
								NumberSequenceKeypoint.new(0.0, 0.1),
								NumberSequenceKeypoint.new(0.5, 1),
								NumberSequenceKeypoint.new(1.0, 0.1),
							}
						})
					}),
					L_660_.NewRoundFrame(L_668_, "Squircle", {
						Size = UDim2.new(1, 0, 1, 0),
						Name = "Frame",
						ImageColor3 = Color3.new(1, 1, 1),
						ImageTransparency = .95
					}, {
						L_661_("UIPadding", {
							PaddingLeft = UDim.new(0, 12),
							PaddingRight = UDim.new(0, 12),
						}),
						L_661_("UIListLayout", {
							FillDirection = "Horizontal",
							Padding = UDim.new(0, 8),
							VerticalAlignment = "Center",
							HorizontalAlignment = "Left",
						}),
						L_669_,
						L_670_,
					})
				})
			})
			return L_671_
		end
		return L_659_
	end
	function L_1_.t()
		local L_672_ = {}
		local L_673_ = game:GetService"UserInputService"
		local L_674_ = L_1_.load'a'
		local L_675_ = L_674_.New
		local L_676_ =
L_674_.Tween
		function L_672_.New(L_677_arg0, L_678_arg1, L_679_arg2, L_680_arg3)
			local L_681_ = L_675_("Frame", {
				Size = UDim2.new(0, L_680_arg3, 1, 0),
				BackgroundTransparency = 1,
				Position = UDim2.new(1, 0, 0, 0),
				AnchorPoint = Vector2.new(1, 0),
				Parent = L_678_arg1,
				ZIndex = 999,
				Active = true,
			})
			local L_682_ = L_674_.NewRoundFrame(L_680_arg3 / 2, "Squircle", {
				Size = UDim2.new(1, 0, 0, 0),
				ImageTransparency = 0.85,
				ThemeTag = {
					ImageColor3 = "Text"
				},
				Parent = L_681_,
			})
			local L_683_ = L_675_("Frame", {
				Size = UDim2.new(1, 12, 1, 12),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				Active = true,
				ZIndex = 999,
				Parent = L_682_,
			})
			local L_684_ = false
			local L_685_ = 0
			local function L_686_func()
				local L_689_ = L_677_arg0
				local L_690_ = L_689_.AbsoluteCanvasSize.Y
				local L_691_ = L_689_.AbsoluteWindowSize.Y
				if L_690_ <= L_691_ then
					L_682_.Visible = false
					return
				end
				local L_692_ = math.clamp(L_691_ / L_690_, 0.1, 1)
				L_682_.Size = UDim2.new(1, 0, L_692_, 0)
				L_682_.Visible = true
			end
			local function L_687_func()
				local L_693_ = L_682_.Position.Y.Scale
				local L_694_ = L_677_arg0.AbsoluteCanvasSize.Y
				local L_695_ = L_677_arg0.AbsoluteWindowSize.Y
				local L_696_ = math.max(L_694_ - L_695_, 0)
				if L_696_ <= 0 then
					return
				end
				local L_697_ = math.max(1 - L_682_.Size.Y.Scale, 0)
				if L_697_ <= 0 then
					return
				end
				local L_698_ = L_693_ / L_697_
				L_677_arg0.CanvasPosition = Vector2.new(
L_677_arg0.CanvasPosition.X,
L_698_ * L_696_
)
			end
			local function L_688_func()
				if L_684_ then
					return
				end
				local L_699_ = L_677_arg0.CanvasPosition.Y
				local L_700_ = L_677_arg0.AbsoluteCanvasSize.Y
				local L_701_ = L_677_arg0.AbsoluteWindowSize.Y
				local L_702_ = math.max(L_700_ - L_701_, 0)
				if L_702_ <= 0 then
					L_682_.Position = UDim2.new(0, 0, 0, 0)
					return
				end
				local L_703_ = L_699_ / L_702_
				local L_704_ = math.max(1 - L_682_.Size.Y.Scale, 0)
				local L_705_ = math.clamp(L_703_ * L_704_, 0, L_704_)
				L_682_.Position = UDim2.new(0, 0, L_705_, 0)
			end
			L_674_.AddSignal(L_681_.InputBegan, function(L_706_arg0)
				if (L_706_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_706_arg0.UserInputType == Enum.UserInputType.Touch) then
					local L_707_ = L_682_.AbsolutePosition.Y
					local L_708_ = L_707_ + L_682_.AbsoluteSize.Y
					if not(L_706_arg0.Position.Y >= L_707_ and L_706_arg0.Position.Y <= L_708_) then
						local L_709_ = L_681_.AbsolutePosition.Y
						local L_710_ = L_681_.AbsoluteSize.Y
						local L_711_ = L_682_.AbsoluteSize.Y
						local L_712_ = L_706_arg0.Position.Y - L_709_ - L_711_ / 2
						local L_713_ = L_710_ - L_711_
						local L_714_ = math.clamp(L_712_ / L_713_, 0, 1 - L_682_.Size.Y.Scale)
						L_682_.Position = UDim2.new(0, 0, L_714_, 0)
						L_687_func()
					end
				end
			end)
			L_674_.AddSignal(L_683_.InputBegan, function(L_715_arg0)
				if L_715_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_715_arg0.UserInputType == Enum.UserInputType.Touch then
					L_684_ = true
					L_685_ = L_715_arg0.Position.Y - L_682_.AbsolutePosition.Y
					local L_716_
					local L_717_
					L_716_ = L_673_.InputChanged:Connect(function(L_718_arg0)
						if L_718_arg0.UserInputType == Enum.UserInputType.MouseMovement or L_718_arg0.UserInputType == Enum.UserInputType.Touch then
							local L_719_ = L_681_.AbsolutePosition.Y
							local L_720_ = L_681_.AbsoluteSize.Y
							local L_721_ = L_682_.AbsoluteSize.Y
							local L_722_ = L_718_arg0.Position.Y - L_719_ - L_685_
							local L_723_ = L_720_ - L_721_
							local L_724_ = math.clamp(L_722_ / L_723_, 0, 1 - L_682_.Size.Y.Scale)
							L_682_.Position = UDim2.new(0, 0, L_724_, 0)
							L_687_func()
						end
					end)
					L_717_ = L_673_.InputEnded:Connect(function(L_725_arg0)
						if L_725_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_725_arg0.UserInputType == Enum.UserInputType.Touch then
							L_684_ = false
							if L_716_ then
								L_716_:Disconnect()
							end
							if L_717_ then
								L_717_:Disconnect()
							end
						end
					end)
				end
			end)
			L_674_.AddSignal(L_677_arg0:GetPropertyChangedSignal"AbsoluteWindowSize", function()
				L_686_func()
				L_688_func()
			end)
			L_674_.AddSignal(L_677_arg0:GetPropertyChangedSignal"AbsoluteCanvasSize", function()
				L_686_func()
				L_688_func()
			end)
			L_674_.AddSignal(L_677_arg0:GetPropertyChangedSignal"CanvasPosition", function()
				if not L_684_ then
					L_688_func()
				end
			end)
			L_686_func()
			L_688_func()
			return L_681_
		end
		return L_672_
	end
	function L_1_.u()
		local L_726_ = {}
		local L_727_ = L_1_.load'a'
		local L_728_ = L_727_.New
		local L_729_ = L_727_.Tween
		local function L_730_func(L_734_arg0)
			local L_735_, L_736_, L_737_ = L_734_arg0.R, L_734_arg0.G, L_734_arg0.B
			local L_738_ = math.max(L_735_, L_736_, L_737_)
			local L_739_ = math.min(L_735_, L_736_, L_737_)
			local L_740_ = L_738_ - L_739_
			local L_741_ = 0
			if L_740_ ~= 0 then
				if L_738_ == L_735_ then
					L_741_ = (L_736_ - L_737_) / L_740_ % 6
				elseif L_738_ == L_736_ then
					L_741_ = (L_737_ - L_735_) / L_740_ + 2
				else
					L_741_ = (L_735_ - L_736_) / L_740_ + 4
				end
				L_741_ = L_741_ * 60
			else
				L_741_ = 0
			end
			local L_742_ = (L_738_ == 0) and 0 or (L_740_ / L_738_)
			local L_743_ = L_738_
			return {
				h = math.floor(L_741_ + 0.5),
				s = L_742_,
				b = L_743_
			}
		end
		local function L_731_func(L_744_arg0)
			local L_745_ = L_744_arg0.R
			local L_746_ = L_744_arg0.G
			local L_747_ = L_744_arg0.B
			return 0.299 * L_745_ + 0.587 * L_746_ + 0.114 * L_747_
		end
		local function L_732_func(L_748_arg0)
			local L_749_ = L_730_func(L_748_arg0)
			local
L_750_, L_751_, L_752_ = L_749_.h, L_749_.s, L_749_.b
			if L_731_func(L_748_arg0) > 0.5 then
				return Color3.fromHSV(L_750_ / 360, 0, 0.05)
			else
				return Color3.fromHSV(L_750_ / 360, 0, 0.98)
			end
		end
		local function L_733_func(L_753_arg0)
			local L_754_, L_755_, L_756_ = 0, 0, 0
			local L_757_ = L_753_arg0.Color.Keypoints
			for L_759_forvar0, L_760_forvar1 in ipairs(L_757_) do
				L_754_ = L_754_ + L_760_forvar1.Value.R
				L_755_ = L_755_ + L_760_forvar1.Value.G
				L_756_ = L_756_ + L_760_forvar1.Value.B
			end
			local L_758_ = #L_757_
			return Color3.new(L_754_ / L_758_, L_755_ / L_758_, L_756_ / L_758_)
		end
		function L_726_.New(L_761_arg0, L_762_arg1, L_763_arg2)
			local L_764_ = {
				Title = L_762_arg1.Title or "Tag",
				Color = L_762_arg1.Color or Color3.fromHex"#315dff",
				Radius = L_762_arg1.Radius or 999,
				TagFrame = nil,
				Height = 26,
				Padding = 10,
				TextSize = 14,
			}
			local L_765_ = L_728_("TextLabel", {
				BackgroundTransparency = 1,
				AutomaticSize = "XY",
				TextSize = L_764_.TextSize,
				FontFace = Font.new(L_727_.Font, Enum.FontWeight.SemiBold),
				Text = L_764_.Title,
				TextColor3 = typeof(L_764_.Color) == "Color3" and L_732_func(L_764_.Color) or nil,
			})
			local L_766_
			if typeof(L_764_.Color) == "table" then
				L_766_ = L_728_"UIGradient"
				for L_768_forvar0, L_769_forvar1 in next, L_764_.Color do
					L_766_[L_768_forvar0] = L_769_forvar1
				end
				L_765_.TextColor3 = L_732_func(L_733_func(L_766_))
			end
			local L_767_ = L_727_.NewRoundFrame(L_764_.Radius, "Squircle", {
				AutomaticSize = "X",
				Size = UDim2.new(0, 0, 0, L_764_.Height),
				Parent = L_763_arg2,
				ImageColor3 = typeof(L_764_.Color) == "Color3" and L_764_.Color or Color3.new(1, 1, 1),
			}, {
				L_766_,
				L_728_("UIPadding", {
					PaddingLeft = UDim.new(0, L_764_.Padding),
					PaddingRight = UDim.new(0, L_764_.Padding),
				}),
				L_765_,
				L_728_("UIListLayout", {
					FillDirection = "Horizontal",
					VerticalAlignment = "Center",
				})
			})
			function L_764_.SetTitle(L_770_arg0, L_771_arg1)
				L_764_.Title = L_771_arg1
				L_765_.Text = L_771_arg1
			end
			function L_764_.SetColor(L_772_arg0, L_773_arg1)
				L_764_.Color = L_773_arg1
				if typeof(L_773_arg1) == "table" then
					local L_774_ = L_733_func(L_773_arg1)
					L_729_(L_765_, .06, {
						TextColor3 = L_732_func(L_774_)
					}):Play()
					local L_775_ = L_767_:FindFirstChildOfClass"UIGradient" or L_728_("UIGradient", {
						Parent = L_767_
					})
					for L_776_forvar0, L_777_forvar1 in next, L_773_arg1 do
						L_775_[L_776_forvar0] = L_777_forvar1
					end
					L_729_(L_767_, .06, {
						ImageColor3 = Color3.new(1, 1, 1)
					}):Play()
				else
					if L_766_ then
						L_766_:Destroy()
					end
					L_729_(L_765_, .06, {
						TextColor3 = L_732_func(L_773_arg1)
					}):Play()
					L_729_(L_767_, .06, {
						ImageColor3 = L_773_arg1
					}):Play()
				end
			end
			return L_764_
		end
		return L_726_
	end
	function L_1_.v()
		local L_778_ = game:GetService"HttpService"
		local L_779_
		local L_780_
		L_780_ = {
			Folder = nil,
			Path = nil,
			Configs = {},
			Parser = {
				Colorpicker = {
					Save = function(L_781_arg0)
						return {
							__type = L_781_arg0.__type,
							value = L_781_arg0.Default:ToHex(),
							transparency = L_781_arg0.Transparency or nil,
						}
					end,
					Load = function(L_782_arg0, L_783_arg1)
						if L_782_arg0 and L_782_arg0.Update then
							L_782_arg0:Update(Color3.fromHex(L_783_arg1.value), L_783_arg1.transparency or nil)
						end
					end
				},
				Dropdown = {
					Save = function(L_784_arg0)
						return {
							__type = L_784_arg0.__type,
							value = L_784_arg0.Value,
						}
					end,
					Load = function(L_785_arg0, L_786_arg1)
						if L_785_arg0 and L_785_arg0.Select then
							L_785_arg0:Select(L_786_arg1.value)
						end
					end
				},
				Input = {
					Save = function(L_787_arg0)
						return {
							__type = L_787_arg0.__type,
							value = L_787_arg0.Value,
						}
					end,
					Load = function(L_788_arg0, L_789_arg1)
						if L_788_arg0 and L_788_arg0.Set then
							L_788_arg0:Set(L_789_arg1.value)
						end
					end
				},
				Keybind = {
					Save = function(L_790_arg0)
						return {
							__type = L_790_arg0.__type,
							value = L_790_arg0.Value,
						}
					end,
					Load = function(L_791_arg0, L_792_arg1)
						if L_791_arg0 and L_791_arg0.Set then
							L_791_arg0:Set(L_792_arg1.value)
						end
					end
				},
				Slider = {
					Save = function(L_793_arg0)
						return {
							__type = L_793_arg0.__type,
							value = L_793_arg0.Value.Default,
						}
					end,
					Load = function(L_794_arg0, L_795_arg1)
						if L_794_arg0 and L_794_arg0.Set then
							L_794_arg0:Set(tonumber(L_795_arg1.value))
						end
					end
				},
				Toggle = {
					Save = function(L_796_arg0)
						return {
							__type = L_796_arg0.__type,
							value = L_796_arg0.Value,
						}
					end,
					Load = function(L_797_arg0, L_798_arg1)
						if L_797_arg0 and L_797_arg0.Set then
							L_797_arg0:Set(L_798_arg1.value)
						end
					end
				},
			}
		}
		function L_780_.Init(L_799_arg0, L_800_arg1)
			if not L_800_arg1.Folder then
				warn"[ WindUI.ConfigManager ] Window.Folder is not specified."
				return false
			end
			L_779_ = L_800_arg1
			L_780_.Folder = L_779_.Folder
			L_780_.Path = "WindUI/" .. tostring(L_780_.Folder) .. "/config/"
			if not isfolder("WindUI/" .. L_780_.Folder) then
				makefolder("WindUI/" .. L_780_.Folder)
				if not isfolder("WindUI/" .. L_780_.Folder .. "/config/") then
					makefolder("WindUI/" .. L_780_.Folder .. "/config/")
				end
			end
			local L_801_ = L_780_:AllConfigs()
			for L_802_forvar0, L_803_forvar1 in next, L_801_ do
				if isfile and readfile and isfile(L_803_forvar1 .. ".json") then
					L_780_.Configs[L_803_forvar1] = readfile(L_803_forvar1 .. ".json")
				end
			end
			return L_780_
		end
		function L_780_.CreateConfig(L_804_arg0, L_805_arg1)
			local L_806_ = {
				Path = L_780_.Path .. L_805_arg1 .. ".json",
				Elements = {},
				CustomData = {},
				Version = 1.1
			}
			if not L_805_arg1 then
				return false, "No config file is selected"
			end
			function L_806_.SetAsCurrent(L_807_arg0)
				L_779_:SetCurrentConfig(L_806_)
			end
			function L_806_.Register(L_808_arg0, L_809_arg1, L_810_arg2)
				L_806_.Elements[L_809_arg1] = L_810_arg2
			end
			function L_806_.Set(L_811_arg0, L_812_arg1, L_813_arg2)
				L_806_.CustomData[L_812_arg1] = L_813_arg2
			end
			function L_806_.Get(L_814_arg0, L_815_arg1)
				return L_806_.CustomData[L_815_arg1]
			end
			function L_806_.Save(L_816_arg0)
				if L_779_.PendingFlags then
					for L_819_forvar0, L_820_forvar1 in next, L_779_.PendingFlags do
						L_806_:Register(L_819_forvar0, L_820_forvar1)
					end
				end
				local L_817_ = {
					__version = L_806_.Version,
					__elements = {},
					__custom = L_806_.CustomData
				}
				for L_821_forvar0, L_822_forvar1 in next, L_806_.Elements do
					if L_780_.Parser[L_822_forvar1.__type] then
						L_817_.__elements[tostring(L_821_forvar0)] = L_780_.Parser[L_822_forvar1.__type].Save(L_822_forvar1)
					end
				end
				local L_818_ = L_778_:JSONEncode(L_817_)
				if writefile then
					writefile(L_806_.Path, L_818_)
				end
				return L_817_
			end
			function L_806_.Load(L_823_arg0)
				if isfile and not isfile(L_806_.Path) then
					return false, "Config file does not exist"
				end
				local L_824_, L_825_ = pcall(function()
					local L_826_ = readfile or function()
						warn"[ WindUI.ConfigManager ] The config system doesn't work in the studio."
						return nil
					end
					return L_778_:JSONDecode(L_826_(L_806_.Path))
				end)
				if not L_824_ then
					return false, "Failed to parse config file"
				end
				if not L_825_.__version then
					local L_827_ = {
						__version = L_806_.Version,
						__elements = L_825_,
						__custom = {}
					}
					L_825_ = L_827_
				end
				if L_779_.PendingFlags then
					for L_828_forvar0, L_829_forvar1 in next, L_779_.PendingFlags do
						L_806_:Register(L_828_forvar0, L_829_forvar1)
					end
				end
				for L_830_forvar0, L_831_forvar1 in next, (L_825_.__elements or {}) do
					if L_806_.Elements[L_830_forvar0] and L_780_.Parser[L_831_forvar1.__type] then
						task.spawn(function()
							L_780_.Parser[L_831_forvar1.__type].Load(L_806_.Elements[L_830_forvar0], L_831_forvar1)
						end)
					end
				end
				L_806_.CustomData = L_825_.__custom or {}
				return L_806_.CustomData
			end
			function L_806_.GetData(L_832_arg0)
				return {
					elements = L_806_.Elements,
					custom = L_806_.CustomData
				}
			end
			L_806_:SetAsCurrent()
			L_780_.Configs[L_805_arg1] = L_806_
			return L_806_
		end
		function L_780_.AllConfigs(L_833_arg0)
			if not listfiles then
				return {}
			end
			local L_834_ = {}
			if not isfolder(L_780_.Path) then
				makefolder(L_780_.Path)
				return L_834_
			end
			for L_835_forvar0, L_836_forvar1 in next, listfiles(L_780_.Path) do
				local L_837_ = L_836_forvar1:match"([^\\/]+)%.json$"
				if L_837_ then
					table.insert(L_834_, L_837_)
				end
			end
			return L_834_
		end
		function L_780_.GetConfig(L_838_arg0, L_839_arg1)
			return L_780_.Configs[L_839_arg1]
		end
		return L_780_
	end
	function L_1_.w()
		local L_840_ = {}
		local L_841_ = L_1_.load'a'
		local L_842_ = L_841_.New
		local L_843_ = L_841_.Tween
		game:GetService"UserInputService"
		function L_840_.New(L_844_arg0)
			local L_845_ = {
				Button = nil
			}
			local L_846_
			local L_847_ = L_842_("TextLabel", {
				Text = L_844_arg0.Title,
				TextSize = 17,
				FontFace = Font.new(L_841_.Font, Enum.FontWeight.Medium),
				BackgroundTransparency = 1,
				AutomaticSize = "XY",
			})
			local L_848_ = L_842_("Frame", {
				Size = UDim2.new(0, 36, 0, 36),
				BackgroundTransparency = 1,
				Name = "Drag",
			}, {
				L_842_("ImageLabel", {
					Image = L_841_.Icon"move"[1],
					ImageRectOffset = L_841_.Icon"move"[2].ImageRectPosition,
					ImageRectSize = L_841_.Icon"move"[2].ImageRectSize,
					Size = UDim2.new(0, 18, 0, 18),
					BackgroundTransparency = 1,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					ThemeTag = {
						ImageColor3 = "Icon",
					},
					ImageTransparency = .3,
				})
			})
			local L_849_ = L_842_("Frame", {
				Size = UDim2.new(0, 1, 1, 0),
				Position = UDim2.new(0, 36, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = .9,
			})
			local L_850_ = L_842_("Frame", {
				Size = UDim2.new(0, 0, 0, 0),
				Position = UDim2.new(0.5, 0, 0, 28),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Parent = L_844_arg0.Parent,
				BackgroundTransparency = 1,
				Active = true,
				Visible = false,
			})
			local L_851_ = L_842_("TextButton", {
				Size = UDim2.new(0, 0, 0, 44),
				AutomaticSize = "X",
				Parent = L_850_,
				Active = false,
				BackgroundTransparency = .25,
				ZIndex = 99,
				BackgroundColor3 = Color3.new(0, 0, 0),
			}, {
				L_842_("UICorner", {
					CornerRadius = UDim.new(1, 0)
				}),
				L_842_("UIStroke", {
					Thickness = 1,
					ApplyStrokeMode = "Border",
					Color = Color3.new(1, 1, 1),
					Transparency = 0,
				}, {
					L_842_("UIGradient", {
						Color = ColorSequence.new(Color3.fromHex"40c9ff", Color3.fromHex"e81cff")
					})
				}),
				L_848_,
				L_849_,
				L_842_("UIListLayout", {
					Padding = UDim.new(0, 4),
					FillDirection = "Horizontal",
					VerticalAlignment = "Center",
				}),
				L_842_("TextButton", {
					AutomaticSize = "XY",
					Active = true,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 0, 0, 36),
					BackgroundColor3 = Color3.new(1, 1, 1),
				}, {
					L_842_("UICorner", {
						CornerRadius = UDim.new(1, -4)
					}),
					L_846_,
					L_842_("UIListLayout", {
						Padding = UDim.new(0, L_844_arg0.UIPadding),
						FillDirection = "Horizontal",
						VerticalAlignment = "Center",
					}),
					L_847_,
					L_842_("UIPadding", {
						PaddingLeft = UDim.new(0, 11),
						PaddingRight = UDim.new(0, 11),
					}),
				}),
				L_842_("UIPadding", {
					PaddingLeft = UDim.new(0, 4),
					PaddingRight = UDim.new(0, 4),
				})
			})
			L_845_.Button = L_851_
			function L_845_.SetIcon(L_853_arg0, L_854_arg1)
				if L_846_ then
					L_846_:Destroy()
				end
				if L_854_arg1 then
					L_846_ = L_841_.Image(
L_854_arg1,
L_844_arg0.Title,
0,
L_844_arg0.Folder,
"OpenButton",
true,
L_844_arg0.IconThemed
)
					L_846_.Size = UDim2.new(0, 22, 0, 22)
					L_846_.LayoutOrder = -1
					L_846_.Parent = L_845_.Button.TextButton
				end
			end
			if L_844_arg0.Icon then
				L_845_:SetIcon(L_844_arg0.Icon)
			end
			L_841_.AddSignal(L_851_:GetPropertyChangedSignal"AbsoluteSize", function()
				L_850_.Size = UDim2.new(
0, L_851_.AbsoluteSize.X,
0, L_851_.AbsoluteSize.Y
)
			end)
			L_841_.AddSignal(L_851_.TextButton.MouseEnter, function()
				L_843_(L_851_.TextButton, .1, {
					BackgroundTransparency = .93
				}):Play()
			end)
			L_841_.AddSignal(L_851_.TextButton.MouseLeave, function()
				L_843_(L_851_.TextButton, .1, {
					BackgroundTransparency = 1
				}):Play()
			end)
			local L_852_ = L_841_.Drag(L_850_)
			function L_845_.Visible(L_855_arg0, L_856_arg1)
				L_850_.Visible = L_856_arg1
			end
			function L_845_.Edit(L_857_arg0, L_858_arg1)
				local L_859_ = {
					Title = L_858_arg1.Title,
					Icon = L_858_arg1.Icon,
					Enabled = L_858_arg1.Enabled,
					Position = L_858_arg1.Position,
					OnlyIcon = L_858_arg1.OnlyIcon or false,
					Draggable = L_858_arg1.Draggable or nil,
					OnlyMobile = L_858_arg1.OnlyMobile,
					CornerRadius = L_858_arg1.CornerRadius or UDim.new(1, 0),
					StrokeThickness = L_858_arg1.StrokeThickness or 2,
					Color = L_858_arg1.Color
or ColorSequence.new(Color3.fromHex"40c9ff", Color3.fromHex"e81cff"),
				}
				if L_859_.Enabled == false then
					L_844_arg0.IsOpenButtonEnabled = false
				end
				if L_859_.OnlyMobile ~= false then
					L_859_.OnlyMobile = true
				else
					L_844_arg0.IsPC = false
				end
				if L_859_.Draggable == false and L_848_ and L_849_ then
					L_848_.Visible = L_859_.Draggable
					L_849_.Visible = L_859_.Draggable
					if L_852_ then
						L_852_:Set(L_859_.Draggable)
					end
				end
				if L_859_.Position and L_850_ then
					L_850_.Position = L_859_.Position
				end
				if L_859_.OnlyIcon == true and L_847_ then
					L_847_.Visible = false
					L_851_.TextButton.UIPadding.PaddingLeft = UDim.new(0, 7)
					L_851_.TextButton.UIPadding.PaddingRight = UDim.new(0, 7)
				elseif L_859_.OnlyIcon == false then
					L_847_.Visible = true
					L_851_.TextButton.UIPadding.PaddingLeft = UDim.new(0, 11)
					L_851_.TextButton.UIPadding.PaddingRight = UDim.new(0, 11)
				end
				if L_847_ then
					if L_859_.Title then
						L_847_.Text = L_859_.Title
						L_841_:ChangeTranslationKey(L_847_, L_859_.Title)
					elseif L_859_.Title == nil then
					end
				end
				if L_859_.Icon then
					L_845_:SetIcon(L_859_.Icon)
				end
				L_851_.UIStroke.UIGradient.Color = L_859_.Color
				if Glow then
					Glow.UIGradient.Color = L_859_.Color
				end
				L_851_.UICorner.CornerRadius = L_859_.CornerRadius
				L_851_.TextButton.UICorner.CornerRadius = UDim.new(L_859_.CornerRadius.Scale, L_859_.CornerRadius.Offset - 4)
				L_851_.UIStroke.Thickness = L_859_.StrokeThickness
			end
			return L_845_
		end
		return L_840_
	end
	function L_1_.x()
		local L_860_ = {}
		local L_861_ = L_1_.load'a'
		local L_862_ = L_861_.New
		local L_863_ = L_861_.Tween
		function L_860_.New(L_864_arg0, L_865_arg1)
			local L_866_ = {
				Container = nil,
				ToolTipSize = 16,
			}
			local L_867_ = L_862_("TextLabel", {
				AutomaticSize = "XY",
				TextWrapped = true,
				BackgroundTransparency = 1,
				FontFace = Font.new(L_861_.Font, Enum.FontWeight.Medium),
				Text = L_864_arg0,
				TextSize = 17,
				TextTransparency = 1,
				ThemeTag = {
					TextColor3 = "Text",
				}
			})
			local L_868_ = L_862_("UIScale", {
				Scale = .9
			})
			local L_869_ = L_862_("Frame", {
				AnchorPoint = Vector2.new(0.5, 0),
				AutomaticSize = "XY",
				BackgroundTransparency = 1,
				Parent = L_865_arg1,
				Visible = false
			}, {
				L_862_("UISizeConstraint", {
					MaxSize = Vector2.new(400, math.huge)
				}),
				L_862_("Frame", {
					AutomaticSize = "XY",
					BackgroundTransparency = 1,
					LayoutOrder = 99,
					Visible = false
				}, {
					L_862_("ImageLabel", {
						Size = UDim2.new(0, L_866_.ToolTipSize, 0, L_866_.ToolTipSize / 2),
						BackgroundTransparency = 1,
						Rotation = 180,
						Image = "rbxassetid://89524607682719",
						ThemeTag = {
							ImageColor3 = "Accent",
						},
					}, {
						L_862_("ImageLabel", {
							Size = UDim2.new(0, L_866_.ToolTipSize, 0, L_866_.ToolTipSize / 2),
							BackgroundTransparency = 1,
							LayoutOrder = 99,
							ImageTransparency = .9,
							Image = "rbxassetid://89524607682719",
							ThemeTag = {
								ImageColor3 = "Text",
							},
						}),
					}),
				}),
				L_861_.NewRoundFrame(14, "Squircle", {
					AutomaticSize = "XY",
					ThemeTag = {
						ImageColor3 = "Accent",
					},
					ImageTransparency = 1,
					Name = "Background",
				}, {
					L_862_("Frame", {
						ThemeTag = {
							BackgroundColor3 = "Text",
						},
						AutomaticSize = "XY",
						BackgroundTransparency = 1,
					}, {
						L_862_("UICorner", {
							CornerRadius = UDim.new(0, 16),
						}),
						L_862_("UIListLayout", {
							Padding = UDim.new(0, 12),
							FillDirection = "Horizontal",
							VerticalAlignment = "Center"
						}),
						L_867_,
						L_862_("UIPadding", {
							PaddingTop = UDim.new(0, 12),
							PaddingLeft = UDim.new(0, 12),
							PaddingRight = UDim.new(0, 12),
							PaddingBottom = UDim.new(0, 12),
						}),
					})
				}),
				L_868_,
				L_862_("UIListLayout", {
					Padding = UDim.new(0, 0),
					FillDirection = "Vertical",
					VerticalAlignment = "Center",
					HorizontalAlignment = "Center",
				}),
			})
			L_866_.Container = L_869_
			function L_866_.Open(L_870_arg0)
				L_869_.Visible = true
				L_863_(L_869_.Background, .2, {
					ImageTransparency = 0
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				L_863_(L_867_, .2, {
					TextTransparency = 0
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				L_863_(L_868_, .18, {
					Scale = 1
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
			end
			function L_866_.Close(L_871_arg0)
				L_863_(L_869_.Background, .3, {
					ImageTransparency = 1
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				L_863_(L_867_, .3, {
					TextTransparency = 1
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				L_863_(L_868_, .35, {
					Scale = .9
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				task.wait(.35)
				L_869_.Visible = false
				L_869_:Destroy()
			end
			return L_866_
		end
		return L_860_
	end
	function L_1_.y()
		local L_872_ = L_1_.load'a'
		local L_873_ = L_872_.New
		local L_874_ = L_872_.NewRoundFrame
		local L_875_ = L_872_.Tween
		game:GetService"UserInputService"
		local function L_876_func(L_880_arg0)
			local L_881_, L_882_, L_883_ = L_880_arg0.R, L_880_arg0.G, L_880_arg0.B
			local L_884_ = math.max(L_881_, L_882_, L_883_)
			local L_885_ = math.min(L_881_, L_882_, L_883_)
			local L_886_ = L_884_ - L_885_
			local L_887_ = 0
			if L_886_ ~= 0 then
				if L_884_ == L_881_ then
					L_887_ = (L_882_ - L_883_) / L_886_ % 6
				elseif L_884_ == L_882_ then
					L_887_ = (L_883_ - L_881_) / L_886_ + 2
				else
					L_887_ = (L_881_ - L_882_) / L_886_ + 4
				end
				L_887_ = L_887_ * 60
			else
				L_887_ = 0
			end
			local L_888_ = (L_884_ == 0) and 0 or (L_886_ / L_884_)
			local L_889_ = L_884_
			return {
				h = math.floor(L_887_ + 0.5),
				s = L_888_,
				b = L_889_
			}
		end
		local function L_877_func(L_890_arg0)
			local L_891_ = L_890_arg0.R
			local L_892_ = L_890_arg0.G
			local L_893_ = L_890_arg0.B
			return 0.299 * L_891_ + 0.587 * L_892_ + 0.114 * L_893_
		end
		local function L_878_func(L_894_arg0)
			local L_895_ = L_876_func(L_894_arg0)
			local
L_896_, L_897_, L_898_ = L_895_.h, L_895_.s, L_895_.b
			if L_877_func(L_894_arg0) > 0.5 then
				return Color3.fromHSV(L_896_ / 360, 0, 0.05)
			else
				return Color3.fromHSV(L_896_ / 360, 0, 0.98)
			end
		end
		local function L_879_func(L_899_arg0, L_900_arg1)
			if type(L_900_arg1) ~= "number" or L_900_arg1 ~= math.floor(L_900_arg1) then
				return nil, 1
			end
			local L_901_ = #L_899_arg0
			if L_901_ == 0 or L_900_arg1 < 1 or L_900_arg1 > L_901_ then
				return nil, 2
			end
			local function L_902_func(L_906_arg0)
				if L_906_arg0 == nil then
					return true
				end
				local L_907_ = L_906_arg0.__type
				return L_907_ == "Divider" or L_907_ == "Space" or L_907_ == "Section" or L_907_ == "Code"
			end
			if L_902_func(L_899_arg0[L_900_arg1]) then
				return nil, 3
			end
			local function L_903_func(L_908_arg0, L_909_arg1)
				if L_909_arg1 == 1 then
					return "Squircle"
				end
				if L_908_arg0 == 1 then
					return "Squircle-TL-TR"
				end
				if L_908_arg0 == L_909_arg1 then
					return "Squircle-BL-BR"
				end
				return "Square"
			end
			local L_904_ = 1
			local L_905_ = 0
			for L_910_forvar0 = 1, L_901_ do
				local L_911_ = L_899_arg0[L_910_forvar0]
				if L_902_func(L_911_) then
					if L_900_arg1 >= L_904_ and L_900_arg1 <= L_910_forvar0 - 1 then
						local L_912_ = L_900_arg1 - L_904_ + 1
						return L_903_func(L_912_, L_905_)
					end
					L_904_ = L_910_forvar0 + 1
					L_905_ = 0
				else
					L_905_ = L_905_ + 1
				end
			end
			if L_900_arg1 >= L_904_ and L_900_arg1 <= L_901_ then
				local L_913_ = L_900_arg1 - L_904_ + 1
				return L_903_func(L_913_, L_905_)
			end
			return nil, 4
		end
		return function(L_914_arg0)
			local L_915_ = {
				Title = L_914_arg0.Title,
				Desc = L_914_arg0.Desc or nil,
				Hover = L_914_arg0.Hover,
				Thumbnail = L_914_arg0.Thumbnail,
				ThumbnailSize = L_914_arg0.ThumbnailSize or 80,
				Image = L_914_arg0.Image,
				IconThemed = L_914_arg0.IconThemed or false,
				ImageSize = L_914_arg0.ImageSize or 30,
				Color = L_914_arg0.Color,
				Scalable = L_914_arg0.Scalable,
				Parent = L_914_arg0.Parent,
				Justify = L_914_arg0.Justify or "Between",
				UIPadding = L_914_arg0.Window.ElementConfig.UIPadding,
				UICorner = L_914_arg0.Window.ElementConfig.UICorner,
				UIElements = {},
				Index = L_914_arg0.Index
			}
			local L_916_ = L_915_.ImageSize
			local L_917_ = L_915_.ThumbnailSize
			local L_918_ = true
			local L_919_ = 0
			local L_920_
			local L_921_
			if L_915_.Thumbnail then
				L_920_ = L_872_.Image(
L_915_.Thumbnail,
L_915_.Title,
L_914_arg0.Window.NewElements and L_915_.UICorner - 12 or (L_915_.UICorner - 4),
L_914_arg0.Window.Folder,
"Thumbnail",
false,
L_915_.IconThemed
)
				L_920_.Size = UDim2.new(1, 0, 0, L_917_)
			end
			if L_915_.Image then
				L_921_ = L_872_.Image(
L_915_.Image,
L_915_.Title,
L_914_arg0.Window.NewElements and L_915_.UICorner - 12 or (L_915_.UICorner - 4),
L_914_arg0.Window.Folder,
"Image",
not L_915_.Color and true or false
)
				if typeof(L_915_.Color) == "string" then
					L_921_.ImageLabel.ImageColor3 = L_878_func(Color3.fromHex(L_872_.Colors[L_915_.Color]))
				elseif typeof(L_915_.Color) == "Color3" then
					L_921_.ImageLabel.ImageColor3 = L_878_func(L_915_.Color)
				end
				L_921_.Size = UDim2.new(0, L_916_, 0, L_916_)
				L_919_ = L_916_
			end
			local function L_922_func(L_936_arg0, L_937_arg1)
				local L_938_ = typeof(L_915_.Color) == "string"
and L_878_func(Color3.fromHex(L_872_.Colors[L_915_.Color]))
or typeof(L_915_.Color) == "Color3"
and L_878_func(L_915_.Color)
				return L_873_("TextLabel", {
					BackgroundTransparency = 1,
					Text = L_936_arg0 or "",
					TextSize = L_937_arg1 == "Desc" and 15 or 17,
					TextXAlignment = "Left",
					ThemeTag = {
						TextColor3 = not L_915_.Color and "Text" or nil,
					},
					TextColor3 = L_915_.Color and L_938_ or nil,
					TextTransparency = L_937_arg1 == "Desc" and .3 or 0,
					TextWrapped = true,
					Size = UDim2.new(L_915_.Justify == "Between" and 1 or 0, 0, 0, 0),
					AutomaticSize = L_915_.Justify == "Between" and "Y" or "XY",
					FontFace = Font.new(L_872_.Font, L_937_arg1 == "Desc" and Enum.FontWeight.Medium or Enum.FontWeight.SemiBold)
				})
			end
			local L_923_ = L_922_func(L_915_.Title, "Title")
			local L_924_ = L_922_func(L_915_.Desc, "Desc")
			if not L_915_.Desc or L_915_.Desc == "" then
				L_924_.Visible = false
			end
			L_915_.UIElements.Container = L_873_("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				AutomaticSize = "Y",
				BackgroundTransparency = 1,
			}, {
				L_873_("UIListLayout", {
					Padding = UDim.new(0, L_915_.UIPadding),
					FillDirection = "Vertical",
					VerticalAlignment = "Center",
					HorizontalAlignment = L_915_.Justify == "Between" and "Left" or "Center",
				}),
				L_920_,
				L_873_("Frame", {
					Size = UDim2.new(
L_915_.Justify == "Between" and 1 or 0,
L_915_.Justify == "Between" and -L_914_arg0.TextOffset or 0,
0,
0
),
					AutomaticSize = L_915_.Justify == "Between" and "Y" or "XY",
					BackgroundTransparency = 1,
					Name = "TitleFrame",
				}, {
					L_873_("UIListLayout", {
						Padding = UDim.new(0, L_915_.UIPadding),
						FillDirection = "Horizontal",
						VerticalAlignment = L_914_arg0.Window.NewElements and (L_915_.Justify == "Between" and "Top" or "Center") or "Center",
						HorizontalAlignment = L_915_.Justify ~= "Between" and L_915_.Justify or "Center",
					}),
					L_921_,
					L_873_("Frame", {
						BackgroundTransparency = 1,
						AutomaticSize = L_915_.Justify == "Between" and "Y" or "XY",
						Size = UDim2.new(
L_915_.Justify == "Between" and 1 or 0,
L_915_.Justify == "Between" and (L_921_ and -L_919_ - L_915_.UIPadding or -L_919_) or 0,
1,
0
),
						Name = "TitleFrame",
					}, {
						L_873_("UIPadding", {
							PaddingTop = UDim.new(0, L_914_arg0.Window.NewElements and L_915_.UIPadding / 2 or 0),
							PaddingLeft = UDim.new(0, L_914_arg0.Window.NewElements and L_915_.UIPadding / 2 or 0),
							PaddingRight = UDim.new(0, L_914_arg0.Window.NewElements and L_915_.UIPadding / 2 or 0),
							PaddingBottom = UDim.new(0, L_914_arg0.Window.NewElements and L_915_.UIPadding / 2 or 0),
						}),
						L_873_("UIListLayout", {
							Padding = UDim.new(0, 6),
							FillDirection = "Vertical",
							VerticalAlignment = "Center",
							HorizontalAlignment = "Left",
						}),
						L_923_,
						L_924_
					}),
				})
			})
			local L_925_ = L_872_.Image(
"lock",
"lock",
0,
L_914_arg0.Window.Folder,
"Lock",
false
)
			L_925_.Size = UDim2.new(0, 20, 0, 20)
			L_925_.ImageLabel.ImageColor3 = Color3.new(1, 1, 1)
			L_925_.ImageLabel.ImageTransparency = .4
			local L_926_ = L_873_("TextLabel", {
				Text = "Locked",
				TextSize = 18,
				FontFace = Font.new(L_872_.Font, Enum.FontWeight.Medium),
				AutomaticSize = "XY",
				BackgroundTransparency = 1,
				TextColor3 = Color3.new(1, 1, 1),
				TextTransparency = .05,
			})
			local L_927_ = L_873_("Frame", {
				Size = UDim2.new(1, L_915_.UIPadding * 2, 1, L_915_.UIPadding * 2),
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				ZIndex = 9999999,
			})
			local L_928_, L_929_ = L_874_(L_915_.UICorner, "Squircle", {
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = .25,
				ImageColor3 = Color3.new(0, 0, 0),
				Visible = false,
				Active = false,
				Parent = L_927_,
			}, {
				L_873_("UIListLayout", {
					FillDirection = "Horizontal",
					VerticalAlignment = "Center",
					HorizontalAlignment = "Center",
					Padding = UDim.new(0, 8)
				}),
				L_925_,
				L_926_
			}, nil, true)
			local L_930_, L_931_ = L_874_(L_915_.UICorner, "Squircle-Outline", {
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = 1,
				Active = false,
				ThemeTag = {
					ImageColor3 = "Text",
				},
				Parent = L_927_,
			}, {
				L_873_("UIListLayout", {
					FillDirection = "Horizontal",
					VerticalAlignment = "Center",
					HorizontalAlignment = "Center",
					Padding = UDim.new(0, 8)
				}),
			}, nil, true)
			local L_932_, L_933_ = L_874_(L_915_.UICorner, "Squircle", {
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = 1,
				Active = false,
				ThemeTag = {
					ImageColor3 = "Text",
				},
				Parent = L_927_,
			}, {
				L_873_("UIListLayout", {
					FillDirection = "Horizontal",
					VerticalAlignment = "Center",
					HorizontalAlignment = "Center",
					Padding = UDim.new(0, 8)
				}),
			}, nil, true)
			local L_934_, L_935_ = L_874_(L_915_.UICorner, "Squircle", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = "Y",
				ImageTransparency = L_915_.Color and .05 or .93,
				Parent = L_914_arg0.Parent,
				ThemeTag = {
					ImageColor3 = not L_915_.Color and "Text" or nil
				},
				ImageColor3 = L_915_.Color and
(
typeof(L_915_.Color) == "string"
and Color3.fromHex(L_872_.Colors[L_915_.Color])
or typeof(L_915_.Color) == "Color3"
and L_915_.Color
) or nil
			}, {
				L_915_.UIElements.Container,
				L_927_,
				L_873_("UIPadding", {
					PaddingTop = UDim.new(0, L_915_.UIPadding),
					PaddingLeft = UDim.new(0, L_915_.UIPadding),
					PaddingRight = UDim.new(0, L_915_.UIPadding),
					PaddingBottom = UDim.new(0, L_915_.UIPadding),
				}),
			}, true, true)
			L_915_.UIElements.Main = L_934_
			L_915_.UIElements.Locked = L_928_
			if L_915_.Hover then
				L_872_.AddSignal(L_934_.MouseEnter, function()
					if L_918_ then
						L_875_(L_934_, .05, {
							ImageTransparency = L_915_.Color and .15 or .9
						}):Play()
					end
				end)
				L_872_.AddSignal(L_934_.InputEnded, function()
					if L_918_ then
						L_875_(L_934_, .05, {
							ImageTransparency = L_915_.Color and .05 or .93
						}):Play()
					end
				end)
			end
			function L_915_.SetTitle(L_939_arg0, L_940_arg1)
				L_915_.Title = L_940_arg1
				L_923_.Text = L_940_arg1
			end
			function L_915_.SetDesc(L_941_arg0, L_942_arg1)
				L_915_.Desc = L_942_arg1
				L_924_.Text = L_942_arg1 or ""
				if not L_942_arg1 then
					L_924_.Visible = false
				elseif not L_924_.Visible then
					L_924_.Visible = true
				end
			end
			function L_915_.Colorize(L_943_arg0, L_944_arg1, L_945_arg2)
				if L_915_.Color then
					L_944_arg1[L_945_arg2] = typeof(L_915_.Color) == "string"
and L_878_func(Color3.fromHex(L_872_.Colors[L_915_.Color]))
or typeof(L_915_.Color) == "Color3"
and L_878_func(L_915_.Color)
or nil
				end
			end
			if L_914_arg0.ElementTable then
				L_872_.AddSignal(L_923_:GetPropertyChangedSignal"Text", function()
					if L_915_.Title ~= L_923_.Text then
						L_915_:SetTitle(L_923_.Text)
						L_914_arg0.ElementTable.Title = L_923_.Text
					end
				end)
				L_872_.AddSignal(L_924_:GetPropertyChangedSignal"Text", function()
					if L_915_.Desc ~= L_924_.Text then
						L_915_:SetDesc(L_924_.Text)
						L_914_arg0.ElementTable.Desc = L_924_.Text
					end
				end)
			end
			function L_915_.SetThumbnail(L_946_arg0, L_947_arg1, L_948_arg2)
				L_915_.Thumbnail = L_947_arg1
				if L_948_arg2 then
					L_915_.ThumbnailSize = L_948_arg2
					L_917_ = L_948_arg2
				end
				if L_920_ then
					if L_947_arg1 then
						L_920_:Destroy()
						L_920_ = L_872_.Image(
L_947_arg1,
L_915_.Title,
L_915_.UICorner - 3,
L_914_arg0.Window.Folder,
"Thumbnail",
false,
L_915_.IconThemed
)
						L_920_.Size = UDim2.new(1, 0, 0, L_917_)
						L_920_.Parent = L_915_.UIElements.Container
						local L_949_ = L_915_.UIElements.Container:FindFirstChild"UIListLayout"
						if L_949_ then
							L_920_.LayoutOrder = -1
						end
					else
						L_920_.Visible = false
					end
				else
					if L_947_arg1 then
						L_920_ = L_872_.Image(
L_947_arg1,
L_915_.Title,
L_915_.UICorner - 3,
L_914_arg0.Window.Folder,
"Thumbnail",
false,
L_915_.IconThemed
)
						L_920_.Size = UDim2.new(1, 0, 0, L_917_)
						L_920_.Parent = L_915_.UIElements.Container
						local L_950_ = L_915_.UIElements.Container:FindFirstChild"UIListLayout"
						if L_950_ then
							L_920_.LayoutOrder = -1
						end
					end
				end
			end
			function L_915_.SetImage(L_951_arg0, L_952_arg1, L_953_arg2, L_954_arg3, L_955_arg4)
				L_915_.Image = L_952_arg1
				if L_953_arg2 then
					L_915_.ImageSize = L_953_arg2
					L_916_ = L_953_arg2
				end
				if L_954_arg3 ~= nil then
					L_915_.Color = L_954_arg3
				end
				if L_955_arg4 ~= nil then
					L_915_.IconThemed = L_955_arg4
				end
				if L_921_ then
					if L_952_arg1 then
						L_921_.Size = UDim2.new(0, L_916_, 0, L_916_)
						L_872_.UpdateImage(L_921_, L_952_arg1, L_915_.Title)
						if typeof(L_915_.Color) == "string" then
							L_921_.ImageLabel.ImageColor3 = L_878_func(Color3.fromHex(L_872_.Colors[L_915_.Color]))
						elseif typeof(L_915_.Color) == "Color3" then
							L_921_.ImageLabel.ImageColor3 = L_878_func(L_915_.Color)
						elseif not L_915_.Color then
							L_921_.ImageLabel.ImageColor3 = Color3.new(1, 1, 1)
						end
						L_921_.Visible = true
						L_919_ = L_916_
					else
						L_921_.Visible = false
						L_919_ = 0
					end
				else
					if L_952_arg1 then
						L_921_ = L_872_.Image(
L_952_arg1,
L_915_.Title,
L_915_.UICorner - 3,
L_914_arg0.Window.Folder,
"Image",
not L_915_.Color and true or false
)
						if typeof(L_915_.Color) == "string" then
							L_921_.ImageLabel.ImageColor3 = L_878_func(Color3.fromHex(L_872_.Colors[L_915_.Color]))
						elseif typeof(L_915_.Color) == "Color3" then
							L_921_.ImageLabel.ImageColor3 = L_878_func(L_915_.Color)
						end
						L_921_.Size = UDim2.new(0, L_916_, 0, L_916_)
						L_919_ = L_916_
						local L_956_ = L_915_.UIElements.Container:FindFirstChild"Frame"
						if L_956_ then
							L_921_.Parent = L_956_
							local L_957_ = L_956_:FindFirstChild"UIListLayout"
							if L_957_ then
								L_921_.LayoutOrder = 0
							end
						end
					end
				end
			end
			function L_915_.Destroy(L_958_arg0)
				L_934_:Destroy()
			end
			function L_915_.Lock(L_959_arg0)
				L_918_ = false
				L_928_.Active = true
				L_928_.Visible = true
			end
			function L_915_.Unlock(L_960_arg0)
				L_918_ = true
				L_928_.Active = false
				L_928_.Visible = false
			end
			function L_915_.Highlight(L_961_arg0)
				local L_962_ = L_873_("UIGradient", {
					Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
						ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)),
						ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))
					},
					Transparency = NumberSequence.new{
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(0.1, 0.9),
						NumberSequenceKeypoint.new(0.5, 0.3),
						NumberSequenceKeypoint.new(0.9, 0.9),
						NumberSequenceKeypoint.new(1, 1)
					},
					Rotation = 0,
					Offset = Vector2.new(-1, 0),
					Parent = L_930_
				})
				local L_963_ = L_873_("UIGradient", {
					Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
						ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)),
						ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))
					},
					Transparency = NumberSequence.new{
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(0.15, 0.8),
						NumberSequenceKeypoint.new(0.5, 0.1),
						NumberSequenceKeypoint.new(0.85, 0.8),
						NumberSequenceKeypoint.new(1, 1)
					},
					Rotation = 0,
					Offset = Vector2.new(-1, 0),
					Parent = L_932_
				})
				L_930_.ImageTransparency = 0.25
				L_932_.ImageTransparency = 0.88
				L_875_(L_962_, 0.75, {
					Offset = Vector2.new(1, 0)
				}):Play()
				L_875_(L_963_, 0.75, {
					Offset = Vector2.new(1, 0)
				}):Play()
				task.spawn(function()
					task.wait(.75)
					L_930_.ImageTransparency = 1
					L_932_.ImageTransparency = 1
					L_962_:Destroy()
					L_963_:Destroy()
				end)
			end
			function L_915_.UpdateShape(L_964_arg0)
				if L_914_arg0.Window.NewElements then
					local L_965_ = L_879_func(L_964_arg0.Elements, L_915_.Index)
					if L_965_ and L_934_ then
						L_935_:SetType(L_965_)
						L_929_:SetType(L_965_)
						L_933_:SetType(L_965_)
						L_931_:SetType(L_965_ .. "-Outline")
					end
				end
			end
			return L_915_
		end
	end
	function L_1_.z()
		local L_966_ = L_1_.load'a'
		local L_967_ = L_966_.New
		local L_968_ = {}
		local L_969_ = L_1_.load'i'.New
		function L_968_.New(L_970_arg0, L_971_arg1)
			L_971_arg1.Hover = false
			L_971_arg1.TextOffset = 0
			L_971_arg1.IsButtons = L_971_arg1.Buttons and #L_971_arg1.Buttons > 0 and true or false
			local L_972_ = {
				__type = "Paragraph",
				Title = L_971_arg1.Title or "Paragraph",
				Desc = L_971_arg1.Desc or nil,
				Locked = L_971_arg1.Locked or false,
			}
			local L_973_ = L_1_.load'y'(L_971_arg1)
			L_972_.ParagraphFrame = L_973_
			if L_971_arg1.Buttons and #L_971_arg1.Buttons > 0 then
				local L_974_ = L_967_("Frame", {
					Size = UDim2.new(1, 0, 0, 38),
					BackgroundTransparency = 1,
					AutomaticSize = "Y",
					Parent = L_973_.UIElements.Container
				}, {
					L_967_("UIListLayout", {
						Padding = UDim.new(0, 10),
						FillDirection = "Vertical",
					})
				})
				for L_975_forvar0, L_976_forvar1 in next, L_971_arg1.Buttons do
					local L_977_ = L_969_(L_976_forvar1.Title, L_976_forvar1.Icon, L_976_forvar1.Callback, "White", L_974_, nil, nil, L_971_arg1.Window.NewElements and 12 or 10)
					L_977_.Size = UDim2.new(1, 0, 0, 38)
				end
			end
			return L_972_.__type, L_972_
		end
		return L_968_
	end
	function L_1_.A()
		local L_978_ = L_1_.load'a'
		local L_979_ =
L_978_.New
		local L_980_ = {}
		function L_980_.New(L_981_arg0, L_982_arg1)
			local L_983_ = {
				__type = "Button",
				Title = L_982_arg1.Title or "Button",
				Desc = L_982_arg1.Desc or nil,
				Icon = L_982_arg1.Icon or "mouse-pointer-click",
				IconThemed = L_982_arg1.IconThemed or false,
				Color = L_982_arg1.Color,
				Justify = L_982_arg1.Justify or "Between",
				IconAlign = L_982_arg1.IconAlign or "Right",
				Locked = L_982_arg1.Locked or false,
				Callback = L_982_arg1.Callback or function()
				end,
				UIElements = {}
			}
			local L_984_ = true
			L_983_.ButtonFrame = L_1_.load'y'{
				Title = L_983_.Title,
				Desc = L_983_.Desc,
				Parent = L_982_arg1.Parent,
				Window = L_982_arg1.Window,
				Color = L_983_.Color,
				Justify = L_983_.Justify,
				TextOffset = 20,
				Hover = true,
				Scalable = true,
				Tab = L_982_arg1.Tab,
				Index = L_982_arg1.Index,
				ElementTable = L_983_,
			}
			L_983_.UIElements.ButtonIcon = L_978_.Image(
L_983_.Icon,
L_983_.Icon,
0,
L_982_arg1.Window.Folder,
"Button",
not L_983_.Color and true or nil,
L_983_.IconThemed
)
			L_983_.UIElements.ButtonIcon.Size = UDim2.new(0, 20, 0, 20)
			L_983_.UIElements.ButtonIcon.Parent = L_983_.Justify == "Between" and L_983_.ButtonFrame.UIElements.Main or L_983_.ButtonFrame.UIElements.Container.TitleFrame
			L_983_.UIElements.ButtonIcon.LayoutOrder = L_983_.IconAlign == "Left" and -99999 or 99999
			L_983_.UIElements.ButtonIcon.AnchorPoint = Vector2.new(1, 0.5)
			L_983_.UIElements.ButtonIcon.Position = UDim2.new(1, 0, 0.5, 0)
			L_983_.ButtonFrame:Colorize(L_983_.UIElements.ButtonIcon.ImageLabel, "ImageColor3")
			function L_983_.Lock(L_985_arg0)
				L_983_.Locked = true
				L_984_ = false
				return L_983_.ButtonFrame:Lock()
			end
			function L_983_.Unlock(L_986_arg0)
				L_983_.Locked = false
				L_984_ = true
				return L_983_.ButtonFrame:Unlock()
			end
			if L_983_.Locked then
				L_983_:Lock()
			end
			L_978_.AddSignal(L_983_.ButtonFrame.UIElements.Main.MouseButton1Click, function()
				if L_984_ then
					task.spawn(function()
						L_978_.SafeCallback(L_983_.Callback)
					end)
				end
			end)
			return L_983_.__type, L_983_
		end
		return L_980_
	end
	function L_1_.B()
		local L_987_ = {}
		local L_988_ = L_1_.load'a'
		local L_989_ = L_988_.New
		local L_990_ = L_988_.Tween
		function L_987_.New(L_991_arg0, L_992_arg1, L_993_arg2, L_994_arg3)
			local L_995_ = {}
			local L_996_ = 13
			local L_997_
			if L_992_arg1 and L_992_arg1 ~= "" then
				L_997_ = L_989_("ImageLabel", {
					Size = UDim2.new(1, -7, 1, -7),
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Image = L_988_.Icon(L_992_arg1)[1],
					ImageRectOffset = L_988_.Icon(L_992_arg1)[2].ImageRectPosition,
					ImageRectSize = L_988_.Icon(L_992_arg1)[2].ImageRectSize,
					ImageTransparency = 1,
					ImageColor3 = Color3.new(0, 0, 0),
				})
			end
			local L_998_ = L_988_.NewRoundFrame(L_996_, "Squircle", {
				ImageTransparency = .93,
				ThemeTag = {
					ImageColor3 = "Text"
				},
				Parent = L_993_arg2,
				Size = UDim2.new(0, 41.6, 0, 26),
			}, {
				L_988_.NewRoundFrame(L_996_, "Squircle", {
					Size = UDim2.new(1, 0, 1, 0),
					Name = "Layer",
					ThemeTag = {
						ImageColor3 = "Button",
					},
					ImageTransparency = 1,
				}),
				L_988_.NewRoundFrame(L_996_, "SquircleOutline", {
					Size = UDim2.new(1, 0, 1, 0),
					Name = "Stroke",
					ImageColor3 = Color3.new(1, 1, 1),
					ImageTransparency = 1,
				}, {
					L_989_("UIGradient", {
						Rotation = 90,
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0, 0),
							NumberSequenceKeypoint.new(1, 1),
						}
					})
				}),
				L_988_.NewRoundFrame(L_996_, "Squircle", {
					Size = UDim2.new(0, 18, 0, 18),
					Position = UDim2.new(0, 3, 0.5, 0),
					AnchorPoint = Vector2.new(0, 0.5),
					ImageTransparency = 0,
					ImageColor3 = Color3.new(1, 1, 1),
					Name = "Frame",
				}, {
					L_997_,
				})
			})
			function L_995_.Set(L_999_arg0, L_1000_arg1, L_1001_arg2)
				if L_1000_arg1 then
					L_990_(L_998_.Frame, 0.15, {
						Position = UDim2.new(1, -22, 0.5, 0),
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					L_990_(L_998_.Layer, 0.1, {
						ImageTransparency = 0,
					}):Play()
					L_990_(L_998_.Stroke, 0.1, {
						ImageTransparency = 0.95,
					}):Play()
					if L_997_ then
						L_990_(L_997_, 0.1, {
							ImageTransparency = 0,
						}):Play()
					end
				else
					L_990_(L_998_.Frame, 0.15, {
						Position = UDim2.new(0, 4, 0.5, 0),
						Size = UDim2.new(0, 18, 0, 18),
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					L_990_(L_998_.Layer, 0.1, {
						ImageTransparency = 1,
					}):Play()
					L_990_(L_998_.Stroke, 0.1, {
						ImageTransparency = 1,
					}):Play()
					if L_997_ then
						L_990_(L_997_, 0.1, {
							ImageTransparency = 1,
						}):Play()
					end
				end
				if L_1001_arg2 ~= false then
					L_1001_arg2 = true
				end
				task.spawn(function()
					if L_994_arg3 and L_1001_arg2 then
						L_988_.SafeCallback(L_994_arg3, L_1000_arg1)
					end
				end)
			end
			return L_998_, L_995_
		end
		return L_987_
	end
	function L_1_.C()
		local L_1002_ = {}
		local L_1003_ = L_1_.load'a'
		local L_1004_ = L_1003_.New
		local L_1005_ = L_1003_.Tween
		function L_1002_.New(L_1006_arg0, L_1007_arg1, L_1008_arg2, L_1009_arg3)
			local L_1010_ = {}
			L_1007_arg1 = L_1007_arg1 or "check"
			local L_1011_ = 10
			local L_1012_ = L_1004_("ImageLabel", {
				Size = UDim2.new(1, -10, 1, -10),
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Image = L_1003_.Icon(L_1007_arg1)[1],
				ImageRectOffset = L_1003_.Icon(L_1007_arg1)[2].ImageRectPosition,
				ImageRectSize = L_1003_.Icon(L_1007_arg1)[2].ImageRectSize,
				ImageTransparency = 1,
				ImageColor3 = Color3.new(1, 1, 1),
			})
			local L_1013_ = L_1003_.NewRoundFrame(L_1011_, "Squircle", {
				ImageTransparency = .95,
				ThemeTag = {
					ImageColor3 = "Text"
				},
				Parent = L_1008_arg2,
				Size = UDim2.new(0, 27, 0, 27),
			}, {
				L_1003_.NewRoundFrame(L_1011_, "Squircle", {
					Size = UDim2.new(1, 0, 1, 0),
					Name = "Layer",
					ThemeTag = {
						ImageColor3 = "Button",
					},
					ImageTransparency = 1,
				}),
				L_1003_.NewRoundFrame(L_1011_, "SquircleOutline", {
					Size = UDim2.new(1, 0, 1, 0),
					Name = "Stroke",
					ImageColor3 = Color3.new(1, 1, 1),
					ImageTransparency = 1,
				}, {
					L_1004_("UIGradient", {
						Rotation = 90,
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0, 0),
							NumberSequenceKeypoint.new(1, 1),
						}
					})
				}),
				L_1012_,
			})
			function L_1010_.Set(L_1014_arg0, L_1015_arg1)
				if L_1015_arg1 then
					L_1005_(L_1013_.Layer, 0.06, {
						ImageTransparency = 0,
					}):Play()
					L_1005_(L_1013_.Stroke, 0.06, {
						ImageTransparency = 0.95,
					}):Play()
					L_1005_(L_1012_, 0.06, {
						ImageTransparency = 0,
					}):Play()
				else
					L_1005_(L_1013_.Layer, 0.05, {
						ImageTransparency = 1,
					}):Play()
					L_1005_(L_1013_.Stroke, 0.05, {
						ImageTransparency = 1,
					}):Play()
					L_1005_(L_1012_, 0.06, {
						ImageTransparency = 1,
					}):Play()
				end
				task.spawn(function()
					if L_1009_arg3 then
						L_1003_.SafeCallback(L_1009_arg3, L_1015_arg1)
					end
				end)
			end
			return L_1013_, L_1010_
		end
		return L_1002_
	end
	function L_1_.D()
		local L_1016_ = L_1_.load'a'
		local L_1017_ =
L_1016_.New
		local L_1018_ =
L_1016_.Tween
		local L_1019_ = L_1_.load'B'.New
		local L_1020_ = L_1_.load'C'.New
		local L_1021_ = {}
		function L_1021_.New(L_1022_arg0, L_1023_arg1)
			local L_1024_ = {
				__type = "Toggle",
				Title = L_1023_arg1.Title or "Toggle",
				Desc = L_1023_arg1.Desc or nil,
				Locked = L_1023_arg1.Locked or false,
				Value = L_1023_arg1.Value,
				Icon = L_1023_arg1.Icon or nil,
				Type = L_1023_arg1.Type or "Toggle",
				Callback = L_1023_arg1.Callback or function()
				end,
				UIElements = {}
			}
			L_1024_.ToggleFrame = L_1_.load'y'{
				Title = L_1024_.Title,
				Desc = L_1024_.Desc,
				Window = L_1023_arg1.Window,
				Parent = L_1023_arg1.Parent,
				TextOffset = 44,
				Hover = false,
				Tab = L_1023_arg1.Tab,
				Index = L_1023_arg1.Index,
				ElementTable = L_1024_,
			}
			local L_1025_ = true
			if L_1024_.Value == nil then
				L_1024_.Value = false
			end
			function L_1024_.Lock(L_1029_arg0)
				L_1024_.Locked = true
				L_1025_ = false
				return L_1024_.ToggleFrame:Lock()
			end
			function L_1024_.Unlock(L_1030_arg0)
				L_1024_.Locked = false
				L_1025_ = true
				return L_1024_.ToggleFrame:Unlock()
			end
			if L_1024_.Locked then
				L_1024_:Lock()
			end
			local L_1026_ = L_1024_.Value
			local L_1027_, L_1028_
			if L_1024_.Type == "Toggle" then
				L_1027_, L_1028_ = L_1019_(L_1026_, L_1024_.Icon, L_1024_.ToggleFrame.UIElements.Main, L_1024_.Callback)
			elseif L_1024_.Type == "Checkbox" then
				L_1027_, L_1028_ = L_1020_(L_1026_, L_1024_.Icon, L_1024_.ToggleFrame.UIElements.Main, L_1024_.Callback)
			else
				error("Unknown Toggle Type: " .. tostring(L_1024_.Type))
			end
			L_1027_.AnchorPoint = Vector2.new(1, L_1023_arg1.Window.NewElements and 0 or 0.5)
			L_1027_.Position = UDim2.new(1, 0, L_1023_arg1.Window.NewElements and 0 or 0.5, 0)
			function L_1024_.Set(L_1031_arg0, L_1032_arg1, L_1033_arg2)
				if L_1025_ then
					L_1028_:Set(L_1032_arg1, L_1033_arg2)
					L_1026_ = L_1032_arg1
					L_1024_.Value = L_1032_arg1
				end
			end
			L_1024_:Set(L_1026_, false)
			L_1016_.AddSignal(L_1024_.ToggleFrame.UIElements.Main.MouseButton1Click, function()
				L_1024_:Set(not L_1026_)
			end)
			return L_1024_.__type, L_1024_
		end
		return L_1021_
	end
	function L_1_.E()
		local L_1034_ = L_1_.load'a'
		local L_1035_ = L_1034_.New
		local L_1036_ = L_1034_.Tween
		local L_1037_ = {}
		local L_1038_ = false
		function L_1037_.New(L_1039_arg0, L_1040_arg1)
			local L_1041_ = {
				__type = "Slider",
				Title = L_1040_arg1.Title or "Slider",
				Desc = L_1040_arg1.Desc or nil,
				Locked = L_1040_arg1.Locked or nil,
				Value = L_1040_arg1.Value or {},
				Step = L_1040_arg1.Step or 1,
				Callback = L_1040_arg1.Callback or function()
				end,
				UIElements = {},
				IsFocusing = false,
				Width = 130,
				TextBoxWidth = 30,
				ThumbSize = 13,
			}
			local L_1042_
			local L_1043_
			local L_1044_
			local L_1045_ = L_1041_.Value.Default or L_1041_.Value.Min or 0
			local L_1046_ = L_1045_
			local L_1047_ = (L_1045_ - (L_1041_.Value.Min or 0)) / ((L_1041_.Value.Max or 100) - (L_1041_.Value.Min or 0))
			local L_1048_ = true
			local L_1049_ = L_1041_.Step % 1 ~= 0
			local function L_1050_func(L_1053_arg0)
				if L_1049_ then
					return string.format("%.2f", L_1053_arg0)
				else
					return tostring(math.floor(L_1053_arg0 + 0.5))
				end
			end
			local function L_1051_func(L_1054_arg0)
				if L_1049_ then
					return math.floor(L_1054_arg0 / L_1041_.Step + 0.5) * L_1041_.Step
				else
					return math.floor(L_1054_arg0 / L_1041_.Step + 0.5) * L_1041_.Step
				end
			end
			L_1041_.SliderFrame = L_1_.load'y'{
				Title = L_1041_.Title,
				Desc = L_1041_.Desc,
				Parent = L_1040_arg1.Parent,
				TextOffset = L_1041_.Width,
				Hover = false,
				Tab = L_1040_arg1.Tab,
				Index = L_1040_arg1.Index,
				Window = L_1040_arg1.Window,
				ElementTable = L_1041_,
			}
			L_1041_.UIElements.SliderIcon = L_1034_.NewRoundFrame(99, "Squircle", {
				ImageTransparency = .95,
				Size = UDim2.new(1, -L_1041_.TextBoxWidth - 8, 0, 4),
				Name = "Frame",
				ThemeTag = {
					ImageColor3 = "Text",
				},
			}, {
				L_1034_.NewRoundFrame(99, "Squircle", {
					Name = "Frame",
					Size = UDim2.new(L_1047_, 0, 1, 0),
					ImageTransparency = .1,
					ThemeTag = {
						ImageColor3 = "Button",
					},
				}, {
					L_1034_.NewRoundFrame(99, "Squircle", {
						Size = UDim2.new(0, L_1041_.ThumbSize, 0, L_1041_.ThumbSize),
						Position = UDim2.new(1, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),
						ThemeTag = {
							ImageColor3 = "Text",
						},
						Name = "Thumb",
					})
				})
			})
			L_1041_.UIElements.SliderContainer = L_1035_("Frame", {
				Size = UDim2.new(0, L_1041_.Width, 0, 0),
				AutomaticSize = "Y",
				Position = UDim2.new(1, L_1040_arg1.Window.NewElements and -12 or 0, 0.5, 0),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundTransparency = 1,
				Parent = L_1041_.SliderFrame.UIElements.Main,
			}, {
				L_1035_("UIListLayout", {
					Padding = UDim.new(0, 8),
					FillDirection = "Horizontal",
					VerticalAlignment = "Center",
				}),
				L_1041_.UIElements.SliderIcon,
				L_1035_("TextBox", {
					Size = UDim2.new(0, L_1041_.TextBoxWidth, 0, 0),
					TextXAlignment = "Left",
					Text = L_1050_func(L_1045_),
					ThemeTag = {
						TextColor3 = "Text"
					},
					TextTransparency = .4,
					AutomaticSize = "Y",
					TextSize = 15,
					FontFace = Font.new(L_1034_.Font, Enum.FontWeight.Medium),
					BackgroundTransparency = 1,
					LayoutOrder = -1,
				})
			})
			function L_1041_.Lock(L_1055_arg0)
				L_1041_.Locked = true
				L_1048_ = false
				return L_1041_.SliderFrame:Lock()
			end
			function L_1041_.Unlock(L_1056_arg0)
				L_1041_.Locked = false
				L_1048_ = true
				return L_1041_.SliderFrame:Unlock()
			end
			if L_1041_.Locked then
				L_1041_:Lock()
			end
			local L_1052_ = L_1041_.SliderFrame.Parent:IsA"ScrollingFrame" and L_1041_.SliderFrame.Parent or L_1041_.SliderFrame.Parent.Parent.Parent
			function L_1041_.Set(L_1057_arg0, L_1058_arg1, L_1059_arg2)
				if L_1048_ then
					if not L_1041_.IsFocusing and not L_1038_ and (not L_1059_arg2 or (L_1059_arg2.UserInputType == Enum.UserInputType.MouseButton1 or L_1059_arg2.UserInputType == Enum.UserInputType.Touch)) then
						L_1058_arg1 = math.clamp(L_1058_arg1, L_1041_.Value.Min or 0, L_1041_.Value.Max or 100)
						local L_1060_ = math.clamp((L_1058_arg1 - (L_1041_.Value.Min or 0)) / ((L_1041_.Value.Max or 100) - (L_1041_.Value.Min or 0)), 0, 1)
						L_1058_arg1 = L_1051_func(L_1041_.Value.Min + L_1060_ * (L_1041_.Value.Max - L_1041_.Value.Min))
						if L_1058_arg1 ~= L_1046_ then
							L_1036_(L_1041_.UIElements.SliderIcon.Frame, 0.05, {
								Size = UDim2.new(L_1060_, 0, 1, 0)
							}):Play()
							L_1041_.UIElements.SliderContainer.TextBox.Text = L_1050_func(L_1058_arg1)
							L_1041_.Value.Default = L_1050_func(L_1058_arg1)
							L_1046_ = L_1058_arg1
							L_1034_.SafeCallback(L_1041_.Callback, L_1050_func(L_1058_arg1))
						end
						if L_1059_arg2 then
							L_1042_ = (L_1059_arg2.UserInputType == Enum.UserInputType.Touch)
							L_1052_.ScrollingEnabled = false
							L_1038_ = true
							L_1043_ = game:GetService"RunService".RenderStepped:Connect(function()
								local L_1061_ = L_1042_ and L_1059_arg2.Position.X or game:GetService"UserInputService":GetMouseLocation().X
								local L_1062_ = math.clamp((L_1061_ - L_1041_.UIElements.SliderIcon.AbsolutePosition.X) / L_1041_.UIElements.SliderIcon.AbsoluteSize.X, 0, 1)
								L_1058_arg1 = L_1051_func(L_1041_.Value.Min + L_1062_ * (L_1041_.Value.Max - L_1041_.Value.Min))
								if L_1058_arg1 ~= L_1046_ then
									L_1036_(L_1041_.UIElements.SliderIcon.Frame, 0.05, {
										Size = UDim2.new(L_1062_, 0, 1, 0)
									}):Play()
									L_1041_.UIElements.SliderContainer.TextBox.Text = L_1050_func(L_1058_arg1)
									L_1041_.Value.Default = L_1050_func(L_1058_arg1)
									L_1046_ = L_1058_arg1
									L_1034_.SafeCallback(L_1041_.Callback, L_1050_func(L_1058_arg1))
								end
							end)
							L_1044_ = game:GetService"UserInputService".InputEnded:Connect(function(L_1063_arg0)
								if (L_1063_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_1063_arg0.UserInputType == Enum.UserInputType.Touch) and L_1059_arg2 == L_1063_arg0 then
									L_1043_:Disconnect()
									L_1044_:Disconnect()
									L_1038_ = false
									L_1052_.ScrollingEnabled = true
									L_1036_(L_1041_.UIElements.SliderIcon.Frame.Thumb, .12, {
										Size = UDim2.new(0, L_1041_.ThumbSize, 0, L_1041_.ThumbSize)
									}, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut):Play()
								end
							end)
						end
					end
				end
			end
			function L_1041_.SetMax(L_1064_arg0, L_1065_arg1)
				L_1041_.Value.Max = L_1065_arg1
				local L_1066_ = tonumber(L_1041_.Value.Default) or L_1046_
				if L_1066_ > L_1065_arg1 then
					L_1041_:Set(L_1065_arg1)
				else
					local L_1067_ = math.clamp((L_1066_ - (L_1041_.Value.Min or 0)) / (L_1065_arg1 - (L_1041_.Value.Min or 0)), 0, 1)
					L_1036_(L_1041_.UIElements.SliderIcon.Frame, 0.1, {
						Size = UDim2.new(L_1067_, 0, 1, 0)
					}):Play()
				end
			end
			function L_1041_.SetMin(L_1068_arg0, L_1069_arg1)
				L_1041_.Value.Min = L_1069_arg1
				local L_1070_ = tonumber(L_1041_.Value.Default) or L_1046_
				if L_1070_ < L_1069_arg1 then
					L_1041_:Set(L_1069_arg1)
				else
					local L_1071_ = math.clamp((L_1070_ - L_1069_arg1) / ((L_1041_.Value.Max or 100) - L_1069_arg1), 0, 1)
					L_1036_(L_1041_.UIElements.SliderIcon.Frame, 0.1, {
						Size = UDim2.new(L_1071_, 0, 1, 0)
					}):Play()
				end
			end
			L_1034_.AddSignal(L_1041_.UIElements.SliderContainer.TextBox.FocusLost, function(L_1072_arg0)
				if L_1072_arg0 then
					local L_1073_ = tonumber(L_1041_.UIElements.SliderContainer.TextBox.Text)
					if L_1073_ then
						L_1041_:Set(L_1073_)
					else
						L_1041_.UIElements.SliderContainer.TextBox.Text = L_1050_func(L_1046_)
					end
				end
			end)
			L_1034_.AddSignal(L_1041_.UIElements.SliderContainer.InputBegan, function(L_1074_arg0)
				L_1041_:Set(L_1045_, L_1074_arg0)
				if L_1074_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_1074_arg0.UserInputType == Enum.UserInputType.Touch then
					L_1036_(L_1041_.UIElements.SliderIcon.Frame.Thumb, .12, {
						Size = UDim2.new(0, L_1041_.ThumbSize + 8, 0, L_1041_.ThumbSize + 8)
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				end
			end)
			return L_1041_.__type, L_1041_
		end
		return L_1037_
	end
	function L_1_.F()
		local L_1075_ = game:GetService"UserInputService"
		local L_1076_ = L_1_.load'a'
		local L_1077_ = L_1076_.New
		local L_1078_ =
L_1076_.Tween
		local L_1079_ = {
			UICorner = 6,
			UIPadding = 8,
		}
		local L_1080_ = L_1_.load's'.New
		function L_1079_.New(L_1081_arg0, L_1082_arg1)
			local L_1083_ = {
				__type = "Keybind",
				Title = L_1082_arg1.Title or "Keybind",
				Desc = L_1082_arg1.Desc or nil,
				Locked = L_1082_arg1.Locked or false,
				Value = L_1082_arg1.Value or "F",
				Callback = L_1082_arg1.Callback or function()
				end,
				CanChange = L_1082_arg1.CanChange or true,
				Picking = false,
				UIElements = {},
			}
			local L_1084_ = true
			L_1083_.KeybindFrame = L_1_.load'y'{
				Title = L_1083_.Title,
				Desc = L_1083_.Desc,
				Parent = L_1082_arg1.Parent,
				TextOffset = 85,
				Hover = L_1083_.CanChange,
				Tab = L_1082_arg1.Tab,
				Index = L_1082_arg1.Index,
				Window = L_1082_arg1.Window,
				ElementTable = L_1083_,
			}
			L_1083_.UIElements.Keybind = L_1080_(L_1083_.Value, nil, L_1083_.KeybindFrame.UIElements.Main)
			L_1083_.UIElements.Keybind.Size = UDim2.new(
0, 24
+ L_1083_.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,
0,
42
)
			L_1083_.UIElements.Keybind.AnchorPoint = Vector2.new(1, 0.5)
			L_1083_.UIElements.Keybind.Position = UDim2.new(1, 0, 0.5, 0)
			L_1077_("UIScale", {
				Parent = L_1083_.UIElements.Keybind,
				Scale = .85,
			})
			L_1076_.AddSignal(L_1083_.UIElements.Keybind.Frame.Frame.TextLabel:GetPropertyChangedSignal"TextBounds", function()
				L_1083_.UIElements.Keybind.Size = UDim2.new(
0, 24
+ L_1083_.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,
0,
42
)
			end)
			function L_1083_.Lock(L_1085_arg0)
				L_1083_.Locked = true
				L_1084_ = false
				return L_1083_.KeybindtrueFrame:Lock()
			end
			function L_1083_.Unlock(L_1086_arg0)
				L_1083_.Locked = false
				L_1084_ = true
				return L_1083_.KeybindFrame:Unlock()
			end
			function L_1083_.Set(L_1087_arg0, L_1088_arg1)
				L_1083_.Value = L_1088_arg1
				L_1083_.UIElements.Keybind.Frame.Frame.TextLabel.Text = L_1088_arg1
			end
			if L_1083_.Locked then
				L_1083_:Lock()
			end
			L_1076_.AddSignal(L_1083_.KeybindFrame.UIElements.Main.MouseButton1Click, function()
				if L_1084_ then
					if L_1083_.CanChange then
						L_1083_.Picking = true
						L_1083_.UIElements.Keybind.Frame.Frame.TextLabel.Text = "..."
						task.wait(0.2)
						local L_1089_
						L_1089_ = L_1075_.InputBegan:Connect(function(L_1090_arg0)
							local L_1091_
							if L_1090_arg0.UserInputType == Enum.UserInputType.Keyboard then
								L_1091_ = L_1090_arg0.KeyCode.Name
							elseif L_1090_arg0.UserInputType == Enum.UserInputType.MouseButton1 then
								L_1091_ = "MouseLeft"
							elseif L_1090_arg0.UserInputType == Enum.UserInputType.MouseButton2 then
								L_1091_ = "MouseRight"
							end
							local L_1092_
							L_1092_ = L_1075_.InputEnded:Connect(function(L_1093_arg0)
								if L_1093_arg0.KeyCode.Name == L_1091_ or L_1091_ == "MouseLeft" and L_1093_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_1091_ == "MouseRight" and L_1093_arg0.UserInputType == Enum.UserInputType.MouseButton2 then
									L_1083_.Picking = false
									L_1083_.UIElements.Keybind.Frame.Frame.TextLabel.Text = L_1091_
									L_1083_.Value = L_1091_
									L_1089_:Disconnect()
									L_1092_:Disconnect()
								end
							end)
						end)
					end
				end
			end)
			L_1076_.AddSignal(L_1075_.InputBegan, function(L_1094_arg0, L_1095_arg1)
				if L_1075_:GetFocusedTextBox() then
					return
				end
				if not L_1084_ then
					return
				end
				if L_1094_arg0.UserInputType == Enum.UserInputType.Keyboard then
					if L_1094_arg0.KeyCode.Name == L_1083_.Value then
						L_1076_.SafeCallback(L_1083_.Callback, L_1094_arg0.KeyCode.Name)
					end
				elseif L_1094_arg0.UserInputType == Enum.UserInputType.MouseButton1 and L_1083_.Value == "MouseLeft" then
					L_1076_.SafeCallback(L_1083_.Callback, "MouseLeft")
				elseif L_1094_arg0.UserInputType == Enum.UserInputType.MouseButton2 and L_1083_.Value == "MouseRight" then
					L_1076_.SafeCallback(L_1083_.Callback, "MouseRight")
				end
			end)
			return L_1083_.__type, L_1083_
		end
		return L_1079_
	end
	function L_1_.G()
		local L_1096_ = L_1_.load'a'
		local L_1097_ = L_1096_.New
		local L_1098_ =
L_1096_.Tween
		local L_1099_ = {
			UICorner = 8,
			UIPadding = 8,
		}
		local L_1100_ = L_1_.load'i'


.New
		local L_1101_ = L_1_.load'j'.New
		function L_1099_.New(L_1102_arg0, L_1103_arg1)
			local L_1104_ = {
				__type = "Input",
				Title = L_1103_arg1.Title or "Input",
				Desc = L_1103_arg1.Desc or nil,
				Type = L_1103_arg1.Type or "Input",
				Locked = L_1103_arg1.Locked or false,
				InputIcon = L_1103_arg1.InputIcon or false,
				Placeholder = L_1103_arg1.Placeholder or "Enter Text...",
				Value = L_1103_arg1.Value or "",
				Callback = L_1103_arg1.Callback or function()
				end,
				ClearTextOnFocus = L_1103_arg1.ClearTextOnFocus or false,
				UIElements = {},
				Width = 150,
			}
			local L_1105_ = true
			L_1104_.InputFrame = L_1_.load'y'{
				Title = L_1104_.Title,
				Desc = L_1104_.Desc,
				Parent = L_1103_arg1.Parent,
				TextOffset = L_1104_.Width,
				Hover = false,
				Tab = L_1103_arg1.Tab,
				Index = L_1103_arg1.Index,
				Window = L_1103_arg1.Window,
				ElementTable = L_1104_,
			}
			local L_1106_ = L_1101_(
L_1104_.Placeholder,
L_1104_.InputIcon,
L_1104_.Type == "Textarea" and L_1104_.InputFrame.UIElements.Container or L_1104_.InputFrame.UIElements.Main,
L_1104_.Type,
function(L_1107_arg0)
				L_1104_:Set(L_1107_arg0, true)
			end,
nil,
L_1103_arg1.Window.NewElements and 12 or 10,
L_1104_.ClearTextOnFocus
)
			if L_1104_.Type == "Input" then
				L_1106_.Size = UDim2.new(0, L_1104_.Width, 0, 36)
				L_1106_.Position = UDim2.new(1, 0, L_1103_arg1.Window.NewElements and 0 or 0.5, 0)
				L_1106_.AnchorPoint = Vector2.new(1, L_1103_arg1.Window.NewElements and 0 or 0.5)
			else
				L_1106_.Size = UDim2.new(1, 0, 0, 148)
			end
			L_1097_("UIScale", {
				Parent = L_1106_,
				Scale = 1,
			})
			function L_1104_.Lock(L_1108_arg0)
				L_1104_.Locked = true
				L_1105_ = false
				return L_1104_.InputFrame:Lock()
			end
			function L_1104_.Unlock(L_1109_arg0)
				L_1104_.Locked = false
				L_1105_ = true
				return L_1104_.InputFrame:Unlock()
			end
			function L_1104_.Set(L_1110_arg0, L_1111_arg1, L_1112_arg2)
				if L_1105_ then
					L_1104_.Value = L_1111_arg1
					L_1096_.SafeCallback(L_1104_.Callback, L_1111_arg1)
					if not L_1112_arg2 then
						L_1106_.Frame.Frame.TextBox.Text = L_1111_arg1
					end
				end
			end
			function L_1104_.SetPlaceholder(L_1113_arg0, L_1114_arg1)
				L_1106_.Frame.Frame.TextBox.PlaceholderText = L_1114_arg1
				L_1104_.Placeholder = L_1114_arg1
			end
			L_1104_:Set(L_1104_.Value)
			if L_1104_.Locked then
				L_1104_:Lock()
			end
			return L_1104_.__type, L_1104_
		end
		return L_1099_
	end
	function L_1_.H()
		local L_1115_ = {}
		local L_1116_ = game:GetService"UserInputService"
		local L_1117_ = game:GetService"Players".LocalPlayer:GetMouse()
		local L_1118_ = game:GetService"Workspace".CurrentCamera
		local L_1119_ = workspace.CurrentCamera
		local L_1120_ = L_1_.load'j'.New
		local L_1121_ = L_1_.load'a'
		local L_1122_ = L_1121_.New
		local L_1123_ = L_1121_.Tween
		function L_1115_.New(L_1124_arg0, L_1125_arg1, L_1126_arg2, L_1127_arg3, L_1128_arg4)
			local L_1129_ = {}
			L_1125_arg1.UIElements.UIListLayout = L_1122_("UIListLayout", {
				Padding = UDim.new(0, L_1126_arg2.MenuPadding),
				FillDirection = "Vertical"
			})
			L_1125_arg1.UIElements.Menu = L_1121_.NewRoundFrame(L_1126_arg2.MenuCorner, "Squircle", {
				ThemeTag = {
					ImageColor3 = "Background",
				},
				ImageTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0),
			}, {
				L_1122_("UIPadding", {
					PaddingTop = UDim.new(0, L_1126_arg2.MenuPadding),
					PaddingLeft = UDim.new(0, L_1126_arg2.MenuPadding),
					PaddingRight = UDim.new(0, L_1126_arg2.MenuPadding),
					PaddingBottom = UDim.new(0, L_1126_arg2.MenuPadding),
				}),
				L_1122_("UIListLayout", {
					FillDirection = "Vertical",
					Padding = UDim.new(0, L_1126_arg2.MenuPadding)
				}),
				L_1122_("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, L_1125_arg1.SearchBarEnabled and -L_1126_arg2.MenuPadding - L_1126_arg2.SearchBarHeight),
					ClipsDescendants = true,
					LayoutOrder = 999,
				}, {
					L_1122_("UICorner", {
						CornerRadius = UDim.new(0, L_1126_arg2.MenuCorner - L_1126_arg2.MenuPadding),
					}),
					L_1122_("ScrollingFrame", {
						Size = UDim2.new(1, 0, 1, 0),
						ScrollBarThickness = 0,
						ScrollingDirection = "Y",
						AutomaticCanvasSize = "Y",
						CanvasSize = UDim2.new(0, 0, 0, 0),
						BackgroundTransparency = 1,
						ScrollBarImageTransparency = 1,
					}, {
						L_1125_arg1.UIElements.UIListLayout,
					})
				})
			})
			L_1125_arg1.UIElements.MenuCanvas = L_1122_("Frame", {
				Size = UDim2.new(0, L_1125_arg1.MenuWidth, 0, 300),
				BackgroundTransparency = 1,
				Position = UDim2.new(-10, 0, -10, 0),
				Visible = false,
				Active = false,
				Parent = L_1124_arg0.WindUI.DropdownGui,
				AnchorPoint = Vector2.new(1, 0),
			}, {
				L_1125_arg1.UIElements.Menu,
				L_1122_("UISizeConstraint", {
					MinSize = Vector2.new(170, 0),
					MaxSize = Vector2.new(300, 400),
				})
			})
			local function L_1130_func()
				L_1125_arg1.UIElements.Menu.Frame.ScrollingFrame.CanvasSize = UDim2.fromOffset(0, L_1125_arg1.UIElements.UIListLayout.AbsoluteContentSize.Y)
			end
			local function L_1131_func()
				local L_1133_ = L_1119_.ViewportSize.Y * 0.6
				local L_1134_ = L_1125_arg1.UIElements.UIListLayout.AbsoluteContentSize.Y
				local L_1135_ = L_1125_arg1.SearchBarEnabled and (L_1126_arg2.SearchBarHeight + (L_1126_arg2.MenuPadding * 3)) or (L_1126_arg2.MenuPadding * 2)
				local L_1136_ = (L_1134_) + L_1135_
				if L_1136_ > L_1133_ then
					L_1125_arg1.UIElements.MenuCanvas.Size = UDim2.fromOffset(
L_1125_arg1.UIElements.MenuCanvas.AbsoluteSize.X,
L_1133_
)
				else
					L_1125_arg1.UIElements.MenuCanvas.Size = UDim2.fromOffset(
L_1125_arg1.UIElements.MenuCanvas.AbsoluteSize.X,
L_1136_
)
				end
			end
			function UpdatePosition()
				local L_1137_ = L_1125_arg1.UIElements.Dropdown
				local L_1138_ = L_1125_arg1.UIElements.MenuCanvas
				local L_1139_ = L_1118_.ViewportSize.Y - (L_1137_.AbsolutePosition.Y + L_1137_.AbsoluteSize.Y) - L_1126_arg2.MenuPadding - 54
				local L_1140_ = L_1138_.AbsoluteSize.Y + L_1126_arg2.MenuPadding
				local L_1141_ = -54
				if L_1139_ < L_1140_ then
					L_1141_ = L_1140_ - L_1139_ - 54
				end
				L_1138_.Position = UDim2.new(
0,
L_1137_.AbsolutePosition.X + L_1137_.AbsoluteSize.X,
0,
L_1137_.AbsolutePosition.Y + L_1137_.AbsoluteSize.Y - L_1141_ + L_1126_arg2.MenuPadding
)
			end
			local L_1132_
			function L_1129_.Display(L_1142_arg0)
				local L_1143_ = L_1125_arg1.Values
				local L_1144_ = ""
				if L_1125_arg1.Multi then
					for L_1145_forvar0, L_1146_forvar1 in next, L_1143_ do
						local L_1147_ = typeof(L_1146_forvar1) == "table" and L_1146_forvar1.Title or L_1146_forvar1
						if table.find(L_1125_arg1.Value, L_1147_) then
							L_1144_ = L_1144_ .. L_1147_ .. ", "
						end
					end
					L_1144_ = L_1144_:sub(1, #L_1144_ - 2)
				else
					L_1144_ = typeof(L_1125_arg1.Value) == "table" and L_1125_arg1.Value.Title or L_1125_arg1.Value or ""
				end
				L_1125_arg1.UIElements.Dropdown.Frame.Frame.TextLabel.Text = (L_1144_ == "" and "--" or L_1144_)
			end
			function L_1129_.Refresh(L_1148_arg0, L_1149_arg1)
				for L_1151_forvar0, L_1152_forvar1 in next, L_1125_arg1.UIElements.Menu.Frame.ScrollingFrame:GetChildren() do
					if not L_1152_forvar1:IsA"UIListLayout" then
						L_1152_forvar1:Destroy()
					end
				end
				L_1125_arg1.Tabs = {}
				if L_1125_arg1.SearchBarEnabled then
					if not L_1132_ then
						L_1132_ = L_1120_("Search...", "search", L_1125_arg1.UIElements.Menu, nil, function(L_1153_arg0)
							for L_1154_forvar0, L_1155_forvar1 in next, L_1125_arg1.Tabs do
								if string.find(string.lower(L_1155_forvar1.Name), string.lower(L_1153_arg0), 1, true) then
									L_1155_forvar1.UIElements.TabItem.Visible = true
								else
									L_1155_forvar1.UIElements.TabItem.Visible = false
								end
								L_1131_func()
								L_1130_func()
							end
						end, true)
						L_1132_.Size = UDim2.new(1, 0, 0, L_1126_arg2.SearchBarHeight)
						L_1132_.Position = UDim2.new(0, 0, 0, 0)
						L_1132_.Name = "SearchBar"
					end
				end
				for L_1156_forvar0, L_1157_forvar1 in next, L_1149_arg1 do
					local L_1158_ = {
						Name = typeof(L_1157_forvar1) == "table" and L_1157_forvar1.Title or L_1157_forvar1,
						Icon = typeof(L_1157_forvar1) == "table" and L_1157_forvar1.Icon or nil,
						Original = L_1157_forvar1,
						Selected = false,
						UIElements = {},
					}
					local L_1159_
					if L_1158_.Icon then
						L_1159_ = L_1121_.Image(
L_1158_.Icon,
L_1158_.Icon,
0,
L_1124_arg0.Window.Folder,
"Dropdown",
true
)
						L_1159_.Size = UDim2.new(0, L_1126_arg2.TabIcon, 0, L_1126_arg2.TabIcon)
						L_1159_.ImageLabel.ImageTransparency = .2
						L_1158_.UIElements.TabIcon = L_1159_
					end
					L_1158_.UIElements.TabItem = L_1121_.NewRoundFrame(L_1126_arg2.MenuCorner - L_1126_arg2.MenuPadding, "Squircle", {
						Size = UDim2.new(1, 0, 0, 36),
						ImageTransparency = 1,
						Parent = L_1125_arg1.UIElements.Menu.Frame.ScrollingFrame,
						ImageColor3 = Color3.new(1, 1, 1),
					}, {
						L_1121_.NewRoundFrame(L_1126_arg2.MenuCorner - L_1126_arg2.MenuPadding, "SquircleOutline", {
							Size = UDim2.new(1, 0, 1, 0),
							ImageColor3 = Color3.new(1, 1, 1),
							ImageTransparency = 1,
							Name = "Highlight",
						}, {
							L_1122_("UIGradient", {
								Rotation = 80,
								Color = ColorSequence.new{
									ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
									ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
									ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
								},
								Transparency = NumberSequence.new{
									NumberSequenceKeypoint.new(0.0, 0.1),
									NumberSequenceKeypoint.new(0.5, 1),
									NumberSequenceKeypoint.new(1.0, 0.1),
								}
							}),
						}),
						L_1122_("Frame", {
							Size = UDim2.new(1, 0, 1, 0),
							BackgroundTransparency = 1,
						}, {
							L_1122_("UIListLayout", {
								Padding = UDim.new(0, L_1126_arg2.TabPadding),
								FillDirection = "Horizontal",
								VerticalAlignment = "Center",
							}),
							L_1122_("UIPadding", {
								PaddingLeft = UDim.new(0, L_1126_arg2.TabPadding),
								PaddingRight = UDim.new(0, L_1126_arg2.TabPadding),
							}),
							L_1122_("UICorner", {
								CornerRadius = UDim.new(0, L_1126_arg2.MenuCorner - L_1126_arg2.MenuPadding)
							}),
							L_1159_,
							L_1122_("TextLabel", {
								Text = L_1158_.Name,
								TextXAlignment = "Left",
								FontFace = Font.new(L_1121_.Font, Enum.FontWeight.Regular),
								ThemeTag = {
									TextColor3 = "Text",
									BackgroundColor3 = "Text"
								},
								TextSize = 15,
								BackgroundTransparency = 1,
								TextTransparency = .4,
								LayoutOrder = 999,
								AutomaticSize = "Y",
								Size = UDim2.new(1, L_1159_ and -L_1126_arg2.TabPadding - L_1126_arg2.TabIcon or 0, 0, 0),
								AnchorPoint = Vector2.new(0, 0.5),
								Position = UDim2.new(0, 0, 0.5, 0),
							})
						})
					}, true)
					if L_1125_arg1.Multi then
						L_1158_.Selected = table.find(L_1125_arg1.Value or {}, L_1158_.Name)
					else
						L_1158_.Selected = typeof(L_1125_arg1.Value) == "table" and L_1125_arg1.Value.Title == L_1158_.Name
or L_1125_arg1.Value == L_1158_.Name
					end
					if L_1158_.Selected then
						L_1158_.UIElements.TabItem.ImageTransparency = .95
						L_1158_.UIElements.TabItem.Highlight.ImageTransparency = .75
						L_1158_.UIElements.TabItem.Frame.TextLabel.TextTransparency = 0
						if L_1158_.UIElements.TabIcon then
							L_1158_.UIElements.TabIcon.ImageLabel.ImageTransparency = 0
						end
					end
					L_1125_arg1.Tabs[L_1156_forvar0] = L_1158_
					L_1129_:Display()
					local function L_1160_func()
						L_1129_:Display()
						task.spawn(function()
							L_1121_.SafeCallback(L_1125_arg1.Callback, L_1125_arg1.Value)
						end)
					end
					L_1121_.AddSignal(L_1158_.UIElements.TabItem.MouseButton1Click, function()
						if L_1128_arg4 == "Dropdown" then
							if L_1125_arg1.Multi then
								if not L_1158_.Selected then
									L_1158_.Selected = true
									L_1123_(L_1158_.UIElements.TabItem, 0.1, {
										ImageTransparency = .95
									}):Play()
									L_1123_(L_1158_.UIElements.TabItem.Highlight, 0.1, {
										ImageTransparency = .75
									}):Play()
									L_1123_(L_1158_.UIElements.TabItem.Frame.TextLabel, 0.1, {
										TextTransparency = 0
									}):Play()
									if L_1158_.UIElements.TabIcon then
										L_1123_(L_1158_.UIElements.TabIcon.ImageLabel, 0.1, {
											ImageTransparency = 0
										}):Play()
									end
									table.insert(L_1125_arg1.Value, L_1158_.Original)
								else
									if not L_1125_arg1.AllowNone and #L_1125_arg1.Value == 1 then
										return
									end
									L_1158_.Selected = false
									L_1123_(L_1158_.UIElements.TabItem, 0.1, {
										ImageTransparency = 1
									}):Play()
									L_1123_(L_1158_.UIElements.TabItem.Highlight, 0.1, {
										ImageTransparency = 1
									}):Play()
									L_1123_(L_1158_.UIElements.TabItem.Frame.TextLabel, 0.1, {
										TextTransparency = .4
									}):Play()
									if L_1158_.UIElements.TabIcon then
										L_1123_(L_1158_.UIElements.TabIcon.ImageLabel, 0.1, {
											ImageTransparency = .2
										}):Play()
									end
									for L_1161_forvar0, L_1162_forvar1 in ipairs(L_1125_arg1.Value) do
										if typeof(L_1162_forvar1) == "table" and (L_1162_forvar1.Title == L_1158_.Name) or (L_1162_forvar1 == L_1158_.Name) then
											table.remove(L_1125_arg1.Value, L_1161_forvar0)
											break
										end
									end
								end
							else
								for L_1163_forvar0, L_1164_forvar1 in next, L_1125_arg1.Tabs do
									L_1123_(L_1164_forvar1.UIElements.TabItem, 0.1, {
										ImageTransparency = 1
									}):Play()
									L_1123_(L_1164_forvar1.UIElements.TabItem.Highlight, 0.1, {
										ImageTransparency = 1
									}):Play()
									L_1123_(L_1164_forvar1.UIElements.TabItem.Frame.TextLabel, 0.1, {
										TextTransparency = .4
									}):Play()
									if L_1164_forvar1.UIElements.TabIcon then
										L_1123_(L_1164_forvar1.UIElements.TabIcon.ImageLabel, 0.1, {
											ImageTransparency = .2
										}):Play()
									end
									L_1164_forvar1.Selected = false
								end
								L_1158_.Selected = true
								L_1123_(L_1158_.UIElements.TabItem, 0.1, {
									ImageTransparency = .95
								}):Play()
								L_1123_(L_1158_.UIElements.TabItem.Highlight, 0.1, {
									ImageTransparency = .75
								}):Play()
								L_1123_(L_1158_.UIElements.TabItem.Frame.TextLabel, 0.1, {
									TextTransparency = 0
								}):Play()
								if L_1158_.UIElements.TabIcon then
									L_1123_(L_1158_.UIElements.TabIcon.ImageLabel, 0.1, {
										ImageTransparency = 0
									}):Play()
								end
								L_1125_arg1.Value = L_1158_.Original
							end
							L_1160_func()
						end
					end)
					L_1130_func()
					L_1131_func()
				end
				local L_1150_ = 0
				for L_1165_forvar0, L_1166_forvar1 in next, L_1125_arg1.Tabs do
					if L_1166_forvar1.UIElements.TabItem.Frame.TextLabel then
						local L_1167_ = L_1166_forvar1.UIElements.TabItem.Frame.TextLabel.TextBounds.X
						L_1150_ = math.max(L_1150_, L_1167_)
					end
				end
				L_1125_arg1.UIElements.MenuCanvas.Size = UDim2.new(0, L_1150_ + 6 + 6 + 5 + 5 + 18 + 6 + 6, L_1125_arg1.UIElements.MenuCanvas.Size.Y.Scale, L_1125_arg1.UIElements.MenuCanvas.Size.Y.Offset)
			end
			L_1129_:Refresh(L_1125_arg1.Values)
			function L_1129_.Select(L_1168_arg0, L_1169_arg1)
				if L_1169_arg1 then
					L_1125_arg1.Value = L_1169_arg1
				else
					if L_1125_arg1.Multi then
						L_1125_arg1.Value = {}
					else
						L_1125_arg1.Value = nil
					end
				end
				L_1129_:Refresh(L_1125_arg1.Values)
			end
			L_1131_func()
			L_1130_func()
			function L_1129_.Open(L_1170_arg0)
				if L_1127_arg3 then
					L_1125_arg1.UIElements.Menu.Visible = true
					L_1125_arg1.UIElements.MenuCanvas.Visible = true
					L_1125_arg1.UIElements.MenuCanvas.Active = true
					L_1125_arg1.UIElements.Menu.Size = UDim2.new(
1, 0,
0, 0
)
					L_1123_(L_1125_arg1.UIElements.Menu, 0.1, {
						Size = UDim2.new(
1, 0,
1, 0
),
						ImageTransparency = 0.05
					}, Enum.EasingStyle.Quart, Enum.EasingDirection.Out):Play()
					task.spawn(function()
						task.wait(.1)
						L_1125_arg1.Opened = true
					end)
					UpdatePosition()
				end
			end
			function L_1129_.Close(L_1171_arg0)
				L_1125_arg1.Opened = false
				L_1123_(L_1125_arg1.UIElements.Menu, 0.25, {
					Size = UDim2.new(
1, 0,
0, 0
),
					ImageTransparency = 1,
				}, Enum.EasingStyle.Quart, Enum.EasingDirection.Out):Play()
				task.spawn(function()
					task.wait(.1)
					L_1125_arg1.UIElements.Menu.Visible = false
				end)
				task.spawn(function()
					task.wait(.25)
					L_1125_arg1.UIElements.MenuCanvas.Visible = false
					L_1125_arg1.UIElements.MenuCanvas.Active = false
				end)
			end
			L_1121_.AddSignal(L_1125_arg1.UIElements.Dropdown.MouseButton1Click, function()
				L_1129_:Open()
			end)
			L_1121_.AddSignal(L_1116_.InputBegan, function(L_1172_arg0)
				if L_1172_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_1172_arg0.UserInputType == Enum.UserInputType.Touch then
					local L_1173_ = L_1125_arg1.UIElements.MenuCanvas
					local L_1174_, L_1175_ = L_1173_.AbsolutePosition, L_1173_.AbsoluteSize
					local L_1176_ = L_1125_arg1.UIElements.Dropdown
					local L_1177_ = L_1176_.AbsolutePosition
					local L_1178_ = L_1176_.AbsoluteSize
					local L_1179_ =
L_1117_.X >= L_1177_.X and
L_1117_.X <= L_1177_.X + L_1178_.X and
L_1117_.Y >= L_1177_.Y and
L_1117_.Y <= L_1177_.Y + L_1178_.Y
					local L_1180_ =
L_1117_.X >= L_1174_.X and
L_1117_.X <= L_1174_.X + L_1175_.X and
L_1117_.Y >= L_1174_.Y and
L_1117_.Y <= L_1174_.Y + L_1175_.Y
					if L_1124_arg0.Window.CanDropdown and L_1125_arg1.Opened and not L_1179_ and not L_1180_ then
						L_1129_:Close()
					end
				end
			end)
			L_1121_.AddSignal(L_1125_arg1.UIElements.Dropdown:GetPropertyChangedSignal"AbsolutePosition", UpdatePosition)
			return L_1129_
		end
		return L_1115_
	end
	function L_1_.I()
		game:GetService"UserInputService"
		game:GetService"Players".LocalPlayer:GetMouse()
		local L_1181_ =
game:GetService"Workspace".CurrentCamera
		local L_1182_ = L_1_.load'a'
		local L_1183_ = L_1182_.New
		local L_1184_ =
L_1182_.Tween
		local L_1185_ = L_1_.load's'.New
		local L_1186_ = L_1_.load'j'
.New
		local L_1187_ = L_1_.load'H'.New
		local L_1188_ =

workspace.CurrentCamera
		local L_1189_ = {
			UICorner = 10,
			UIPadding = 12,
			MenuCorner = 15,
			MenuPadding = 5,
			TabPadding = 10,
			SearchBarHeight = 39,
			TabIcon = 18,
		}
		function L_1189_.New(L_1190_arg0, L_1191_arg1)
			local L_1192_ = {
				__type = "Dropdown",
				Title = L_1191_arg1.Title or "Dropdown",
				Desc = L_1191_arg1.Desc or nil,
				Locked = L_1191_arg1.Locked or false,
				Values = L_1191_arg1.Values or {},
				MenuWidth = L_1191_arg1.MenuWidth or 170,
				Value = L_1191_arg1.Value,
				AllowNone = L_1191_arg1.AllowNone,
				SearchBarEnabled = L_1191_arg1.SearchBarEnabled or false,
				Multi = L_1191_arg1.Multi,
				Callback = L_1191_arg1.Callback or function()
				end,
				UIElements = {},
				Opened = false,
				Tabs = {},
				Width = 150,
			}
			if L_1192_.Multi and not L_1192_.Value then
				L_1192_.Value = {}
			end
			local L_1193_ = true
			L_1192_.DropdownFrame = L_1_.load'y'{
				Title = L_1192_.Title,
				Desc = L_1192_.Desc,
				Parent = L_1191_arg1.Parent,
				TextOffset = L_1192_.Width,
				Hover = false,
				Tab = L_1191_arg1.Tab,
				Index = L_1191_arg1.Index,
				Window = L_1191_arg1.Window,
				ElementTable = L_1192_,
			}
			L_1192_.UIElements.Dropdown = L_1185_("", nil, L_1192_.DropdownFrame.UIElements.Main, nil, L_1191_arg1.Window.NewElements and 12 or 10)
			L_1192_.UIElements.Dropdown.Frame.Frame.TextLabel.TextTruncate = "AtEnd"
			L_1192_.UIElements.Dropdown.Frame.Frame.TextLabel.Size = UDim2.new(1, L_1192_.UIElements.Dropdown.Frame.Frame.TextLabel.Size.X.Offset - 18 - 12 - 12, 0, 0)
			L_1192_.UIElements.Dropdown.Size = UDim2.new(0, L_1192_.Width, 0, 36)
			L_1192_.UIElements.Dropdown.Position = UDim2.new(1, 0, L_1191_arg1.Window.NewElements and 0 or 0.5, 0)
			L_1192_.UIElements.Dropdown.AnchorPoint = Vector2.new(1, L_1191_arg1.Window.NewElements and 0 or 0.5)
			L_1183_("ImageLabel", {
				Image = L_1182_.Icon"chevrons-up-down"[1],
				ImageRectOffset = L_1182_.Icon"chevrons-up-down"[2].ImageRectPosition,
				ImageRectSize = L_1182_.Icon"chevrons-up-down"[2].ImageRectSize,
				Size = UDim2.new(0, 18, 0, 18),
				Position = UDim2.new(1, -12, 0.5, 0),
				ThemeTag = {
					ImageColor3 = "Icon"
				},
				AnchorPoint = Vector2.new(1, 0.5),
				Parent = L_1192_.UIElements.Dropdown.Frame
			})
			L_1192_.DropdownMenu = L_1187_(L_1191_arg1, L_1192_, L_1189_, L_1193_, "Dropdown")
			L_1192_.Display = L_1192_.DropdownMenu.Display
			L_1192_.Refresh = L_1192_.DropdownMenu.Refresh
			L_1192_.Select = L_1192_.DropdownMenu.Select
			L_1192_.Open = L_1192_.DropdownMenu.Open
			L_1192_.Close = L_1192_.DropdownMenu.Close
			function L_1192_.Lock(L_1194_arg0)
				L_1192_.Locked = true
				L_1193_ = false
				return L_1192_.DropdownFrame:Lock()
			end
			function L_1192_.Unlock(L_1195_arg0)
				L_1192_.Locked = false
				L_1193_ = true
				return L_1192_.DropdownFrame:Unlock()
			end
			if L_1192_.Locked then
				L_1192_:Lock()
			end
			return L_1192_.__type, L_1192_
		end
		return L_1189_
	end
	function L_1_.J()
		local L_1196_ = {}
		local L_1197_ = {
			lua = {
				"and",
				"break",
				"or",
				"else",
				"elseif",
				"if",
				"then",
				"until",
				"repeat",
				"while",
				"do",
				"for",
				"in",
				"end",
				"local",
				"return",
				"function",
				"export",
			},
			rbx = {
				"game",
				"workspace",
				"script",
				"math",
				"string",
				"table",
				"task",
				"wait",
				"select",
				"next",
				"Enum",
				"tick",
				"assert",
				"shared",
				"loadstring",
				"tonumber",
				"tostring",
				"type",
				"typeof",
				"unpack",
				"Instance",
				"CFrame",
				"Vector3",
				"Vector2",
				"Color3",
				"UDim",
				"UDim2",
				"Ray",
				"BrickColor",
				"OverlapParams",
				"RaycastParams",
				"Axes",
				"Random",
				"Region3",
				"Rect",
				"TweenInfo",
				"collectgarbage",
				"not",
				"utf8",
				"pcall",
				"xpcall",
				"_G",
				"setmetatable",
				"getmetatable",
				"os",
				"pairs",
				"ipairs"
			},
			operators = {
				"#",
				"+",
				"-",
				"*",
				"%",
				"/",
				"^",
				"=",
				"~",
				"=",
				"<",
				">",
			}
		}
		local L_1198_ = {
			numbers = Color3.fromHex"#FAB387",
			boolean = Color3.fromHex"#FAB387",
			operator = Color3.fromHex"#94E2D5",
			lua = Color3.fromHex"#CBA6F7",
			rbx = Color3.fromHex"#F38BA8",
			str = Color3.fromHex"#A6E3A1",
			comment = Color3.fromHex"#9399B2",
			null = Color3.fromHex"#F38BA8",
			call = Color3.fromHex"#89B4FA",
			self_call = Color3.fromHex"#89B4FA",
			local_property = Color3.fromHex"#CBA6F7",
		}
		local function L_1199_func(L_1204_arg0)
			local L_1205_ = {}
			for L_1206_forvar0, L_1207_forvar1 in ipairs(L_1204_arg0) do
				L_1205_[L_1207_forvar1] = true
			end
			return L_1205_
		end
		local L_1200_ = L_1199_func(L_1197_.lua)
		local L_1201_ = L_1199_func(L_1197_.rbx)
		local L_1202_ = L_1199_func(L_1197_.operators)
		local function L_1203_func(L_1208_arg0, L_1209_arg1)
			local L_1210_ = L_1208_arg0[L_1209_arg1]
			if L_1198_[L_1210_ .. "_color"] then
				return L_1198_[L_1210_ .. "_color"]
			end
			if tonumber(L_1210_) then
				return L_1198_.numbers
			elseif L_1210_ == "nil" then
				return L_1198_.null
			elseif L_1210_:sub(1, 2) == "--" then
				return L_1198_.comment
			elseif L_1202_[L_1210_] then
				return L_1198_.operator
			elseif L_1200_[L_1210_] then
				return L_1198_.lua
			elseif L_1201_[L_1210_] then
				return L_1198_.rbx
			elseif L_1210_:sub(1, 1) == "\"" or L_1210_:sub(1, 1) == "\'" then
				return L_1198_.str
			elseif L_1210_ == "true" or L_1210_ == "false" then
				return L_1198_.boolean
			end
			if L_1208_arg0[L_1209_arg1 + 1] == "(" then
				if L_1208_arg0[L_1209_arg1 - 1] == ":" then
					return L_1198_.self_call
				end
				return L_1198_.call
			end
			if L_1208_arg0[L_1209_arg1 - 1] == "." then
				if L_1208_arg0[L_1209_arg1 - 2] == "Enum" then
					return L_1198_.rbx
				end
				return L_1198_.local_property
			end
		end
		function L_1196_.run(L_1211_arg0)
			local L_1212_ = {}
			local L_1213_ = ""
			local L_1214_ = false
			local L_1215_ = false
			local L_1216_ = false
			for L_1218_forvar0 = 1, #L_1211_arg0 do
				local L_1219_ = L_1211_arg0:sub(L_1218_forvar0, L_1218_forvar0)
				if L_1215_ then
					if L_1219_ == "\n" and not L_1216_ then
						table.insert(L_1212_, L_1213_)
						table.insert(L_1212_, L_1219_)
						L_1213_ = ""
						L_1215_ = false
					elseif L_1211_arg0:sub(L_1218_forvar0 - 1, L_1218_forvar0) == "]]" and L_1216_ then
						L_1213_ = L_1213_ .. "]"
						table.insert(L_1212_, L_1213_)
						L_1213_ = ""
						L_1215_ = false
						L_1216_ = false
					else
						L_1213_ = L_1213_ .. L_1219_
					end
				elseif L_1214_ then
					if L_1219_ == L_1214_ and L_1211_arg0:sub(L_1218_forvar0 - 1, L_1218_forvar0 - 1) ~= "\\" or L_1219_ == "\n" then
						L_1213_ = L_1213_ .. L_1219_
						L_1214_ = false
					else
						L_1213_ = L_1213_ .. L_1219_
					end
				else
					if L_1211_arg0:sub(L_1218_forvar0, L_1218_forvar0 + 1) == "--" then
						table.insert(L_1212_, L_1213_)
						L_1213_ = "-"
						L_1215_ = true
						L_1216_ = L_1211_arg0:sub(L_1218_forvar0 + 2, L_1218_forvar0 + 3) == "[["
					elseif L_1219_ == "\"" or L_1219_ == "\'" then
						table.insert(L_1212_, L_1213_)
						L_1213_ = L_1219_
						L_1214_ = L_1219_
					elseif L_1202_[L_1219_] then
						table.insert(L_1212_, L_1213_)
						table.insert(L_1212_, L_1219_)
						L_1213_ = ""
					elseif L_1219_:match"[%w_]" then
						L_1213_ = L_1213_ .. L_1219_
					else
						table.insert(L_1212_, L_1213_)
						table.insert(L_1212_, L_1219_)
						L_1213_ = ""
					end
				end
			end
			table.insert(L_1212_, L_1213_)
			local L_1217_ = {}
			for L_1220_forvar0, L_1221_forvar1 in ipairs(L_1212_) do
				local L_1222_ = L_1203_func(L_1212_, L_1220_forvar0)
				if L_1222_ then
					local L_1223_ = string.format("<font color = \"#%s\">%s</font>", L_1222_:ToHex(), L_1221_forvar1:gsub("<", "&lt;"):gsub(">", "&gt;"))
					table.insert(L_1217_, L_1223_)
				else
					table.insert(L_1217_, L_1221_forvar1)
				end
			end
			return table.concat(L_1217_)
		end
		return L_1196_
	end
	function L_1_.K()
		local L_1224_ = {}
		local L_1225_ = L_1_.load'a'
		local L_1226_ = L_1225_.New
		local L_1227_ = L_1225_.Tween
		local L_1228_ = L_1_.load'J'
		function L_1224_.New(L_1229_arg0, L_1230_arg1, L_1231_arg2, L_1232_arg3, L_1233_arg4)
			local L_1234_ = {
				Radius = 12,
				Padding = 10
			}
			local L_1235_ = L_1226_("TextLabel", {
				Text = "",
				TextColor3 = Color3.fromHex"#CDD6F4",
				TextTransparency = 0,
				TextSize = 14,
				TextWrapped = false,
				LineHeight = 1.15,
				RichText = true,
				TextXAlignment = "Left",
				Size = UDim2.new(0, 0, 0, 0),
				BackgroundTransparency = 1,
				AutomaticSize = "XY",
			}, {
				L_1226_("UIPadding", {
					PaddingTop = UDim.new(0, L_1234_.Padding + 3),
					PaddingLeft = UDim.new(0, L_1234_.Padding + 3),
					PaddingRight = UDim.new(0, L_1234_.Padding + 3),
					PaddingBottom = UDim.new(0, L_1234_.Padding + 3),
				})
			})
			L_1235_.Font = "Code"
			local L_1236_ = L_1226_("ScrollingFrame", {
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
				AutomaticCanvasSize = "X",
				ScrollingDirection = "X",
				ElasticBehavior = "Never",
				CanvasSize = UDim2.new(0, 0, 0, 0),
				ScrollBarThickness = 0,
			}, {
				L_1235_
			})
			local L_1237_ = L_1226_("TextButton", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 30, 0, 30),
				Position = UDim2.new(1, -L_1234_.Padding / 2, 0, L_1234_.Padding / 2),
				AnchorPoint = Vector2.new(1, 0),
				Visible = L_1232_arg3 and true or false,
			}, {
				L_1225_.NewRoundFrame(L_1234_.Radius - 4, "Squircle", {
					ImageColor3 = Color3.fromHex"#ffffff",
					ImageTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Name = "Button",
				}, {
					L_1226_("UIScale", {
						Scale = 1,
					}),
					L_1226_("ImageLabel", {
						Image = L_1225_.Icon"copy"[1],
						ImageRectSize = L_1225_.Icon"copy"[2].ImageRectSize,
						ImageRectOffset = L_1225_.Icon"copy"[2].ImageRectPosition,
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						Size = UDim2.new(0, 12, 0, 12),
						ImageColor3 = Color3.fromHex"#ffffff",
						ImageTransparency = .1,
					})
				})
			})
			L_1225_.AddSignal(L_1237_.MouseEnter, function()
				L_1227_(L_1237_.Button, .05, {
					ImageTransparency = .95
				}):Play()
				L_1227_(L_1237_.Button.UIScale, .05, {
					Scale = .9
				}):Play()
			end)
			L_1225_.AddSignal(L_1237_.InputEnded, function()
				L_1227_(L_1237_.Button, .08, {
					ImageTransparency = 1
				}):Play()
				L_1227_(L_1237_.Button.UIScale, .08, {
					Scale = 1
				}):Play()
			end)
			local L_1238_ = L_1225_.NewRoundFrame(L_1234_.Radius, "Squircle", {
				ImageColor3 = Color3.fromHex"#212121",
				ImageTransparency = .035,
				Size = UDim2.new(1, 0, 0, 20 + (L_1234_.Padding * 2)),
				AutomaticSize = "Y",
				Parent = L_1231_arg2,
			}, {
				L_1225_.NewRoundFrame(L_1234_.Radius, "SquircleOutline", {
					Size = UDim2.new(1, 0, 1, 0),
					ImageColor3 = Color3.fromHex"#ffffff",
					ImageTransparency = .955,
				}),
				L_1226_("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
				}, {
					L_1225_.NewRoundFrame(L_1234_.Radius, "Squircle-TL-TR", {
						ImageColor3 = Color3.fromHex"#ffffff",
						ImageTransparency = .96,
						Size = UDim2.new(1, 0, 0, 20 + (L_1234_.Padding * 2)),
						Visible = L_1230_arg1 and true or false
					}, {
						L_1226_("ImageLabel", {
							Size = UDim2.new(0, 18, 0, 18),
							BackgroundTransparency = 1,
							Image = "rbxassetid://132464694294269",
							ImageColor3 = Color3.fromHex"#ffffff",
							ImageTransparency = .2,
						}),
						L_1226_("TextLabel", {
							Text = L_1230_arg1,
							TextColor3 = Color3.fromHex"#ffffff",
							TextTransparency = .2,
							TextSize = 16,
							AutomaticSize = "Y",
							FontFace = Font.new(L_1225_.Font, Enum.FontWeight.Medium),
							TextXAlignment = "Left",
							BackgroundTransparency = 1,
							TextTruncate = "AtEnd",
							Size = UDim2.new(1, L_1237_ and -20 - (L_1234_.Padding * 2), 0, 0)
						}),
						L_1226_("UIPadding", {
							PaddingLeft = UDim.new(0, L_1234_.Padding + 3),
							PaddingRight = UDim.new(0, L_1234_.Padding + 3),
						}),
						L_1226_("UIListLayout", {
							Padding = UDim.new(0, L_1234_.Padding),
							FillDirection = "Horizontal",
							VerticalAlignment = "Center",
						})
					}),
					L_1236_,
					L_1226_("UIListLayout", {
						Padding = UDim.new(0, 0),
						FillDirection = "Vertical",
					})
				}),
				L_1237_,
			})
			L_1234_.CodeFrame = L_1238_
			L_1225_.AddSignal(L_1235_:GetPropertyChangedSignal"TextBounds", function()
				L_1236_.Size = UDim2.new(1, 0, 0, (L_1235_.TextBounds.Y / (L_1233_arg4 or 1)) + ((L_1234_.Padding + 3) * 2))
			end)
			function L_1234_.Set(L_1239_arg0)
				L_1235_.Text = L_1228_.run(L_1239_arg0)
			end
			function L_1234_.Destroy()
				L_1238_:Destroy()
				L_1234_ = nil
			end
			L_1234_.Set(L_1229_arg0)
			L_1225_.AddSignal(L_1237_.MouseButton1Click, function()
				if L_1232_arg3 then
					L_1232_arg3()
					local L_1240_ = L_1225_.Icon"check"
					L_1237_.Button.ImageLabel.Image = L_1240_[1]
					L_1237_.Button.ImageLabel.ImageRectSize = L_1240_[2].ImageRectSize
					L_1237_.Button.ImageLabel.ImageRectOffset = L_1240_[2].ImageRectPosition
					task.wait(1)
					local L_1241_ = L_1225_.Icon"copy"
					L_1237_.Button.ImageLabel.Image = L_1241_[1]
					L_1237_.Button.ImageLabel.ImageRectSize = L_1241_[2].ImageRectSize
					L_1237_.Button.ImageLabel.ImageRectOffset = L_1241_[2].ImageRectPosition
				end
			end)
			return L_1234_
		end
		return L_1224_
	end
	function L_1_.L()
		local L_1242_ = L_1_.load'a'
		local L_1243_ =
L_1242_.New
		local L_1244_ = L_1_.load'K'
		local L_1245_ = {}
		function L_1245_.New(L_1246_arg0, L_1247_arg1)
			local L_1248_ = {
				__type = "Code",
				Title = L_1247_arg1.Title,
				Code = L_1247_arg1.Code,
				OnCopy = L_1247_arg1.OnCopy,
			}
			local L_1249_ = not L_1248_.Locked
			local L_1250_ = L_1244_.New(L_1248_.Code, L_1248_.Title, L_1247_arg1.Parent, function()
				if L_1249_ then
					local L_1251_ = L_1248_.Title or "code"
					local L_1252_, L_1253_ = pcall(function()
						toclipboard(L_1248_.Code)
						if L_1248_.OnCopy then
							L_1248_.OnCopy()
						end
					end)
					if not L_1252_ then
						L_1247_arg1.WindUI:Notify{
							Title = "Error",
							Content = "The " .. L_1251_ .. " is not copied. Error: " .. L_1253_,
							Icon = "x",
							Duration = 5,
						}
					end
				end
			end, L_1247_arg1.WindUI.UIScale, L_1248_)
			function L_1248_.SetCode(L_1254_arg0, L_1255_arg1)
				L_1250_.Set(L_1255_arg1)
			end
			function L_1248_.Destroy(L_1256_arg0)
				L_1250_.Destroy()
				L_1248_ = nil
			end
			L_1248_.ElementFrame = L_1250_.CodeFrame
			return L_1248_.__type, L_1248_
		end
		return L_1245_
	end
	function L_1_.M()
		local L_1257_ = L_1_.load'a'
		local L_1258_ = L_1257_.New
		local L_1259_ =
L_1257_.Tween
		local L_1260_ = game:GetService"UserInputService"
		game:GetService"TouchInputService"
		local L_1261_ = game:GetService"RunService"
		local L_1262_ = game:GetService"Players"
		local L_1263_ = L_1261_.RenderStepped
		local L_1264_ = L_1262_.LocalPlayer
		local L_1265_ = L_1264_:GetMouse()
		local L_1266_ = L_1_.load'i'.New
		local L_1267_ = L_1_.load'j'.New
		local L_1268_ = {
			UICorner = 8,
			UIPadding = 8
		}
		function L_1268_.Colorpicker(L_1269_arg0, L_1270_arg1, L_1271_arg2, L_1272_arg3)
			local L_1273_ = {
				__type = "Colorpicker",
				Title = L_1270_arg1.Title,
				Desc = L_1270_arg1.Desc,
				Default = L_1270_arg1.Default,
				Callback = L_1270_arg1.Callback,
				Transparency = L_1270_arg1.Transparency,
				UIElements = L_1270_arg1.UIElements,
				TextPadding = 10,
			}
			function L_1273_.SetHSVFromRGB(L_1302_arg0, L_1303_arg1)
				local L_1304_, L_1305_, L_1306_ = Color3.toHSV(L_1303_arg1)
				L_1273_.Hue = L_1304_
				L_1273_.Sat = L_1305_
				L_1273_.Vib = L_1306_
			end
			L_1273_:SetHSVFromRGB(L_1273_.Default)
			local L_1274_ = L_1_.load'k'.Init(L_1271_arg2)
			local L_1275_ = L_1274_.Create()
			L_1273_.ColorpickerFrame = L_1275_
			L_1275_.UIElements.Main.Size = UDim2.new(1, 0, 0, 0)
			local L_1276_, L_1277_, L_1278_ = L_1273_.Hue, L_1273_.Sat, L_1273_.Vib
			L_1273_.UIElements.Title = L_1258_("TextLabel", {
				Text = L_1273_.Title,
				TextSize = 20,
				FontFace = Font.new(L_1257_.Font, Enum.FontWeight.SemiBold),
				TextXAlignment = "Left",
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = "Y",
				ThemeTag = {
					TextColor3 = "Text"
				},
				BackgroundTransparency = 1,
				Parent = L_1275_.UIElements.Main
			}, {
				L_1258_("UIPadding", {
					PaddingTop = UDim.new(0, L_1273_.TextPadding / 2),
					PaddingLeft = UDim.new(0, L_1273_.TextPadding / 2),
					PaddingRight = UDim.new(0, L_1273_.TextPadding / 2),
					PaddingBottom = UDim.new(0, L_1273_.TextPadding / 2),
				})
			})
			local L_1279_ = L_1258_("Frame", {
				Size = UDim2.new(0, 14, 0, 14),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0, 0),
				Parent = HueDragHolder,
				BackgroundColor3 = L_1273_.Default
			}, {
				L_1258_("UIStroke", {
					Thickness = 2,
					Transparency = .1,
					ThemeTag = {
						Color = "Text",
					},
				}),
				L_1258_("UICorner", {
					CornerRadius = UDim.new(1, 0),
				})
			})
			L_1273_.UIElements.SatVibMap = L_1258_("ImageLabel", {
				Size = UDim2.fromOffset(160, 158),
				Position = UDim2.fromOffset(0, 40 + L_1273_.TextPadding),
				Image = "rbxassetid://4155801252",
				BackgroundColor3 = Color3.fromHSV(L_1276_, 1, 1),
				BackgroundTransparency = 0,
				Parent = L_1275_.UIElements.Main,
			}, {
				L_1258_("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),
				L_1257_.NewRoundFrame(8, "SquircleOutline", {
					ThemeTag = {
						ImageColor3 = "Outline",
					},
					Size = UDim2.new(1, 0, 1, 0),
					ImageTransparency = .85,
					ZIndex = 99999,
				}, {
					L_1258_("UIGradient", {
						Rotation = 45,
						Color = ColorSequence.new{
							ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
						},
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0.0, 0.1),
							NumberSequenceKeypoint.new(0.5, 1),
							NumberSequenceKeypoint.new(1.0, 0.1),
						}
					})
				}),
				L_1279_,
			})
			L_1273_.UIElements.Inputs = L_1258_("Frame", {
				AutomaticSize = "XY",
				Size = UDim2.new(0, 0, 0, 0),
				Position = UDim2.fromOffset(L_1273_.Transparency and 240 or 210, 40 + L_1273_.TextPadding),
				BackgroundTransparency = 1,
				Parent = L_1275_.UIElements.Main
			}, {
				L_1258_("UIListLayout", {
					Padding = UDim.new(0, 4),
					FillDirection = "Vertical",
				})
			})
			local L_1280_ = L_1258_("Frame", {
				BackgroundColor3 = L_1273_.Default,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = L_1273_.Transparency,
			}, {
				L_1258_("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),
			})
			L_1258_("ImageLabel", {
				Image = "http://www.roblox.com/asset/?id=14204231522",
				ImageTransparency = 0.45,
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.fromOffset(40, 40),
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(85, 208 + L_1273_.TextPadding),
				Size = UDim2.fromOffset(75, 24),
				Parent = L_1275_.UIElements.Main,
			}, {
				L_1258_("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),
				L_1257_.NewRoundFrame(8, "SquircleOutline", {
					ThemeTag = {
						ImageColor3 = "Outline",
					},
					Size = UDim2.new(1, 0, 1, 0),
					ImageTransparency = .85,
					ZIndex = 99999,
				}, {
					L_1258_("UIGradient", {
						Rotation = 60,
						Color = ColorSequence.new{
							ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
						},
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0.0, 0.1),
							NumberSequenceKeypoint.new(0.5, 1),
							NumberSequenceKeypoint.new(1.0, 0.1),
						}
					})
				}),
				L_1280_,
			})
			local L_1281_ = L_1258_("Frame", {
				BackgroundColor3 = L_1273_.Default,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 0,
				ZIndex = 9,
			}, {
				L_1258_("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),
			})
			L_1258_("ImageLabel", {
				Image = "http://www.roblox.com/asset/?id=14204231522",
				ImageTransparency = 0.45,
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.fromOffset(40, 40),
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(0, 208 + L_1273_.TextPadding),
				Size = UDim2.fromOffset(75, 24),
				Parent = L_1275_.UIElements.Main,
			}, {
				L_1258_("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),
				L_1257_.NewRoundFrame(8, "SquircleOutline", {
					ThemeTag = {
						ImageColor3 = "Outline",
					},
					Size = UDim2.new(1, 0, 1, 0),
					ImageTransparency = .85,
					ZIndex = 99999,
				}, {
					L_1258_("UIGradient", {
						Rotation = 60,
						Color = ColorSequence.new{
							ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
						},
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0.0, 0.1),
							NumberSequenceKeypoint.new(0.5, 1),
							NumberSequenceKeypoint.new(1.0, 0.1),
						}
					})
				}),
				L_1281_,
			})
			local L_1282_ = {}
			for L_1307_forvar0 = 0, 1, 0.1 do
				table.insert(L_1282_, ColorSequenceKeypoint.new(L_1307_forvar0, Color3.fromHSV(L_1307_forvar0, 1, 1)))
			end
			local L_1283_ = L_1258_("UIGradient", {
				Color = ColorSequence.new(L_1282_),
				Rotation = 90,
			})
			local L_1284_ = L_1258_("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0),
				BackgroundTransparency = 1,
			})
			local L_1285_ = L_1258_("Frame", {
				Size = UDim2.new(0, 14, 0, 14),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0, 0),
				Parent = L_1284_,
				BackgroundColor3 = L_1273_.Default
			}, {
				L_1258_("UIStroke", {
					Thickness = 2,
					Transparency = .1,
					ThemeTag = {
						Color = "Text",
					},
				}),
				L_1258_("UICorner", {
					CornerRadius = UDim.new(1, 0),
				})
			})
			local L_1286_ = L_1258_("Frame", {
				Size = UDim2.fromOffset(6, 192),
				Position = UDim2.fromOffset(180, 40 + L_1273_.TextPadding),
				Parent = L_1275_.UIElements.Main,
			}, {
				L_1258_("UICorner", {
					CornerRadius = UDim.new(1, 0),
				}),
				L_1283_,
				L_1284_,
			})
			function CreateNewInput(L_1308_arg0, L_1309_arg1)
				local L_1310_ = L_1267_(L_1308_arg0, nil, L_1273_.UIElements.Inputs)
				L_1258_("TextLabel", {
					BackgroundTransparency = 1,
					TextTransparency = .4,
					TextSize = 17,
					FontFace = Font.new(L_1257_.Font, Enum.FontWeight.Regular),
					AutomaticSize = "XY",
					ThemeTag = {
						TextColor3 = "Placeholder",
					},
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, -12, 0.5, 0),
					Parent = L_1310_.Frame,
					Text = L_1308_arg0,
				})
				L_1258_("UIScale", {
					Parent = L_1310_,
					Scale = .85,
				})
				L_1310_.Frame.Frame.TextBox.Text = L_1309_arg1
				L_1310_.Size = UDim2.new(0, 150, 0, 42)
				return L_1310_
			end
			local function L_1287_func(L_1311_arg0)
				return {
					R = math.floor(L_1311_arg0.R * 255),
					G = math.floor(L_1311_arg0.G * 255),
					B = math.floor(L_1311_arg0.B * 255)
				}
			end
			local L_1288_ = CreateNewInput("Hex", "#" .. L_1273_.Default:ToHex())
			local L_1289_ = CreateNewInput("Red", L_1287_func(L_1273_.Default).R)
			local L_1290_ = CreateNewInput("Green", L_1287_func(L_1273_.Default).G)
			local L_1291_ = CreateNewInput("Blue", L_1287_func(L_1273_.Default).B)
			local L_1292_
			if L_1273_.Transparency then
				L_1292_ = CreateNewInput("Alpha", ((1 - L_1273_.Transparency) * 100) .. "%")
			end
			local L_1293_ = L_1258_("Frame", {
				Size = UDim2.new(1, 0, 0, 40),
				AutomaticSize = "Y",
				Position = UDim2.new(0, 0, 0, 254 + L_1273_.TextPadding),
				BackgroundTransparency = 1,
				Parent = L_1275_.UIElements.Main,
				LayoutOrder = 4,
			}, {
				L_1258_("UIListLayout", {
					Padding = UDim.new(0, 6),
					FillDirection = "Horizontal",
					HorizontalAlignment = "Right",
				}),
			})
			local L_1294_ = {
				{
					Title = "Cancel",
					Variant = "Secondary",
					Callback = function()
					end
				},
				{
					Title = "Apply",
					Icon = "chevron-right",
					Variant = "Primary",
					Callback = function()
						L_1272_arg3(Color3.fromHSV(L_1273_.Hue, L_1273_.Sat, L_1273_.Vib), L_1273_.Transparency)
					end
				}
			}
			for L_1312_forvar0, L_1313_forvar1 in next, L_1294_ do
				local L_1314_ = L_1266_(L_1313_forvar1.Title, L_1313_forvar1.Icon, L_1313_forvar1.Callback, L_1313_forvar1.Variant, L_1293_, L_1275_, false)
				L_1314_.Size = UDim2.new(0.5, -3, 0, 40)
				L_1314_.AutomaticSize = "None"
			end
			local L_1295_, L_1296_, L_1297_
			if L_1273_.Transparency then
				local L_1315_ = L_1258_("Frame", {
					Size = UDim2.new(1, 0, 1, 0),
					Position = UDim2.fromOffset(0, 0),
					BackgroundTransparency = 1,
				})
				L_1296_ = L_1258_("ImageLabel", {
					Size = UDim2.new(0, 14, 0, 14),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0, 0),
					ThemeTag = {
						BackgroundColor3 = "Text",
					},
					Parent = L_1315_,
				}, {
					L_1258_("UIStroke", {
						Thickness = 2,
						Transparency = .1,
						ThemeTag = {
							Color = "Text",
						},
					}),
					L_1258_("UICorner", {
						CornerRadius = UDim.new(1, 0),
					})
				})
				L_1297_ = L_1258_("Frame", {
					Size = UDim2.fromScale(1, 1),
				}, {
					L_1258_("UIGradient", {
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0, 0),
							NumberSequenceKeypoint.new(1, 1),
						},
						Rotation = 270,
					}),
					L_1258_("UICorner", {
						CornerRadius = UDim.new(0, 6),
					}),
				})
				L_1295_ = L_1258_("Frame", {
					Size = UDim2.fromOffset(6, 192),
					Position = UDim2.fromOffset(210, 40 + L_1273_.TextPadding),
					Parent = L_1275_.UIElements.Main,
					BackgroundTransparency = 1,
				}, {
					L_1258_("UICorner", {
						CornerRadius = UDim.new(1, 0),
					}),
					L_1258_("ImageLabel", {
						Image = "rbxassetid://14204231522",
						ImageTransparency = 0.45,
						ScaleType = Enum.ScaleType.Tile,
						TileSize = UDim2.fromOffset(40, 40),
						BackgroundTransparency = 1,
						Size = UDim2.fromScale(1, 1),
					}, {
						L_1258_("UICorner", {
							CornerRadius = UDim.new(1, 0),
						}),
					}),
					L_1297_,
					L_1315_,
				})
			end
			function L_1273_.Round(L_1316_arg0, L_1317_arg1, L_1318_arg2)
				if L_1318_arg2 == 0 then
					return math.floor(L_1317_arg1)
				end
				L_1317_arg1 = tostring(L_1317_arg1)
				return L_1317_arg1:find"%." and tonumber(L_1317_arg1:sub(1, L_1317_arg1:find"%." + L_1318_arg2)) or L_1317_arg1
			end
			function L_1273_.Update(L_1319_arg0, L_1320_arg1, L_1321_arg2)
				if L_1320_arg1 then
					L_1276_, L_1277_, L_1278_ = Color3.toHSV(L_1320_arg1)
				else
					L_1276_, L_1277_, L_1278_ = L_1273_.Hue, L_1273_.Sat, L_1273_.Vib
				end
				L_1273_.UIElements.SatVibMap.BackgroundColor3 = Color3.fromHSV(L_1276_, 1, 1)
				L_1279_.Position = UDim2.new(L_1277_, 0, 1 - L_1278_, 0)
				L_1279_.BackgroundColor3 = Color3.fromHSV(L_1276_, L_1277_, L_1278_)
				L_1281_.BackgroundColor3 = Color3.fromHSV(L_1276_, L_1277_, L_1278_)
				L_1285_.BackgroundColor3 = Color3.fromHSV(L_1276_, 1, 1)
				L_1285_.Position = UDim2.new(0.5, 0, L_1276_, 0)
				L_1288_.Frame.Frame.TextBox.Text = "#" .. Color3.fromHSV(L_1276_, L_1277_, L_1278_):ToHex()
				L_1289_.Frame.Frame.TextBox.Text = L_1287_func(Color3.fromHSV(L_1276_, L_1277_, L_1278_)).R
				L_1290_.Frame.Frame.TextBox.Text = L_1287_func(Color3.fromHSV(L_1276_, L_1277_, L_1278_)).G
				L_1291_.Frame.Frame.TextBox.Text = L_1287_func(Color3.fromHSV(L_1276_, L_1277_, L_1278_)).B
				if L_1321_arg2 or L_1273_.Transparency then
					L_1281_.BackgroundTransparency = L_1273_.Transparency or L_1321_arg2
					L_1297_.BackgroundColor3 = Color3.fromHSV(L_1276_, L_1277_, L_1278_)
					L_1296_.BackgroundColor3 = Color3.fromHSV(L_1276_, L_1277_, L_1278_)
					L_1296_.BackgroundTransparency = L_1273_.Transparency or L_1321_arg2
					L_1296_.Position = UDim2.new(0.5, 0, 1 - L_1273_.Transparency or L_1321_arg2, 0)
					L_1292_.Frame.Frame.TextBox.Text = L_1273_:Round((1 - L_1273_.Transparency or L_1321_arg2) * 100, 0) .. "%"
				end
			end
			L_1273_:Update(L_1273_.Default, L_1273_.Transparency)
			local function L_1298_func()
				local L_1322_ = Color3.fromHSV(L_1273_.Hue, L_1273_.Sat, L_1273_.Vib)
				return {
					R = math.floor(L_1322_.r * 255),
					G = math.floor(L_1322_.g * 255),
					B = math.floor(L_1322_.b * 255)
				}
			end
			local function L_1299_func(L_1323_arg0, L_1324_arg1, L_1325_arg2)
				return math.clamp(tonumber(L_1323_arg0) or 0, L_1324_arg1, L_1325_arg2)
			end
			L_1257_.AddSignal(L_1288_.Frame.Frame.TextBox.FocusLost, function(L_1326_arg0)
				if L_1326_arg0 then
					local L_1327_ = L_1288_.Frame.Frame.TextBox.Text:gsub("#", "")
					local L_1328_, L_1329_ = pcall(Color3.fromHex, L_1327_)
					if L_1328_ and typeof(L_1329_) == "Color3" then
						L_1273_.Hue, L_1273_.Sat, L_1273_.Vib = Color3.toHSV(L_1329_)
						L_1273_:Update()
						L_1273_.Default = L_1329_
					end
				end
			end)
			local function L_1300_func(L_1330_arg0, L_1331_arg1)
				L_1257_.AddSignal(L_1330_arg0.Frame.Frame.TextBox.FocusLost, function(L_1332_arg0)
					if L_1332_arg0 then
						local L_1333_ = L_1330_arg0.Frame.Frame.TextBox
						local L_1334_ = L_1298_func()
						local L_1335_ = L_1299_func(L_1333_.Text, 0, 255)
						L_1333_.Text = tostring(L_1335_)
						L_1334_[L_1331_arg1] = L_1335_
						local L_1336_ = Color3.fromRGB(L_1334_.R, L_1334_.G, L_1334_.B)
						L_1273_.Hue, L_1273_.Sat, L_1273_.Vib = Color3.toHSV(L_1336_)
						L_1273_:Update()
					end
				end)
			end
			L_1300_func(L_1289_, "R")
			L_1300_func(L_1290_, "G")
			L_1300_func(L_1291_, "B")
			if L_1273_.Transparency then
				L_1257_.AddSignal(L_1292_.Frame.Frame.TextBox.FocusLost, function(L_1337_arg0)
					if L_1337_arg0 then
						local L_1338_ = L_1292_.Frame.Frame.TextBox
						local L_1339_ = L_1299_func(L_1338_.Text, 0, 100)
						L_1338_.Text = tostring(L_1339_)
						L_1273_.Transparency = 1 - L_1339_ * 0.01
						L_1273_:Update(nil, L_1273_.Transparency)
					end
				end)
			end
			local L_1301_ = L_1273_.UIElements.SatVibMap
			L_1257_.AddSignal(L_1301_.InputBegan, function(L_1340_arg0)
				if L_1340_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_1340_arg0.UserInputType == Enum.UserInputType.Touch then
					while L_1260_:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
						local L_1341_ = L_1301_.AbsolutePosition.X
						local L_1342_ = L_1341_ + L_1301_.AbsoluteSize.X
						local L_1343_ = math.clamp(L_1265_.X, L_1341_, L_1342_)
						local L_1344_ = L_1301_.AbsolutePosition.Y
						local L_1345_ = L_1344_ + L_1301_.AbsoluteSize.Y
						local L_1346_ = math.clamp(L_1265_.Y, L_1344_, L_1345_)
						L_1273_.Sat = (L_1343_ - L_1341_) / (L_1342_ - L_1341_)
						L_1273_.Vib = 1 - ((L_1346_ - L_1344_) / (L_1345_ - L_1344_))
						L_1273_:Update()
						L_1263_:Wait()
					end
				end
			end)
			L_1257_.AddSignal(L_1286_.InputBegan, function(L_1347_arg0)
				if L_1347_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_1347_arg0.UserInputType == Enum.UserInputType.Touch then
					while L_1260_:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
						local L_1348_ = L_1286_.AbsolutePosition.Y
						local L_1349_ = L_1348_ + L_1286_.AbsoluteSize.Y
						local L_1350_ = math.clamp(L_1265_.Y, L_1348_, L_1349_)
						L_1273_.Hue = ((L_1350_ - L_1348_) / (L_1349_ - L_1348_))
						L_1273_:Update()
						L_1263_:Wait()
					end
				end
			end)
			if L_1273_.Transparency then
				L_1257_.AddSignal(L_1295_.InputBegan, function(L_1351_arg0)
					if L_1351_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_1351_arg0.UserInputType == Enum.UserInputType.Touch then
						while L_1260_:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
							local L_1352_ = L_1295_.AbsolutePosition.Y
							local L_1353_ = L_1352_ + L_1295_.AbsoluteSize.Y
							local L_1354_ = math.clamp(L_1265_.Y, L_1352_, L_1353_)
							L_1273_.Transparency = 1 - ((L_1354_ - L_1352_) / (L_1353_ - L_1352_))
							L_1273_:Update()
							L_1263_:Wait()
						end
					end
				end)
			end
			return L_1273_
		end
		function L_1268_.New(L_1355_arg0, L_1356_arg1)
			local L_1357_ = {
				__type = "Colorpicker",
				Title = L_1356_arg1.Title or "Colorpicker",
				Desc = L_1356_arg1.Desc or nil,
				Locked = L_1356_arg1.Locked or false,
				Default = L_1356_arg1.Default or Color3.new(1, 1, 1),
				Callback = L_1356_arg1.Callback or function()
				end,
				UIScale = L_1356_arg1.UIScale,
				Transparency = L_1356_arg1.Transparency,
				UIElements = {}
			}
			local L_1358_ = true
			if L_1356_arg1.Window.NewElements then
				L_1268_.UICorner = 14
			end
			L_1357_.ColorpickerFrame = L_1_.load'y'{
				Title = L_1357_.Title,
				Desc = L_1357_.Desc,
				Parent = L_1356_arg1.Parent,
				TextOffset = 40,
				Hover = false,
				Tab = L_1356_arg1.Tab,
				Index = L_1356_arg1.Index,
				Window = L_1356_arg1.Window,
				ElementTable = L_1357_,
			}
			L_1357_.UIElements.Colorpicker = L_1257_.NewRoundFrame(L_1268_.UICorner, "Squircle", {
				ImageTransparency = 0,
				Active = true,
				ImageColor3 = L_1357_.Default,
				Parent = L_1357_.ColorpickerFrame.UIElements.Main,
				Size = UDim2.new(0, 30, 0, 30),
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0),
				ZIndex = 2
			}, nil, true)
			function L_1357_.Lock(L_1359_arg0)
				L_1357_.Locked = true
				L_1358_ = false
				return L_1357_.ColorpickerFrame:Lock()
			end
			function L_1357_.Unlock(L_1360_arg0)
				L_1357_.Locked = false
				L_1358_ = true
				return L_1357_.ColorpickerFrame:Unlock()
			end
			if L_1357_.Locked then
				L_1357_:Lock()
			end
			function L_1357_.Update(L_1361_arg0, L_1362_arg1, L_1363_arg2)
				L_1357_.UIElements.Colorpicker.ImageTransparency = L_1363_arg2 or 0
				L_1357_.UIElements.Colorpicker.ImageColor3 = L_1362_arg1
				L_1357_.Default = L_1362_arg1
				if L_1363_arg2 then
					L_1357_.Transparency = L_1363_arg2
				end
			end
			function L_1357_.Set(L_1364_arg0, L_1365_arg1, L_1366_arg2)
				return L_1357_:Update(L_1365_arg1, L_1366_arg2)
			end
			L_1257_.AddSignal(L_1357_.UIElements.Colorpicker.MouseButton1Click, function()
				if L_1358_ then
					L_1268_:Colorpicker(L_1357_, L_1356_arg1.Window, function(L_1367_arg0, L_1368_arg1)
						L_1357_:Update(L_1367_arg0, L_1368_arg1)
						L_1357_.Default = L_1367_arg0
						L_1357_.Transparency = L_1368_arg1
						L_1257_.SafeCallback(L_1357_.Callback, L_1367_arg0, L_1368_arg1)
					end).ColorpickerFrame:Open()
				end
			end)
			return L_1357_.__type, L_1357_
		end
		return L_1268_
	end
	function L_1_.N()
		local L_1369_ = L_1_.load'a'
		local L_1370_ = L_1369_.New
		local L_1371_ = L_1369_.Tween
		local L_1372_ = {}
		function L_1372_.New(L_1373_arg0, L_1374_arg1)
			local L_1375_ = {
				__type = "Section",
				Title = L_1374_arg1.Title or "Section",
				Icon = L_1374_arg1.Icon,
				TextXAlignment = L_1374_arg1.TextXAlignment or "Left",
				TextSize = L_1374_arg1.TextSize or 19,
				Box = L_1374_arg1.Box or false,
				FontWeight = L_1374_arg1.FontWeight or Enum.FontWeight.SemiBold,
				TextTransparency = L_1374_arg1.TextTransparency or 0.05,
				Opened = L_1374_arg1.Opened or false,
				UIElements = {},
				HeaderSize = 42,
				IconSize = 20,
				Padding = 10,
				Elements = {},
				Expandable = false,
			}
			local L_1376_
			function L_1375_.SetIcon(L_1382_arg0, L_1383_arg1)
				L_1375_.Icon = L_1383_arg1 or nil
				if L_1376_ then
					L_1376_:Destroy()
				end
				if L_1383_arg1 then
					L_1376_ = L_1369_.Image(
L_1383_arg1,
L_1383_arg1 .. ":" .. L_1375_.Title,
0,
L_1374_arg1.Window.Folder,
L_1375_.__type,
true
)
					L_1376_.Size = UDim2.new(0, L_1375_.IconSize, 0, L_1375_.IconSize)
				end
			end
			local L_1377_ = L_1370_("Frame", {
				Size = UDim2.new(0, L_1375_.IconSize, 0, L_1375_.IconSize),
				BackgroundTransparency = 1,
				Visible = false
			}, {
				L_1370_("ImageLabel", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					Image = L_1369_.Icon"chevron-down"[1],
					ImageRectSize = L_1369_.Icon"chevron-down"[2].ImageRectSize,
					ImageRectOffset = L_1369_.Icon"chevron-down"[2].ImageRectPosition,
					ThemeTag = {
						ImageColor3 = "Icon",
					},
					ImageTransparency = .7,
				})
			})
			if L_1375_.Icon then
				L_1375_:SetIcon(L_1375_.Icon)
			end
			local L_1378_ = L_1370_("TextLabel", {
				BackgroundTransparency = 1,
				TextXAlignment = L_1375_.TextXAlignment,
				AutomaticSize = "Y",
				TextSize = L_1375_.TextSize,
				TextTransparency = L_1375_.TextTransparency,
				ThemeTag = {
					TextColor3 = "Text",
				},
				FontFace = Font.new(L_1369_.Font, L_1375_.FontWeight),
				Text = L_1375_.Title,
				Size = UDim2.new(
1,
0,
0,
0
),
				TextWrapped = true,
			})
			local function L_1379_func()
				local L_1384_ = 0
				if L_1376_ then
					L_1384_ = L_1384_ - (L_1375_.IconSize + 8)
				end
				if L_1377_.Visible then
					L_1384_ = L_1384_ - (L_1375_.IconSize + 8)
				end
				L_1378_.Size = UDim2.new(1, L_1384_, 0, 0)
			end
			local L_1380_ = L_1369_.NewRoundFrame(L_1374_arg1.Window.ElementConfig.UICorner, "Squircle", {
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
				Parent = L_1374_arg1.Parent,
				ClipsDescendants = true,
				AutomaticSize = "Y",
				ImageTransparency = L_1375_.Box and .93 or 1,
				ThemeTag = {
					ImageColor3 = "Text",
				},
			}, {
				L_1370_("TextButton", {
					Size = UDim2.new(1, 0, 0, Expandable and 0 or L_1375_.HeaderSize),
					BackgroundTransparency = 1,
					AutomaticSize = Expandable and nil or "Y",
					Text = "",
					Name = "Top",
				}, {
					L_1375_.Box and L_1370_("UIPadding", {
						PaddingLeft = UDim.new(0, L_1374_arg1.Window.ElementConfig.UIPadding),
						PaddingRight = UDim.new(0, L_1374_arg1.Window.ElementConfig.UIPadding),
					}) or nil,
					L_1376_,
					L_1378_,
					L_1370_("UIListLayout", {
						Padding = UDim.new(0, 8),
						FillDirection = "Horizontal",
						VerticalAlignment = "Center",
						HorizontalAlignment = "Left",
					}),
					L_1377_,
				}),
				L_1370_("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
					Name = "Content",
					Visible = false,
					Position = UDim2.new(0, 0, 0, L_1375_.HeaderSize)
				}, {
					L_1375_.Box and L_1370_("UIPadding", {
						PaddingLeft = UDim.new(0, L_1374_arg1.Window.ElementConfig.UIPadding),
						PaddingRight = UDim.new(0, L_1374_arg1.Window.ElementConfig.UIPadding),
						PaddingBottom = UDim.new(0, L_1374_arg1.Window.ElementConfig.UIPadding),
					}) or nil,
					L_1370_("UIListLayout", {
						FillDirection = "Vertical",
						Padding = UDim.new(0, L_1374_arg1.Tab.Gap),
						VerticalAlignment = "Top",
					}),
				})
			})
			local L_1381_ = L_1374_arg1.ElementsModule
			L_1381_.Load(L_1375_, L_1380_.Content, L_1381_.Elements, L_1374_arg1.Window, L_1374_arg1.WindUI, function()
				if not L_1375_.Expandable then
					L_1375_.Expandable = true
					L_1377_.Visible = true
					L_1379_func()
				end
			end, L_1381_, L_1374_arg1.UIScale, L_1374_arg1.Tab)
			L_1379_func()
			function L_1375_.SetTitle(L_1385_arg0, L_1386_arg1)
				L_1378_.Text = L_1386_arg1
			end
			function L_1375_.Destroy(L_1387_arg0)
				for L_1388_forvar0, L_1389_forvar1 in next, L_1375_.Elements do
					L_1389_forvar1:Destroy()
				end
				L_1380_:Destroy()
			end
			function L_1375_.Open(L_1390_arg0)
				if L_1375_.Expandable then
					L_1375_.Opened = true
					L_1371_(L_1380_, 0.33, {
						Size = UDim2.new(1, 0, 0, L_1375_.HeaderSize + (L_1380_.Content.AbsoluteSize.Y / L_1374_arg1.UIScale))
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					L_1371_(L_1377_.ImageLabel, 0.1, {
						Rotation = 180
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				end
			end
			function L_1375_.Close(L_1391_arg0)
				if L_1375_.Expandable then
					L_1375_.Opened = false
					L_1371_(L_1380_, 0.26, {
						Size = UDim2.new(1, 0, 0, L_1375_.HeaderSize)
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					L_1371_(L_1377_.ImageLabel, 0.1, {
						Rotation = 0
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				end
			end
			L_1369_.AddSignal(L_1380_.Top.MouseButton1Click, function()
				if L_1375_.Expandable then
					if L_1375_.Opened then
						L_1375_:Close()
					else
						L_1375_:Open()
					end
				end
			end)
			task.spawn(function()
				task.wait(0.02)
				if L_1375_.Expandable then
					L_1380_.Size = UDim2.new(1, 0, 0, L_1375_.HeaderSize)
					L_1380_.AutomaticSize = "None"
					L_1380_.Top.Size = UDim2.new(1, 0, 0, L_1375_.HeaderSize)
					L_1380_.Top.AutomaticSize = "None"
					L_1380_.Content.Visible = true
				end
				if L_1375_.Opened then
					L_1375_:Open()
				end
			end)
			return L_1375_.__type, L_1375_
		end
		return L_1372_
	end
	function L_1_.O()
		local L_1392_ = L_1_.load'a'
		local L_1393_ = L_1392_.New
		local L_1394_ = {}
		function L_1394_.New(L_1395_arg0, L_1396_arg1)
			local L_1397_ = L_1393_("Frame", {
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = .9,
				ThemeTag = {
					BackgroundColor3 = "Text"
				}
			})
			local L_1398_ = L_1393_("Frame", {
				Parent = L_1396_arg1.Parent,
				Size = UDim2.new(1, -7, 0, 7),
				BackgroundTransparency = 1,
			}, {
				L_1397_
			})
			return "Divider", {
				__type = "Divider",
				ElementFrame = L_1398_
			}
		end
		return L_1394_
	end
	function L_1_.P()
		local L_1399_ = L_1_.load'a'
		local L_1400_ = L_1399_.New
		local L_1401_ = {}
		function L_1401_.New(L_1402_arg0, L_1403_arg1)
			local L_1404_ = L_1400_("Frame", {
				Parent = L_1403_arg1.Parent,
				Size = UDim2.new(1, -7, 0, 7 * (L_1403_arg1.Columns or 1)),
				BackgroundTransparency = 1,
			})
			return "Space", {
				__type = "Space",
				ElementFrame = L_1404_
			}
		end
		return L_1401_
	end
	function L_1_.Q()
		local L_1405_ = L_1_.load'a'
		local L_1406_ = L_1405_.New
		local L_1407_ = {}
		local function L_1408_func(L_1409_arg0)
			if type(L_1409_arg0) == "string" then
				local L_1410_, L_1411_ = L_1409_arg0:match"(%d+):(%d+)"
				if L_1410_ and L_1411_ then
					return tonumber(L_1410_) / tonumber(L_1411_)
				end
			elseif type(L_1409_arg0) == "number" then
				return L_1409_arg0
			end
			return nil
		end
		function L_1407_.New(L_1412_arg0, L_1413_arg1)
			local L_1414_ = {
				__type = "Image",
				Image = L_1413_arg1.Image or "",
				AspectRatio = L_1413_arg1.AspectRatio or "16:9",
				Radius = L_1413_arg1.Radius or L_1413_arg1.Window.ElementConfig.UICorner,
			}
			local L_1415_ = L_1405_.Image(
L_1414_.Image,
L_1414_.Image,
L_1414_.Radius,
L_1413_arg1.Window.Folder,
"Image",
false
)
			L_1415_.Parent = L_1413_arg1.Parent
			L_1415_.Size = UDim2.new(1, 0, 0, 0)
			L_1415_.BackgroundTransparency = 1
			local L_1416_ = L_1408_func(L_1413_arg1.AspectRatio)
			local L_1417_
			if L_1416_ then
				L_1417_ = L_1406_("UIAspectRatioConstraint", {
					Parent = L_1415_,
					AspectRatio = L_1416_,
					AspectType = "ScaleWithParentSize",
					DominantAxis = "Width"
				})
			end
			function L_1414_.Destroy(L_1418_arg0)
				L_1415_:Destroy()
			end
			return L_1414_.__type, L_1414_
		end
		return L_1407_
	end
	function L_1_.R()
		return {
			Elements = {
				Paragraph = L_1_.load'z',
				Button = L_1_.load'A',
				Toggle = L_1_.load'D',
				Slider = L_1_.load'E',
				Keybind = L_1_.load'F',
				Input = L_1_.load'G',
				Dropdown = L_1_.load'I',
				Code = L_1_.load'L',
				Colorpicker = L_1_.load'M',
				Section = L_1_.load'N',
				Divider = L_1_.load'O',
				Space = L_1_.load'P',
				Image = L_1_.load'Q',
			},
			Load = function(L_1419_arg0, L_1420_arg1, L_1421_arg2, L_1422_arg3, L_1423_arg4, L_1424_arg5, L_1425_arg6, L_1426_arg7, L_1427_arg8)
				for L_1428_forvar0, L_1429_forvar1 in next, L_1421_arg2 do
					L_1419_arg0[L_1428_forvar0] = function(L_1430_arg0, L_1431_arg1)
						L_1431_arg1 = L_1431_arg1 or {}
						L_1431_arg1.Tab = L_1427_arg8 or L_1419_arg0
						L_1431_arg1.ParentTable = L_1419_arg0
						L_1431_arg1.Index = #L_1419_arg0.Elements + 1
						L_1431_arg1.GlobalIndex = #L_1422_arg3.AllElements + 1
						L_1431_arg1.Parent = L_1420_arg1
						L_1431_arg1.Window = L_1422_arg3
						L_1431_arg1.WindUI = L_1423_arg4
						L_1431_arg1.UIScale = L_1426_arg7
						L_1431_arg1.ElementsModule = L_1425_arg6
						local

L_1432_, L_1433_ = L_1429_forvar1:New(L_1431_arg1)
						if L_1431_arg1.Flag and typeof(L_1431_arg1.Flag) == "string" then
							if L_1422_arg3.CurrentConfig then
								L_1422_arg3.CurrentConfig:Register(L_1431_arg1.Flag, L_1433_)
								if L_1422_arg3.PendingConfigData and L_1422_arg3.PendingConfigData[L_1431_arg1.Flag] then
									local L_1435_ = L_1422_arg3.PendingConfigData[L_1431_arg1.Flag]
									local L_1436_ = L_1422_arg3.ConfigManager
									if L_1436_.Parser[L_1435_.__type] then
										task.defer(function()
											local L_1437_, L_1438_ = pcall(function()
												L_1436_.Parser[L_1435_.__type].Load(L_1433_, L_1435_)
											end)
											if L_1437_ then
												L_1422_arg3.PendingConfigData[L_1431_arg1.Flag] = nil
											else
												warn("[ WindUI ] Failed to apply pending config for '" .. L_1431_arg1.Flag .. "': " .. tostring(L_1438_))
											end
										end)
									end
								end
							else
								L_1422_arg3.PendingFlags = L_1422_arg3.PendingFlags or {}
								L_1422_arg3.PendingFlags[L_1431_arg1.Flag] = L_1433_
							end
						end
						local L_1434_
						for L_1439_forvar0, L_1440_forvar1 in pairs(L_1433_) do
							if typeof(L_1440_forvar1) == "table" and L_1439_forvar0:match"Frame$" then
								L_1434_ = L_1440_forvar1
								break
							end
						end
						if L_1434_ then
							L_1433_.ElementFrame = L_1434_.UIElements.Main
							function L_1433_.SetTitle(L_1441_arg0, L_1442_arg1)
								L_1434_:SetTitle(L_1442_arg1)
							end
							function L_1433_.SetDesc(L_1443_arg0, L_1444_arg1)
								L_1434_:SetDesc(L_1444_arg1)
							end
							function L_1433_.Highlight(L_1445_arg0)
								L_1434_:Highlight()
							end
							function L_1433_.Destroy(L_1446_arg0)
								table.remove(L_1422_arg3.AllElements, L_1431_arg1.GlobalIndex)
								table.remove(L_1419_arg0.Elements, L_1431_arg1.Index)
								table.remove(L_1427_arg8.Elements, L_1431_arg1.Index)
								L_1419_arg0:UpdateAllElementShapes(L_1419_arg0)
								L_1434_:Destroy()
							end
						end
						L_1422_arg3.AllElements[L_1431_arg1.Index] = L_1433_
						L_1419_arg0.Elements[L_1431_arg1.Index] = L_1433_
						if L_1427_arg8 then
							L_1427_arg8.Elements[L_1431_arg1.Index] = L_1433_
						end
						if L_1422_arg3.NewElements then
							L_1419_arg0:UpdateAllElementShapes(L_1419_arg0)
						end
						if L_1424_arg5 then
							L_1424_arg5()
						end
						return L_1433_
					end
				end
				function L_1419_arg0.UpdateAllElementShapes(L_1447_arg0, L_1448_arg1)
					for L_1449_forvar0, L_1450_forvar1 in next, L_1448_arg1.Elements do
						local L_1451_
						for L_1452_forvar0, L_1453_forvar1 in pairs(L_1450_forvar1) do
							if typeof(L_1453_forvar1) == "table" and L_1452_forvar0:match"Frame$" then
								L_1451_ = L_1453_forvar1
								break
							end
						end
						if L_1451_ then
							L_1451_.Index = L_1449_forvar0
							if L_1451_.UpdateShape then
								L_1451_.UpdateShape(L_1448_arg1)
							end
						end
					end
				end
			end,
		}
	end
	function L_1_.S()
		game:GetService"UserInputService"
		local L_1454_ = game.Players.LocalPlayer:GetMouse()
		local L_1455_ = L_1_.load'a'
		local L_1456_ = L_1455_.New
		local L_1457_ = L_1455_.Tween
		local L_1458_ = L_1_.load'x'.New
		local L_1459_ = L_1_.load't'.New
		local L_1460_ = {
			Tabs = {},
			Containers = {},
			SelectedTab = nil,
			TabCount = 0,
			ToolTipParent = nil,
			TabHighlight = nil,
			OnChangeFunc = function(L_1461_arg0)
			end
		}
		function L_1460_.Init(L_1462_arg0, L_1463_arg1, L_1464_arg2, L_1465_arg3)
			Window = L_1462_arg0
			WindUI = L_1463_arg1
			L_1460_.ToolTipParent = L_1464_arg2
			L_1460_.TabHighlight = L_1465_arg3
			return L_1460_
		end
		function L_1460_.New(L_1466_arg0, L_1467_arg1)
			local L_1468_ = {
				__type = "Tab",
				Title = L_1466_arg0.Title or "Tab",
				Desc = L_1466_arg0.Desc,
				Icon = L_1466_arg0.Icon,
				IconThemed = L_1466_arg0.IconThemed,
				Locked = L_1466_arg0.Locked,
				ShowTabTitle = L_1466_arg0.ShowTabTitle,
				Selected = false,
				Index = nil,
				Parent = L_1466_arg0.Parent,
				UIElements = {},
				Elements = {},
				ContainerFrame = nil,
				UICorner = Window.UICorner - (Window.UIPadding / 2),
				Gap = Window.NewElements and 1 or 6,
			}
			L_1460_.TabCount = L_1460_.TabCount + 1
			local L_1469_ = L_1460_.TabCount
			L_1468_.Index = L_1469_
			L_1468_.UIElements.Main = L_1455_.NewRoundFrame(L_1468_.UICorner, "Squircle", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -7, 0, 0),
				AutomaticSize = "Y",
				Parent = L_1466_arg0.Parent,
				ThemeTag = {
					ImageColor3 = "Text",
				},
				ImageTransparency = 1,
			}, {
				L_1455_.NewRoundFrame(L_1468_.UICorner, "SquircleOutline", {
					Size = UDim2.new(1, 0, 1, 0),
					ThemeTag = {
						ImageColor3 = "Text",
					},
					ImageTransparency = 1,
					Name = "Outline"
				}, {
					L_1456_("UIGradient", {
						Rotation = 80,
						Color = ColorSequence.new{
							ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
						},
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0.0, 0.1),
							NumberSequenceKeypoint.new(0.5, 1),
							NumberSequenceKeypoint.new(1.0, 0.1),
						}
					}),
				}),
				L_1455_.NewRoundFrame(L_1468_.UICorner, "Squircle", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
					ThemeTag = {
						ImageColor3 = "Text",
					},
					ImageTransparency = 1,
					Name = "Frame",
				}, {
					L_1456_("UIListLayout", {
						SortOrder = "LayoutOrder",
						Padding = UDim.new(0, 10),
						FillDirection = "Horizontal",
						VerticalAlignment = "Center",
					}),
					L_1456_("TextLabel", {
						Text = L_1468_.Title,
						ThemeTag = {
							TextColor3 = "Text"
						},
						TextTransparency = not L_1468_.Locked and 0.4 or .7,
						TextSize = 15,
						Size = UDim2.new(1, 0, 0, 0),
						FontFace = Font.new(L_1455_.Font, Enum.FontWeight.Medium),
						TextWrapped = true,
						RichText = true,
						AutomaticSize = "Y",
						LayoutOrder = 2,
						TextXAlignment = "Left",
						BackgroundTransparency = 1,
					}),
					L_1456_("UIPadding", {
						PaddingTop = UDim.new(0, 2 + (Window.UIPadding / 2)),
						PaddingLeft = UDim.new(0, 4 + (Window.UIPadding / 2)),
						PaddingRight = UDim.new(0, 4 + (Window.UIPadding / 2)),
						PaddingBottom = UDim.new(0, 2 + (Window.UIPadding / 2)),
					})
				}),
			}, true)
			local L_1470_ = 0
			local L_1471_
			local L_1472_
			if L_1468_.Icon then
				L_1471_ = L_1455_.Image(
L_1468_.Icon,
L_1468_.Icon .. ":" .. L_1468_.Title,
0,
Window.Folder,
L_1468_.__type,
true,
L_1468_.IconThemed
)
				L_1471_.Size = UDim2.new(0, 16, 0, 16)
				L_1471_.Parent = L_1468_.UIElements.Main.Frame
				L_1471_.ImageLabel.ImageTransparency = not L_1468_.Locked and 0 or .7
				L_1468_.UIElements.Main.Frame.TextLabel.Size = UDim2.new(1, -30, 0, 0)
				L_1470_ = -30
				L_1468_.UIElements.Icon = L_1471_
				L_1472_ = L_1455_.Image(
L_1468_.Icon,
L_1468_.Icon .. ":" .. L_1468_.Title,
0,
Window.Folder,
L_1468_.__type,
true,
L_1468_.IconThemed
)
				L_1472_.Size = UDim2.new(0, 16, 0, 16)
				L_1472_.ImageLabel.ImageTransparency = not L_1468_.Locked and 0 or .7
				L_1470_ = -30
			end
			L_1468_.UIElements.ContainerFrame = L_1456_("ScrollingFrame", {
				Size = UDim2.new(1, 0, 1, L_1468_.ShowTabTitle and -((Window.UIPadding * 2.4) + 12) or 0),
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				ElasticBehavior = "Never",
				CanvasSize = UDim2.new(0, 0, 0, 0),
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				AutomaticCanvasSize = "Y",
				ScrollingDirection = "Y",
			}, {
				L_1456_("UIPadding", {
					PaddingTop = UDim.new(0, not Window.HidePanelBackground and 20 or 10),
					PaddingLeft = UDim.new(0, not Window.HidePanelBackground and 20 or 10),
					PaddingRight = UDim.new(0, not Window.HidePanelBackground and 20 or 10),
					PaddingBottom = UDim.new(0, not Window.HidePanelBackground and 20 or 10),
				}),
				L_1456_("UIListLayout", {
					SortOrder = "LayoutOrder",
					Padding = UDim.new(0, L_1468_.Gap),
					HorizontalAlignment = "Center",
				})
			})
			L_1468_.UIElements.ContainerFrameCanvas = L_1456_("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				Visible = false,
				Parent = Window.UIElements.MainBar,
				ZIndex = 5,
			}, {
				L_1468_.UIElements.ContainerFrame,
				L_1456_("Frame", {
					Size = UDim2.new(1, 0, 0, ((Window.UIPadding * 2.4) + 12)),
					BackgroundTransparency = 1,
					Visible = L_1468_.ShowTabTitle or false,
					Name = "TabTitle"
				}, {
					L_1472_,
					L_1456_("TextLabel", {
						Text = L_1468_.Title,
						ThemeTag = {
							TextColor3 = "Text"
						},
						TextSize = 20,
						TextTransparency = .1,
						Size = UDim2.new(1, -L_1470_, 1, 0),
						FontFace = Font.new(L_1455_.Font, Enum.FontWeight.SemiBold),
						TextTruncate = "AtEnd",
						RichText = true,
						LayoutOrder = 2,
						TextXAlignment = "Left",
						BackgroundTransparency = 1,
					}),
					L_1456_("UIPadding", {
						PaddingTop = UDim.new(0, 20),
						PaddingLeft = UDim.new(0, 20),
						PaddingRight = UDim.new(0, 20),
						PaddingBottom = UDim.new(0, 20),
					}),
					L_1456_("UIListLayout", {
						SortOrder = "LayoutOrder",
						Padding = UDim.new(0, 10),
						FillDirection = "Horizontal",
						VerticalAlignment = "Center",
					})
				}),
				L_1456_("Frame", {
					Size = UDim2.new(1, 0, 0, 1),
					BackgroundTransparency = .9,
					ThemeTag = {
						BackgroundColor3 = "Text"
					},
					Position = UDim2.new(0, 0, 0, ((Window.UIPadding * 2.4) + 12)),
					Visible = L_1468_.ShowTabTitle or false,
				})
			})
			L_1460_.Containers[L_1469_] = L_1468_.UIElements.ContainerFrameCanvas
			L_1460_.Tabs[L_1469_] = L_1468_
			L_1468_.ContainerFrame = ContainerFrameCanvas
			L_1455_.AddSignal(L_1468_.UIElements.Main.MouseButton1Click, function()
				if not L_1468_.Locked then
					L_1460_:SelectTab(L_1469_)
				end
			end)
			if Window.ScrollBarEnabled then
				L_1459_(L_1468_.UIElements.ContainerFrame, L_1468_.UIElements.ContainerFrameCanvas, Window, 3)
			end
			local L_1473_
			local L_1474_
			local L_1475_
			local L_1476_ = false
			if L_1468_.Desc then
				L_1455_.AddSignal(L_1468_.UIElements.Main.InputBegan, function()
					L_1476_ = true
					L_1474_ = task.spawn(function()
						task.wait(0.35)
						if L_1476_ and not L_1473_ then
							L_1473_ = L_1458_(L_1468_.Desc, L_1460_.ToolTipParent)
							local function L_1477_func()
								if L_1473_ then
									L_1473_.Container.Position = UDim2.new(0, L_1454_.X, 0, L_1454_.Y - 20)
								end
							end
							L_1477_func()
							L_1475_ = L_1454_.Move:Connect(L_1477_func)
							L_1473_:Open()
						end
					end)
				end)
			end
			L_1455_.AddSignal(L_1468_.UIElements.Main.MouseEnter, function()
				if not L_1468_.Locked then
					L_1457_(L_1468_.UIElements.Main.Frame, 0.08, {
						ImageTransparency = .97
					}):Play()
				end
			end)
			L_1455_.AddSignal(L_1468_.UIElements.Main.InputEnded, function()
				if L_1468_.Desc then
					L_1476_ = false
					if L_1474_ then
						task.cancel(L_1474_)
						L_1474_ = nil
					end
					if L_1475_ then
						L_1475_:Disconnect()
						L_1475_ = nil
					end
					if L_1473_ then
						L_1473_:Close()
						L_1473_ = nil
					end
				end
				if not L_1468_.Locked then
					L_1457_(L_1468_.UIElements.Main.Frame, 0.08, {
						ImageTransparency = 1
					}):Play()
				end
			end)
			function L_1468_.ScrollToTheElement(L_1478_arg0, L_1479_arg1)
				L_1468_.UIElements.ContainerFrame.ScrollingEnabled = false
				L_1457_(L_1468_.UIElements.ContainerFrame, .45,
{
					CanvasPosition = Vector2.new(
0,

L_1468_.Elements[L_1479_arg1].ElementFrame.AbsolutePosition.Y
- L_1468_.UIElements.ContainerFrame.AbsolutePosition.Y
- L_1468_.UIElements.ContainerFrame.UIPadding.PaddingTop.Offset
)
				},
Enum.EasingStyle.Quint, Enum.EasingDirection.Out
):Play()
				task.spawn(function()
					task.wait(.48)
					if L_1468_.Elements[L_1479_arg1].Highlight then
						L_1468_.Elements[L_1479_arg1]:Highlight()
						L_1468_.UIElements.ContainerFrame.ScrollingEnabled = true
					end
				end)
				return L_1468_
			end
			L_1468_.ElementsModule = L_1_.load'R'
			L_1468_.ElementsModule.Load(L_1468_, L_1468_.UIElements.ContainerFrame, L_1468_.ElementsModule.Elements, Window, WindUI, nil, L_1468_.ElementsModule, L_1467_arg1)
			function L_1468_.LockAll(L_1480_arg0)
				for L_1481_forvar0, L_1482_forvar1 in next, Window.AllElements do
					if L_1482_forvar1.Tab and L_1482_forvar1.Tab.Index and L_1482_forvar1.Tab.Index == L_1468_.Index and L_1482_forvar1.Lock then
						L_1482_forvar1:Lock()
					end
				end
			end
			function L_1468_.UnlockAll(L_1483_arg0)
				for L_1484_forvar0, L_1485_forvar1 in next, Window.AllElements do
					if L_1485_forvar1.Tab and L_1485_forvar1.Tab.Index and L_1485_forvar1.Tab.Index == L_1468_.Index and L_1485_forvar1.Unlock then
						L_1485_forvar1:Unlock()
					end
				end
			end
			function L_1468_.GetLocked(L_1486_arg0)
				local L_1487_ = {}
				for L_1488_forvar0, L_1489_forvar1 in next, Window.AllElements do
					if L_1489_forvar1.Tab and L_1489_forvar1.Tab.Index and L_1489_forvar1.Tab.Index == L_1468_.Index and L_1489_forvar1.Locked == true then
						table.insert(L_1487_, L_1489_forvar1)
					end
				end
				return L_1487_
			end
			function L_1468_.GetUnlocked(L_1490_arg0)
				local L_1491_ = {}
				for L_1492_forvar0, L_1493_forvar1 in next, Window.AllElements do
					if L_1493_forvar1.Tab and L_1493_forvar1.Tab.Index and L_1493_forvar1.Tab.Index == L_1468_.Index and L_1493_forvar1.Locked == false then
						table.insert(L_1491_, L_1493_forvar1)
					end
				end
				return L_1491_
			end
			function L_1468_.Select(L_1494_arg0)
				return L_1460_:SelectTab(L_1468_.Index)
			end
			task.spawn(function()
				local L_1495_ = L_1456_("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, -Window.UIElements.Main.Main.Topbar.AbsoluteSize.Y),
					Parent = L_1468_.UIElements.ContainerFrame
				}, {
					L_1456_("UIListLayout", {
						Padding = UDim.new(0, 8),
						SortOrder = "LayoutOrder",
						VerticalAlignment = "Center",
						HorizontalAlignment = "Center",
						FillDirection = "Vertical",
					}),
					L_1456_("ImageLabel", {
						Size = UDim2.new(0, 48, 0, 48),
						Image = L_1455_.Icon"frown"[1],
						ImageRectOffset = L_1455_.Icon"frown"[2].ImageRectPosition,
						ImageRectSize = L_1455_.Icon"frown"[2].ImageRectSize,
						ThemeTag = {
							ImageColor3 = "Icon"
						},
						BackgroundTransparency = 1,
						ImageTransparency = .6,
					}),
					L_1456_("TextLabel", {
						AutomaticSize = "XY",
						Text = "This tab is empty",
						ThemeTag = {
							TextColor3 = "Text"
						},
						TextSize = 18,
						TextTransparency = .5,
						BackgroundTransparency = 1,
						FontFace = Font.new(L_1455_.Font, Enum.FontWeight.Medium),
					})
				})
				local L_1496_
				L_1496_ = L_1455_.AddSignal(L_1468_.UIElements.ContainerFrame.ChildAdded, function()
					L_1495_.Visible = false
					L_1496_:Disconnect()
				end)
			end)
			return L_1468_
		end
		function L_1460_.OnChange(L_1497_arg0, L_1498_arg1)
			L_1460_.OnChangeFunc = L_1498_arg1
		end
		function L_1460_.SelectTab(L_1499_arg0, L_1500_arg1)
			if not L_1460_.Tabs[L_1500_arg1].Locked then
				L_1460_.SelectedTab = L_1500_arg1
				for L_1501_forvar0, L_1502_forvar1 in next, L_1460_.Tabs do
					if not L_1502_forvar1.Locked then
						L_1457_(L_1502_forvar1.UIElements.Main, 0.15, {
							ImageTransparency = 1
						}):Play()
						L_1457_(L_1502_forvar1.UIElements.Main.Outline, 0.15, {
							ImageTransparency = 1
						}):Play()
						L_1457_(L_1502_forvar1.UIElements.Main.Frame.TextLabel, 0.15, {
							TextTransparency = 0.3
						}):Play()
						if L_1502_forvar1.UIElements.Icon then
							L_1457_(L_1502_forvar1.UIElements.Icon.ImageLabel, 0.15, {
								ImageTransparency = 0.4
							}):Play()
						end
						L_1502_forvar1.Selected = false
					end
				end
				L_1457_(L_1460_.Tabs[L_1500_arg1].UIElements.Main, 0.15, {
					ImageTransparency = 0.95
				}):Play()
				L_1457_(L_1460_.Tabs[L_1500_arg1].UIElements.Main.Outline, 0.15, {
					ImageTransparency = 0.85
				}):Play()
				L_1457_(L_1460_.Tabs[L_1500_arg1].UIElements.Main.Frame.TextLabel, 0.15, {
					TextTransparency = 0
				}):Play()
				if L_1460_.Tabs[L_1500_arg1].UIElements.Icon then
					L_1457_(L_1460_.Tabs[L_1500_arg1].UIElements.Icon.ImageLabel, 0.15, {
						ImageTransparency = 0.1
					}):Play()
				end
				L_1460_.Tabs[L_1500_arg1].Selected = true
				task.spawn(function()
					for L_1503_forvar0, L_1504_forvar1 in next, L_1460_.Containers do
						L_1504_forvar1.AnchorPoint = Vector2.new(0, 0.05)
						L_1504_forvar1.Visible = false
					end
					L_1460_.Containers[L_1500_arg1].Visible = true
					L_1457_(L_1460_.Containers[L_1500_arg1], 0.15, {
						AnchorPoint = Vector2.new(0, 0)
					}, Enum.EasingStyle.Quart, Enum.EasingDirection.Out):Play()
				end)
				L_1460_.OnChangeFunc(L_1500_arg1)
			end
		end
		return L_1460_
	end
	function L_1_.T()
		local L_1505_ = {}
		local L_1506_ = L_1_.load'a'
		local L_1507_ = L_1506_.New
		local L_1508_ = L_1506_.Tween
		local L_1509_ = L_1_.load'S'
		function L_1505_.New(L_1510_arg0, L_1511_arg1, L_1512_arg2, L_1513_arg3, L_1514_arg4)
			local L_1515_ = {
				Title = L_1510_arg0.Title or "Section",
				Icon = L_1510_arg0.Icon,
				IconThemed = L_1510_arg0.IconThemed,
				Opened = L_1510_arg0.Opened or false,
				HeaderSize = 42,
				IconSize = 18,
				Expandable = false,
			}
			local L_1516_
			if L_1515_.Icon then
				L_1516_ = L_1506_.Image(
L_1515_.Icon,
L_1515_.Icon,
0,
L_1512_arg2,
"Section",
true,
L_1515_.IconThemed
)
				L_1516_.Size = UDim2.new(0, L_1515_.IconSize, 0, L_1515_.IconSize)
				L_1516_.ImageLabel.ImageTransparency = .25
			end
			local L_1517_ = L_1507_("Frame", {
				Size = UDim2.new(0, L_1515_.IconSize, 0, L_1515_.IconSize),
				BackgroundTransparency = 1,
				Visible = false
			}, {
				L_1507_("ImageLabel", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					Image = L_1506_.Icon"chevron-down"[1],
					ImageRectSize = L_1506_.Icon"chevron-down"[2].ImageRectSize,
					ImageRectOffset = L_1506_.Icon"chevron-down"[2].ImageRectPosition,
					ThemeTag = {
						ImageColor3 = "Icon",
					},
					ImageTransparency = .7,
				})
			})
			local L_1518_ = L_1507_("Frame", {
				Size = UDim2.new(1, 0, 0, L_1515_.HeaderSize),
				BackgroundTransparency = 1,
				Parent = L_1511_arg1,
				ClipsDescendants = true,
			}, {
				L_1507_("TextButton", {
					Size = UDim2.new(1, 0, 0, L_1515_.HeaderSize),
					BackgroundTransparency = 1,
					Text = "",
				}, {
					L_1516_,
					L_1507_("TextLabel", {
						Text = L_1515_.Title,
						TextXAlignment = "Left",
						Size = UDim2.new(
1,
L_1516_ and (-L_1515_.IconSize - 10) * 2
or (-L_1515_.IconSize - 10),

1,
0
),
						ThemeTag = {
							TextColor3 = "Text",
						},
						FontFace = Font.new(L_1506_.Font, Enum.FontWeight.SemiBold),
						TextSize = 14,
						BackgroundTransparency = 1,
						TextTransparency = .7,
						TextWrapped = true
					}),
					L_1507_("UIListLayout", {
						FillDirection = "Horizontal",
						VerticalAlignment = "Center",
						Padding = UDim.new(0, 10)
					}),
					L_1517_,
					L_1507_("UIPadding", {
						PaddingLeft = UDim.new(0, 11),
						PaddingRight = UDim.new(0, 11),
					})
				}),
				L_1507_("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
					Name = "Content",
					Visible = true,
					Position = UDim2.new(0, 0, 0, L_1515_.HeaderSize)
				}, {
					L_1507_("UIListLayout", {
						FillDirection = "Vertical",
						Padding = UDim.new(0, L_1514_arg4.Gap),
						VerticalAlignment = "Bottom",
					}),
				})
			})
			function L_1515_.Tab(L_1519_arg0, L_1520_arg1)
				if not L_1515_.Expandable then
					L_1515_.Expandable = true
					L_1517_.Visible = true
				end
				L_1520_arg1.Parent = L_1518_.Content
				return L_1509_.New(L_1520_arg1, L_1513_arg3)
			end
			function L_1515_.Open(L_1521_arg0)
				if L_1515_.Expandable then
					L_1515_.Opened = true
					L_1508_(L_1518_, 0.33, {
						Size = UDim2.new(1, 0, 0, L_1515_.HeaderSize + (L_1518_.Content.AbsoluteSize.Y / L_1513_arg3))
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					L_1508_(L_1517_.ImageLabel, 0.1, {
						Rotation = 180
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				end
			end
			function L_1515_.Close(L_1522_arg0)
				if L_1515_.Expandable then
					L_1515_.Opened = false
					L_1508_(L_1518_, 0.26, {
						Size = UDim2.new(1, 0, 0, L_1515_.HeaderSize)
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					L_1508_(L_1517_.ImageLabel, 0.1, {
						Rotation = 0
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				end
			end
			L_1506_.AddSignal(L_1518_.TextButton.MouseButton1Click, function()
				if L_1515_.Expandable then
					if L_1515_.Opened then
						L_1515_:Close()
					else
						L_1515_:Open()
					end
				end
			end)
			if L_1515_.Opened then
				task.spawn(function()
					task.wait()
					L_1515_:Open()
				end)
			end
			return L_1515_
		end
		return L_1505_
	end
	function L_1_.U()
		return {
			Tab = "table-of-contents",
			Paragraph = "type",
			Button = "square-mouse-pointer",
			Toggle = "toggle-right",
			Slider = "sliders-horizontal",
			Keybind = "command",
			Input = "text-cursor-input",
			Dropdown = "chevrons-up-down",
			Code = "terminal",
			Colorpicker = "palette",
		}
	end
	function L_1_.V()
		game:GetService"UserInputService"
		local L_1523_ = {
			Margin = 8,
			Padding = 9,
		}
		local L_1524_ = L_1_.load'a'
		local L_1525_ = L_1524_.New
		local L_1526_ = L_1524_.Tween
		function L_1523_.new(L_1527_arg0, L_1528_arg1, L_1529_arg2)
			local L_1530_ = {
				IconSize = 18,
				Padding = 14,
				Radius = 22,
				Width = 400,
				MaxHeight = 380,
				Icons = L_1_.load'U'
			}
			local L_1531_ = L_1525_("TextBox", {
				Text = "",
				PlaceholderText = "Search...",
				ThemeTag = {
					PlaceholderColor3 = "Placeholder",
					TextColor3 = "Text",
				},
				Size = UDim2.new(
1,
-((L_1530_.IconSize * 2) + (L_1530_.Padding * 2)),
0,
0
),
				AutomaticSize = "Y",
				ClipsDescendants = true,
				ClearTextOnFocus = false,
				BackgroundTransparency = 1,
				TextXAlignment = "Left",
				FontFace = Font.new(L_1524_.Font, Enum.FontWeight.Regular),
				TextSize = 18,
			})
			local L_1532_ = L_1525_("ImageLabel", {
				Image = L_1524_.Icon"x"[1],
				ImageRectSize = L_1524_.Icon"x"[2].ImageRectSize,
				ImageRectOffset = L_1524_.Icon"x"[2].ImageRectPosition,
				BackgroundTransparency = 1,
				ThemeTag = {
					ImageColor3 = "Icon",
				},
				ImageTransparency = .1,
				Size = UDim2.new(0, L_1530_.IconSize, 0, L_1530_.IconSize)
			}, {
				L_1525_("TextButton", {
					Size = UDim2.new(1, 8, 1, 8),
					BackgroundTransparency = 1,
					Active = true,
					ZIndex = 999999999,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Text = "",
				})
			})
			local L_1533_ = L_1525_("ScrollingFrame", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticCanvasSize = "Y",
				ScrollingDirection = "Y",
				ElasticBehavior = "Never",
				ScrollBarThickness = 0,
				CanvasSize = UDim2.new(0, 0, 0, 0),
				BackgroundTransparency = 1,
				Visible = false
			}, {
				L_1525_("UIListLayout", {
					Padding = UDim.new(0, 0),
					FillDirection = "Vertical",
				}),
				L_1525_("UIPadding", {
					PaddingTop = UDim.new(0, L_1530_.Padding),
					PaddingLeft = UDim.new(0, L_1530_.Padding),
					PaddingRight = UDim.new(0, L_1530_.Padding),
					PaddingBottom = UDim.new(0, L_1530_.Padding),
				})
			})
			local L_1534_ = L_1524_.NewRoundFrame(L_1530_.Radius, "Squircle", {
				Size = UDim2.new(1, 0, 1, 0),
				ThemeTag = {
					ImageColor3 = "Background",
				},
				ImageTransparency = 0,
			}, {
				L_1524_.NewRoundFrame(L_1530_.Radius, "Squircle", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					Visible = false,
					ImageColor3 = Color3.new(1, 1, 1),
					ImageTransparency = .98,
					Name = "Frame",
				}, {
					L_1525_("Frame", {
						Size = UDim2.new(1, 0, 0, 46),
						BackgroundTransparency = 1,
					}, {
						L_1525_("Frame", {
							Size = UDim2.new(1, 0, 1, 0),
							BackgroundTransparency = 1,
						}, {
							L_1525_("ImageLabel", {
								Image = L_1524_.Icon"search"[1],
								ImageRectSize = L_1524_.Icon"search"[2].ImageRectSize,
								ImageRectOffset = L_1524_.Icon"search"[2].ImageRectPosition,
								BackgroundTransparency = 1,
								ThemeTag = {
									ImageColor3 = "Icon",
								},
								ImageTransparency = .1,
								Size = UDim2.new(0, L_1530_.IconSize, 0, L_1530_.IconSize)
							}),
							L_1531_,
							L_1532_,
							L_1525_("UIListLayout", {
								Padding = UDim.new(0, L_1530_.Padding),
								FillDirection = "Horizontal",
								VerticalAlignment = "Center",
							}),
							L_1525_("UIPadding", {
								PaddingLeft = UDim.new(0, L_1530_.Padding),
								PaddingRight = UDim.new(0, L_1530_.Padding),
							})
						})
					}),
					L_1525_("Frame", {
						BackgroundTransparency = 1,
						AutomaticSize = "Y",
						Size = UDim2.new(1, 0, 0, 0),
						Name = "Results",
					}, {
						L_1525_("Frame", {
							Size = UDim2.new(1, 0, 0, 1),
							ThemeTag = {
								BackgroundColor3 = "Outline",
							},
							BackgroundTransparency = .9,
							Visible = false,
						}),
						L_1533_,
						L_1525_("UISizeConstraint", {
							MaxSize = Vector2.new(L_1530_.Width, L_1530_.MaxHeight),
						}),
					}),
					L_1525_("UIListLayout", {
						Padding = UDim.new(0, 0),
						FillDirection = "Vertical",
					}),
				})
			})
			local L_1535_ = L_1525_("Frame", {
				Size = UDim2.new(0, L_1530_.Width, 0, 0),
				AutomaticSize = "Y",
				Parent = L_1528_arg1,
				BackgroundTransparency = 1,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Visible = false,
				ZIndex = 99999999,
			}, {
				L_1525_("UIScale", {
					Scale = .9,
				}),
				L_1534_,
				L_1524_.NewRoundFrame(L_1530_.Radius, "SquircleOutline2", {
					Size = UDim2.new(1, 0, 1, 0),
					ThemeTag = {
						ImageColor3 = "Outline",
					},
					ImageTransparency = 1,
				}, {
					L_1525_("UIGradient", {
						Rotation = 45,
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0, 0.55),
							NumberSequenceKeypoint.new(0.5, 0.8),
							NumberSequenceKeypoint.new(1, 0.6)
						}
					})
				})
			})
			local function L_1536_func(L_1539_arg0, L_1540_arg1, L_1541_arg2, L_1542_arg3, L_1543_arg4, L_1544_arg5)
				local L_1545_ = L_1525_("TextButton", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
					BackgroundTransparency = 1,
					Parent = L_1542_arg3 or nil
				}, {
					L_1524_.NewRoundFrame(L_1530_.Radius - 11, "Squircle", {
						Size = UDim2.new(1, 0, 0, 0),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),
						ThemeTag = {
							ImageColor3 = "Text",
						},
						ImageTransparency = 1,
						Name = "Main"
					}, {
						L_1524_.NewRoundFrame(L_1530_.Radius - 11, "SquircleOutline2", {
							Size = UDim2.new(1, 0, 1, 0),
							Position = UDim2.new(0.5, 0, 0.5, 0),
							AnchorPoint = Vector2.new(0.5, 0.5),
							ThemeTag = {
								ImageColor3 = "Outline",
							},
							ImageTransparency = 1,
							Name = "Outline",
						}, {
							L_1525_("UIGradient", {
								Rotation = 65,
								Transparency = NumberSequence.new{
									NumberSequenceKeypoint.new(0, 0.55),
									NumberSequenceKeypoint.new(0.5, 0.8),
									NumberSequenceKeypoint.new(1, 0.6)
								}
							}),
							L_1525_("UIPadding", {
								PaddingTop = UDim.new(0, L_1530_.Padding - 2),
								PaddingLeft = UDim.new(0, L_1530_.Padding),
								PaddingRight = UDim.new(0, L_1530_.Padding),
								PaddingBottom = UDim.new(0, L_1530_.Padding - 2),
							}),
							L_1525_("ImageLabel", {
								Image = L_1524_.Icon(L_1541_arg2)[1],
								ImageRectSize = L_1524_.Icon(L_1541_arg2)[2].ImageRectSize,
								ImageRectOffset = L_1524_.Icon(L_1541_arg2)[2].ImageRectPosition,
								BackgroundTransparency = 1,
								ThemeTag = {
									ImageColor3 = "Icon",
								},
								ImageTransparency = .1,
								Size = UDim2.new(0, L_1530_.IconSize, 0, L_1530_.IconSize)
							}),
							L_1525_("Frame", {
								Size = UDim2.new(1, -L_1530_.IconSize - L_1530_.Padding, 0, 0),
								BackgroundTransparency = 1,
							}, {
								L_1525_("TextLabel", {
									Text = L_1539_arg0,
									ThemeTag = {
										TextColor3 = "Text",
									},
									TextSize = 17,
									BackgroundTransparency = 1,
									TextXAlignment = "Left",
									FontFace = Font.new(L_1524_.Font, Enum.FontWeight.Medium),
									Size = UDim2.new(1, 0, 0, 0),
									TextTruncate = "AtEnd",
									AutomaticSize = "Y",
									Name = "Title"
								}),
								L_1525_("TextLabel", {
									Text = L_1540_arg1 or "",
									Visible = L_1540_arg1 and true or false,
									ThemeTag = {
										TextColor3 = "Text",
									},
									TextSize = 15,
									TextTransparency = .3,
									BackgroundTransparency = 1,
									TextXAlignment = "Left",
									FontFace = Font.new(L_1524_.Font, Enum.FontWeight.Medium),
									Size = UDim2.new(1, 0, 0, 0),
									TextTruncate = "AtEnd",
									AutomaticSize = "Y",
									Name = "Desc"
								}) or nil,
								L_1525_("UIListLayout", {
									Padding = UDim.new(0, 6),
									FillDirection = "Vertical",
								})
							}),
							L_1525_("UIListLayout", {
								Padding = UDim.new(0, L_1530_.Padding),
								FillDirection = "Horizontal",
							})
						}),
					}, true),
					L_1525_("Frame", {
						Name = "ParentContainer",
						Size = UDim2.new(1, -L_1530_.Padding, 0, 0),
						AutomaticSize = "Y",
						BackgroundTransparency = 1,
						Visible = L_1543_arg4,
					}, {
						L_1524_.NewRoundFrame(99, "Squircle", {
							Size = UDim2.new(0, 2, 1, 0),
							BackgroundTransparency = 1,
							ThemeTag = {
								ImageColor3 = "Text"
							},
							ImageTransparency = .9,
						}),
						L_1525_("Frame", {
							Size = UDim2.new(1, -L_1530_.Padding - 2, 0, 0),
							Position = UDim2.new(0, L_1530_.Padding + 2, 0, 0),
							BackgroundTransparency = 1,
						}, {
							L_1525_("UIListLayout", {
								Padding = UDim.new(0, 0),
								FillDirection = "Vertical",
							}),
						}),
					}),
					L_1525_("UIListLayout", {
						Padding = UDim.new(0, 0),
						FillDirection = "Vertical",
						HorizontalAlignment = "Right"
					})
				})
				L_1545_.Main.Size = UDim2.new(
1,
0,
0,
L_1545_.Main.Outline.Frame.Desc.Visible and (((L_1530_.Padding - 2) * 2) + L_1545_.Main.Outline.Frame.Title.TextBounds.Y + 6 + L_1545_.Main.Outline.Frame.Desc.TextBounds.Y)
or (((L_1530_.Padding - 2) * 2) + L_1545_.Main.Outline.Frame.Title.TextBounds.Y)
)
				L_1524_.AddSignal(L_1545_.Main.MouseEnter, function()
					L_1526_(L_1545_.Main, .04, {
						ImageTransparency = .95
					}):Play()
					L_1526_(L_1545_.Main.Outline, .04, {
						ImageTransparency = .7
					}):Play()
				end)
				L_1524_.AddSignal(L_1545_.Main.InputEnded, function()
					L_1526_(L_1545_.Main, .08, {
						ImageTransparency = 1
					}):Play()
					L_1526_(L_1545_.Main.Outline, .08, {
						ImageTransparency = 1
					}):Play()
				end)
				L_1524_.AddSignal(L_1545_.Main.MouseButton1Click, function()
					if L_1544_arg5 then
						L_1544_arg5()
					end
				end)
				return L_1545_
			end
			local function L_1537_func(L_1546_arg0, L_1547_arg1)
				if not L_1547_arg1 or L_1547_arg1 == "" then
					return false
				end
				if not L_1546_arg0 or L_1546_arg0 == "" then
					return false
				end
				local L_1548_ = string.lower(L_1546_arg0)
				local L_1549_ = string.lower(L_1547_arg1)
				return string.find(L_1548_, L_1549_, 1, true) ~= nil
			end
			local function L_1538_func(L_1550_arg0)
				if not L_1550_arg0 or L_1550_arg0 == "" then
					return {}
				end
				local L_1551_ = {}
				for L_1552_forvar0, L_1553_forvar1 in next, L_1527_arg0.Tabs do
					local L_1554_ = L_1537_func(L_1553_forvar1.Title or "", L_1550_arg0)
					local L_1555_ = {}
					for L_1556_forvar0, L_1557_forvar1 in next, L_1553_forvar1.Elements do
						if L_1557_forvar1.__type ~= "Section" then
							local L_1558_ = L_1537_func(L_1557_forvar1.Title or "", L_1550_arg0)
							local L_1559_ = L_1537_func(L_1557_forvar1.Desc or "", L_1550_arg0)
							if L_1558_ or L_1559_ then
								L_1555_[L_1556_forvar0] = {
									Title = L_1557_forvar1.Title,
									Desc = L_1557_forvar1.Desc,
									Original = L_1557_forvar1,
									__type = L_1557_forvar1.__type,
									Index = L_1556_forvar0,
								}
							end
						end
					end
					if L_1554_ or next(L_1555_) ~= nil then
						L_1551_[L_1552_forvar0] = {
							Tab = L_1553_forvar1,
							Title = L_1553_forvar1.Title,
							Icon = L_1553_forvar1.Icon,
							Elements = L_1555_,
						}
					end
				end
				return L_1551_
			end
			function L_1530_.Search(L_1560_arg0, L_1561_arg1)
				L_1561_arg1 = L_1561_arg1 or ""
				local L_1562_ = L_1538_func(L_1561_arg1)
				L_1533_.Visible = true
				L_1534_.Frame.Results.Frame.Visible = true
				for L_1563_forvar0, L_1564_forvar1 in next, L_1533_:GetChildren() do
					if L_1564_forvar1.ClassName ~= "UIListLayout" and L_1564_forvar1.ClassName ~= "UIPadding" then
						L_1564_forvar1:Destroy()
					end
				end
				if L_1562_ and next(L_1562_) ~= nil then
					for L_1565_forvar0, L_1566_forvar1 in next, L_1562_ do
						local L_1567_ = L_1530_.Icons.Tab
						local L_1568_ = L_1536_func(L_1566_forvar1.Title, nil, L_1567_, L_1533_, true, function()
							L_1530_:Close()
							L_1527_arg0:SelectTab(L_1565_forvar0)
						end)
						if L_1566_forvar1.Elements and next(L_1566_forvar1.Elements) ~= nil then
							for L_1569_forvar0, L_1570_forvar1 in next, L_1566_forvar1.Elements do
								local L_1571_ = L_1530_.Icons[L_1570_forvar1.__type]
								L_1536_func(L_1570_forvar1.Title, L_1570_forvar1.Desc, L_1571_, L_1568_:FindFirstChild"ParentContainer" and L_1568_.ParentContainer.Frame or nil, false, function()
									L_1530_:Close()
									L_1527_arg0:SelectTab(L_1565_forvar0)
									if L_1566_forvar1.Tab.ScrollToTheElement then
										L_1566_forvar1.Tab:ScrollToTheElement(L_1570_forvar1.Index)
									end
								end)
							end
						end
					end
				elseif L_1561_arg1 ~= "" then
					L_1525_("TextLabel", {
						Size = UDim2.new(1, 0, 0, 70),
						BackgroundTransparency = 1,
						Text = "No results found",
						TextSize = 16,
						ThemeTag = {
							TextColor3 = "Text",
						},
						TextTransparency = .2,
						BackgroundTransparency = 1,
						FontFace = Font.new(L_1524_.Font, Enum.FontWeight.Medium),
						Parent = L_1533_,
						Name = "NotFound",
					})
				else
					L_1533_.Visible = false
					L_1534_.Frame.Results.Frame.Visible = false
				end
			end
			L_1524_.AddSignal(L_1531_:GetPropertyChangedSignal"Text", function()
				L_1530_:Search(L_1531_.Text)
			end)
			L_1524_.AddSignal(L_1533_.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize", function()
				L_1526_(L_1533_, .06, {
					Size = UDim2.new(
1,
0,
0,
math.clamp(L_1533_.UIListLayout.AbsoluteContentSize.Y + (L_1530_.Padding * 2), 0, L_1530_.MaxHeight)
)
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut):Play()
			end)
			function L_1530_.Open(L_1572_arg0)
				task.spawn(function()
					L_1534_.Frame.Visible = true
					L_1535_.Visible = true
					L_1526_(L_1535_.UIScale, .12, {
						Scale = 1
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				end)
			end
			function L_1530_.Close(L_1573_arg0)
				task.spawn(function()
					L_1529_arg2()
					L_1534_.Frame.Visible = false
					L_1526_(L_1535_.UIScale, .12, {
						Scale = 1
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					task.wait(.12)
					L_1535_.Visible = false
				end)
			end
			L_1524_.AddSignal(L_1532_.TextButton.MouseButton1Click, function()
				L_1530_:Close()
			end)
			L_1530_:Open()
			return L_1530_
		end
		return L_1523_
	end
	function L_1_.W()
		local L_1574_ = game:GetService"UserInputService"
		game:GetService"RunService"
		local L_1575_ = workspace.CurrentCamera
		local L_1576_ = L_1_.load'p'
		local L_1577_ = L_1_.load'a'
		local L_1578_ = L_1577_.New
		local L_1579_ = L_1577_.Tween
		local L_1580_ = L_1_.load's'.New
		local L_1581_ = L_1_.load'i'.New
		local L_1582_ = L_1_.load't'.New
		local L_1583_ = L_1_.load'u'
		local L_1584_ = L_1_.load'v'
		return function(L_1585_arg0)
			local L_1586_ = {
				Title = L_1585_arg0.Title or "UI Library",
				Author = L_1585_arg0.Author,
				Icon = L_1585_arg0.Icon,
				IconThemed = L_1585_arg0.IconThemed,
				Folder = L_1585_arg0.Folder,
				Resizable = L_1585_arg0.Resizable,
				Background = L_1585_arg0.Background,
				BackgroundImageTransparency = L_1585_arg0.BackgroundImageTransparency or 0,
				User = L_1585_arg0.User or {},
				Size = L_1585_arg0.Size,
				MinSize = L_1585_arg0.MinSize or Vector2.new(560, 350),
				MaxSize = L_1585_arg0.MaxSize or Vector2.new(850, 560),
				ToggleKey = L_1585_arg0.ToggleKey,
				Transparent = L_1585_arg0.Transparent or false,
				HideSearchBar = L_1585_arg0.HideSearchBar,
				ScrollBarEnabled = L_1585_arg0.ScrollBarEnabled or false,
				SideBarWidth = L_1585_arg0.SideBarWidth or 200,
				Acrylic = L_1585_arg0.Acrylic or false,
				NewElements = L_1585_arg0.NewElements or false,
				IgnoreAlerts = L_1585_arg0.IgnoreAlerts or false,
				HidePanelBackground = L_1585_arg0.HidePanelBackground or false,
				AutoScale = L_1585_arg0.AutoScale,
				OpenButton = L_1585_arg0.OpenButton,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				IconSize = L_1585_arg0.IconSize or 22,
				UICorner = 16,
				UIPadding = 14,
				UIElements = {},
				CanDropdown = true,
				Closed = false,
				Parent = L_1585_arg0.Parent,
				Destroyed = false,
				IsFullscreen = false,
				CanResize = false,
				IsOpenButtonEnabled = true,
				CurrentConfig = nil,
				ConfigManager = nil,
				AcrylicPaint = nil,
				CurrentTab = nil,
				TabModule = nil,
				OnOpenCallback = nil,
				OnCloseCallback = nil,
				OnDestroyCallback = nil,
				IsPC = false,
				Gap = 5,
				TopBarButtons = {},
				AllElements = {},
				ElementConfig = {},
				PendingFlags = {},
			}
			L_1586_.ElementConfig = {
				UIPadding = L_1586_.NewElements and 10 or 13,
				UICorner = L_1586_.NewElements and 23 or 12,
			}
			local L_1587_ = L_1586_.Size or UDim2.new(0, 580, 0, 460)
			L_1586_.Size = UDim2.new(
L_1587_.X.Scale,
math.clamp(L_1587_.X.Offset, L_1586_.MinSize.X, L_1586_.MaxSize.X),
L_1587_.Y.Scale,
math.clamp(L_1587_.Y.Offset, L_1586_.MinSize.Y, L_1586_.MaxSize.Y)
)
			if L_1586_.HideSearchBar ~= false then
				L_1586_.HideSearchBar = true
			end
			if L_1586_.AutoScale ~= false then
				L_1586_.AutoScale = true
			end
			if L_1586_.Resizable ~= false then
				L_1586_.CanResize = true
				L_1586_.Resizable = true
			end
			if L_1586_.Folder then
				if not isfolder("WindUI/" .. L_1586_.Folder) then
					makefolder("WindUI/" .. L_1586_.Folder)
				end
				if not isfolder("WindUI/" .. L_1586_.Folder .. "/assets") then
					makefolder("WindUI/" .. L_1586_.Folder .. "/assets")
				end
				if not isfolder(L_1586_.Folder) then
					makefolder(L_1586_.Folder)
				end
				if not isfolder(L_1586_.Folder .. "/assets") then
					makefolder(L_1586_.Folder .. "/assets")
				end
			end
			local L_1588_ = L_1578_("UICorner", {
				CornerRadius = UDim.new(0, L_1586_.UICorner)
			})
			if L_1586_.Folder then
				L_1586_.ConfigManager = L_1584_:Init(L_1586_)
			end
			if L_1586_.Acrylic then
				local
L_1618_, L_1619_ = L_1576_.AcrylicPaint{
					UseAcrylic = L_1586_.Acrylic
				}
				L_1586_.AcrylicPaint = L_1618_
			end
			local L_1589_ = L_1578_("Frame", {
				Size = UDim2.new(0, 32, 0, 32),
				Position = UDim2.new(1, 0, 1, 0),
				AnchorPoint = Vector2.new(.5, .5),
				BackgroundTransparency = 1,
				ZIndex = 99,
				Active = true
			}, {
				L_1578_("ImageLabel", {
					Size = UDim2.new(0, 96, 0, 96),
					BackgroundTransparency = 1,
					Image = "rbxassetid://120997033468887",
					Position = UDim2.new(0.5, -16, 0.5, -16),
					AnchorPoint = Vector2.new(0.5, 0.5),
					ImageTransparency = 1,
				})
			})
			local L_1590_ = L_1577_.NewRoundFrame(L_1586_.UICorner, "Squircle", {
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = 1,
				ImageColor3 = Color3.new(0, 0, 0),
				ZIndex = 98,
				Active = false,
			}, {
				L_1578_("ImageLabel", {
					Size = UDim2.new(0, 70, 0, 70),
					Image = L_1577_.Icon"expand"[1],
					ImageRectOffset = L_1577_.Icon"expand"[2].ImageRectPosition,
					ImageRectSize = L_1577_.Icon"expand"[2].ImageRectSize,
					BackgroundTransparency = 1,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					ImageTransparency = 1,
				}),
			})
			local L_1591_ = L_1577_.NewRoundFrame(L_1586_.UICorner, "Squircle", {
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = 1,
				ImageColor3 = Color3.new(0, 0, 0),
				ZIndex = 999,
				Active = false,
			})
			L_1586_.UIElements.SideBar = L_1578_("ScrollingFrame", {
				Size = UDim2.new(
1,
L_1586_.ScrollBarEnabled and -3 - (L_1586_.UIPadding / 2) or 0,
1,
not L_1586_.HideSearchBar and -45 or 0
),
				Position = UDim2.new(0, 0, 1, 0),
				AnchorPoint = Vector2.new(0, 1),
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				ElasticBehavior = "Never",
				CanvasSize = UDim2.new(0, 0, 0, 0),
				AutomaticCanvasSize = "Y",
				ScrollingDirection = "Y",
				ClipsDescendants = true,
				VerticalScrollBarPosition = "Left",
			}, {
				L_1578_("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = "Y",
					Size = UDim2.new(1, 0, 0, 0),
					Name = "Frame",
				}, {
					L_1578_("UIPadding", {
						PaddingTop = UDim.new(0, L_1586_.UIPadding / 2),
						PaddingBottom = UDim.new(0, L_1586_.UIPadding / 2),
					}),
					L_1578_("UIListLayout", {
						SortOrder = "LayoutOrder",
						Padding = UDim.new(0, L_1586_.Gap)
					})
				}),
				L_1578_("UIPadding", {
					PaddingLeft = UDim.new(0, L_1586_.UIPadding / 2),
					PaddingRight = UDim.new(0, L_1586_.UIPadding / 2),
				}),
			})
			L_1586_.UIElements.SideBarContainer = L_1578_("Frame", {
				Size = UDim2.new(0, L_1586_.SideBarWidth, 1, L_1586_.User.Enabled and -94 - (L_1586_.UIPadding * 2) or -52),
				Position = UDim2.new(0, 0, 0, 52),
				BackgroundTransparency = 1,
				Visible = true,
			}, {
				L_1578_("Frame", {
					Name = "Content",
					BackgroundTransparency = 1,
					Size = UDim2.new(
1,
0,
1,
not L_1586_.HideSearchBar and -45 - L_1586_.UIPadding / 2 or 0
),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1),
				}),
				L_1586_.UIElements.SideBar,
			})
			if L_1586_.ScrollBarEnabled then
				L_1582_(L_1586_.UIElements.SideBar, L_1586_.UIElements.SideBarContainer.Content, L_1586_, 3)
			end
			L_1586_.UIElements.MainBar = L_1578_("Frame", {
				Size = UDim2.new(1, -L_1586_.UIElements.SideBarContainer.AbsoluteSize.X, 1, -52),
				Position = UDim2.new(1, 0, 1, 0),
				AnchorPoint = Vector2.new(1, 1),
				BackgroundTransparency = 1,
			}, {
				L_1577_.NewRoundFrame(L_1586_.UICorner - (L_1586_.UIPadding / 2), "Squircle", {
					Size = UDim2.new(1, 0, 1, 0),
					ImageColor3 = Color3.new(1, 1, 1),
					ZIndex = 3,
					ImageTransparency = .95,
					Name = "Background",
					Visible = not L_1586_.HidePanelBackground
				}),
				L_1578_("UIPadding", {
					PaddingTop = UDim.new(0, L_1586_.UIPadding / 2),
					PaddingLeft = UDim.new(0, L_1586_.UIPadding / 2),
					PaddingRight = UDim.new(0, L_1586_.UIPadding / 2),
					PaddingBottom = UDim.new(0, L_1586_.UIPadding / 2),
				})
			})
			local L_1592_ = L_1578_("ImageLabel", {
				Image = "rbxassetid://8992230677",
				ImageColor3 = Color3.new(0, 0, 0),
				ImageTransparency = 1,
				Size = UDim2.new(1, 120, 1, 116),
				Position = UDim2.new(0, -60, 0, -58),
				ScaleType = "Slice",
				SliceCenter = Rect.new(99, 99, 99, 99),
				BackgroundTransparency = 1,
				ZIndex = -999999999999999,
				Name = "Blur",
			})
			if L_1574_.TouchEnabled and not L_1574_.KeyboardEnabled then
				L_1586_.IsPC = false
			elseif L_1574_.KeyboardEnabled then
				L_1586_.IsPC = true
			else
				L_1586_.IsPC = nil
			end
			local L_1593_
			if L_1586_.User then
				local function L_1620_func()
					local
L_1621_, L_1622_ = game:GetService"Players":GetUserThumbnailAsync(
L_1586_.User.Anonymous and 1 or game.Players.LocalPlayer.UserId,
Enum.ThumbnailType.HeadShot,
Enum.ThumbnailSize.Size420x420
)
					return L_1621_
				end
				L_1593_ = L_1578_("TextButton", {
					Size = UDim2.new(0,
(L_1586_.UIElements.SideBarContainer.AbsoluteSize.X) - (L_1586_.UIPadding / 2),
0,
42 + (L_1586_.UIPadding)
),
					Position = UDim2.new(0, L_1586_.UIPadding / 2, 1, -(L_1586_.UIPadding / 2)),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundTransparency = 1,
					Visible = L_1586_.User.Enabled or false,
				}, {
					L_1577_.NewRoundFrame(L_1586_.UICorner - (L_1586_.UIPadding / 2), "SquircleOutline", {
						Size = UDim2.new(1, 0, 1, 0),
						ThemeTag = {
							ImageColor3 = "Text",
						},
						ImageTransparency = 1,
						Name = "Outline"
					}, {
						L_1578_("UIGradient", {
							Rotation = 78,
							Color = ColorSequence.new{
								ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
								ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
								ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
							},
							Transparency = NumberSequence.new{
								NumberSequenceKeypoint.new(0.0, 0.1),
								NumberSequenceKeypoint.new(0.5, 1),
								NumberSequenceKeypoint.new(1.0, 0.1),
							}
						}),
					}),
					L_1577_.NewRoundFrame(L_1586_.UICorner - (L_1586_.UIPadding / 2), "Squircle", {
						Size = UDim2.new(1, 0, 1, 0),
						ThemeTag = {
							ImageColor3 = "Text",
						},
						ImageTransparency = 1,
						Name = "UserIcon",
					}, {
						L_1578_("ImageLabel", {
							Image = L_1620_func(),
							BackgroundTransparency = 1,
							Size = UDim2.new(0, 42, 0, 42),
							ThemeTag = {
								BackgroundColor3 = "Text",
							},
							BackgroundTransparency = .93,
						}, {
							L_1578_("UICorner", {
								CornerRadius = UDim.new(1, 0)
							})
						}),
						L_1578_("Frame", {
							AutomaticSize = "XY",
							BackgroundTransparency = 1,
						}, {
							L_1578_("TextLabel", {
								Text = L_1586_.User.Anonymous and "Anonymous" or game.Players.LocalPlayer.DisplayName,
								TextSize = 17,
								ThemeTag = {
									TextColor3 = "Text",
								},
								FontFace = Font.new(L_1577_.Font, Enum.FontWeight.SemiBold),
								AutomaticSize = "Y",
								BackgroundTransparency = 1,
								Size = UDim2.new(1, -27, 0, 0),
								TextTruncate = "AtEnd",
								TextXAlignment = "Left",
								Name = "DisplayName"
							}),
							L_1578_("TextLabel", {
								Text = L_1586_.User.Anonymous and "anonymous" or game.Players.LocalPlayer.Name,
								TextSize = 15,
								TextTransparency = .6,
								ThemeTag = {
									TextColor3 = "Text",
								},
								FontFace = Font.new(L_1577_.Font, Enum.FontWeight.Medium),
								AutomaticSize = "Y",
								BackgroundTransparency = 1,
								Size = UDim2.new(1, -27, 0, 0),
								TextTruncate = "AtEnd",
								TextXAlignment = "Left",
								Name = "UserName"
							}),
							L_1578_("UIListLayout", {
								Padding = UDim.new(0, 4),
								HorizontalAlignment = "Left",
							})
						}),
						L_1578_("UIListLayout", {
							Padding = UDim.new(0, L_1586_.UIPadding),
							FillDirection = "Horizontal",
							VerticalAlignment = "Center",
						}),
						L_1578_("UIPadding", {
							PaddingLeft = UDim.new(0, L_1586_.UIPadding / 2),
							PaddingRight = UDim.new(0, L_1586_.UIPadding / 2),
						})
					})
				})
				function L_1586_.User.Enable(L_1623_arg0)
					L_1586_.User.Enabled = true
					L_1579_(L_1586_.UIElements.SideBarContainer, .25, {
						Size = UDim2.new(0, L_1586_.SideBarWidth, 1, -94 - (L_1586_.UIPadding * 2))
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					L_1593_.Visible = true
				end
				function L_1586_.User.Disable(L_1624_arg0)
					L_1586_.User.Enabled = false
					L_1579_(L_1586_.UIElements.SideBarContainer, .25, {
						Size = UDim2.new(0, L_1586_.SideBarWidth, 1, -52)
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					L_1593_.Visible = false
				end
				function L_1586_.User.SetAnonymous(L_1625_arg0, L_1626_arg1)
					if L_1626_arg1 ~= false then
						L_1626_arg1 = true
					end
					L_1586_.User.Anonymous = L_1626_arg1
					L_1593_.UserIcon.ImageLabel.Image = L_1620_func()
					L_1593_.UserIcon.Frame.DisplayName.Text = L_1626_arg1 and "Anonymous" or game.Players.LocalPlayer.DisplayName
					L_1593_.UserIcon.Frame.UserName.Text = L_1626_arg1 and "anonymous" or game.Players.LocalPlayer.Name
				end
				if L_1586_.User.Enabled then
					L_1586_.User:Enable()
				else
					L_1586_.User:Disable()
				end
				if L_1586_.User.Callback then
					L_1577_.AddSignal(L_1593_.MouseButton1Click, function()
						L_1586_.User.Callback()
					end)
					L_1577_.AddSignal(L_1593_.MouseEnter, function()
						L_1579_(L_1593_.UserIcon, 0.04, {
							ImageTransparency = .95
						}):Play()
						L_1579_(L_1593_.Outline, 0.04, {
							ImageTransparency = .85
						}):Play()
					end)
					L_1577_.AddSignal(L_1593_.InputEnded, function()
						L_1579_(L_1593_.UserIcon, 0.04, {
							ImageTransparency = 1
						}):Play()
						L_1579_(L_1593_.Outline, 0.04, {
							ImageTransparency = 1
						}):Play()
					end)
				end
			end
			local L_1594_
			local L_1595_
			local L_1596_ = false
			local L_1597_
			local L_1598_ = typeof(L_1586_.Background) == "string" and string.match(L_1586_.Background, "^video:(.+)") or nil
			local L_1599_ = typeof(L_1586_.Background) == "string" and not L_1598_ and string.match(L_1586_.Background, "^https?://.+") or nil
			local function L_1600_func(L_1627_arg0)
				L_1627_arg0 = L_1627_arg0:gsub("[%s/\\:*?\"<>|]+", "-")
				L_1627_arg0 = L_1627_arg0:gsub("[^%w%-_%.]", "")
				return L_1627_arg0
			end
			local function L_1601_func(L_1628_arg0)
				local L_1629_ = L_1628_arg0:match"%.(%w+)$" or L_1628_arg0:match"%.(%w+)%?"
				if L_1629_ then
					L_1629_ = L_1629_:lower()
					if L_1629_ == "jpg" or L_1629_ == "jpeg" or L_1629_ == "png" or L_1629_ == "webp" then
						return "." .. L_1629_
					end
				end
				return ".png"
			end
			if typeof(L_1586_.Background) == "string" and L_1598_ then
				L_1596_ = true
				if string.find(L_1598_, "http") then
					local L_1630_ = L_1586_.Folder .. "/assets/." .. L_1600_func(L_1598_) .. ".webm"
					if not isfile(L_1630_) then
						local L_1633_, L_1634_ = pcall(function()
							local L_1635_ = L_1577_.Request{
								Url = L_1598_,
								Method = "GET",
								Headers = {
									["User-Agent"] = "Roblox/Exploit"
								}
							}
							writefile(L_1630_, L_1635_.Body)
						end)
						if not L_1633_ then
							warn("[ Window.Background ] Failed to download video: " .. tostring(L_1634_))
							return
						end
					end
					local L_1631_, L_1632_ = pcall(function()
						return getcustomasset(L_1630_)
					end)
					if not L_1631_ then
						warn("[ Window.Background ] Failed to load custom asset: " .. tostring(L_1632_))
						return
					end
					L_1598_ = L_1632_
				end
				L_1597_ = L_1578_("VideoFrame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					Video = L_1598_,
					Looped = true,
					Volume = 0,
				}, {
					L_1578_("UICorner", {
						CornerRadius = UDim.new(0, L_1586_.UICorner)
					}),
				})
				L_1597_:Play()
			elseif L_1599_ then
				local L_1636_ = L_1586_.Folder .. "/assets/." .. L_1600_func(L_1599_) .. L_1601_func(L_1599_)
				if not isfile(L_1636_) then
					local L_1639_, L_1640_ = pcall(function()
						local L_1641_ = L_1577_.Request{
							Url = L_1599_,
							Method = "GET",
							Headers = {
								["User-Agent"] = "Roblox/Exploit"
							}
						}
						writefile(L_1636_, L_1641_.Body)
					end)
					if not L_1639_ then
						warn("[ Window.Background ] Failed to download image: " .. tostring(L_1640_))
						return
					end
				end
				local L_1637_, L_1638_ = pcall(function()
					return getcustomasset(L_1636_)
				end)
				if not L_1637_ then
					warn("[ Window.Background ] Failed to load custom asset: " .. tostring(L_1638_))
					return
				end
				L_1597_ = L_1578_("ImageLabel", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					Image = L_1638_,
					ImageTransparency = 0,
					ScaleType = "Crop",
				}, {
					L_1578_("UICorner", {
						CornerRadius = UDim.new(0, L_1586_.UICorner)
					}),
				})
			elseif L_1586_.Background then
				L_1597_ = L_1578_("ImageLabel", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					Image = typeof(L_1586_.Background) == "string" and L_1586_.Background or "",
					ImageTransparency = 1,
					ScaleType = "Crop",
				}, {
					L_1578_("UICorner", {
						CornerRadius = UDim.new(0, L_1586_.UICorner)
					}),
				})
			end
			local L_1602_ = L_1577_.NewRoundFrame(99, "Squircle", {
				ImageTransparency = .8,
				ImageColor3 = Color3.new(1, 1, 1),
				Size = UDim2.new(0, 0, 0, 4),
				Position = UDim2.new(0.5, 0, 1, 4),
				AnchorPoint = Vector2.new(0.5, 0),
			}, {
				L_1578_("TextButton", {
					Size = UDim2.new(1, 12, 1, 12),
					BackgroundTransparency = 1,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Active = true,
					ZIndex = 99,
					Name = "Frame",
				})
			})
			function createAuthor(L_1642_arg0)
				return L_1578_("TextLabel", {
					Text = L_1642_arg0,
					FontFace = Font.new(L_1577_.Font, Enum.FontWeight.Medium),
					BackgroundTransparency = 1,
					TextTransparency = 0.35,
					AutomaticSize = "XY",
					Parent = L_1586_.UIElements.Main and L_1586_.UIElements.Main.Main.Topbar.Left.Title,
					TextXAlignment = "Left",
					TextSize = 13,
					LayoutOrder = 2,
					ThemeTag = {
						TextColor3 = "Text"
					},
					Name = "Author",
				})
			end
			local L_1603_
			local L_1604_
			if L_1586_.Author then
				L_1603_ = createAuthor(L_1586_.Author)
			end
			local L_1605_ = L_1578_("TextLabel", {
				Text = L_1586_.Title,
				FontFace = Font.new(L_1577_.Font, Enum.FontWeight.SemiBold),
				BackgroundTransparency = 1,
				AutomaticSize = "XY",
				Name = "Title",
				TextXAlignment = "Left",
				TextSize = 16,
				ThemeTag = {
					TextColor3 = "Text"
				}
			})
			L_1586_.UIElements.Main = L_1578_("Frame", {
				Size = L_1586_.Size,
				Position = L_1586_.Position,
				BackgroundTransparency = 1,
				Parent = L_1585_arg0.Parent,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Active = true,
			}, {
				L_1586_.AcrylicPaint and L_1586_.AcrylicPaint.Frame or nil,
				L_1592_,
				L_1577_.NewRoundFrame(L_1586_.UICorner, "Squircle", {
					ImageTransparency = 1,
					Size = UDim2.new(1, 0, 1, -240),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Name = "Background",
					ThemeTag = {
						ImageColor3 = "Background"
					},
				}, {
					L_1597_,
					L_1602_,
					L_1589_,
				}),
				UIStroke,
				L_1588_,
				L_1590_,
				L_1591_,
				L_1578_("Frame", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					Name = "Main",
					Visible = false,
					ZIndex = 97,
				}, {
					L_1578_("UICorner", {
						CornerRadius = UDim.new(0, L_1586_.UICorner)
					}),
					L_1586_.UIElements.SideBarContainer,
					L_1586_.UIElements.MainBar,
					L_1593_,
					L_1595_,
					L_1578_("Frame", {
						Size = UDim2.new(1, 0, 0, 52),
						BackgroundTransparency = 1,
						BackgroundColor3 = Color3.fromRGB(50, 50, 50),
						Name = "Topbar"
					}, {
						L_1594_,
						L_1578_("Frame", {
							AutomaticSize = "X",
							Size = UDim2.new(0, 0, 1, 0),
							BackgroundTransparency = 1,
							Name = "Left"
						}, {
							L_1578_("UIListLayout", {
								Padding = UDim.new(0, L_1586_.UIPadding + 4),
								SortOrder = "LayoutOrder",
								FillDirection = "Horizontal",
								VerticalAlignment = "Center",
							}),
							L_1578_("Frame", {
								AutomaticSize = "XY",
								BackgroundTransparency = 1,
								Name = "Title",
								Size = UDim2.new(0, 0, 1, 0),
								LayoutOrder = 2,
							}, {
								L_1578_("UIListLayout", {
									Padding = UDim.new(0, 0),
									SortOrder = "LayoutOrder",
									FillDirection = "Vertical",
									VerticalAlignment = "Center",
								}),
								L_1605_,
								L_1603_,
							}),
							L_1578_("UIPadding", {
								PaddingLeft = UDim.new(0, 4)
							})
						}),
						L_1578_("ScrollingFrame", {
							Name = "Center",
							BackgroundTransparency = 1,
							AutomaticSize = "Y",
							ScrollBarThickness = 0,
							ScrollingDirection = "X",
							AutomaticCanvasSize = "X",
							CanvasSize = UDim2.new(0, 0, 0, 0),
							Size = UDim2.new(0, 0, 1, 0),
							AnchorPoint = Vector2.new(0, 0.5),
							Position = UDim2.new(0, 0, 0.5, 0),
							Visible = false,
						}, {
							L_1578_("UIListLayout", {
								FillDirection = "Horizontal",
								VerticalAlignment = "Center",
								HorizontalAlignment = "Left",
								Padding = UDim.new(0, L_1586_.UIPadding / 2)
							})
						}),
						L_1578_("Frame", {
							AutomaticSize = "XY",
							BackgroundTransparency = 1,
							Position = UDim2.new(1, 0, 0.5, 0),
							AnchorPoint = Vector2.new(1, 0.5),
							Name = "Right",
						}, {
							L_1578_("UIListLayout", {
								Padding = UDim.new(0, 9),
								FillDirection = "Horizontal",
								SortOrder = "LayoutOrder",
							}),
						}),
						L_1578_("UIPadding", {
							PaddingTop = UDim.new(0, L_1586_.UIPadding),
							PaddingLeft = UDim.new(0, L_1586_.UIPadding),
							PaddingRight = UDim.new(0, 8),
							PaddingBottom = UDim.new(0, L_1586_.UIPadding),
						})
					})
				})
			})
			L_1577_.AddSignal(L_1586_.UIElements.Main.Main.Topbar.Left:GetPropertyChangedSignal"AbsoluteSize", function()
				local L_1643_ = 0
				local L_1644_ = L_1586_.UIElements.Main.Main.Topbar.Right.UIListLayout.AbsoluteContentSize.X
				if L_1605_ and L_1603_ then
					L_1643_ = math.max(L_1605_.TextBounds.X, L_1603_.TextBounds.X)
				else
					L_1643_ = L_1605_.TextBounds.X
				end
				if L_1604_ then
					L_1643_ = L_1643_ + L_1586_.IconSize + L_1586_.UIPadding + 4
				end
				L_1586_.UIElements.Main.Main.Topbar.Center.Position = UDim2.new(0, L_1643_ + L_1586_.UIPadding, 0.5, 0)
				L_1586_.UIElements.Main.Main.Topbar.Center.Size = UDim2.new(
1,
-L_1643_ - L_1644_ - (L_1586_.UIPadding * 2),
1,
0
)
			end)
			function L_1586_.CreateTopbarButton(L_1645_arg0, L_1646_arg1, L_1647_arg2, L_1648_arg3, L_1649_arg4, L_1650_arg5)
				local L_1651_ = L_1577_.Image(
L_1647_arg2,
L_1647_arg2,
0,
L_1586_.Folder,
"TopbarIcon",
true,
L_1650_arg5
)
				L_1651_.Size = UDim2.new(0, 16, 0, 16)
				L_1651_.AnchorPoint = Vector2.new(0.5, 0.5)
				L_1651_.Position = UDim2.new(0.5, 0, 0.5, 0)
				local L_1652_ = L_1577_.NewRoundFrame(9, "Squircle", {
					Size = UDim2.new(0, 36, 0, 36),
					LayoutOrder = L_1649_arg4 or 999,
					Parent = L_1586_.UIElements.Main.Main.Topbar.Right,
					ZIndex = 9999,
					ThemeTag = {
						ImageColor3 = "Text"
					},
					ImageTransparency = 1
				}, {
					L_1577_.NewRoundFrame(9, "SquircleOutline", {
						Size = UDim2.new(1, 0, 1, 0),
						ThemeTag = {
							ImageColor3 = "Text",
						},
						ImageTransparency = 1,
						Name = "Outline"
					}, {
						L_1578_("UIGradient", {
							Rotation = 45,
							Color = ColorSequence.new{
								ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
								ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
								ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
							},
							Transparency = NumberSequence.new{
								NumberSequenceKeypoint.new(0.0, 0.1),
								NumberSequenceKeypoint.new(0.5, 1),
								NumberSequenceKeypoint.new(1.0, 0.1),
							}
						}),
					}),
					L_1651_
				}, true)
				L_1586_.TopBarButtons[100 - L_1649_arg4] = {
					Name = L_1646_arg1,
					Object = L_1652_
				}
				L_1577_.AddSignal(L_1652_.MouseButton1Click, function()
					L_1648_arg3()
				end)
				L_1577_.AddSignal(L_1652_.MouseEnter, function()
					L_1579_(L_1652_, .15, {
						ImageTransparency = .93
					}):Play()
					L_1579_(L_1652_.Outline, .15, {
						ImageTransparency = .75
					}):Play()
				end)
				L_1577_.AddSignal(L_1652_.MouseLeave, function()
					L_1579_(L_1652_, .1, {
						ImageTransparency = 1
					}):Play()
					L_1579_(L_1652_.Outline, .1, {
						ImageTransparency = 1
					}):Play()
				end)
				return L_1652_
			end
			local L_1606_ = L_1577_.Drag(
L_1586_.UIElements.Main,
{
				L_1586_.UIElements.Main.Main.Topbar,
				L_1602_.Frame
			},
function(L_1653_arg0, L_1654_arg1)
				if not L_1586_.Closed then
					if L_1653_arg0 and L_1654_arg1 == L_1602_.Frame then
						L_1579_(L_1602_, .1, {
							ImageTransparency = .35
						}):Play()
					else
						L_1579_(L_1602_, .2, {
							ImageTransparency = .8
						}):Play()
					end
					L_1586_.Position = L_1586_.UIElements.Main.Position
					L_1586_.Dragging = L_1653_arg0
				end
			end
)
			if not L_1596_ and L_1586_.Background and typeof(L_1586_.Background) == "table" then
				local L_1655_ = L_1578_"UIGradient"
				for L_1656_forvar0, L_1657_forvar1 in next, L_1586_.Background do
					L_1655_[L_1656_forvar0] = L_1657_forvar1
				end
				L_1586_.UIElements.BackgroundGradient = L_1577_.NewRoundFrame(L_1586_.UICorner, "Squircle", {
					Size = UDim2.new(1, 0, 1, 0),
					Parent = L_1586_.UIElements.Main.Background,
					ImageTransparency = L_1586_.Transparent and L_1585_arg0.WindUI.TransparencyValue or 0
				}, {
					L_1655_
				})
			end
			L_1586_.OpenButtonMain = L_1_.load'w'.New(L_1586_)
			task.spawn(function()
				if L_1586_.Icon then
					L_1604_ = L_1577_.Image(
L_1586_.Icon,
L_1586_.Title,
0,
L_1586_.Folder,
"Window",
true,
L_1586_.IconThemed
)
					L_1604_.Parent = L_1586_.UIElements.Main.Main.Topbar.Left
					L_1604_.Size = UDim2.new(0, L_1586_.IconSize, 0, L_1586_.IconSize)
					L_1586_.OpenButtonMain:SetIcon(L_1586_.Icon)
				else
					L_1586_.OpenButtonMain:SetIcon(L_1586_.Icon)
				end
			end)
			function L_1586_.SetToggleKey(L_1658_arg0, L_1659_arg1)
				L_1586_.ToggleKey = L_1659_arg1
			end
			function L_1586_.SetTitle(L_1660_arg0, L_1661_arg1)
				L_1586_.Title = L_1661_arg1
				L_1605_.Text = L_1661_arg1
			end
			function L_1586_.SetAuthor(L_1662_arg0, L_1663_arg1)
				L_1586_.Author = L_1663_arg1
				if not L_1603_ then
					L_1603_ = createAuthor(L_1586_.Author)
				end
				L_1603_.Text = L_1663_arg1
			end
			function L_1586_.SetBackgroundImage(L_1664_arg0, L_1665_arg1)
				L_1586_.UIElements.Main.Background.ImageLabel.Image = L_1665_arg1
			end
			function L_1586_.SetBackgroundImageTransparency(L_1666_arg0, L_1667_arg1)
				if L_1597_ and L_1597_:IsA"ImageLabel" then
					L_1597_.ImageTransparency = math.floor(L_1667_arg1 * 10 + 0.5) / 10
				end
				L_1586_.BackgroundImageTransparency = math.floor(L_1667_arg1 * 10 + 0.5) / 10
			end
			function L_1586_.SetBackgroundTransparency(L_1668_arg0, L_1669_arg1)
				local L_1670_ = math.floor(tonumber(L_1669_arg1) * 10 + 0.5) / 10
				L_1585_arg0.WindUI.TransparencyValue = L_1670_
				L_1586_:ToggleTransparency(L_1670_ > 0)
			end
			local L_1607_
			local L_1608_
			L_1577_.Icon"minimize"
			L_1577_.Icon"maximize"
			L_1586_:CreateTopbarButton("Fullscreen", "maximize", function()
				L_1586_:ToggleFullscreen()
			end, 998)
			function L_1586_.ToggleFullscreen(L_1671_arg0)
				local L_1672_ = L_1586_.IsFullscreen
				L_1606_:Set(L_1672_)
				if not L_1672_ then
					L_1607_ = L_1586_.UIElements.Main.Position
					L_1608_ = L_1586_.UIElements.Main.Size
					L_1586_.CanResize = false
				else
					if L_1586_.Resizable then
						L_1586_.CanResize = true
					end
				end
				L_1579_(L_1586_.UIElements.Main, 0.45, {
					Size = L_1672_ and L_1608_ or UDim2.new(1, -20, 1, -72)
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				L_1579_(L_1586_.UIElements.Main, 0.45, {
					Position = L_1672_ and L_1607_ or UDim2.new(0.5, 0, 0.5, 26)
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				L_1586_.IsFullscreen = not L_1672_
			end
			L_1586_:CreateTopbarButton("Minimize", "minus", function()
				L_1586_:Close()
			end, 997)
			function L_1586_.OnOpen(L_1673_arg0, L_1674_arg1)
				L_1586_.OnOpenCallback = L_1674_arg1
			end
			function L_1586_.OnClose(L_1675_arg0, L_1676_arg1)
				L_1586_.OnCloseCallback = L_1676_arg1
			end
			function L_1586_.OnDestroy(L_1677_arg0, L_1678_arg1)
				L_1586_.OnDestroyCallback = L_1678_arg1
			end
			if L_1585_arg0.WindUI.UseAcrylic then
				L_1586_.AcrylicPaint.AddParent(L_1586_.UIElements.Main)
			end
			function L_1586_.SetIconSize(L_1679_arg0, L_1680_arg1)
				local L_1681_
				if typeof(L_1680_arg1) == "number" then
					L_1681_ = UDim2.new(0, L_1680_arg1, 0, L_1680_arg1)
					L_1586_.IconSize = L_1680_arg1
				elseif typeof(L_1680_arg1) == "UDim2" then
					L_1681_ = L_1680_arg1
					L_1586_.IconSize = L_1680_arg1.X.Offset
				end
				if L_1604_ then
					L_1604_.Size = L_1681_
				end
			end
			function L_1586_.Open(L_1682_arg0)
				task.spawn(function()
					if L_1586_.OnOpenCallback then
						task.spawn(function()
							L_1577_.SafeCallback(L_1586_.OnOpenCallback)
						end)
					end
					task.wait(.06)
					L_1586_.Closed = false
					L_1579_(L_1586_.UIElements.Main.Background, 0.2, {
						ImageTransparency = L_1586_.Transparent and L_1585_arg0.WindUI.TransparencyValue or 0,
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					if L_1586_.UIElements.BackgroundGradient then
						L_1579_(L_1586_.UIElements.BackgroundGradient, 0.2, {
							ImageTransparency = 0,
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					end
					L_1579_(L_1586_.UIElements.Main.Background, 0.4, {
						Size = UDim2.new(1, 0, 1, 0),
					}, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out):Play()
					if L_1597_ then
						if L_1597_:IsA"VideoFrame" then
							L_1597_.Visible = true
						else
							L_1579_(L_1597_, 0.2, {
								ImageTransparency = L_1586_.BackgroundImageTransparency,
							}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
						end
					end
					if L_1586_.OpenButtonMain then
						L_1586_.OpenButtonMain:Visible(false)
					end
					L_1579_(L_1592_, 0.25, {
						ImageTransparency = .7
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					if UIStroke then
						L_1579_(UIStroke, 0.25, {
							Transparency = .8
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					end
					task.spawn(function()
						task.wait(.3)
						L_1579_(L_1602_, .45, {
							Size = UDim2.new(0, 200, 0, 4),
							ImageTransparency = .8
						}, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out):Play()
						L_1606_:Set(true)
						task.wait(.45)
						if L_1586_.Resizable then
							L_1579_(L_1589_.ImageLabel, .45, {
								ImageTransparency = .8
							}, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out):Play()
							L_1586_.CanResize = true
						end
					end)
					L_1586_.CanDropdown = true
					L_1586_.UIElements.Main.Visible = true
					task.spawn(function()
						task.wait(.05)
						L_1586_.UIElements.Main:WaitForChild"Main".Visible = true
						L_1585_arg0.WindUI:ToggleAcrylic(true)
					end)
				end)
			end
			function L_1586_.Close(L_1683_arg0)
				local L_1684_ = {}
				if L_1586_.OnCloseCallback then
					task.spawn(function()
						L_1577_.SafeCallback(L_1586_.OnCloseCallback)
					end)
				end
				L_1585_arg0.WindUI:ToggleAcrylic(false)
				L_1586_.UIElements.Main:WaitForChild"Main".Visible = false
				L_1586_.CanDropdown = false
				L_1586_.Closed = true
				L_1579_(L_1586_.UIElements.Main.Background, 0.32, {
					ImageTransparency = 1,
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut):Play()
				if L_1586_.UIElements.BackgroundGradient then
					L_1579_(L_1586_.UIElements.BackgroundGradient, 0.32, {
						ImageTransparency = 1,
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut):Play()
				end
				L_1579_(L_1586_.UIElements.Main.Background, 0.4, {
					Size = UDim2.new(1, 0, 1, -240),
				}, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut):Play()
				if L_1597_ then
					if L_1597_:IsA"VideoFrame" then
						L_1597_.Visible = false
					else
						L_1579_(L_1597_, 0.3, {
							ImageTransparency = 1,
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					end
				end
				L_1579_(L_1592_, 0.25, {
					ImageTransparency = 1
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				if UIStroke then
					L_1579_(UIStroke, 0.25, {
						Transparency = 1
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				end
				L_1579_(L_1602_, .3, {
					Size = UDim2.new(0, 0, 0, 4),
					ImageTransparency = 1
				}, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut):Play()
				L_1579_(L_1589_.ImageLabel, .3, {
					ImageTransparency = 1
				}, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out):Play()
				L_1606_:Set(false)
				L_1586_.CanResize = false
				task.spawn(function()
					task.wait(0.4)
					L_1586_.UIElements.Main.Visible = false
					if L_1586_.OpenButtonMain and not L_1586_.Destroyed then
						L_1586_.OpenButtonMain:Visible(true)
					end
				end)
				function L_1684_.Destroy(L_1685_arg0)
					task.spawn(function()
						if L_1586_.OnDestroyCallback then
							task.spawn(function()
								L_1577_.SafeCallback(L_1586_.OnDestroyCallback)
							end)
						end
						if L_1586_.AcrylicPaint and L_1586_.AcrylicPaint.Model then
							L_1586_.AcrylicPaint.Model:Destroy()
						end
						L_1586_.Destroyed = true
						task.wait(0.4)
						L_1585_arg0.WindUI.ScreenGui:Destroy()
						L_1585_arg0.WindUI.NotificationGui:Destroy()
						L_1585_arg0.WindUI.DropdownGui:Destroy()
						L_1577_.DisconnectAll()
						return
					end)
				end
				return L_1684_
			end
			function L_1586_.Destroy(L_1686_arg0)
				return L_1586_:Close():Destroy()
			end
			function L_1586_.Toggle(L_1687_arg0)
				if L_1586_.Closed then
					L_1586_:Open()
				else
					L_1586_:Close()
				end
			end
			function L_1586_.ToggleTransparency(L_1688_arg0, L_1689_arg1)
				L_1586_.Transparent = L_1689_arg1
				L_1585_arg0.WindUI.Transparent = L_1689_arg1
				L_1586_.UIElements.Main.Background.ImageTransparency = L_1689_arg1 and L_1585_arg0.WindUI.TransparencyValue or 0
				L_1586_.UIElements.MainBar.Background.ImageTransparency = L_1689_arg1 and 0.97 or 0.95
			end
			function L_1586_.LockAll(L_1690_arg0)
				for L_1691_forvar0, L_1692_forvar1 in next, L_1586_.AllElements do
					if L_1692_forvar1.Lock then
						L_1692_forvar1:Lock()
					end
				end
			end
			function L_1586_.UnlockAll(L_1693_arg0)
				for L_1694_forvar0, L_1695_forvar1 in next, L_1586_.AllElements do
					if L_1695_forvar1.Unlock then
						L_1695_forvar1:Unlock()
					end
				end
			end
			function L_1586_.GetLocked(L_1696_arg0)
				local L_1697_ = {}
				for L_1698_forvar0, L_1699_forvar1 in next, L_1586_.AllElements do
					if L_1699_forvar1.Locked then
						table.insert(L_1697_, L_1699_forvar1)
					end
				end
				return L_1697_
			end
			function L_1586_.GetUnlocked(L_1700_arg0)
				local L_1701_ = {}
				for L_1702_forvar0, L_1703_forvar1 in next, L_1586_.AllElements do
					if L_1703_forvar1.Locked == false then
						table.insert(L_1701_, L_1703_forvar1)
					end
				end
				return L_1701_
			end
			function L_1586_.GetUIScale(L_1704_arg0, L_1705_arg1)
				return L_1585_arg0.WindUI.UIScale
			end
			function L_1586_.SetUIScale(L_1706_arg0, L_1707_arg1)
				L_1585_arg0.WindUI.UIScale = L_1707_arg1
				L_1579_(L_1585_arg0.WindUI.ScreenGui.UIScale, .2, {
					Scale = L_1707_arg1
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				return L_1586_
			end
			function L_1586_.SetToTheCenter(L_1708_arg0)
				L_1579_(L_1586_.UIElements.Main, 0.45, {
					Position = UDim2.new(0.5, 0, 0.5, 0)
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				return L_1586_
			end
			function L_1586_.SetCurrentConfig(L_1709_arg0, L_1710_arg1)
				L_1586_.CurrentConfig = L_1710_arg1
			end
			do
				local L_1711_ = 40
				local L_1712_ = L_1575_.ViewportSize
				local L_1713_ = L_1586_.UIElements.Main.AbsoluteSize
				if not L_1586_.IsFullscreen and L_1586_.AutoScale then
					local L_1714_ = L_1712_.X - (L_1711_ * 2)
					local L_1715_ = L_1712_.Y - (L_1711_ * 2)
					local L_1716_ = L_1714_ / L_1713_.X
					local L_1717_ = L_1715_ / L_1713_.Y
					local L_1718_ = math.min(L_1716_, L_1717_)
					local L_1719_ = 0.3
					local L_1720_ = 1.0
					local L_1721_ = math.clamp(L_1718_, L_1719_, L_1720_)
					local L_1722_ = L_1586_:GetUIScale() or 1
					local L_1723_ = 0.05
					if math.abs(L_1721_ - L_1722_) > L_1723_ then
						L_1586_:SetUIScale(L_1721_)
					end
				end
			end
			if L_1586_.OpenButtonMain and L_1586_.OpenButtonMain.Button then
				L_1577_.AddSignal(L_1586_.OpenButtonMain.Button.TextButton.MouseButton1Click, function()
					L_1586_:Open()
				end)
			end
			L_1577_.AddSignal(L_1574_.InputBegan, function(L_1724_arg0, L_1725_arg1)
				if L_1725_arg1 then
					return
				end
				if L_1586_.ToggleKey then
					if L_1724_arg0.KeyCode == L_1586_.ToggleKey then
						L_1586_:Toggle()
					end
				end
			end)
			task.spawn(function()
				L_1586_:Open()
			end)
			function L_1586_.EditOpenButton(L_1726_arg0, L_1727_arg1)
				return L_1586_.OpenButtonMain:Edit(L_1727_arg1)
			end
			if L_1586_.OpenButton and typeof(L_1586_.OpenButton) == "table" then
				L_1586_:EditOpenButton(L_1586_.OpenButton)
			end
			local L_1609_ = L_1_.load'S'
			local L_1610_ = L_1_.load'T'
			local L_1611_ = L_1609_.Init(L_1586_, L_1585_arg0.WindUI, L_1585_arg0.Parent.Parent.ToolTips)
			L_1611_:OnChange(function(L_1728_arg0)
				L_1586_.CurrentTab = L_1728_arg0
			end)
			L_1586_.TabModule = L_1609_
			function L_1586_.Tab(L_1729_arg0, L_1730_arg1)
				L_1730_arg1.Parent = L_1586_.UIElements.SideBar.Frame
				return L_1611_.New(L_1730_arg1, L_1585_arg0.WindUI.UIScale)
			end
			function L_1586_.SelectTab(L_1731_arg0, L_1732_arg1)
				L_1611_:SelectTab(L_1732_arg1)
			end
			function L_1586_.Section(L_1733_arg0, L_1734_arg1)
				return L_1610_.New(L_1734_arg1, L_1586_.UIElements.SideBar.Frame, L_1586_.Folder, L_1585_arg0.WindUI.UIScale, L_1586_)
			end
			function L_1586_.IsResizable(L_1735_arg0, L_1736_arg1)
				L_1586_.Resizable = L_1736_arg1
				L_1586_.CanResize = L_1736_arg1
			end
			function L_1586_.Divider(L_1737_arg0)
				local L_1738_ = L_1578_("Frame", {
					Size = UDim2.new(1, 0, 0, 1),
					Position = UDim2.new(0.5, 0, 0, 0),
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundTransparency = .9,
					ThemeTag = {
						BackgroundColor3 = "Text"
					}
				})
				local L_1739_ = L_1578_("Frame", {
					Parent = L_1586_.UIElements.SideBar.Frame,
					Size = UDim2.new(1, -7, 0, 5),
					BackgroundTransparency = 1,
				}, {
					L_1738_
				})
				return L_1739_
			end
			local L_1612_ = L_1_.load'k'.Init(L_1586_, nil)
			function L_1586_.Dialog(L_1740_arg0, L_1741_arg1)
				local L_1742_ = {
					Title = L_1741_arg1.Title or "Dialog",
					Width = L_1741_arg1.Width or 320,
					Content = L_1741_arg1.Content,
					Buttons = L_1741_arg1.Buttons or {},
					TextPadding = 10,
				}
				local L_1743_ = L_1612_.Create(false)
				L_1743_.UIElements.Main.Size = UDim2.new(0, L_1742_.Width, 0, 0)
				local L_1744_ = L_1578_("Frame", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
					BackgroundTransparency = 1,
					Parent = L_1743_.UIElements.Main
				}, {
					L_1578_("UIListLayout", {
						FillDirection = "Horizontal",
						Padding = UDim.new(0, L_1743_.UIPadding),
						VerticalAlignment = "Center"
					}),
					L_1578_("UIPadding", {
						PaddingTop = UDim.new(0, L_1742_.TextPadding / 2),
						PaddingLeft = UDim.new(0, L_1742_.TextPadding / 2),
						PaddingRight = UDim.new(0, L_1742_.TextPadding / 2),
					})
				})
				local L_1745_
				if L_1741_arg1.Icon then
					L_1745_ = L_1577_.Image(
L_1741_arg1.Icon,
L_1742_.Title .. ":" .. L_1741_arg1.Icon,
0,
L_1586_,
"Dialog",
true,
L_1741_arg1.IconThemed
)
					L_1745_.Size = UDim2.new(0, 22, 0, 22)
					L_1745_.Parent = L_1744_
				end
				L_1743_.UIElements.UIListLayout = L_1578_("UIListLayout", {
					Padding = UDim.new(0, 12),
					FillDirection = "Vertical",
					HorizontalAlignment = "Left",
					Parent = L_1743_.UIElements.Main
				})
				L_1578_("UISizeConstraint", {
					MinSize = Vector2.new(180, 20),
					MaxSize = Vector2.new(400, math.huge),
					Parent = L_1743_.UIElements.Main,
				})
				L_1743_.UIElements.Title = L_1578_("TextLabel", {
					Text = L_1742_.Title,
					TextSize = 20,
					FontFace = Font.new(L_1577_.Font, Enum.FontWeight.SemiBold),
					TextXAlignment = "Left",
					TextWrapped = true,
					RichText = true,
					Size = UDim2.new(1, L_1745_ and -26 - L_1743_.UIPadding or 0, 0, 0),
					AutomaticSize = "Y",
					ThemeTag = {
						TextColor3 = "Text"
					},
					BackgroundTransparency = 1,
					Parent = L_1744_
				})
				if L_1742_.Content then
					L_1578_("TextLabel", {
						Text = L_1742_.Content,
						TextSize = 18,
						TextTransparency = .4,
						TextWrapped = true,
						RichText = true,
						FontFace = Font.new(L_1577_.Font, Enum.FontWeight.Medium),
						TextXAlignment = "Left",
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = "Y",
						LayoutOrder = 2,
						ThemeTag = {
							TextColor3 = "Text"
						},
						BackgroundTransparency = 1,
						Parent = L_1743_.UIElements.Main
					}, {
						L_1578_("UIPadding", {
							PaddingLeft = UDim.new(0, L_1742_.TextPadding / 2),
							PaddingRight = UDim.new(0, L_1742_.TextPadding / 2),
							PaddingBottom = UDim.new(0, L_1742_.TextPadding / 2),
						})
					})
				end
				local L_1746_ = L_1578_("UIListLayout", {
					Padding = UDim.new(0, 6),
					FillDirection = "Horizontal",
					HorizontalAlignment = "Right",
				})
				local L_1747_ = L_1578_("Frame", {
					Size = UDim2.new(1, 0, 0, 40),
					AutomaticSize = "None",
					BackgroundTransparency = 1,
					Parent = L_1743_.UIElements.Main,
					LayoutOrder = 4,
				}, {
					L_1746_,
				})
				local L_1748_ = {}
				for L_1750_forvar0, L_1751_forvar1 in next, L_1742_.Buttons do
					local L_1752_ = L_1581_(L_1751_forvar1.Title, L_1751_forvar1.Icon, L_1751_forvar1.Callback, L_1751_forvar1.Variant, L_1747_, L_1743_, false)
					table.insert(L_1748_, L_1752_)
				end
				local function L_1749_func()
					L_1746_.FillDirection = Enum.FillDirection.Horizontal
					L_1746_.HorizontalAlignment = Enum.HorizontalAlignment.Right
					L_1746_.VerticalAlignment = Enum.VerticalAlignment.Center
					L_1747_.AutomaticSize = Enum.AutomaticSize.None
					for L_1755_forvar0, L_1756_forvar1 in ipairs(L_1748_) do
						L_1756_forvar1.Size = UDim2.new(0, 0, 1, 0)
						L_1756_forvar1.AutomaticSize = Enum.AutomaticSize.X
					end
					wait()
					local L_1753_ = L_1746_.AbsoluteContentSize.X / L_1585_arg0.WindUI.UIScale
					local L_1754_ = L_1747_.AbsoluteSize.X / L_1585_arg0.WindUI.UIScale
					if L_1753_ > L_1754_ then
						L_1746_.FillDirection = Enum.FillDirection.Vertical
						L_1746_.HorizontalAlignment = Enum.HorizontalAlignment.Right
						L_1746_.VerticalAlignment = Enum.VerticalAlignment.Bottom
						L_1747_.AutomaticSize = Enum.AutomaticSize.Y
						for L_1757_forvar0, L_1758_forvar1 in ipairs(L_1748_) do
							L_1758_forvar1.Size = UDim2.new(1, 0, 0, 40)
							L_1758_forvar1.AutomaticSize = Enum.AutomaticSize.None
						end
					else
						local L_1759_ = L_1754_ - L_1753_
						if L_1759_ > 0 then
							local L_1760_
							local L_1761_ = math.huge
							for L_1762_forvar0, L_1763_forvar1 in ipairs(L_1748_) do
								local L_1764_ = L_1763_forvar1.AbsoluteSize.X / L_1585_arg0.WindUI.UIScale
								if L_1764_ < L_1761_ then
									L_1761_ = L_1764_
									L_1760_ = L_1763_forvar1
								end
							end
							if L_1760_ then
								L_1760_.Size = UDim2.new(0, L_1761_ + L_1759_, 1, 0)
								L_1760_.AutomaticSize = Enum.AutomaticSize.None
							end
						end
					end
				end
				L_1577_.AddSignal(L_1743_.UIElements.Main:GetPropertyChangedSignal"AbsoluteSize", L_1749_func)
				L_1749_func()
				wait()
				L_1743_:Open()
				return L_1743_
			end
			L_1586_:CreateTopbarButton("Close", "x", function()
				if not L_1586_.IgnoreAlerts then
					L_1586_:SetToTheCenter()
					L_1586_:Dialog{
						Title = "Close Window",
						Content = "Do you want to close this window? You will not be able to open it again.",
						Buttons = {
							{
								Title = "Cancel",
								Callback = function()
								end,
								Variant = "Secondary",
							},
							{
								Title = "Close Window",
								Callback = function()
									L_1586_:Destroy()
								end,
								Variant = "Primary",
							}
						}
					}
				else
					L_1586_:Destroy()
				end
			end, 999)
			function L_1586_.Tag(L_1765_arg0, L_1766_arg1)
				if L_1586_.UIElements.Main.Main.Topbar.Center.Visible == false then
					L_1586_.UIElements.Main.Main.Topbar.Center.Visible = true
				end
				return L_1583_:New(L_1766_arg1, L_1586_.UIElements.Main.Main.Topbar.Center)
			end
			local function L_1613_func(L_1767_arg0)
				if L_1586_.CanResize then
					isResizing = true
					L_1590_.Active = true
					initialSize = L_1586_.UIElements.Main.Size
					initialInputPosition = L_1767_arg0.Position
					L_1579_(L_1589_.ImageLabel, 0.1, {
						ImageTransparency = .35
					}):Play()
					L_1577_.AddSignal(L_1767_arg0.Changed, function()
						if L_1767_arg0.UserInputState == Enum.UserInputState.End then
							isResizing = false
							L_1590_.Active = false
							L_1579_(L_1589_.ImageLabel, 0.17, {
								ImageTransparency = .8
							}):Play()
						end
					end)
				end
			end
			L_1577_.AddSignal(L_1589_.InputBegan, function(L_1768_arg0)
				if L_1768_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_1768_arg0.UserInputType == Enum.UserInputType.Touch then
					if L_1586_.CanResize then
						L_1613_func(L_1768_arg0)
					end
				end
			end)
			L_1577_.AddSignal(L_1574_.InputChanged, function(L_1769_arg0)
				if L_1769_arg0.UserInputType == Enum.UserInputType.MouseMovement or L_1769_arg0.UserInputType == Enum.UserInputType.Touch then
					if isResizing and L_1586_.CanResize then
						local L_1770_ = L_1769_arg0.Position - initialInputPosition
						local L_1771_ = UDim2.new(0, initialSize.X.Offset + L_1770_.X * 2, 0, initialSize.Y.Offset + L_1770_.Y * 2)
						L_1771_ = UDim2.new(
L_1771_.X.Scale,
math.clamp(L_1771_.X.Offset, L_1586_.MinSize.X, L_1586_.MaxSize.X),
L_1771_.Y.Scale,
math.clamp(L_1771_.Y.Offset, L_1586_.MinSize.Y, L_1586_.MaxSize.Y)
)
						L_1579_(L_1586_.UIElements.Main, 0, {
							Size = L_1771_
						}):Play()
						L_1586_.Size = L_1771_
					end
				end
			end)
			local L_1614_ = 0
			local L_1615_ = 0.4
			local L_1616_
			local L_1617_ = 0
			function onDoubleClick()
				L_1586_:SetToTheCenter()
			end
			L_1602_.Frame.MouseButton1Up:Connect(function()
				local L_1772_ = tick()
				local L_1773_ = L_1586_.Position
				L_1617_ = L_1617_ + 1
				if L_1617_ == 1 then
					L_1614_ = L_1772_
					L_1616_ = L_1773_
					task.spawn(function()
						task.wait(L_1615_)
						if L_1617_ == 1 then
							L_1617_ = 0
							L_1616_ = nil
						end
					end)
				elseif L_1617_ == 2 then
					if L_1772_ - L_1614_ <= L_1615_ and L_1773_ == L_1616_ then
						onDoubleClick()
					end
					L_1617_ = 0
					L_1616_ = nil
					L_1614_ = 0
				else
					L_1617_ = 1
					L_1614_ = L_1772_
					L_1616_ = L_1773_
				end
			end)
			if not L_1586_.HideSearchBar then
				local L_1774_ = L_1_.load'V'
				local L_1775_ = false
				local L_1776_ = L_1580_("Search", "search", L_1586_.UIElements.SideBarContainer, true)
				L_1776_.Size = UDim2.new(1, -L_1586_.UIPadding / 2, 0, 39)
				L_1776_.Position = UDim2.new(0, L_1586_.UIPadding / 2, 0, L_1586_.UIPadding / 2)
				L_1577_.AddSignal(L_1776_.MouseButton1Click, function()
					if L_1775_ then
						return
					end
					L_1774_.new(L_1586_.TabModule, L_1586_.UIElements.Main, function()
						L_1775_ = false
						if L_1586_.Resizable then
							L_1586_.CanResize = true
						end
						L_1579_(L_1591_, 0.1, {
							ImageTransparency = 1
						}):Play()
						L_1591_.Active = false
					end)
					L_1579_(L_1591_, 0.1, {
						ImageTransparency = .65
					}):Play()
					L_1591_.Active = true
					L_1775_ = true
					L_1586_.CanResize = false
				end)
			end
			function L_1586_.DisableTopbarButtons(L_1777_arg0, L_1778_arg1)
				for L_1779_forvar0, L_1780_forvar1 in next, L_1778_arg1 do
					for L_1781_forvar0, L_1782_forvar1 in next, L_1586_.TopBarButtons do
						if L_1782_forvar1.Name == L_1780_forvar1 then
							L_1782_forvar1.Object.Visible = false
						end
					end
				end
			end
			return L_1586_
		end
	end
end
local L_2_ = {
	Window = nil,
	Theme = nil,
	Creator = L_1_.load'a',
	LocalizationModule = L_1_.load'b',
	NotificationModule = L_1_.load'c',
	Themes = nil,
	Transparent = false,
	TransparencyValue = .15,
	UIScale = 1,
	ConfigManager = nil,
	Version = "0.0.0",
	Services = L_1_.load'g',
	OnThemeChangeFunction = nil,
}


local L_3_ = game:GetService"HttpService"


local L_4_ = L_3_:JSONDecode(L_1_.load'h')
if L_4_ then
	L_2_.Version = L_4_.version
end

local L_5_ = L_1_.load'l'
local L_6_ =

L_2_.Services

local L_7_ = L_2_.Creator

local L_8_ = L_7_.New
local L_9_ =
L_7_.Tween


local L_10_ = L_1_.load'p'
local L_11_ =

game:GetService"Players" and game:GetService"Players".LocalPlayer or nil

local L_12_ = protectgui or (syn and syn.protect_gui) or function()
end

local L_13_ = gethui and gethui() or (game.CoreGui or game.Players.LocalPlayer:WaitForChild"PlayerGui")


L_2_.ScreenGui = L_8_("ScreenGui", {
	Name = "WindUI",
	Parent = L_13_,
	IgnoreGuiInset = true,
	ScreenInsets = "None",
}, {
	L_8_("UIScale", {
		Scale = L_2_.Scale,
	}),
	L_8_("Folder", {
		Name = "Window"
	}),
	L_8_("Folder", {
		Name = "KeySystem"
	}),
	L_8_("Folder", {
		Name = "Popups"
	}),
	L_8_("Folder", {
		Name = "ToolTips"
	})
})

L_2_.NotificationGui = L_8_("ScreenGui", {
	Name = "WindUI/Notifications",
	Parent = L_13_,
	IgnoreGuiInset = true,
})
L_2_.DropdownGui = L_8_("ScreenGui", {
	Name = "WindUI/Dropdowns",
	Parent = L_13_,
	IgnoreGuiInset = true,
})
L_12_(L_2_.ScreenGui)
L_12_(L_2_.NotificationGui)
L_12_(L_2_.DropdownGui)

L_7_.Init(L_2_)

math.clamp(L_2_.TransparencyValue, 0, 1)

local L_14_ = L_2_.NotificationModule.Init(L_2_.NotificationGui)

function L_2_.Notify(L_1783_arg0, L_1784_arg1)
	L_1784_arg1.Holder = L_14_.Frame
	L_1784_arg1.Window = L_2_.Window
	return L_2_.NotificationModule.New(L_1784_arg1)
end

function L_2_.SetNotificationLower(L_1785_arg0, L_1786_arg1)
	L_14_.SetLower(L_1786_arg1)
end

function L_2_.SetFont(L_1787_arg0, L_1788_arg1)
	L_7_.UpdateFont(L_1788_arg1)
end

function L_2_.OnThemeChange(L_1789_arg0, L_1790_arg1)
	L_2_.OnThemeChangeFunction = L_1790_arg1
end

function L_2_.AddTheme(L_1791_arg0, L_1792_arg1)
	L_2_.Themes[L_1792_arg1.Name] = L_1792_arg1
	return L_1792_arg1
end

function L_2_.SetTheme(L_1793_arg0, L_1794_arg1)
	if L_2_.Themes[L_1794_arg1] then
		L_2_.Theme = L_2_.Themes[L_1794_arg1]
		L_7_.SetTheme(L_2_.Themes[L_1794_arg1])
		if L_2_.OnThemeChangeFunction then
			L_2_.OnThemeChangeFunction(L_1794_arg1)
		end
		return L_2_.Themes[L_1794_arg1]
	end
	return nil
end

function L_2_.GetThemes(L_1795_arg0)
	return L_2_.Themes
end
function L_2_.GetCurrentTheme(L_1796_arg0)
	return L_2_.Theme.Name
end
function L_2_.GetTransparency(L_1797_arg0)
	return L_2_.Transparent or false
end
function L_2_.GetWindowSize(L_1798_arg0)
	return Window.UIElements.Main.Size
end
function L_2_.Localization(L_1799_arg0, L_1800_arg1)
	return L_2_.LocalizationModule:New(L_1800_arg1, L_7_)
end

function L_2_.SetLanguage(L_1801_arg0, L_1802_arg1)
	if L_7_.Localization then
		return L_7_.SetLanguage(L_1802_arg1)
	end
	return false
end

function L_2_.ToggleAcrylic(L_1803_arg0, L_1804_arg1)
	if L_2_.Window and L_2_.Window.AcrylicPaint and L_2_.Window.AcrylicPaint.Model then
		L_2_.Window.Acrylic = L_1804_arg1
		L_2_.Window.AcrylicPaint.Model.Transparency = L_1804_arg1 and 0.98 or 1
		if L_1804_arg1 then
			L_10_.Enable()
		else
			L_10_.Disable()
		end
	end
end



function L_2_.Gradient(L_1805_arg0, L_1806_arg1, L_1807_arg2)
	local L_1808_ = {}
	local L_1809_ = {}
	for L_1811_forvar0, L_1812_forvar1 in next, L_1806_arg1 do
		local L_1813_ = tonumber(L_1811_forvar0)
		if L_1813_ then
			L_1813_ = math.clamp(L_1813_ / 100, 0, 1)
			table.insert(L_1808_, ColorSequenceKeypoint.new(L_1813_, L_1812_forvar1.Color))
			table.insert(L_1809_, NumberSequenceKeypoint.new(L_1813_, L_1812_forvar1.Transparency or 0))
		end
	end
	table.sort(L_1808_, function(L_1814_arg0, L_1815_arg1)
		return L_1814_arg0.Time < L_1815_arg1.Time
	end)
	table.sort(L_1809_, function(L_1816_arg0, L_1817_arg1)
		return L_1816_arg0.Time < L_1817_arg1.Time
	end)
	if #L_1808_ < 2 then
		error"ColorSequence requires at least 2 keypoints"
	end
	local L_1810_ = {
		Color = ColorSequence.new(L_1808_),
		Transparency = NumberSequence.new(L_1809_),
	}
	if L_1807_arg2 then
		for L_1818_forvar0, L_1819_forvar1 in pairs(L_1807_arg2) do
			L_1810_[L_1818_forvar0] = L_1819_forvar1
		end
	end
	return L_1810_
end


function L_2_.Popup(L_1820_arg0, L_1821_arg1)
	L_1821_arg1.WindUI = L_2_
	return L_1_.load'q'.new(L_1821_arg1)
end


L_2_.Themes = L_1_.load'r'(L_2_)

L_7_.Themes = L_2_.Themes


L_2_:SetTheme"Dark"
L_2_:SetLanguage(L_7_.Language)


function L_2_.CreateWindow(L_1822_arg0, L_1823_arg1)
	local L_1824_ = L_1_.load'W'
	if not isfolder"WindUI" then
		makefolder"WindUI"
	end
	if L_1823_arg1.Folder then
		makefolder(L_1823_arg1.Folder)
	else
		makefolder(L_1823_arg1.Title)
	end
	L_1823_arg1.WindUI = L_2_
	L_1823_arg1.Parent = L_2_.ScreenGui.Window
	if L_2_.Window then
		warn"You cannot create more than one window"
		return
	end
	local L_1825_ = true
	local L_1826_ = L_2_.Themes[L_1823_arg1.Theme or "Dark"]
	L_7_.SetTheme(L_1826_)
	local L_1827_ = gethwid or function()
		return game:GetService"Players".LocalPlayer.UserId
	end
	local L_1828_ = L_1827_()
	if L_1823_arg1.KeySystem then
		L_1825_ = false
		local function L_1830_func()
			L_5_.new(L_1823_arg1, L_1828_, function(L_1832_arg0)
				L_1825_ = L_1832_arg0
			end)
		end
		local L_1831_ = L_1823_arg1.Folder .. "/" .. L_1828_ .. ".key"
		if not L_1823_arg1.KeySystem.API then
			if L_1823_arg1.KeySystem.SaveKey and isfile(L_1831_) then
				local L_1833_ = readfile(L_1831_)
				local L_1834_ = (type(L_1823_arg1.KeySystem.Key) == "table")
and table.find(L_1823_arg1.KeySystem.Key, L_1833_)
or tostring(L_1823_arg1.KeySystem.Key) == tostring(L_1833_)
				if L_1834_ then
					L_1825_ = true
				else
					L_1830_func()
				end
			else
				L_1830_func()
			end
		else
			if isfile(L_1831_) then
				local L_1835_ = readfile(L_1831_)
				local L_1836_ = false
				for L_1837_forvar0, L_1838_forvar1 in next, L_1823_arg1.KeySystem.API do
					local L_1839_ = L_2_.Services[L_1838_forvar1.Type]
					if L_1839_ then
						local L_1840_ = {}
						for L_1843_forvar0, L_1844_forvar1 in next, L_1839_.Args do
							table.insert(L_1840_, L_1838_forvar1[L_1844_forvar1])
						end
						local L_1841_ = L_1839_.New(table.unpack(L_1840_))
						local L_1842_ = L_1841_.Verify(L_1835_)
						if L_1842_ then
							L_1836_ = true
							break
						end
					end
				end
				L_1825_ = L_1836_
				if not L_1836_ then
					L_1830_func()
				end
			else
				L_1830_func()
			end
		end
		repeat
			task.wait()
		until L_1825_
	end
	local L_1829_ = L_1824_(L_1823_arg1)
	L_2_.Transparent = L_1823_arg1.Transparent
	L_2_.Window = L_1829_
	if L_1823_arg1.Acrylic then
		L_10_.init()
	end
	return L_1829_
end

return L_2_
