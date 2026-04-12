extends Node

const DEFAULT_COLORS = [
	{
		"displayName": "Neutral",
		"accessibilityCode": "n",
		"base": 0x808080FF,
		"stroke": 0x000000FF
	},
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
		"mapX": 1524,
		"mapY": 586
	},
	{
		"displayName": "Aladar",
		"manualId": 2,
		"borders": [3, 6, 302],
		"mapX": 1640,
		"mapY": 566
	},
	{
		"displayName": "Roion",
		"manualId": 3,
		"borders": [2, 6, 102],
		"mapX": 1757,
		"mapY": 609
	},
	{
		"displayName": "Vamah",
		"manualId": 4,
		"borders": [1, 5, 407],
		"mapX": 1569,
		"mapY": 631
	},
	{
		"displayName": "Ruthar",
		"manualId": 5,
		"borders": [4, 6, 407],
		"mapX": 1519,
		"mapY": 731
	},
	{
		"displayName": "Kholin",
		"manualId": 6,
		"borders": [2, 3, 5, 10, 102, 101, 105],
		"mapX": 1690,
		"mapY": 726
	},
	{
		"displayName": "Hatham",
		"manualId": 7,
		"borders": [8, 9, 406, 407],
		"mapX": 1440,
		"mapY": 848
	},
	{
		"displayName": "Thanadal",
		"manualId": 8,
		"borders": [7, 10],
		"mapX": 1502,
		"mapY": 821
	},
	{
		"displayName": "Bethab",
		"manualId": 9,
		"borders": [7, 10, 406, 203],
		"mapX": 1380,
		"mapY": 985
	},
	{
		"displayName": "Sebarial",
		"manualId": 10,
		"borders": [6, 8, 9, 105, 203],
		"mapX": 1480,
		"mapY": 990
	},
	{
		"displayName": "Shattered Plains",
		"manualId": 101,
		"borders": [102, 103, 104, 105, 6],
		"mapX": 1730,
		"mapY": 935
	},
	{
		"displayName": "Unclaimed Hills",
		"manualId": 102,
		"borders": [3, 6, 101, 103],
		"mapX": 1761,
		"mapY": 814
	},
	{
		"displayName": "Dawn's Shadow",
		"manualId": 103,
		"borders": [101, 102, 104],
		"mapX": 1814,
		"mapY": 909
	},
	{
		"displayName": "New Natanatan",
		"manualId": 104,
		"borders": [101, 103, 105],
		"mapX": 1816,
		"mapY": 1095
	},
	{
		"displayName": "Shallow Crypts",
		"manualId": 105,
		"borders": [101, 104, 6, 10, 203],
		"mapX": 1614,
		"mapY": 1050
	},
	{
		"displayName": "Thaylen City",
		"manualId": 201,
		"borders": [202, 203, 610],
		"mapX": 1290,
		"mapY": 1259
	},
	{
		"displayName": "Kharbranth",
		"manualId": 202,
		"borders": [201, 203],
		"mapX": 1314,
		"mapY": 1092
	},
	{
		"displayName": "West Frostlands",
		"manualId": 203,
		"borders": [201, 202, 105, 9, 10],
		"mapX": 1509,
		"mapY": 1161
	},
	{
		"displayName": "Herdaz City",
		"manualId": 301,
		"borders": [302, 304, 1, 401],
		"mapX": 1454,
		"mapY": 504
	},
	{
		"displayName": "Akak",
		"manualId": 302,
		"borders": [301, 2],
		"mapX": 1695,
		"mapY": 445
	},
	{
		"displayName": "Arak",
		"manualId": 303,
		"borders": [304],
		"mapX": 1419,
		"mapY": 340
	},
	{
		"displayName": "Sumi",
		"manualId": 304,
		"borders": [301, 303, 908],
		"mapX": 1328,
		"mapY": 435
	},
	{
		"displayName": "Northgrip",
		"manualId": 401,
		"borders": [1, 402, 403, 407, 301],
		"mapX": 1321,
		"mapY": 592
	},
	{
		"displayName": "Elenar",
		"manualId": 402,
		"borders": [401, 403, 501],
		"mapX": 1216,
		"mapY": 628
	},
	{
		"displayName": "Valath",
		"manualId": 403,
		"borders": [401, 402, 404, 406, 501],
		"mapX": 1280,
		"mapY": 735
	},
	{
		"displayName": "Bavland",
		"manualId": 404,
		"borders": [403, 406, 501],
		"mapX": 1176,
		"mapY": 838
	},
	{
		"displayName": "Silnasen",
		"manualId": 405,
		"borders": [406, 613],
		"mapX": 1188,
		"mapY": 890
	},
	{
		"displayName": "Vedenar",
		"manualId": 406,
		"borders": [403, 404, 405, 407, 7, 9, 613],
		"mapX": 1328,
		"mapY": 897
	},
	{
		"displayName": "Horneater Foothills",
		"manualId": 407,
		"borders": [401, 406, 4, 5, 7],
		"mapX": 1435,
		"mapY": 711
	},
	{
		"displayName": "Tu Bayla",
		"manualId": 501,
		"borders": [402, 403, 404, 502, 503],
		"mapX": 1033,
		"mapY": 761
	},
	{
		"displayName": "Marabethia",
		"manualId": 502,
		"borders": [501, 504],
		"mapX": 883,
		"mapY": 619
	},
	{
		"displayName": "Yulay",
		"manualId": 503,
		"borders": [501, 504, 601],
		"mapX": 819,
		"mapY": 754
	},
	{
		"displayName": "Babatharnam",
		"manualId": 504,
		"borders": [502, 503, 902],
		"mapX": 638,
		"mapY": 716
	},
	{
		"displayName": "Azimir",
		"manualId": 601,
		"borders": [602, 603, 607, 608, 503],
		"mapX": 669,
		"mapY": 897
	},
	{
		"displayName": "Desh",
		"manualId": 602,
		"borders": [601, 603],
		"mapX": 588,
		"mapY": 778
	},
	{
		"displayName": "Yezier",
		"manualId": 603,
		"borders": [601, 602, 604, 605, 605, 607],
		"mapX": 547,
		"mapY": 907
	},
	{
		"displayName": "Alm",
		"manualId": 604,
		"borders": [603, 605, 703],
		"mapX": 509,
		"mapY": 854
	},
	{
		"displayName": "Liafor",
		"manualId": 605,
		"borders": [603, 604, 606, 607],
		"mapX": 542,
		"mapY": 1011
	},
	{
		"displayName": "Steen",
		"manualId": 606,
		"borders": [605, 801],
		"mapX": 392,
		"mapY": 1026
	},
	{
		"displayName": "Tashikk",
		"manualId": 607,
		"borders": [601, 603, 605, 608],
		"mapX": 621,
		"mapY": 964
	},
	{
		"displayName": "Emul",
		"manualId": 608,
		"borders": [601, 607, 609, 610, 611],
		"mapX": 850,
		"mapY": 914
	},
	{
		"displayName": "Tukar",
		"manualId": 609,
		"borders": [608, 610],
		"mapX": 633,
		"mapY": 1104
	},
	{
		"displayName": "Marat",
		"manualId": 610,
		"borders": [608, 609, 611, 201],
		"mapX": 900,
		"mapY": 1033
	},
	{
		"displayName": "Greater Hexi",
		"manualId": 611,
		"borders": [608, 610, 612],
		"mapX": 997,
		"mapY": 992
	},
	{
		"displayName": "Tu Fallia",
		"manualId": 612,
		"borders": [611, 613],
		"mapX": 1011,
		"mapY": 916
	},
	{
		"displayName": "Triax",
		"manualId": 613,
		"borders": [612, 405, 406],
		"mapX": 1119,
		"mapY": 969
	},
	{
		"displayName": "North Shinovar",
		"manualId": 701,
		"borders": [702, 703, 901],
		"mapX": 402,
		"mapY": 640
	},
	{
		"displayName": "West Shinovar",
		"manualId": 702,
		"borders": [701, 703],
		"mapX": 361,
		"mapY": 759
	},
	{
		"displayName": "South Shinovar",
		"manualId": 703,
		"borders": [701, 702, 604, 801],
		"mapX": 452,
		"mapY": 766
	},
	{
		"displayName": "Aimia",
		"manualId": 801,
		"borders": [802, 803, 703, 606],
		"mapX": 128,
		"mapY": 957
	},
	{
		"displayName": "Akinah",
		"manualId": 802,
		"borders": [801, 803],
		"mapX": 197,
		"mapY": 754
	},
	{
		"displayName": "Third Isle",
		"manualId": 803,
		"borders": [801, 802],
		"mapX": 100,
		"mapY": 652
	},
	{
		"displayName": "Eila",
		"manualId": 901,
		"borders": [902, 904, 701],
		"mapX": 466,
		"mapY": 566
	},
	{
		"displayName": "Rira",
		"manualId": 902,
		"borders": [901, 903, 904, 504],
		"mapX": 669,
		"mapY": 538
	},
	{
		"displayName": "Kurth",
		"manualId": 903,
		"borders": [902, 908],
		"mapX": 859,
		"mapY": 445
	},
	{
		"displayName": "Kasitor",
		"manualId": 904,
		"borders": [901, 902, 905],
		"mapX": 485,
		"mapY": 500
	},
	{
		"displayName": "Rall Elorim",
		"manualId": 905,
		"borders": [904, 906],
		"mapX": 623,
		"mapY": 300
	},
	{
		"displayName": "Quili",
		"manualId": 906,
		"borders": [905, 907],
		"mapX": 771,
		"mapY": 264
	},
	{
		"displayName": "Abri",
		"manualId": 907,
		"borders": [906, 908],
		"mapX": 873,
		"mapY": 257
	},
	{
		"displayName": "Kadrix",
		"manualId": 908,
		"borders": [903, 907, 304],
		"mapX": 990,
		"mapY": 242
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
