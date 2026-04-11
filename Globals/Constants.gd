extends Node

const DEFAULT_COLORS = [
	{
		"displayName": "Sapphire",
		"accessibilityCode": "s",
		"base": 0x0F52BAFF,
		"stroke": 0xFFFFFFFF
	},
	{
		"displayName": "Smokestone",
		"accessibilityCode": "S",
		"base": 0x000000FF,
		"stroke": 0xFFFFFFFF
	},
	{
		"displayName": "Ruby",
		"accessibilityCode": "r",
		"base": 0xE0115FFF,
		"stroke": 0xFFFFFFFF
	},
	{
		"displayName": "Diamond",
		"accessibilityCode": "d",
		"base": 0xFFFFFFFF,
		"stroke": 0x000000FF
	},
	{
		"displayName": "Emerald",
		"accessibilityCode": "e",
		"base": 0x50C878FF,
		"stroke": 0xFFFFFFFF
	},
	{
		"displayName": "Garnet",
		"accessibilityCode": "g",
		"base": 0x9A2A2AFF,
		"stroke": 0xFFFFFFFF
	},
	{
		"displayName": "Zircon",
		"accessibilityCode": "z",
		"base": 0xF4F8FFFF,
		"stroke": 0x000000FF
	},
	{
		"displayName": "Amethyst",
		"accessibilityCode": "a",
		"base": 0x9966CCFF,
		"stroke": 0xFFFFFFFF
	},
	{
		"displayName": "Topaz",
		"accessibilityCode": "t",
		"base": 0xFFC87CFF,
		"stroke": 0xFFFFFFFF
	},
	{
		"displayName": "Heliodor",
		"accessibilityCode": "h",
		"base": 0xEBC965FF,
		"stroke": 0x000000FF
	},
	{
		"displayName": "Neutral",
		"accessibilityCode": "n",
		"base": 0x808080FF,
		"stroke": 0x000000FF
	}
]

const DENOMINATIONS = [
	"Chip",
	"Mark",
	"Broam"
]

