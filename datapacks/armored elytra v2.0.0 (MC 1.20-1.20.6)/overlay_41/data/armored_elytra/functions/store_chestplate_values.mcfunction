execute store result score #chestplateValue armEly.dummy run data get entity @s Item.components.minecraft:repair_cost
data modify storage armored_elytra:storage enchantments set value []
function armored_elytra:parse_enchantments/start with entity @s Item.components.minecraft:enchantments
data modify storage armored_elytra:storage chestplateEnch set from storage armored_elytra:storage enchantments