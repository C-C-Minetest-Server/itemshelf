-- Default nodes for Itemshelf mod
-- By Zorman2000

local default_shelf = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5}, -- NodeBox1
		{-0.5, -0.5, -0.5, -0.4375, 0.5, 0.4375}, -- NodeBox2
		{-0.4375, -0.5, -0.5, 0.4375, -0.4375, 0.4375}, -- NodeBox3
		{0.4375, -0.5, -0.5, 0.5, 0.5, 0.4375}, -- NodeBox4
		{-0.4375, 0.4375, -0.5, 0.4375, 0.5, 0.4375}, -- NodeBox5
		{-0.4375, -0.0625, -0.5, 0.4375, 0.0625, 0.4375}, -- NodeBox6
	}
}

local default_half_shelf = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5}, -- NodeBox1
		{-0.5, -0.5, -0.125, -0.4375, 0.5, 0.5}, -- NodeBox2
		{0.4375, -0.5, -0.125, 0.5, 0.5, 0.5}, -- NodeBox3
		{-0.5, -0.0625, -0.125, 0.5, 0.0625, 0.5}, -- NodeBox4
		{-0.5, 0.4375, -0.125, 0.5, 0.5, 0.5}, -- NodeBox5
		{-0.5, -0.5, -0.125, 0.5, -0.4375, 0.5}, -- NodeBox6
	}
}

local default_half_shelf_open = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, -0.125, -0.4375, 0.5, 0.5}, -- NodeBox2
		{0.4375, -0.5, -0.125, 0.5, 0.5, 0.5}, -- NodeBox3
		{-0.5, -0.0625, -0.125, 0.5, 0.0625, 0.5}, -- NodeBox4
		{-0.5, 0.4375, -0.125, 0.5, 0.5, 0.5}, -- NodeBox5
		{-0.5, -0.5, -0.125, 0.5, -0.4375, 0.5}, -- NodeBox6
	}
}

function itemshelf.register_shelves(item_name, material_name, display_prefix, texture, groups, sounds)
	-- Backwards compatibility to keep existing node names same
	if material_name ~= "" then material_name = material_name.."_" end

	itemshelf.register_shelf(material_name.."small_shelf", {
		description = display_prefix.." Shelf (4)",
		textures = {
			texture,
			texture,
			texture,
			texture,
			texture,
			texture
		},
		nodebox = default_shelf,
		capacity = 4,
		shown_items = 4,
		groups = groups,
		sounds = sounds,
	})

	minetest.register_craft({
		output = "itemshelf:"..material_name.."small_shelf",
		recipe = {
			{item_name, item_name, item_name},
			{"", "", ""},
			{item_name, item_name, item_name},
		}
	})

	itemshelf.register_shelf(material_name.."large_shelf", {
		description = display_prefix.." Shelf (6)",
		textures = {
			texture,
			texture,
			texture,
			texture,
			texture,
			texture
		},
		nodebox = default_shelf,
		capacity = 6,
		shown_items = 6,
		groups = groups,
		sounds = sounds,
	})
	
	minetest.register_craft({
		output = "itemshelf:"..material_name.."large_shelf",
		recipe = {
			{item_name, item_name, item_name},
			{item_name, "", item_name},
			{item_name, item_name, item_name},
		}
	})

	itemshelf.register_shelf(material_name.."half_depth_shelf_small", {
		description = display_prefix.." Half Shelf (4)",
		textures = {
			texture,
			texture,
			texture,
			texture,
			texture,
			texture
		},
		nodebox = default_half_shelf,
		capacity = 4,
		shown_items = 4,
		half_depth = true,
		groups = groups,
		sounds = sounds,
	})

	minetest.register_craft({
		output = "itemshelf:"..material_name.."half_depth_shelf_small",
		recipe = {
			{item_name, item_name, ""},
			{"", "", ""},
			{item_name, item_name, ""},
		}
	})

	itemshelf.register_shelf(material_name.."half_depth_shelf_large", {
		description = display_prefix.." Half Shelf (6)",
		textures = {
			texture,
			texture,
			texture,
			texture,
			texture,
			texture
		},
		nodebox = default_half_shelf,
		capacity = 6,
		shown_items = 6,
		half_depth = true,
		groups = groups,
		sounds = sounds,
	})

	minetest.register_craft({
		output = "itemshelf:"..material_name.."half_depth_shelf_large",
		recipe = {
			{item_name, item_name, ""},
			{item_name, "", ""},
			{item_name, item_name, ""},
		}
	})

	-- Half-depth open-back shelf, 4 items
	itemshelf.register_shelf(material_name.."half_depth_open_shelf", {
		description = display_prefix.." Half Open-Back Shelf (4)",
		textures = {
			texture,
			texture,
			texture,
			texture,
			texture,
			texture
		},
		nodebox = default_half_shelf_open,
		capacity = 4,
		shown_items = 4,
		half_depth = true,
		groups = groups,
		sounds = sounds,
	})

	minetest.register_craft({
		output = "itemshelf:"..material_name.."half_depth_open_shelf",
		recipe = {
			{item_name, "", item_name},
			{"", "", ""},
			{item_name, "", item_name},
		}
	})

	-- Half-depth open-back shelf, 6 items
	itemshelf.register_shelf(material_name.."half_depth_open_shelf_large", {
		description = display_prefix.." Half Open-Back Shelf (6)",
		textures = {
			texture,
			texture,
			texture,
			texture,
			texture,
			texture
		},
		nodebox = default_half_shelf_open,
		capacity = 6,
		shown_items = 6,
		half_depth = true,
		groups = groups,
		sounds = sounds,
	})

	minetest.register_craft({
		output = "itemshelf:"..material_name.."half_depth_open_shelf_large",
		recipe = {
			{item_name, "", item_name},
			{"", item_name, ""},
			{item_name, "", item_name},
		}
	})
