-- DSM Project dtamedia:Banner
minetest.register_craft({
  output = 'node "dtamedia:banner" 4',
		recipe = {
		{'node "default:tree"', 'node "default:tree"', 'node "default:tree"'},
		{'default:tree', 'default:cobble', 'default:tree'},
		{'node "default:tree"', 'node "default:tree"', 'node "default:tree"'},
	}
})

minetest.register_node("dtamedia:banner", {
	description = "DSM Project",
	tiles = {"dtamedia_banner_top.png", "dtamedia_banner_bottom.png", "dtamedia_banner_r_side.png",
		"dtamedia_banner_l_side.png", "dtamedia_banner_back.png", "dtamedia_banner_front.png"},
	paramtype2 = "facedir",
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
	legacy_facedir_simple = true,
--	sounds = default.node_sound_wood_defaults(),
	after_place_node = function(pos, placer)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", "Dargon Social Media Project (owned by "..
				meta:get_string("owner")..")")
	end,
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,9]"..
				"list[current_name;main;0,0;8,4;]"..
				"list[current_player;main;0,5;8,4;]")
		meta:set_string("infotext", "DSM Project")
		meta:set_string("owner", "")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.env:get_meta(pos)
		if not has_locked_chest_privilege(meta, player) then
			minetest.log("action", player:get_player_name()..
					" tried to access an DSM Project belonging to "..
					meta:get_string("owner").." at "..
					minetest.pos_to_string(pos))
			return 0
		end
		return count
	end,
    allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.env:get_meta(pos)
		if not has_locked_chest_privilege(meta, player) then
			minetest.log("action", player:get_player_name()..
					" tried to access an DSM Project belonging to "..
					meta:get_string("owner").." at "..
					minetest.pos_to_string(pos))
			return 0
		end
		return stack:get_count()
	end,
    allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.env:get_meta(pos)
		if not has_locked_chest_privilege(meta, player) then
			minetest.log("action", player:get_player_name()..
					" tried to access an DSM Project belonging to "..
					meta:get_string("owner").." at "..
					minetest.pos_to_string(pos))
			return 0
		end
		return stack:get_count()
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in DSM Project chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to DSM Project at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from DSM Project at "..minetest.pos_to_string(pos))
	end,
})
-- end DSM Project dtamedia:Banner

-- DSM Project dtamedia:Tessaiga -- Iron-Crushing Fang -- The Sword of Death

minetest.register_tool("dtamedia:tessaiga", {
	description = "Tessaiga",
	inventory_image = "default_tool_woodsword.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
		},
		damage_groups = {fleshy=9001},
	groups = {armor_feet=1000, armor_heal=1000, armor_use=0, not_in_creative_inventory=1, hot=18},
	wear = 0,
	}
})

-- end DSM Project dtamedia:Tessaiga -- Iron-Crushing Fang -- The Sword of Death

-- DSM Project dtamedia:Tenseiga -- Iron-Crushing Fang -- The Sword of Life

		minetest.register_tool("dtamedia:tenseiga", {
	description = "Tenseiga",
	inventory_image = "dtamedia_tool_tenseiga.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0, [2]=0, [3]=0}, uses=0, maxlevel=3},
		},
		damage_groups = {fleshy=-100},
	groups = {armor_feet=1000, armor_heal=1000, armor_use=0, not_in_creative_inventory=1,  hot=18},
	wear = 0,
	}
})

-- end DSM Project dtamedia:Tenseiga -- Iron-Crushing Fang -- The Sword of Life
