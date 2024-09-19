summon minecraft:item ~ ~ ~ {Tags:["armored_elytra.separated","armored_elytra.elytra"],Item:{id:"minecraft:elytra"}}
summon minecraft:item ~ ~ ~ {Tags:["armored_elytra.separated","armored_elytra.chestplate"],Item:{id:"minecraft:chainmail_chestplate"}}
data modify storage armored_elytra:storage chestplate set from storage armored_elytra:storage item.components.minecraft:bundle_contents[0]
data modify storage armored_elytra:storage elytra set from storage armored_elytra:storage item.components.minecraft:bundle_contents[1]
data modify storage armored_elytra:storage enchantments set value []
function armored_elytra:parse_enchantments/start with storage armored_elytra:storage elytra.components.minecraft:enchantments
data modify storage armored_elytra:storage elytraEnch set from storage armored_elytra:storage enchantments
data modify storage armored_elytra:storage enchantments set value []
function armored_elytra:parse_enchantments/start with storage armored_elytra:storage chestplate.components.minecraft:enchantments
data modify storage armored_elytra:storage chestplateEnch set from storage armored_elytra:storage enchantments
data modify storage armored_elytra:storage enchantments set value []
function armored_elytra:parse_enchantments/start with storage armored_elytra:storage item.components.minecraft:enchantments
execute store result score #elytraTotal armEly.dummy run data get storage armored_elytra:storage elytraEnch
execute store result score #chestplateTotal armEly.dummy run data get storage armored_elytra:storage chestplateEnch
execute unless score #elytraTotal armEly.dummy matches 0 unless score #chestplateTotal armEly.dummy matches 0 run function armored_elytra:separate_enchantments/start_to_iterate
execute store result score #remaining armEly.dummy run data get storage armored_elytra:storage enchantments
execute unless score #remaining armEly.dummy matches 0 run function armored_elytra:separate_enchantments/shift_enchantment
data modify storage armored_elytra:storage enchantments set from storage armored_elytra:storage elytraFinalEnch
function armored_elytra:construct_levels_compound/start
data modify storage armored_elytra:storage elytra.components.minecraft:enchantments.levels set from storage armored_elytra:storage levels
data modify storage armored_elytra:storage enchantments set from storage armored_elytra:storage chestplateFinalEnch
function armored_elytra:construct_levels_compound/start
data modify storage armored_elytra:storage chestplate.components.minecraft:enchantments.levels set from storage armored_elytra:storage levels
execute store success score #success armEly.dummy if data storage armored_elytra:storage item.components.minecraft:damage
execute if score #success armEly.dummy matches 1 run data modify storage armored_elytra:storage elytra.components.minecraft:damage set from storage armored_elytra:storage item.components.minecraft:damage
execute unless score #success armEly.dummy matches 1 run data remove storage armored_elytra:storage elytra.components.minecraft:damage
execute store success score #success armEly.dummy if data storage armored_elytra:storage item.components.minecraft:custom_name
execute if score #success armEly.dummy matches 1 run data modify storage armored_elytra:storage elytra.components.minecraft:custom_name set from storage armored_elytra:storage item.components.minecraft:custom_name
execute unless score #success armEly.dummy matches 1 run data remove storage armored_elytra:storage elytra.components.minecraft:custom_name
data modify entity @e[type=minecraft:item,tag=armored_elytra.elytra,distance=..0.01,limit=1] Item set from storage armored_elytra:storage elytra
data modify entity @e[type=minecraft:item,tag=armored_elytra.chestplate,distance=..0.01,limit=1] Item set from storage armored_elytra:storage chestplate
data remove storage armored_elytra:storage elytraFinalEnch
data remove storage armored_elytra:storage chestplateFinalEnch
data remove storage armored_elytra:storage elytra
data remove storage armored_elytra:storage chestplate
tag @e[type=minecraft:item,distance=..0.01] remove armored_elytra.elytra
tag @e[type=minecraft:item,distance=..0.01] remove armored_elytra.chestplate