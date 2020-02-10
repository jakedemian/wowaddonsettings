-------------------------------------
--   P R E S E T S   M O D U L E   --
-------------------------------------
select(2, ...).Presets = {
	["ALL"] = setmetatable({}, { __index = function() return true; end}),
	["DEATHKNIGHT"] = {
		true, -- [1]
		true, -- [2]
		true, -- [3]
		false, -- [4]
		false, -- [5]
		false, -- [6]
		true, -- [7]
		false, -- [8]
		true, -- [9]
		true, -- [10]
		true, -- [11]
		nil, -- [12]
		nil, -- [13]
		nil, -- [14]
		nil, -- [15]
		nil, -- [16]
		nil, -- [17]
		nil, -- [18]
		nil, -- [19]
		false, -- [20]
		true, -- [21]
		true, -- [22]
		true, -- [23]
		true, -- [24]
		true, -- [25]
		true, -- [26]
		false, -- [27]
		false, -- [28]
		true, -- [29]
		false, -- [30]
		false, -- [31]
		false, -- [32]
		false, -- [33]
		false, -- [34]
		false, -- [35]
		true, -- [36]
		[50] = true,
		[57] = true,
		[103] = true,
		[100] = true,
		[104] = true,
		[101] = true,
		[105] = true,
		[102] = true,
		[106] = true,
		[200] = true,
		[51] = false,
		[52] = false,
		[53] = false,
		[54] = false,
		[55] = false,
		[113] = false,
	},
	["DEMONHUNTER"] = {
		true, -- [1]
		true, -- [2]
		true, -- [3]
		false, -- [4]
		true, -- [5]
		false, -- [6]
		false, -- [7]
		false, -- [8]
		true, -- [9]
		true, -- [10]
		true, -- [11]
		nil, -- [12]
		nil, -- [13]
		nil, -- [14]
		nil, -- [15]
		nil, -- [16]
		nil, -- [17]
		nil, -- [18]
		nil, -- [19]
		false, -- [20]
		true, -- [21]
		false, -- [22]
		false, -- [23]
		false, -- [24]
		true, -- [25]
		false, -- [26]
		false, -- [27]
		false, -- [28]
		false, -- [29]
		false, -- [30]
		false, -- [31]
		false, -- [32]
		false, -- [33]
		true, -- [34]
		true, -- [35]
		true, -- [36]
		[50] = true,
		[57] = true,
		[103] = true,
		[100] = true,
		[104] = true,
		[101] = true,
		[105] = true,
		[102] = true,
		[106] = true,
		[200] = true,
		[51] = false,
		[52] = false,
		[53] = false,
		[54] = false,
		[55] = false,
		[113] = false,
	},
	["DRUID"] = {
		true, -- [1]
		true, -- [2]
		true, -- [3]
		false, -- [4]
		true, -- [5]
		false, -- [6]
		false, -- [7]
		false, -- [8]
		true, -- [9]
		true, -- [10]
		true, -- [11]
		nil, -- [12]
		nil, -- [13]
		nil, -- [14]
		nil, -- [15]
		nil, -- [16]
		nil, -- [17]
		nil, -- [18]
		nil, -- [19]
		true, -- [20]
		false, -- [21]
		false, -- [22]
		true, -- [23]
		true, -- [24]
		false, -- [25]
		false, -- [26]
		false, -- [27]
		true, -- [28]
		true, -- [29]
		true, -- [30]
		false, -- [31]
		false, -- [32]
		false, -- [33]
		true, -- [34]
		false, -- [35]
		true, -- [36]
		[50] = true,
		[57] = true,
		[103] = true,
		[100] = true,
		[104] = true,
		[101] = true,
		[105] = true,
		[102] = true,
		[106] = true,
		[200] = true,
		[51] = false,
		[52] = false,
		[53] = false,
		[54] = false,
		[55] = false,
		[113] = false,
	},
	["HUNTER"] = {
		true, -- [1]
		true, -- [2]
		true, -- [3]
		false, -- [4]
		false, -- [5]
		true, -- [6]
		false, -- [7]
		false, -- [8]
		true, -- [9]
		true, -- [10]
		true, -- [11]
		nil, -- [12]
		nil, -- [13]
		nil, -- [14]
		nil, -- [15]
		nil, -- [16]
		nil, -- [17]
		nil, -- [18]
		nil, -- [19]
		true, -- [20]
		true, -- [21]
		true, -- [22]
		false, -- [23]
		false, -- [24]
		true, -- [25]
		true, -- [26]
		false, -- [27]
		true, -- [28]
		true, -- [29]
		true, -- [30]
		true, -- [31]
		true, -- [32]
		true, -- [33]
		true, -- [34]
		false, -- [35]
		true, -- [36]
		[50] = true,
		[57] = true,
		[106] = true,
		[101] = true,
		[103] = true,
		[105] = true,
		[100] = true,
		[102] = true,
		[104] = true,
		[200] = true,
		[51] = false,
		[52] = false,
		[53] = false,
		[54] = false,
		[55] = false,
		[113] = false,
	},
	["MAGE"] = {
		true, -- [1]
		true, -- [2]
		true, -- [3]
		true, -- [4]
		false, -- [5]
		false, -- [6]
		false, -- [7]
		false, -- [8]
		true, -- [9]
		true, -- [10]
		true, -- [11]
		nil, -- [12]
		nil, -- [13]
		nil, -- [14]
		nil, -- [15]
		nil, -- [16]
		nil, -- [17]
		nil, -- [18]
		nil, -- [19]
		true, -- [20]
		false, -- [21]
		false, -- [22]
		false, -- [23]
		false, -- [24]
		true, -- [25]
		false, -- [26]
		true, -- [27]
		true, -- [28]
		false, -- [29]
		false, -- [30]
		false, -- [31]
		false, -- [32]
		false, -- [33]
		false, -- [34]
		false, -- [35]
		true, -- [36]
		[50] = true,
		[57] = true,
		[103] = true,
		[100] = true,
		[104] = true,
		[101] = true,
		[105] = true,
		[102] = true,
		[106] = true,
		[200] = true,
		[51] = false,
		[52] = false,
		[53] = false,
		[54] = false,
		[55] = false,
		[113] = false,
	},
	["MONK"] = {
		true, -- [1]
		true, -- [2]
		true, -- [3]
		false, -- [4]
		true, -- [5]
		false, -- [6]
		false, -- [7]
		false, -- [8]
		true, -- [9]
		true, -- [10]
		true, -- [11]
		nil, -- [12]
		nil, -- [13]
		nil, -- [14]
		nil, -- [15]
		nil, -- [16]
		nil, -- [17]
		nil, -- [18]
		nil, -- [19]
		false, -- [20]
		true, -- [21]
		false, -- [22]
		true, -- [23]
		false, -- [24]
		true, -- [25]
		false, -- [26]
		false, -- [27]
		true, -- [28]
		true, -- [29]
		true, -- [30]
		false, -- [31]
		false, -- [32]
		false, -- [33]
		true, -- [34]
		false, -- [35]
		true, -- [36]
		[50] = true,
		[57] = true,
		[103] = true,
		[100] = true,
		[104] = true,
		[101] = true,
		[105] = true,
		[102] = true,
		[106] = true,
		[200] = true,
		[51] = false,
		[52] = false,
		[53] = false,
		[54] = false,
		[55] = false,
		[113] = false,
	},
	["PALADIN"] = {
		true, -- [1]
		true, -- [2]
		true, -- [3]
		false, -- [4]
		false, -- [5]
		false, -- [6]
		true, -- [7]
		true, -- [8]
		true, -- [9]
		true, -- [10]
		true, -- [11]
		nil, -- [12]
		nil, -- [13]
		nil, -- [14]
		nil, -- [15]
		nil, -- [16]
		nil, -- [17]
		nil, -- [18]
		nil, -- [19]
		false, -- [20]
		true, -- [21]
		true, -- [22]
		true, -- [23]
		true, -- [24]
		true, -- [25]
		true, -- [26]
		false, -- [27]
		false, -- [28]
		true, -- [29]
		false, -- [30]
		false, -- [31]
		false, -- [32]
		false, -- [33]
		false, -- [34]
		false, -- [35]
		true, -- [36]
		[50] = true,
		[57] = true,
		[103] = true,
		[100] = true,
		[104] = true,
		[101] = true,
		[105] = true,
		[102] = true,
		[106] = true,
		[200] = true,
		[51] = false,
		[52] = false,
		[53] = false,
		[54] = false,
		[55] = false,
		[113] = false,
	},
	["PRIEST"] = {
		true, -- [1]
		true, -- [2]
		true, -- [3]
		true, -- [4]
		false, -- [5]
		false, -- [6]
		false, -- [7]
		false, -- [8]
		true, -- [9]
		true, -- [10]
		true, -- [11]
		[50] = true,
		[31] = false,
		[32] = false,
		[33] = false,
		[34] = false,
		[101] = true,
		[103] = true,
		[20] = true,
		[21] = false,
		[22] = false,
		[23] = true,
		[36] = true,
		[24] = false,
		[104] = true,
		[25] = false,
		[105] = true,
		[26] = false,
		[102] = true,
		[27] = true,
		[106] = true,
		[28] = true,
		[29] = false,
		[100] = true,
		[200] = true,
		[51] = false,
		[52] = false,
		[53] = false,
		[54] = false,
		[55] = false,
		[113] = false,
		[35] = false,
		[57] = true,
	},
	["ROGUE"] = {
		true, -- [1]
		true, -- [2]
		true, -- [3]
		false, -- [4]
		true, -- [5]
		false, -- [6]
		false, -- [7]
		false, -- [8]
		true, -- [9]
		true, -- [10]
		true, -- [11]
		nil, -- [12]
		nil, -- [13]
		nil, -- [14]
		nil, -- [15]
		nil, -- [16]
		nil, -- [17]
		nil, -- [18]
		nil, -- [19]
		true, -- [20]
		true, -- [21]
		false, -- [22]
		true, -- [23]
		false, -- [24]
		true, -- [25]
		false, -- [26]
		false, -- [27]
		false, -- [28]
		false, -- [29]
		nil, -- [30]
		true, -- [31]
		true, -- [32]
		true, -- [33]
		true, -- [34]
		false, -- [35]
		[50] = true,
		[57] = true,
		[103] = true,
		[100] = true,
		[104] = true,
		[101] = true,
		[105] = true,
		[102] = true,
		[106] = true,
		[200] = true,
		[51] = false,
		[52] = false,
		[53] = false,
		[54] = false,
		[55] = false,
		[113] = false,
	},
	["SHAMAN"] = {
		true, -- [1]
		true, -- [2]
		true, -- [3]
		false, -- [4]
		false, -- [5]
		true, -- [6]
		false, -- [7]
		true, -- [8]
		true, -- [9]
		true, -- [10]
		true, -- [11]
		[50] = true,
		[57] = true,
		[31] = false,
		[32] = false,
		[33] = false,
		[34] = true,
		[101] = true,
		[103] = true,
		[20] = true,
		[21] = true,
		[22] = true,
		[23] = true,
		[24] = true,
		[104] = true,
		[25] = false,
		[105] = true,
		[26] = false,
		[102] = true,
		[27] = false,
		[106] = true,
		[28] = true,
		[29] = false,
		[100] = true,
		[200] = true,
		[51] = false,
		[52] = false,
		[53] = false,
		[54] = false,
		[55] = false,
		[113] = false,
		[35] = false,
	},
	["WARLOCK"] = {
		true, -- [1]
		true, -- [2]
		true, -- [3]
		true, -- [4]
		false, -- [5]
		false, -- [6]
		false, -- [7]
		false, -- [8]
		true, -- [9]
		true, -- [10]
		true, -- [11]
		[50] = true,
		[30] = false,
		[31] = false,
		[32] = false,
		[33] = false,
		[34] = false,
		[35] = false,
		[57] = true,
		[101] = true,
		[103] = true,
		[20] = true,
		[21] = false,
		[22] = false,
		[23] = false,
		[24] = false,
		[25] = true,
		[26] = false,
		[102] = true,
		[27] = true,
		[28] = true,
		[36] = true,
		[29] = false,
		[100] = true,
		[200] = true,
		[51] = false,
		[52] = false,
		[53] = false,
		[54] = false,
		[55] = false,
		[113] = false,
	},
	["WARRIOR"] = {
		true, -- [1]
		true, -- [2]
		true, -- [3]
		false, -- [4]
		false, -- [5]
		false, -- [6]
		true, -- [7]
		true, -- [8]
		true, -- [9]
		true, -- [10]
		true, -- [11]
		nil, -- [12]
		nil, -- [13]
		nil, -- [14]
		nil, -- [15]
		nil, -- [16]
		nil, -- [17]
		nil, -- [18]
		nil, -- [19]
		true, -- [20]
		true, -- [21]
		true, -- [22]
		true, -- [23]
		true, -- [24]
		true, -- [25]
		true, -- [26]
		false, -- [27]
		true, -- [28]
		true, -- [29]
		true, -- [30]
		true, -- [31]
		true, -- [32]
		true, -- [33]
		true, -- [34]
		false, -- [35]
		true, -- [36]
		[50] = true,
		[57] = true,
		[103] = true,
		[100] = true,
		[104] = true,
		[101] = true,
		[105] = true,
		[102] = true,
		[106] = true,
		[200] = true,
		[51] = false,
		[52] = false,
		[53] = false,
		[54] = false,
		[55] = false,
		[113] = false,
	},
}