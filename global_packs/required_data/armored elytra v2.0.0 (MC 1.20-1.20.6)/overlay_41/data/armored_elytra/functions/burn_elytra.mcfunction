tag @s add armored_elytra.subject
data modify storage armored_elytra:storage item set from entity @s Item
function armored_elytra:separate_enchantments/start
execute as @e[type=minecraft:item,tag=armored_elytra.separated] run function armored_elytra:copy_burning_elytra_tags
kill @s