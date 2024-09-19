data remove storage armored_elytra:storage char
execute store success score #success armEly.dummy run data modify storage armored_elytra:storage char set string storage armored_elytra:storage levels_string 0 1
execute unless score #success armEly.dummy matches 1 run return 0
function armored_elytra:parse_enchantments/process_char
data modify storage armored_elytra:storage levels_string set string storage armored_elytra:storage levels_string 1
function armored_elytra:parse_enchantments/next_char