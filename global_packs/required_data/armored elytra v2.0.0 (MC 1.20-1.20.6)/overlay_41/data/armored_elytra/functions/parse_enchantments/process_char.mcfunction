execute if data storage armored_elytra:storage {char:'"'} store success score #in_id armEly.dummy unless score #in_id armEly.dummy matches 1
execute if data storage armored_elytra:storage {char:'"'} run return 0
execute if score #in_id armEly.dummy matches 1 run return run function armored_elytra:parse_enchantments/append_char_to_id with storage armored_elytra:storage
execute if data storage armored_elytra:storage {char:':'} run return 0
execute if data storage armored_elytra:storage {char:','} run return run function armored_elytra:parse_enchantments/append_enchantment
execute if data storage armored_elytra:storage {char:'}'} run return run function armored_elytra:parse_enchantments/append_enchantment
function armored_elytra:parse_enchantments/append_digit_to_lvl with storage armored_elytra:storage