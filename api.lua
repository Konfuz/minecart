--[[

	Minecart
	========

	Copyright (C) 2019-2021 Joachim Stolberg

	MIT
	See license.txt for more information
	
]]--

--
-- API functions
--

function minecart.is_cart_available(pos, param2, radius)
	local pos2 = minecart.get_nodecart_nearby(pos, param2, radius)	
	if pos2 then
		return true
	end
	-- The entity check is needed for a cart with driver
	local entity = minecart.get_entitycart_nearby(pos, param2, radius)
	if entity then
		return true
	end
end	

function minecart.punch_cart(pos, param2, radius, punch_dir)
	local pos2, node = minecart.get_nodecart_nearby(pos, param2, radius)	
	if pos2 then
		minecart.start_nodecart(pos2, node.name)
		return true
	end
	-- The entity check is needed for a cart with driver
	local entity = minecart.get_entitycart_nearby(pos, param2, radius)
	if entity then
		minecart.push_entitycart(entity, punch_dir)
		return true
	end
end