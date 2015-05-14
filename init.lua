stairs = {}
stairs.mod = "redo"

function default.node_wool_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name="wool_coat_movement", gain=1.0}
	table.dug = table.dug or
			{name="wool_coat_movement", gain=0.25}
	table.place = table.place or
			{name="default_place_node", gain=1.0}
	return table
end

stairs.woolsound = default.node_wool_defaults() -- Xanadu only
--stairs.woolsound = default.node_sound_leaves_defaults()

-- Node will be called stairs:stair_<subname>
function stairs.register_stair(subname, recipeitem, groups, images, description, snds)
	minetest.register_node(":stairs:stair_" .. subname, {
		description = description.." Stair",
		drawtype = "nodebox",
		tile_images = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		sounds = snds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		on_place = minetest.rotate_node
	})

	minetest.register_craft({
		output = 'stairs:stair_' .. subname .. ' 6',
		recipe = {
			{recipeitem, "", ""},
			{recipeitem, recipeitem, ""},
			{recipeitem, recipeitem, recipeitem},
		},
	})
end

-- Node will be called stairs:slab_<subname>
function stairs.register_slab(subname, recipeitem, groups, images, description, snds)
	minetest.register_node(":stairs:slab_" .. subname, {
		description = description.." Slab",
		drawtype = "nodebox",
		tile_images = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		sounds = snds,
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
		on_place = minetest.rotate_node
	})

	minetest.register_craft({
		output = 'stairs:slab_' .. subname .. ' 6',
		recipe = {
			{recipeitem, recipeitem, recipeitem},
		},
	})
end

-- Node will be called stairs:corner_<subname>
function stairs.register_corner(subname, recipeitem, groups, images, description, snds)
	minetest.register_node(":stairs:corner_" .. subname, {
		description = description.." Corner",
		drawtype = "nodebox",
		tile_images = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		sounds = snds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0, 0.5, 0.5},
			},
		},
		on_place = minetest.rotate_node
	})

	minetest.register_craft({
		output = 'stairs:corner_' .. subname .. ' 4',
		recipe = {
			{"", "", ""},
			{"", recipeitem, ""},
			{recipeitem, recipeitem, recipeitem},
		},
	})
end

-- Node will be called stairs:invcorner_<subname>
function stairs.register_invcorner(subname, recipeitem, groups, images, description, snds)
	minetest.register_node(":stairs:invcorner_" .. subname, {
		description = description.." Inverted Corner",
		drawtype = "nodebox",
		tile_images = images,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = groups,
		sounds = snds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
				{-0.5, 0, -0.5, 0, 0.5, 0},
			},
		},
		on_place = minetest.rotate_node
	})

	minetest.register_craft({
		output = 'stairs:invcorner_' .. subname .. ' 8',
		recipe = {
			{recipeitem, recipeitem, ""},
			{recipeitem, recipeitem, recipeitem},
			{recipeitem, recipeitem, recipeitem},
		},
	})
end

-- Nodes will be called stairs:{stair,slab,corner}_<subname>
function stairs.register_stair_and_slab(subname, recipeitem, groups, images, desc, snds)
	stairs.register_stair(subname, recipeitem, groups, images, desc, snds)
	stairs.register_slab(subname, recipeitem, groups, images, desc, snds)
	stairs.register_corner(subname, recipeitem, groups, images, desc, snds)
	stairs.register_invcorner(subname, recipeitem, groups, images, desc, snds)
end

--= Default Minetest

