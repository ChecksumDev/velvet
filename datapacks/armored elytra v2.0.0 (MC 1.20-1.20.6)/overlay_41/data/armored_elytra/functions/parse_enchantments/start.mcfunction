# Thanks Darukshock for drafting this algorithm!
$data modify storage armored_elytra:storage levels_string set value '$(levels)'
data modify storage armored_elytra:storage enchantments set value []
data modify storage armored_elytra:storage id set value ""
data modify storage armored_elytra:storage lvl set value ""
scoreboard players set #in_id armEly.dummy 0
function armored_elytra:parse_enchantments/next_char
data remove storage armored_elytra:storage id
data remove storage armored_elytra:storage lvl
data remove storage armored_elytra:storage levels_string