end

for _, data in ipairs({
	-- Minetest Game defaults
	{ "stairs:slab_wood",           "",               "Apple Wood",     "default_wood.png" },
	{ "stairs:slab_pine_wood",      "pine",           "Pine Wood",      "default_pine_wood.png" },
	{ "stairs:slab_aspen_wood",     "aspen",          "Aspen Wood",     "default_aspen_wood.png" },
	{ "stairs:slab_acacia_wood",    "acacia",         "Acacia Wood",    "default_acacia_wood.png" },
	{ "stairs:slab_junglewood",     "jungle",         "Jungle Wood",    "default_junglewood.png" },

	-- Ethereal woods
	{ "stairs:slab_mushroom_trunk", "mushroom_trunk", "Mushroom Trunk", "ethereal_mushroom_trunk.png^[transformR90" },
	{ "stairs:slab_frost_wood",     "frost_wood",     "Frost Wood",     "ethereal_frost_wood.png" },
	{ "stairs:slab_yellow_wood",    "yellow_wood",    "Healing Wood",   "ethereal_yellow_wood.png" },
	{ "stairs:slab_palm_wood",      "palm_wood",      "Palm Wood",      "moretrees_palm_wood.png" },
	{ "stairs:slab_birch_wood",     "birch_wood",     "Birch Wood",     "moretrees_birch_wood.png" },
	{ "stairs:slab_banana_wood",    "banana_wood",    "Banana Wood",    "ethereal_banana_wood.png" },
	{ "stairs:slab_willow_wood",    "willow_wood",    "Willow Wood",    "ethereal_willow_wood.png" },
	{ "stairs:slab_redwood_wood",   "redwood_wood",   "Redwood",        "ethereal_redwood_wood.png" },
	{ "stairs:slab_bamboo_wood",    "bamboo_wood",    "Bamboo",         "ethereal_bamboo_floor.png^[transformR90" },
	{ "stairs:slab_sakura_wood",    "sakura_wood",    "Sakura Wood",    "ethereal_sakura_wood.png" },
	{ "stairs:slab_olive_wood",     "olive_wood",     "Olive Wood",     "ethereal_olive_wood.png" },
}) do
	local item_def = core.registered_items[data[1]]
	if item_def then
		-- Prepare groups
		local groups = item_def.groups
		groups = groups and table.copy(groups) or {}
		groups.slab = nil
		groups.not_in_creative_inventory = nil

		local sounds = item_def.sounds

		itemshelf.register_shelves(data[1], data[2], data[3], data[4], groups, sounds)
	end
end
