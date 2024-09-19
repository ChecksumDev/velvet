data modify storage armored_elytra:storage finalEnch set value []
execute store result score #chestplateRemaining armEly.dummy run data get storage armored_elytra:storage chestplateEnch
execute store result score #elytraTotal armEly.dummy run data get storage armored_elytra:storage elytraEnch
execute unless score #chestplateRemaining armEly.dummy matches 0 run function armored_elytra:merge_enchantments/shift_chestplate_enchantment
execute unless score #elytraTotal armEly.dummy matches 0 run function armored_elytra:merge_enchantments/add_enchantment_from_elytra
data modify storage armored_elytra:storage enchantments set from storage armored_elytra:storage finalEnch
function armored_elytra:construct_levels_compound/start
data modify entity @s Item.components.minecraft:enchantments.levels set from storage armored_elytra:storage levels