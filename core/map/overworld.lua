return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.1.4",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 50,
  height = 50,
  tilewidth = 16,
  tileheight = 16,
  nextobjectid = 99,
  properties = {},
  tilesets = {
    {
      name = "tileset",
      firstgid = 1,
      filename = "../res/editor/tileset.tsx",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      image = "../res/tileset.png",
      imagewidth = 480,
      imageheight = 224,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      terrains = {
        {
          name = "Marsh",
          tile = 7,
          properties = {}
        },
        {
          name = "Grass",
          tile = 0,
          properties = {}
        },
        {
          name = "Sand",
          tile = 210,
          properties = {}
        },
        {
          name = "path",
          tile = 227,
          properties = {}
        },
        {
          name = "Tree",
          tile = 90,
          properties = {}
        }
      },
      tilecount = 420,
      tiles = {
        {
          id = 0,
          terrain = { 1, 1, 1, 1 }
        },
        {
          id = 1,
          terrain = { 1, 1, 1, 1 }
        },
        {
          id = 2,
          terrain = { 1, 1, 1, 1 }
        },
        {
          id = 3,
          terrain = { 1, -1, -1, 0 }
        },
        {
          id = 4,
          terrain = { -1, 1, 0, -1 }
        },
        {
          id = 5,
          terrain = { -1, 0, 1, -1 }
        },
        {
          id = 6,
          terrain = { 0, -1, -1, 1 }
        },
        {
          id = 7,
          terrain = { 0, 0, 0, 0 }
        },
        {
          id = 8,
          terrain = { 0, 0, 0, 0 }
        },
        {
          id = 9,
          terrain = { 0, 0, 0, 0 }
        },
        {
          id = 10,
          terrain = { 0, 0, 0, 0 }
        },
        {
          id = 11,
          terrain = { 0, 0, 0, 0 },
          probability = 0.8
        },
        {
          id = 12,
          terrain = { 0, 0, 0, 0 },
          probability = 0.6
        },
        {
          id = 13,
          terrain = { 0, 0, 0, 0 },
          probability = 0.6
        },
        {
          id = 14,
          terrain = { 0, 0, 0, 0 },
          probability = 0.5
        },
        {
          id = 15,
          terrain = { 0, 0, 0, 0 },
          probability = 0.4
        },
        {
          id = 16,
          terrain = { 0, 0, 0, 0 },
          probability = 0.3
        },
        {
          id = 17,
          terrain = { 0, 0, 0, 0 },
          probability = 0.4
        },
        {
          id = 18,
          terrain = { 0, 0, 0, 0 },
          probability = 0.2
        },
        {
          id = 19,
          terrain = { 0, 0, 0, 0 },
          probability = 0.2
        },
        {
          id = 20,
          terrain = { 0, 0, 0, 0 },
          probability = 0.1
        },
        {
          id = 44,
          terrain = { -1, -1, -1, 4 }
        },
        {
          id = 45,
          terrain = { -1, -1, 4, 4 }
        },
        {
          id = 46,
          terrain = { -1, -1, 4, 4 }
        },
        {
          id = 47,
          terrain = { -1, -1, 4, -1 }
        },
        {
          id = 48,
          terrain = { -1, -1, -1, 4 }
        },
        {
          id = 49,
          terrain = { -1, -1, 4, 4 }
        },
        {
          id = 50,
          terrain = { -1, -1, 4, 4 }
        },
        {
          id = 51,
          terrain = { -1, -1, 4, -1 }
        },
        {
          id = 52,
          terrain = { -1, -1, -1, 4 }
        },
        {
          id = 53,
          terrain = { -1, -1, 4, 4 }
        },
        {
          id = 54,
          terrain = { -1, -1, 4, 4 }
        },
        {
          id = 55,
          terrain = { -1, -1, 4, -1 }
        },
        {
          id = 56,
          terrain = { -1, -1, -1, 4 }
        },
        {
          id = 57,
          terrain = { -1, -1, 4, 4 }
        },
        {
          id = 58,
          terrain = { -1, -1, 4, 4 }
        },
        {
          id = 59,
          terrain = { -1, -1, 4, -1 }
        },
        {
          id = 62,
          terrain = { -1, -1, -1, 4 }
        },
        {
          id = 63,
          terrain = { -1, -1, 4, 4 }
        },
        {
          id = 64,
          terrain = { -1, -1, 4, -1 }
        },
        {
          id = 65,
          terrain = { -1, -1, -1, 4 }
        },
        {
          id = 66,
          terrain = { -1, -1, 4, 4 }
        },
        {
          id = 67,
          terrain = { -1, -1, 4, -1 }
        },
        {
          id = 68,
          terrain = { -1, -1, -1, 4 }
        },
        {
          id = 69,
          terrain = { -1, -1, 4, 4 }
        },
        {
          id = 70,
          terrain = { -1, -1, 4, -1 }
        },
        {
          id = 71,
          terrain = { -1, -1, -1, 4 }
        },
        {
          id = 72,
          terrain = { -1, -1, 4, 4 }
        },
        {
          id = 73,
          terrain = { -1, -1, 4, -1 }
        },
        {
          id = 74,
          terrain = { -1, 4, -1, 4 }
        },
        {
          id = 75,
          terrain = { 4, 4, 4, 4 }
        },
        {
          id = 76,
          terrain = { 4, 4, 4, 4 }
        },
        {
          id = 77,
          terrain = { 4, -1, 4, -1 }
        },
        {
          id = 78,
          terrain = { -1, 4, -1, 4 }
        },
        {
          id = 79,
          terrain = { 4, 4, 4, 4 }
        },
        {
          id = 80,
          terrain = { 4, 4, 4, 4 }
        },
        {
          id = 81,
          terrain = { 4, -1, 4, -1 }
        },
        {
          id = 82,
          terrain = { -1, 4, -1, 4 }
        },
        {
          id = 83,
          terrain = { 4, 4, 4, 4 }
        },
        {
          id = 84,
          terrain = { 4, 4, 4, 4 }
        },
        {
          id = 85,
          terrain = { 4, -1, 4, -1 }
        },
        {
          id = 86,
          terrain = { -1, 4, -1, 4 }
        },
        {
          id = 87,
          terrain = { 4, 4, 4, 4 }
        },
        {
          id = 88,
          terrain = { 4, 4, 4, 4 }
        },
        {
          id = 89,
          terrain = { 4, -1, 4, -1 }
        },
        {
          id = 90,
          terrain = { -1, -1, -1, 4 }
        },
        {
          id = 91,
          terrain = { -1, -1, 4, -1 }
        },
        {
          id = 92,
          terrain = { -1, 4, -1, 4 }
        },
        {
          id = 93,
          terrain = { 4, 4, 4, 4 }
        },
        {
          id = 94,
          terrain = { 4, -1, 4, -1 }
        },
        {
          id = 95,
          terrain = { -1, 4, -1, 4 }
        },
        {
          id = 96,
          terrain = { 4, 4, 4, 4 }
        },
        {
          id = 97,
          terrain = { 4, -1, 4, -1 }
        },
        {
          id = 98,
          terrain = { -1, 4, -1, 4 }
        },
        {
          id = 99,
          terrain = { 4, 4, 4, 4 }
        },
        {
          id = 100,
          terrain = { 4, -1, 4, -1 }
        },
        {
          id = 101,
          terrain = { -1, 4, -1, 4 }
        },
        {
          id = 102,
          terrain = { 4, 4, 4, 4 }
        },
        {
          id = 103,
          terrain = { 4, -1, 4, -1 }
        },
        {
          id = 104,
          terrain = { -1, 4, -1, 4 }
        },
        {
          id = 105,
          terrain = { 4, 4, 4, 4 }
        },
        {
          id = 106,
          terrain = { 4, 4, 4, 4 }
        },
        {
          id = 107,
          terrain = { 4, -1, 4, -1 }
        },
        {
          id = 108,
          terrain = { -1, 4, -1, 4 }
        },
        {
          id = 109,
          terrain = { 4, 4, 4, 4 }
        },
        {
          id = 110,
          terrain = { 4, 4, 4, 4 }
        },
        {
          id = 111,
          terrain = { 4, -1, 4, -1 }
        },
        {
          id = 112,
          terrain = { -1, 4, -1, 4 }
        },
        {
          id = 113,
          terrain = { 4, 4, 4, 4 }
        },
        {
          id = 114,
          terrain = { 4, 4, 4, 4 }
        },
        {
          id = 115,
          terrain = { 4, -1, 4, -1 }
        },
        {
          id = 116,
          terrain = { -1, 4, -1, 4 }
        },
        {
          id = 117,
          terrain = { 4, 4, 4, 4 }
        },
        {
          id = 118,
          terrain = { 4, 4, 4, 4 }
        },
        {
          id = 119,
          terrain = { 4, -1, 4, -1 }
        },
        {
          id = 120,
          terrain = { -1, 4, -1, -1 }
        },
        {
          id = 121,
          terrain = { 4, -1, -1, -1 }
        },
        {
          id = 122,
          terrain = { -1, 4, -1, -1 }
        },
        {
          id = 123,
          terrain = { 4, 4, -1, -1 }
        },
        {
          id = 124,
          terrain = { 4, -1, -1, -1 }
        },
        {
          id = 125,
          terrain = { -1, 4, -1, -1 }
        },
        {
          id = 126,
          terrain = { 4, 4, -1, -1 }
        },
        {
          id = 127,
          terrain = { 4, -1, -1, -1 }
        },
        {
          id = 128,
          terrain = { -1, 4, -1, -1 }
        },
        {
          id = 129,
          terrain = { 4, 4, -1, -1 }
        },
        {
          id = 130,
          terrain = { 4, -1, -1, -1 }
        },
        {
          id = 131,
          terrain = { -1, 4, -1, -1 }
        },
        {
          id = 132,
          terrain = { 4, 4, -1, -1 }
        },
        {
          id = 133,
          terrain = { 4, -1, -1, -1 }
        },
        {
          id = 134,
          terrain = { -1, 4, -1, -1 }
        },
        {
          id = 135,
          terrain = { 4, 4, -1, -1 }
        },
        {
          id = 136,
          terrain = { 4, 4, -1, -1 }
        },
        {
          id = 137,
          terrain = { 4, -1, -1, -1 }
        },
        {
          id = 138,
          terrain = { -1, 4, -1, -1 }
        },
        {
          id = 139,
          terrain = { 4, 4, -1, -1 }
        },
        {
          id = 140,
          terrain = { 4, 4, -1, -1 }
        },
        {
          id = 141,
          terrain = { 4, -1, -1, -1 }
        },
        {
          id = 142,
          terrain = { -1, 4, -1, -1 }
        },
        {
          id = 143,
          terrain = { 4, 4, -1, -1 }
        },
        {
          id = 144,
          terrain = { 4, 4, -1, -1 }
        },
        {
          id = 145,
          terrain = { 4, -1, -1, -1 }
        },
        {
          id = 146,
          terrain = { -1, 4, -1, -1 }
        },
        {
          id = 147,
          terrain = { 4, 4, -1, -1 }
        },
        {
          id = 148,
          terrain = { 4, 4, -1, -1 }
        },
        {
          id = 149,
          terrain = { 4, -1, -1, -1 }
        },
        {
          id = 210,
          terrain = { 2, 2, 2, 2 },
          probability = 10
        },
        {
          id = 211,
          terrain = { 0, 0, 0, 2 }
        },
        {
          id = 212,
          terrain = { 0, 0, 2, 0 }
        },
        {
          id = 213,
          terrain = { 0, 2, 0, 0 }
        },
        {
          id = 214,
          terrain = { 2, 0, 0, 0 }
        },
        {
          id = 215,
          terrain = { 0, 2, 0, 2 }
        },
        {
          id = 216,
          terrain = { 0, 2, 0, 2 }
        },
        {
          id = 217,
          terrain = { 0, 2, 0, 2 }
        },
        {
          id = 218,
          terrain = { 0, 0, 2, 2 }
        },
        {
          id = 219,
          terrain = { 0, 0, 2, 2 }
        },
        {
          id = 220,
          terrain = { 0, 0, 2, 2 }
        },
        {
          id = 221,
          terrain = { 2, 2, 0, 0 }
        },
        {
          id = 222,
          terrain = { 2, 2, 0, 0 }
        },
        {
          id = 223,
          terrain = { 2, 2, 0, 0 }
        },
        {
          id = 224,
          terrain = { 2, 0, 2, 0 }
        },
        {
          id = 225,
          terrain = { 2, 0, 2, 0 }
        },
        {
          id = 226,
          terrain = { 2, 0, 2, 0 }
        },
        {
          id = 259,
          terrain = { 0, 2, 2, 2 }
        },
        {
          id = 260,
          terrain = { 2, 0, 2, 2 }
        },
        {
          id = 261,
          terrain = { 2, 2, 0, 2 }
        },
        {
          id = 262,
          terrain = { 2, 2, 2, 0 }
        },
        {
          id = 267,
          terrain = { 2, 0, 0, 0 }
        },
        {
          id = 270,
          terrain = { 0, 0, 0, 2 }
        },
        {
          id = 271,
          terrain = { 2, 2, 2, 2 }
        },
        {
          id = 272,
          terrain = { 2, 2, 2, 2 }
        },
        {
          id = 273,
          terrain = { 2, 2, 2, 2 }
        },
        {
          id = 274,
          terrain = { 2, 2, 2, 2 }
        },
        {
          id = 275,
          terrain = { 2, 2, 2, 2 }
        },
        {
          id = 276,
          terrain = { 2, 2, 2, 2 }
        },
        {
          id = 277,
          terrain = { 2, 2, 2, 2 },
          probability = 2
        }
      }
    },
    {
      name = "tileset_objects",
      firstgid = 421,
      filename = "../res/editor/tileset_objects.tsx",
      tilewidth = 16,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../res/tileset.png",
      imagewidth = 480,
      imageheight = 224,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 32
      },
      properties = {},
      terrains = {
        {
          name = "Fire",
          tile = 61,
          properties = {}
        },
        {
          name = "mushrooms",
          tile = 61,
          properties = {}
        }
      },
      tilecount = 210,
      tiles = {
        {
          id = 150,
          terrain = { 0, 0, 0, 0 },
          animation = {
            {
              tileid = 150,
              duration = 100
            },
            {
              tileid = 151,
              duration = 100
            },
            {
              tileid = 152,
              duration = 100
            },
            {
              tileid = 153,
              duration = 100
            },
            {
              tileid = 154,
              duration = 100
            },
            {
              tileid = 155,
              duration = 100
            },
            {
              tileid = 156,
              duration = 100
            },
            {
              tileid = 157,
              duration = 100
            }
          }
        },
        {
          id = 187,
          terrain = { 1, 1, 1, 1 }
        },
        {
          id = 188,
          terrain = { 1, 1, 1, 1 }
        },
        {
          id = 189,
          terrain = { 1, 1, 1, 1 }
        },
        {
          id = 190,
          terrain = { 1, 1, 1, 1 }
        },
        {
          id = 191,
          terrain = { 1, 1, 1, 1 }
        },
        {
          id = 192,
          terrain = { 1, 1, 1, 1 }
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "ground",
      x = 0,
      y = 0,
      width = 50,
      height = 50,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        16, 15, 15, 13, 10, 9, 9, 11, 9, 13, 9, 9, 15, 8, 18, 11, 16, 10, 12, 13, 10, 14, 11, 10, 11, 12, 15, 14, 8, 13, 8, 10, 9, 8, 10, 14, 11, 13, 14, 12, 12, 12, 8, 13, 10, 8, 9, 15, 17, 16,
        10, 16, 9, 9, 15, 18, 9, 13, 8, 13, 14, 13, 19, 18, 11, 19, 9, 10, 20, 13, 9, 9, 10, 13, 18, 9, 15, 11, 10, 12, 10, 9, 12, 11, 16, 11, 16, 17, 19, 11, 13, 12, 8, 9, 18, 13, 9, 17, 20, 8,
        11, 12, 14, 8, 12, 8, 12, 15, 10, 8, 15, 11, 17, 11, 9, 10, 17, 11, 16, 9, 10, 8, 12, 11, 9, 18, 10, 8, 19, 12, 12, 15, 16, 16, 12, 9, 12, 9, 9, 9, 9, 11, 12, 19, 9, 17, 10, 10, 9, 8,
        16, 10, 14, 10, 16, 12, 14, 10, 9, 11, 14, 8, 10, 8, 8, 9, 8, 15, 10, 11, 12, 11, 16, 18, 16, 12, 11, 8, 14, 11, 11, 18, 9, 10, 10, 8, 9, 11, 20, 10, 12, 8, 13, 7, 1073741826, 1073741826, 1073741826, 6, 11, 15,
        20, 16, 20, 12, 16, 12, 19, 10, 10, 10, 10, 13, 11, 12, 16, 15, 12, 9, 10, 8, 11, 14, 8, 11, 13, 8, 10, 12, 9, 13, 11, 12, 12, 15, 15, 10, 14, 14, 12, 11, 11, 16, 8, 3221225475, 1, 1, 1, 4, 8, 17,
        8, 12, 8, 15, 13, 12, 14, 15, 10, 21, 8, 13, 14, 16, 9, 18, 14, 8, 15, 20, 15, 11, 15, 18, 12, 14, 10, 8, 10, 14, 17, 10, 14, 9, 14, 20, 9, 13, 14, 12, 9, 2147483660, 9, 3221225475, 1, 1, 4, 16, 9, 8,
        8, 12, 12, 12, 8, 12, 11, 19, 12, 12, 11, 11, 20, 12, 9, 17, 18, 13, 21, 15, 10, 19, 9, 8, 12, 11, 13, 9, 13, 16, 10, 12, 14, 16, 11, 14, 19, 13, 9, 10, 14, 8, 9, 3221225475, 1, 4, 14, 11, 8, 13,
        8, 8, 12, 12, 12, 17, 12, 18, 15, 12, 17, 8, 20, 12, 8, 18, 9, 10, 8, 8, 16, 10, 8, 10, 10, 15, 8, 11, 13, 8, 13, 9, 8, 12, 11, 11, 16, 11, 11, 11, 12, 8, 8, 5, 4, 9, 8, 10, 9, 10,
        9, 8, 12, 10, 10, 9, 14, 19, 9, 11, 8, 15, 15, 16, 9, 9, 17, 8, 14, 15, 14, 10, 14, 8, 16, 17, 14, 10, 11, 11, 10, 11, 9, 14, 10, 11, 9, 12, 9, 19, 8, 11, 15, 9, 10, 12, 9, 8, 10, 13,
        18, 15, 9, 10, 10, 13, 18, 11, 12, 10, 11, 9, 12, 13, 8, 12, 19, 11, 10, 10, 12, 16, 18, 14, 10, 18, 9, 16, 11, 10, 15, 8, 15, 12, 20, 17, 8, 12, 18, 12, 16, 10, 10, 10, 12, 10, 12, 12, 18, 10,
        14, 15, 11, 11, 18, 15, 18, 10, 9, 12, 9, 13, 15, 13, 8, 20, 9, 11, 8, 12, 12, 17, 14, 11, 9, 15, 20, 11, 11, 10, 9, 8, 19, 11, 10, 8, 19, 10, 13, 15, 13, 10, 16, 11, 14, 19, 14, 8, 10, 14,
        13, 9, 8, 14, 9, 12, 20, 9, 11, 13, 17, 16, 14, 12, 20, 12, 8, 9, 20, 14, 17, 17, 18, 15, 18, 12, 13, 12, 9, 16, 11, 8, 13, 12, 14, 10, 9, 14, 9, 11, 13, 14, 12, 14, 16, 18, 14, 9, 11, 9,
        10, 13, 10, 15, 9, 11, 8, 10, 8, 12, 12, 9, 15, 20, 11, 20, 15, 11, 8, 9, 11, 18, 15, 8, 9, 12, 15, 10, 10, 18, 11, 10, 9, 18, 14, 8, 11, 10, 16, 12, 18, 13, 10, 10, 9, 10, 15, 15, 14, 9,
        11, 10, 10, 8, 13, 9, 15, 12, 10, 15, 8, 12, 8, 13, 10, 11, 9, 12, 9, 18, 12, 11, 8, 11, 12, 12, 21, 14, 12, 10, 8, 11, 13, 9, 8, 12, 14, 19, 13, 20, 13, 8, 18, 9, 10, 18, 11, 10, 8, 14,
        18, 14, 8, 12, 20, 14, 10, 10, 13, 11, 13, 13, 15, 18, 8, 11, 15, 9, 9, 14, 12, 14, 15, 15, 8, 16, 9, 15, 9, 11, 13, 10, 11, 10, 9, 11, 15, 11, 15, 17, 8, 11, 11, 21, 10, 8, 11, 12, 15, 12,
        8, 9, 8, 13, 18, 10, 9, 10, 21, 17, 9, 8, 10, 12, 10, 13, 12, 17, 11, 11, 13, 8, 8, 8, 13, 12, 12, 13, 9, 8, 8, 10, 15, 12, 12, 20, 14, 12, 11, 19, 12, 11, 16, 12, 9, 10, 8, 16, 11, 14,
        14, 18, 12, 9, 9, 11, 16, 12, 12, 14, 10, 10, 18, 11, 9, 13, 11, 19, 9, 13, 17, 10, 15, 12, 19, 10, 12, 11, 11, 18, 9, 17, 21, 10, 8, 12, 8, 10, 16, 15, 12, 18, 8, 10, 10, 10, 15, 14, 17, 11,
        13, 18, 16, 10, 13, 15, 17, 11, 16, 11, 9, 19, 8, 9, 10, 11, 14, 8, 8, 10, 13, 17, 14, 11, 19, 19, 11, 16, 8, 8, 19, 20, 10, 9, 14, 12, 15, 18, 8, 11, 13, 14, 11, 8, 11, 9, 11, 12, 16, 10,
        11, 15, 11, 10, 12, 14, 9, 17, 18, 14, 11, 16, 15, 8, 10, 8, 10, 11, 12, 9, 9, 12, 8, 16, 21, 10, 271, 221, 213, 11, 10, 11, 18, 8, 17, 8, 11, 13, 11, 17, 18, 10, 11, 19, 8, 11, 13, 11, 12, 21,
        8, 10, 11, 11, 11, 8, 14, 13, 8, 10, 9, 13, 18, 11, 16, 16, 15, 18, 17, 16, 271, 219, 221, 221, 219, 219, 260, 211, 227, 16, 8, 11, 13, 8, 17, 10, 8, 12, 12, 15, 13, 8, 9, 16, 13, 11, 13, 10, 13, 14,
        9, 19, 12, 9, 9, 13, 10, 16, 18, 13, 9, 14, 20, 12, 12, 20, 15, 15, 271, 219, 260, 272, 211, 211, 211, 211, 263, 224, 268, 271, 219, 213, 212, 220, 213, 18, 11, 15, 11, 18, 11, 8, 17, 10, 10, 14, 10, 15, 9, 11,
        9, 11, 16, 8, 11, 12, 11, 13, 8, 13, 11, 10, 16, 18, 12, 9, 9, 271, 260, 211, 211, 211, 211, 277, 263, 223, 268, 212, 221, 260, 211, 226, 216, 274, 226, 15, 11, 8, 11, 11, 13, 12, 10, 20, 20, 11, 12, 14, 17, 16,
        8, 11, 15, 8, 12, 16, 20, 10, 14, 19, 13, 8, 17, 8, 12, 13, 8, 216, 276, 211, 211, 277, 211, 274, 261, 220, 220, 260, 277, 276, 211, 225, 214, 224, 268, 10, 212, 220, 213, 18, 10, 8, 11, 11, 8, 12, 8, 9, 9, 15,
        11, 10, 10, 10, 12, 14, 15, 12, 9, 11, 9, 8, 12, 14, 11, 20, 15, 214, 262, 278, 272, 211, 211, 211, 211, 211, 276, 274, 272, 211, 211, 261, 213, 212, 221, 221, 260, 211, 225, 15, 18, 13, 9, 11, 12, 15, 13, 12, 13, 10,
        10, 9, 16, 8, 8, 8, 16, 21, 12, 11, 14, 13, 12, 17, 15, 212, 221, 213, 216, 211, 278, 211, 211, 211, 275, 276, 274, 275, 211, 275, 211, 211, 261, 260, 272, 211, 263, 223, 215, 11, 11, 9, 13, 14, 12, 10, 18, 13, 11, 20,
        12, 20, 16, 9, 10, 14, 8, 20, 20, 12, 15, 17, 10, 10, 9, 216, 277, 227, 217, 211, 211, 211, 211, 278, 272, 275, 211, 211, 278, 272, 211, 211, 211, 211, 272, 211, 261, 213, 11, 9, 8, 13, 13, 10, 12, 8, 12, 10, 13, 8,
        19, 12, 19, 18, 17, 14, 9, 11, 19, 13, 16, 11, 15, 21, 12, 214, 262, 261, 260, 278, 277, 278, 211, 276, 278, 211, 211, 278, 278, 211, 272, 211, 211, 211, 273, 211, 272, 226, 19, 10, 8, 13, 18, 11, 20, 11, 16, 11, 18, 13,
        17, 12, 18, 14, 9, 14, 19, 8, 17, 9, 18, 15, 10, 9, 9, 271, 260, 211, 211, 211, 211, 211, 211, 211, 278, 273, 211, 211, 273, 278, 211, 211, 274, 211, 274, 263, 224, 268, 271, 213, 11, 9, 10, 8, 14, 16, 9, 19, 13, 11,
        12, 19, 16, 13, 18, 8, 19, 12, 9, 9, 11, 10, 9, 12, 19, 218, 278, 211, 211, 275, 275, 211, 211, 274, 211, 211, 211, 277, 211, 277, 211, 211, 278, 278, 211, 226, 8, 271, 260, 226, 10, 9, 20, 13, 8, 8, 14, 11, 13, 11,
        14, 9, 10, 9, 16, 19, 16, 13, 20, 11, 13, 9, 8, 9, 9, 214, 222, 262, 211, 276, 211, 276, 278, 276, 211, 211, 276, 278, 278, 211, 276, 275, 211, 276, 276, 261, 213, 214, 223, 268, 12, 8, 9, 8, 8, 18, 13, 15, 8, 8,
        12, 8, 14, 11, 11, 15, 9, 12, 12, 10, 17, 19, 12, 17, 11, 10, 18, 214, 222, 222, 262, 211, 274, 278, 211, 211, 211, 278, 272, 278, 275, 278, 263, 224, 262, 211, 225, 8, 14, 15, 10, 10, 13, 9, 12, 16, 15, 9, 14, 14,
        12, 15, 20, 14, 11, 11, 8, 12, 8, 9, 12, 9, 11, 15, 18, 11, 13, 8, 11, 12, 214, 223, 224, 262, 211, 263, 222, 262, 211, 211, 263, 224, 268, 11, 214, 224, 215, 10, 13, 14, 8, 10, 10, 13, 11, 15, 10, 19, 9, 17,
        12, 8, 9, 13, 13, 8, 9, 13, 20, 13, 10, 10, 16, 10, 9, 12, 12, 13, 8, 9, 12, 15, 8, 217, 274, 227, 8, 214, 222, 222, 268, 271, 219, 213, 12, 17, 10, 20, 16, 10, 14, 13, 18, 8, 13, 15, 12, 14, 11, 16,
        11, 13, 15, 9, 8, 9, 18, 11, 13, 14, 15, 8, 9, 8, 8, 8, 11, 15, 15, 12, 12, 9, 13, 214, 223, 215, 10, 11, 16, 15, 11, 216, 277, 226, 15, 11, 13, 12, 8, 16, 9, 12, 20, 15, 13, 8, 11, 8, 9, 13,
        12, 10, 15, 9, 11, 17, 10, 16, 9, 17, 12, 10, 8, 11, 13, 10, 9, 13, 20, 14, 9, 17, 12, 13, 12, 9, 14, 16, 19, 12, 15, 214, 224, 268, 11, 9, 13, 8, 9, 12, 18, 12, 9, 8, 10, 13, 11, 13, 11, 15,
        19, 14, 20, 9, 11, 10, 10, 11, 11, 10, 9, 14, 10, 15, 10, 16, 14, 18, 11, 13, 12, 13, 14, 14, 12, 17, 8, 16, 8, 9, 10, 13, 13, 16, 14, 10, 15, 10, 8, 8, 13, 13, 9, 13, 15, 10, 15, 12, 9, 10,
        12, 11, 9, 11, 16, 11, 14, 12, 19, 11, 16, 10, 16, 13, 18, 14, 8, 9, 12, 14, 14, 11, 20, 13, 8, 11, 11, 12, 12, 9, 13, 12, 16, 12, 11, 10, 17, 12, 12, 8, 8, 10, 11, 10, 13, 16, 18, 14, 9, 17,
        13, 13, 14, 10, 18, 9, 16, 17, 11, 14, 10, 19, 8, 13, 12, 8, 11, 19, 14, 11, 9, 13, 10, 9, 13, 8, 9, 11, 20, 9, 15, 15, 14, 8, 12, 17, 13, 13, 15, 15, 14, 13, 8, 11, 8, 8, 14, 13, 8, 11,
        11, 18, 15, 10, 19, 11, 21, 12, 15, 13, 11, 12, 11, 10, 12, 12, 8, 18, 11, 19, 9, 11, 20, 14, 19, 11, 15, 8, 12, 17, 9, 8, 9, 13, 10, 13, 15, 12, 10, 13, 11, 13, 8, 16, 14, 13, 8, 8, 17, 11,
        8, 8, 19, 11, 9, 11, 9, 8, 9, 14, 11, 12, 9, 8, 13, 10, 11, 11, 10, 18, 13, 12, 16, 13, 10, 12, 12, 21, 12, 19, 9, 12, 11, 8, 10, 14, 9, 8, 14, 18, 16, 12, 16, 13, 9, 14, 20, 12, 11, 12,
        16, 12, 13, 9, 19, 18, 8, 10, 20, 8, 16, 12, 9, 10, 13, 20, 8, 8, 12, 18, 10, 9, 13, 9, 14, 11, 8, 15, 12, 16, 13, 12, 18, 13, 8, 12, 10, 12, 9, 18, 8, 11, 13, 12, 10, 11, 7, 3221225474, 6, 10,
        10, 8, 12, 9, 8, 9, 11, 11, 11, 8, 9, 14, 12, 10, 8, 21, 9, 11, 14, 10, 11, 17, 11, 19, 14, 12, 14, 13, 8, 11, 10, 18, 14, 8, 9, 14, 13, 16, 8, 18, 9, 15, 20, 12, 11, 13, 2147483651, 1, 3, 8,
        8, 17, 15, 11, 10, 9, 14, 10, 14, 10, 13, 12, 10, 13, 10, 15, 9, 8, 10, 8, 12, 11, 16, 17, 19, 11, 21, 16, 12, 18, 9, 18, 13, 11, 10, 18, 9, 8, 9, 11, 9, 10, 13, 18, 12, 7, 1, 2, 1, 6,
        11, 11, 18, 12, 9, 20, 10, 13, 12, 21, 8, 8, 18, 12, 10, 17, 8, 18, 17, 17, 11, 9, 18, 19, 13, 11, 9, 19, 12, 13, 11, 18, 11, 8, 9, 10, 15, 14, 12, 16, 8, 20, 9, 9, 11, 5, 4, 16, 5, 1,
        12, 8, 17, 9, 12, 8, 17, 21, 16, 14, 10, 12, 12, 9, 17, 18, 8, 14, 14, 21, 8, 10, 13, 11, 20, 12, 8, 10, 13, 9, 16, 8, 8, 10, 14, 9, 16, 8, 8, 11, 9, 11, 8, 19, 14, 15, 15, 16, 11, 2147483651,
        8, 10, 12, 14, 17, 19, 10, 13, 14, 8, 15, 9, 8, 8, 13, 8, 12, 14, 8, 9, 10, 17, 13, 16, 14, 16, 9, 8, 14, 14, 10, 16, 21, 11, 17, 15, 12, 10, 9, 12, 16, 10, 9, 15, 8, 11, 18, 13, 9, 2147483651,
        12, 11, 13, 20, 14, 14, 12, 8, 19, 18, 18, 12, 13, 17, 12, 11, 12, 13, 10, 18, 18, 13, 11, 10, 12, 18, 15, 12, 9, 18, 13, 12, 15, 14, 18, 14, 11, 11, 14, 10, 18, 12, 15, 10, 11, 10, 14, 18, 20, 5,
        11, 12, 11, 8, 16, 9, 16, 11, 20, 11, 12, 9, 17, 18, 16, 11, 10, 9, 10, 16, 10, 10, 11, 12, 11, 11, 8, 19, 9, 21, 8, 12, 17, 11, 18, 20, 9, 8, 10, 9, 11, 10, 11, 13, 10, 11, 10, 10, 19, 18,
        13, 17, 8, 12, 14, 9, 10, 11, 15, 17, 12, 8, 13, 10, 18, 15, 8, 10, 18, 11, 13, 15, 8, 10, 9, 9, 11, 8, 9, 13, 8, 16, 15, 14, 17, 14, 12, 11, 12, 13, 11, 20, 11, 10, 18, 18, 16, 11, 10, 11,
        13, 18, 9, 11, 18, 15, 15, 18, 10, 9, 15, 12, 11, 12, 8, 8, 17, 14, 19, 12, 10, 15, 9, 21, 18, 8, 11, 10, 16, 15, 8, 11, 15, 12, 14, 14, 10, 18, 10, 9, 9, 10, 15, 18, 8, 15, 21, 12, 13, 11
      }
    },
    {
      type = "objectgroup",
      name = "objects",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 19,
          name = "spawn",
          type = "marker",
          shape = "point",
          x = 465.667,
          y = 479.667,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "campfire",
          type = "placeable",
          shape = "rectangle",
          x = 419.667,
          y = 442,
          width = 16,
          height = 32,
          rotation = 0,
          gid = 571,
          visible = true,
          properties = {}
        },
        {
          id = 88,
          name = "",
          type = "",
          shape = "rectangle",
          x = 344.333,
          y = 424,
          width = 16,
          height = 32,
          rotation = 0,
          gid = 602,
          visible = true,
          properties = {}
        },
        {
          id = 89,
          name = "",
          type = "",
          shape = "rectangle",
          x = 443,
          y = 446,
          width = 16,
          height = 32,
          rotation = 0,
          gid = 603,
          visible = true,
          properties = {}
        },
        {
          id = 90,
          name = "",
          type = "",
          shape = "rectangle",
          x = 395.667,
          y = 450,
          width = 16,
          height = 32,
          rotation = 0,
          gid = 607,
          visible = true,
          properties = {}
        },
        {
          id = 93,
          name = "",
          type = "",
          shape = "rectangle",
          x = 401.333,
          y = 428,
          width = 16,
          height = 32,
          rotation = 0,
          gid = 604,
          visible = true,
          properties = {}
        },
        {
          id = 94,
          name = "",
          type = "",
          shape = "rectangle",
          x = 429,
          y = 426,
          width = 16,
          height = 32,
          rotation = 0,
          gid = 2147484251,
          visible = true,
          properties = {}
        },
        {
          id = 95,
          name = "",
          type = "",
          shape = "rectangle",
          x = 477.333,
          y = 432.667,
          width = 16,
          height = 32,
          rotation = 0,
          gid = 571,
          visible = true,
          properties = {}
        },
        {
          id = 96,
          name = "",
          type = "",
          shape = "rectangle",
          x = 372.667,
          y = 469.667,
          width = 16,
          height = 32,
          rotation = 0,
          gid = 571,
          visible = true,
          properties = {}
        },
        {
          id = 97,
          name = "",
          type = "",
          shape = "rectangle",
          x = 410.333,
          y = 501,
          width = 16,
          height = 32,
          rotation = 0,
          gid = 571,
          visible = true,
          properties = {}
        },
        {
          id = 98,
          name = "",
          type = "",
          shape = "rectangle",
          x = 424.333,
          y = 465.667,
          width = 16,
          height = 32,
          rotation = 0,
          gid = 571,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