stairs.register_stair_and_slab("wood", "default:wood",
		{choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"default_wood.png"},
		"Wooden", 
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("cobble", "default:cobble",
		{cracky=3,stone=2},
		{"default_cobble.png"},
		"Cobble",
		default.node_sound_stone_defaults())
		
stairs.register_stair_and_slab("desert_cobble", "default:desert_cobble",
		{cracky=3, stone=2, not_in_craft_guide=1},
		{"default_desert_cobble.png"},
		"Desert Cobble", 
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("cloud", "default:cloud",
		{not_in_craft_guide=1},
		{"default_cloud.png"},
		"Cloud",
		default.node_sound_defaults())

stairs.register_stair_and_slab("coal", "default:coalblock",
		{cracky=3, not_in_craft_guide=1},
		{"default_coal_block.png"},
		"Coal", 
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("steel", "default:steelblock",
		{cracky=1,level=2, not_in_craft_guide=1},
		{"default_steel_block.png"},
		"Steel", 
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("copper", "default:copperblock",
		{cracky=1,level=2, not_in_craft_guide=1},
		{"default_copper_block.png"},
		"Copper",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("bronze", "default:bronzeblock",
		{cracky=1,level=2, not_in_craft_guide=1},
		{"default_bronze_block.png"},
		"Bronze",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("mese", "default:mese",
		{cracky=1,level=2, not_in_craft_guide=1},
		{"default_mese_block.png"},
		"Mese", 
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("gold", "default:goldblock",
		{cracky=1, not_in_craft_guide=1},
		{"default_gold_block.png"},
		"Gold",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("diamond", "default:diamondblock",
		{cracky=1,level=3, not_in_craft_guide=1},
		{"default_diamond_block.png"},
		"Diamond",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("stone", "default:stone",
		{cracky=3,stone=1, not_in_craft_guide=1},
		{"default_stone.png"},
		"Stone", 
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("desert_stone", "default:desert_stone",
		{cracky=3,stone=1, not_in_craft_guide=1},
		{"default_desert_stone.png"},
		"Desert Stone", 
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("mossycobble", "default:mossycobble",
		{cracky=3, not_in_craft_guide=1},
		{"default_mossycobble.png"},
		"Mossy Cobble", 
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("brick", "default:brick",
		{cracky=3, not_in_craft_guide=1},
		{"default_brick.png"},
		"Brick", 
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("sandstone", "default:sandstone",
		{crumbly=2,cracky=3, not_in_craft_guide=1},
		{"default_sandstone.png"},
		"Sandstone",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("glass", "default:glass",
		{cracky=3,oddly_breakable_by_hand=3, not_in_craft_guide=1},
		{"default_glass.png"},
		"Glass", 
		default.node_sound_glass_defaults())

stairs.register_stair_and_slab("obsidianglass", "default:obsidian_glass",
		{cracky=2,level=3, not_in_craft_guide=1},
		{"default_obsidian_glass.png"},
		"Obsidian Glass",
		default.node_sound_glass_defaults())

stairs.register_stair_and_slab("sandstonebrick", "default:sandstonebrick",
		{cracky=2, not_in_craft_guide=1},
		{"default_sandstone_brick.png"},
		"Sandstone Brick", 
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("obsidian", "default:obsidian",
		{cracky=1,level=2, not_in_craft_guide=1},
		{"default_obsidian.png"},
		"Obsidian",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("junglewood", "default:junglewood",
		{choppy=2,oddly_breakable_by_hand=2,flammable=3, not_in_craft_guide=1},
		{"default_junglewood.png"},
		"Jungle Wood", 
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("pine_wood", "default:pinewood",
	{choppy=2,oddly_breakable_by_hand=1,flammable=3, not_in_craft_guide=1},
	{"default_pinewood.png"},
	"Pine Wood",
	default.node_sound_wood_defaults())

stairs.register_stair_and_slab("stonebrick", "default:stonebrick",
		{cracky=2,stone=1, not_in_craft_guide=1},
		{"default_stone_brick.png"},
		"Stone Brick", 
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("obsidian_brick", "default:obsidianbrick",
		{cracky=1,level=3, not_in_craft_guide=1},
		{"default_obsidian_brick.png"},
		"Obsidian Brick",
		default.node_sound_stone_defaults())

--= Mobs Mod

if minetest.get_modpath("mobs") and mobs.mod and mobs.mod == "redo" then

stairs.register_stair_and_slab("cheeseblock", "mobs:cheeseblock",
		{crumbly=3, not_in_craft_guide=1},
		{"mobs_cheeseblock.png"},
		"Cheese Block",
		default.node_sound_dirt_defaults())
		
stairs.register_stair_and_slab("honey_block", "mobs:honey_block",
		{snappy=3, flammable=2, not_in_craft_guide=1},
		{"mobs_honey_block.png"},
		"Honey Block",
		default.node_sound_dirt_defaults())

end

--= Homedecor Mod

if minetest.get_modpath("homedecor") then

stairs.register_stair_and_slab("shingles_asphalt", "homedecor:shingles_asphalt",
		{snappy=3},
		{"homedecor_shingles_asphalt.png"},
		"Asphalt Shingle",
		default.node_sound_leaves_defaults())

stairs.register_stair_and_slab("shingles_terracotta", "homedecor:roof_tile_terracotta",
		{snappy=3},
		{"homedecor_shingles_terracotta.png"},
		"Terracotta Shingle",
		default.node_sound_leaves_defaults())

stairs.register_stair_and_slab("shingles_wood", "homedecor:shingles_wood",
		{snappy=3},
		{"homedecor_shingles_wood.png"},
		"Wooden Shingle",
		default.node_sound_leaves_defaults())

end

--= Bakedclay Mod

if minetest.get_modpath("bakedclay") then

stairs.register_stair_and_slab("stained_wood_brown", "bakedclay:stained_wood_brown",
		{choppy=2,oddly_breakable_by_hand=2,flammable=3, not_in_craft_guide=1},
		{"stained_wood_brown.png"},
		"Brown Wooden", 
		default.node_sound_wood_defaults())
		
stairs.register_stair_and_slab("stained_wood_white", "bakedclay:stained_wood_white",
		{choppy=2,oddly_breakable_by_hand=2,flammable=3, not_in_craft_guide=1},
		{"stained_wood_white.png"},
		"White Wooden", 
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("stained_wood_pink", "bakedclay:stained_wood_pink",
		{choppy=2,oddly_breakable_by_hand=2,flammable=3, not_in_craft_guide=1},
		{"stained_wood_pink.png"},
		"Pink Wooden", 
		default.node_sound_wood_defaults())
-- Xanado Only
stairs.register_stair_and_slab("stone1", "bakedclay:stone1",
		{cracky=3,not_in_craft_guide=1}, {"stone1.png"}, "Decorative Stone 1", default.node_sound_stone_defaults())
stairs.register_stair_and_slab("stone2", "bakedclay:stone2",
		{cracky=3,not_in_craft_guide=1}, {"stone2.png"}, "Decorative Stone 2", default.node_sound_stone_defaults())
stairs.register_stair_and_slab("stone3", "bakedclay:stone3",
		{cracky=3,not_in_craft_guide=1}, {"stone3.png"}, "Decorative Stone 3", default.node_sound_stone_defaults())
stairs.register_stair_and_slab("stone4", "bakedclay:stone4",
		{cracky=3,not_in_craft_guide=1}, {"stone4.png"}, "Decorative Stone 4", default.node_sound_stone_defaults())
stairs.register_stair_and_slab("stone5", "bakedclay:stone5",
		{cracky=3,not_in_craft_guide=1}, {"stone5.png"}, "Decorative Stone 5", default.node_sound_stone_defaults())
stairs.register_stair_and_slab("stone6", "bakedclay:stone6",
		{cracky=3,not_in_craft_guide=1}, {"stone6.png"}, "Decorative Stone 6", default.node_sound_stone_defaults())

stairs.register_slab("desert_cobble1", "bakedclay:desert_cobble1",
		{cracky=3,not_in_craft_guide=1}, {"desert_cobble1.png"}, "Decorative desert cobble 1", default.node_sound_stone_defaults())
stairs.register_slab("desert_cobble5", "bakedclay:desert_cobble5",
		{cracky=3,not_in_craft_guide=1}, {"desert_cobble5.png"}, "Decorative desert cobble 5", default.node_sound_stone_defaults())
stairs.register_slab("desert_stone1", "bakedclay:desert_stone1",
		{cracky=3,not_in_craft_guide=1}, {"desert_stone1.png"}, "Decorative desert stone 1", default.node_sound_stone_defaults())
stairs.register_slab("desert_stone3", "bakedclay:desert_stone3",
		{cracky=3,not_in_craft_guide=1}, {"desert_stone3.png"}, "Decorative desert stone 3", default.node_sound_stone_defaults())
stairs.register_slab("desert_stone4", "bakedclay:desert_stone4",
		{cracky=3,not_in_craft_guide=1}, {"desert_stone4.png"}, "Decorative desert stone 4", default.node_sound_stone_defaults())
stairs.register_slab("desert_stone5", "bakedclay:desert_stone5",
		{cracky=3,not_in_craft_guide=1}, {"desert_stone5.png"}, "Decorative desert stone 5", default.node_sound_stone_defaults())
stairs.register_slab("red1", "bakedclay:red1",
		{cracky=3,not_in_craft_guide=1}, {"baked_clay_red1.png"}, "Decorative baked red clay 1", default.node_sound_stone_defaults())
stairs.register_slab("bred2", "bakedclay:red2",
		{cracky=3,not_in_craft_guide=1}, {"baked_clay_red2.png"}, "Decorative baked red clay 2", default.node_sound_stone_defaults())


stairs.register_stair_and_slab("bakedclay_white", "bakedclay:white",
		{cracky=3, not_in_craft_guide=1},
		{"baked_clay_white.png"},
		"Baked Clay White",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("bakedclay_grey", "bakedclay:grey",
		{cracky=3, not_in_craft_guide=1},
		{"baked_clay_grey.png"},
		"Baked Clay Grey",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("bakedclay_black", "bakedclay:black",
		{cracky=3, not_in_craft_guide=1},
		{"baked_clay_black.png"},
		"Baked Clay Black",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("bakedclay_red", "bakedclay:red",
		{cracky=3, not_in_craft_guide=1},
		{"baked_clay_red.png"},
		"Baked Clay Red",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("bakedclay_yellow", "bakedclay:yellow",
		{cracky=3, not_in_craft_guide=1},
		{"baked_clay_yellow.png"},
		"Baked Clay Yellow",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("bakedclay_green", "bakedclay:green",
		{cracky=3, not_in_craft_guide=1},
		{"baked_clay_green.png"},
		"Baked Clay Green",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("bakedclay_cyan", "bakedclay:cyan",
		{cracky=3, not_in_craft_guide=1},
		{"baked_clay_cyan.png"},
		"Baked Clay Cyan",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("bakedclay_blue", "bakedclay:blue",
		{cracky=3, not_in_craft_guide=1},
		{"baked_clay_blue.png"},
		"Baked Clay Blue",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("bakedclay_magenta", "bakedclay:magenta",
		{cracky=3, not_in_craft_guide=1},
		{"baked_clay_magenta.png"},
		"Baked Clay Magenta",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("bakedclay_orange", "bakedclay:orange",
		{cracky=3, not_in_craft_guide=1},
		{"baked_clay_orange.png"},
		"Baked Clay Orange",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("bakedclay_violet", "bakedclay:violet",
		{cracky=3, not_in_craft_guide=1},
		{"baked_clay_violet.png"},
		"Baked Clay Violet",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("bakedclay_brown", "bakedclay:brown",
		{cracky=3, not_in_craft_guide=1},
		{"baked_clay_brown.png"},
		"Baked Clay Brown",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("bakedclay_pink", "bakedclay:pink",
		{cracky=3, not_in_craft_guide=1},
		{"baked_clay_pink.png"},
		"Baked Clay Pink",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("bakedclay_dark_grey", "bakedclay:dark_grey",
		{cracky=3, not_in_craft_guide=1},
		{"baked_clay_dark_grey.png"},
		"Baked Clay Dark Grey",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("bakedclay_dark_green", "bakedclay:dark_green",
		{cracky=3, not_in_craft_guide=1},
		{"baked_clay_dark_green.png"},
		"Baked Clay Dark Green",
		default.node_sound_stone_defaults())

end

--= Castle Mod

if minetest.get_modpath("castle") then

stairs.register_stair_and_slab("pavement", "castle:pavement",
		{cracky=2, not_in_craft_guide=1},
		{"castle_pavement_brick.png"},
		"Paving",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("dungeon_stone", "castle:dungeon_stone",
		{cracky=2, not_in_craft_guide=1},
		{"castle_dungeon_stone.png"},
		"Dungeon",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("stonewall", "castle:stonewall",
		{cracky=3, not_in_craft_guide=1},
		{"castle_stonewall.png"},
		"Castle Wall",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("straw", "castle:straw",
		{choppy=3, flammable=1, oddly_breakable_by_hand=3, not_in_craft_guide=1},
		{"castle_straw.png"},
		"Straw",
		default.node_sound_leaves_defaults())

end

--= Ethereal Mod

if minetest.get_modpath("ethereal") then

stairs.register_stair_and_slab("bamboo_floor", "ethereal:bamboo_floor",
	{snappy = 3, choppy = 3 , flammable=2, not_in_craft_guide=1},
	{"bamboo_floor.png"},
	"Bamboo",
	default.node_sound_wood_defaults())

stairs.register_stair_and_slab("crystal_block", "ethereal:crystal_block",
	{cracky=1, level=2, not_in_craft_guide=1},
	{"crystal_block.png"},
	"Crystal Block",
	default.node_sound_glass_defaults())

stairs.register_stair_and_slab("icebrick", "ethereal:icebrick",
	{crumbly=3, melts = 1, not_in_craft_guide=1},
	{"brick_ice.png"},
	"Ice Brick",
	default.node_sound_glass_defaults())
		
stairs.register_stair_and_slab("snowbrick", "ethereal:snowbrick",
	{crumbly=3, melts = 1, not_in_craft_guide=1},
	{"brick_snow.png"},
	"Snow Brick",
	default.node_sound_dirt_defaults({
		footstep = {name="default_snow_footstep", gain=0.25},
		dug = {name="default_snow_footstep", gain=0.75},
	}))

stairs.register_stair_and_slab("dry_dirt", "ethereal:dry_dirt",
		{crumbly=3, not_in_craft_guide=1},
		{"ethereal_dry_dirt.png"},
		"Dry Dirt",
		default.node_sound_dirt_defaults())

stairs.register_stair_and_slab("mushroom_trunk", "ethereal:mushroom_trunk",
		{choppy=2,oddly_breakable_by_hand=1,flammable=2, not_in_craft_guide=1},
		{"mushroom_trunk.png"},
		"Mushroom Trunk",
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("mushroom", "ethereal:mushroom",
		{choppy=2,oddly_breakable_by_hand=1,flammable=2, not_in_craft_guide=1},
		{"mushroom_block.png"},
		"Mushroom Top",
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("frost_wood", "ethereal:frost_wood",
		{choppy=2,oddly_breakable_by_hand=1,put_out_fire=1, not_in_craft_guide=1},
		{"frost_wood.png"},
		"Frost Wood",
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("yellow_wood", "ethereal:yellow_wood",
		{choppy=2,oddly_breakable_by_hand=1,put_out_fire=1, not_in_craft_guide=1},
		{"yellow_wood.png"},
		"Healing Tree Wood",
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("palm_wood", "ethereal:palm_wood",
		{choppy=2,oddly_breakable_by_hand=1,flammable=3, not_in_craft_guide=1},
		{"moretrees_palm_wood.png"},
		"Palm Wood",
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("banana_wood", "ethereal:banana_wood",
		{choppy=2,oddly_breakable_by_hand=1,flammable=3, not_in_craft_guide=1},
		{"banana_wood.png"},
		"Banana Wood",
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("willow_wood", "ethereal:willow_wood",
		{choppy=2,oddly_breakable_by_hand=1,flammable=3, not_in_craft_guide=1},
		{"willow_wood.png"},
		"Willow Wood",
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("redwood_wood", "ethereal:redwood_wood",
		{choppy=2,oddly_breakable_by_hand=1,flammable=3, not_in_craft_guide=1},
		{"redwood_wood.png"},
		"Redwood Wood",
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("acacia_wood", "ethereal:acacia_wood",
		{choppy=2,oddly_breakable_by_hand=1,flammable=3, not_in_craft_guide=1},
		{"moretrees_acacia_wood.png"},
		"Acacia Wood",
		default.node_sound_wood_defaults())

end

--= Wool Mod

if minetest.get_modpath("wool") then

stairs.register_stair_and_slab("wool_white", "wool:white",
		{snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3, not_in_craft_guide=1},
		{"wool_white.png"},
		"White Wool",
		stairs.woolsound)

stairs.register_stair_and_slab("wool_grey", "wool:grey",
		{snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3, not_in_craft_guide=1},
		{"wool_grey.png"},
		"Grey Wool",
		stairs.woolsound)

stairs.register_stair_and_slab("wool_black", "wool:black",
		{snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3, not_in_craft_guide=1},
		{"wool_black.png"},
		"Black Wool",
		stairs.woolsound)

stairs.register_stair_and_slab("wool_red", "wool:red",
		{snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3, not_in_craft_guide=1},
		{"wool_red.png"},
		"Red Wool",
		stairs.woolsound)

stairs.register_stair_and_slab("wool_yellow", "wool:yellow",
		{snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3, not_in_craft_guide=1},
		{"wool_yellow.png"},
		"Yellow Wool",
		stairs.woolsound)

stairs.register_stair_and_slab("wool_green", "wool:green",
		{snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3, not_in_craft_guide=1},
		{"wool_green.png"},
		"Green Wool", 
		stairs.woolsound)

stairs.register_stair_and_slab("wool_cyan", "wool:cyan",
		{snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3, not_in_craft_guide=1},
		{"wool_cyan.png"},
		"Cyan Wool", 
		stairs.woolsound)

stairs.register_stair_and_slab("wool_blue", "wool:blue",
		{snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3, not_in_craft_guide=1},
		{"wool_blue.png"},
		"Blue Wool", 
		stairs.woolsound)

stairs.register_stair_and_slab("wool_magenta", "wool:magenta",
		{snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3, not_in_craft_guide=1},
		{"wool_magenta.png"},
		"Magenta Wool", 
		stairs.woolsound)

stairs.register_stair_and_slab("wool_orange", "wool:orange",
		{snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3, not_in_craft_guide=1},
		{"wool_orange.png"},
		"Orange Wool",
		default.node_sound_defaults())

stairs.register_stair_and_slab("wool_violet", "wool:violet",
		{snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3, not_in_craft_guide=1},
		{"wool_violet.png"},
		"Violet Wool",
		stairs.woolsound)

stairs.register_stair_and_slab("wool_brown", "wool:brown",
		{snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3, not_in_craft_guide=1},
		{"wool_brown.png"},
		"Brown Wool",
		stairs.woolsound)

stairs.register_stair_and_slab("wool_pink", "wool:pink",
		{snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3, not_in_craft_guide=1},
		{"wool_pink.png"},
		"Pink Wool",
		stairs.woolsound)

stairs.register_stair_and_slab("wool_dark_grey", "wool:dark_grey",
		{snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3, not_in_craft_guide=1},
		{"wool_dark_grey.png"},
		"Dark Grey Wool", 
		stairs.woolsound)

stairs.register_stair_and_slab("wool_dark_green", "wool:dark_green",
		{snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3, not_in_craft_guide=1},
		{"wool_dark_green.png"},
		"Dark Green Wool", 
		stairs.woolsound)

end
