--[[

	Minecart
	========

	Copyright (C) 2019-2021 Joachim Stolberg

	MIT
	See license.txt for more information

]]--

minecart = {}

-- Version for compatibility checks, see readme.md/history
minecart.version = 2.00

minecart.hopper_enabled = minetest.settings:get_bool("minecart_hopper_enabled") ~= false
minecart.teleport_enabled = minetest.settings:get_bool("minecart_teleport_enabled") == true
-- Test for MT 5.4 new string mode
minecart.CLIP = minetest.features.use_texture_alpha_string_modes and "clip" or true


minecart.S = minetest.get_translator("minecart")
local MP = minetest.get_modpath("minecart")
dofile(MP .. "/baselib.lua")
dofile(MP .. "/storage.lua")
dofile(MP .. "/rails.lua")
--dofile(MP .. "/rmv_rail.lua")
dofile(MP .. "/monitoring.lua")
dofile(MP .. "/recording.lua")
dofile(MP .. "/hopperlib.lua")
dofile(MP .. "/nodelib.lua")
dofile(MP .. "/entitylib.lua")
dofile(MP .. "/api.lua")
dofile(MP .. "/minecart.lua")
dofile(MP .. "/buffer.lua")
dofile(MP .. "/protection.lua")
--dofile(MP .. "/tool.lua")
dofile(MP .. "/signs.lua")
dofile(MP .. "/terminal.lua")

if minecart.hopper_enabled then
	dofile(MP .. "/hopper.lua")
	dofile(MP .. "/mods_support.lua")
end

dofile(MP .. "/doc.lua")
minetest.log("info", "[MOD] Minecart loaded")
