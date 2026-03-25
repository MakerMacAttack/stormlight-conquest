extends Node

const DEFAULT_REGIONS = [
	{
		"displayName": "Sadeas",
		"id": 1,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Aladar",
		"id": 2,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Roion",
		"id": 3,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Vamah",
		"id": 4,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Ruthar",
		"id": 5,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Kholin",
		"id": 6,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Hatham",
		"id": 7,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Thanadal",
		"id": 8,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Bethab",
		"id": 9,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Sebarial",
		"id": 10,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Shattered Plains",
		"id": 11,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Unclaimed Hills",
		"id": 12,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Dawn's Shadow",
		"id": 13,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "New Natanatan",
		"id": 14,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Shallow Crypts",
		"id": 15,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Thaylen City",
		"id": 16,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Kharbranth",
		"id": 17,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Frostlands",
		"id": 18,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Herdaz City",
		"id": 19,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Akak",
		"id": 20,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Arak",
		"id": 21,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Sumi",
		"id": 22,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Northgrip",
		"id": 23,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Elenar",
		"id": 24,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Valath",
		"id": 25,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Bavland",
		"id": 26,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Silnasen",
		"id": 27,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Bedenar",
		"id": 28,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Borderlands",
		"id": 29,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Tu Bayla",
		"id": 30,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Marabethia",
		"id": 31,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Yulay",
		"id": 32,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Babatharnam",
		"id": 33,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Azimir",
		"id": 34,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Desh",
		"id": 35,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Yezier",
		"id": 36,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Alm",
		"id": 37,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Liafor",
		"id": 38,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Steen",
		"id": 39,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Tashikk",
		"id": 40,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Emul",
		"id": 41,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Tukar",
		"id": 42,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Marat",
		"id": 43,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Greater Hexi",
		"id": 44,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Tu Fallia",
		"id": 45,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Triax",
		"id": 46,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Bondsmith",
		"id": 47,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Windrunner",
		"id": 48,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Skybreaker",
		"id": 49,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Dustbringer",
		"id": 50,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Edgedancer",
		"id": 51,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Truthwatcher",
		"id": 52,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Lightweaver",
		"id": 53,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Elsecaller",
		"id": 54,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Willshaper",
		"id": 55,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Stoneward",
		"id": 56,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Aimia",
		"id": 57,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Akinah",
		"id": 58,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Third Isle",
		"id": 59,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Eila",
		"id": 60,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Rira",
		"id": 61,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Kurth",
		"id": 62,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Kasitor",
		"id": 63,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Rall Elorim",
		"id": 64,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Quili",
		"id": 65,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Abri",
		"id": 66,
		"mapX": 0,
		"mapY": 0
	},
	{
		"displayName": "Kadrix",
		"id": 67,
		"mapX": 0,
		"mapY": 0
	}
]

const DEFAULT_KINGDOMS = [
	{
		"displayName": "Alethkar",
		"bonus": 8
	},
	{
		"displayName": "Natanatan",
		"bonus": 4
	},
	{
		"displayName": "Thaylenah",
		"bonus": 3
	},
	{
		"displayName": "Herdaz",
		"bonus": 4
	},
	{
		"displayName": "Jah Keved",
		"bonus": 6
	},
	{
		"displayName": "Sela Tales",
		"bonus": 4
	},
	{
		"displayName": "Azish Empire",
		"bonus": 9
	},
	{
		"displayName": "Shinovar",
		"bonus": 6
	},
	{
		"displayName": "Aimia",
		"bonus": 2
	},
	{
		"displayName": "Iri",
		"bonus": 5
	},
]

const DEFAULT_BORDERS = [
	{
		"region1": 123,
		"region2": 456
	}
]