const DEFAULT_REGIONS = [
	{
		"displayName": "Sadeas",
		"manualId": 1,
		"borders": [4, 301, 401],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Aladar",
		"manualId": 2,
		"borders": [3, 6, 302],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Roion",
		"manualId": 3,
		"borders": [2, 6, 102],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Vamah",
		"manualId": 4,
		"borders": [1, 5, 407],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Ruthar",
		"manualId": 5,
		"borders": [4, 6, 407],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Kholin",
		"manualId": 6,
		"borders": [2, 3, 5, 10, 102, 101, 105],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Hatham",
		"manualId": 7,
		"borders": [8, 9, 406, 407],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Thanadal",
		"manualId": 8,
		"borders": [7, 10],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Bethab",
		"manualId": 9,
		"borders": [7, 10, 406, 203],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Sebarial",
		"manualId": 10,
		"borders": [6, 8, 9, 105, 203],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Shattered Plains",
		"manualId": 101,
		"borders": [102, 103, 104, 105, 6],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Unclaimed Hills",
		"manualId": 102,
		"borders": [3, 6, 101, 103],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Dawn's Shadow",
		"manualId": 103,
		"borders": [101, 102, 104],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "New Natanatan",
		"manualId": 104,
		"borders": [101, 103, 105],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Shallow Crypts",
		"manualId": 105,
		"borders": [101, 104, 6, 10, 203],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Thaylen City",
		"manualId": 201,
		"borders": [202, 203, 610],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Kharbranth",
		"manualId": 202,
		"borders": [201, 203],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "West Frostlands",
		"manualId": 203,
		"borders": [201, 202, 105, 9, 10],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Herdaz City",
		"manualId": 301,
		"borders": [302, 304, 1, 401],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Akak",
		"manualId": 302,
		"borders": [301, 2],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Arak",
		"manualId": 303,
		"borders": [304],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Sumi",
		"manualId": 304,
		"borders": [301, 303, 908],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Northgrip",
		"manualId": 401,
		"borders": [1, 402, 403, 407, 301],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Elenar",
		"manualId": 402,
		"borders": [401, 403, 501],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Valath",
		"manualId": 403,
		"borders": [401, 402, 404, 406, 501],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Bavland",
		"manualId": 404,
		"borders": [403, 406, 501],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Silnasen",
		"manualId": 405,
		"borders": [406, 613],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Vedenar",
		"manualId": 406,
		"borders": [403, 404, 405, 407, 7, 9, 613],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Borderlands",
		"manualId": 407,
		"borders": [401, 406, 4, 5, 7],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Tu Bayla",
		"manualId": 501,
		"borders": [402, 403, 404, 502, 503],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Marabethia",
		"manualId": 502,
		"borders": [501, 504],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Yulay",
		"manualId": 503,
		"borders": [501, 504, 601],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Babatharnam",
		"manualId": 504,
		"borders": [502, 503, 902],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Azimir",
		"manualId": 601,
		"borders": [602, 603, 607, 608, 503],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Desh",
		"manualId": 602,
		"borders": [601, 603],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Yezier",
		"manualId": 603,
		"borders": [601, 602, 604, 605, 605, 607],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Alm",
		"manualId": 604,
		"borders": [603, 605, 703],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Liafor",
		"manualId": 605,
		"borders": [603, 604, 606, 607],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Steen",
		"manualId": 606,
		"borders": [605, 801],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Tashikk",
		"manualId": 607,
		"borders": [601, 603, 605, 608],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Emul",
		"manualId": 608,
		"borders": [601, 607, 609, 610, 611],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Tukar",
		"manualId": 609,
		"borders": [608, 610],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Marat",
		"manualId": 610,
		"borders": [608, 609, 611, 201],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Greater Hexi",
		"manualId": 611,
		"borders": [608, 610, 612],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Tu Fallia",
		"manualId": 612,
		"borders": [611, 613],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Triax",
		"manualId": 613,
		"borders": [612, 405, 406],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "North Shinovar",
		"manualId": 701,
		"borders": [702, 703, 901],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "West Shinovar",
		"manualId": 702,
		"borders": [701, 703],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "South Shinovar",
		"manualId": 703,
		"borders": [701, 702, 604, 801],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Aimia",
		"manualId": 801,
		"borders": [802, 803, 703, 606],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Akinah",
		"manualId": 802,
		"borders": [801, 803],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Third Isle",
		"manualId": 803,
		"borders": [801, 802],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Eila",
		"manualId": 901,
		"borders": [902, 904, 701],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Rira",
		"manualId": 902,
		"borders": [901, 903, 904, 504],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Kurth",
		"manualId": 903,
		"borders": [902, 908],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Kasitor",
		"manualId": 904,
		"borders": [901, 902, 905],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Rall Elorim",
		"manualId": 905,
		"borders": [904, 906],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Quili",
		"manualId": 906,
		"borders": [905, 907],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Abri",
		"manualId": 907,
		"borders": [906, 908],
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Kadrix",
		"manualId": 908,
		"borders": [903, 907, 304],
		"mapX": 0,
		"mapY": 0
	}
]

const DEFAULT_KINGDOMS = [
	{
		"displayName": "Alethkar",
		"bonus": 8,
		"regions": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
		# if manualId < 100
		# if manualId < 200 && manualId <= 100
	},
	{
		"displayName": "Natanatan",
		"bonus": 4,
		"regions": [101, 102, 103, 104, 105]
	},
	{
		"displayName": "Thaylenah",
		"bonus": 3,
		"regions": [201, 202, 203]
	},
	{
		"displayName": "Herdaz",
		"bonus": 4,
		"regions": [301, 302, 303, 304]
	},
	{
		"displayName": "Jah Keved",
		"bonus": 6,
		"regions": [401, 402, 403, 404, 405, 406, 407]
	},
	{
		"displayName": "Sela Tales",
		"bonus": 4,
		"regions": [501, 502, 503, 504]
	},
	{
		"displayName": "Azish Empire",
		"bonus": 9,
		"regions": [601, 602, 603, 604, 605, 606, 607, 608, 609, 610, 611, 612, 613]
	},
	{
		"displayName": "Shinovar",
		"bonus": 2,
		"regions": [701, 702, 703]
	},
	{
		"displayName": "Aimia",
		"bonus": 2,
		"regions": [801, 802, 803]
	},
	{
		"displayName": "Iri",
		"bonus": 5,
		"regions": [901, 902, 903, 904, 905, 906, 907, 908]
	},
]
