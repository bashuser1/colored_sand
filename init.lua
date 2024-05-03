-- used for pretty node titles
function capitalizeWords(input)
    return (input:gsub("(%w)(%w*)", function(firstLetter, rest)
        return firstLetter:upper()..rest:lower()
    end))
end
----

default_colors = {'white', 'grey', 'dark_grey', 'black', 'blue', 'cyan', 'green', 'dark_green', 'yellow', 'orange', 'brown', 'red', 'pink', 'magenta', 'violet'}

for i, color in ipairs(default_colors) do
	minetest.register_node("colored_sand:" .. color, {
		description = capitalizeWords(string.gsub(color, "_", " ")) .. " Sand",
		tiles = { "default_sand_" .. color .. ".png"},
		groups = {crumbly = 3, falling_node = 1, sand = 1},
		sounds = default.node_sound_sand_defaults(),
	})
	
	minetest.register_craft({
		type = "shapeless",
		output = "colored_sand:" .. color,
		recipe = {"default:sand", "dye:" .. color}
	})
end
