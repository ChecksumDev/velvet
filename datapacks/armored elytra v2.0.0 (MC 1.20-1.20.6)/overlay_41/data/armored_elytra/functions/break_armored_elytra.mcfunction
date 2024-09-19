advancement revoke @s only armored_elytra:break_armored_elytra
tag @s add armored_elytra.subject
data modify storage armored_elytra:storage item set from entity @s Inventory[{Slot:102b}]
data modify storage armored_elytra:storage item.components.minecraft:damage set value 431
function armored_elytra:separate_enchantments/start
execute as @e[type=minecraft:item,tag=armored_elytra.separated] run function armored_elytra:set_owner
item replace entity @s armor.chest with minecraft:air
tag @s remove armored_elytra.subject