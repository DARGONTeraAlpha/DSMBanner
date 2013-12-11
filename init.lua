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
	groups = {cracky=2, not_in_creative_inventory=1},
	legacy_facedir_simple = true,
	
	})
-- end DSM Project dtamedia:Banner
